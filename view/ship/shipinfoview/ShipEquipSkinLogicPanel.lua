local var_0_0 = class("ShipEquipSkinLogicPanel", import("...base.BasePanel"))
local var_0_1 = 0.2

function var_0_0.init(arg_1_0)
	arg_1_0.equipmentTFs = {
		arg_1_0._tf:Find("equipment_r/skin/equipment_r1"),
		arg_1_0._tf:Find("equipment_r/skin/equipment_r2"),
		arg_1_0._tf:Find("equipment_r/skin/equipment_r3"),
		arg_1_0._tf:Find("equipment_l/skin/equipment_l1"),
		arg_1_0._tf:Find("equipment_l/skin/equipment_l2")
	}
	arg_1_0.equipmentNormalTFs = {
		arg_1_0._tf:Find("equipment_r/equipment/equipment_r1"),
		arg_1_0._tf:Find("equipment_r/equipment/equipment_r2"),
		arg_1_0._tf:Find("equipment_r/equipment/equipment_r3"),
		arg_1_0._tf:Find("equipment_l/equipment/equipment_l1"),
		arg_1_0._tf:Find("equipment_l/equipment/equipment_l2")
	}
	arg_1_0.spweaponNormalTF = arg_1_0._tf:Find("equipment_b/equipment")
	arg_1_0.equipmentR = arg_1_0._tf:Find("equipment_r/equipment")
	arg_1_0.equipmentL = arg_1_0._tf:Find("equipment_l/equipment")
	arg_1_0.skinR = arg_1_0._tf:Find("equipment_r/skin")
	arg_1_0.skinL = arg_1_0._tf:Find("equipment_l/skin")
	arg_1_0.infoPanel = arg_1_0.equipmentTFs[1]:Find("info")
	arg_1_0.inSkinPage = true

	for iter_1_0 = 1, 3 do
		local var_1_0 = findTF(arg_1_0.skinR, "equipment_r" .. iter_1_0 .. "/info/equip/info/unMatch/txt")

		setText(var_1_0, i18n("equipskin_typewrong"))

		local var_1_1 = findTF(arg_1_0.skinR, "equipment_r" .. iter_1_0 .. "/info/equip/info/unMatch/forbid_en")

		setText(var_1_1, i18n("equipskin_typewrong_en"))

		local var_1_2 = findTF(arg_1_0.skinR, "equipment_r" .. iter_1_0 .. "/info/equip/add/Text")

		setText(var_1_2, i18n("equipskin_add"))

		local var_1_3 = findTF(arg_1_0.skinR, "equipment_r" .. iter_1_0 .. "/info/forbid")

		setText(var_1_3, i18n("equipskin_none"))
	end

	for iter_1_1 = 1, 2 do
		local var_1_4 = arg_1_0.equipmentTFs[3 + iter_1_1]
		local var_1_5 = var_1_4:Find("info")

		if IsNil(var_1_5) then
			local var_1_6 = cloneTplTo(arg_1_0.infoPanel, var_1_4, "info")
		end

		local var_1_7 = findTF(arg_1_0.skinL, "equipment_l" .. iter_1_1 .. "/forbid")

		setActive(var_1_7, false)

		local var_1_8 = findTF(arg_1_0.skinL, "equipment_l" .. iter_1_1 .. "/info/equip/info/unMatch/txt")

		setText(var_1_8, i18n("equipskin_typewrong"))

		local var_1_9 = findTF(arg_1_0.skinL, "equipment_l" .. iter_1_1 .. "/info/equip/info/unMatch/forbid_en")

		setText(var_1_9, i18n("equipskin_typewrong_en"))

		local var_1_10 = findTF(arg_1_0.skinL, "equipment_l" .. iter_1_1 .. "/info/equip/add/Text")

		setText(var_1_10, i18n("equipskin_add"))

		local var_1_11 = findTF(arg_1_0.skinL, "equipment_l" .. iter_1_1 .. "/info/forbid")

		setText(var_1_11, i18n("equipskin_none"))
	end

	for iter_1_2 = 1, #arg_1_0.equipmentNormalTFs do
		local var_1_12 = findTF(arg_1_0.equipmentNormalTFs[iter_1_2], "empty/tip")

		setText(var_1_12, i18n("equip_add"))
	end

	local var_1_13 = findTF(arg_1_0.spweaponNormalTF, "empty/tip")

	setText(var_1_13, i18n("equip_add"))
end

function var_0_0.setLabelResource(arg_2_0, arg_2_1)
	arg_2_0.resource = arg_2_1
end

function var_0_0.doSwitchAnim(arg_3_0, arg_3_1)
	if arg_3_0:isTweening() then
		return
	end

	arg_3_0.inSkinPage = arg_3_1

	arg_3_0:doAnim(arg_3_0.equipmentR, arg_3_0.skinR)
	arg_3_0:doAnim(arg_3_0.equipmentL, arg_3_0.skinL)
end

function var_0_0.isTweening(arg_4_0)
	if LeanTween.isTweening(go(arg_4_0.equipmentR)) or LeanTween.isTweening(go(arg_4_0.skinR)) or LeanTween.isTweening(go(arg_4_0.equipmentL)) or LeanTween.isTweening(go(arg_4_0.skinL)) then
		return true
	end

	return false
end

function var_0_0.doAnim(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_2.localPosition
	local var_5_1 = arg_5_1.localPosition
	local var_5_2 = arg_5_1:GetComponent(typeof(CanvasGroup))
	local var_5_3 = arg_5_2:GetComponent(typeof(CanvasGroup))

	LeanTween.moveLocal(go(arg_5_1), var_5_0, var_0_1)
	LeanTween.moveLocal(go(arg_5_2), var_5_1, var_0_1)

	local var_5_4 = 0.8
	local var_5_5 = 1

	if not arg_5_0.inSkinPage then
		var_5_4, var_5_5 = 1, 0.8
	end

	LeanTween.value(go(arg_5_1), var_5_4, var_5_5, var_0_1):setOnUpdate(System.Action_float(function(arg_6_0)
		var_5_2.alpha = arg_6_0
	end))
	LeanTween.value(go(arg_5_2), var_5_5, var_5_4, var_0_1):setOnUpdate(System.Action_float(function(arg_7_0)
		var_5_3.alpha = arg_7_0
	end))

	var_5_3.blocksRaycasts = not arg_5_0.inSkinPage
	var_5_2.blocksRaycasts = arg_5_0.inSkinPage

	;(not arg_5_0.inSkinPage and arg_5_2 or arg_5_1):SetAsLastSibling()
end

function var_0_0.updateAll(arg_8_0, arg_8_1)
	if arg_8_1 then
		for iter_8_0, iter_8_1 in ipairs(arg_8_0.equipmentTFs) do
			if not not table.contains(ShipEquipView.UNLOCK_EQUIPMENT_SKIN_POS, iter_8_0) then
				arg_8_0:updateEquipmentTF(arg_8_1, iter_8_0)
			end

			local var_8_0 = iter_8_1:Find("shadow")

			if var_8_0 then
				setActive(var_8_0, arg_8_0.inSkinPage)
			end
		end

		for iter_8_2, iter_8_3 in ipairs(arg_8_0.equipmentNormalTFs) do
			local var_8_1 = iter_8_3:Find("shadow")

			if var_8_1 then
				setActive(var_8_1, not arg_8_0.inSkinPage)
			end
		end
	end
end

function var_0_0.updateEquipmentTF(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.shipVO = arg_9_1

	if arg_9_1 then
		local var_9_0 = arg_9_0.equipmentTFs[arg_9_2]

		removeOnButton(var_9_0)

		local var_9_1 = arg_9_1:getEquip(arg_9_2)
		local var_9_2 = arg_9_1:getEquipSkin(arg_9_2)
		local var_9_3 = var_9_0:Find("info")

		if IsNil(var_9_3) then
			var_9_3 = cloneTplTo(arg_9_0.infoPanel, var_9_0, "info")
		end

		local var_9_4 = var_9_0:Find("panel_title/type")
		local var_9_5 = EquipType.Types2Title(arg_9_2, arg_9_0.shipVO.configId)
		local var_9_6 = EquipType.LabelToName(var_9_5)

		var_9_4:GetComponent(typeof(Text)).text = var_9_6

		setActive(var_9_0:Find("unequip"), false)

		local var_9_7 = arg_9_1:getCanEquipSkin(arg_9_2)

		setActive(var_9_3:Find("forbid"), not var_9_7)

		local var_9_8 = var_9_3:Find("equip")

		setActive(var_9_8, var_9_7)

		if var_9_7 then
			arg_9_0:updateEquipmentPanel(var_9_8, arg_9_2)
		end
	end
end

function var_0_0.updateEquipmentPanel(arg_10_0, arg_10_1, arg_10_2)
	if not arg_10_0.shipVO:getCanEquipSkin(arg_10_2) then
		return
	end

	local var_10_0 = arg_10_0.shipVO:getEquipSkin(arg_10_2) ~= 0
	local var_10_1 = arg_10_0.shipVO:getEquip(arg_10_2)
	local var_10_2 = arg_10_0.shipVO:getEquipSkin(arg_10_2)
	local var_10_3 = false

	if var_10_2 ~= 0 then
		if var_10_1 then
			local var_10_4 = var_10_1:getType()
			local var_10_5 = pg.equip_skin_template[var_10_2].equip_type

			if not table.contains(var_10_5, var_10_4) then
				var_10_3 = true
			end
		else
			var_10_3 = true
		end
	end

	local var_10_6 = arg_10_1:Find("add")
	local var_10_7 = arg_10_1:Find("info")
	local var_10_8 = var_10_7:Find("unMatch")
	local var_10_9 = var_10_7:Find("desc")

	setActive(var_10_7, var_10_0)
	setActive(var_10_6, not var_10_0)
	setActive(var_10_8, var_10_3)
	setActive(var_10_9, not var_10_3)

	if var_10_0 then
		arg_10_0:updateSkinInfo(var_10_7, var_10_2)
		onButton(arg_10_0, arg_10_0.equipmentTFs[arg_10_2], function()
			arg_10_0:emit(ShipMainMediator.ON_SELECT_EQUIPMENT_SKIN, arg_10_2)
		end, SFX_PANEL)
	else
		onButton(arg_10_0, var_10_6:Find("icon"), function()
			arg_10_0:emit(ShipMainMediator.ON_SELECT_EQUIPMENT_SKIN, arg_10_2)
		end, SFX_PANEL)
	end
end

function var_0_0.updateSkinInfo(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = pg.equip_skin_template[arg_13_2]

	assert(var_13_0, "miss config equip_skin_template >>" .. arg_13_2)
	setText(arg_13_1:Find("desc"), var_13_0.desc)
	setText(arg_13_1:Find("cont/name_mask/name"), shortenString(var_13_0.name, 10))
	updateDrop(arg_13_1:Find("IconTpl"), {
		type = DROP_TYPE_EQUIPMENT_SKIN,
		id = arg_13_2
	})
end

return var_0_0
