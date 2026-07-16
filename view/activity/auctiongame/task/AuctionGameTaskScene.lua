local var_0_0 = class("AuctionGameTaskScene", import("view.base.BaseUI"))

var_0_0.TASK_TYPE = {
	DAILY = 1,
	CHALLENGE = 2
}

function var_0_0.getUIName(arg_1_0)
	return "AuctionGameTaskUI"
end

function var_0_0.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	setText(arg_2_0.uiGetAllText, i18n("auction_signin_collect"))
	onButton(arg_2_0, arg_2_0.uiGetAllBtn, function()
		local var_4_0 = {}

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			for iter_4_0, iter_4_1 in ipairs(arg_2_0.dailyTaskList) do
				if iter_4_1:getTaskStatus() == 1 then
					table.insert(var_4_0, iter_4_1.id)
				end
			end

			for iter_4_2, iter_4_3 in ipairs(arg_2_0.challengeTaskList) do
				if iter_4_3:getTaskStatus() == 1 then
					table.insert(var_4_0, iter_4_3.id)
				end
			end
		else
			for iter_4_4, iter_4_5 in ipairs(arg_2_0.taskList) do
				if iter_4_5:getTaskStatus() == 1 then
					table.insert(var_4_0, iter_4_5.id)
				end
			end
		end

		if #var_4_0 <= 0 then
			return
		end

		arg_2_0:emit(AuctionGameTaskMediator.ON_ACTIVITY_TASK_SUBMIT_ONESTEP, arg_2_0.taskActivityID, var_4_0)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiDailyBtn, function()
		arg_2_0:OnSwitchBtn(var_0_0.TASK_TYPE.DAILY)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiChallengeBtn, function()
		arg_2_0:OnSwitchBtn(var_0_0.TASK_TYPE.CHALLENGE)
	end, SFX_PANEL)
	setText(arg_2_0.uiDailyText, i18n("auction_task_daily"))
	setText(arg_2_0.uiChallengeText, i18n("auction_task_challenge"))

	arg_2_0.itemList = {}
	arg_2_0.uiLScroll = GetComponent(arg_2_0.uiScroll, "LScrollRect")
	arg_2_0.onInitItemHandler = handler(arg_2_0, arg_2_0.OnInitItem)
	arg_2_0.onUpdateItemHandler = handler(arg_2_0, arg_2_0.OnUpdateItem)
	arg_2_0.uiLScroll.onInitItem = arg_2_0.onInitItemHandler
	arg_2_0.uiLScroll.onUpdateItem = arg_2_0.onUpdateItemHandler
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:OverlayPanel(arg_7_0._tf, {})
	setPaintingPrefabAsync(arg_7_0.uiPaintingTf, pg.ship_skin_template[900284].painting, "chuanwu", nil, {
		skinID = 900284
	})
	arg_7_0:OnSwitchBtn(var_0_0.TASK_TYPE.DAILY)
end

function var_0_0.willExit(arg_8_0)
	arg_8_0:UnOverlayPanel(arg_8_0._tf)
	retPaintingPrefab(arg_8_0.uiPaintingTf, pg.ship_skin_template[900284].painting)

	arg_8_0.uiLScroll.onInitItem = nil
	arg_8_0.uiLScroll.onUpdateItem = nil
	arg_8_0.onInitItemHandler = nil
	arg_8_0.onUpdateItemHandler = nil
end

function var_0_0.OnSwitchBtn(arg_9_0, arg_9_1)
	if arg_9_1 == var_0_0.TASK_TYPE.DAILY then
		setTextColor(arg_9_0.uiDailyText, Color.NewHex("#FFFFFF"))
		setTextColor(arg_9_0.uiChallengeText, Color.NewHex("#393A3C"))
		setActive(arg_9_0.uiDailySelectedGo, true)
		setActive(arg_9_0.uiChallengeSelectedGo, false)
	else
		setTextColor(arg_9_0.uiDailyText, Color.NewHex("#393A3C"))
		setTextColor(arg_9_0.uiChallengeText, Color.NewHex("#FFFFFF"))
		setActive(arg_9_0.uiDailySelectedGo, false)
		setActive(arg_9_0.uiChallengeSelectedGo, true)
	end

	arg_9_0.selectedType = arg_9_1

	arg_9_0:RefreshUI()
end

function var_0_0.GetTaskList(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = {}
	local var_10_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AUCTION_GAME):getConfig("config_client").taskActID
	local var_10_3 = pg.activity_template[var_10_2].config_data

	arg_10_0.taskActivityID = var_10_2

	local var_10_4 = getProxy(TaskProxy)

	for iter_10_0, iter_10_1 in ipairs(var_10_3) do
		local var_10_5 = var_10_4:getTaskVO(iter_10_1) or Task.New({
			id = iter_10_1
		})

		if var_10_5:IsActRoutineType() then
			table.insert(var_10_0, var_10_5)
		else
			table.insert(var_10_1, var_10_5)
		end
	end

	return var_10_0, var_10_1
end

function var_0_0.RefreshUI(arg_11_0)
	arg_11_0.dailyTaskList, arg_11_0.challengeTaskList = arg_11_0:GetTaskList()

	if arg_11_0.selectedType == var_0_0.TASK_TYPE.DAILY then
		arg_11_0.taskList = arg_11_0.dailyTaskList

		setGray(arg_11_0.uiGetAllBtn, not arg_11_0:IsDailyTip())
	else
		arg_11_0.taskList = arg_11_0.challengeTaskList

		setGray(arg_11_0.uiGetAllBtn, not arg_11_0:IsChallengeTip())
	end

	arg_11_0:Sort(arg_11_0.taskList)
	arg_11_0.uiLScroll:SetTotalCount(#arg_11_0.taskList)
	setActive(arg_11_0.uiDailyTipGo, arg_11_0:IsDailyTip())
	setActive(arg_11_0.uiChallengeTipGo, arg_11_0:IsChallengeTip())
end

function var_0_0.OnInitItem(arg_12_0, arg_12_1)
	arg_12_0.itemList[arg_12_1] = AuctionGameTaskItem.New(tf(arg_12_1), arg_12_0)
end

function var_0_0.OnUpdateItem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.itemList[arg_13_2]

	if var_13_0 == nil then
		arg_13_0:OnInitItem(arg_13_2)

		var_13_0 = arg_13_0.itemList[arg_13_2]
	end

	local var_13_1 = arg_13_0.taskList[arg_13_1 + 1]

	var_13_0:SetData(var_13_1)
end

function var_0_0.Sort(arg_14_0)
	local function var_14_0(arg_15_0, arg_15_1, arg_15_2)
		local function var_15_0(arg_16_0)
			for iter_16_0, iter_16_1 in ipairs(arg_15_2) do
				if arg_16_0 == iter_16_1 then
					return iter_16_0
				end
			end
		end

		return var_15_0(arg_15_0) < var_15_0(arg_15_1)
	end

	table.sort(arg_14_0.taskList, function(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_0:getTaskStatus()
		local var_17_1 = arg_17_1:getTaskStatus()

		if var_17_0 == var_17_1 then
			return arg_17_0.id < arg_17_1.id
		end

		return var_14_0(var_17_0, var_17_1, {
			1,
			0,
			2,
			-1
		})
	end)
end

function var_0_0.IsDailyTip(arg_18_0)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.dailyTaskList) do
		if iter_18_1:getTaskStatus() == 1 then
			return true
		end
	end

	return false
end

function var_0_0.IsChallengeTip(arg_19_0)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.challengeTaskList) do
		if iter_19_1:getTaskStatus() == 1 then
			return true
		end
	end

	return false
end

return var_0_0
