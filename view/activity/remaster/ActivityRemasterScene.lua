local var_0_0 = class("ActivityRemasterScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ActivityRemasterUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.scrollRect = arg_2_0._tf:Find("list"):GetComponent("LScrollRect")

	function arg_2_0.scrollRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	setText(arg_2_0._tf:Find("top/title/Text"), i18n("act_remaster_title"))
	setText(arg_2_0._tf:Find("prints/tip/Text"), i18n("act_remaster_tip_1"))
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("top/closeBtn"), function()
		arg_5_0:emit(BaseUI.ON_BACK)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("top/homeBtn"), function()
		arg_5_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)

	arg_5_0.cards = {}
	arg_5_0.activityRemasterDataList = getProxy(ActivityRemasterProxy):GetRemasterActList()

	arg_5_0:InitList()
	arg_5_0:UpdateActTime()
end

function var_0_0.OnInitItem(arg_8_0, arg_8_1)
	local var_8_0 = ActivityRemasterCard.New(arg_8_1)

	onButton(arg_8_0, var_8_0._go, function()
		if var_8_0.remasterData:IsFinish() then
			return
		end

		local var_9_0 = var_8_0.remasterData:GetName()
		local var_9_1, var_9_2 = getProxy(ActivityRemasterProxy):InActTime()

		if not var_9_1 or not var_9_2 then
			return
		end

		local var_9_3 = pg.activity_re_timer[var_9_2]

		if not var_9_3 or not var_9_3.timer or not var_9_3.timer[3] then
			return
		end

		local var_9_4 = var_9_3.timer[3]
		local var_9_5 = var_9_4[1][1]
		local var_9_6 = var_9_4[1][2]
		local var_9_7 = var_9_4[1][3]
		local var_9_8 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_9_9 = pg.TimeMgr.GetInstance():Table2ServerTime({
			year = var_9_5,
			month = var_9_6,
			day = var_9_7,
			hour = var_9_4[2][1],
			min = var_9_4[2][2],
			sec = var_9_4[2][3]
		}) - var_9_8 < 172800 and COLOR_RED or "#393a3c"
		local var_9_10 = setColorStr(i18n("act_remaster_open_tip", var_9_0, var_9_5 .. "/" .. var_9_6 .. "/" .. var_9_7), var_9_9)

		local function var_9_11()
			arg_8_0:emit(ActivityRemasterMediator.ACTIVE_ACT, var_8_0.remasterData.id)
		end

		arg_8_0.infoDisplayPage = arg_8_0.infoDisplayPage or ActivityRemasterInfoDisplayPage.New(arg_8_0._tf, arg_8_0.event)

		arg_8_0.infoDisplayPage:ExecuteAction("Show", var_8_0.remasterData.id, var_9_10, var_9_11)
	end, SFX_PANEL)

	arg_8_0.cards[arg_8_1] = var_8_0
end

function var_0_0.OnUpdateItem(arg_11_0, arg_11_1, arg_11_2)
	if not arg_11_0.cards[arg_11_2] then
		arg_11_0:OnInitItem(arg_11_2)
	end

	local var_11_0 = arg_11_0.cards[arg_11_2]
	local var_11_1 = arg_11_0.displays[arg_11_1 + 1]

	var_11_0:Update(var_11_1)
end

function var_0_0.UpdateActTime(arg_12_0)
	local var_12_0, var_12_1 = getProxy(ActivityRemasterProxy):InActTime()
	local var_12_2 = ""

	if var_12_1 then
		local var_12_3 = pg.activity_re_timer[var_12_1]
		local var_12_4 = var_12_3.timer[2][1][2] .. "/" .. var_12_3.timer[2][1][3]
		local var_12_5 = var_12_3.timer[3][1][2] .. "/" .. var_12_3.timer[3][1][3]

		var_12_2 = i18n("act_remaster_tip_2", var_12_4 .. "-" .. var_12_5)
	end

	setText(arg_12_0._tf:Find("prints/time/Text"), var_12_2)
end

function var_0_0.InitList(arg_13_0)
	arg_13_0.displays = {}

	local var_13_0 = {}
	local var_13_1 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.activityRemasterDataList) do
		if iter_13_1:IsSpecial() then
			table.insert(var_13_0, iter_13_1)
		else
			table.insert(var_13_1, iter_13_1)
		end
	end

	for iter_13_2, iter_13_3 in ipairs(var_13_1) do
		table.insert(arg_13_0.displays, iter_13_3)
	end

	table.sort(arg_13_0.displays, function(arg_14_0, arg_14_1)
		local var_14_0 = arg_14_0:IsFinish() and 1 or 0
		local var_14_1 = arg_14_1:IsFinish() and 1 or 0

		if var_14_0 == var_14_1 then
			return arg_14_0.id > arg_14_1.id
		else
			return var_14_0 < var_14_1
		end
	end)

	if _.all(var_13_1, function(arg_15_0)
		return arg_15_0:IsFinish()
	end) then
		for iter_13_4, iter_13_5 in ipairs(var_13_0) do
			table.insert(arg_13_0.displays, 1, iter_13_5)
		end
	end

	arg_13_0.scrollRect:SetTotalCount(#arg_13_0.displays)
end

function var_0_0.willExit(arg_16_0)
	if arg_16_0.infoDisplayPage and arg_16_0.infoDisplayPage:GetLoaded() then
		arg_16_0.infoDisplayPage:Destroy()
	end

	arg_16_0.infoDisplayPage = nil

	for iter_16_0, iter_16_1 in pairs(arg_16_0.cards) do
		iter_16_1:Dispose()
	end

	arg_16_0.cards = nil
end

function var_0_0.onBackPressed(arg_17_0)
	if arg_17_0.infoDisplayPage and arg_17_0.infoDisplayPage:GetLoaded() and arg_17_0.infoDisplayPage:isShowing() then
		arg_17_0.infoDisplayPage:onBackPressed()

		return
	end

	arg_17_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0
