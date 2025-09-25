local var_0_0 = class("BackYardThemePage", import(".BackYardShopBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "BackYardThemePage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0:LoadList()
	arg_2_0:LoadDetail()

	arg_2_0.largeSpLoader = BackYardLargeSpriteLoader.New(6)
end

function var_0_0.LoadList(arg_3_0)
	arg_3_0._parentTF = arg_3_0._tf.parent
	arg_3_0.adpter = arg_3_0:findTF("adpter")
	arg_3_0.themeContainer = arg_3_0:findTF("list/frame")
	arg_3_0.scrollRect = arg_3_0:findTF("list/frame/mask"):GetComponent("LScrollRect")
	arg_3_0.scrollRectWidth = arg_3_0:findTF("list/frame/mask").rect.width
	arg_3_0.searchInput = arg_3_0:findTF("adpter/search")
	arg_3_0.searchClear = arg_3_0.searchInput:Find("clear")

	setText(arg_3_0.searchInput:Find("Placeholder"), i18n("courtyard_label_search_holder"))
end

function var_0_0.LoadDetail(arg_4_0)
	arg_4_0.purchaseBtn = arg_4_0:findTF("adpter/descript/btn_goumai")
	arg_4_0.title = arg_4_0:findTF("adpter/descript/title"):GetComponent(typeof(Text))
	arg_4_0.desc = arg_4_0:findTF("adpter/descript/desc"):GetComponent(typeof(Text))
	arg_4_0.actualPrice = arg_4_0:findTF("adpter/descript/price/actual_price")
	arg_4_0.actualPriceTxt = arg_4_0:findTF("adpter/descript/price/actual_price/Text"):GetComponent(typeof(Text))
	arg_4_0.goldTxt = arg_4_0:findTF("adpter/descript/price/price/Text"):GetComponent(typeof(Text))
	arg_4_0.preview = arg_4_0:findTF("preview"):GetComponent(typeof(Image))
	arg_4_0.descript = arg_4_0:findTF("adpter/descript")
	arg_4_0.infoPage = BackYardThemeInfoPage.New(arg_4_0._tf.parent, arg_4_0.event, arg_4_0.contextData)

	function arg_4_0.infoPage.OnEnter()
		arg_4_0:UnBlurView()
	end

	function arg_4_0.infoPage.OnExit()
		arg_4_0:BlurView()
	end

	function arg_4_0.infoPage.OnPrevTheme()
		arg_4_0:OnInfoPagePrevTheme()
	end

	function arg_4_0.infoPage.OnNextTheme()
		arg_4_0:OnInfoPageNextTheme()
	end

	onButton(arg_4_0, arg_4_0.purchaseBtn, function()
		local var_9_0 = arg_4_0:GetSelectedIndex()

		arg_4_0.infoPage:ExecuteAction("SetUp", var_9_0, arg_4_0.selected, arg_4_0.dorm, arg_4_0.player)
	end, SFX_PANEL)
	setText(arg_4_0.purchaseBtn:Find("Text"), i18n("word_buy"))
end

function var_0_0.OnInit(arg_10_0)
	arg_10_0.cards = {}

	function arg_10_0.scrollRect.onInitItem(arg_11_0)
		arg_10_0:OnInitCard(arg_11_0)
	end

	function arg_10_0.scrollRect.onUpdateItem(arg_12_0, arg_12_1)
		arg_10_0:OnUpdateCard(arg_12_0, arg_12_1)
	end

	arg_10_0:InitInput()
	onButton(arg_10_0, arg_10_0.searchClear, function()
		setInputText(arg_10_0.searchInput, "")
	end, SFX_PANEL)
end

function var_0_0.InitInput(arg_14_0)
	onInputChanged(arg_14_0, arg_14_0.searchInput, function()
		local var_15_0 = getInputText(arg_14_0.searchInput)

		setActive(arg_14_0.searchClear, var_15_0 ~= "")
		arg_14_0:OnSearchKeyChange()
	end)
end

function var_0_0.GetData(arg_16_0)
	local var_16_0 = {}
	local var_16_1 = getProxy(DormProxy):GetSystemThemes()
	local var_16_2 = getInputText(arg_16_0.searchInput)
	local var_16_3 = arg_16_0.dorm:GetPurchasedFurnitures()
	local var_16_4 = {}

	for iter_16_0, iter_16_1 in ipairs(var_16_1) do
		if not iter_16_1:IsOverTime() and iter_16_1:MatchSearchKey(var_16_2) then
			table.insert(var_16_0, iter_16_1)

			var_16_4[iter_16_1.id] = iter_16_1:IsPurchased(var_16_3) and 1 or 0
		end
	end

	local var_16_5 = pg.backyard_theme_template

	local function var_16_6(arg_17_0, arg_17_1)
		if var_16_5[arg_17_0.id].hot == var_16_5[arg_17_1.id].hot then
			return var_16_5[arg_17_0.id].order > var_16_5[arg_17_1.id].order
		else
			return var_16_5[arg_17_0.id].hot > var_16_5[arg_17_1.id].hot
		end
	end

	table.sort(var_16_0, function(arg_18_0, arg_18_1)
		local var_18_0 = var_16_4[arg_18_0.id]
		local var_18_1 = var_16_4[arg_18_1.id]

		if var_18_0 == var_18_1 then
			if var_16_5[arg_18_0.id].new == var_16_5[arg_18_1.id].new then
				return var_16_6(arg_18_0, arg_18_1)
			else
				return var_16_5[arg_18_0.id].new > var_16_5[arg_18_1.id].new
			end
		else
			return var_18_0 < var_18_1
		end
	end)

	return var_16_0
end

function var_0_0.FurnituresUpdated(arg_19_0, arg_19_1)
	if arg_19_0.infoPage:GetLoaded() then
		arg_19_0.infoPage:ExecuteAction("FurnituresUpdated", arg_19_1)
	end

	if arg_19_0.card then
		arg_19_0:UpdatePrice(arg_19_0.card)
	end

	arg_19_0:InitThemeList()
end

function var_0_0.OnDormUpdated(arg_20_0)
	if arg_20_0.infoPage:GetLoaded() then
		arg_20_0.infoPage:ExecuteAction("DormUpdated", arg_20_0.dorm)
	end
end

function var_0_0.OnPlayerUpdated(arg_21_0)
	if arg_21_0.infoPage:GetLoaded() then
		arg_21_0.infoPage:ExecuteAction("OnPlayerUpdated", arg_21_0.player)
	end
end

function var_0_0.OnSetUp(arg_22_0)
	arg_22_0:InitThemeList()
	arg_22_0:BlurView()
end

function var_0_0.InitThemeList(arg_23_0)
	arg_23_0.disPlays = arg_23_0:GetData()

	onNextTick(function()
		arg_23_0.scrollRect:SetTotalCount(#arg_23_0.disPlays)
	end)
end

function var_0_0.OnSearchKeyChange(arg_25_0)
	arg_25_0:InitThemeList()
end

function var_0_0.CreateCard(arg_26_0, arg_26_1)
	return (BackYardThemeCard.New(arg_26_1))
end

function var_0_0.OnInitCard(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0:CreateCard(arg_27_1)

	onButton(arg_27_0, var_27_0._go, function()
		arg_27_0:OnCardClick(var_27_0)

		local var_28_0 = arg_27_0.selected

		arg_27_0.selected = var_27_0.themeVO

		if var_28_0 then
			for iter_28_0, iter_28_1 in pairs(arg_27_0.cards) do
				if iter_28_1.themeVO.id == var_28_0.id and iter_28_1._go.name ~= "-1" then
					preCard = iter_28_1

					break
				end
			end

			if preCard then
				preCard:UpdateSelected(arg_27_0.selected)
			end
		end

		var_27_0:UpdateSelected(arg_27_0.selected)
	end, SFX_PANEL)

	arg_27_0.cards[arg_27_1] = var_27_0
end

function var_0_0.OnUpdateCard(arg_29_0, arg_29_1, arg_29_2)
	if not arg_29_0.cards[arg_29_2] then
		arg_29_0:OnInitCard(arg_29_2)
	end

	local var_29_0 = arg_29_0.cards[arg_29_2]
	local var_29_1 = arg_29_0.dorm:GetPurchasedFurnitures()
	local var_29_2 = arg_29_0.disPlays[arg_29_1 + 1]

	var_29_0:Update(var_29_2, var_29_2:IsPurchased(var_29_1))
	var_29_0:UpdateSelected(arg_29_0.selected)

	if arg_29_0:NoSelected() and arg_29_1 == 0 then
		triggerButton(var_29_0._go)
	end
end

function var_0_0.NoSelected(arg_30_0)
	return not arg_30_0.selected or not _.any(arg_30_0.disPlays, function(arg_31_0)
		return arg_31_0.id == arg_30_0.selected.id
	end)
end

function var_0_0.OnCardClick(arg_32_0, arg_32_1)
	arg_32_0:UpdateMainPage(arg_32_1.themeVO)
end

function var_0_0.UpdateMainPage(arg_33_0, arg_33_1)
	if arg_33_1 == arg_33_0.card then
		return
	end

	local var_33_0 = arg_33_1:getConfig("name")
	local var_33_1 = string.gsub(var_33_0, "<size=%d+>", "")

	arg_33_0.title.text = string.gsub(var_33_1, "</size>", "")
	arg_33_0.desc.text = arg_33_1:getConfig("desc")

	local var_33_2 = arg_33_1:getConfig("discount")
	local var_33_3 = arg_33_1:HasDiscount()

	setActive(arg_33_0.actualPrice, var_33_3)
	arg_33_0:UpdatePrice(arg_33_1)
	arg_33_0.largeSpLoader:LoadSpriteAsync("BackYardTheme/theme_" .. arg_33_1.id, function(arg_34_0)
		if IsNil(arg_33_0.preview) then
			return
		end

		arg_33_0.preview.sprite = arg_34_0
		arg_33_0.preview.enabled = true
	end)

	arg_33_0.card = arg_33_1
end

function var_0_0.UpdatePrice(arg_35_0, arg_35_1)
	local var_35_0, var_35_1 = arg_35_0:CalcThemePrice(arg_35_1)

	arg_35_0.actualPriceTxt.text = var_35_1
	arg_35_0.goldTxt.text = var_35_0
end

function var_0_0.GetAddList(arg_36_0, arg_36_1)
	local var_36_0 = {}
	local var_36_1 = arg_36_1:GetFurnitures()
	local var_36_2 = arg_36_0.dorm:GetPurchasedFurnitures()

	for iter_36_0, iter_36_1 in ipairs(var_36_1) do
		if not var_36_2[iter_36_1] then
			table.insert(var_36_0, Furniture.New({
				id = iter_36_1
			}))
		end
	end

	return var_36_0
end

function var_0_0.CalcThemePrice(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0:GetAddList(arg_37_1)
	local var_37_1 = 0
	local var_37_2 = 0

	for iter_37_0, iter_37_1 in ipairs(var_37_0) do
		var_37_2 = var_37_2 + iter_37_1:getConfig("dorm_icon_price")
		var_37_1 = var_37_1 + iter_37_1:getPrice(PlayerConst.ResDormMoney)
	end

	return var_37_1, var_37_2
end

local function var_0_1(arg_38_0, arg_38_1)
	local var_38_0

	for iter_38_0, iter_38_1 in pairs(arg_38_0) do
		if iter_38_1.themeVO.id == arg_38_1.id then
			var_38_0 = iter_38_1

			break
		end
	end

	return var_38_0
end

local function var_0_2(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_0:HeadIndexToValue(arg_39_1)
	local var_39_1 = arg_39_0:HeadIndexToValue(arg_39_2)

	return math.abs(var_39_1 - var_39_0)
end

function var_0_0.GetSelectedIndex(arg_40_0)
	local var_40_0 = 0

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.disPlays) do
		if iter_40_1.id == arg_40_0.selected.id then
			var_40_0 = iter_40_0

			break
		end
	end

	return var_40_0
end

function var_0_0.OnSwitchToNextTheme(arg_41_0)
	local var_41_0 = arg_41_0:GetSelectedIndex()

	if var_41_0 >= #arg_41_0.disPlays then
		return false
	end

	local var_41_1 = arg_41_0.disPlays[var_41_0 + 1]
	local var_41_2 = var_0_1(arg_41_0.cards, var_41_1)

	local function var_41_3(arg_42_0)
		return go(arg_41_0.scrollRect).transform.localPosition.x + arg_41_0.scrollRectWidth / 2 < go(arg_41_0.scrollRect).transform.parent:InverseTransformPoint(arg_42_0._tf.position).x
	end

	if not var_41_2 or var_41_2 and var_41_3(var_41_2) then
		local var_41_4 = var_0_2(arg_41_0.scrollRect, 1, 2)

		arg_41_0.scrollRect:ScrollTo(arg_41_0.scrollRect.value + var_41_4, true)

		var_41_2 = var_0_1(arg_41_0.cards, var_41_1)
	end

	if var_41_2 then
		triggerButton(var_41_2._go)
	end

	return true
end

function var_0_0.OnSwitchToPrevTheme(arg_43_0)
	local var_43_0 = arg_43_0:GetSelectedIndex()

	if var_43_0 <= 1 then
		return false
	end

	local var_43_1 = arg_43_0.disPlays[var_43_0 - 1]
	local var_43_2 = var_0_1(arg_43_0.cards, var_43_1)

	local function var_43_3(arg_44_0)
		return go(arg_43_0.scrollRect).transform.localPosition.x - arg_43_0.scrollRectWidth / 2 > go(arg_43_0.scrollRect).transform.parent:InverseTransformPoint(arg_44_0._tf.position).x
	end

	if not var_43_2 or var_43_2 and var_43_3(var_43_2) then
		local var_43_4 = var_0_2(arg_43_0.scrollRect, 1, 2)

		arg_43_0.scrollRect:ScrollTo(arg_43_0.scrollRect.value - var_43_4, true)

		var_43_2 = var_0_1(arg_43_0.cards, var_43_1)
	end

	if var_43_2 then
		triggerButton(var_43_2._go)
	end

	return true
end

function var_0_0.OnInfoPagePrevTheme(arg_45_0)
	if arg_45_0:OnSwitchToPrevTheme() then
		triggerButton(arg_45_0.purchaseBtn)
	end
end

function var_0_0.OnInfoPageNextTheme(arg_46_0)
	if arg_46_0:OnSwitchToNextTheme() then
		triggerButton(arg_46_0.purchaseBtn)
	end
end

function var_0_0.Hide(arg_47_0)
	var_0_0.super.Hide(arg_47_0)
	arg_47_0:UnBlurView()
end

function var_0_0.BlurView(arg_48_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_48_0.adpter, {
		pbList = {
			arg_48_0:findTF("adpter/descript")
		}
	})
end

function var_0_0.UnBlurView(arg_49_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_49_0.adpter, arg_49_0._tf)
end

function var_0_0.OnDestroy(arg_50_0)
	if arg_50_0.largeSpLoader then
		arg_50_0.largeSpLoader:Dispose()

		arg_50_0.largeSpLoader = nil
	end

	if arg_50_0.infoPage then
		arg_50_0.infoPage.OnExit = nil
		arg_50_0.infoPage.OnEnter = nil
		arg_50_0.infoPage.OnPrevTheme = nil
		arg_50_0.infoPage.OnNextTheme = nil

		arg_50_0.infoPage:Destroy()
	end

	for iter_50_0, iter_50_1 in pairs(arg_50_0.cards or {}) do
		iter_50_1:Dispose()
	end

	arg_50_0.cards = nil

	arg_50_0:Hide()
end

return var_0_0
