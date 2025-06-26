local var_0_0 = class("ActivityMedalGroup", import("model.vo.BaseVO"))

var_0_0.STATE_EXPIRE = -1
var_0_0.STATE_CLOSE = 0
var_0_0.STATE_ACTIVE = 1

function var_0_0.bindConfigTable(arg_1_0)
	return pg.activity_medal_group
end

function var_0_0.GetConfigID(arg_2_0)
	return arg_2_0.configId
end

function var_0_0.Ctor(arg_3_0, arg_3_1)
	arg_3_0.configId = arg_3_1

	local var_3_0 = arg_3_0:GetMedalIds()

	arg_3_0.medalList = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_1 = {
			id = iter_3_1
		}

		arg_3_0.medalList[iter_3_1] = var_3_1
	end
end

function var_0_0.GetMedalIds(arg_4_0)
	return pg.activity_medal_template.get_id_list_by_group[arg_4_0.configId]
end

function var_0_0.IsMedalGroupCollectionGrey(arg_5_0)
	player = getProxy(PlayerProxy):getData()

	return not player:getActivityMedalGroup()[arg_5_0]
end

function var_0_0.GetMedalGroupStateByID(arg_6_0)
	local var_6_0 = pg.activity_medal_group[arg_6_0]
	local var_6_1 = var_6_0.is_out_of_print

	if var_6_1 == 1 then
		return var_0_0.STATE_EXPIRE
	elseif var_6_1 == 0 then
		local var_6_2 = false

		for iter_6_0, iter_6_1 in ipairs(var_6_0.activity_link) do
			local var_6_3 = iter_6_1[2]
			local var_6_4 = getProxy(ActivityProxy):getActivityById(var_6_3)

			if var_6_4 and not var_6_4:isEnd() then
				var_6_2 = true

				break
			end
		end

		if var_6_2 then
			return var_0_0.STATE_ACTIVE
		else
			return var_0_0.STATE_CLOSE
		end
	end
end

function var_0_0.GetMedalGroupState(arg_7_0)
	local var_7_0 = arg_7_0:getConfig("is_out_of_print")

	if var_7_0 == 1 then
		return var_0_0.STATE_EXPIRE
	elseif var_7_0 == 0 then
		if arg_7_0:GetMedalGroupActivityConfig() then
			return var_0_0.STATE_ACTIVE
		else
			return var_0_0.STATE_CLOSE
		end
	end
end

function var_0_0.GetMedalGroupActivityConfig(arg_8_0)
	for iter_8_0, iter_8_1 in ipairs(arg_8_0:getConfig("activity_link")) do
		local var_8_0 = iter_8_1[2]
		local var_8_1 = getProxy(ActivityProxy):getActivityById(var_8_0)

		if var_8_1 and not var_8_1:isEnd() then
			return iter_8_1
		end
	end
end

function var_0_0.GetMedalList(arg_9_0)
	return arg_9_0.medalList
end

function var_0_0.UpdateMedal(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.medalList[arg_10_1].timeStamp = arg_10_2
end

function var_0_0.GetAll(arg_11_0)
	return underscore.all(arg_11_0:GetMedalIds(), function(arg_12_0)
		return arg_11_0.medalList[arg_12_0] and arg_11_0.medalList[arg_12_0].timeStamp and arg_11_0.medalList[arg_12_0].timeStamp ~= 0
	end)
end

function var_0_0.GetGroupIDByMedalID(arg_13_0)
	return pg.activity_medal_group[arg_13_0].group
end

return var_0_0
