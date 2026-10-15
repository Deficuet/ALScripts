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

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ammo"
	}

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))

	return var_2_0
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:InitEquipment()
end

function var_0_0.SetShareData(arg_4_0, arg_4_1)
	arg_4_0.shareData = arg_4_1
end

function var_0_0.GetShipVO(arg_5_0)
	if arg_5_0.shareData and arg_5_0.shareData.shipVO then
		return arg_5_0.shareData.shipVO
	end

	return nil
end

function var_0_0.UpdateUI(arg_6_0)
	local var_6_0 = arg_6_0:GetShipVO()

	arg_6_0:UpdateEquipments(var_6_0)
end

function var_0_0.InitEquipment(arg_7_0)
	arg_7_0.mainPanel = arg_7_0._parentTf.parent
	arg_7_0.equipRCon = arg_7_0._parentTf:Find("equipment_r_container")
	arg_7_0.equipLCon = arg_7_0._parentTf:Find("equipment_l_container")
	arg_7_0.equipBCon = arg_7_0._parentTf:Find("equipment_b_container")
	arg_7_0.equipmentR = arg_7_0._tf:Find("equipment_r")
	arg_7_0.equipmentL = arg_7_0._tf:Find("equipment_l")
	arg_7_0.equipmentB = arg_7_0._tf:Find("equipment_b")
	arg_7_0.equipmentR1 = arg_7_0.equipmentR:Find("equipment/equipment_r1")
	arg_7_0.equipmentR2 = arg_7_0.equipmentR:Find("equipment/equipment_r2")
	arg_7_0.equipmentR3 = arg_7_0.equipmentR:Find("equipment/equipment_r3")
	arg_7_0.equipmentL1 = arg_7_0.equipmentL:Find("equipment/equipment_l1")
	arg_7_0.equipmentL2 = arg_7_0.equipmentL:Find("equipment/equipment_l2")
	arg_7_0.equipSkinBtn = arg_7_0.equipmentR:Find("equipment_skin_btn")
	arg_7_0.equipmentB1 = arg_7_0.equipmentB:Find("equipment")
	arg_7_0.resource = arg_7_0._tf:Find("resource")
	arg_7_0.equipSkinLogicPanel = ShipEquipSkinLogicPanel.New(arg_7_0._tf.gameObject)

	arg_7_0.equipSkinLogicPanel:attach(arg_7_0)
	arg_7_0.equipSkinLogicPanel:setLabelResource(arg_7_0.resource)
	setActive(arg_7_0.equipSkinLogicPanel._go, true)
	setParent(arg_7_0.equipmentR, arg_7_0.equipRCon)
	setParent(arg_7_0.equipmentL, arg_7_0.equipLCon)
	setParent(arg_7_0.equipmentB, arg_7_0.equipBCon)
	setActive(arg_7_0.equipmentR, true)
	setActive(arg_7_0.equipmentL, true)
	setActive(arg_7_0.equipmentB, true)
	setActive(arg_7_0.equipSkinBtn, true)

	arg_7_0.equipmentPanels = {
		arg_7_0.equipmentR1,
		arg_7_0.equipmentR2,
		arg_7_0.equipmentR3,
		arg_7_0.equipmentL1,
		arg_7_0.equipmentL2
	}
	arg_7_0.onSelected = false
end

function var_0_0.InitEvent(arg_8_0)
	onButton(arg_8_0, arg_8_0.equipSkinBtn, function()
		local var_9_0, var_9_1 = ShipStatus.ShipStatusCheck("onModify", arg_8_0:GetShipVO())

		if not var_9_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_9_1)

			return
		end

		arg_8_0:switch2EquipmentSkinPage()
	end)

	if arg_8_0.contextData.isInEquipmentSkinPage then
		arg_8_0.contextData.isInEquipmentSkinPage = nil

		triggerButton(arg_8_0.equipSkinBtn)
	end
end

function var_0_0.OnSelected(arg_10_0, arg_10_1)
	if arg_10_1 then
		local var_10_0 = {}
		local var_10_1 = {}
		local var_10_2 = {}

		local function var_10_3(arg_11_0, arg_11_1)
			eachChild(arg_11_0, function(arg_12_0)
				table.insert(arg_11_1, arg_12_0)
			end)
		end

		var_10_3(arg_10_0.equipmentR:Find("skin"), var_10_1)
		var_10_3(arg_10_0.equipmentR:Find("equipment"), var_10_1)
		var_10_3(arg_10_0.equipmentL:Find("skin"), var_10_0)
		var_10_3(arg_10_0.equipmentL:Find("equipment"), var_10_0)
		var_10_3(arg_10_0.equipmentB, var_10_2)
		table.insert(var_10_0, arg_10_0.equipmentL:Find("equipment/equipment_l1"))
		arg_10_0:OverlayPanel(arg_10_0.equipRCon, {
			groupDelta = -1,
			pbList = var_10_1,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
		arg_10_0:OverlayPanel(arg_10_0.equipLCon, {
			groupDelta = -1,
			pbList = var_10_0,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
		arg_10_0:OverlayPanel(arg_10_0.equipBCon, {
			groupDelta = -1,
			pbList = var_10_2,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
	else
		arg_10_0:UnOverlayPanel(arg_10_0.equipRCon, arg_10_0._parentTf)
		arg_10_0:UnOverlayPanel(arg_10_0.equipLCon, arg_10_0._parentTf)
		arg_10_0:UnOverlayPanel(arg_10_0.equipBCon, arg_10_0._parentTf)
	end

	arg_10_0.onSelected = arg_10_1
end

function var_0_0.UpdateEquipments(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1:getActiveEquipments()

	for iter_13_0, iter_13_1 in ipairs(arg_13_1.equipments) do
		local var_13_1 = var_13_0[iter_13_0]

		arg_13_0:UpdateEquipmentPanel(iter_13_0, iter_13_1, var_13_1)
	end

	if arg_13_0.equipSkinLogicPanel then
		arg_13_0.equipSkinLogicPanel:updateAll(arg_13_1)
	end

	if arg_13_0.contextData.openEquipUpgrade == true then
		arg_13_0.contextData.openEquipUpgrade = false

		local var_13_2 = 0
		local var_13_3 = arg_13_0:GetShipVO().equipments

		for iter_13_2, iter_13_3 in ipairs(var_13_3) do
			if iter_13_3 then
				var_13_2 = var_13_2 + 1
			end
		end

		if var_13_2 > 0 then
			arg_13_0:emit(ShipMainMediator.OPEN_EQUIP_UPGRADE, arg_13_0:GetShipVO().id)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("fightfail_noequip"))
		end
	end

	setActive(arg_13_0.equipmentB, arg_13_1:IsSpweaponUnlock() and not LOCK_SP_WEAPON)

	local var_13_4 = arg_13_1:GetSpWeapon()

	arg_13_0:UpdateSpWeaponPanel(var_13_4)
end

function var_0_0.UpdateEquipmentPanel(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = arg_14_0.equipmentPanels[arg_14_1]
	local var_14_1 = findTF(var_14_0, "info")
	local var_14_2 = findTF(var_14_0, "empty")
	local var_14_3 = findTF(var_14_1, "efficiency")

	setActive(var_14_1, arg_14_2)
	setActive(var_14_2, not arg_14_2)

	local var_14_4 = arg_14_0:GetShipVO()
	local var_14_5 = {}
	local var_14_6 = {}
	local var_14_7 = var_14_4:GetSpWeapon()

	if var_14_7 then
		local var_14_8 = var_14_7:GetUpgradableSkillInfo()

		for iter_14_0, iter_14_1 in ipairs(var_14_8) do
			if iter_14_1.unlock then
				table.insert(var_14_6, var_14_7:GetUpgradableSkillIds()[1][1])

				local var_14_9 = iter_14_1.skillId
				local var_14_10 = ys.Battle.BattleDataFunction.GetBuffTemplate(var_14_9, iter_14_1.lv)

				if var_14_10.shipInfoScene and var_14_10.shipInfoScene.equip then
					for iter_14_2, iter_14_3 in ipairs(var_14_10.shipInfoScene.equip) do
						table.insert(var_14_5, iter_14_3)
					end
				end
			end
		end
	end

	for iter_14_4, iter_14_5 in pairs(var_14_4.skills) do
		if not table.contains(var_14_6, iter_14_5.id) then
			local var_14_11 = ys.Battle.BattleDataFunction.GetBuffTemplate(iter_14_5.id, iter_14_5.level)

			if var_14_11.shipInfoScene and var_14_11.shipInfoScene.equip then
				for iter_14_6, iter_14_7 in ipairs(var_14_11.shipInfoScene.equip) do
					table.insert(var_14_5, iter_14_7)
				end
			end
		end
	end

	if var_14_7 and var_14_7:GetEffect() ~= 0 then
		local var_14_12 = var_14_7:GetEffect()
		local var_14_13 = ys.Battle.BattleDataFunction.GetBuffTemplate(var_14_12, 1)

		if var_14_13.shipInfoScene and var_14_13.shipInfoScene.equip then
			for iter_14_8, iter_14_9 in ipairs(var_14_13.shipInfoScene.equip) do
				table.insert(var_14_5, iter_14_9)
			end
		end
	end

	local var_14_14 = findTF(var_14_0, "panel_title/type")
	local var_14_15 = findTF(var_14_0, "skin_icon")

	if var_14_15 then
		setActive(var_14_15, arg_14_2 and arg_14_2:hasSkin())
	end

	local var_14_16 = EquipType.Types2Title(arg_14_1, var_14_4.configId)
	local var_14_17 = EquipType.LabelToName(var_14_16)

	var_14_14:GetComponent(typeof(Text)).text = var_14_17

	if arg_14_2 then
		setActive(var_14_3, not arg_14_2:isDevice())

		if not arg_14_2:isDevice() then
			local var_14_18 = pg.ship_data_statistics[var_14_4.configId]
			local var_14_19 = var_14_4:getEquipProficiencyByPos(arg_14_1)
			local var_14_20 = var_14_19 and var_14_19 * 100 or 0
			local var_14_21 = false

			if not (var_14_4:getFlag("inWorld") and arg_14_0.contextData.fromMediatorName == WorldMediator.__cname and WorldConst.FetchWorldShip(var_14_4.id):IsBroken()) then
				for iter_14_10, iter_14_11 in ipairs(var_14_5) do
					print(arg_14_0:equipmentCheck(iter_14_11), arg_14_0.equipmentEnhance(iter_14_11, arg_14_2))

					if arg_14_0:equipmentCheck(iter_14_11) and arg_14_0.equipmentEnhance(iter_14_11, arg_14_2) then
						var_14_20 = var_14_20 + iter_14_11.number
						var_14_21 = true
					end
				end
			end

			if var_14_20 - calcFloor(var_14_20) > 1e-09 then
				var_14_20 = string.format("%.1f", var_14_20)
				GetComponent(findTF(var_14_3, "Text"), typeof(Text)).fontSize = 45
			else
				GetComponent(findTF(var_14_3, "Text"), typeof(Text)).fontSize = 50
			end

			setButtonText(var_14_3, var_14_21 and setColorStr(var_14_20 .. "%", COLOR_GREEN) or var_14_20 .. "%")
		end

		local var_14_22 = var_14_1:Find("IconTpl")

		updateEquipment(var_14_22, arg_14_2)

		local var_14_23 = arg_14_2:getConfig("name")

		if arg_14_2:getConfig("ammo_icon")[1] then
			setActive(findTF(var_14_1, "cont/icon_ammo"), true)
			setImageSprite(findTF(var_14_1, "cont/icon_ammo"), GetSpriteFromAtlas("ammo", arg_14_2:getConfig("ammo_icon")[1]))
		else
			setActive(findTF(var_14_1, "cont/icon_ammo"), false)
		end

		setScrollText(arg_14_0.equipmentPanels[arg_14_1]:Find("info/cont/name_mask/name"), var_14_23)

		local var_14_24 = var_14_1:Find("attrs")

		eachChild(var_14_24, function(arg_15_0)
			setActive(arg_15_0, false)
		end)

		local var_14_25 = arg_14_2:GetPropertiesInfo().attrs
		local var_14_26 = underscore.filter(var_14_25, function(arg_16_0)
			return not arg_16_0.type or arg_16_0.type ~= AttributeType.AntiSiren
		end)
		local var_14_27 = arg_14_2:getConfig("skill_id")
		local var_14_28 = var_14_27[1] and var_14_27[1][1]
		local var_14_29 = var_14_28 and arg_14_2:isDevice() and {
			1,
			2,
			5
		} or {
			1,
			4,
			2,
			3
		}

		for iter_14_12, iter_14_13 in ipairs(var_14_29) do
			local var_14_30 = var_14_24:Find("attr_" .. iter_14_13)
			local var_14_31 = findTF(var_14_30, "panel")
			local var_14_32 = findTF(var_14_30, "lock")

			setActive(var_14_30, true)

			if iter_14_13 == 5 then
				setText(var_14_31:Find("values/value"), "")

				local var_14_33 = getSkillName(var_14_28)

				if PLATFORM_CODE == PLATFORM_US and string.len(var_14_33) > 15 then
					GetComponent(var_14_31:Find("values/value_1"), typeof(Text)).fontSize = 24
				end

				setText(var_14_31:Find("values/value_1"), getSkillName(var_14_28))
				setActive(var_14_32, false)
			elseif #var_14_26 > 0 then
				local var_14_34 = table.remove(var_14_26, 1)

				if arg_14_2:isAircraft() and var_14_34.type == AttributeType.CD then
					var_14_34 = var_14_4:getAircraftReloadCD()
				end

				local var_14_35, var_14_36 = Equipment.GetInfoTrans(var_14_34, var_14_4)

				setText(var_14_31:Find("tag"), var_14_35)

				local var_14_37 = string.split(tostring(var_14_36), "/")

				if #var_14_37 >= 2 then
					setText(var_14_31:Find("values/value"), var_14_37[1] .. "/")
					setText(var_14_31:Find("values/value_1"), var_14_37[2])
				else
					setText(var_14_31:Find("values/value"), var_14_36)
					setText(var_14_31:Find("values/value_1"), "")
				end

				setActive(var_14_32, false)
			else
				setText(var_14_31:Find("tag"), "")
				setText(var_14_31:Find("values/value"), "")
				setText(var_14_31:Find("values/value_1"), "")
				setActive(var_14_32, true)
			end
		end

		onButton(arg_14_0, var_14_0, function()
			arg_14_0:emit(BaseUI.ON_EQUIPMENT, {
				type = EquipmentInfoMediator.TYPE_SHIP,
				shipId = var_14_4.id,
				pos = arg_14_1
			})
		end, SFX_UI_DOCKYARD_EQUIPADD)
	else
		onButton(arg_14_0, var_14_0, function()
			if var_14_4 then
				local var_18_0, var_18_1 = ShipStatus.ShipStatusCheck("onModify", var_14_4)

				if not var_18_0 then
					pg.TipsMgr.GetInstance():ShowTips(var_18_1)

					return
				end

				arg_14_0:emit(ShipMainMediator.ON_SELECT_EQUIPMENT, arg_14_1)
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
