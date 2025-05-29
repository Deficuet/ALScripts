local var_0_0 = class("MainChangeSkinBtn", import(".MainBaseBtn"))

function var_0_0.OnClick(arg_1_0)
	arg_1_0:emit(NewMainScene.ON_CHANGE_SKIN)
end

function var_0_0.Flush(arg_2_0, arg_2_1)
	arg_2_0:UpdateChangeSkinBtn()
end

function var_0_0.UpdateChangeSkinBtn(arg_3_0)
	local var_3_0

	if getProxy(SettingsProxy):IsOpenRandomFlagShip() then
		var_3_0 = _.select(getProxy(SettingsProxy):GetRandomFlagShipList(), function(arg_4_0)
			return getProxy(BayProxy):GetShipPhantom(arg_4_0) ~= nil
		end)
	else
		var_3_0 = getProxy(PlayerProxy):getRawData().characters
	end

	local var_3_1 = getProxy(SettingsProxy):GetFlagShipDisplayMode()
	local var_3_2 = var_3_1 == FlAG_SHIP_DISPLAY_ONLY_EDUCATECHAR and 0 or #var_3_0

	if getProxy(PlayerProxy):getRawData():ExistEducateChar() and var_3_1 ~= FlAG_SHIP_DISPLAY_ONLY_SHIP then
		var_3_2 = var_3_2 + 1
	end

	setActive(arg_3_0._tf, var_3_2 > 1)
end

return var_0_0
