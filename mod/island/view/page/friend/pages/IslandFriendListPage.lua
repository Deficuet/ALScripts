local var_0_0 = class("IslandFriendListPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandFriendListUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.morePanel = arg_2_0:findTF("scrollrect/content/more_panel")
	arg_2_0.whiteBtn = arg_2_0.morePanel:Find("white")
	arg_2_0.blackBtn = arg_2_0.morePanel:Find("black")
	arg_2_0.delBtn = arg_2_0.morePanel:Find("del")
	arg_2_0.cards = {}
	arg_2_0._scrollrect = arg_2_0:findTF("scrollrect"):GetComponent("LScrollRect")

	function arg_2_0._scrollrect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0._scrollrect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	setText(arg_2_0.morePanel:Find("white/Text"), i18n("island_whiteList"))
	setText(arg_2_0.morePanel:Find("black/Text"), i18n("island_blackList"))

	if arg_2_0.delBtn then
		setText(arg_2_0.morePanel:Find("del/Text"), i18n("island_btn_label_del"))
	end
end

function var_0_0.CreateCard(arg_5_0, arg_5_1)
	return IslandFriendCard.New(arg_5_1)
end

function var_0_0.OnInitItem(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0:CreateCard(arg_6_1)

	onButton(arg_6_0, var_6_0.visitBtn, function()
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandVisit(playerId))
		arg_6_0:emit(IslandMediator.ENTER_ISLAND, var_6_0.player.id)
	end, SFX_PANEL)
	onButton(arg_6_0, var_6_0.moreBtn, function()
		if arg_6_0.isOpenMore then
			arg_6_0:CloseMorePanel()
		else
			local var_8_0 = var_6_0.moreBtn.parent.parent:InverseTransformPoint(var_6_0.moreBtn.position)

			arg_6_0:OpenMorePanel(var_6_0.player, var_8_0)
		end
	end, SFX_PANEL)

	arg_6_0.cards[arg_6_1] = var_6_0
end

function var_0_0.OpenMorePanel(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.isOpenMore = true

	setActive(arg_9_0.morePanel, true)
	arg_9_0.morePanel:SetAsLastSibling()

	arg_9_0.morePanel.localPosition = arg_9_2 - Vector3(110, 0, 0)
	arg_9_0.whiteBtn = arg_9_0.morePanel:Find("white")
	arg_9_0.blackBtn = arg_9_0.morePanel:Find("black")
	arg_9_0.delBtn = arg_9_0.morePanel:Find("del")

	arg_9_0:InitMoreBtns(arg_9_1)
end

function var_0_0.InitMoreBtns(arg_10_0, arg_10_1)
	onButton(arg_10_0, arg_10_0.whiteBtn, function()
		arg_10_0:emit(IslandMediator.ADD_WHITE_LIST, arg_10_1.id)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.blackBtn, function()
		arg_10_0:emit(IslandMediator.ADD_BLACK_LIST, arg_10_1.id)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.delBtn, function()
		arg_10_0:emit(IslandMediator.REMOVE_FRIEND, arg_10_1.id)
	end, SFX_PANEL)
end

function var_0_0.CloseMorePanel(arg_14_0)
	arg_14_0.isOpenMore = false

	setActive(arg_14_0.morePanel, false)
end

function var_0_0.OnUpdateItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.cards[arg_15_2]

	if not var_15_0 then
		arg_15_0:OnInitItem(arg_15_2)

		var_15_0 = arg_15_0.cards[arg_15_2]
	end

	local var_15_1 = arg_15_0.displays[arg_15_1 + 1]

	var_15_0:Update(var_15_1)
end

function var_0_0.Show(arg_16_0)
	var_0_0.super.Show(arg_16_0)
	arg_16_0:InitList()
end

function var_0_0.Hide(arg_17_0)
	var_0_0.super.Hide(arg_17_0)

	if arg_17_0.isOpenMore then
		arg_17_0:CloseMorePanel()
	end
end

function var_0_0.Flush(arg_18_0)
	arg_18_0:InitList()
end

function var_0_0.GetData(arg_19_0, arg_19_1)
	local var_19_0 = getProxy(FriendProxy):getAllFriends()

	if #var_19_0 <= 0 then
		return arg_19_1({})
	end

	local var_19_1 = {}

	for iter_19_0, iter_19_1 in pairs(var_19_0) do
		table.insert(var_19_1, iter_19_1.id)
	end

	arg_19_0:emit(IslandMediator.GET_GIFT_TAG, var_19_1, function()
		arg_19_1(var_19_0)
	end)
end

function var_0_0.InitList(arg_21_0)
	pg.UIMgr.GetInstance():LoadingOn()
	arg_21_0:GetData(function(arg_22_0)
		pg.UIMgr.GetInstance():LoadingOff()

		arg_21_0.displays = arg_22_0

		arg_21_0._scrollrect:SetTotalCount(#arg_21_0.displays)
	end)
end

function var_0_0.OnDestroy(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.cards) do
		iter_23_1:Dispose()
	end

	arg_23_0.cards = nil
end

return var_0_0
