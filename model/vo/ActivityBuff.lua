local var_0_0 = class("ActivityBuff", import(".CommonBuff"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, {
		id = arg_1_2,
		timestamp = arg_1_3
	})

	arg_1_0.activityId = arg_1_1
end

function var_0_0.IsActiveType(arg_2_0)
	return true
end

local function var_0_1(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_1 == "<=" then
		return arg_3_0 <= arg_3_2
	elseif arg_3_1 == "<" then
		return arg_3_0 < arg_3_2
	elseif arg_3_1 == "==" then
		return arg_3_0 == arg_3_2
	elseif arg_3_1 == ">=" then
		return arg_3_2 <= arg_3_0
	elseif arg_3_1 == ">" then
		return arg_3_2 < arg_3_0
	end

	return false
end

function var_0_0.isActivate(arg_4_0)
	local var_4_0 = false
	local var_4_1 = getProxy(ActivityProxy):getActivityById(arg_4_0.activityId)

	if var_4_1 and not var_4_1:isEnd() then
		if var_4_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUFF then
			if arg_4_0:RookieBattleExpUsage() then
				if getProxy(PlayerProxy):getRawData().level < arg_4_0:GetRookieBattleExpMaxLevel() then
					var_4_0 = true
				end
			elseif arg_4_0:isAddedBuff() then
				var_4_0 = true
			end
		else
			local var_4_2 = noEmptyStr(arg_4_0:getConfig("benefit_condition"))

			var_4_0 = not var_4_2 and true or switch(var_4_2[1], {
				lv = function()
					local var_5_0 = getProxy(PlayerProxy):getRawData()

					return var_0_1(var_5_0.level, var_4_2[2], var_4_2[3])
				end,
				activity = function()
					if var_4_2[3] == 0 then
						return true
					end

					if var_4_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF or var_4_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2 then
						local var_6_0 = var_4_2[3][1]

						return (var_4_1.data1KeyValueList[2][var_6_0] or 1) == var_4_2[3][2]
					end
				end,
				chapter = function(arg_7_0)
					return true
				end
			}, function()
				return false
			end) or false
		end
	end

	return var_4_0
end

function var_0_0.checkChaper(arg_9_0, arg_9_1)
	local var_9_0 = noEmptyStr(arg_9_0:getConfig("benefit_condition"))

	if not var_9_0 or var_9_0[1] ~= "chapter" then
		return true
	else
		return table.contains(var_9_0[2], arg_9_1)
	end
end

function var_0_0.getLeftTime(arg_10_0)
	local var_10_0 = pg.TimeMgr.GetInstance():GetServerTime()

	return getProxy(ActivityProxy):getActivityById(arg_10_0.activityId).stopTime - var_10_0
end

function var_0_0.isAddedBuff(arg_11_0)
	local var_11_0 = true
	local var_11_1 = getProxy(ActivityProxy):getActivityById(arg_11_0.activityId)

	if var_11_1 and not var_11_1:isEnd() then
		local var_11_2 = arg_11_0:getConfig("benefit_condition")

		if var_11_2[1] == "pt" then
			local var_11_3 = var_11_2[2]
			local var_11_4 = var_11_2[3]
			local var_11_5 = var_11_2[4]
			local var_11_6 = pg.player_resource[var_11_3].name
			local var_11_7 = getProxy(PlayerProxy):getData()[var_11_6] or 0

			if not (var_11_4 <= var_11_7) or not (var_11_7 < var_11_5) then
				var_11_0 = false
			end
		end
	end

	return var_11_0
end

return var_0_0
