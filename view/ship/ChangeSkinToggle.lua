local var_0_0 = class("ChangeSkinToggle")
local var_0_1 = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._tf = arg_1_1
	arg_1_0._toggles = {}
	arg_1_0._toggleTfs = {}

	for iter_1_0 = 1, var_0_1 do
		local var_1_0 = findTF(arg_1_0._tf, "ad/toggle/" .. iter_1_0)
		local var_1_1 = GetComponent(var_1_0, typeof(Toggle))

		var_1_1.isOn = false

		table.insert(arg_1_0._toggles, var_1_1)
		table.insert(arg_1_0._toggleTfs, var_1_0)
	end

	setActive(arg_1_0._tf, false)
end

function var_0_0.setShipData(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._skinId = arg_2_1

	local var_2_0 = ShipSkin.GetChangeSkinGroupId(arg_2_0._skinId)
	local var_2_1 = ShipSkin.GetStoreChangeSkinId(var_2_0, arg_2_2)

	arg_2_0._toggleIndex = 1

	if var_2_1 then
		arg_2_0._toggleIndex = ShipSkin.GetChangeSkinIndex(var_2_1)
	end

	arg_2_0._nextSkinId = ShipSkin.GetChangeSkinNextId(arg_2_0._skinId)

	setActive(arg_2_0._tf, true)
	arg_2_0:updateUI()
end

function var_0_0.setSkinData(arg_3_0, arg_3_1)
	arg_3_0._skinId = arg_3_1
	arg_3_0._toggleIndex = ShipSkin.GetChangeSkinIndex(arg_3_1)
	arg_3_0._nextSkinId = ShipSkin.GetChangeSkinNextId(arg_3_0._skinId)

	setActive(arg_3_0._tf, true)
	arg_3_0:updateUI()
end

function var_0_0.updateUI(arg_4_0)
	for iter_4_0 = 1, #arg_4_0._toggles do
		local var_4_0 = arg_4_0._toggles[iter_4_0]
		local var_4_1 = arg_4_0._toggleTfs[iter_4_0]

		var_4_0.isOn = iter_4_0 == arg_4_0._toggleIndex and true or false

		setActive(findTF(var_4_1, "bg"), var_4_0.isOn)
	end

	arg_4_0:updateToggleUI()
end

function var_0_0.updateToggleUI(arg_5_0)
	local var_5_0 = ShipSkin.GetChangeSkinCustomDataId(arg_5_0._skinId, "toggle_skin") or 1

	for iter_5_0 = 1, #arg_5_0._toggleTfs do
		local var_5_1 = arg_5_0._toggleTfs[iter_5_0]

		arg_5_0:setChildVisible(findTF(var_5_1, "bg"), false)

		local var_5_2 = findTF(var_5_1, "bg/Checkmark_" .. var_5_0)

		setActive(var_5_2, true)

		local var_5_3 = pg.ship_skin_template[arg_5_0._skinId].tag

		if iter_5_0 == arg_5_0._toggleIndex then
			setActive(findTF(var_5_2, "l2d"), table.contains(var_5_3, ShipSkin.WITH_LIVE2D) or table.contains(var_5_3, ShipSkin.WITH_LIVE2D_PLUS))
			setActive(findTF(var_5_2, "spine"), table.contains(var_5_3, ShipSkin.WITH_SPINE) or table.contains(var_5_3, ShipSkin.WITH_SPINE_PLUS))
		else
			setActive(findTF(var_5_1, "tag/l2d"), table.contains(var_5_3, ShipSkin.WITH_LIVE2D) or table.contains(var_5_3, ShipSkin.WITH_LIVE2D_PLUS))
			setActive(findTF(var_5_1, "tag/spine"), table.contains(var_5_3, ShipSkin.WITH_SPINE) or table.contains(var_5_3, ShipSkin.WITH_SPINE_PLUS))
		end
	end
end

function var_0_0.setChildVisible(arg_6_0, arg_6_1, arg_6_2)
	for iter_6_0 = 1, arg_6_1.childCount do
		setActive(arg_6_1:GetChild(iter_6_0 - 1), arg_6_2)
	end
end

return var_0_0
