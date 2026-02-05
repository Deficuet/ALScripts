local var_0_0 = class("IslandSelectShipCard")

var_0_0.SKILL_COLOR = {
	Color.NewHex("3DFF00"),
	Color.NewHex("808080")
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.go = arg_1_1
	arg_1_0.tf = arg_1_1.transform
	arg_1_0.selectedTF = arg_1_0.tf:Find("selected")
	arg_1_0.iconTF = arg_1_0.tf:Find("icon")
	arg_1_0.triedMaskTF = arg_1_0.tf:Find("mask/tried")

	setText(arg_1_0.triedMaskTF:Find("Text"), i18n("island_ship_no_energy"))

	arg_1_0.workingMaskTF = arg_1_0.tf:Find("mask/working")
	arg_1_0.workingTextCom = arg_1_0.workingMaskTF:Find("Text"):GetComponent("Text")
	arg_1_0.iconsTF = arg_1_0.tf:Find("icons")
	arg_1_0.skillTF = arg_1_0.iconsTF:Find("skill/tpl")
	arg_1_0.gradeTF = arg_1_0.iconsTF:Find("grade")
	arg_1_0.energySliderTF = arg_1_0.tf:Find("energy_bar")
	arg_1_0.energyTF = arg_1_0.tf:Find("energy_bar/Text")
	arg_1_0.nameTF = arg_1_0.tf:Find("name")
	arg_1_0.levelTF = arg_1_0.tf:Find("level")
	arg_1_0.attrTfList = {
		arg_1_0.gradeTF:Find("SSS"),
		arg_1_0.gradeTF:Find("SS"),
		arg_1_0.gradeTF:Find("S"),
		arg_1_0.gradeTF:Find("A"),
		arg_1_0.gradeTF:Find("B"),
		arg_1_0.gradeTF:Find("C"),
		arg_1_0.gradeTF:Find("D"),
		arg_1_0.gradeTF:Find("E")
	}
	arg_1_0.skillInuse = arg_1_0.iconsTF:Find("skill/skill_bright")
	arg_1_0.skillUnuse = arg_1_0.iconsTF:Find("skill/skill_dark")
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.ship = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_2_1)
	arg_2_0.id = arg_2_1
	arg_2_0.attrType = arg_2_2
	arg_2_0.buildingId = arg_2_3

	arg_2_0:UpdateSelected(arg_2_4)

	local var_2_0 = IslandShip.StaticGetPrefab(arg_2_0.id)

	GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_2_0, "", arg_2_0.iconTF)

	local var_2_1 = arg_2_0.ship:GetAttr(IslandShipAttr.ATTRS[arg_2_0.attrType])
	local var_2_2 = IslandProductTimeHelper.GetAttributeAddPercentByAttribute(arg_2_1, arg_2_0.attrType)

	var_2_1 = var_2_2 ~= 0 and math.floor(var_2_1 * (1 + 0.01 * var_2_2)) or var_2_1

	local var_2_3 = arg_2_0.ship:GetAttrGradeByValue(var_2_1)

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.attrTfList) do
		if iter_2_1 ~= "" then
			local var_2_4 = var_2_3 == iter_2_0

			setActive(iter_2_1, var_2_4)
		end
	end

	local var_2_5 = arg_2_0.ship:GetName()

	setText(arg_2_0.nameTF, shortenString(arg_2_0.ship:GetName(), 5))

	local var_2_6 = arg_2_0.ship:GetCurrentEnergy()
	local var_2_7 = arg_2_0.ship:GetMaxEnergy()

	setSlider(arg_2_0.energySliderTF, 0, 1, var_2_6 / var_2_7)
	setText(arg_2_0.energyTF, var_2_6 .. "/" .. var_2_7)
	setActive(arg_2_0.workingMaskTF, arg_2_0.ship:GetState() ~= IslandShip.STATE_NORMAL)

	local var_2_8 = arg_2_0.ship:GetSkill():IsEffectiveInPlace(arg_2_0.buildingId)

	setActive(arg_2_0.skillInuse, var_2_8)
	setActive(arg_2_0.skillUnuse, not var_2_8)
end

function var_0_0.UpdateSelected(arg_3_0, arg_3_1)
	arg_3_0.selectedIds = arg_3_1

	setActive(arg_3_0.selectedTF, table.contains(arg_3_0.selectedIds, arg_3_0.id))
end

function var_0_0.Dispose(arg_4_0)
	return
end

return var_0_0
