local var_0_0 = class("IslandTicketStoragePage", import("...base.IslandBasePage"))

var_0_0.SORT_TYPES = {
	VALID = 1,
	SPEED_UP = 2
}

function var_0_0.getUIName(arg_1_0)
	return "IslandTicketStorageUI"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0._tf:Find("frame/title"), i18n("island_ticket_storage_title"))

	arg_2_0.ascToggleTF = arg_2_0._tf:Find("toggle_asc")
	arg_2_0.sortToggleTF = arg_2_0._tf:Find("toggle_sort")
	arg_2_0.sortPanelAnim = arg_2_0._tf:Find("sort_panel"):GetComponent(typeof(Animation))
	arg_2_0.sortByValidBtn = arg_2_0._tf:Find("sort_panel/valid")

	setText(arg_2_0.sortByValidBtn:Find("Text"), i18n("island_ticket_sort_valid"))

	arg_2_0.sortBySpeedupBtn = arg_2_0._tf:Find("sort_panel/speedup")

	setText(arg_2_0.sortBySpeedupBtn:Find("Text"), i18n("island_ticket_sort_speedup"))

	arg_2_0.confirmBtn = arg_2_0._tf:Find("confirm")

	setText(arg_2_0.confirmBtn:Find("Text"), i18n("word_ok"))

	arg_2_0.scrollRect = arg_2_0._tf:Find("scrollrect"):GetComponent("LScrollRect")

	function arg_2_0.scrollRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("frame/close"), function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("mask"), function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.confirmBtn, function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onToggle(arg_5_0, arg_5_0.ascToggleTF, function(arg_9_0)
		arg_5_0.isAsc = arg_9_0

		arg_5_0:SetTotalCount()
	end, SFX_PANEL)
	onToggle(arg_5_0, arg_5_0.sortToggleTF, function(arg_10_0)
		local var_10_0 = arg_10_0 and "anim_IslandTicketStorageUI_sort_in" or "anim_IslandTicketStorageUI_sort_out"

		arg_5_0.sortPanelAnim:Play(var_10_0)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.sortByValidBtn, function()
		arg_5_0.sortType = var_0_0.SORT_TYPES.VALID

		setText(arg_5_0.sortToggleTF:Find("Text"), i18n("island_ticket_sort_valid"))
		triggerToggle(arg_5_0.sortToggleTF, false)
		arg_5_0:SetTotalCount()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.sortBySpeedupBtn, function()
		arg_5_0.sortType = var_0_0.SORT_TYPES.SPEED_UP

		setText(arg_5_0.sortToggleTF:Find("Text"), i18n("island_ticket_sort_speedup"))
		triggerToggle(arg_5_0.sortToggleTF, false)
		arg_5_0:SetTotalCount()
	end, SFX_PANEL)

	arg_5_0.cards = {}
end

function var_0_0.OnInitItem(arg_13_0, arg_13_1)
	local var_13_0 = IslandTicketCard.New(arg_13_1)

	arg_13_0.cards[arg_13_1] = var_13_0
end

function var_0_0.OnUpdateItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.cards[arg_14_2]

	if not var_14_0 then
		arg_14_0:OnInitItem(arg_14_2)

		var_14_0 = arg_14_0.cards[arg_14_2]
	end

	local var_14_1 = arg_14_0.displays[arg_14_1 + 1]

	var_14_0:Update(var_14_1)
end

function var_0_0.OnShow(arg_15_0)
	arg_15_0:BlurPanel()

	arg_15_0.ticketAgency = getProxy(IslandProxy):GetIsland():GetTicketAgency()
	arg_15_0.displays = arg_15_0.ticketAgency:GetAllTicketList()
	arg_15_0.isAsc = true
	arg_15_0.sortType = var_0_0.SORT_TYPES.SPEED_UP

	triggerButton(arg_15_0.sortBySpeedupBtn)
end

function var_0_0.SetTotalCount(arg_16_0)
	if arg_16_0.sortType == var_0_0.SORT_TYPES.VALID then
		arg_16_0:SortByValid()
	elseif arg_16_0.sortType == var_0_0.SORT_TYPES.SPEED_UP then
		arg_16_0:SortBySpeedup()
	end

	arg_16_0.scrollRect:SetTotalCount(#arg_16_0.displays, -1)
end

function var_0_0.SortBySpeedup(arg_17_0)
	local var_17_0 = arg_17_0.isAsc and 1 or -1

	table.sort(arg_17_0.displays, CompareFuncs({
		function(arg_18_0)
			return var_17_0 * arg_18_0:GetTime()
		end,
		function(arg_19_0)
			return var_17_0 * (arg_19_0:IsForever() and 1 or 0)
		end,
		function(arg_20_0)
			return var_17_0 * arg_20_0:GetEndTime()
		end,
		function(arg_21_0)
			return var_17_0 * arg_21_0.id
		end
	}))
end

function var_0_0.SortByValid(arg_22_0)
	local var_22_0 = arg_22_0.isAsc and 1 or -1

	table.sort(arg_22_0.displays, CompareFuncs({
		function(arg_23_0)
			return var_22_0 * (arg_23_0:IsForever() and 1 or 0)
		end,
		function(arg_24_0)
			return var_22_0 * arg_24_0:GetEndTime()
		end,
		function(arg_25_0)
			return var_22_0 * arg_25_0:GetTime()
		end,
		function(arg_26_0)
			return var_22_0 * arg_26_0.id
		end
	}))
end

function var_0_0.OnHide(arg_27_0)
	arg_27_0:UnBlurPanel()
end

function var_0_0.OnDestroy(arg_28_0)
	ClearLScrollrect(arg_28_0.scrollRect)

	for iter_28_0, iter_28_1 in pairs(arg_28_0.cards) do
		iter_28_1:Dispose()
	end

	arg_28_0.cards = {}
end

return var_0_0
