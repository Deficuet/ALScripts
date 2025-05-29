local var_0_0 = class("ChangeSkinToggle")
local var_0_1 = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._tf = arg_1_1
	arg_1_0._toggles = {}

	for iter_1_0 = 1, var_0_1 do
		local var_1_0 = findTF(arg_1_0._tf, "ad/toggle/" .. iter_1_0)
		local var_1_1 = GetComponent(var_1_0, typeof(Toggle))

		var_1_1.isOn = false

		table.insert(arg_1_0._toggles, var_1_1)
	end

	setActive(arg_1_0._tf, false)
end

function var_0_0.setShipData(arg_2_0, arg_2_1)
	arg_2_0._skinId = arg_2_1

	local var_2_0 = ShipSkin.GetChangeSkinGroupId(arg_2_0._skinId)
	local var_2_1 = ShipSkin.GetStoreChangeSkinId(var_2_0)

	arg_2_0._toggleIndex = 1

	if var_2_1 then
		arg_2_0._toggleIndex = ShipSkin.GetChangeSkinIndex(var_2_1)
	end

	setActive(arg_2_0._tf, true)
	arg_2_0:updateUI()
end

function var_0_0.setSkinData(arg_3_0, arg_3_1)
	arg_3_0._skinId = arg_3_1
	arg_3_0._toggleIndex = ShipSkin.GetChangeSkinIndex(arg_3_1)

	setActive(arg_3_0._tf, true)
	arg_3_0:updateUI()
end

function var_0_0.updateUI(arg_4_0)
	for iter_4_0 = 1, #arg_4_0._toggles do
		arg_4_0._toggles[iter_4_0].isOn = iter_4_0 == arg_4_0._toggleIndex and true or false
	end
end

return var_0_0
