local var_0_0 = class("BackYardDecorationThemePage", import(".BackYardDecorationBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "BackYardDecorationThemePage"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.msgbox = BackYardDecorationMsgBox.New(arg_2_0._parentTf.parent.parent.parent.parent.parent, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.refreshList = {}
end

function var_0_0.OnDisplayList(arg_3_0)
	arg_3_0:InitList()
end

function var_0_0.InitList(arg_4_0)
	arg_4_0.displays = {}

	local var_4_0 = arg_4_0.dorm:GetPurchasedFurnitures()
	local var_4_1 = getProxy(DormProxy):GetSystemThemes()

	for iter_4_0, iter_4_1 in ipairs(var_4_1) do
		if iter_4_1:IsPurchased(var_4_0) then
			table.insert(arg_4_0.displays, iter_4_1)
		end
	end

	local var_4_2 = 0

	if arg_4_0.customTheme then
		for iter_4_2, iter_4_3 in pairs(arg_4_0.customTheme) do
			var_4_2 = var_4_2 + 1

			table.insert(arg_4_0.displays, iter_4_3)
		end
	end

	if var_4_2 < BackYardConst.MAX_USER_THEME then
		table.insert(arg_4_0.displays, {
			id = "",
			isEmpty = true
		})
	end

	arg_4_0:SortDisplays()
end

local function var_0_1(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.isEmpty and 1 or 0
	local var_5_1 = arg_5_1.isEmpty and 1 or 0

	if var_5_0 == var_5_1 then
		local var_5_2 = arg_5_0:IsSystem() and 1 or 0
		local var_5_3 = arg_5_1:IsSystem() and 1 or 0

		if var_5_2 == var_5_3 then
			if arg_5_0.order == arg_5_1.order then
				return arg_5_0.id > arg_5_1.id
			else
				return arg_5_0.order > arg_5_1.order
			end
		else
			return var_5_2 < var_5_3
		end
	else
		return var_5_1 < var_5_0
	end
end

local function var_0_2(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.isEmpty and 1 or 0
	local var_6_1 = arg_6_1.isEmpty and 1 or 0

	if var_6_0 == var_6_1 then
		local var_6_2 = arg_6_0:IsSystem() and 1 or 0
		local var_6_3 = arg_6_1:IsSystem() and 1 or 0

		if var_6_2 == var_6_3 then
			if arg_6_0.order == arg_6_1.order then
				return arg_6_0.id < arg_6_1.id
			else
				return arg_6_0.order < arg_6_1.order
			end
		else
			return var_6_3 < var_6_2
		end
	else
		return var_6_1 < var_6_0
	end
end

function var_0_0.SortDisplays(arg_7_0)
	table.sort(arg_7_0.displays, function(arg_8_0, arg_8_1)
		if arg_7_0.orderMode == BackYardDecorationFilterPanel.ORDER_MODE_ASC then
			return var_0_2(arg_8_0, arg_8_1)
		else
			return var_0_1(arg_8_0, arg_8_1)
		end
	end)
	arg_7_0:SetTotalCount()
end

function var_0_0.OnOrderModeUpdated(arg_9_0)
	arg_9_0:SortDisplays()
end

function var_0_0.OnInitItem(arg_10_0, arg_10_1)
	local var_10_0 = BackYardDecorationThemeCard.New(arg_10_1)

	onButton(arg_10_0, var_10_0._tf, function()
		if var_10_0:HasMask() then
			return
		end

		arg_10_0.msgbox:ExecuteAction("Show", var_10_0.themeVO, true)
	end)
	onButton(arg_10_0, var_10_0.add, function()
		local var_12_0 = getProxy(DormProxy):GetTemplateNewID()

		arg_10_0.msgbox:ExecuteAction("Show", {
			id = var_12_0
		}, false)
	end)

	arg_10_0.cards[arg_10_1] = var_10_0
end

function var_0_0.OnUpdateItem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.cards[arg_13_2]

	if not var_13_0 then
		arg_13_0:OnInitItem(arg_13_2)

		var_13_0 = arg_13_0.cards[arg_13_2]
	end

	local var_13_1 = arg_13_0.lastDiaplys[arg_13_1 + 1]

	var_13_0:Update(var_13_1, false)
end

function var_0_0.OnThemeUpdated(arg_14_0)
	arg_14_0.currHouse = nil

	arg_14_0:InitList()
end

function var_0_0.OnApplyThemeBefore(arg_15_0)
	arg_15_0.currHouse = nil

	for iter_15_0, iter_15_1 in pairs(arg_15_0.cards) do
		iter_15_1:Update(iter_15_1.themeVO, false)
	end

	arg_15_0.temps = {}
end

function var_0_0.OnApplyThemeAfter(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in pairs(arg_16_0.cards) do
		if iter_16_1.themeVO.id == arg_16_1 then
			iter_16_1:Update(iter_16_1.themeVO, false)
		end
	end
end

function var_0_0.SetTotalCount(arg_17_0)
	if not arg_17_0.searchKey or arg_17_0.searchKey == "" then
		arg_17_0.lastDiaplys = arg_17_0.displays
	else
		arg_17_0.lastDiaplys = {}

		for iter_17_0, iter_17_1 in ipairs(arg_17_0.displays) do
			if iter_17_1.id == "" or iter_17_1:MatchSearchKey(arg_17_0.searchKey) then
				table.insert(arg_17_0.lastDiaplys, iter_17_1)
			end
		end
	end

	arg_17_0.scrollRect.enabled = true

	arg_17_0.scrollRect:SetTotalCount(#arg_17_0.lastDiaplys)
end

function var_0_0.OnSearchKeyChanged(arg_18_0)
	arg_18_0:SetTotalCount()
end

function var_0_0.OnDestroy(arg_19_0)
	arg_19_0.msgbox:Destroy()

	for iter_19_0, iter_19_1 in pairs(arg_19_0.cards or {}) do
		iter_19_1:Dispose()
	end

	arg_19_0.cards = nil
end

function var_0_0.OnBackPressed(arg_20_0)
	if arg_20_0:GetLoaded() and arg_20_0.msgbox:GetLoaded() and arg_20_0.msgbox:isShowing() then
		arg_20_0.msgbox:Hide()

		return true
	end

	return false
end

return var_0_0
