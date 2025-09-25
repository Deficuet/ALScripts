local var_0_0 = class("AtelierStoreBaseScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AtelierStoreUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.storehouseRect = GetComponent(arg_2_0:findTF("Window/ScrollView"), "LScrollRect")

	local var_2_0 = arg_2_0:findTF("Window/ScrollView/Item")

	setActive(var_2_0, false)
	arg_2_0:InitCustom()
end

function var_0_0.InitCustom(arg_3_0)
	setText(arg_3_0:findTF("Window/Empty"), i18n("ryza_tip_no_item"))
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0.activity = arg_4_0.contextData.activity

	onButton(arg_4_0, arg_4_0:findTF("Window/Close"), function()
		arg_4_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0:findTF("BG"), function()
		arg_4_0:closeView()
	end, SFX_CANCEL)
	arg_4_0:ShowStoreHouseWindow()
end

function var_0_0.ShowStoreHouseWindow(arg_7_0)
	local var_7_0 = arg_7_0.contextData.versionIndex or 1

	pg.UIMgr.GetInstance():BlurPanel(arg_7_0._tf)

	local var_7_1 = _.filter(_.values(arg_7_0.activity:GetItems()), function(arg_8_0)
		return arg_8_0.count > 0 and arg_8_0:GetVersion() == var_7_0 and arg_8_0:IsShow() ~= 0
	end)

	table.sort(var_7_1, function(arg_9_0, arg_9_1)
		return arg_9_0:GetConfigID() < arg_9_1:GetConfigID()
	end)
	setActive(arg_7_0:findTF("Window/Empty"), #var_7_1 == 0)
	setActive(arg_7_0:findTF("Window/ScrollView"), #var_7_1 > 0)

	if #var_7_1 == 0 then
		return
	end

	function arg_7_0.storehouseRect.onUpdateItem(arg_10_0, arg_10_1)
		arg_10_0 = arg_10_0 + 1

		local var_10_0 = tf(arg_10_1)
		local var_10_1 = var_7_1[arg_10_0]

		arg_7_0:UpdateRyzaItem(arg_7_0:findTF("IconBG", var_10_0), var_10_1)
		setScrollText(arg_7_0:findTF("NameBG/Rect/Name", var_10_0), var_10_1:GetName())
		onButton(arg_7_0, var_10_0, function()
			arg_7_0:ShowItemDetail(var_10_1)
		end, SFX_PANEL)
	end

	arg_7_0.storehouseRect:SetTotalCount(#var_7_1)
end

function var_0_0.UpdateRyzaItem(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = "icon_frame_" .. arg_12_2:GetRarity()

	if small then
		var_12_0 = var_12_0 .. "_small"
	end

	GetImageSpriteFromAtlasAsync("ui/AtelierCommonUI_atlas", var_12_0, arg_12_1)
	GetImageSpriteFromAtlasAsync(arg_12_2:GetIconPath(), "", arg_12_0:findTF("Icon", arg_12_1))

	if not IsNil(arg_12_0:findTF("Lv", arg_12_1)) then
		setText(arg_12_0:findTF("Lv/Text", arg_12_1), arg_12_2:GetLevel())
	end

	local var_12_1 = arg_12_2:GetProps()
	local var_12_2 = CustomIndexLayer.Clone2Full(arg_12_0:findTF("List", arg_12_1), #var_12_1)

	for iter_12_0, iter_12_1 in ipairs(var_12_2) do
		GetImageSpriteFromAtlasAsync("ui/AtelierCommonUI_atlas", "element_" .. AtelierFormulaCircle.ELEMENT_NAME[var_12_1[iter_12_0]], iter_12_1)
	end

	if not IsNil(arg_12_0:findTF("Text", arg_12_1)) then
		setText(arg_12_0:findTF("Text", arg_12_1), arg_12_2.count)
	end
end

function var_0_0.ShowItemDetail(arg_13_0, arg_13_1)
	arg_13_0:emit(AtelierMaterialDetailMediator.SHOW_DETAIL, arg_13_1)
end

function var_0_0.willExit(arg_14_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_14_0._tf)
end

return var_0_0
