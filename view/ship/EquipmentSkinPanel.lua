local var_0_0 = class("EquipmentSkinPanel", import("..base.BasePanel"))
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
	arg_1_0.equipmentR = arg_1_0._tf:Find("equipment_r/equipment")
	arg_1_0.equipmentL = arg_1_0._tf:Find("equipment_l/equipment")
	arg_1_0.skinR = arg_1_0._tf:Find("equipment_r/skin")
	arg_1_0.skinL = arg_1_0._tf:Find("equipment_l/skin")

	setActive(arg_1_0.skinR, not LOCK_EQUIP_SKIN)
	setActive(arg_1_0.skinL, not LOCK_EQUIP_SKIN)

	arg_1_0.infoPanel = arg_1_0.equipmentTFs[1]:Find("info")
	arg_1_0.inSkinPage = true
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

	LeanTween.alphaCanvas(var_5_2, var_5_5, var_0_1):setFrom(var_5_4)
	LeanTween.value(go(arg_5_2), var_5_5, var_5_4, var_0_1):setOnUpdate(System.Action_float(function(arg_6_0)
		var_5_3.alpha = arg_6_0
	end))

	var_5_3.blocksRaycasts = not arg_5_0.inSkinPage
	var_5_2.blocksRaycasts = arg_5_0.inSkinPage

	;(not arg_5_0.inSkinPage and arg_5_2 or arg_5_1):SetAsLastSibling()
end

function var_0_0.updateAll(arg_7_0, arg_7_1)
	if arg_7_1 then
		for iter_7_0, iter_7_1 in ipairs(arg_7_0.equipmentTFs) do
			if not not table.contains(ShipEquipView.UNLOCK_EQUIPMENT_SKIN_POS, iter_7_0) then
				arg_7_0:updateEquipmentTF(arg_7_1, iter_7_0)
			end

			local var_7_0 = iter_7_1:Find("shadow")

			if var_7_0 then
				setActive(var_7_0, arg_7_0.inSkinPage)
			end
		end

		for iter_7_2, iter_7_3 in ipairs(arg_7_0.equipmentNormalTFs) do
			local var_7_1 = iter_7_3:Find("shadow")

			if var_7_1 then
				setActive(var_7_1, not arg_7_0.inSkinPage)
			end
		end
	end
end

function var_0_0.updateEquipmentTF(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.shipVO = arg_8_1

	if arg_8_1 then
		local var_8_0 = arg_8_0.equipmentTFs[arg_8_2]

		removeOnButton(var_8_0)

		local var_8_1 = arg_8_1:getEquip(arg_8_2)
		local var_8_2 = var_8_0:Find("info")

		if IsNil(var_8_2) then
			var_8_2 = cloneTplTo(arg_8_0.infoPanel, var_8_0, "info")
		end

		local var_8_3 = var_8_0:Find("panel_title/type")
		local var_8_4 = EquipType.Types2Title(arg_8_2, arg_8_0.shipVO.configId)
		local var_8_5 = arg_8_0.resource:Find(var_8_4):GetComponent(typeof(Image)).sprite

		var_8_3:GetComponent(typeof(Image)).sprite = var_8_5

		var_8_3:GetComponent(typeof(Image)):SetNativeSize()
		setActive(var_8_2, var_8_1)
		setActive(var_8_0:Find("unequip"), not var_8_1)

		if var_8_1 then
			local var_8_6 = var_8_1:canEquipSkin()

			setActive(var_8_2:Find("forbid"), not var_8_6)

			local var_8_7 = var_8_2:Find("equip")

			setActive(var_8_7, var_8_6)

			if var_8_6 then
				arg_8_0:updateEquipmentPanel(var_8_7, arg_8_2)
			end
		end
	end
end

function var_0_0.updateEquipmentPanel(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.shipVO:getEquip(arg_9_2)
	local var_9_1 = var_9_0.skinId
	local var_9_2 = var_9_0:hasSkin()
	local var_9_3 = arg_9_1:Find("add")
	local var_9_4 = arg_9_1:Find("info")

	setActive(var_9_4, var_9_2)
	setActive(var_9_3, not var_9_2)

	if var_9_2 then
		arg_9_0:updateSkinInfo(var_9_4, var_9_1)
		onButton(arg_9_0, arg_9_0.equipmentTFs[arg_9_2], function()
			arg_9_0:emit(ShipMainMediator.ON_SELECT_EQUIPMENT_SKIN, arg_9_2)
		end, SFX_PANEL)
	else
		onButton(arg_9_0, var_9_3:Find("icon"), function()
			arg_9_0:emit(ShipMainMediator.ON_SELECT_EQUIPMENT_SKIN, arg_9_2)
		end, SFX_PANEL)
	end
end

function var_0_0.updateSkinInfo(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = pg.equip_skin_template[arg_12_2]

	assert(var_12_0, "miss config equip_skin_template >>" .. arg_12_2)
	setText(arg_12_1:Find("desc"), var_12_0.desc)
	setText(arg_12_1:Find("cont/name_mask/name"), var_12_0.name)
	updateDrop(arg_12_1:Find("IconTpl"), {
		type = DROP_TYPE_EQUIPMENT_SKIN,
		id = arg_12_2
	})
end

return var_0_0
