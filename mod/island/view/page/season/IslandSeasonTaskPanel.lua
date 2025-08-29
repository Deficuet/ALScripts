local var_0_0 = class("IslandSeasonTaskPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSeasonTaskPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("content")

	arg_2_0.getAllBtn = var_2_0:Find("get_all")

	setText(arg_2_0.getAllBtn:Find("Text"), i18n("island_season_task_collectall"))

	local var_2_1 = var_2_0:Find("view/content/tpl")

	setText(var_2_1:Find("get/Text"), i18n("island_season_task_collect"))
	setText(var_2_1:Find("got/Text"), i18n("island_season_task_collected"))

	arg_2_0.uiList = UIItemList.New(var_2_0:Find("view/content"), var_2_1)
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.getAllBtn, function()
		arg_3_0:emit(IslandMediator.ON_SUBMIT_TASK_ONE_STEP, arg_3_0.canSubmitIds)
	end, SFX_PANEL)
	arg_3_0.uiList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateTask(arg_5_1, arg_5_2)
		end
	end)
end

function var_0_0.UpdateTask(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.taskIds[arg_6_1 + 1]

	arg_6_2.name = var_6_0

	local var_6_1 = arg_6_0.taskVODic[var_6_0]
	local var_6_2 = pg.island_task[var_6_0]

	setText(arg_6_2:Find("desc"), var_6_2.task_desc)
	setText(arg_6_2:Find("name"), var_6_2.name)

	local var_6_3 = IslandTask.GetAwardsStatic(var_6_0)

	UIItemList.StaticAlign(arg_6_2:Find("awards"), arg_6_2:Find("awards/tpl"), #var_6_3, function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			updateCustomDrop(arg_7_2, var_6_3[arg_7_1 + 1])
		end
	end)

	local var_6_4 = pg.island_task_target[var_6_2.target_id[1]].target_num
	local var_6_5 = var_6_1 and var_6_1:GetTargetList()[1]:GetProgress() or var_6_4

	setText(arg_6_2:Find("progress"), var_6_5 .. "/" .. var_6_4)
	setActive(arg_6_2:Find("get_bg"), var_6_1 and var_6_1:IsFinish())
	setActive(arg_6_2:Find("get"), var_6_1 and var_6_1:IsSubmitOnUI() and var_6_1:IsFinish())
	setActive(arg_6_2:Find("got"), not var_6_1)
	onButton(arg_6_0, arg_6_2:Find("get"), function()
		arg_6_0:emit(IslandMediator.ON_SUBMIT_TASK, var_6_1.id)
	end, SFX_PANEL)
end

function var_0_0.Show(arg_9_0)
	arg_9_0.super.Show(arg_9_0)
	arg_9_0:Flush()
end

function var_0_0.Flush(arg_10_0)
	arg_10_0.taskIds = arg_10_0.contextData.season:GetTaskIds()
	arg_10_0.taskVODic = {}

	local var_10_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.contextData.season:GetTaskIds()) do
		local var_10_1 = var_10_0:GetTask(iter_10_1)

		if var_10_1 then
			arg_10_0.taskVODic[iter_10_1] = var_10_1
		end
	end

	table.sort(arg_10_0.taskIds, CompareFuncs({
		function(arg_11_0)
			return arg_10_0.taskVODic[arg_11_0] and 0 or 1
		end,
		function(arg_12_0)
			return arg_12_0
		end
	}))
	arg_10_0.uiList:align(#arg_10_0.taskIds)

	arg_10_0.canSubmitIds = underscore.select(arg_10_0.taskIds, function(arg_13_0)
		return arg_10_0.taskVODic[arg_13_0] and arg_10_0.taskVODic[arg_13_0]:IsSubmitOnUI() and arg_10_0.taskVODic[arg_13_0]:IsFinish()
	end)

	setActive(arg_10_0.getAllBtn, #arg_10_0.canSubmitIds > 0)
end

return var_0_0
