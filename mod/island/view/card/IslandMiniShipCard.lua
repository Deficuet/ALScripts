local var_0_0 = class("IslandMiniShipCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.go = arg_1_1
	arg_1_0.tf = arg_1_1.transform
	arg_1_0.addBtn = arg_1_0.tf:Find("add")
	arg_1_0.iconTr = arg_1_0.tf:Find("icon")
	arg_1_0.selected = arg_1_0.tf:Find("sel")
	arg_1_0.selImg = arg_1_0.tf:Find("sel_1"):GetComponent(typeof(Image))
	arg_1_0.redDot = arg_1_0.tf:Find("red_dot")
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.configId = arg_2_1
	arg_2_0.ship = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_2_1)

	setActive(arg_2_0.addBtn, not arg_2_0.ship)

	local var_2_0 = IslandShip.StaticGetPrefab(arg_2_1)

	GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_2_0, "", arg_2_0.iconTr)
	arg_2_0:UpdateSelected(arg_2_2)
	arg_2_0:FlushRedDot()
end

function var_0_0.FlushRedDot(arg_3_0)
	setActive(arg_3_0.redDot, false)
end

function var_0_0.UpdateSelected(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 == arg_4_0.configId

	setActive(arg_4_0.selected, var_4_0)
end

function var_0_0.Dispose(arg_5_0)
	return
end

return var_0_0
