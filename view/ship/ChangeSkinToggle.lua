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

	arg_1_0._toggleContainer = findTF(arg_1_0._tf, "ad/toggle")
	arg_1_0._asmrContainer = findTF(arg_1_0._tf, "ad/asmr")

	arg_1_0:UpdateVisible(false)

	arg_1_0._asmrTurnning = false
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

	arg_2_0:UpdateVisible(true)
	arg_2_0:updateUI()
end

function var_0_0.setSkinData(arg_3_0, arg_3_1)
	arg_3_0._skinId = arg_3_1
	arg_3_0._toggleIndex = ShipSkin.GetChangeSkinIndex(arg_3_1)
	arg_3_0._nextSkinId = ShipSkin.GetChangeSkinNextId(arg_3_0._skinId)

	arg_3_0:UpdateVisible(true)
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
	arg_4_0:updateAsmrUI()
end

function var_0_0.updateToggleUI(arg_5_0)
	local var_5_0 = ShipSkin.GetChangeSkinCustomDataId(arg_5_0._skinId, "toggle_skin") or 1

	for iter_5_0 = 1, #arg_5_0._toggleTfs do
		local var_5_1 = arg_5_0._toggleTfs[iter_5_0]

		arg_5_0:setChildVisible(findTF(var_5_1, "bg"), false)

		local var_5_2 = findTF(var_5_1, "bg/Checkmark_" .. var_5_0)

		setActive(var_5_2, true)

		local var_5_3 = pg.ship_skin_template[arg_5_0._skinId].tag
		local var_5_4 = pg.ship_skin_template[arg_5_0._nextSkinId].tag

		if iter_5_0 == arg_5_0._toggleIndex then
			setActive(findTF(var_5_2, "l2d"), table.contains(var_5_3, ShipSkin.WITH_LIVE2D) or table.contains(var_5_3, ShipSkin.WITH_LIVE2D_PLUS))
			setActive(findTF(var_5_2, "spine"), table.contains(var_5_3, ShipSkin.WITH_SPINE) or table.contains(var_5_3, ShipSkin.WITH_SPINE_PLUS))
		else
			setActive(findTF(var_5_1, "tag/l2d"), table.contains(var_5_4, ShipSkin.WITH_LIVE2D) or table.contains(var_5_4, ShipSkin.WITH_LIVE2D_PLUS))
			setActive(findTF(var_5_1, "tag/spine"), table.contains(var_5_4, ShipSkin.WITH_SPINE) or table.contains(var_5_4, ShipSkin.WITH_SPINE_PLUS))
		end
	end

	setActive(arg_5_0._toggleContainer, not arg_5_0:IsAsmrSkin())
end

function var_0_0.updateAsmrUI(arg_6_0)
	setActive(arg_6_0._asmrContainer, arg_6_0:IsAsmrSkin())

	local var_6_0 = ShipSkin.GetChangeSkinCustomDataId(arg_6_0._skinId, "asmr") == 1

	setActive(findTF(arg_6_0._asmrContainer, "on"), var_6_0)
	setActive(findTF(arg_6_0._asmrContainer, "off"), not var_6_0)
end

function var_0_0.setChildVisible(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0 = 1, arg_7_1.childCount do
		setActive(arg_7_1:GetChild(iter_7_0 - 1), arg_7_2)
	end
end

function var_0_0.SetAsmrTurnning(arg_8_0, arg_8_1)
	arg_8_0._asmrTurnning = arg_8_1

	arg_8_0:UpdateVisible(true)

	if arg_8_0._skinId then
		arg_8_0:updateUI()
	end
end

function var_0_0.UpdateVisible(arg_9_0, arg_9_1)
	if not arg_9_0._skinId then
		setActive(arg_9_0._tf, false)

		return
	end

	if arg_9_0:IsAsmrSkin() and not arg_9_0._asmrTurnning then
		setActive(arg_9_0._tf, false)

		return
	end

	setActive(arg_9_0._tf, arg_9_1)
end

function var_0_0.IsAsmrSkin(arg_10_0)
	if not arg_10_0._skinId then
		return false
	end

	return ShipSkin.GetChangeSkinCustomDataId(arg_10_0._skinId, "asmr") == 1 or ShipSkin.GetChangeSkinCustomDataId(arg_10_0._nextSkinId, "asmr") == 1 or false
end

return var_0_0
