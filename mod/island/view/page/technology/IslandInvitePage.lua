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
	onButton(arg_5_0, arg_5_0.prevBtn, function()
		arg_5_0:OnPrev()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.nextBtn, function()
		arg_5_0:OnNext()
	end, SFX_PANEL)

	arg_5_0.cards = {}
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddListener(IslandCharacterAgency.ADD_SHIP, arg_9_0.Flush)
end

function var_0_0.RemoveListeners(arg_10_0)
	arg_10_0:RemoveListener(IslandCharacterAgency.ADD_SHIP, arg_10_0.Flush)
end

function var_0_0.OnShow(arg_11_0)
	arg_11_0.triggerFirstCard = true
	arg_11_0.selectedId = nil

	arg_11_0:Flush()
end

function var_0_0.Flush(arg_12_0)
	arg_12_0.triggerFirstCard = true
	arg_12_0.displays = {}

	local var_12_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetInviteList()

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		local var_12_1 = IslandInvitation.New(iter_12_1)

		table.insert(arg_12_0.displays, var_12_1)
	end

	arg_12_0.scrollrect:SetTotalCount(#arg_12_0.displays)
end

function var_0_0.OnInitItem(arg_13_0, arg_13_1)
	local var_13_0 = IslandInviteShipCard.New(arg_13_1)

	onButton(arg_13_0, var_13_0.frameTF, function()
		for iter_14_0, iter_14_1 in pairs(arg_13_0.cards) do
			iter_14_1:UpdateSelected(nil)
		end

		arg_13_0.selectedId = var_13_0.item.shipId

		var_13_0:UpdateSelected(arg_13_0.selectedId)
	end, SFX_PANEL)
	arg_13_0:AddDrag(var_13_0.frameTF, function()
		arg_13_0:emit(IslandMediator.INVITE_SHIP, var_13_0.item.shipId)
	end)

	arg_13_0.cards[arg_13_1] = var_13_0
end

function var_0_0.OnUpdateItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.cards[arg_16_2]

	if not var_16_0 then
		arg_16_0:OnInitItem(arg_16_2)

		var_16_0 = arg_16_0.cards[arg_16_2]
	end

	local var_16_1 = arg_16_0.displays[arg_16_1 + 1]

	var_16_0:Update(var_16_1, arg_16_0.selectedId)

	arg_16_2.name = var_16_0.item.shipId

	if arg_16_0.triggerFirstCard and arg_16_1 == 0 then
		arg_16_0.triggerFirstCard = nil

		triggerButton(var_16_0.frameTF)
	end
end

function var_0_0.AddDrag(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = GetOrAddComponent(arg_17_1, "EventTriggerListener")
	local var_17_1
	local var_17_2 = 0
	local var_17_3 = 50
	local var_17_4 = arg_17_1.rect.height / 2

	var_17_0:AddPointDownFunc(function()
		var_17_2 = 0
		var_17_1 = nil
	end)
	var_17_0:AddDragFunc(function(arg_19_0, arg_19_1)
		local var_19_0 = arg_19_1.position

		if not var_17_1 then
			var_17_1 = var_19_0
		end

		var_17_2 = var_19_0.y - var_17_1.y

		if var_17_2 > 0 then
			setLocalPosition(arg_17_1, {
				x = 0,
				y = var_17_2 - var_17_4
			})
		else
			setLocalPosition(arg_17_1, {
				x = 0,
				y = -var_17_4
			})
		end
	end)
	var_17_0:AddPointUpFunc(function(arg_20_0, arg_20_1)
		setLocalPosition(arg_17_1, {
			x = 0,
			y = -var_17_4
		})

		if var_17_2 > var_17_3 then
			existCall(arg_17_2)
		else
			existCall(arg_17_3)
		end
	end)
end

function var_0_0.GetCommodityIndex(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.displays) do
		if iter_21_1.shipId == arg_21_1 then
			return iter_21_0
		end
	end
end

function var_0_0.OnPrev(arg_22_0)
	if not arg_22_0.selectedId then
		return
	end

	local var_22_0 = arg_22_0:GetCommodityIndex(arg_22_0.selectedId)

	if var_22_0 - 1 > 0 then
		arg_22_0:TriggerCommodity(var_22_0, -1)
	end
end

function var_0_0.OnNext(arg_23_0)
	if not arg_23_0.selectedId then
		return
	end

	local var_23_0 = arg_23_0:GetCommodityIndex(arg_23_0.selectedId)

	if var_23_0 + 1 <= #arg_23_0.displays then
		arg_23_0:TriggerCommodity(var_23_0, 1)
	end
end

function var_0_0.TriggerCommodity(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.displays[arg_24_1].shipId
	local var_24_1 = arg_24_0.displays[arg_24_1 + arg_24_2].shipId
	local var_24_2
	local var_24_3

	for iter_24_0, iter_24_1 in pairs(arg_24_0.cards) do
		if iter_24_1._tf.gameObject.name ~= "-1" then
			if iter_24_1.item.shipId == var_24_1 then
				var_24_2 = iter_24_1
			elseif iter_24_1.item.shipId == var_24_0 then
				var_24_3 = iter_24_1
			end
		end
	end

	if var_24_2 then
		triggerButton(var_24_2.frameTF)
	end

	if var_24_2 and var_24_3 then
		arg_24_0:CheckCardBound(var_24_2, var_24_3, arg_24_2 > 0, arg_24_1 + arg_24_2)
	end
end

function var_0_0.CheckCardBound(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = getBounds(arg_25_0.scrollrect.gameObject.transform)

	if arg_25_3 then
		local var_25_1 = getBounds(arg_25_2._tf)
		local var_25_2 = getBounds(arg_25_1._tf)

		if math.ceil(var_25_2:GetMax().x - var_25_0:GetMax().x) > var_25_1.size.x then
			local var_25_3 = arg_25_0.scrollrect:HeadIndexToValue(arg_25_4 - 1) - arg_25_0.scrollrect:HeadIndexToValue(arg_25_4)
			local var_25_4 = arg_25_0.scrollrect.value - var_25_3

			arg_25_0.scrollrect:SetNormalizedPosition(var_25_4, 0)
		end
	else
		local var_25_5 = getBounds(arg_25_1._tf)

		if getBounds(arg_25_1._tf.parent):GetMin().x < var_25_0:GetMin().x and var_25_5:GetMin().x < var_25_0:GetMin().x then
			local var_25_6 = arg_25_0.scrollrect:HeadIndexToValue(arg_25_4 - 1)

			arg_25_0.scrollrect:SetNormalizedPosition(var_25_6, 0)
		end
	end
end

function var_0_0.OnDestroy(arg_26_0)
	return
end

return var_0_0
