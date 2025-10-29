local var_0_0 = class("IslandShipCard", import(".IslandMiniShipCard"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.go = arg_1_1
	arg_1_0.tf = arg_1_1.transform
	arg_1_0.addBtn = arg_1_0.tf:Find("add")
	arg_1_0.iconTr = arg_1_0.tf:Find("mask/icon")
	arg_1_0.selected = arg_1_0.tf:Find("sel")
	arg_1_0.levelTxt = arg_1_0.tf:Find("Text"):GetComponent(typeof(Text))
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.configId = arg_2_1
	arg_2_0.ship = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_2_1)

	setActive(arg_2_0.addBtn, not arg_2_0.ship)

	local var_2_0 = IslandShip.StaticGetPrefab(arg_2_1)

	GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_2_0, "", arg_2_0.iconTr)

	arg_2_0.levelTxt.text = arg_2_0.ship and "Lv." .. arg_2_0.ship:GetLevel() or ""

	arg_2_0:UpdateSelected(arg_2_2)
end

function var_0_0.Dispose(arg_3_0)
	return
end

return var_0_0
