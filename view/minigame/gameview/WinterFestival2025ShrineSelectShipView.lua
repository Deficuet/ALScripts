local var_0_0 = class("WinterFestival2025ShrineSelectShipView", import(".Shrine2022SelectShipView"))

function var_0_0.getUIName(arg_1_0)
	return "WinterFestival2025ShrineSelectShipUI"
end

function var_0_0.setUIData(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("Res")

	arg_2_0.shipCardSpriteList = {}

	for iter_2_0 = 1, 7 do
		local var_2_1 = getImageSprite(var_2_0:Find("ShipCard" .. iter_2_0))

		table.insert(arg_2_0.shipCardSpriteList, var_2_1)
	end

	arg_2_0.shipNameSpriteList = {}

	for iter_2_1 = 1, 7 do
		local var_2_2 = getImageSprite(var_2_0:Find("ShipName" .. iter_2_1))

		table.insert(arg_2_0.shipNameSpriteList, var_2_2)
	end

	arg_2_0.shipNameTextList = {
		Ship.getShipName(405011),
		Ship.getShipName(105141),
		Ship.getShipName(702051),
		Ship.getShipName(607021),
		Ship.getShipName(202121),
		Ship.getShipName(805011),
		Ship.getShipName(407011)
	}
	arg_2_0.cardPosList = {
		{
			x = -75.5,
			y = 290
		},
		{
			x = -75.5,
			y = 67.5
		},
		{
			x = -75.5,
			y = -155
		},
		{
			x = -75.5,
			y = -377.5
		},
		{
			x = 82,
			y = 290
		},
		{
			x = 82,
			y = 67.5
		},
		{
			x = 82,
			y = -155
		}
	}
	arg_2_0.confirmPosList = {
		{
			x = -372,
			y = 15
		},
		{
			x = -75,
			y = 15
		},
		{
			x = 226,
			y = 15
		},
		{
			x = 523,
			y = 15
		},
		{
			x = -224,
			y = -350
		},
		{
			x = 80,
			y = -350
		},
		{
			x = 380,
			y = -350
		}
	}
end

function var_0_0.updateShipCardUI(arg_3_0, arg_3_1, arg_3_2)
	setImageSprite(arg_3_1, arg_3_0.shipCardSpriteList[arg_3_2], true)

	local var_3_0 = arg_3_1:Find("Name")

	setActive(var_3_0, false)

	local var_3_1 = arg_3_1:Find("NameMask/Name_Text")

	setScrollText(var_3_1, arg_3_0.shipNameTextList[arg_3_2])
	setLocalPosition(arg_3_1, arg_3_0.cardPosList[arg_3_2])

	local var_3_2 = arg_3_1:Find("Selected")
	local var_3_3 = arg_3_0:isSelected(arg_3_2)

	setActive(var_3_2, var_3_3)
	setActive(var_3_1, not var_3_3)

	GetComponent(arg_3_1, "Toggle").enabled = not var_3_3
end

return var_0_0
