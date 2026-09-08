local var_0_0 = class("ReversePacmanDormProxy", import("model.proxy.NetProxy"))

function var_0_0.register(arg_1_0)
	return
end

function var_0_0.RequestData(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN)

	if not var_2_0 or var_2_0:isEnd() then
		arg_2_0:RequestDormData()
		arg_2_1()

		return
	end

	seriesAsync({
		function(arg_3_0)
			arg_2_0:RequestDormData(arg_3_0)
		end,
		function(arg_4_0)
			arg_2_0:RandomShipData(var_2_0, arg_4_0)
		end
	}, arg_2_1)
end

function var_0_0.RequestDormData(arg_5_0, arg_5_1)
	local var_5_0 = ReversePacmanDorm.New({
		id = 6
	})

	arg_5_0:SetData(var_5_0)
	existCall(arg_5_1)
end

function var_0_0.RandomShipData(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1:GetFavorabilityList()

	for iter_6_0, iter_6_1 in pairs(var_6_0) do
		arg_6_0:AddShip(iter_6_0)
	end

	existCall(arg_6_2)
end

function var_0_0.AddShip(arg_7_0, arg_7_1)
	local var_7_0 = pg.activity_chasing_character[arg_7_1]
	local var_7_1 = ShipGroup.getDefaultShipConfig(pg.ship_skin_template[var_7_0.skin_id].ship_group).id
	local var_7_2 = ReversePacmanDormShip.New({
		id = var_7_1,
		configId = var_7_1,
		skin_id = var_7_0.skin_id,
		roleID = arg_7_1
	})

	arg_7_0.data:AddShip(var_7_2)
end

function var_0_0.SetData(arg_8_0, arg_8_1)
	arg_8_0.data = arg_8_1

	arg_8_0:AddRefreshTimer()
end

function var_0_0.AddRefreshTimer(arg_9_0)
	arg_9_0:RemoveRefreshTimer()

	local var_9_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_9_1 = GetZeroTime() - var_9_0

	arg_9_0.timer = Timer.New(function()
		arg_9_0:RemoveRefreshTimer()

		local var_10_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_FEAST)

		if var_10_0 and not var_10_0:isEnd() then
			arg_9_0:RandomShipData()
		end
	end, var_9_1 + 1, 1)

	arg_9_0.timer:Start()
end

function var_0_0.RemoveRefreshTimer(arg_11_0)
	if arg_11_0.timer then
		arg_11_0.timer:Stop()

		arg_11_0.timer = nil
	end
end

function var_0_0.remove(arg_12_0)
	arg_12_0:RemoveRefreshTimer()
end

return var_0_0
