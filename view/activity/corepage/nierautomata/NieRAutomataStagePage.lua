local var_0_0 = class("NieRAutomataStagePage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("panel")
	arg_1_0.chainTFList = {}
	arg_1_0.stageTFList = {}

	local var_1_0 = arg_1_0.bg:Find("stages")
	local var_1_1 = arg_1_0.bg:Find("progress_chain")

	for iter_1_0 = 1, 2 do
		table.insert(arg_1_0.stageTFList, var_1_0:Find("stage_" .. iter_1_0))
		table.insert(arg_1_0.chainTFList, var_1_1:Find("chain_mark_" .. iter_1_0))
	end

	table.insert(arg_1_0.stageTFList, var_1_0:Find("stage_3"))
end

function var_0_0.flushTaskData(arg_2_0)
	arg_2_0._taskList = {}

	local var_2_0 = arg_2_0.activity:getConfig("config_client").task

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		local var_2_1 = getProxy(TaskProxy):getTaskById(iter_2_1) or getProxy(TaskProxy):getFinishTaskById(iter_2_1)

		table.insert(arg_2_0._taskList, var_2_1)
	end
end

function var_0_0.GetClearEnemyList(arg_3_0)
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.activity.data2_list) do
		table.insert(var_3_0, arg_3_0.activity:GetEnemyDataByStageId(iter_3_1).id)
	end

	return var_3_0
end

function var_0_0.IsStageUnlock(arg_4_0, arg_4_1, arg_4_2)
	return arg_4_1:GetPreChapterId() == 0 or table.contains(arg_4_2, arg_4_1:GetPreChapterId())
end

function var_0_0.UpdateAwardState(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_2:Find("award")
	local var_5_1 = arg_5_0._taskList[arg_5_1]

	if not var_5_1 then
		return
	end

	local var_5_2 = var_5_1:getConfig("award_display")[1]
	local var_5_3 = {
		type = var_5_2[1],
		id = var_5_2[2],
		count = var_5_2[3]
	}
	local var_5_4 = var_5_0:Find("bg")
	local var_5_5 = var_5_0:Find("got")
	local var_5_6 = var_5_1:getTaskStatus()

	updateDrop(findTF(var_5_0, "mask"), var_5_3)
	setActive(var_5_4, arg_5_3)

	if var_5_5 then
		setActive(var_5_5, arg_5_3 and var_5_6 == 2)
	end

	onButton(arg_5_0, var_5_0, function()
		arg_5_0:emit(BaseUI.ON_DROP, var_5_3)
	end)
end

function var_0_0.RefreshAwardStates(arg_7_0)
	local var_7_0 = arg_7_0.activity:getConfig("config_data")
	local var_7_1 = arg_7_0:GetClearEnemyList()

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.stageTFList) do
		local var_7_2 = arg_7_0.activity:GetEnemyDataById(var_7_0[iter_7_0])

		arg_7_0:UpdateAwardState(iter_7_0, iter_7_1, arg_7_0:IsStageUnlock(var_7_2, var_7_1))
	end
end

function var_0_0.OnFirstFlush(arg_8_0)
	local var_8_0 = arg_8_0.activity:getConfig("config_data")
	local var_8_1 = arg_8_0:GetClearEnemyList()

	arg_8_0:flushTaskData()

	local var_8_2 = 1

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.stageTFList) do
		local var_8_3 = arg_8_0.activity:GetEnemyDataById(var_8_0[iter_8_0])

		setText(iter_8_1:Find("name/text"), var_8_3:getConfig("name"))

		local var_8_4 = arg_8_0:IsStageUnlock(var_8_3, var_8_1)

		arg_8_0:UpdateAwardState(iter_8_0, iter_8_1, var_8_4)

		if var_8_4 then
			setActive(iter_8_1:Find("lock"), false)
			onButton(arg_8_0, iter_8_1, function()
				arg_8_0.fleetEditPanel = arg_8_0:GetFleetEditPanel()

				local var_9_0 = getProxy(FleetProxy):GetRegularFleets()

				arg_8_0.fleetEditPanel.buffer:SetFleets(var_9_0)
				arg_8_0.fleetEditPanel.buffer:SetSettings(1, 0, var_8_3:GetExpeditionId(), SYSTEM_REWARD_PERFORM, arg_8_0.activity.configId)
				arg_8_0.fleetEditPanel.buffer:UpdateView()
				arg_8_0.fleetEditPanel.buffer:Show()
			end)

			if arg_8_0.chainTFList[iter_8_0] then
				arg_8_0:setChianMark(iter_8_0, true)
			end

			local var_8_5 = iter_8_0
		else
			if arg_8_0.chainTFList[iter_8_0] then
				arg_8_0:setChianMark(iter_8_0, false)
			end

			setActive(iter_8_1:Find("lock"), true)
		end
	end
end

function var_0_0.GetFleetEditPanel(arg_10_0)
	if not arg_10_0.fleetEditPanel then
		arg_10_0.fleetEditPanel = BossSingleBattleFleetSelectSubPanelLite.New(arg_10_0)

		arg_10_0.fleetEditPanel:Load()
	end

	return arg_10_0.fleetEditPanel
end

function var_0_0.setChianMark(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.chainTFList[arg_11_1]

	setActive(var_11_0:Find("finish"), arg_11_2)
	setActive(var_11_0:Find("unfinish"), not arg_11_2)
end

function var_0_0.OnUpdateFlush(arg_12_0)
	arg_12_0:flushTaskData()
	arg_12_0:RefreshAwardStates()

	for iter_12_0, iter_12_1 in ipairs(arg_12_0._taskList) do
		if iter_12_1:getTaskStatus() == 1 then
			arg_12_0:emit(ActivityMediator.ON_TASK_SUBMIT, iter_12_1, function()
				arg_12_0:flushTaskData()
				arg_12_0:RefreshAwardStates()
			end)
		end
	end
end

function var_0_0.OnDestroy(arg_14_0)
	if arg_14_0.fleetEditPanel then
		arg_14_0.fleetEditPanel:OnHide()
	end
end

return var_0_0
