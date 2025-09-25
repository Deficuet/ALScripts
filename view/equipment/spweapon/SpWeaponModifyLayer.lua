local var_0_0 = class("SpWeaponModifyLayer", BaseUI)

function var_0_0.getUIName(arg_1_0)
	return "SpWeaponModifyUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.equipmentPanel = arg_2_0:findTF("Main/panel/equipment_panel")
	arg_2_0.materialPanel = arg_2_0:findTF("Main/panel/material_panel")
	arg_2_0.equipmentIcon = arg_2_0:findTF("Icon", arg_2_0.equipmentPanel)
	arg_2_0.equipmentName = arg_2_0:findTF("Name", arg_2_0.equipmentPanel)
	arg_2_0.attributeList = arg_2_0:findTF("Attribute/Rect/Attrs", arg_2_0.equipmentPanel)
	arg_2_0.attributeButtons = arg_2_0:findTF("Attribute/Rect/Buttons", arg_2_0.equipmentPanel)
	arg_2_0.attributeExchangeButton = arg_2_0:findTF("Exchange", arg_2_0.attributeButtons)
	arg_2_0.attributeDiscardButton = arg_2_0:findTF("Discard", arg_2_0.attributeButtons)

	setText(arg_2_0:findTF("Attribute/Text", arg_2_0.equipmentPanel), i18n("spweapon_ui_transform_attr_text"))
	setText(arg_2_0.attributeExchangeButton:Find("Text"), i18n("spweapon_ui_change_attr"))
	setText(arg_2_0.attributeDiscardButton:Find("Text"), i18n("spweapon_ui_keep_attr"))

	arg_2_0.materialItems = CustomIndexLayer.Clone2Full(arg_2_0:findTF("materials/materials", arg_2_0.materialPanel), 3)
	arg_2_0.materialLimit = arg_2_0:findTF("materials/limit", arg_2_0.materialPanel)
	arg_2_0.materialCostText = arg_2_0:findTF("cost/consume", arg_2_0.materialPanel)
	arg_2_0.materialStartButton = arg_2_0:findTF("start_btn", arg_2_0.materialPanel)

	setText(arg_2_0:findTF("materials/panel_title", arg_2_0.materialPanel), i18n("spweapon_ui_need_resource"))
	setText(arg_2_0.materialStartButton:Find("Image"), i18n("spweapon_ui_transform"))
end

function var_0_0.SetSpweaponVO(arg_3_0, arg_3_1)
	arg_3_0.spWeaponVO = arg_3_1
end

function var_0_0.SetItems(arg_4_0, arg_4_1)
	arg_4_0.itemVOs = arg_4_1
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0:findTF("BG"), function()
		arg_5_0:closeView()
	end)
	arg_5_0:UpdateView()
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf)
end

function var_0_0.ResetMaterialMask(arg_7_0)
	arg_7_0.confirmUpgrade = nil
end

function var_0_0.UpdateView(arg_8_0)
	setText(arg_8_0.equipmentName, arg_8_0.spWeaponVO:GetName())

	local var_8_0 = arg_8_0.spWeaponVO:GetUpgradeConfig()

	table.Foreach(arg_8_0.materialItems, function(arg_9_0, arg_9_1)
		local var_9_0 = var_8_0.reset_use_item[arg_9_0]

		setActive(arg_9_1:Find("Off"), not var_9_0)
		setActive(arg_9_1:Find("Icon"), var_9_0)

		if var_9_0 then
			local var_9_1 = {
				id = var_9_0[1],
				count = var_9_0[2],
				type = DROP_TYPE_ITEM
			}

			updateDrop(arg_9_1:Find("Icon"), var_9_1)

			local var_9_2 = defaultValue(arg_8_0.itemVOs[var_9_0[1]], {
				count = 0
			})
			local var_9_3 = var_9_2.count .. "/" .. var_9_0[2]

			if var_9_2.count < var_9_0[2] then
				var_9_3 = setColorStr(var_9_2.count, COLOR_RED) .. "/" .. var_9_0[2]
			end

			local var_9_4 = arg_9_1:Find("Icon/icon_bg/count")

			setText(var_9_4, var_9_3)
			onButton(arg_8_0, arg_9_1:Find("Icon"), function()
				arg_8_0:emit(BaseUI.ON_DROP, var_9_1)
			end)

			local var_9_5 = arg_9_1:Find("Icon/Click")

			setActive(var_9_5, not arg_8_0.confirmUpgrade)
			onButton(arg_8_0, var_9_5, function()
				arg_8_0.confirmUpgrade = true

				setActive(var_9_5, not arg_8_0.confirmUpgrade)
			end)
		end
	end)
	updateSpWeapon(arg_8_0.equipmentIcon, arg_8_0.spWeaponVO)

	local var_8_1 = arg_8_0.spWeaponVO:GetAttributeOptions()
	local var_8_2 = arg_8_0.spWeaponVO:GetBaseAttributes()
	local var_8_3 = arg_8_0.spWeaponVO:GetAttributesRange()
	local var_8_4 = {
		arg_8_0.spWeaponVO:getConfig("attribute_1"),
		arg_8_0.spWeaponVO:getConfig("attribute_2")
	}
	local var_8_5 = _.any(var_8_1, function(arg_12_0)
		return arg_12_0 > 0
	end)
	local var_8_6 = table.equal(var_8_2, var_8_3)

	setActive(arg_8_0.attributeButtons, var_8_5)
	UIItemList.StaticAlign(arg_8_0.attributeList, arg_8_0.attributeList:GetChild(0), #var_8_2, function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_13_1 = arg_13_1 + 1

		local var_13_0 = var_8_2[arg_13_1]
		local var_13_1 = var_8_3[arg_13_1]
		local var_13_2 = var_8_1[arg_13_1]
		local var_13_3 = AttributeType.Type2Name(var_8_4[arg_13_1])

		setText(arg_13_2:Find("Name"), var_13_3)
		setText(arg_13_2:Find("Values/Min/Value"), math.min(1, var_13_1))
		setText(arg_13_2:Find("Values/Max/Value"), var_13_1)
		setText(arg_13_2:Find("Values/Current/Value1"), var_13_0)
		setText(arg_13_2:Find("Values/Current/Value2"), var_13_2)
		setActive(arg_13_2:Find("Values/Current/Symbol"), var_8_5)
		setActive(arg_13_2:Find("Values/Current/Value2"), var_8_5)
	end)
	onButton(arg_8_0, arg_8_0.materialStartButton, function()
		if not arg_8_0.confirmUpgrade then
			pg.TipsMgr.GetInstance():ShowTips(i18n("spweapon_tip_transform_materal_check"))

			return
		end

		arg_8_0:emit(SpWeaponModifyMediator.ON_REFORGE)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.attributeExchangeButton, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_CONFIRM_REFORGE_SPWEAPON,
			op = SpWeapon.CONFIRM_OP_EXCHANGE,
			attrs = _.map({
				1,
				2
			}, function(arg_16_0)
				local var_16_0 = var_8_2[arg_16_0]
				local var_16_1 = var_8_1[arg_16_0]
				local var_16_2 = AttributeType.Type2Name(var_8_4[arg_16_0])

				return {
					var_16_2,
					var_16_0,
					var_16_1
				}
			end),
			onYes = function()
				arg_8_0:emit(SpWeaponModifyMediator.ON_CONFIRM_REFORGE, SpWeapon.CONFIRM_OP_EXCHANGE)
			end
		})
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.attributeDiscardButton, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_CONFIRM_REFORGE_SPWEAPON,
			op = SpWeapon.CONFIRM_OP_DISCARD,
			attrs = _.map({
				1,
				2
			}, function(arg_19_0)
				local var_19_0 = var_8_2[arg_19_0]
				local var_19_1 = var_8_1[arg_19_0]
				local var_19_2 = AttributeType.Type2Name(var_8_4[arg_19_0])

				return {
					var_19_2,
					var_19_0,
					var_19_1
				}
			end),
			onYes = function()
				arg_8_0:emit(SpWeaponModifyMediator.ON_CONFIRM_REFORGE, SpWeapon.CONFIRM_OP_DISCARD)
			end
		})
	end, SFX_CANCEL)
	setGray(arg_8_0.materialStartButton, var_8_5 or var_8_6)
end

function var_0_0.willExit(arg_21_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_21_0._tf)
end

return var_0_0
