local var_0_0 = class("AtelierCompositeScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AtelierCompositeUI"
end

local var_0_1 = import("model.vo.AtelierFormula")
local var_0_2 = import("model.vo.AtelierFormulaCircle")
local var_0_3 = import("Mgr.Pool.PoolPlural")

var_0_0.FilterAll = bit.bor(1, 2, 4)

function var_0_0.Ctor(arg_2_0, ...)
	var_0_0.super.Ctor(arg_2_0, ...)

	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.init(arg_3_0)
	arg_3_0.layerEmpty = arg_3_0._tf:Find("Empty")
	arg_3_0.layerFormula = arg_3_0._tf:Find("FormulaList")
	arg_3_0.painting = arg_3_0._tf:Find("Painting")
	arg_3_0.chat = arg_3_0.painting:Find("Chat")
	arg_3_0.layerFormulaDetail = arg_3_0._tf:Find("FormulaDetail")
	arg_3_0.layerFormulaOverlay = arg_3_0.layerFormulaDetail:Find("Overlay")
	arg_3_0.layerMaterialSelect = arg_3_0.layerFormulaOverlay:Find("AvaliableMaterials")
	arg_3_0.layerCompositeConfirm = arg_3_0._tf:Find("CompositeConfirmWindow")
	arg_3_0.layerCompositeResult = arg_3_0._tf:Find("CompositeResultWindow")
	arg_3_0.layerStoreHouse = arg_3_0._tf:Find("StoreHouseWindow")
	arg_3_0.layerMaterialsPreview = arg_3_0._tf:Find("FormulaMaterialsPreview")
	arg_3_0.top = arg_3_0._tf:Find("Top")
	arg_3_0.formulaRect = arg_3_0.layerFormula:Find("Frame/ScrollView"):GetComponent("LScrollRect")

	local var_3_0 = arg_3_0.layerFormula:Find("Frame/Item")

	setActive(var_3_0, false)

	function arg_3_0.formulaRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_3_0:UpdateFormulaItem(arg_4_0 + 1, arg_4_1)
	end

	arg_3_0.formulaFilterButtons = _.map({
		1,
		2,
		3
	}, function(arg_5_0)
		return arg_3_0.layerFormula:Find("Frame/Tabs"):GetChild(arg_5_0 - 1)
	end)
	arg_3_0.candicatesRect = arg_3_0.layerMaterialSelect:Find("Frame/List"):GetComponent("LScrollRect")

	local var_3_1 = arg_3_0.layerMaterialSelect:Find("Frame/Item")

	setActive(var_3_1, false)

	function arg_3_0.candicatesRect.onUpdateItem(arg_6_0, arg_6_1)
		arg_3_0:UpdateCandicateItem(arg_6_0 + 1, arg_6_1)
	end

	arg_3_0.storehouseRect = arg_3_0.layerStoreHouse:Find("Window/ScrollView"):GetComponent("LScrollRect")

	local var_3_2 = arg_3_0.layerStoreHouse:Find("Window/ScrollView/Item")

	setActive(var_3_2, false)
	setActive(arg_3_0.layerFormula, false)
	setActive(arg_3_0.layerFormulaDetail, false)
	setActive(arg_3_0.layerMaterialSelect, false)
	setActive(arg_3_0.layerEmpty, false)
	setActive(arg_3_0.layerStoreHouse, false)
	setActive(arg_3_0.chat, false)
	pg.ViewUtils.SetSortingOrder(arg_3_0._tf:Find("Mask/BG"):GetChild(0), -1)
	setText(arg_3_0._tf:Find("Empty/Bar/Text"), i18n("ryza_tip_composite_unlock"))
	setText(arg_3_0.layerFormula:Find("Frame/Filter/Text"), i18n("ryza_toggle_only_composite"))
	setText(arg_3_0.layerFormula:Find("Frame/Empty"), i18n("ryza_tip_no_recipe"))
	setText(arg_3_0.layerFormula:Find("Frame/Item/Lock/Text"), i18n("ryza_tip_unlock_all_tools"))
	setText(arg_3_0.layerFormula:Find("Bar/Text"), i18n("ryza_tip_select_recipe"))
	setText(arg_3_0.layerStoreHouse:Find("Window/Empty"), i18n("ryza_tip_no_item"))
	setText(arg_3_0.layerCompositeResult:Find("Window/CountBG/Tip"), i18n("ryza_composite_count"))
	setText(arg_3_0.layerMaterialsPreview:Find("Frame/Text"), i18n("ryza_tip_item_access"))
	setText(var_3_1:Find("IconBG/Lack/Text"), i18n("ryza_ui_show_acess"))
end

function var_0_0.SetEnabled(arg_7_0, arg_7_1)
	arg_7_0.unlockSystem = arg_7_1
end

function var_0_0.SetActivity(arg_8_0, arg_8_1)
	arg_8_0.activity = arg_8_1
end

local var_0_4 = "ui/AtelierCompositeUI_atlas"
local var_0_5 = "ui/AtelierCommonUI_atlas"

function var_0_0.preload(arg_9_0, arg_9_1)
	table.ParallelIpairsAsync({
		var_0_4,
		var_0_5
	}, function(arg_10_0, arg_10_1, arg_10_2)
		arg_9_0.loader:LoadBundle(arg_10_1, arg_10_2)
	end, arg_9_1)
end

function var_0_0.getResource(arg_11_0)
	local var_11_0 = var_0_0.super.getResource(arg_11_0)
	local var_11_1 = {
		var_0_4,
		var_0_5,
		"ui/laisha_ui_huo_o",
		"ui/laisha_ui_huo_6",
		"ui/laisha_ui_bing_o",
		"ui/laisha_ui_bing_6",
		"ui/laisha_ui_lei_o",
		"ui/laisha_ui_lei_6",
		"ui/laisha_ui_feng_o",
		"ui/laisha_ui_feng_6",
		"ui/laisha_ui_sairen_o",
		"ui/laisha_ui_sairen_6",
		"ui/laisha_ui_wupinshanguang",
		"ui/laisha_ui_jiesuo",
		"ui/laisha_ui_lianjie01",
		"ui/laisha_ui_lianjie02",
		"ui/laisha_ui_lianjie_qiehuan",
		"ui/laisha_ui_wupinzhiru",
		"ui/laisha_ui_baoshi"
	}

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		if noEmptyStr(iter_11_1) and not table.contains(var_11_0, iter_11_1) then
			table.insert(var_11_0, iter_11_1)
		end
	end

	return var_11_0
end

function var_0_0.didEnter(arg_12_0)
	arg_12_0.contextData.filterType = var_0_0.FilterAll

	table.Foreach(arg_12_0.formulaFilterButtons, function(arg_13_0, arg_13_1)
		onButton(arg_12_0, arg_13_1, function()
			if arg_12_0.contextData.filterType == var_0_0.FilterAll then
				arg_12_0.contextData.filterType = bit.lshift(1, arg_13_0 - 1)
			else
				arg_12_0.contextData.filterType = bit.bxor(arg_12_0.contextData.filterType, bit.lshift(1, arg_13_0 - 1))

				if arg_12_0.contextData.filterType == 0 then
					arg_12_0.contextData.filterType = var_0_0.FilterAll
				end
			end

			arg_12_0:UpdateFilterButtons()
			arg_12_0:FilterFormulas()
			arg_12_0:UpdateFormulaList()
		end, SFX_PANEL)
	end)
	onToggle(arg_12_0, arg_12_0.layerFormula:Find("Frame/Filter/Toggle"), function(arg_15_0)
		arg_12_0.showOnlyComposite = arg_15_0

		arg_12_0:FilterFormulas()
		arg_12_0:UpdateFormulaList()
	end)
	onButton(arg_12_0, arg_12_0.layerFormulaOverlay:Find("Description/List"), function()
		arg_12_0:HideFormulaDetail()

		arg_12_0.contextData.formulaId = nil

		arg_12_0:ShowFormulaList()
	end)
	onButton(arg_12_0, arg_12_0._tf:Find("Top/Back"), function()
		arg_12_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0._tf:Find("Top/Home"), function()
		arg_12_0:quickExitFunc()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0._tf:Find("Top/Help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("ryza_composite_help_tip")
		})
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.layerMaterialSelect:Find("BG"), function()
		arg_12_0:CloseCandicatePanel()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0.layerCompositeConfirm:Find("BG"), function()
		arg_12_0:HideCompositeConfirmWindow()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0.layerCompositeConfirm:Find("Window/Cancel"), function()
		arg_12_0:HideCompositeConfirmWindow()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0.layerCompositeResult:Find("BG"), function()
		arg_12_0:HideCompositeResult()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0._tf:Find("Top/StoreHouse"), function()
		arg_12_0.contextData.showStoreHouse = true

		arg_12_0:ShowStoreHouseWindow()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.layerStoreHouse:Find("Window/Close"), function()
		arg_12_0:CloseStoreHouseWindow()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0.layerStoreHouse:Find("BG"), function()
		arg_12_0:CloseStoreHouseWindow()
	end, SFX_CANCEL)
	onButton(arg_12_0, arg_12_0.layerMaterialsPreview:Find("BG"), function()
		arg_12_0:HideMaterialsPreview()
	end, SFX_CANCEL)
	pg.UIMgr.GetInstance():OverlayPanel(arg_12_0.top)

	if not arg_12_0.unlockSystem then
		setActive(arg_12_0.layerEmpty, true)
		setActive(arg_12_0.painting, false)
	else
		if arg_12_0.contextData.formulaId then
			local var_12_0 = arg_12_0.activity:GetFormulas()[arg_12_0.contextData.formulaId]

			arg_12_0:ShowFormulaDetail(var_12_0)
		else
			arg_12_0:DispalyChat({
				"ryza_atellier1"
			})
			arg_12_0:ShowFormulaList()
		end

		if arg_12_0.contextData.showStoreHouse then
			arg_12_0:ShowStoreHouseWindow()
		end
	end

	if arg_12_0.unlockSystem and PlayerPrefs.GetInt("first_enter_ryza_atelier_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0 then
		triggerButton(arg_12_0._tf:Find("Top/Help"))
		PlayerPrefs.SetInt("first_enter_ryza_atelier_" .. getProxy(PlayerProxy):getRawData().id, 1)
	end
end

function var_0_0.onBackPressed(arg_28_0)
	if arg_28_0.animating then
		return true
	end

	if arg_28_0:CloseStoreHouseWindow() then
		return true
	end

	if arg_28_0:HideMaterialsPreview() then
		return true
	end

	if arg_28_0:HideCompositeResult() then
		return true
	end

	if arg_28_0:HideCompositeConfirmWindow() then
		return true
	end

	if arg_28_0:HideCandicatePanel() then
		return true
	end

	if arg_28_0:HideFormulaDetail() then
		arg_28_0.contextData.formulaId = nil

		arg_28_0:ShowFormulaList()

		return true
	end

	arg_28_0:emit(var_0_0.ON_BACK_PRESSED)
end

function var_0_0.UpdateFilterButtons(arg_29_0)
	table.Foreach(arg_29_0.formulaFilterButtons, function(arg_30_0, arg_30_1)
		local var_30_0 = arg_29_0.contextData.filterType ~= var_0_0.FilterAll

		var_30_0 = var_30_0 and bit.band(arg_29_0.contextData.filterType, bit.lshift(1, arg_30_0 - 1)) > 0

		setActive(arg_30_1:Find("Selected"), var_30_0)
	end)
end

function var_0_0.AddIdleTimer(arg_31_0)
	arg_31_0:RemoveIdleTimer()

	arg_31_0.idleTimer = Timer.New(function()
		arg_31_0:DispalyChat({
			"ryza_atellier1"
		})
		arg_31_0:AddIdleTimer()
	end, 8 + math.random() * 4)

	arg_31_0.idleTimer:Start()
end

function var_0_0.RemoveIdleTimer(arg_33_0)
	if not arg_33_0.idleTimer then
		return
	end

	arg_33_0.idleTimer:Stop()

	arg_33_0.idleTimer = nil
end

function var_0_0.ShowFormulaList(arg_34_0)
	arg_34_0:AddIdleTimer()
	setActive(arg_34_0.layerFormula, true)
	setParent(arg_34_0.layerFormula, arg_34_0.top)
	arg_34_0.layerFormula:SetSiblingIndex(0)
	arg_34_0:UpdateFilterButtons()
	arg_34_0:FilterFormulas()
	arg_34_0:UpdateFormulaList()
end

function var_0_0.HideFormulaList(arg_35_0)
	if not arg_35_0.layerFormula then
		return
	end

	arg_35_0:RemoveIdleTimer()
	setParent(arg_35_0.layerFormula, arg_35_0._tf)
	setActive(arg_35_0.layerFormula, false)

	return true
end

function var_0_0.FilterFormulas(arg_36_0)
	arg_36_0.filterFormulas = {}

	local var_36_0 = arg_36_0.contextData.filterType

	local function var_36_1(arg_37_0)
		if var_36_0 == var_0_0.FilterAll then
			return true
		end

		return switch(arg_37_0:GetType(), {
			[var_0_1.TYPE.EQUIP] = function()
				return bit.band(var_36_0, 1) > 0
			end,
			[var_0_1.TYPE.ITEM] = function()
				return bit.band(var_36_0, 2) > 0
			end,
			[var_0_1.TYPE.TOOL] = function()
				return bit.band(var_36_0, 4) > 0
			end,
			[var_0_1.TYPE.OTHER] = function()
				return bit.band(var_36_0, 4) > 0
			end
		})
	end

	for iter_36_0, iter_36_1 in ipairs(_.values(arg_36_0.activity:GetFormulas())) do
		if var_36_1(iter_36_1) and (not arg_36_0.showOnlyComposite or iter_36_1:IsAvaliable() and var_0_1.IsFormualCanComposite(iter_36_1, arg_36_0.activity)) then
			table.insert(arg_36_0.filterFormulas, iter_36_1)
		end
	end

	local function var_36_2(arg_42_0, arg_42_1)
		local var_42_0 = {
			function(arg_43_0)
				return arg_43_0:IsAvaliable() and 0 or 1
			end,
			function(arg_44_0)
				if arg_44_0:GetType() ~= var_0_1.TYPE.TOOL and not arg_36_0.activity:IsCompleteAllTools() then
					return 1
				else
					return 0
				end
			end,
			function(arg_45_0)
				return arg_45_0:GetConfigID()
			end
		}

		for iter_42_0, iter_42_1 in ipairs(var_42_0) do
			local var_42_1 = iter_42_1(arg_42_0)
			local var_42_2 = iter_42_1(arg_42_1)

			if var_42_1 ~= var_42_2 then
				return var_42_1 < var_42_2
			end
		end

		return false
	end

	table.sort(arg_36_0.filterFormulas, var_36_2)
end

function var_0_0.UpdateFormulaList(arg_46_0)
	local var_46_0 = #arg_46_0.filterFormulas == 0

	setActive(arg_46_0.layerFormula:Find("Frame/Empty"), var_46_0)
	setActive(arg_46_0.layerFormula:Find("Frame/ScrollView"), not var_46_0)
	arg_46_0.formulaRect:SetTotalCount(#arg_46_0.filterFormulas)
end

local var_0_6 = {
	[var_0_1.TYPE.EQUIP] = "ryza_word_equip",
	[var_0_1.TYPE.ITEM] = "word_item",
	[var_0_1.TYPE.TOOL] = "word_tool",
	[var_0_1.TYPE.OTHER] = "word_other"
}

function var_0_0.UpdateFormulaItem(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = tf(arg_47_2)
	local var_47_1 = arg_47_0.filterFormulas[arg_47_1]
	local var_47_2 = var_47_1:GetProduction()

	arg_47_0:UpdateRyzaDrop(var_47_0:Find("BG/Icon"), {
		type = var_47_2[1],
		id = var_47_2[2]
	}, true)

	local var_47_3 = var_0_6[var_47_1:GetType()]
	local var_47_4 = var_47_1:GetType() ~= var_0_1.TYPE.TOOL and not arg_47_0.activity:IsCompleteAllTools()

	setActive(var_47_0:Find("Lock"), var_47_4)
	setActive(var_47_0:Find("BG"), not var_47_4)
	setText(var_47_0:Find("BG/Type"), i18n(var_47_3))
	setScrollText(var_47_0:Find("BG/Name/Text"), var_47_1:GetName())

	local var_47_5

	if var_47_1:GetMaxLimit() > 0 then
		var_47_5 = var_47_1:GetMaxLimit() - var_47_1:GetUsedCount() .. "/" .. var_47_1:GetMaxLimit()
	else
		var_47_5 = "∞"
	end

	local var_47_6 = var_47_1:IsAvaliable()

	setActive(var_47_0:Find("BG/Count"), var_47_6)
	setActive(var_47_0:Find("Completed"), not var_47_6)

	if var_47_6 then
		local var_47_7 = var_0_1.IsFormualCanComposite(var_47_1, arg_47_0.activity)
		local var_47_8 = SummerFeastScene.TransformColor(var_47_7 and "4fb3a3" or "d55a54")

		setTextColor(var_47_0:Find("BG/Count"), var_47_8)
	end

	setText(var_47_0:Find("BG/Count"), var_47_5)
	onButton(arg_47_0, var_47_0, function()
		if not var_47_6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_composite_invalid"))

			return
		end

		if var_47_4 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_unlock_all_tools"))

			return
		end

		arg_47_0:HideFormulaList()
		arg_47_0:ShowFormulaDetail(var_47_1)
		arg_47_0:DispalyChat({
			"ryza_atellier2",
			"ryza_atellier3",
			"ryza_atellier4"
		})
		pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/ryza_atellier_ui_1")
	end, SFX_PANEL)
end

function var_0_0.UpdateRyzaDrop(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	updateDrop(arg_49_1, arg_49_2)
	SetCompomentEnabled(arg_49_1:Find("icon_bg"), typeof(Image), false)
	setActive(arg_49_1:Find("bg"), false)
	setActive(arg_49_1:Find("icon_bg/frame"), false)
	setActive(arg_49_1:Find("icon_bg/stars"), false)

	local var_49_0 = arg_49_2:getConfig("rarity")

	if arg_49_2.type == DROP_TYPE_EQUIP or arg_49_2.type == DROP_TYPE_EQUIPMENT_SKIN then
		var_49_0 = var_49_0 - 1
	end

	local var_49_1 = "icon_frame_" .. var_49_0

	if arg_49_3 then
		var_49_1 = var_49_1 .. "_small"
	end

	arg_49_0.loader:GetSpriteQuiet(var_0_5, var_49_1, arg_49_1)

	if arg_49_2.type == DROP_TYPE_EQUIP or arg_49_2.type == DROP_TYPE_SPWEAPON then
		onButton(arg_49_0, arg_49_1, function()
			arg_49_0:emit(var_0_0.ON_DROP, arg_49_2)
		end, SFX_PANEL)
	else
		removeOnButton(arg_49_1)
	end
end

local var_0_7 = {
	[var_0_2.TYPE.BASE] = "circle",
	[var_0_2.TYPE.NORMAL] = "hexagon",
	[var_0_2.TYPE.SAIREN] = "doubleHexagon",
	[var_0_2.TYPE.ANY] = "anyHexagon"
}

function var_0_0.ShowFormulaDetail(arg_51_0, arg_51_1)
	setActive(arg_51_0.layerFormulaDetail, true)
	setParent(arg_51_0.layerFormulaOverlay, arg_51_0.top)
	arg_51_0.layerFormulaOverlay:SetSiblingIndex(0)
	setParent(arg_51_0.painting, arg_51_0.layerFormulaOverlay)
	arg_51_0.painting:SetSiblingIndex(0)

	if not arg_51_0.nodePools then
		arg_51_0.nodePools = {
			circle = var_0_3.New(arg_51_0.layerFormulaDetail:Find("CircleNode").gameObject, 100),
			hexagon = var_0_3.New(arg_51_0.layerFormulaDetail:Find("HexagonNode").gameObject, 100),
			anyHexagon = var_0_3.New(arg_51_0.layerFormulaDetail:Find("AnyHexagonNode").gameObject, 100),
			doubleHexagon = var_0_3.New(arg_51_0.layerFormulaDetail:Find("DoubleHexagonNode").gameObject, 100)
		}

		table.Foreach(arg_51_0.nodePools, function(arg_52_0, arg_52_1)
			setActive(arg_52_1.prefab, false)
		end)
	end

	arg_51_0.pluralRoot = arg_51_0.pluralRoot or pg.PoolMgr.GetInstance().root
	arg_51_0.nodeList = arg_51_0.nodeList or {}

	_.each(arg_51_0.nodeList, function(arg_53_0)
		local var_53_0 = arg_51_0.nodePools[var_0_7[arg_53_0.Data:GetType()]]
		local var_53_1 = tf(arg_53_0.GO)

		SetCompomentEnabled(var_53_1:Find("Item"), typeof(Image), false)
		arg_51_0.loader:ClearRequest(var_53_1:Find("Ring"))
		table.Foreach(arg_53_0.links, function(arg_54_0)
			local var_54_0 = var_53_1:Find("Links/" .. arg_54_0)

			arg_51_0.loader:ClearRequest(var_54_0)
		end)
		arg_51_0.loader:ClearRequest(var_53_1)

		if not var_53_0:Enqueue(go(arg_53_0.GO)) then
			setParent(go(arg_53_0.GO), arg_51_0.pluralRoot)
			setActive(go(arg_53_0.GO), false)
		end
	end)
	table.clean(arg_51_0.nodeList)
	arg_51_0:InitFormula(arg_51_1)
end

function var_0_0.HideFormulaDetail(arg_55_0)
	if not isActive(arg_55_0.layerFormulaDetail) then
		return
	end

	arg_55_0:HideCandicatePanel()
	setParent(arg_55_0.painting, arg_55_0._tf)
	arg_55_0.painting:SetSiblingIndex(1)
	setParent(arg_55_0.layerFormulaOverlay, arg_55_0.layerFormulaDetail)
	setActive(arg_55_0.layerFormulaDetail, false)

	return true
end

local var_0_8 = {
	{
		0,
		1
	},
	{
		-1,
		1
	},
	{
		-1,
		0
	},
	{
		0,
		-1
	},
	{
		1,
		-1
	},
	{
		1,
		0
	}
}
local var_0_9 = {
	[var_0_1.TYPE.EQUIP] = "text_equip",
	[var_0_1.TYPE.ITEM] = "text_item",
	[var_0_1.TYPE.TOOL] = "text_other",
	[var_0_1.TYPE.OTHER] = "text_other"
}

function var_0_0.InitFormula(arg_56_0, arg_56_1)
	arg_56_0.contextData.formulaId = arg_56_1:GetConfigID()

	local var_56_0 = arg_56_0.layerFormulaOverlay:Find("Description")

	arg_56_0.loader:GetSpriteQuiet(var_0_4, var_0_9[arg_56_1:GetType()], var_56_0:Find("Type"))

	local var_56_1 = {
		type = arg_56_1:GetProduction()[1],
		id = arg_56_1:GetProduction()[2]
	}

	arg_56_0:UpdateRyzaDrop(var_56_0:Find("Icon"), var_56_1)
	setText(var_56_0:Find("Name"), arg_56_1:GetName())
	setText(var_56_0:Find("Description/Text"), arg_56_1:GetDesc())

	local var_56_2 = tostring(arg_56_1:GetMaxLimit() - arg_56_1:GetUsedCount())

	if arg_56_1:GetMaxLimit() < 0 then
		var_56_2 = "∞"
	end

	setText(var_56_0:Find("RestCount/Text"), i18n("ryza_rest_produce_count", var_56_2))
	setActive(arg_56_0.layerMaterialSelect, false)

	local var_56_3 = arg_56_0.layerFormulaDetail:Find("ScrollView/Content")

	setAnchoredPosition(var_56_3, Vector2.zero)
	_.each(arg_56_1:GetCircleList(), function(arg_57_0)
		local var_57_0 = var_0_2.New({
			configId = arg_57_0
		})
		local var_57_1 = arg_56_0.nodePools[var_0_7[var_57_0:GetType()]]:Dequeue()

		var_57_1.name = arg_57_0

		setActive(var_57_1, true)
		setParent(tf(var_57_1), var_56_3)

		local var_57_2 = {
			Change = true,
			Data = var_57_0,
			GO = var_57_1
		}

		table.insert(arg_56_0.nodeList, var_57_2)
	end)

	local var_56_4 = 280
	local var_56_5 = math.deg2Rad * 30
	local var_56_6 = var_56_4 * Vector2.New(math.cos(var_56_5), math.sin(var_56_5))
	local var_56_7 = var_56_4 * Vector2(0, 1)
	local var_56_8 = Vector2.zero

	local function var_56_9(arg_58_0, arg_58_1)
		setAnchoredPosition(arg_58_0.GO, arg_58_1)

		local var_58_0 = arg_58_0.Data:GetNeighbors()

		arg_58_0.links = {}

		_.each(var_58_0, function(arg_59_0)
			local var_59_0 = arg_59_0[1]
			local var_59_1 = arg_59_0[2]
			local var_59_2 = var_0_8[var_59_0]
			local var_59_3 = var_59_2[1] * var_56_6 + var_59_2[2] * var_56_7
			local var_59_4 = _.detect(arg_56_0.nodeList, function(arg_60_0)
				return arg_60_0.Data:GetConfigID() == var_59_1
			end)

			var_59_4.prevLink = {
				(var_59_0 + 2) % 5 + 1,
				arg_58_0
			}
			arg_58_0.links[var_59_0] = var_59_4

			local var_59_5 = arg_58_1 + var_59_3

			var_56_9(var_59_4, var_59_5)

			var_56_8 = Vector2.Max(var_56_8, -var_59_5)
			var_56_8 = Vector2.Max(var_56_8, var_59_5)
		end)
	end

	var_56_9(arg_56_0.nodeList[1], Vector2.zero)
	setSizeDelta(var_56_3, (var_56_8 + Vector2.New(var_56_4, var_56_4)) * 2)
	onButton(arg_56_0, arg_56_0.layerFormulaDetail:Find("Composite"), function()
		if not _.all(arg_56_0.nodeList, function(arg_62_0)
			return arg_62_0.Instance
		end) then
			arg_56_0:ShowMaterialsPreview()

			return
		end

		if not arg_56_0.activity:GetFormulas()[arg_56_0.contextData.formulaId]:IsAvaliable() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_composite_invalid"))

			return
		end

		arg_56_0:ShowCompositeConfirmWindow()
	end, SFX_PANEL)
	onButton(arg_56_0, arg_56_0.layerFormulaDetail:Find("AutoFill"), function()
		local var_63_0 = {}
		local var_63_1 = arg_56_0.activity:GetItems()

		local function var_63_2(arg_64_0)
			local var_64_0 = var_63_0[arg_64_0:GetConfigID()] or Clone(var_63_1[arg_64_0:GetConfigID()])

			assert(var_64_0, "Using Unexist material")

			var_64_0.count = var_64_0.count - 1
			var_63_0[arg_64_0:GetConfigID()] = var_64_0
		end

		local var_63_3 = {}

		_.each(arg_56_0.nodeList, function(arg_65_0)
			if arg_65_0.Instance then
				var_63_2(arg_65_0.Instance)
			else
				table.insert(var_63_3, arg_65_0)
			end
		end)

		if #var_63_3 <= 0 then
			return
		end

		local var_63_4 = true

		local function var_63_5()
			if not var_63_4 then
				return
			end

			arg_56_0:DispalyChat({
				"ryza_atellier5",
				"ryza_atellier6",
				"ryza_atellier7"
			})

			var_63_4 = false
		end

		local var_63_6 = false
		local var_63_7

		local function var_63_8()
			if var_63_7 and coroutine.status(var_63_7) == "suspended" then
				local var_67_0, var_67_1 = coroutine.resume(var_63_7)

				assert(var_67_0, debug.traceback(var_63_7, var_67_1))
			end
		end

		var_63_7 = coroutine.create(function()
			_.each(var_63_3, function(arg_69_0)
				local var_69_0 = arg_69_0.Data

				if var_69_0:GetType() == var_0_2.TYPE.BASE or var_69_0:GetType() == var_0_2.TYPE.SAIREN then
					local var_69_1 = var_69_0:GetLimitItemID()
					local var_69_2 = var_63_0[var_69_1] or var_63_1[var_69_1]

					if var_69_2 and var_69_2.count > 0 then
						var_63_2(var_69_2)
						var_63_5()
						arg_56_0:FillNodeAndPlayAnim(arg_69_0, AtelierMaterial.New({
							count = 1,
							configId = var_69_1
						}), var_63_8, true)
						coroutine.yield()
					else
						var_63_6 = true
					end
				end
			end)

			if not var_63_6 then
				local var_68_0 = false
				local var_68_1 = false

				arg_56_0:DisPlayUnlockEffect(function()
					var_68_0 = true

					if var_68_1 then
						var_63_8()
					end
				end)

				if not var_68_0 then
					var_68_1 = true

					coroutine.yield()
				end

				local var_68_2 = true

				local function var_68_3()
					if not var_68_2 then
						return
					end

					pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/ryza_atellier_ui_5")

					var_68_2 = false
				end

				local var_68_4 = AtelierMaterial.bindConfigTable()

				local function var_68_5(arg_72_0)
					local var_72_0 = arg_72_0.Data

					for iter_72_0, iter_72_1 in ipairs(var_68_4.all) do
						local var_72_1 = var_63_0[iter_72_1] or var_63_1[iter_72_1]

						if var_72_1 and var_72_1.count > 0 and var_72_1:IsNormal() and var_72_0:CanUseMaterial(var_72_1, arg_56_1) then
							var_63_2(var_72_1)
							var_63_5()
							var_68_3()
							arg_56_0:FillNodeAndPlayAnim(arg_72_0, AtelierMaterial.New({
								count = 1,
								configId = var_72_1:GetConfigID()
							}), true)

							return
						end
					end

					var_63_6 = true
				end

				_.each(var_63_3, function(arg_73_0)
					if arg_73_0.Data:GetType() == var_0_2.TYPE.NORMAL then
						var_68_5(arg_73_0)
					end
				end)
				_.each(var_63_3, function(arg_74_0)
					if arg_74_0.Data:GetType() == var_0_2.TYPE.ANY then
						var_68_5(arg_74_0)
					end
				end)
			end

			if var_63_6 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_material_not_enough"))
			end

			arg_56_0:UpdateFormulaDetail()
		end)

		var_63_8()
	end, SFX_PANEL)
	arg_56_0:UpdateFormulaDetail()
end

function var_0_0.CleanNodeInstance(arg_75_0)
	local var_75_0 = arg_75_0.activity:GetFormulas()[arg_75_0.contextData.formulaId]

	if not var_75_0:IsAvaliable() then
		arg_75_0:HideFormulaDetail()

		arg_75_0.contextData.formulaId = nil

		arg_75_0:ShowFormulaList()

		return
	end

	_.each(arg_75_0.nodeList, function(arg_76_0)
		arg_76_0.Instance = nil
		arg_76_0.Change = true
	end)
	arg_75_0:ShowFormulaDetail(var_75_0)
end

function var_0_0.UpdateFormulaDetail(arg_77_0)
	local var_77_0 = 0
	local var_77_1 = 0
	local var_77_2 = tobool(arg_77_0.unlockAllBase)

	arg_77_0.unlockAllBase = true

	_.each(arg_77_0.nodeList, function(arg_78_0)
		var_77_0 = var_77_0 + 1
		var_77_1 = var_77_1 + (arg_78_0.Instance and 1 or 0)
		arg_77_0.unlockAllBase = arg_77_0.unlockAllBase and (arg_78_0.Data:GetType() ~= var_0_2.TYPE.BASE and arg_78_0.Data:GetType() ~= var_0_2.TYPE.SAIREN or arg_78_0.Instance)
	end)
	_.each(arg_77_0.nodeList, function(arg_79_0)
		local var_79_0 = not arg_77_0.unlockAllBase and arg_79_0.Data:GetType() ~= var_0_2.TYPE.BASE and arg_79_0.Data:GetType() ~= var_0_2.TYPE.SAIREN

		arg_79_0.ChangeLock = arg_79_0.ChangeLock or tobool(arg_79_0.Lock) and not var_79_0
		arg_79_0.Lock = var_79_0
	end)

	local var_77_3 = arg_77_0.unlockAllBase ~= var_77_2

	_.each(arg_77_0.nodeList, function(arg_80_0)
		if var_77_3 then
			arg_80_0.Change = true
		end

		arg_77_0:UpdateNodeView(arg_80_0)
	end)
	setText(arg_77_0.layerFormulaDetail:Find("Bar/Text"), i18n("ryza_tip_put_materials", var_77_1, var_77_0))
	setGray(arg_77_0.layerFormulaDetail:Find("AutoFill"), not arg_77_0.activity:GetFormulas()[arg_77_0.contextData.formulaId]:IsAvaliable())
	setActive(arg_77_0.layerFormulaDetail:Find("Composite/Disabled"), var_77_1 < var_77_0)
end

local var_0_10 = {
	[var_0_2.ELEMENT_TYPE.PYRO] = "laisha_ui_huo",
	[var_0_2.ELEMENT_TYPE.CRYO] = "laisha_ui_bing",
	[var_0_2.ELEMENT_TYPE.ELECTRO] = "laisha_ui_lei",
	[var_0_2.ELEMENT_TYPE.ANEMO] = "laisha_ui_feng",
	[var_0_2.ELEMENT_TYPE.SAIREN] = "laisha_ui_sairen"
}
local var_0_11 = "laisha_ui_wupinshanguang"
local var_0_12 = "laisha_ui_jiesuo"
local var_0_13 = {
	"laisha_ui_lianjie01",
	"laisha_ui_lianjie02",
	"laisha_ui_lianjie_qiehuan"
}

function var_0_0.UpdateNodeView(arg_81_0, arg_81_1)
	local var_81_0 = tf(arg_81_1.GO)

	for iter_81_0 = 1, 6 do
		setActive(var_81_0:Find("Links"):GetChild(iter_81_0 - 1), false)
	end

	local var_81_1 = arg_81_1.Data

	_.each(var_81_1:GetNeighbors(), function(arg_82_0)
		setActive(var_81_0:Find("Links"):GetChild(arg_82_0[1] - 1), true)
	end)

	local var_81_2 = var_81_1:GetElementName()
	local var_81_3 = arg_81_1.Lock

	setActive(var_81_0:Find("Lock"), var_81_3)

	if var_81_3 then
		if var_81_1:GetType() ~= var_0_2.TYPE.ANY then
			arg_81_0.loader:GetSpriteQuiet(var_0_5, "element_" .. var_81_2, var_81_0:Find("Lock/Require/Icon"))
		end

		setText(var_81_0:Find("Lock/Require/Text"), "X" .. var_81_1:GetLevel())
	end

	for iter_81_1 = 3, var_81_1:GetLevel() + 1, -1 do
		local var_81_4 = var_81_0:Find("Slots"):GetChild(iter_81_1 - 1)

		arg_81_0.loader:GetSpriteQuiet(var_0_4, "slot_BLOCKED", var_81_4:Find("Image"))
	end

	local var_81_5 = arg_81_1.Instance

	if not var_81_5 then
		if var_81_1:GetType() == var_0_2.TYPE.ANY then
			setActive(var_81_0:Find("All"), true)
		else
			setActive(var_81_0:Find("Icon"), true)
			arg_81_0.loader:GetSpriteQuiet(var_0_4, "icon_" .. var_81_2, var_81_0:Find("Icon"), true)
		end

		setActive(var_81_0:Find("Item"), false)

		if var_81_1:GetType() == var_0_2.TYPE.BASE or var_81_1:GetType() == var_0_2.TYPE.SAIREN then
			local var_81_6 = AtelierMaterial.New({
				configId = var_81_1:GetLimitItemID()
			})

			setActive(var_81_0:Find("Name"), true)
			setScrollText(var_81_0:Find("Name/Rect/Text"), var_81_6:GetName())
		else
			setActive(var_81_0:Find("Name"), false)
		end

		for iter_81_2 = 1, var_81_1:GetLevel() do
			local var_81_7 = var_81_0:Find("Slots"):GetChild(iter_81_2 - 1)

			arg_81_0.loader:GetSpriteQuiet(var_0_4, "slot_NULL", var_81_7:Find("Image"))
		end
	else
		local var_81_8 = var_81_1:GetRingElement(var_81_5)
		local var_81_9 = var_0_2.ELEMENT_NAME[var_81_8]

		if var_81_1:GetType() == var_0_2.TYPE.ANY then
			setActive(var_81_0:Find("All"), false)
		else
			setActive(var_81_0:Find("Icon"), false)
		end

		setActive(var_81_0:Find("Item"), true)

		local var_81_10

		if var_81_1:GetType() == var_0_2.TYPE.BASE or var_81_1:GetType() == var_0_2.TYPE.SAIREN then
			var_81_10 = var_81_5:GetBaseCircleTransform()
		else
			var_81_10 = var_81_5:GetNormalCircleTransform()
		end

		setLocalScale(var_81_0:Find("Item"), Vector3.New(unpack(var_81_10, 1, 3)))
		setAnchoredPosition(var_81_0:Find("Item"), Vector2.New(unpack(var_81_10, 4, 5)))
		arg_81_0.loader:GetSpriteQuiet(var_81_5:GetIconPath(), "", var_81_0:Find("Item"), true)
		setActive(var_81_0:Find("Name"), true)
		setScrollText(var_81_0:Find("Name/Rect/Text"), var_81_5:GetName())

		for iter_81_3 = 1, var_81_1:GetLevel() do
			local var_81_11 = var_81_0:Find("Slots"):GetChild(iter_81_3 - 1)

			arg_81_0.loader:GetSpriteQuiet(var_0_4, "slot_" .. var_81_9, var_81_11:Find("Image"))
		end
	end

	local var_81_12 = var_81_0:Find("Ring")

	setImageColor(var_81_12, var_81_1:GetElementRingColor(var_81_5))

	if arg_81_1.Change then
		local var_81_13 = arg_81_1.Data:GetRingElement(var_81_5)

		if var_81_3 then
			var_81_13 = nil
		end

		if var_0_10[var_81_13] then
			local var_81_14 = arg_81_1.Data:GetType() == var_0_2.TYPE.BASE and "_o" or "_6"

			arg_81_0.loader:GetPrefab("ui/" .. var_0_10[var_81_13] .. var_81_14, "", function(arg_83_0)
				setParent(arg_83_0, var_81_12)
				setAnchoredPosition(arg_83_0, Vector2.zero)
			end, var_81_12)
		else
			arg_81_0.loader:ClearRequest(var_81_12)
		end

		table.Foreach(arg_81_1.links, function(arg_84_0, arg_84_1)
			local var_84_0 = var_81_0:Find("Links/" .. arg_84_0)
			local var_84_1 = var_0_13[3]

			if arg_84_1.Lock and var_81_3 then
				var_84_1 = var_0_13[1]
			elseif not arg_84_1.Lock and not var_81_3 then
				var_84_1 = var_0_13[2]
			end

			arg_81_0.loader:GetPrefab("ui/" .. var_84_1, "", function(arg_85_0)
				setParent(arg_85_0, var_84_0:Find("Link"))
				setAnchoredPosition(arg_85_0, Vector2.New(0, -15))
			end, var_84_0)
		end)

		arg_81_1.Change = nil
	end

	if arg_81_1.ChangeInstance then
		local var_81_15 = var_81_0:Find("Item")

		if var_81_5 then
			arg_81_0.loader:GetPrefab("ui/" .. var_0_11, "", function(arg_86_0)
				setParent(arg_86_0, var_81_15)
				setAnchoredPosition(arg_86_0, Vector2.zero)
			end, var_81_0)
		else
			arg_81_0.loader:ClearRequest(var_81_0)
		end

		arg_81_1.ChangeInstance = nil
	end

	onButton(arg_81_0, var_81_0, function()
		if var_81_3 then
			return
		end

		local var_87_0 = arg_81_0.layerMaterialSelect:Find("TargetBG")

		var_87_0.localRotation = Quaternion.identity

		local var_87_1 = var_81_1:GetType() == var_0_2.TYPE.BASE and 300 or 245

		setSizeDelta(var_87_0, {
			x = var_87_1,
			y = var_87_1
		})

		local var_87_2 = arg_81_0.layerMaterialSelect:Find("Target")

		arg_81_0:ShowCandicatePanel()

		local var_87_3 = tf(Instantiate(var_81_0))

		SetCompomentEnabled(var_87_3, typeof(Button), false)
		setParent(var_87_3, var_87_2)
		setAnchoredPosition(var_87_3, Vector2.zero)

		for iter_87_0 = 1, 6 do
			setActive(var_87_3:Find("Links"):GetChild(iter_87_0 - 1), false)
		end

		local var_87_4 = var_87_2.anchoredPosition
		local var_87_5 = arg_81_0.layerFormulaDetail:Find("ScrollView/Content")
		local var_87_6 = var_81_0.anchoredPosition + arg_81_0.layerFormulaDetail:Find("ScrollView").anchoredPosition

		setAnchoredPosition(var_87_5, var_87_4 - var_87_6)

		arg_81_0.candicateTarget = arg_81_1

		GetComponent(var_87_0, typeof(Animator)):SetBool("Selecting", true)
		arg_81_0:UpdateCandicatePanel()
	end, SFX_PANEL)
end

function var_0_0.FillNodeAndPlayAnim(arg_88_0, arg_88_1, arg_88_2, arg_88_3, arg_88_4)
	arg_88_0:LoadingOn()

	arg_88_1.ChangeInstance = arg_88_1.ChangeInstance or tobool(arg_88_1.Instance) ~= tobool(arg_88_2)
	arg_88_1.Instance = arg_88_2
	arg_88_1.Change = true

	local var_88_0 = {}
	local var_88_1 = {}

	seriesAsync({
		function(arg_89_0)
			table.ParallelIpairsAsync({
				"ui/laisha_ui_wupinzhiru",
				"ui/laisha_ui_baoshi"
			}, function(arg_90_0, arg_90_1, arg_90_2)
				var_88_0[arg_90_0] = arg_88_0.loader:GetPrefab(arg_90_1, "", function(arg_91_0)
					setParent(arg_91_0, tf(arg_88_1.GO))
					setAnchoredPosition(arg_91_0, Vector2.zero)

					var_88_1[arg_90_0] = arg_91_0

					setActive(arg_91_0, false)
					arg_90_2()
				end)
			end, arg_89_0)
		end,
		function(arg_92_0)
			setActive(var_88_1[1], true)
			arg_88_0:managedTween(LeanTween.delayedCall, function()
				if not arg_88_4 then
					arg_88_0:UpdateFormulaDetail()
				else
					arg_88_0:UpdateNodeView(arg_88_1)
				end

				pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/ryza_atellier_ui_4")
				arg_92_0()
			end, 0.2, nil)
		end,
		function(arg_94_0)
			setActive(var_88_1[2], true)
			arg_88_0:managedTween(LeanTween.delayedCall, function()
				arg_94_0()
			end, 0.5, nil)
		end,
		function(arg_96_0)
			arg_88_0.loader:ClearRequest(var_88_0[1])
			arg_88_0.loader:ClearRequest(var_88_0[2])
			arg_88_0:LoadingOff()
			existCall(arg_88_3)
		end
	})
end

function var_0_0.DisPlayUnlockEffect(arg_97_0, arg_97_1)
	arg_97_0.unlockAllBase = true

	_.each(arg_97_0.nodeList, function(arg_98_0)
		arg_97_0.unlockAllBase = arg_97_0.unlockAllBase and (arg_98_0.Data:GetType() ~= var_0_2.TYPE.BASE and arg_98_0.Data:GetType() ~= var_0_2.TYPE.SAIREN or arg_98_0.Instance)
	end)
	_.each(arg_97_0.nodeList, function(arg_99_0)
		local var_99_0 = not arg_97_0.unlockAllBase and arg_99_0.Data:GetType() ~= var_0_2.TYPE.BASE and arg_99_0.Data:GetType() ~= var_0_2.TYPE.SAIREN

		arg_99_0.ChangeLock = arg_99_0.ChangeLock or tobool(arg_99_0.Lock) and not var_99_0
		arg_99_0.Lock = var_99_0
	end)

	if not _.any(arg_97_0.nodeList, function(arg_100_0)
		return arg_100_0.ChangeLock
	end) then
		existCall(arg_97_1)

		return
	end

	arg_97_0:LoadingOn()

	local var_97_0 = {}

	_.each(arg_97_0.nodeList, function(arg_101_0)
		local var_101_0 = tf(arg_101_0.GO)

		if arg_101_0.ChangeLock then
			if arg_101_0.prevLink then
				arg_101_0.prevLink[2].Change = true
			end

			local var_101_1 = arg_97_0.loader:GetPrefab("ui/" .. var_0_12, "", function(arg_102_0)
				setParent(arg_102_0, var_101_0)
				setAnchoredPosition(arg_102_0, Vector2.zero)
			end)

			table.insert(var_97_0, var_101_1)

			arg_101_0.ChangeLock = nil
		end
	end)
	arg_97_0:managedTween(LeanTween.delayedCall, function()
		pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/ryza_atellier_ui_3")
	end, 0.7, nil)
	arg_97_0:managedTween(LeanTween.delayedCall, function()
		_.each(var_97_0, function(arg_105_0)
			arg_97_0.loader:ClearRequest(arg_105_0)
		end)
		arg_97_0:LoadingOff()
		existCall(arg_97_1)
	end, 1.7, nil)
end

function var_0_0.ShowCandicatePanel(arg_106_0)
	arg_106_0:DispalyChat({
		"ryza_atellier2",
		"ryza_atellier3",
		"ryza_atellier4"
	})
	pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/ryza_atellier_ui_1")
	pg.UIMgr.GetInstance():BlurPanel(arg_106_0.top)
	setActive(arg_106_0.layerMaterialSelect, true)
	SetCompomentEnabled(arg_106_0.layerFormulaDetail:Find("ScrollView"), typeof(ScrollRect), false)
	removeAllChildren(arg_106_0.layerMaterialSelect:Find("Target"))
end

function var_0_0.CloseCandicatePanel(arg_107_0)
	arg_107_0:LoadingOn()

	local var_107_0 = GetComponent(arg_107_0.layerMaterialSelect:Find("TargetBG"), typeof(DftAniEvent))

	var_107_0:SetEndEvent(function()
		arg_107_0:LoadingOff()
		arg_107_0:HideCandicatePanel()
		var_107_0:SetEndEvent(nil)
	end)
	GetComponent(arg_107_0.layerMaterialSelect:Find("TargetBG"), typeof(Animator)):SetBool("Selecting", false)
end

function var_0_0.HideCandicatePanel(arg_109_0)
	if not isActive(arg_109_0.layerMaterialSelect) then
		return
	end

	pg.UIMgr.GetInstance():OverlayPanel(arg_109_0.top)
	arg_109_0.painting:SetSiblingIndex(1)
	setActive(arg_109_0.layerMaterialSelect, false)
	removeAllChildren(arg_109_0.layerMaterialSelect:Find("Target"))
	SetCompomentEnabled(arg_109_0.layerFormulaDetail:Find("ScrollView"), typeof(ScrollRect), true)

	arg_109_0.candicateTarget = nil

	return true
end

function var_0_0.UpdateCandicatePanel(arg_110_0)
	arg_110_0.candicates = {}

	local var_110_0 = arg_110_0.activity:GetItems()
	local var_110_1 = arg_110_0.activity:GetFormulas()[arg_110_0.contextData.formulaId]
	local var_110_2 = AtelierMaterial.bindConfigTable()
	local var_110_3 = _.map(var_110_2.all, function(arg_111_0)
		local var_111_0 = var_110_0[arg_111_0] or AtelierMaterial.New({
			configId = arg_111_0
		})

		if arg_110_0.candicateTarget.Data:CanUseMaterial(var_111_0, var_110_1) then
			if var_110_0[arg_111_0] then
				var_111_0 = AtelierMaterial.New({
					configId = arg_111_0,
					count = var_110_0[arg_111_0].count
				})
				var_111_0.count = _.reduce(arg_110_0.nodeList, var_111_0.count, function(arg_112_0, arg_112_1)
					if arg_112_1.Instance and arg_112_1.Instance:GetConfigID() == arg_111_0 then
						arg_112_0 = arg_112_0 - 1
					end

					return arg_112_0
				end)
			end

			return var_111_0
		end
	end)

	table.sort(var_110_3, function(arg_113_0, arg_113_1)
		if arg_113_0.count * arg_113_1.count == 0 and arg_113_0.count - arg_113_1.count ~= 0 then
			return arg_113_0.count < arg_113_1.count
		else
			return arg_113_0:GetConfigID() < arg_113_1:GetConfigID()
		end
	end)
	_.each(var_110_3, function(arg_114_0)
		for iter_114_0 = 1, math.max(arg_114_0.count, 1) do
			table.insert(arg_110_0.candicates, arg_114_0)
		end
	end)
	arg_110_0.candicatesRect:SetTotalCount(#arg_110_0.candicates, 0)
end

function var_0_0.UpdateCandicateItem(arg_115_0, arg_115_1, arg_115_2)
	local var_115_0 = tf(arg_115_2)
	local var_115_1 = arg_115_0.candicates[arg_115_1]

	arg_115_0:UpdateRyzaItem(var_115_0:Find("IconBG"), var_115_1, true)

	local var_115_2 = var_115_1.count <= 0

	setActive(var_115_0:Find("IconBG/Lack"), var_115_2)
	onButton(arg_115_0, var_115_0, function()
		if var_115_2 then
			var_115_1 = CreateShell(var_115_1)
			var_115_1.count = false

			arg_115_0:ShowItemDetail(var_115_1)
		else
			arg_115_0:DispalyChat({
				"ryza_atellier5",
				"ryza_atellier6",
				"ryza_atellier7"
			})
			pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/ryza_atellier_ui_2")

			local var_116_0 = arg_115_0.candicateTarget

			arg_115_0:HideCandicatePanel()
			seriesAsync({
				function(arg_117_0)
					arg_115_0:FillNodeAndPlayAnim(var_116_0, AtelierMaterial.New({
						count = 1,
						configId = var_115_1:GetConfigID()
					}), arg_117_0, true)
				end,
				function(arg_118_0)
					arg_115_0:DisPlayUnlockEffect(arg_118_0)
				end,
				function(arg_119_0)
					arg_115_0:UpdateFormulaDetail()
				end
			})
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateRyzaItem(arg_120_0, arg_120_1, arg_120_2, arg_120_3)
	local var_120_0 = "icon_frame_" .. arg_120_2:GetRarity()

	if arg_120_3 then
		var_120_0 = var_120_0 .. "_small"
	end

	arg_120_0.loader:GetSpriteQuiet(var_0_5, var_120_0, arg_120_1)
	arg_120_0.loader:GetSpriteQuiet(arg_120_2:GetIconPath(), "", arg_120_1:Find("Icon"))

	if not IsNil(arg_120_1:Find("Lv")) then
		setText(arg_120_1:Find("Lv/Text"), arg_120_2:GetLevel())
	end

	local var_120_1 = arg_120_2:GetProps()
	local var_120_2 = CustomIndexLayer.Clone2Full(arg_120_1:Find("List"), #var_120_1)

	for iter_120_0, iter_120_1 in ipairs(var_120_2) do
		arg_120_0.loader:GetSpriteQuiet(var_0_5, "element_" .. var_0_2.ELEMENT_NAME[var_120_1[iter_120_0]], iter_120_1)
	end

	if not IsNil(arg_120_1:Find("Text")) then
		setText(arg_120_1:Find("Text"), arg_120_2.count)
	end
end

function var_0_0.ShowItemDetail(arg_121_0, arg_121_1)
	arg_121_0:emit(AtelierMaterialDetailMediator.SHOW_DETAIL, arg_121_1)
end

local var_0_14 = 41
local var_0_15 = 5

function var_0_0.ShowCompositeConfirmWindow(arg_122_0)
	setActive(arg_122_0.layerCompositeConfirm, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_122_0.layerCompositeConfirm)

	local var_122_0 = 1
	local var_122_1 = {}
	local var_122_2 = {}

	_.each(arg_122_0.nodeList, function(arg_123_0)
		local var_123_0 = arg_123_0.Instance:GetConfigID()

		table.insert(var_122_1, {
			key = arg_123_0.Data:GetConfigID(),
			value = var_123_0
		})

		var_122_2[var_123_0] = (var_122_2[var_123_0] or 0) + 1
	end)
	onButton(arg_122_0, arg_122_0.layerCompositeConfirm:Find("Window/Confirm"), function()
		arg_122_0:emit(GAME.COMPOSITE_ATELIER_RECIPE, var_122_1, var_122_0)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/ui/ryza_atellier_ui_6")
	end, SFX_PANEL)

	local var_122_3 = arg_122_0.activity:GetFormulas()[arg_122_0.contextData.formulaId]
	local var_122_4 = var_122_3:GetMaxLimit() ~= 1
	local var_122_5 = var_122_3:GetMaxLimit() > 0 and var_122_3:GetMaxLimit() - var_122_3:GetUsedCount() or 10000
	local var_122_6 = arg_122_0.activity:GetItems()

	for iter_122_0, iter_122_1 in pairs(var_122_2) do
		local var_122_7 = var_122_6[iter_122_0] and var_122_6[iter_122_0].count or 0

		var_122_5 = math.min(var_122_5, math.floor(var_122_7 / iter_122_1))
	end

	local var_122_8 = var_122_5
	local var_122_9 = {
		1,
		var_122_4 and var_122_8 or 1
	}
	local var_122_10 = Drop.New({
		type = var_122_3:GetProduction()[1],
		id = var_122_3:GetProduction()[2]
	})

	arg_122_0:UpdateRyzaDrop(arg_122_0.layerCompositeConfirm:Find("Window/Icon"), var_122_10)

	local var_122_11 = arg_122_0.layerCompositeConfirm:Find("Window/Counters")
	local var_122_12 = var_122_10:getConfig("name")

	setActive(var_122_11, var_122_4)

	if var_122_4 then
		setAnchoredPosition(arg_122_0.layerCompositeConfirm:Find("Window/Icon"), {
			y = var_0_14
		})

		local function var_122_13()
			setText(var_122_11:Find("Number"), var_122_0)
			setText(arg_122_0.layerCompositeConfirm:Find("Window/Text"), i18n("ryza_composite_confirm", var_122_12, var_122_0))
		end

		var_122_13()
		onButton(arg_122_0, var_122_11:Find("Plus"), function()
			local var_126_0 = var_122_0

			var_122_0 = var_122_0 + 1
			var_122_0 = math.clamp(var_122_0, var_122_9[1], var_122_9[2])

			if var_126_0 == var_122_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_max_composite_count"))

				return
			end

			var_122_13()
		end)
		onButton(arg_122_0, var_122_11:Find("Minus"), function()
			var_122_0 = var_122_0 - 1
			var_122_0 = math.clamp(var_122_0, var_122_9[1], var_122_9[2])

			var_122_13()
		end)
		onButton(arg_122_0, var_122_11:Find("Plus10"), function()
			local var_128_0 = var_122_0

			var_122_0 = var_122_0 + 10
			var_122_0 = math.clamp(var_122_0, var_122_9[1], var_122_9[2])

			if var_128_0 == var_122_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ryza_tip_max_composite_count"))

				return
			end

			var_122_13()
		end)
		onButton(arg_122_0, var_122_11:Find("Minus10"), function()
			var_122_0 = var_122_0 - 10
			var_122_0 = math.clamp(var_122_0, var_122_9[1], var_122_9[2])

			var_122_13()
		end)
	else
		setAnchoredPosition(arg_122_0.layerCompositeConfirm:Find("Window/Icon"), {
			y = var_0_15
		})
		setText(arg_122_0.layerCompositeConfirm:Find("Window/Text"), i18n("ryza_composite_confirm_single", var_122_12, var_122_0))
	end
end

function var_0_0.HideCompositeConfirmWindow(arg_130_0)
	if not isActive(arg_130_0.layerCompositeConfirm) then
		return
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_130_0.layerCompositeConfirm, arg_130_0._tf)
	setActive(arg_130_0.layerCompositeConfirm, false)

	return true
end

local var_0_16 = "laisha_lianjin"

function var_0_0.OnCompositeResult(arg_131_0, arg_131_1)
	arg_131_0:LoadingOn()
	arg_131_0:DispalyChat({
		"ryza_atellier8",
		"ryza_atellier9"
	})

	local var_131_0 = 1.5
	local var_131_1 = 0.5

	arg_131_0.loader:GetPrefab("ui/" .. var_0_16, "", function(arg_132_0)
		pg.UIMgr.GetInstance():OverlayPanel(tf(arg_132_0))
		setAnchoredPosition(arg_132_0, Vector2.zero)
		arg_131_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_131_0._tf, typeof(CanvasGroup)), 0, var_131_0):setFrom(1)
		arg_131_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_131_0.top, typeof(CanvasGroup)), 0, var_131_0):setFrom(1)
		arg_131_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_131_0.layerCompositeConfirm, typeof(CanvasGroup)), 0, var_131_0):setFrom(1)
		arg_131_0:managedTween(LeanTween.delayedCall, function()
			arg_131_0:HideCompositeConfirmWindow()
			setCanvasGroupAlpha(arg_131_0.layerCompositeConfirm, 1)
			arg_131_0:CleanNodeInstance()
			arg_131_0:ShowCompositeResult(arg_131_1)
			arg_131_0:DispalyChat({
				"ryza_atellier10",
				"ryza_atellier11"
			})
			arg_131_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_131_0._tf, typeof(CanvasGroup)), 1, var_131_1):setFrom(0)
			arg_131_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_131_0.top, typeof(CanvasGroup)), 1, var_131_1):setFrom(0)
			arg_131_0:managedTween(LeanTween.alphaCanvas, nil, GetOrAddComponent(arg_131_0.layerCompositeResult, typeof(CanvasGroup)), 1, var_131_1):setFrom(0)
			arg_131_0:managedTween(LeanTween.delayedCall, function()
				arg_131_0:LoadingOff()
				pg.UIMgr.GetInstance():UnOverlayPanel(tf(arg_132_0), arg_131_0._tf)
				arg_131_0.loader:ClearRequest("CompositeResult")
			end, go(arg_131_0.layerCompositeResult), var_131_1, nil)
		end, go(arg_131_0.layerCompositeResult), var_131_0, nil)
	end, "CompositeResult")
end

function var_0_0.ShowCompositeResult(arg_135_0, arg_135_1)
	setActive(arg_135_0.layerCompositeResult, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_135_0.layerCompositeResult)

	local var_135_0 = arg_135_1[1]

	if var_135_0 == nil then
		return
	end

	arg_135_0:UpdateRyzaDrop(arg_135_0.layerCompositeResult:Find("Window/Icon"), var_135_0)
	setScrollText(arg_135_0.layerCompositeResult:Find("Window/NameBG/Rect/Name"), var_135_0:getName())
	setText(arg_135_0.layerCompositeResult:Find("Window/CountBG/Text"), var_135_0.count)
end

function var_0_0.HideCompositeResult(arg_136_0)
	if not isActive(arg_136_0.layerCompositeResult) then
		return
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_136_0.layerCompositeResult, arg_136_0._tf)
	setActive(arg_136_0.layerCompositeResult, false)

	if pg.NewStoryMgr.GetInstance():IsPlayed("NG0032") then
		pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0033", {
			2
		})
	end

	return true
end

function var_0_0.ShowStoreHouseWindow(arg_137_0)
	setActive(arg_137_0.layerStoreHouse, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_137_0.layerStoreHouse)

	local var_137_0 = _.filter(_.values(arg_137_0.activity:GetItems()), function(arg_138_0)
		return arg_138_0.count > 0
	end)

	table.sort(var_137_0, function(arg_139_0, arg_139_1)
		return arg_139_0:GetConfigID() < arg_139_1:GetConfigID()
	end)
	setActive(arg_137_0.layerStoreHouse:Find("Window/Empty"), #var_137_0 == 0)
	setActive(arg_137_0.layerStoreHouse:Find("Window/ScrollView"), #var_137_0 > 0)

	if #var_137_0 == 0 then
		return
	end

	function arg_137_0.storehouseRect.onUpdateItem(arg_140_0, arg_140_1)
		arg_140_0 = arg_140_0 + 1

		local var_140_0 = tf(arg_140_1)
		local var_140_1 = var_137_0[arg_140_0]

		arg_137_0:UpdateRyzaItem(var_140_0:Find("IconBG"), var_140_1)
		setScrollText(var_140_0:Find("NameBG/Rect/Name"), var_140_1:GetName())
		onButton(arg_137_0, var_140_0, function()
			arg_137_0:ShowItemDetail(var_140_1)
		end, SFX_PANEL)
	end

	arg_137_0.storehouseRect:SetTotalCount(#var_137_0)
end

function var_0_0.CloseStoreHouseWindow(arg_142_0)
	arg_142_0.contextData.showStoreHouse = nil

	return arg_142_0:HideStoreHouseWindow()
end

function var_0_0.HideStoreHouseWindow(arg_143_0)
	if not isActive(arg_143_0.layerStoreHouse) then
		return
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_143_0.layerStoreHouse, arg_143_0._tf)
	setActive(arg_143_0.layerStoreHouse, false)

	return true
end

function var_0_0.ShowMaterialsPreview(arg_144_0)
	setActive(arg_144_0.layerMaterialsPreview, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_144_0.layerMaterialsPreview)

	local var_144_0 = arg_144_0.activity:GetItems()
	local var_144_1 = arg_144_0.activity:GetFormulas()[arg_144_0.contextData.formulaId]
	local var_144_2 = AtelierMaterial.bindConfigTable()
	local var_144_3 = {}
	local var_144_4 = {}
	local var_144_5 = {}

	local function var_144_6(arg_145_0)
		local var_145_0 = var_144_5[arg_145_0:GetConfigID()] or Clone(var_144_0[arg_145_0:GetConfigID()])

		assert(var_145_0, "Using Unexist material")

		var_145_0.count = var_145_0.count - 1
		var_144_5[arg_145_0:GetConfigID()] = var_145_0
	end

	_.each(arg_144_0.nodeList, function(arg_146_0)
		local var_146_0 = arg_146_0.Data

		if var_146_0:GetType() == var_0_2.TYPE.BASE or var_146_0:GetType() == var_0_2.TYPE.SAIREN then
			local var_146_1 = var_146_0:GetLimitItemID()
			local var_146_2 = var_144_5[var_146_1] or var_144_0[var_146_1]

			if var_146_2 and var_146_2.count > 0 then
				local var_146_3 = AtelierMaterial.New({
					configId = var_146_1
				})

				var_146_3.count = false

				table.insert(var_144_3, var_146_3)
				var_144_6(var_146_2)
			else
				local var_146_4 = AtelierMaterial.New({
					configId = var_146_1
				})

				var_146_4.count = false

				table.insert(var_144_4, var_146_4)
			end
		end
	end)

	local function var_144_7(arg_147_0)
		if arg_147_0.Instance then
			local var_147_0 = AtelierMaterial.New({
				configId = arg_147_0.Instance:GetConfigID()
			})

			var_147_0.count = false

			table.insert(var_144_3, var_147_0)
			var_144_6(arg_147_0.Instance)

			return
		end

		local var_147_1 = arg_147_0.Data
		local var_147_2

		for iter_147_0, iter_147_1 in ipairs(var_144_2.all) do
			local var_147_3 = var_144_5[iter_147_1] or var_144_0[iter_147_1] or AtelierMaterial.New({
				configId = iter_147_1
			})

			if var_147_3:IsNormal() and var_147_1:CanUseMaterial(var_147_3, var_144_1) then
				var_147_2 = var_147_2 or iter_147_1

				if var_147_3.count > 0 then
					local var_147_4 = AtelierMaterial.New({
						configId = iter_147_1
					})

					var_147_4.count = false

					table.insert(var_144_3, var_147_4)
					var_144_6(var_147_3)

					return
				end
			end
		end

		local var_147_5 = AtelierMaterial.New({
			configId = var_147_2
		})

		var_147_5.count = false

		table.insert(var_144_4, var_147_5)
	end

	_.each(arg_144_0.nodeList, function(arg_148_0)
		if arg_148_0.Data:GetType() == var_0_2.TYPE.NORMAL then
			var_144_7(arg_148_0)
		end
	end)
	_.each(arg_144_0.nodeList, function(arg_149_0)
		if arg_149_0.Data:GetType() == var_0_2.TYPE.ANY then
			var_144_7(arg_149_0)
		end
	end)

	local function var_144_8(arg_150_0, arg_150_1)
		return arg_150_0:GetConfigID() < arg_150_1:GetConfigID()
	end

	table.sort(var_144_3, var_144_8)
	table.sort(var_144_4, var_144_8)

	local function var_144_9()
		local var_151_0 = arg_144_0.layerMaterialsPreview:Find("Frame/Scroll/Content/Owned/List")

		setActive(var_151_0.parent, #var_144_3 > 0)

		if #var_144_3 == 0 then
			return
		end

		local var_151_1 = CustomIndexLayer.Clone2Full(var_151_0, #var_144_3)

		table.Foreach(var_151_1, function(arg_152_0, arg_152_1)
			local var_152_0 = var_144_3[arg_152_0]

			arg_144_0:UpdateRyzaItem(arg_152_1:Find("IconBG"), var_152_0, true)
			onButton(arg_144_0, arg_152_1, function()
				arg_144_0:ShowItemDetail(var_152_0)
			end, SFX_PANEL)
		end)
	end

	local function var_144_10()
		local var_154_0 = arg_144_0.layerMaterialsPreview:Find("Frame/Scroll/Content/Lack/List")

		setActive(var_154_0.parent, #var_144_4 > 0)

		if #var_144_4 == 0 then
			return
		end

		local var_154_1 = CustomIndexLayer.Clone2Full(var_154_0, #var_144_4)

		table.Foreach(var_154_1, function(arg_155_0, arg_155_1)
			local var_155_0 = var_144_4[arg_155_0]

			arg_144_0:UpdateRyzaItem(arg_155_1:Find("IconBG"), var_155_0, true)
			onButton(arg_144_0, arg_155_1, function()
				arg_144_0:ShowItemDetail(var_155_0)
			end, SFX_PANEL)
		end)
	end

	var_144_9()
	var_144_10()
end

function var_0_0.HideMaterialsPreview(arg_157_0)
	if not isActive(arg_157_0.layerMaterialsPreview) then
		return
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_157_0.layerMaterialsPreview, arg_157_0._tf)
	setActive(arg_157_0.layerMaterialsPreview, false)

	return true
end

function var_0_0.OnReceiveFormualRequest(arg_158_0, arg_158_1)
	arg_158_0:HideCandicatePanel()
	arg_158_0:HideCompositeConfirmWindow()
	arg_158_0:HideCompositeResult()
	arg_158_0:HideMaterialsPreview()
	arg_158_0:CloseStoreHouseWindow()
	arg_158_0:HideFormulaList()

	local var_158_0 = arg_158_0.activity:GetFormulas()[arg_158_1]

	arg_158_0:ShowFormulaDetail(var_158_0)
end

function var_0_0.DispalyChat(arg_159_0, arg_159_1)
	arg_159_0:HideChat()
	setActive(arg_159_0.chat, true)

	arg_159_0.chatTween = LeanTween.delayedCall(go(arg_159_0.chat), 4, System.Action(function()
		arg_159_0:HideChat()
	end)).uniqueId

	local var_159_0 = arg_159_1[math.random(#arg_159_1)]
	local var_159_1 = pg.gametip.ryza_composite_words.tip
	local var_159_2 = _.detect(var_159_1, function(arg_161_0)
		return arg_161_0[1] == var_159_0
	end)
	local var_159_3 = var_159_2 and var_159_2[2]

	setText(arg_159_0.chat:Find("Text"), var_159_3)

	local var_159_4 = 1090001
	local var_159_5 = "event:/cv/" .. var_159_4 .. "/" .. var_159_0

	arg_159_0:PlaySound(var_159_5)
end

function var_0_0.HideChat(arg_162_0)
	if arg_162_0.chatTween then
		LeanTween.cancel(arg_162_0.chatTween)

		arg_162_0.chatTween = nil
	end

	setActive(arg_162_0.chat, false)
end

function var_0_0.PlaySound(arg_163_0, arg_163_1, arg_163_2)
	if not arg_163_0.playbackInfo or arg_163_1 ~= arg_163_0.prevCvPath or arg_163_0.playbackInfo.channelPlayer == nil then
		arg_163_0:StopSound()
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_163_1, function(arg_164_0)
			if arg_164_0 then
				arg_163_0.playbackInfo = arg_164_0

				arg_163_0.playbackInfo:SetIgnoreAutoUnload(true)

				if arg_163_2 then
					arg_163_2(arg_163_0.playbackInfo.cueInfo)
				end
			elseif arg_163_2 then
				arg_163_2()
			end
		end)

		arg_163_0.prevCvPath = arg_163_1

		if arg_163_0.playbackInfo == nil then
			return nil
		end

		return arg_163_0.playbackInfo.cueInfo
	elseif arg_163_0.playbackInfo then
		arg_163_0.playbackInfo:PlaybackStop()
		arg_163_0.playbackInfo:SetStartTimeAndPlay()

		if arg_163_2 then
			arg_163_2(arg_163_0.playbackInfo.cueInfo)
		end

		return arg_163_0.playbackInfo.cueInfo
	elseif arg_163_2 then
		arg_163_2()
	end

	return nil
end

function var_0_0.StopSound(arg_165_0)
	if arg_165_0.playbackInfo then
		pg.CriMgr.GetInstance():StopPlaybackInfoForce(arg_165_0.playbackInfo)
		arg_165_0.playbackInfo:SetIgnoreAutoUnload(false)
	end
end

function var_0_0.ClearSound(arg_166_0)
	arg_166_0:StopSound()

	if arg_166_0.playbackInfo then
		arg_166_0.playbackInfo:Dispose()

		arg_166_0.playbackInfo = nil
	end
end

function var_0_0.LoadingOn(arg_167_0)
	if arg_167_0.animating then
		return
	end

	arg_167_0.animating = true

	pg.UIMgr.GetInstance():LoadingOn(false)
end

function var_0_0.LoadingOff(arg_168_0)
	if not arg_168_0.animating then
		return
	end

	pg.UIMgr.GetInstance():LoadingOff()

	arg_168_0.animating = false
end

function var_0_0.willExit(arg_169_0)
	arg_169_0.loader:Clear()
	arg_169_0:LoadingOff()
	arg_169_0:HideChat()
	arg_169_0:ClearSound()
	arg_169_0:HideStoreHouseWindow()
	arg_169_0:HideMaterialsPreview()
	arg_169_0:HideCompositeResult()
	arg_169_0:HideCompositeConfirmWindow()
	arg_169_0:HideCandicatePanel()
	arg_169_0:HideFormulaDetail()
	arg_169_0:HideFormulaList()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_169_0.top, arg_169_0._tf)

	if arg_169_0.nodePools then
		for iter_169_0, iter_169_1 in pairs(arg_169_0.nodePools) do
			iter_169_1:ClearItems()
		end
	end
end

return var_0_0
