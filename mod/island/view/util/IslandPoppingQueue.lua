local var_0_0 = class("IslandPoppingQueue")

var_0_0.PERFORMANCE = 1
var_0_0.DISPLAY_AWARD = 2
var_0_0.MSGBOX = 3
var_0_0.STORY = 4
var_0_0.TASK_ACCEPT_PAGE = 5

function var_0_0.CreateTask(arg_1_0, arg_1_1)
	local var_1_0 = {
		type = arg_1_0,
		args = arg_1_1 or {}
	}

	var_1_0.callback = var_1_0.args.callback

	return var_1_0
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	arg_2_0.islandScene = arg_2_1
	arg_2_0.schedule = {}
	arg_2_0.ignoringStoryList = {}
	arg_2_0.playerList = {}
end

function var_0_0.GetSceneView(arg_3_0)
	return arg_3_0.islandScene
end

function var_0_0.Enqueue(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = var_0_0.CreateTask(arg_4_1, arg_4_2)

	if not arg_4_0:IsValid(var_4_0) then
		return
	end

	table.insert(arg_4_0.schedule, var_4_0)

	if #arg_4_0.schedule == 1 then
		arg_4_0:ProcessNextOne()
	end
end

function var_0_0.IsValid(arg_5_0, arg_5_1)
	if arg_5_1.type == var_0_0.STORY and table.contains(arg_5_0.ignoringStoryList, arg_5_1.args.name) then
		arg_5_0:ExecuteStory(arg_5_1.callback, arg_5_1.args.name, arg_5_1.args.refreshNpc)

		return false
	end

	return true
end

function var_0_0.ProcessNextOne(arg_6_0)
	local var_6_0 = arg_6_0.schedule[1]

	local function var_6_1()
		if var_6_0.callback then
			var_6_0.callback()
		end

		if not arg_6_0.schedule then
			return
		end

		arg_6_0.ignoringStoryList = {}

		table.remove(arg_6_0.schedule, 1)

		if #arg_6_0.schedule > 0 then
			onNextTick(function()
				arg_6_0:ProcessNextOne()
			end)
		end
	end

	if var_6_0.type == var_0_0.PERFORMANCE then
		arg_6_0:ExecutePerformer(var_6_1, var_6_0.args.name)
	elseif var_6_0.type == var_0_0.DISPLAY_AWARD then
		arg_6_0:ExecuteAwardDisplay(var_6_1, var_6_0.args.dropData, var_6_0.args.displayType)
	elseif var_6_0.type == var_0_0.MSGBOX then
		arg_6_0:ExecuteMsgbox(var_6_1, var_6_0.args)
	elseif var_6_0.type == var_0_0.STORY then
		arg_6_0:ExecuteStory(var_6_1, var_6_0.args.name, var_6_0.args.refreshNpc)
	elseif var_6_0.type == var_0_0.TASK_ACCEPT_PAGE then
		arg_6_0:ExecuteTaskAcceptWin(var_6_1, var_6_0.args.taskId)
	else
		error("Unknown popping type: " .. tostring(var_6_0.type))
	end
end

function var_0_0.ExecuteStory(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	arg_9_0:GetSceneView():TryDisVisible()
	arg_9_0:GetSceneView():GetSubView(IslandStoryMgr):ExecuteAction("Play", arg_9_2, arg_9_3, function()
		arg_9_0:GetSceneView():TryVisible()
		arg_9_1()
	end)
end

function var_0_0.ExecuteMsgbox(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0:GetSceneView():GetSubView(IslandMsgBox):ExecuteAction("Show", arg_11_2, arg_11_1)
end

function var_0_0.ExecutePerformer(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = pg.NewStoryMgr.GetInstance():GetScript(arg_12_2)

	if not var_12_0 or #var_12_0 <= 0 then
		arg_12_1()

		return
	end

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		if iter_12_1.type == IslandPerformancePerformer.TYPE_STORY then
			table.insert(arg_12_0.ignoringStoryList, iter_12_1.name)
		end
	end

	local var_12_1 = IslandPerformancePerformer.New(arg_12_0:GetSceneView().event)

	var_12_1:Play(arg_12_2, var_12_0, function()
		var_12_1:Dispose()
		table.removebyvalue(arg_12_0.playerList, var_12_1)
		arg_12_1()
	end)
	table.insert(arg_12_0.playerList, var_12_1)
end

function var_0_0.ExecuteAwardDisplay(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	seriesAsync({
		function(arg_15_0)
			if not arg_14_2.drops or #arg_14_2.drops <= 0 then
				arg_15_0()

				return
			end

			arg_14_0:GetSceneView():emit(BaseUI.ON_ACHIEVE, arg_14_2.drops, arg_15_0)
		end,
		function(arg_16_0)
			onNextTick(arg_16_0)
		end,
		function(arg_17_0)
			if not arg_14_2.awards or #arg_14_2.awards <= 0 then
				arg_17_0()

				return
			end

			arg_14_0:GetSceneView():DisplayAward({
				type = arg_14_3,
				title = i18n("island_get_item_tip"),
				awards = arg_14_2.awards,
				callback = arg_17_0
			})
		end,
		function(arg_18_0)
			onNextTick(arg_18_0)
		end,
		function(arg_19_0)
			if not arg_14_2.exp or arg_14_2.exp <= 0 then
				arg_19_0()

				return
			end

			arg_14_0:GetSceneView():ShowExpAdd(arg_14_2.exp, arg_19_0)
		end,
		function(arg_20_0)
			onNextTick(arg_20_0)
		end,
		function(arg_21_0)
			arg_14_0:GetSceneView():DisplaySystemUnlock(arg_14_2.abilitys, arg_21_0)
		end,
		function(arg_22_0)
			onNextTick(arg_22_0)
		end,
		function(arg_23_0)
			pg.m02:sendNotification(GAME.ISLAND_UPGRADE, {
				callback = arg_23_0
			})
		end,
		function(arg_24_0)
			onNextTick(arg_24_0)
		end,
		function(arg_25_0)
			if not arg_14_2.overflowAwards or #arg_14_2.overflowAwards == 0 then
				arg_25_0()

				return
			end

			arg_14_0:GetSceneView():DisplayAward({
				titleColor = "#ab4734",
				title = i18n("island_add_temp_bag"),
				awards = arg_14_2.overflowAwards,
				callback = arg_25_0
			})
		end,
		function(arg_26_0)
			if not arg_14_2.overflowAwards or #arg_14_2.overflowAwards == 0 then
				arg_26_0()

				return
			end

			arg_14_0:GetSceneView():OpenPage(IslandInventoryPage)
			arg_26_0()
		end
	}, arg_14_1)
end

function var_0_0.ExecuteTaskAcceptWin(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0:GetSceneView():emitCore(ISLAND_EVT.DISABLE_INPUT)

	local function var_27_0()
		arg_27_0:GetSceneView():emitCore(ISLAND_EVT.ENABLE_INPUT)
		arg_27_1()
	end

	arg_27_0:GetSceneView():GetSubView(Island3dTaskAcceptPage):ExecuteAction("Show", arg_27_2, var_27_0)
end

function var_0_0.AnyPlayerIsRunning(arg_29_0)
	return #arg_29_0.playerList > 0
end

function var_0_0.Dispose(arg_30_0)
	arg_30_0.schedule = nil

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.playerList or {}) do
		iter_30_1:Dispose()
	end

	arg_30_0.playerList = nil
end

return var_0_0
