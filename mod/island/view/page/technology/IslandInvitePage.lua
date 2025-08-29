local var_0_0 = class("IslandInvitePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandInviteUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.contentText = arg_2_0._tf:Find("Text")

	setText(arg_2_0.contentText, "")

	arg_2_0.prevBtn = arg_2_0._tf:Find("bottom/left_arr")
	arg_2_0.nextBtn = arg_2_0._tf:Find("bottom/right_arr")
	arg_2_0.scrollrect = arg_2_0._tf:Find("bottom/scroll/content"):GetComponent("LScrollRect")
	arg_2_0.scrollrect.isNewLoadingMethod = true

	function arg_2_0.scrollrect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollrect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("top/back"), function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("top/home"), function()
		arg_5_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.prevBtn, function()
		arg_5_0:OnPrev()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.nextBtn, function()
		arg_5_0:OnNext()
	end, SFX_PANEL)

	arg_5_0.cards = {}
end

function var_0_0.OnShow(arg_10_0)
	arg_10_0.triggerFirstCard = true
	arg_10_0.selectedId = nil

	arg_10_0:Flush()
end

function var_0_0.Flush(arg_11_0)
	arg_11_0.triggerFirstCard = true
	arg_11_0.displays = {}

	local var_11_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetInviteList()

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		local var_11_1 = IslandInvitation.New(iter_11_1)

		table.insert(arg_11_0.displays, var_11_1)
	end

	arg_11_0.scrollrect:SetTotalCount(#arg_11_0.displays)
end

function var_0_0.OnInitItem(arg_12_0, arg_12_1)
	local var_12_0 = IslandInviteShipCard.New(arg_12_1)

	onButton(arg_12_0, var_12_0.frameTF, function()
		for iter_13_0, iter_13_1 in pairs(arg_12_0.cards) do
			iter_13_1:UpdateSelected(nil)
		end

		arg_12_0.selectedId = var_12_0.item.shipId

		var_12_0:UpdateSelected(arg_12_0.selectedId)
	end, SFX_PANEL)
	arg_12_0:AddDrag(var_12_0.frameTF, function()
		arg_12_0:emit(IslandMediator.INVITE_SHIP, var_12_0.item.shipId)
	end)

	arg_12_0.cards[arg_12_1] = var_12_0
end

function var_0_0.OnUpdateItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.cards[arg_15_2]

	if not var_15_0 then
		arg_15_0:OnInitItem(arg_15_2)

		var_15_0 = arg_15_0.cards[arg_15_2]
	end

	local var_15_1 = arg_15_0.displays[arg_15_1 + 1]

	var_15_0:Update(var_15_1, arg_15_0.selectedId)

	arg_15_2.name = var_15_0.item.shipId

	if arg_15_0.triggerFirstCard and arg_15_1 == 0 then
		arg_15_0.triggerFirstCard = nil

		triggerButton(var_15_0.frameTF)
	end
end

function var_0_0.AddDrag(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = GetOrAddComponent(arg_16_1, "EventTriggerListener")
	local var_16_1
	local var_16_2 = 0
	local var_16_3 = 50
	local var_16_4 = arg_16_1.rect.height / 2

	var_16_0:AddPointDownFunc(function()
		var_16_2 = 0
		var_16_1 = nil
	end)
	var_16_0:AddDragFunc(function(arg_18_0, arg_18_1)
		local var_18_0 = arg_18_1.position

		if not var_16_1 then
			var_16_1 = var_18_0
		end

		var_16_2 = var_18_0.y - var_16_1.y

		if var_16_2 > 0 then
			setLocalPosition(arg_16_1, {
				x = 0,
				y = var_16_2 - var_16_4
			})
		else
			setLocalPosition(arg_16_1, {
				x = 0,
				y = -var_16_4
			})
		end
	end)
	var_16_0:AddPointUpFunc(function(arg_19_0, arg_19_1)
		setLocalPosition(arg_16_1, {
			x = 0,
			y = -var_16_4
		})

		if var_16_2 > var_16_3 then
			existCall(arg_16_2)
		else
			existCall(arg_16_3)
		end
	end)
end

function var_0_0.GetCommodityIndex(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.displays) do
		if iter_20_1.shipId == arg_20_1 then
			return iter_20_0
		end
	end
end

function var_0_0.OnPrev(arg_21_0)
	if not arg_21_0.selectedId then
		return
	end

	local var_21_0 = arg_21_0:GetCommodityIndex(arg_21_0.selectedId)

	if var_21_0 - 1 > 0 then
		arg_21_0:TriggerCommodity(var_21_0, -1)
	end
end

function var_0_0.OnNext(arg_22_0)
	if not arg_22_0.selectedId then
		return
	end

	local var_22_0 = arg_22_0:GetCommodityIndex(arg_22_0.selectedId)

	if var_22_0 + 1 <= #arg_22_0.displays then
		arg_22_0:TriggerCommodity(var_22_0, 1)
	end
end

function var_0_0.TriggerCommodity(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.displays[arg_23_1].shipId
	local var_23_1 = arg_23_0.displays[arg_23_1 + arg_23_2].shipId
	local var_23_2
	local var_23_3

	for iter_23_0, iter_23_1 in pairs(arg_23_0.cards) do
		if iter_23_1._tf.gameObject.name ~= "-1" then
			if iter_23_1.item.shipId == var_23_1 then
				var_23_2 = iter_23_1
			elseif iter_23_1.item.shipId == var_23_0 then
				var_23_3 = iter_23_1
			end
		end
	end

	if var_23_2 then
		triggerButton(var_23_2.frameTF)
	end

	if var_23_2 and var_23_3 then
		arg_23_0:CheckCardBound(var_23_2, var_23_3, arg_23_2 > 0, arg_23_1 + arg_23_2)
	end
end

function var_0_0.CheckCardBound(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4)
	local var_24_0 = getBounds(arg_24_0.scrollrect.gameObject.transform)

	if arg_24_3 then
		local var_24_1 = getBounds(arg_24_2._tf)
		local var_24_2 = getBounds(arg_24_1._tf)

		if math.ceil(var_24_2:GetMax().x - var_24_0:GetMax().x) > var_24_1.size.x then
			local var_24_3 = arg_24_0.scrollrect:HeadIndexToValue(arg_24_4 - 1) - arg_24_0.scrollrect:HeadIndexToValue(arg_24_4)
			local var_24_4 = arg_24_0.scrollrect.value - var_24_3

			arg_24_0.scrollrect:SetNormalizedPosition(var_24_4, 0)
		end
	else
		local var_24_5 = getBounds(arg_24_1._tf)

		if getBounds(arg_24_1._tf.parent):GetMin().x < var_24_0:GetMin().x and var_24_5:GetMin().x < var_24_0:GetMin().x then
			local var_24_6 = arg_24_0.scrollrect:HeadIndexToValue(arg_24_4 - 1)

			arg_24_0.scrollrect:SetNormalizedPosition(var_24_6, 0)
		end
	end
end

function var_0_0.OnDestroy(arg_25_0)
	return
end

return var_0_0
