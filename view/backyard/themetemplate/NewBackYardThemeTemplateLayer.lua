local var_0_0 = class("NewBackYardThemeTemplateLayer", import("...base.BaseUI"))

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	local function var_1_0(arg_2_0, arg_2_1)
		setActive(arg_2_0:Find("sel"), arg_2_1)
		setActive(arg_2_0:Find("unsel"), not arg_2_1)
	end

	onButton(arg_1_0, arg_1_1, function()
		if not arg_1_2() then
			return
		end

		if arg_1_0.btn then
			var_1_0(arg_1_0.btn, false)
		end

		var_1_0(arg_1_1, true)

		arg_1_0.btn = arg_1_1
	end, SFX_PANEL)
	var_1_0(arg_1_1, false)
end

function var_0_0.forceGC(arg_4_0)
	return true
end

function var_0_0.getUIName(arg_5_0)
	return "NewBackYardTemplateUI"
end

function var_0_0.getResource(arg_6_0)
	local var_6_0 = var_0_0.super.getResource(arg_6_0)

	table.insert(var_6_0, "ui/BackYardMsgBox")

	return var_6_0
end

function var_0_0.preload(arg_7_0, arg_7_1)
	_backYardThemeTemplateMsgbox = BackyardMsgBoxMgr.New()

	_backYardThemeTemplateMsgbox:Init(arg_7_0, arg_7_1)
end

function var_0_0.init(arg_8_0)
	arg_8_0.tpl = arg_8_0._tf:Find("adpter/tag/list/tpl")
	arg_8_0.container = arg_8_0._tf:Find("adpter/tag/list")
	arg_8_0.pageContainer = arg_8_0._tf:Find("pages")
	arg_8_0.backBtn = arg_8_0._tf:Find("adpter/top/fanhui")
	arg_8_0.homeBtn = arg_8_0._tf:Find("adpter/top/help")
	arg_8_0.goldTxt = arg_8_0._tf:Find("adpter/top/res_gold/Text"):GetComponent(typeof(Text))
	arg_8_0.gemTxt = arg_8_0._tf:Find("adpter/top/res_gem/Text"):GetComponent(typeof(Text))
	arg_8_0.gemAddBtn = arg_8_0._tf:Find("adpter/top/res_gem/jiahao")
	arg_8_0.goldAddBtn = arg_8_0._tf:Find("adpter/top/res_gold/jiahao")
	arg_8_0.tags = {
		[BackYardConst.THEME_TEMPLATE_TYPE_SHOP] = i18n("backyard_theme_shop_title"),
		[BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM] = i18n("backyard_theme_mine_title"),
		[BackYardConst.THEME_TEMPLATE_TYPE_COLLECTION] = i18n("backyard_theme_collection_title")
	}
	arg_8_0.listPage = BackYardThemeTemplateListPage.New(arg_8_0.pageContainer, arg_8_0.event, arg_8_0.contextData)
	arg_8_0.contextData.msgBox = BackYardThemeTemplateMsgBox.New(arg_8_0._tf, arg_8_0.event, arg_8_0.contextData)
end

function var_0_0.SetShopThemeTemplate(arg_9_0, arg_9_1)
	arg_9_0.shopThemeTemplate = arg_9_1
end

function var_0_0.ShopThemeTemplateUpdate(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.shopThemeTemplate) do
		if iter_10_1.id == arg_10_1.id then
			arg_10_0.shopThemeTemplate[iter_10_0] = arg_10_1

			break
		end
	end

	if arg_10_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
		arg_10_0.listPage:ExecuteAction("ThemeTemplateUpdate", arg_10_1)
	end
end

function var_0_0.OnShopTemplatesUpdated(arg_11_0, arg_11_1)
	arg_11_0:SetShopThemeTemplate(arg_11_1)

	if arg_11_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
		local var_11_0 = arg_11_0:GetDataForType(arg_11_0.pageType)

		arg_11_0.listPage:ExecuteAction("ThemeTemplatesUpdate", var_11_0)
	end
end

function var_0_0.OnShopTemplatesErro(arg_12_0)
	if arg_12_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
		local var_12_0 = arg_12_0:GetDataForType(arg_12_0.pageType)

		arg_12_0.listPage:ExecuteAction("ThemeTemplatesErro", var_12_0)
	end
end

function var_0_0.SetCustomThemeTemplate(arg_13_0, arg_13_1)
	arg_13_0.customThemeTemplate = arg_13_1
end

function var_0_0.CustomThemeTemplateUpdate(arg_14_0, arg_14_1)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.customThemeTemplate) do
		if iter_14_1.id == arg_14_1.id then
			arg_14_0.customThemeTemplate[iter_14_0] = arg_14_1

			break
		end
	end

	if arg_14_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM then
		arg_14_0.listPage:ExecuteAction("ThemeTemplateUpdate", arg_14_1)
	end
end

function var_0_0.SetCollectionThemeTemplate(arg_15_0, arg_15_1)
	arg_15_0.collectionThemeTemplate = arg_15_1
end

function var_0_0.CollectionThemeTemplateUpdate(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in pairs(arg_16_0.collectionThemeTemplate) do
		if iter_16_1.id == arg_16_1.id then
			arg_16_0.collectionThemeTemplate[iter_16_0] = arg_16_1

			break
		end
	end

	if arg_16_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_COLLECTION then
		arg_16_0.listPage:ExecuteAction("ThemeTemplateUpdate", arg_16_1)
	end
end

function var_0_0.SetDorm(arg_17_0, arg_17_1)
	arg_17_0.dorm = arg_17_1
end

function var_0_0.UpdateDorm(arg_18_0, arg_18_1)
	arg_18_0:SetDorm(arg_18_1)

	if arg_18_0.pageType then
		arg_18_0.listPage:ExecuteAction("UpdateDorm", arg_18_1)
	end
end

function var_0_0.SetPlayer(arg_19_0, arg_19_1)
	arg_19_0.player = arg_19_1
end

function var_0_0.PlayerUpdated(arg_20_0, arg_20_1)
	arg_20_0:SetPlayer(arg_20_1)
	arg_20_0:UpdateRes()

	if arg_20_0.pageType then
		arg_20_0.listPage:ExecuteAction("PlayerUpdated", arg_20_1)
	end
end

function var_0_0.FurnituresUpdated(arg_21_0, arg_21_1)
	if arg_21_0.pageType then
		arg_21_0.listPage:ExecuteAction("FurnituresUpdated", arg_21_1)
	end
end

function var_0_0.SearchKeyChange(arg_22_0, arg_22_1)
	if arg_22_0.pageType and (arg_22_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM or arg_22_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_COLLECTION) then
		arg_22_0.listPage:ExecuteAction("SearchKeyChange", arg_22_1)
	end
end

function var_0_0.ShopSearchKeyChange(arg_23_0, arg_23_1)
	if arg_23_0.pageType and arg_23_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
		arg_23_0.listPage:ExecuteAction("ShopSearchKeyChange", arg_23_1)
	end
end

function var_0_0.ClearShopSearchKey(arg_24_0)
	if arg_24_0.pageType and arg_24_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
		arg_24_0.listPage:ExecuteAction("ClearShopSearchKey")
	end
end

function var_0_0.DeleteCustomThemeTemplate(arg_25_0, arg_25_1)
	if not arg_25_0.customThemeTemplate then
		return
	end

	for iter_25_0, iter_25_1 in pairs(arg_25_0.customThemeTemplate) do
		if iter_25_1.id == arg_25_1 then
			arg_25_0.customThemeTemplate[iter_25_0] = nil

			break
		end
	end

	if arg_25_0.pageType and arg_25_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM then
		arg_25_0.listPage:ExecuteAction("DeleteCustomThemeTemplate", arg_25_1)
	end
end

function var_0_0.DeleteCollectionThemeTemplate(arg_26_0, arg_26_1)
	if not arg_26_0.collectionThemeTemplate then
		return
	end

	for iter_26_0, iter_26_1 in pairs(arg_26_0.collectionThemeTemplate) do
		if iter_26_1.id == arg_26_1 then
			arg_26_0.collectionThemeTemplate[iter_26_0] = nil

			break
		end
	end

	if arg_26_0.pageType and arg_26_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_COLLECTION then
		arg_26_0.listPage:ExecuteAction("DeleteCollectionThemeTemplate", arg_26_1)
	end
end

function var_0_0.DeleteShopThemeTemplate(arg_27_0, arg_27_1)
	if not arg_27_0.shopThemeTemplate then
		return
	end

	for iter_27_0, iter_27_1 in pairs(arg_27_0.shopThemeTemplate) do
		if iter_27_1.id == arg_27_1 then
			arg_27_0.shopThemeTemplate[iter_27_0] = nil

			break
		end
	end

	if arg_27_0.pageType and arg_27_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
		arg_27_0.listPage:ExecuteAction("DeleteShopThemeTemplate", arg_27_1)
	end
end

function var_0_0.AddCollectionThemeTemplate(arg_28_0, arg_28_1)
	arg_28_0.collectionThemeTemplate[arg_28_1.id] = arg_28_1

	if arg_28_0.pageType and arg_28_0.pageType == BackYardConst.THEME_TEMPLATE_TYPE_COLLECTION then
		arg_28_0.listPage:ExecuteAction("AddCollectionThemeTemplate", arg_28_1.id)
	end
end

function var_0_0.didEnter(arg_29_0)
	onButton(arg_29_0, arg_29_0.backBtn, function()
		arg_29_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_29_0, arg_29_0.homeBtn, function()
		arg_29_0:emit(var_0_0.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_29_0, arg_29_0.gemAddBtn, function()
		arg_29_0:emit(NewBackYardThemeTemplateMediator.ON_CHARGE, PlayerConst.ResDiamond)
	end, SFX_PANEL)
	onButton(arg_29_0, arg_29_0.goldAddBtn, function()
		arg_29_0:emit(NewBackYardThemeTemplateMediator.ON_CHARGE, PlayerConst.ResDormMoney)
	end, SFX_PANEL)
	seriesAsync({
		function(arg_34_0)
			arg_29_0:emit(NewBackYardThemeTemplateMediator.FETCH_ALL_THEME, arg_34_0)
		end
	}, function()
		arg_29_0:InitPages()
		arg_29_0:UpdateRes()
		arg_29_0:ActiveDefaultPage()
	end)
end

function var_0_0.InitPages(arg_36_0)
	arg_36_0.btns = {}

	for iter_36_0, iter_36_1 in pairs(arg_36_0.tags) do
		local var_36_0 = cloneTplTo(arg_36_0.tpl, arg_36_0.container)
		local var_36_1 = var_36_0:Find("unsel"):GetComponent(typeof(Image))

		var_36_1.sprite = GetSpriteFromAtlas("ui/NewBackYardShopUI_atlas", "text_tp_" .. iter_36_0)

		var_36_1:SetNativeSize()

		local var_36_2 = var_36_0:Find("sel/Text"):GetComponent(typeof(Image))

		var_36_2.sprite = GetSpriteFromAtlas("ui/NewBackYardShopUI_atlas", "text_tp_" .. iter_36_0)

		var_36_2:SetNativeSize()
		setActive(var_36_0:Find("line"), iter_36_0 ~= BackYardConst.THEME_TEMPLATE_TYPE_COLLECTION)
		var_0_1(arg_36_0, var_36_0, function()
			local var_37_0 = arg_36_0:GetDataForType(iter_36_0)

			arg_36_0.listPage:ExecuteAction("SetUp", iter_36_0, var_37_0, arg_36_0.dorm, arg_36_0.player)

			arg_36_0.pageType = iter_36_0

			return true
		end)

		arg_36_0.btns[iter_36_0] = var_36_0
	end

	setActive(arg_36_0.tpl, false)
end

function var_0_0.ActiveDefaultPage(arg_38_0)
	local var_38_0 = arg_38_0.contextData.page or BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM

	triggerButton(arg_38_0.btns[var_38_0])
end

function var_0_0.GetDataForType(arg_39_0, arg_39_1)
	if arg_39_1 == BackYardConst.THEME_TEMPLATE_TYPE_SHOP then
		local var_39_0 = {}

		for iter_39_0, iter_39_1 in pairs(arg_39_0.shopThemeTemplate) do
			table.insert(var_39_0, iter_39_1)
		end

		return var_39_0 or {}
	elseif arg_39_1 == BackYardConst.THEME_TEMPLATE_TYPE_CUSTOM then
		local var_39_1 = {}

		for iter_39_2, iter_39_3 in pairs(arg_39_0.customThemeTemplate) do
			if iter_39_3:CanDispaly() then
				table.insert(var_39_1, iter_39_3)
			end
		end

		return var_39_1
	elseif arg_39_1 == BackYardConst.THEME_TEMPLATE_TYPE_COLLECTION then
		local var_39_2 = {}

		for iter_39_4, iter_39_5 in pairs(arg_39_0.collectionThemeTemplate) do
			table.insert(var_39_2, iter_39_5)
		end

		return var_39_2 or {}
	end

	assert(false)
end

function var_0_0.UpdateRes(arg_40_0)
	arg_40_0.goldTxt.text = arg_40_0.player:getResource(PlayerConst.ResDormMoney)
	arg_40_0.gemTxt.text = arg_40_0.player:getTotalGem()
end

function var_0_0.willExit(arg_41_0)
	_backYardThemeTemplateMsgbox:Destroy()

	_backYardThemeTemplateMsgbox = nil

	arg_41_0.listPage:Destroy()
	arg_41_0.contextData.msgBox:Destroy()
	BackYardThemeTempalteUtil.ClearAllCache()
end

return var_0_0
