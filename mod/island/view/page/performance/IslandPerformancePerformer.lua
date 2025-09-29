local var_0_0 = class("IslandPerformancePerformer", import("view.base.BaseEventLogic"))

var_0_0.START_PERFORMANCE = "IslandPerformancePerformer:START_PERFORMANCE"
var_0_0.END_PERFORMANCE = "IslandPerformancePerformer:END_PERFORMANCE"
var_0_0.TYPE_FINDPATH = 1
var_0_0.TYPE_TRANSFER = 2
var_0_0.TYPE_STORY = 3
var_0_0.TYPE_HIDE_UNIT = 4
var_0_0.TYPE_UPDATE_STORY = 5
var_0_0.TYPE_LOCK_NPC_REFRESH = 6

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	if not arg_1_0.handle then
		arg_1_0.handle = UpdateBeat:CreateListener(arg_1_0.Update, arg_1_0)
	end

	UpdateBeat:AddListener(arg_1_0.handle)
	arg_1_0:bind(IslandBaseScene.ON_SCENE_LOADED, function()
		arg_1_0:OnSceneLoaded()
	end)
end

function var_0_0.GetPlayer(arg_3_0, arg_3_1)
	if arg_3_1 == var_0_0.TYPE_FINDPATH then
		return IslandFindingPathPlayer.New(arg_3_0)
	elseif arg_3_1 == var_0_0.TYPE_TRANSFER then
		return IslandTransferPlayer.New(arg_3_0)
	elseif arg_3_1 == var_0_0.TYPE_STORY then
		return IslandPerformanceStoryPlayer.New(arg_3_0)
	elseif arg_3_1 == var_0_0.TYPE_HIDE_UNIT then
		return IslandPerformanceActiveUnitPlayer.New(arg_3_0)
	elseif arg_3_1 == var_0_0.TYPE_UPDATE_STORY then
		return IslandUpdateStoryPlayer.New(arg_3_0)
	elseif arg_3_1 == var_0_0.TYPE_LOCK_NPC_REFRESH then
		return IslandLockNpcRefreshPlayer.New(arg_3_0)
	end
end

function var_0_0.Play(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0:OnStart(arg_4_1)

	local var_4_0 = {}
	local var_4_1 = _.detect(arg_4_2, function(arg_5_0)
		return arg_5_0.type == var_0_0.TYPE_LOCK_NPC_REFRESH
	end)
	local var_4_2 = false

	for iter_4_0, iter_4_1 in ipairs(arg_4_2) do
		table.insert(var_4_0, function(arg_6_0)
			local var_6_0 = arg_4_0:GetPlayer(iter_4_1.type)

			if isa(var_6_0, IslandFindingPathPlayer) and var_4_1 then
				var_6_0:SetEndCallback(function()
					arg_4_0:ClearLockNpc(var_4_1.unitIdList, false)
				end)

				var_4_2 = true
			end

			var_6_0:Play(iter_4_1, arg_6_0)

			arg_4_0.player = var_6_0
		end)
	end

	seriesAsync(var_4_0, function()
		local var_8_0 = not var_4_2 and var_4_1

		if var_8_0 then
			arg_4_0:ClearLockNpc(var_4_1.unitIdList, true)
		end

		arg_4_0:OnEnd(var_8_0)

		arg_4_0.player = nil

		if arg_4_3 then
			arg_4_3()
		end
	end)
end

function var_0_0.ClearLockNpc(arg_9_0, arg_9_1, arg_9_2)
	if not arg_9_1 then
		return
	end

	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		arg_9_0:emit(IslandBaseScene.LINK_CORE_EVENT, IslandProxy.RELEASE_NPC_REFRESH, iter_9_1, IslandConst.UNIT_LIST_OBJ)
	end
end

function var_0_0.OnStart(arg_10_0, arg_10_1)
	arg_10_0.runing = true

	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = arg_10_1
	})
	arg_10_0:emit(IslandBaseScene.LINK_CORE_EVENT, IslandProxy.PERFORMANCE_START)
end

function var_0_0.OnEnd(arg_11_0, arg_11_1)
	arg_11_0.runing = false

	arg_11_0:emit(IslandBaseScene.LINK_CORE_EVENT, IslandProxy.PERFORMANCE_END, arg_11_1)
end

function var_0_0.OnSceneLoaded(arg_12_0)
	if not arg_12_0.player then
		return
	end

	if isa(arg_12_0.player, IslandTransferPlayer) then
		arg_12_0.player:EndAction()
	end
end

function var_0_0.Update(arg_13_0)
	if arg_13_0.player then
		arg_13_0.player:Update()
	end
end

function var_0_0.IsRunning(arg_14_0)
	return arg_14_0.runing
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0:disposeEvent()
	arg_15_0:cleanManagedTween()

	arg_15_0.player = nil

	if arg_15_0.handle then
		UpdateBeat:RemoveListener(arg_15_0.handle)
	end

	arg_15_0.handle = nil
end

return var_0_0
