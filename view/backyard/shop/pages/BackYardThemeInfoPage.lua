local var_0_0 = class("BackYardThemeInfoPage", import("....base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "BackYardThemeInfoPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.scrollRect = arg_2_0:findTF("frame/list"):GetComponent("LScrollRect")
	arg_2_0.nameTxt = arg_2_0:findTF("frame/name"):GetComponent(typeof(Text))
	arg_2_0.icon = arg_2_0:findTF("frame/icon/Image"):GetComponent(typeof(Image))
	arg_2_0.desc = arg_2_0:findTF("frame/desc"):GetComponent(typeof(Text))
	arg_2_0.backBtn = arg_2_0:findTF("frame/back")
	arg_2_0.leftArrBtn = arg_2_0:findTF("arr_left")
	arg_2_0.rightArrBtn = arg_2_0:findTF("arr_right")
	arg_2_0.gemTxt = arg_2_0:findTF("res_gem/Text"):GetComponent(typeof(Text))
	arg_2_0.goldTxt = arg_2_0:findTF("res_gold/Text"):GetComponent(typeof(Text))
	arg_2_0.gemAddBtn = arg_2_0:findTF("res_gem/jiahao")
	arg_2_0.goldAddBtn = arg_2_0:findTF("res_gold/jiahao")
	arg_2_0.purchaseBtn = arg_2_0:findTF("frame/purchase_btn")
	arg_2_0.purchaseAllBtn = arg_2_0:findTF("frame/purchase_all_btn")

	setText(arg_2_0.purchaseBtn:Find("Text"), i18n("fur_onekey_buy"))
	setText(arg_2_0.purchaseAllBtn:Find("Text"), i18n("fur_all_buy"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.cards = {}

	function arg_3_0.scrollRect.onInitItem(arg_4_0)
		arg_3_0:OnInitCard(arg_4_0)
	end

	function arg_3_0.scrollRect.onUpdateItem(arg_5_0, arg_5_1)
		arg_3_0:OnUpdateCard(arg_5_0, arg_5_1)
	end

	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.purchaseBtn, function()
		arg_3_0.contextData.themeMsgBox:ExecuteAction("SetUp", arg_3_0.themeVO, arg_3_0.dorm, arg_3_0.player)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.purchaseAllBtn, function()
		arg_3_0.contextData.themeAllMsgBox:ExecuteAction("SetUp", arg_3_0.themeVO, arg_3_0.dorm, arg_3_0.player)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.leftArrBtn, function()
		if arg_3_0.OnPrevTheme then
			arg_3_0.OnPrevTheme()
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.rightArrBtn, function()
		if arg_3_0.OnNextTheme then
			arg_3_0.OnNextTheme()
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.goldAddBtn, function()
		arg_3_0:emit(NewBackYardShopMediator.ON_CHARGE, PlayerConst.ResDormMoney)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.gemAddBtn, function()
		arg_3_0:emit(NewBackYardShopMediator.ON_CHARGE, PlayerConst.ResDiamond)
	end, SFX_PANEL)
end

function var_0_0.OnPlayerUpdated(arg_14_0, arg_14_1)
	arg_14_0.player = arg_14_1

	arg_14_0:UpdateRes()
end

function var_0_0.DormUpdated(arg_15_0, arg_15_1)
	arg_15_0.dorm = arg_15_1
end

function var_0_0.FurnituresUpdated(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.dorm:GetPurchasedFurnitures()

	for iter_16_0, iter_16_1 in ipairs(arg_16_1) do
		local var_16_1 = var_16_0[iter_16_1]

		arg_16_0:OnDisplayUpdated(var_16_1)
		arg_16_0:OnCardUpdated(var_16_1)
	end

	arg_16_0:UpdatePurchaseBtn()
end

function var_0_0.OnDisplayUpdated(arg_17_0, arg_17_1)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.displays) do
		if iter_17_1.id == arg_17_1.id then
			arg_17_0.displays[iter_17_0] = arg_17_1
		end
	end
end

function var_0_0.OnCardUpdated(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.cards) do
		if iter_18_1.furniture.id == arg_18_1.id then
			iter_18_1:Update(arg_18_1)
		end
	end
end

function var_0_0.SetUp(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	arg_19_0:Show()

	arg_19_0.index = arg_19_1
	arg_19_0.dorm = arg_19_3
	arg_19_0.themeVO = arg_19_2
	arg_19_0.player = arg_19_4

	arg_19_0:InitFurnitureList()
	arg_19_0:UpdateThemeInfo()
	arg_19_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_20_0)
	arg_20_0.gemTxt.text = arg_20_0.player:getTotalGem()
	arg_20_0.goldTxt.text = arg_20_0.player:getResource(PlayerConst.ResDormMoney)
end

function var_0_0.InitFurnitureList(arg_21_0)
	local var_21_0 = arg_21_0.themeVO:GetFurnitures()
	local var_21_1 = arg_21_0.dorm:GetPurchasedFurnitures()

	arg_21_0.displays = {}

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		local var_21_2 = var_21_1[iter_21_1] or Furniture.New({
			id = iter_21_1
		})

		table.insert(arg_21_0.displays, var_21_2)
	end

	table.sort(arg_21_0.displays, function(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_0:canPurchase() and 1 or 0
		local var_22_1 = arg_22_1:canPurchase() and 1 or 0

		if var_22_0 == var_22_1 then
			return arg_22_0.id < arg_22_1.id
		else
			return var_22_1 < var_22_0
		end
	end)
	arg_21_0.scrollRect:SetTotalCount(#arg_21_0.displays)
end

function var_0_0.OnInitCard(arg_23_0, arg_23_1)
	local var_23_0 = BackYardFurnitureCard.New(arg_23_1)

	onButton(arg_23_0, var_23_0._go, function()
		if var_23_0.furniture:canPurchase() then
			arg_23_0.contextData.furnitureMsgBox:ExecuteAction("SetUp", var_23_0.furniture, arg_23_0.dorm, arg_23_0.player)
		end
	end, SFX_PANEL)

	arg_23_0.cards[arg_23_1] = var_23_0
end

function var_0_0.OnUpdateCard(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.cards[arg_25_2]

	if not var_25_0 then
		arg_25_0:OnInitCard(arg_25_2)

		var_25_0 = arg_25_0.cards[arg_25_2]
	end

	local var_25_1 = arg_25_0.displays[arg_25_1 + 1]

	var_25_0:Update(var_25_1)
end

function var_0_0.UpdateThemeInfo(arg_26_0)
	local var_26_0 = arg_26_0.themeVO

	arg_26_0.nameTxt.text = HXSet.hxLan(var_26_0:getConfig("name"))

	GetSpriteFromAtlasAsync("BackYardTheme/theme_" .. var_26_0.id, "", function(arg_27_0)
		if IsNil(arg_26_0.icon) then
			return
		end

		arg_26_0.icon.sprite = arg_27_0
	end)
	arg_26_0.icon:SetNativeSize()

	arg_26_0.desc.text = HXSet.hxLan(var_26_0:getConfig("desc"))

	arg_26_0:UpdatePurchaseBtn()
end

function var_0_0.UpdatePurchaseBtn(arg_28_0)
	local var_28_0 = arg_28_0.themeVO:GetFurnitures()
	local var_28_1 = arg_28_0.dorm:GetPurchasedFurnitures()
	local var_28_2 = _.any(var_28_0, function(arg_29_0)
		return not var_28_1[arg_29_0]
	end)

	setActive(arg_28_0.purchaseBtn, var_28_2)

	local var_28_3 = _.any(var_28_0, function(arg_30_0)
		return arg_28_0.dorm:GetOwnFurnitureCount(arg_30_0) < pg.furniture_data_template[arg_30_0].count
	end)

	setActive(arg_28_0.purchaseAllBtn, var_28_3)
end

function var_0_0.Show(arg_31_0)
	var_0_0.super.Show(arg_31_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_31_0._tf)

	if arg_31_0.OnEnter then
		arg_31_0.OnEnter()
	end
end

function var_0_0.Hide(arg_32_0)
	var_0_0.super.Hide(arg_32_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_32_0._tf, pg.UIMgr.GetInstance().UIMain)

	if arg_32_0.OnExit then
		arg_32_0.OnExit()
	end
end

function var_0_0.OnDestroy(arg_33_0)
	arg_33_0:Hide()

	for iter_33_0, iter_33_1 in pairs(arg_33_0.cards) do
		iter_33_1:Clear()
	end
end

return var_0_0
