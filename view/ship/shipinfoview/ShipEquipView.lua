local var_0_0 = class("ShipEquipView", import("...base.BaseSubView"))

var_0_0.UNLOCK_EQUIPMENT_SKIN_POS = {
	1,
	2,
	3,
	4,
	5
}

function var_0_0.getUIName(arg_1_0)
	return "ShipEquipView"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:InitEquipment()
end

function var_0_0.SetShareData(arg_3_0, arg_3_1)
	arg_3_0.shareData = arg_3_1
end

function var_0_0.GetShipVO(arg_4_0)
	if arg_4_0.shareData and arg_4_0.shareData.shipVO then
		return arg_4_0.shareData.shipVO
	end

	return nil
end

function var_0_0.UpdateUI(arg_5_0)
	local var_5_0 = arg_5_0:GetShipVO()

	arg_5_0:UpdateEquipments(var_5_0)
end

function var_0_0.InitEquipment(arg_6_0)
	arg_6_0.mainPanel = arg_6_0._parentTf.parent
	arg_6_0.equipRCon = arg_6_0._parentTf:Find("equipment_r_container")
	arg_6_0.equipLCon = arg_6_0._parentTf:Find("equipment_l_container")
	arg_6_0.equipBCon = arg_6_0._parentTf:Find("equipment_b_container")
	arg_6_0.equipmentR = arg_6_0:findTF("equipment_r")
	arg_6_0.equipmentL = arg_6_0:findTF("equipment_l")
	arg_6_0.equipmentB = arg_6_0:findTF("equipment_b")
	arg_6_0.equipmentR1 = arg_6_0.equipmentR:Find("equipment/equipment_r1")
	arg_6_0.equipmentR2 = arg_6_0.equipmentR:Find("equipment/equipment_r2")
	arg_6_0.equipmentR3 = arg_6_0.equipmentR:Find("equipment/equipment_r3")
	arg_6_0.equipmentL1 = arg_6_0.equipmentL:Find("equipment/equipment_l1")
	arg_6_0.equipmentL2 = arg_6_0.equipmentL:Find("equipment/equipment_l2")
	arg_6_0.equipSkinBtn = arg_6_0.equipmentR:Find("equipment_skin_btn")
	arg_6_0.equipmentB1 = arg_6_0.equipmentB:Find("equipment")
	arg_6_0.resource = arg_6_0._tf:Find("resource")
	arg_6_0.equipSkinLogicPanel = ShipEquipSkinLogicPanel.New(arg_6_0._tf.gameObject)

	arg_6_0.equipSkinLogicPanel:attach(arg_6_0)
	arg_6_0.equipSkinLogicPanel:setLabelResource(arg_6_0.resource)
	setActive(arg_6_0.equipSkinLogicPanel._go, true)
	setParent(arg_6_0.equipmentR, arg_6_0.equipRCon)
	setParent(arg_6_0.equipmentL, arg_6_0.equipLCon)
	setParent(arg_6_0.equipmentB, arg_6_0.equipBCon)
	setActive(arg_6_0.equipmentR, true)
	setActive(arg_6_0.equipmentL, true)
	setActive(arg_6_0.equipmentB, true)
	setActive(arg_6_0.equipSkinBtn, true)

	arg_6_0.equipmentPanels = {
		arg_6_0.equipmentR1,
		arg_6_0.equipmentR2,
		arg_6_0.equipmentR3,
		arg_6_0.equipmentL1,
		arg_6_0.equipmentL2
	}
	arg_6_0.onSelected = false
end

function var_0_0.InitEvent(arg_7_0)
	onButton(arg_7_0, arg_7_0.equipSkinBtn, function()
		local var_8_0, var_8_1 = ShipStatus.ShipStatusCheck("onModify", arg_7_0:GetShipVO())

		if not var_8_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_8_1)

			return
		end

		arg_7_0:switch2EquipmentSkinPage()
	end)

	if arg_7_0.contextData.isInEquipmentSkinPage then
		arg_7_0.contextData.isInEquipmentSkinPage = nil

		triggerButton(arg_7_0.equipSkinBtn)
	end
end

function var_0_0.OnSelected(arg_9_0, arg_9_1)
	local var_9_0 = pg.UIMgr.GetInstance()

	if arg_9_1 then
		local var_9_1 = {}
		local var_9_2 = {}
		local var_9_3 = {}

		local function var_9_4(arg_10_0, arg_10_1)
			eachChild(arg_10_0, function(arg_11_0)
				table.insert(arg_10_1, arg_11_0)
			end)
		end

		var_9_4(arg_9_0.equipmentR:Find("skin"), var_9_2)
		var_9_4(arg_9_0.equipmentR:Find("equipment"), var_9_2)
		var_9_4(arg_9_0.equipmentL:Find("skin"), var_9_1)
		var_9_4(arg_9_0.equipmentL:Find("equipment"), var_9_1)
		var_9_4(arg_9_0.equipmentB, var_9_3)
		table.insert(var_9_1, arg_9_0.equipmentL:Find("equipment/equipment_l1"))
		var_9_0:OverlayPanelPB(arg_9_0.equipRCon, {
			pbList = var_9_2,
			groupName = LayerWeightConst.GROUP_SHIPINFOUI,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT,
			weight = LayerWeightConst.LOWER_LAYER
		})
		var_9_0:OverlayPanelPB(arg_9_0.equipLCon, {
			pbList = var_9_1,
			groupName = LayerWeightConst.GROUP_SHIPINFOUI,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT,
			weight = LayerWeightConst.LOWER_LAYER
		})
		var_9_0:OverlayPanelPB(arg_9_0.equipBCon, {
			pbList = var_9_3,
			groupName = LayerWeightConst.GROUP_SHIPINFOUI,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT,
			weight = LayerWeightConst.LOWER_LAYER
		})
	else
		var_9_0:UnOverlayPanel(arg_9_0.equipRCon, arg_9_0._parentTf)
		var_9_0:UnOverlayPanel(arg_9_0.equipLCon, arg_9_0._parentTf)
		var_9_0:UnOverlayPanel(arg_9_0.equipBCon, arg_9_0._parentTf)
	end

	arg_9_0.onSelected = arg_9_1
end

function var_0_0.UpdateEquipments(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:getActiveEquipments()

	for iter_12_0, iter_12_1 in ipairs(arg_12_1.equipments) do
		local var_12_1 = var_12_0[iter_12_0]

		arg_12_0:UpdateEquipmentPanel(iter_12_0, iter_12_1, var_12_1)
	end

	if arg_12_0.equipSkinLogicPanel then
		arg_12_0.equipSkinLogicPanel:updateAll(arg_12_1)
	end

	if arg_12_0.contextData.openEquipUpgrade == true then
		arg_12_0.contextData.openEquipUpgrade = false

		local var_12_2 = 0
		local var_12_3 = arg_12_0:GetShipVO().equipments

		for iter_12_2, iter_12_3 in ipairs(var_12_3) do
			if iter_12_3 then
				var_12_2 = var_12_2 + 1
			end
		end

		if var_12_2 > 0 then
			arg_12_0:emit(ShipMainMediator.OPEN_EQUIP_UPGRADE, arg_12_0:GetShipVO().id)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("fightfail_noequip"))
		end
	end

	setActive(arg_12_0.equipmentB, arg_12_1:IsSpweaponUnlock() and not LOCK_SP_WEAPON)

	local var_12_4 = arg_12_1:GetSpWeapon()

	arg_12_0:UpdateSpWeaponPanel(var_12_4)
end

function var_0_0.UpdateEquipmentPanel(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = arg_13_0.equipmentPanels[arg_13_1]
	local var_13_1 = findTF(var_13_0, "info")
	local var_13_2 = findTF(var_13_0, "empty")
	local var_13_3 = findTF(var_13_1, "efficiency")

	setActive(var_13_1, arg_13_2)
	setActive(var_13_2, not arg_13_2)

	local var_13_4 = arg_13_0:GetShipVO()
	local var_13_5 = {}
	local var_13_6 = {}
	local var_13_7 = var_13_4:GetSpWeapon()

	if var_13_7 and var_13_7:GetUpgradableSkillInfo().unlock then
		local var_13_8 = var_13_7:GetUpgradableSkillInfo()

		table.insert(var_13_6, var_13_7:GetUpgradableSkillIds()[1][1])

		local var_13_9 = var_13_8.skillId
		local var_13_10 = ys.Battle.BattleDataFunction.GetBuffTemplate(var_13_9, var_13_8.lv)

		if var_13_10.shipInfoScene and var_13_10.shipInfoScene.equip then
			for iter_13_0, iter_13_1 in ipairs(var_13_10.shipInfoScene.equip) do
				table.insert(var_13_5, iter_13_1)
			end
		end
	end

	for iter_13_2, iter_13_3 in pairs(var_13_4.skills) do
		if not table.contains(var_13_6, iter_13_3.id) then
			local var_13_11 = ys.Battle.BattleDataFunction.GetBuffTemplate(iter_13_3.id, iter_13_3.level)

			if var_13_11.shipInfoScene and var_13_11.shipInfoScene.equip then
				for iter_13_4, iter_13_5 in ipairs(var_13_11.shipInfoScene.equip) do
					table.insert(var_13_5, iter_13_5)
				end
			end
		end
	end

	if var_13_7 and var_13_7:GetEffect() ~= 0 then
		local var_13_12 = var_13_7:GetEffect()
		local var_13_13 = ys.Battle.BattleDataFunction.GetBuffTemplate(var_13_12, 1)

		if var_13_13.shipInfoScene and var_13_13.shipInfoScene.equip then
			for iter_13_6, iter_13_7 in ipairs(var_13_13.shipInfoScene.equip) do
				table.insert(var_13_5, iter_13_7)
			end
		end
	end

	local var_13_14 = findTF(var_13_0, "panel_title/type")
	local var_13_15 = findTF(var_13_0, "skin_icon")

	if var_13_15 then
		setActive(var_13_15, arg_13_2 and arg_13_2:hasSkin())
	end

	local var_13_16 = EquipType.Types2Title(arg_13_1, var_13_4.configId)
	local var_13_17 = EquipType.LabelToName(var_13_16)

	var_13_14:GetComponent(typeof(Text)).text = var_13_17

	if arg_13_2 then
		setActive(var_13_3, not arg_13_2:isDevice())

		if not arg_13_2:isDevice() then
			local var_13_18 = pg.ship_data_statistics[var_13_4.configId]
			local var_13_19 = var_13_4:getEquipProficiencyByPos(arg_13_1)
			local var_13_20 = var_13_19 and var_13_19 * 100 or 0
			local var_13_21 = false

			if not (var_13_4:getFlag("inWorld") and arg_13_0.contextData.fromMediatorName == WorldMediator.__cname and WorldConst.FetchWorldShip(var_13_4.id):IsBroken()) then
				for iter_13_8, iter_13_9 in ipairs(var_13_5) do
					if arg_13_0:equipmentCheck(iter_13_9) and arg_13_0.equipmentEnhance(iter_13_9, arg_13_2) then
						var_13_20 = var_13_20 + iter_13_9.number
						var_13_21 = true
					end
				end
			end

			if var_13_20 - calcFloor(var_13_20) > 1e-09 then
				var_13_20 = string.format("%.1f", var_13_20)
				GetComponent(findTF(var_13_3, "Text"), typeof(Text)).fontSize = 45
			else
				GetComponent(findTF(var_13_3, "Text"), typeof(Text)).fontSize = 50
			end

			setButtonText(var_13_3, var_13_21 and setColorStr(var_13_20 .. "%", COLOR_GREEN) or var_13_20 .. "%")
		end

		local var_13_22 = arg_13_0:findTF("IconTpl", var_13_1)

		updateEquipment(var_13_22, arg_13_2)

		local var_13_23 = arg_13_2:getConfig("name")

		if arg_13_2:getConfig("ammo_icon")[1] then
			setActive(findTF(var_13_1, "cont/icon_ammo"), true)
			setImageSprite(findTF(var_13_1, "cont/icon_ammo"), GetSpriteFromAtlas("ammo", arg_13_2:getConfig("ammo_icon")[1]))
		else
			setActive(findTF(var_13_1, "cont/icon_ammo"), false)
		end

		setScrollText(arg_13_0.equipmentPanels[arg_13_1]:Find("info/cont/name_mask/name"), var_13_23)

		local var_13_24 = var_13_1:Find("attrs")

		eachChild(var_13_24, function(arg_14_0)
			setActive(arg_14_0, false)
		end)

		local var_13_25 = arg_13_2:GetPropertiesInfo().attrs
		local var_13_26 = underscore.filter(var_13_25, function(arg_15_0)
			return not arg_15_0.type or arg_15_0.type ~= AttributeType.AntiSiren
		end)
		local var_13_27 = arg_13_2:getConfig("skill_id")
		local var_13_28 = var_13_27[1] and var_13_27[1][1]
		local var_13_29 = var_13_28 and arg_13_2:isDevice() and {
			1,
			2,
			5
		} or {
			1,
			4,
			2,
			3
		}

		for iter_13_10, iter_13_11 in ipairs(var_13_29) do
			local var_13_30 = var_13_24:Find("attr_" .. iter_13_11)
			local var_13_31 = findTF(var_13_30, "panel")
			local var_13_32 = findTF(var_13_30, "lock")

			setActive(var_13_30, true)

			if iter_13_11 == 5 then
				setText(var_13_31:Find("values/value"), "")

				local var_13_33 = getSkillName(var_13_28)

				if PLATFORM_CODE == PLATFORM_US and string.len(var_13_33) > 15 then
					GetComponent(var_13_31:Find("values/value_1"), typeof(Text)).fontSize = 24
				end

				setText(var_13_31:Find("values/value_1"), getSkillName(var_13_28))
				setActive(var_13_32, false)
			elseif #var_13_26 > 0 then
				local var_13_34 = table.remove(var_13_26, 1)

				if arg_13_2:isAircraft() and var_13_34.type == AttributeType.CD then
					var_13_34 = var_13_4:getAircraftReloadCD()
				end

				local var_13_35, var_13_36 = Equipment.GetInfoTrans(var_13_34, var_13_4)

				setText(var_13_31:Find("tag"), var_13_35)

				local var_13_37 = string.split(tostring(var_13_36), "/")

				if #var_13_37 >= 2 then
					setText(var_13_31:Find("values/value"), var_13_37[1] .. "/")
					setText(var_13_31:Find("values/value_1"), var_13_37[2])
				else
					setText(var_13_31:Find("values/value"), var_13_36)
					setText(var_13_31:Find("values/value_1"), "")
				end

				setActive(var_13_32, false)
			else
				setText(var_13_31:Find("tag"), "")
				setText(var_13_31:Find("values/value"), "")
				setText(var_13_31:Find("values/value_1"), "")
				setActive(var_13_32, true)
			end
		end

		onButton(arg_13_0, var_13_0, function()
			arg_13_0:emit(BaseUI.ON_EQUIPMENT, {
				type = EquipmentInfoMediator.TYPE_SHIP,
				shipId = var_13_4.id,
				pos = arg_13_1,
				LayerWeightMgr_weight = LayerWeightConst.SECOND_LAYER,
				onRemoved = function()
					arg_13_0:setEquipDescVisible(true)
				end
			})
			arg_13_0:setEquipDescVisible(false)
		end, SFX_UI_DOCKYARD_EQUIPADD)
	else
		onButton(arg_13_0, var_13_0, function()
			if var_13_4 then
				local var_18_0, var_18_1 = ShipStatus.ShipStatusCheck("onModify", var_13_4)

				if not var_18_0 then
					pg.TipsMgr.GetInstance():ShowTips(var_18_1)

					return
				end

				arg_13_0:emit(ShipMainMediator.ON_SELECT_EQUIPMENT, arg_13_1)
			end
		end, SFX_UI_DOCKYARD_EQUIPADD)
	end
end

function var_0_0.setEquipDescVisible(arg_19_0, arg_19_1)
	if not arg_19_0.equipmentPanels then
		return
	end

	for iter_19_0 = 1, #arg_19_0.equipmentPanels do
		local var_19_0 = arg_19_0.equipmentPanels[iter_19_0]

		if var_19_0 then
			local var_19_1 = var_19_0:Find("info/cont/name_mask/name")
			local var_19_2 = GetComponent(var_19_1, typeof(ScrollText))

			if var_19_2 then
				var_19_2:SetVisible(arg_19_1)
			end
		end
	end
end

function var_0_0.equipmentCheck(arg_20_0, arg_20_1)
	if not arg_20_0:GetShipVO() then
		return false
	end

	local var_20_0 = arg_20_1.check_type
	local var_20_1 = arg_20_1.check_indexList
	local var_20_2 = arg_20_1.check_label

	if not var_20_0 and not var_20_1 and not var_20_2 then
		return true
	end

	local var_20_3 = false
	local var_20_4 = {}
	local var_20_5 = Clone(arg_20_0:GetShipVO().equipments)

	if var_20_1 then
		local var_20_6 = #var_20_5

		while var_20_6 > 0 do
			if not table.contains(var_20_1, var_20_6) then
				table.remove(var_20_5, var_20_6)
			end

			var_20_6 = var_20_6 - 1
		end
	end

	if var_20_0 then
		local var_20_7 = #var_20_5

		while var_20_7 > 0 do
			local var_20_8 = var_20_5[var_20_7]

			if not var_20_8 or not table.contains(var_20_0, var_20_8:getConfig("type")) then
				table.remove(var_20_5, var_20_7)
			end

			var_20_7 = var_20_7 - 1
		end
	end

	if var_20_2 then
		local var_20_9 = #var_20_5

		while var_20_9 > 0 do
			local var_20_10 = var_20_5[var_20_9]

			if var_20_10 then
				local var_20_11 = 1

				for iter_20_0, iter_20_1 in ipairs(var_20_2) do
					if not table.contains(var_20_10:getConfig("label"), iter_20_1) then
						var_20_11 = var_20_11 * 0
					end
				end

				if var_20_11 == 0 then
					table.remove(var_20_5, var_20_9)
				end
			else
				table.remove(var_20_5, var_20_9)
			end

			var_20_9 = var_20_9 - 1
		end
	end

	return #var_20_5 > 0
end

function var_0_0.equipmentEnhance(arg_21_0, arg_21_1)
	local var_21_0 = 1
	local var_21_1 = arg_21_1:getConfig("label")

	if arg_21_0.label then
		var_21_0 = 1

		for iter_21_0, iter_21_1 in ipairs(arg_21_0.label) do
			if not table.contains(var_21_1, iter_21_1) then
				var_21_0 = 0

				break
			end
		end
	end

	return var_21_0 == 1
end

function var_0_0.UpdateSpWeaponPanel(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.equipmentB1
	local var_22_1 = findTF(var_22_0, "info")
	local var_22_2 = findTF(var_22_0, "empty")

	setActive(var_22_1, arg_22_1)
	setActive(var_22_2, not arg_22_1)

	local var_22_3 = arg_22_0:GetShipVO()

	assert(var_22_3)

	if arg_22_1 then
		UpdateSpWeaponSlot(var_22_1, arg_22_1, {
			20,
			20,
			20,
			20
		})

		local var_22_4 = var_22_1:Find("attrs")

		eachChild(var_22_4, function(arg_23_0)
			setActive(arg_23_0, false)
		end)

		local var_22_5 = arg_22_1:GetPropertiesInfo().attrs
		local var_22_6 = underscore.filter(var_22_5, function(arg_24_0)
			return not arg_24_0.type or arg_24_0.type ~= AttributeType.AntiSiren
		end)

		for iter_22_0 = 1, 2 do
			local var_22_7 = var_22_4:GetChild(iter_22_0 - 1)

			setActive(var_22_7, true)

			if #var_22_6 > 0 then
				local var_22_8 = table.remove(var_22_6, 1)
				local var_22_9, var_22_10 = Equipment.GetInfoTrans(var_22_8, var_22_3)

				setText(var_22_7:Find("tag"), var_22_9)
				setText(var_22_7:Find("values/value"), var_22_10)
				setText(var_22_7:Find("values/value_1"), "")
			end
		end

		Canvas.ForceUpdateCanvases()

		local var_22_11 = var_22_1:Find("cont")

		;(function()
			local var_25_0 = var_22_11:GetChild(0)

			setText(var_25_0:Find("tag"), i18n("spweapon_ui_effect_tag"))

			local var_25_1 = arg_22_1:GetEffect()

			setActive(var_25_0, var_25_1 and var_25_1 > 0)

			if not var_25_1 or not (var_25_1 > 0) then
				return
			end

			setScrollText(var_25_0:Find("value/Text"), getSkillName(var_25_1))
		end)()

		local function var_22_12(arg_26_0)
			local var_26_0 = var_22_11:GetChild(1)

			setText(var_26_0:Find("tag"), i18n("spweapon_ui_skill_tag"))
			setActive(var_26_0, arg_26_0 and arg_26_0 > 0)

			if not arg_26_0 or not (arg_26_0 > 0) then
				return
			end

			setScrollText(var_26_0:Find("value/Text"), getSkillName(arg_26_0))
		end

		local var_22_13 = arg_22_1:GetActiveUpgradableSkillList(var_22_3)

		if #var_22_13 == 0 then
			setActive(var_22_11:GetChild(1), false)
		else
			var_22_12(var_22_13[1].mapSkillID)
		end

		onButton(arg_22_0, var_22_0, function()
			arg_22_0:emit(BaseUI.ON_SPWEAPON, {
				type = SpWeaponInfoLayer.TYPE_SHIP,
				shipId = var_22_3.id
			})
		end, SFX_UI_DOCKYARD_EQUIPADD)
	else
		onButton(arg_22_0, var_22_0, function()
			if var_22_3 then
				local var_28_0, var_28_1 = ShipStatus.ShipStatusCheck("onModify", var_22_3)

				if not var_28_0 then
					pg.TipsMgr.GetInstance():ShowTips(var_28_1)

					return
				end

				arg_22_0:emit(ShipMainMediator.ON_SELECT_SPWEAPON)
			end
		end, SFX_UI_DOCKYARD_EQUIPADD)
	end
end

function var_0_0.switch2EquipmentSkinPage(arg_29_0)
	if arg_29_0.equipSkinLogicPanel:isTweening() then
		return
	end

	arg_29_0.equipSkinLogicPanel:doSwitchAnim(arg_29_0.contextData.isInEquipmentSkinPage)

	arg_29_0.contextData.isInEquipmentSkinPage = not arg_29_0.contextData.isInEquipmentSkinPage

	setActive(arg_29_0.equipSkinBtn:Find("unsel"), not arg_29_0.contextData.isInEquipmentSkinPage)
	setActive(arg_29_0.equipSkinBtn:Find("sel"), arg_29_0.contextData.isInEquipmentSkinPage)
	arg_29_0.equipSkinLogicPanel:updateAll(arg_29_0:GetShipVO())
end

function var_0_0.OnDestroy(arg_30_0)
	setParent(arg_30_0.equipmentR, arg_30_0._tf)
	setParent(arg_30_0.equipmentL, arg_30_0._tf)
	setParent(arg_30_0.equipmentB, arg_30_0._tf)

	arg_30_0.shareData = nil
end

return var_0_0
