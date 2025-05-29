local var_0_0 = class("MainChangeSkinView", import("...base.MainBaseView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0._changeSkinToggle = ChangeSkinToggle.New(findTF(arg_1_1, "toggleUI"))
	arg_1_0.inChange = false

	onButton(arg_1_0, findTF(arg_1_0._tf, "click"), function()
		if arg_1_0.inChange then
			return
		end

		arg_1_0.inChange = true

		arg_1_0.event:emit(NewMainMediator.CHANGE_SKIN_TOGGLE, {
			skin_id = arg_1_0._flagShip:getSkinId()
		})
	end, SFX_CONFIRM)
end

function var_0_0.Init(arg_3_0, arg_3_1)
	arg_3_0._flagShip = arg_3_1

	arg_3_0:updateUI()
end

function var_0_0.Refresh(arg_4_0, arg_4_1)
	arg_4_0.inChange = false
	arg_4_0._flagShip = arg_4_1

	arg_4_0:updateUI()
end

function var_0_0.updateUI(arg_5_0)
	local var_5_0 = arg_5_0._flagShip:getSkinId()
	local var_5_1 = ShipSkin.GetChangeSkinGroupId(var_5_0)

	if not var_5_1 then
		setActive(arg_5_0._tf, false)
	else
		setActive(arg_5_0._tf, true)
	end

	if arg_5_0._changeSkinToggle and var_5_1 and var_5_1 > 0 then
		arg_5_0._changeSkinToggle:setShipData(var_5_0)
	end
end

function var_0_0.Dispose(arg_6_0)
	var_0_0.super.Dispose(arg_6_0)
end

return var_0_0
