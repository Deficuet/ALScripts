local var_0_0 = class("IslandCore", import("..IslandDispatcher"))

var_0_0.STATE_LOAD = 1
var_0_0.STATE_INIT = 2
var_0_0.STATE_INIT_FINISH = 3
var_0_0.STATE_DISPOSE = 4

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.poolMgr = arg_1_1

	local var_1_0, var_1_1 = arg_1_0:GetViewAndController(arg_1_2, arg_1_3)

	arg_1_0.view = var_1_0
	arg_1_0.controller = var_1_1
	arg_1_0.sceneLoader = IslandSceneLoader.New()

	arg_1_0:UpdateState(var_0_0.STATE_LOAD)

	local var_1_2, var_1_3, var_1_4 = IslandDataConvertor.Island2SceneName(arg_1_2)

	arg_1_0.view:SetBgm(var_1_4)
	arg_1_0.sceneLoader:Load(var_1_2, var_1_3, {
		function(arg_2_0)
			arg_1_0:Init(arg_2_0)
		end
	})

	arg_1_0.enterTime = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetPoolMgr(arg_3_0)
	return arg_3_0.poolMgr
end

function var_0_0.UpdateState(arg_4_0, arg_4_1)
	arg_4_0.state = arg_4_1

	arg_4_0.view:OnCoreStateChanged(arg_4_1)
	arg_4_0.controller:OnCoreStateChanged(arg_4_1)
	pg.m02:sendNotification(GAME.ISLAND_CORE_STATE_CHANGED, arg_4_1)
end

function var_0_0.Init(arg_5_0, arg_5_1)
	arg_5_0:UpdateState(var_0_0.STATE_INIT)
	arg_5_0.view:SetUp()
	arg_5_0.controller:SetUp()

	if not arg_5_0.handle then
		arg_5_0.handle = UpdateBeat:CreateListener(arg_5_0.Update, arg_5_0)
	end

	UpdateBeat:AddListener(arg_5_0.handle)

	if not arg_5_0.lateUpdateluHandle then
		arg_5_0.lateUpdateluHandle = LateUpdateBeat:CreateListener(arg_5_0.LateUpdate, arg_5_0)

		LateUpdateBeat:AddListener(arg_5_0.lateUpdateluHandle)
	end

	function arg_5_0.callback()
		arg_5_1()
		arg_5_0:UpdateState(var_0_0.STATE_INIT_FINISH)
	end
end

function var_0_0.GetMapId(arg_7_0)
	return arg_7_0:GetController():GetMapID()
end

function var_0_0.IsInit(arg_8_0)
	return arg_8_0.state == var_0_0.STATE_INIT or arg_8_0.state == var_0_0.STATE_INIT_FINISH
end

function var_0_0.Update(arg_9_0)
	if not arg_9_0:IsInit() then
		return
	end

	arg_9_0.controller:Update()
	arg_9_0.view:Update()

	if arg_9_0.callback and arg_9_0.view:IsLoaded() then
		arg_9_0.callback()

		arg_9_0.callback = nil
	end
end

function var_0_0.LateUpdate(arg_10_0)
	if not arg_10_0:IsInit() then
		return
	end

	arg_10_0.controller:LateUpdate()
	arg_10_0.view:LateUpdate()
end

function var_0_0.GetView(arg_11_0)
	return arg_11_0.view
end

function var_0_0.GetController(arg_12_0)
	return arg_12_0.controller
end

function var_0_0.Link(arg_13_0, arg_13_1, ...)
	arg_13_0:GetController():NotifiyCore(arg_13_1, ...)
end

function var_0_0.Dispose(arg_14_0, arg_14_1)
	local var_14_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_14_0.enterTime

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildMapExit(arg_14_0.controller.mapId, var_14_0))
	arg_14_0:UpdateState(var_0_0.STATE_DISPOSE)

	if arg_14_0.handle then
		UpdateBeat:RemoveListener(arg_14_0.handle)
	end

	if arg_14_0.lateUpdateluHandle then
		LateUpdateBeat:RemoveListener(arg_14_0.lateUpdateluHandle)
	end

	setActive(IslandCameraMgr.instance.gameObject, false)

	if arg_14_0.view then
		arg_14_0.view:Dispose()

		arg_14_0.view = nil
	end

	if arg_14_0.controller then
		arg_14_0.controller:Dispose()

		arg_14_0.controller = nil
	end

	if arg_14_0.sceneLoader then
		arg_14_0.sceneLoader:Dispose(arg_14_1)

		arg_14_0.sceneLoader = nil
	end
end

function var_0_0.GetViewAndController(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0
	local var_15_1
	local var_15_2 = arg_15_1:GetMapId()
	local var_15_3 = pg.island_map[var_15_2]

	if var_15_2 == IslandConst.AGORA_MAP_ID then
		var_15_1 = AgoraController.New(arg_15_0, arg_15_1)

		local var_15_4 = var_15_1:GetAgora()

		var_15_0 = AgoraView.New(arg_15_0, var_15_4, arg_15_2)
	elseif var_15_3.minigame_id > 0 then
		var_15_0 = IslandSeekGameView.New(arg_15_0, arg_15_2)
		var_15_1 = IslandController.New(arg_15_0, arg_15_1)
	else
		var_15_1 = IslandController.New(arg_15_0, arg_15_1)
		var_15_0 = IslandView.New(arg_15_0, arg_15_2)
	end

	return var_15_0, var_15_1
end

return var_0_0
