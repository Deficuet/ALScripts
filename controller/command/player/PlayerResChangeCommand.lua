local var_0_0 = class("PlayerResChangeCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.oldPlayer
	local var_1_2 = var_1_0.newPlayer
	local var_1_3 = false
	local var_1_4 = pg.player_resource.all

	for iter_1_0 = #var_1_4, 1, -1 do
		local var_1_5 = var_1_4[iter_1_0]

		if var_1_1:getResource(var_1_5) ~= var_1_2:getResource(var_1_5) then
			var_1_3 = true

			break
		end
	end

	if var_1_3 then
		arg_1_0:UpdateActivies(var_1_1, var_1_2)
	end
end

local function var_0_1(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_2 == PlayerConst.ResDiamond then
		return arg_2_1:getChargeGem() - arg_2_0:getChargeGem()
	elseif arg_2_2 == PlayerConst.ResFreeDiamond then
		return arg_2_1:getFreeGem() - arg_2_0:getFreeGem()
	end

	return arg_2_1:getResource(arg_2_2) - arg_2_0:getResource(arg_2_2)
end

function var_0_0.UpdateActivies(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.activityProxy = arg_3_0.activityProxy or getProxy(ActivityProxy)

	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.activityProxy:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK)) do
		local var_3_1 = iter_3_1:getConfig("config_id")

		assert(var_3_1)

		var_3_0[var_3_1] = var_3_0[var_3_1] or arg_3_2:getResource(var_3_1) - arg_3_1:getResource(var_3_1)

		var_0_0.UpdateActivity(iter_3_1, var_3_0[var_3_1])
	end

	for iter_3_2, iter_3_3 in ipairs(arg_3_0.activityProxy:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK)) do
		local var_3_2 = iter_3_3:getConfig("config_id")

		assert(var_3_2)

		var_3_0[var_3_2] = var_3_0[var_3_2] or arg_3_2:getResource(var_3_2) - arg_3_1:getResource(var_3_2)

		var_0_0.UpdateActivity(iter_3_3, var_3_0[var_3_2])
	end

	for iter_3_4, iter_3_5 in ipairs(arg_3_0.activityProxy:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_RETURN_AWARD)) do
		local var_3_3 = pg.activity_template_headhunting[iter_3_5.id]

		assert(var_3_3)

		local var_3_4 = var_3_3.pt

		var_3_0[var_3_4] = var_3_0[var_3_4] or arg_3_2:getResource(var_3_4) - arg_3_1:getResource(var_3_4)

		var_0_0.UpdateActivity(iter_3_5, var_3_0[var_3_4])
	end

	for iter_3_6, iter_3_7 in ipairs(arg_3_0.activityProxy:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PIZZA_PT)) do
		local var_3_5 = iter_3_7:getDataConfig("pt")

		assert(var_3_5)

		var_3_0[var_3_5] = var_3_0[var_3_5] or arg_3_2:getResource(var_3_5) - arg_3_1:getResource(var_3_5)

		var_0_0.UpdateActivity(iter_3_7, var_3_0[var_3_5])
	end

	for iter_3_8, iter_3_9 in ipairs(arg_3_0.activityProxy:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_BUFF)) do
		local var_3_6 = iter_3_9:getDataConfig("pt")

		if var_3_6 > 0 then
			assert(var_3_6)

			local var_3_7 = var_3_6 == PlayerConst.ResDiamond and {
				PlayerConst.ResFreeDiamond,
				PlayerConst.ResDiamond
			} or {
				var_3_6
			}
			local var_3_8 = 0

			for iter_3_10, iter_3_11 in ipairs(var_3_7) do
				var_3_0[iter_3_11] = var_3_0[iter_3_11] or var_0_1(arg_3_1, arg_3_2, iter_3_11)
				var_3_8 = var_3_8 + var_3_0[iter_3_11]
			end

			var_0_0.UpdateActivity(iter_3_9, var_3_8)
		end
	end
end

function var_0_0.UpdateActivity(arg_4_0, arg_4_1)
	local var_4_0 = getProxy(ActivityProxy)
	local var_4_1 = arg_4_0:getConfig("type")

	arg_4_0 = var_4_0:getActivityById(arg_4_0.id)

	if var_4_1 == ActivityConst.ACTIVITY_TYPE_PT_RANK then
		if not arg_4_0:isEnd() and arg_4_1 > 0 then
			arg_4_0.data1 = arg_4_0.data1 + arg_4_1

			var_4_0:updateActivity(arg_4_0)
		end
	elseif var_4_1 == ActivityConst.ACTIVITY_TYPE_BOSS_RANK then
		if arg_4_1 ~= 0 then
			arg_4_0.data1 = arg_4_0.data1 + arg_4_1

			var_4_0:updateActivity(arg_4_0)
		end
	elseif var_4_1 == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		local var_4_2 = pg.activity_template_headhunting[arg_4_0.id]

		assert(var_4_2)

		if arg_4_1 ~= 0 then
			arg_4_0.data3 = arg_4_0.data3 + arg_4_1

			var_4_0:updateActivity(arg_4_0)
		end
	elseif var_4_1 == ActivityConst.ACTIVITY_TYPE_PIZZA_PT then
		local var_4_3 = arg_4_0:getDataConfig("pt")

		if arg_4_0:getDataConfig("type") == 1 then
			arg_4_1 = math.max(arg_4_1, 0)
		elseif arg_4_0:getDataConfig("type") == 2 then
			arg_4_1 = math.min(arg_4_1, 0)
		else
			arg_4_1 = 0
		end

		if not arg_4_0:isEnd() and arg_4_1 ~= 0 then
			arg_4_0.data1 = arg_4_0.data1 + math.abs(arg_4_1)

			var_4_0:updateActivity(arg_4_0)
		end
	elseif var_4_1 == ActivityConst.ACTIVITY_TYPE_PT_BUFF and arg_4_0:getDataConfig("pt") > 0 then
		local var_4_4 = arg_4_0:getDataConfig("type") == 2

		if arg_4_0:getDataConfig("type") == 1 then
			arg_4_1 = math.max(arg_4_1, 0)
		elseif var_4_4 then
			arg_4_1 = math.min(arg_4_1, 0)
		else
			arg_4_1 = 0
		end

		if not arg_4_0:isEnd() and (arg_4_1 > 0 or var_4_4) then
			arg_4_0.data1 = arg_4_0.data1 + math.abs(arg_4_1)

			var_4_0:updateActivity(arg_4_0)
		end
	end
end

return var_0_0
