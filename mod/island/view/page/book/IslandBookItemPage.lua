local var_0_0 = class("IslandBookItemPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandBookItemUI"
end

function var_0_0.GetIllustrationType(arg_2_0)
	return IslandIllustration.TYPES.ITEM
end

function var_0_0.OnLoaded(arg_3_0)
	setText(arg_3_0._tf:Find("top/title/Text"), i18n("island_guide"))
	setText(arg_3_0._tf:Find("top/title/Text/en"), i18n("island_guide_en"))

	arg_3_0.viewTF = arg_3_0._tf:Find("view")

	setActive(arg_3_0._tf:Find("tpl"), false)

	arg_3_0.scrollRect = arg_3_0.viewTF:GetComponent("LScrollRect")

	function arg_3_0.scrollRect.onInitItem(arg_4_0)
		arg_3_0:OnInitItem(arg_4_0)
	end

	function arg_3_0.scrollRect.onUpdateItem(arg_5_0, arg_5_1)
		arg_3_0:OnUpdateItem(arg_5_0, arg_5_1)
	end

	arg_3_0.rightTF = arg_3_0._tf:Find("right")
	arg_3_0.rightNameTF = arg_3_0.rightTF:Find("name")
	arg_3_0.rightEnNameTF = arg_3_0.rightTF:Find("zs/Text")
	arg_3_0.rightDescTF = arg_3_0.rightTF:Find("desc")
	arg_3_0.unlockBtn = arg_3_0.rightTF:Find("unlock_btn")

	setText(arg_3_0.unlockBtn:Find("Text"), i18n("island_guide_do_active"))
end

function var_0_0.OnInit(arg_6_0)
	onButton(arg_6_0, arg_6_0._tf:Find("top/back"), function()
		arg_6_0:Hide()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.unlockBtn, function()
		arg_6_0:emit(IslandMediator.UNLOCK_ILLUSTRATION, arg_6_0.showIllustration.id)
	end, SFX_PANEL)

	arg_6_0.cards = {}
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddListener(GAME.ISLAND_UNLOCK_ILLUSTRATION_DONE, arg_9_0.OnUnlockDone)
	arg_9_0:AddListener(GAME.ISLAND_GET_COLLECT_POINT_DONE, arg_9_0.Flush)
	arg_9_0:AddListener(GAME.ISLAND_GET_POINT_AWARD_DONE, arg_9_0.Flush)
end

function var_0_0.RemoveListeners(arg_10_0)
	arg_10_0:RemoveListener(GAME.ISLAND_UNLOCK_ILLUSTRATION_DONE, arg_10_0.OnUnlockDone)
	arg_10_0:RemoveListener(GAME.ISLAND_GET_COLLECT_POINT_DONE, arg_10_0.Flush)
	arg_10_0:RemoveListener(GAME.ISLAND_GET_POINT_AWARD_DONE, arg_10_0.Flush)
end

function var_0_0.OnInitItem(arg_11_0, arg_11_1)
	local var_11_0 = IslandIllustrationCard.New(arg_11_1)

	arg_11_0.cards[arg_11_1] = var_11_0

	onButton(arg_11_0, var_11_0._go, function()
		for iter_12_0, iter_12_1 in pairs(arg_11_0.cards) do
			iter_12_1:UpdateSelected(nil)
		end

		arg_11_0.showIllustration = var_11_0.illustration

		var_11_0:UpdateSelected(arg_11_0.showIllustration.id)
		arg_11_0:FlushRightPanel()
	end, SFX_PANEL)
end

function var_0_0.OnUpdateItem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.cards[arg_13_2]

	if not var_13_0 then
		arg_13_0:OnInitItem(arg_13_2)

		var_13_0 = arg_13_0.cards[arg_13_2]
	end

	local var_13_1 = arg_13_0.showList[arg_13_1 + 1]

	if var_13_1 then
		var_13_0:Update(var_13_1, arg_13_0.showIllustration and arg_13_0.showIllustration.id)
	end

	if arg_13_0.triggerFirstCard and arg_13_1 == 0 then
		arg_13_0.triggerFirstCard = nil

		triggerButton(var_13_0._go)
	end
end

function var_0_0.OnShow(arg_14_0)
	arg_14_0.triggerFirstCard = true

	arg_14_0:Flush()
end

function var_0_0.OnUnlockDone(arg_15_0, arg_15_1)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.cards) do
		iter_15_1:PlayUnlockAnim(arg_15_1.id)
	end

	arg_15_0:Flush()
end

function var_0_0.Flush(arg_16_0)
	arg_16_0.bookAgency = getProxy(IslandProxy):GetIsland():GetBookAgency()
	arg_16_0.showList = arg_16_0.bookAgency:GetListByType(arg_16_0:GetIllustrationType())

	table.sort(arg_16_0.showList, CompareFuncs({
		function(arg_17_0)
			return pg.island_illustrated_guide[arg_17_0.id].order
		end,
		function(arg_18_0)
			return arg_18_0.id
		end
	}))
	arg_16_0.scrollRect:SetTotalCount(#arg_16_0.showList, -1)
	arg_16_0:FlushRightPanel()
end

function var_0_0.FlushRightPanel(arg_19_0)
	if not arg_19_0.showIllustration then
		return
	end

	local var_19_0 = arg_19_0.showIllustration:GetStatus()

	setText(arg_19_0.rightNameTF, arg_19_0.showIllustration:GetName())
	setText(arg_19_0.rightEnNameTF, arg_19_0.showIllustration:GetEnName())

	local var_19_1 = var_19_0 == IslandIllustration.STATUS.UNLOCK and arg_19_0.showIllustration:GetDesc() or i18n("island_guide_lock_desc")

	setText(arg_19_0.rightDescTF, var_19_1)
	setActive(arg_19_0.unlockBtn, var_19_0 == IslandIllustration.STATUS.CAN_UNLOCK)
end

function var_0_0.OnDestroy(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.cards) do
		iter_20_1:Dispose()
	end

	arg_20_0.cards = {}
end

return var_0_0
