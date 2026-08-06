local var_0_0 = class("IslandGamePtTemplatePage", import("Mod.Island.View.page.activity.IslandBaseActivityPage"))

function var_0_0.OnDataSetting(arg_1_0)
	arg_1_0.config = pg.island_activity_pt_page[arg_1_0.activity:getIslandConfig("config_id")]
	arg_1_0.targetActivity = getProxy(ActivityProxy):getActivityById(arg_1_0.config.activity_id)

	arg_1_0:BuildAllTask()
end

function var_0_0.BuildAllTask(arg_2_0)
	arg_2_0.taskList = {}

	_.each(arg_2_0.config.task_id, function(arg_3_0)
		local var_3_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(arg_3_0) or IslandTask.BuildFakeTask(arg_3_0)

		table.insert(arg_2_0.taskList, var_3_0)
	end)
end

function var_0_0.GetFirstUncompletedTaskIndex(arg_4_0)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.taskList) do
		if not getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(iter_4_1.id) then
			return iter_4_0
		end
	end

	return 1
end

function var_0_0.GetAllAvailableTaskIds(arg_5_0)
	local var_5_0 = {}

	_.each(arg_5_0.taskList, function(arg_6_0)
		if arg_6_0:IsFinish() and not getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(arg_6_0.id) then
			table.insert(var_5_0, arg_6_0.id)
		end
	end)

	return var_5_0
end

function var_0_0.OnFirstFlush(arg_7_0)
	PlayerPrefs.SetInt(var_0_0.GetTipKey(arg_7_0.activity.id), 1)
	setText(arg_7_0.importGot:Find("Text"), i18n("island_activity_pt_got_all"))
	setText(arg_7_0.scoreTipText, i18n("island_activity_pt_point"))
	setText(arg_7_0.getText, i18n("island_activity_pt_get_oneclick"))
	onButton(arg_7_0, arg_7_0.getButton, function()
		local var_8_0 = arg_7_0:GetAllAvailableTaskIds()

		if #var_8_0 == 0 then
			return
		end

		arg_7_0:emit(IslandMediator.ON_SUBMIT_TASK_ONE_STEP, var_8_0, function()
			arg_7_0:OnUpdateFlush()
		end)
	end, SFX_PANEL)
	_.each(arg_7_0.config.btn_param, function(arg_10_0)
		local var_10_0 = arg_7_0[arg_10_0[1]]

		if not var_10_0 then
			errorMsg("不存在节点或ItemList未绑定节点" .. arg_10_0[1])

			return
		end

		setText(var_10_0:Find("Text"), i18n(arg_10_0[2]))
		onButton(arg_7_0, var_10_0, function()
			arg_7_0:emit(IslandMediator.OPEN_PAGE, arg_10_0[3][1], arg_10_0[3][2])
		end, SFX_PANEL)
		arg_7_0:CheckBtnSkip(var_10_0, arg_10_0[4] or {})
	end)

	arg_7_0.scrollCom = arg_7_0.taskRoot:GetComponent("LScrollRect")

	function arg_7_0.scrollCom.onUpdateItem(arg_12_0, arg_12_1)
		arg_7_0:UpdateTaskList(arg_12_0, tf(arg_12_1))
	end

	arg_7_0.scrollCom:SetTotalCount(#arg_7_0.config.task_id)
end

function var_0_0.CheckBtnSkip(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_2[1]
	local var_13_1 = arg_13_2[2]

	if not var_13_0 then
		return true
	end

	return switch(var_13_0, {
		function()
			local var_14_0 = var_13_1[1]
			local var_14_1 = getProxy(ActivityProxy):getActivityById(var_14_0)

			setActive(arg_13_1, var_14_1 and not var_14_1:isEnd())
		end
	}, function()
		assert(false, "未定义的按钮拦截type: ", var_13_0)
	end)
end

function var_0_0.GetShowPTCount(arg_16_0, arg_16_1)
	return switch(arg_16_1, {
		function()
			return arg_16_0.targetActivity.data1
		end,
		function()
			return arg_16_0.targetActivity.data2
		end
	})
end

function var_0_0.OnUpdateFlush(arg_19_0)
	arg_19_0.targetActivity = getProxy(ActivityProxy):getActivityById(arg_19_0.config.activity_id)

	setText(arg_19_0.scoreText, arg_19_0:GetShowPTCount(arg_19_0.config.point_type))

	local var_19_0 = arg_19_0:GetFirstUncompletedTaskIndex()

	onNextTick(function()
		arg_19_0.scrollCom:ScrollTo(arg_19_0.scrollCom:HeadIndexToValue(var_19_0 - 1))
	end)

	local var_19_1 = #arg_19_0:GetAllAvailableTaskIds() > 0

	setActive(arg_19_0.getButton:Find("red"), var_19_1)
	setGray(arg_19_0.getButton, not var_19_1, true)
	arg_19_0:UpdateImport()
end

function var_0_0.UpdateTaskList(arg_21_0, arg_21_1, arg_21_2)
	arg_21_1 = arg_21_1 + 1

	local var_21_0 = arg_21_0.config.task_id[arg_21_1]
	local var_21_1 = arg_21_0.taskList[arg_21_1]
	local var_21_2 = getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(var_21_0)
	local var_21_3 = var_21_1:GetTargetList()[1]
	local var_21_4 = var_21_1:IsFinish() and not var_21_2

	setText(arg_21_2:Find("bg/name"), var_21_1:GetName())
	setText(arg_21_2:Find("bg/count"), var_21_3:GetProgress() .. "/" .. var_21_3:GetTargetNum())
	setText(arg_21_2:Find("bg/desc"), var_21_3:GetName())

	local var_21_5 = var_21_1:GetAwards()
	local var_21_6 = arg_21_2:Find("bg/items")

	UIItemList.StaticAlign(var_21_6, var_21_6:Find("IslandItemTpl"), #var_21_5, function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = var_21_5[arg_22_1 + 1]

			updateCustomDrop(arg_22_2, var_22_0)
			onButton(arg_21_0, arg_22_2, function()
				arg_21_0:emit(IslandMediator.SHOW_MSG_BOX, {
					title = i18n("island_word_desc"),
					type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
					dropData = var_22_0
				})
			end, SFX_PANEL)
		end
	end)
	setActive(arg_21_2:Find("got"), var_21_2)
	setActive(arg_21_2:Find("get"), var_21_4)
	setActive(arg_21_2:Find("red"), var_21_4)
	onButton(arg_21_0, arg_21_2:Find("get"), function()
		arg_21_0:emit(IslandMediator.ON_SUBMIT_TASK, var_21_0, function()
			arg_21_0:OnUpdateFlush()
		end)
	end, SFX_PANEL)
end

function var_0_0.GetAtlasName(arg_26_0)
	assert(false, "override")
end

function var_0_0.GetShowImportInfo(arg_27_0)
	local var_27_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()
	local var_27_1 = arg_27_0.config.import

	for iter_27_0, iter_27_1 in ipairs(var_27_1) do
		if not var_27_0:IsFinishTask(iter_27_1[1]) then
			return iter_27_0, false
		end
	end

	return #var_27_1, true
end

function var_0_0.UpdateImport(arg_28_0)
	local var_28_0, var_28_1 = arg_28_0:GetShowImportInfo()

	setActive(arg_28_0.importGot, var_28_1)
	setImageAlpha(arg_28_0.importIcon, var_28_1 and 0.6 or 1)

	local var_28_2 = arg_28_0.config.import[var_28_0]

	GetImageSpriteFromAtlasAsync(arg_28_0:GetAtlasName(), var_28_0, arg_28_0.importIcon, true)
	setText(arg_28_0.goTipText, i18n(var_28_2[2]))

	local var_28_3 = IslandTask.GetAwardsStatic(var_28_2[1])

	onButton(arg_28_0, arg_28_0.viewButton, function()
		if not var_28_3[1] then
			return
		end

		arg_28_0:emit(IslandMediator.SHOW_MSG_BOX, {
			title = i18n("island_word_desc"),
			type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
			dropData = var_28_3[1]
		})
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_30_0)
	ClearLScrollrect(arg_30_0.scrollCom)
	bindComponent(arg_30_0, arg_30_0._tf, true)
end

function var_0_0.GetTipKey(arg_31_0)
	return "island_game_pt_template_page_tip_" .. arg_31_0 .. "_" .. getProxy(PlayerProxy):getData().id
end

function var_0_0.ShouldFirstTip(arg_32_0)
	local var_32_0 = var_0_0.GetTipKey(arg_32_0)

	return PlayerPrefs.GetInt(var_32_0, 0) == 0
end

return var_0_0
