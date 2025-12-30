local var_0_0 = class("WinterFestival2025ShrineShipWordView", import(".Shrine2022ShipWordView"))

function var_0_0.getUIName(arg_1_0)
	return "WinterFestival2025ShrineShipWordUI"
end

function var_0_0.setUIData(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("Res")

	arg_2_0.shipWordSpriteList = {}

	local var_2_1 = getImageSprite(var_2_0:Find("ShipWord" .. arg_2_0.curSelectShip))

	arg_2_0.shipWordSpriteList[arg_2_0.curSelectShip] = var_2_1
end

return var_0_0
