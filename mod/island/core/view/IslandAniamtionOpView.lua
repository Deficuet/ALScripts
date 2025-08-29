local var_0_0 = class("IslandAniamtionOpView", import(".IslandBaseSubView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandActionOpUI"
end

function var_0_0.SetUIParent(arg_2_0, arg_2_1)
	setParent(arg_2_1, arg_2_0:GetView().topContainer)
end

function var_0_0.FirstFlush(arg_3_0)
	arg_3_0.scrollrect = arg_3_0._tf:Find("frame/scrollrect"):GetComponent("LScrollRect")

	function arg_3_0.scrollrect.onInitItem(arg_4_0)
		arg_3_0:OnInitItem(arg_4_0)
	end

	function arg_3_0.scrollrect.onUpdateItem(arg_5_0, arg_5_1)
		arg_3_0:OnUpdateItem(arg_5_0, arg_5_1)
	end

	setActive(arg_3_0._go, false)
	onButton(arg_3_0, arg_3_0._go, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0._tf:Find("frame/tags/1"), function(arg_7_0)
		if arg_7_0 then
			arg_3_0:ScrollToHead(1)
		end
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0._tf:Find("frame/tags/2"), function(arg_8_0)
		if arg_8_0 then
			arg_3_0:ScrollToHead(arg_3_0.headDoubleIndex)
		end
	end, SFX_PANEL)

	arg_3_0.cards = {}
	arg_3_0.isShowing = false
	arg_3_0.isInitList = false
end

function var_0_0.OnMovePlayerBefore(arg_9_0)
	local var_9_0 = IslandConst.ANIMATION_MOVEMENT
	local var_9_1 = arg_9_0:GetView().player.animator

	if not var_9_1:GetCurrentAnimatorStateInfo(0):IsName(var_9_0) then
		local var_9_2 = Animator.StringToHash(var_9_0)

		for iter_9_0 = 1, var_9_1.layerCount do
			var_9_1:CrossFadeInFixedTime(var_9_2, 0, iter_9_0 - 1)
		end
	end
end

function var_0_0.Show(arg_10_0, arg_10_1)
	setActive(arg_10_0._go, true)

	if not arg_10_0.isInitList or arg_10_1 then
		arg_10_0:InitList()
	end

	arg_10_0.isShowing = true
end

function var_0_0.GetData(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = {}

	for iter_11_0, iter_11_1 in ipairs(pg.island_action.all) do
		local var_11_2 = pg.island_action[iter_11_1]

		if var_11_2.type == IslandConst.ANIMATION_OP_SIGNLE then
			table.insert(var_11_0, iter_11_1)
		elseif var_11_2.type == IslandConst.ANIMATION_OP_DOUBLE then
			table.insert(var_11_1, iter_11_1)
		end
	end

	return var_11_0, var_11_1
end

local function var_0_1(arg_12_0)
	local var_12_0 = {}

	for iter_12_0 = 1, #arg_12_0, 2 do
		local var_12_1 = arg_12_0[iter_12_0]
		local var_12_2 = arg_12_0[iter_12_0 + 1]

		table.insert(var_12_0, {
			var_12_1,
			var_12_2
		})
	end

	return var_12_0
end

function var_0_0.InitList(arg_13_0)
	local var_13_0, var_13_1 = arg_13_0:GetData()
	local var_13_2 = {}
	local var_13_3 = var_0_1(var_13_0)
	local var_13_4 = var_0_1(var_13_1)

	for iter_13_0, iter_13_1 in ipairs(var_13_3) do
		table.insert(var_13_2, iter_13_1)
	end

	local var_13_5 = var_13_0[#var_13_0]

	for iter_13_2, iter_13_3 in ipairs(var_13_4) do
		table.insert(var_13_2, iter_13_3)
	end

	arg_13_0.displays = var_13_2
	arg_13_0.lastSingleId = var_13_5
	arg_13_0.headDoubleIndex = #var_13_3 + 1

	arg_13_0.scrollrect:SetTotalCount(#var_13_2)

	arg_13_0.isInitList = true
end

function var_0_0.ScrollToHead(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.scrollrect:HeadIndexToValue(arg_14_1 - 1)

	arg_14_0.scrollrect:ScrollTo(var_14_0)
end

function var_0_0.OnInitItem(arg_15_0, arg_15_1)
	local var_15_0 = IslandAniamtionOpCard.New(arg_15_1)

	onButton(arg_15_0, var_15_0.item1, function()
		arg_15_0.selectedId = var_15_0.firstId

		arg_15_0:UpdateCardsSelected()
		arg_15_0:PlayAniamtion(var_15_0.firstId)
	end, SFX_PANEL)
	onButton(arg_15_0, var_15_0.item2, function()
		arg_15_0.selectedId = var_15_0.secondId

		arg_15_0:UpdateCardsSelected()
		arg_15_0:PlayAniamtion(var_15_0.secondId)
	end, SFX_PANEL)

	arg_15_0.cards[arg_15_1] = var_15_0
end

function var_0_0.PlayAniamtion(arg_18_0, arg_18_1)
	if not arg_18_1 then
		return
	end

	local var_18_0 = arg_18_0:GetView().player.animator

	if not var_18_0 then
		return
	end

	local var_18_1 = pg.island_action[arg_18_1]

	if var_18_1.type == IslandConst.ANIMATION_OP_SIGNLE then
		local var_18_2 = Animator.StringToHash(var_18_1.resource)

		for iter_18_0 = 1, var_18_0.layerCount do
			var_18_0:CrossFadeInFixedTime(var_18_2, 0.2, iter_18_0 - 1)
		end
	else
		print("coming soon.................")
	end
end

function var_0_0.UpdateCardsSelected(arg_19_0)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.cards) do
		iter_19_1:UpdateSelected(arg_19_0.selectedId)
	end
end

function var_0_0.OnUpdateItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.cards[arg_20_2]

	if not var_20_0 then
		arg_20_0:OnInitItem(arg_20_2)

		var_20_0 = arg_20_0.cards[arg_20_2]
	end

	local var_20_1 = arg_20_0.displays[arg_20_1 + 1]

	var_20_0:Update(var_20_1, arg_20_0.selectedId, arg_20_0.lastSingleId)
end

function var_0_0.Hide(arg_21_0)
	var_0_0.super.Hide(arg_21_0)
	arg_21_0:Emit(ISLAND_EVT.CLOSE_ANIMATION_OP)

	arg_21_0.isShowing = false
end

function var_0_0.OnDispose(arg_22_0)
	var_0_0.super.OnDispose(arg_22_0)

	for iter_22_0, iter_22_1 in pairs(arg_22_0.cards) do
		iter_22_1:Dispose()
	end

	arg_22_0.cards = nil
	arg_22_0.isShowing = false
end

return var_0_0
