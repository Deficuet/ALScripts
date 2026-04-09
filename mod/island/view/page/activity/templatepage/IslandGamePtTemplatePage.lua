local var_0_0 = class("IslandGamePtTemplatePage", import("Mod.Island.View.page.activity.IslandBaseActivityPage"))

function var_0_0.OnLoaded(arg_1_0)
	local var_1_0 = arg_1_0._tf:GetComponent("ItemList").prefabItem:ToTable()

	_.each(var_1_0, function(arg_2_0)
		arg_1_0[arg_2_0.name] = arg_2_0.transform
	end)
end

function var_0_0.OnDataSetting(arg_3_0)
	arg_3_0.config = pg.island_activity_pt_page[arg_3_0.activity:getIslandConfig("config_id")]
	arg_3_0.targetActivity = getProxy(ActivityProxy):getActivityById(arg_3_0.config.activity_id)

	arg_3_0:BuildAllTask()
end

function var_0_0.BuildAllTask(arg_4_0)
	arg_4_0.taskList = {}

	_.each(arg_4_0.config.task_id, function(arg_5_0)
		local var_5_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(arg_5_0) or IslandTask.BuildFakeTask(arg_5_0)

		table.insert(arg_4_0.taskList, var_5_0)
	end)
end

function var_0_0.GetFirstUncompletedTaskIndex(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.taskList) do
		if not getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(iter_6_1.id) then
			return iter_6_0
		end
	end

	return 1
end

function var_0_0.GetAllAvailableTaskIds(arg_7_0)
	local var_7_0 = {}

	_.each(arg_7_0.taskList, function(arg_8_0)
		if arg_8_0:IsFinish() and not getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(arg_8_0.id) then
			table.insert(var_7_0, arg_8_0.id)
		end
	end)

	return var_7_0
end

function var_0_0.OnFirstFlush(arg_9_0)
	PlayerPrefs.SetInt(var_0_0.GetTipKey(arg_9_0.activity.id), 1)
	setText(arg_9_0.importGot:Find("Text"), i18n("island_activity_pt_got_all"))
	setText(arg_9_0.scoreTipText, i18n("island_activity_pt_point"))
	setText(arg_9_0.getText, i18n("island_activity_pt_get_oneclick"))
	onButton(arg_9_0, arg_9_0.getButton, function()
		local var_10_0 = arg_9_0:GetAllAvailableTaskIds()

		if #var_10_0 == 0 then
			return
		end

		arg_9_0:emit(IslandMediator.ON_SUBMIT_TASK_ONE_STEP, var_10_0, function()
			arg_9_0:OnUpdateFlush()
		end)
	end, SFX_PANEL)
	_.each(arg_9_0.config.btn_param, function(arg_12_0)
		local var_12_0 = arg_9_0[arg_12_0[1]]

		if not var_12_0 then
			errorMsg("不存在节点或ItemList未绑定节点" .. arg_12_0[1])

			return
		end

		setText(var_12_0:Find("Text"), i18n(arg_12_0[2]))
		onButton(arg_9_0, var_12_0, function()
			arg_9_0:emit(IslandMediator.OPEN_PAGE, arg_12_0[3][1], arg_12_0[3][2])
		end, SFX_PANEL)
		arg_9_0:CheckBtnSkip(var_12_0, arg_12_0[4] or {})
	end)

	arg_9_0.scrollCom = arg_9_0.taskRoot:GetComponent("LScrollRect")

	function arg_9_0.scrollCom.onUpdateItem(arg_14_0, arg_14_1)
		arg_9_0:UpdateTaskList(arg_14_0, tf(arg_14_1))
	end

	arg_9_0.scrollCom:SetTotalCount(#arg_9_0.config.task_id)
end

function var_0_0.CheckBtnSkip(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_2[1]
	local var_15_1 = arg_15_2[2]

	if not var_15_0 then
		return true
	end

	return switch(var_15_0, {
		function()
			local var_16_0 = var_15_1[1]
			local var_16_1 = getProxy(ActivityProxy):getActivityById(var_16_0)

			setActive(arg_15_1, var_16_1 and not var_16_1:isEnd())
		end
	}, function()
		assert(false, "未定义的按钮拦截type: ", var_15_0)
	end)
end

function var_0_0.GetShowPTCount(arg_18_0, arg_18_1)
	return switch(arg_18_1, {
		function()
			return arg_18_0.targetActivity.data1
		end,
		function()
			return arg_18_0.targetActivity.data2
		end
	})
end

function var_0_0.OnUpdateFlush(arg_21_0)
	arg_21_0.targetActivity = getProxy(ActivityProxy):getActivityById(arg_21_0.config.activity_id)

	setText(arg_21_0.scoreText, arg_21_0:GetShowPTCount(arg_21_0.config.point_type))

	local var_21_0 = arg_21_0:GetFirstUncompletedTaskIndex()

	onNextTick(function()
		arg_21_0.scrollCom:ScrollTo(arg_21_0.scrollCom:HeadIndexToValue(var_21_0 - 1))
	end)

	local var_21_1 = #arg_21_0:GetAllAvailableTaskIds() > 0

	setActive(arg_21_0.getButton:Find("red"), var_21_1)
	setGray(arg_21_0.getButton, not var_21_1, true)
	arg_21_0:UpdateImport()
end

function var_0_0.UpdateTaskList(arg_23_0, arg_23_1, arg_23_2)
	arg_23_1 = arg_23_1 + 1

	local var_23_0 = arg_23_0.config.task_id[arg_23_1]
	local var_23_1 = arg_23_0.taskList[arg_23_1]
	local var_23_2 = getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(var_23_0)
	local var_23_3 = var_23_1:GetTargetList()[1]
	local var_23_4 = var_23_1:IsFinish() and not var_23_2

	setText(arg_23_2:Find("bg/name"), var_23_1:GetName())
	setText(arg_23_2:Find("bg/count"), var_23_3:GetProgress() .. "/" .. var_23_3:GetTargetNum())
	setText(arg_23_2:Find("bg/desc"), var_23_3:GetName())

	local var_23_5 = var_23_1:GetAwards()
	local var_23_6 = arg_23_2:Find("bg/items")

	UIItemList.StaticAlign(var_23_6, var_23_6:Find("IslandItemTpl"), #var_23_5, function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == UIItemList.EventUpdate then
			local var_24_0 = var_23_5[arg_24_1 + 1]

			updateCustomDrop(arg_24_2, var_24_0)
			onButton(arg_23_0, arg_24_2, function()
				arg_23_0:emit(IslandMediator.SHOW_MSG_BOX, {
					title = i18n("island_word_desc"),
					type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
					dropData = var_24_0
				})
			end, SFX_PANEL)
		end
	end)
	setActive(arg_23_2:Find("got"), var_23_2)
	setActive(arg_23_2:Find("get"), var_23_4)
	setActive(arg_23_2:Find("red"), var_23_4)
	onButton(arg_23_0, arg_23_2:Find("get"), function()
		arg_23_0:emit(IslandMediator.ON_SUBMIT_TASK, var_23_0, function()
			arg_23_0:OnUpdateFlush()
		end)
	end, SFX_PANEL)
end

function var_0_0.GetAtlasName(arg_28_0)
	assert(false, "override")
end

function var_0_0.GetShowImportInfo(arg_29_0)
	local var_29_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()
	local var_29_1 = arg_29_0.config.import

	for iter_29_0, iter_29_1 in ipairs(var_29_1) do
		if not var_29_0:IsFinishTask(iter_29_1[1]) then
			return iter_29_0, false
		end
	end

	return #var_29_1, true
end

function var_0_0.UpdateImport(arg_30_0)
	local var_30_0, var_30_1 = arg_30_0:GetShowImportInfo()

	setActive(arg_30_0.importGot, var_30_1)
	setImageAlpha(arg_30_0.importIcon, var_30_1 and 0.6 or 1)

	local var_30_2 = arg_30_0.config.import[var_30_0]

	GetImageSpriteFromAtlasAsync(arg_30_0:GetAtlasName(), var_30_0, arg_30_0.importIcon, true)
	setText(arg_30_0.goTipText, i18n(var_30_2[2]))

	local var_30_3 = IslandTask.GetAwardsStatic(var_30_2[1])

	onButton(arg_30_0, arg_30_0.viewButton, function()
		if not var_30_3[1] then
			return
		end

		arg_30_0:emit(IslandMediator.SHOW_MSG_BOX, {
			title = i18n("island_word_desc"),
			type = IslandMsgBox.TYPE_COMMON_DROP_DESCRIBE,
			dropData = var_30_3[1]
		})
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_32_0)
	ClearLScrollrect(arg_32_0.scrollCom)
end

function var_0_0.GetTipKey(arg_33_0)
	return "island_game_pt_template_page_tip_" .. arg_33_0 .. "_" .. getProxy(PlayerProxy):getData().id
end

function var_0_0.ShouldFirstTip(arg_34_0)
	local var_34_0 = var_0_0.GetTipKey(arg_34_0)

	return PlayerPrefs.GetInt(var_34_0, 0) == 0
end

return var_0_0
