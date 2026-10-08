local var_0_0 = class("MainPrevPeriodCrusingChargeTipMeidator", pm.Mediator)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.sequence = arg_1_1

	pg.m02:registerMediator(arg_1_0)
end

function var_0_0.listNotificationInterests(arg_2_0)
	return {
		GAME.CHARGE_SUCCESS
	}
end

function var_0_0.handleNotification(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1:getName()
	local var_3_1 = arg_3_1:getBody()

	if var_3_0 == GAME.CHARGE_SUCCESS then
		arg_3_0.sequence:OnChargeSuccess(var_3_1)
	end
end

function var_0_0.Dispose(arg_4_0)
	pg.m02:removeMediator(arg_4_0.__cname)
end

return var_0_0
