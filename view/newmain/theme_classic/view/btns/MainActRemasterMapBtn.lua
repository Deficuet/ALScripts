local var_0_0 = class("MainActRemasterMapBtn", import(".MainActMapBtn"))

function var_0_0.GetEventName(arg_1_0)
	return "event_remaster_map"
end

function var_0_0.GetLinkConfig(arg_2_0)
	local var_2_0 = getProxy(ActivityRemasterProxy):GetActiveActID()

	if not var_2_0 or var_2_0 <= 0 then
		return nil
	end

	return {
		param = "0",
		name = "event_remaster_map",
		type = 0,
		text_pic = "text_event_map",
		id = 1,
		group_id = 1,
		order = 1,
		pic = var_2_0 .. "",
		time = {
			"default",
			51033
		}
	}
end

function var_0_0.InShowTime(arg_3_0)
	if not getProxy(ActivityRemasterProxy):IsActivating() then
		return false
	end

	local var_3_0 = arg_3_0:GetActivity()

	if not var_3_0 or var_3_0:isEnd() then
		return false
	end

	arg_3_0.config = arg_3_0:GetLinkConfig()

	return true
end

function var_0_0.GetActivity(arg_4_0)
	local var_4_0 = {
		ActivityConst.ACTIVITY_TYPE_BOSSRUSH,
		ActivityConst.ACTIVITY_TYPE_ZPROJECT
	}
	local var_4_1 = getProxy(ActivityRemasterProxy):GetActiveActID()
	local var_4_2 = pg.activity_re[var_4_1]

	for iter_4_0, iter_4_1 in ipairs(var_4_2.act_id) do
		local var_4_3 = pg.activity_template[iter_4_1]

		if var_4_3 and table.contains(var_4_0, var_4_3.type) then
			local var_4_4 = getProxy(ActivityProxy):getActivityById(iter_4_1)

			if var_4_4 and not var_4_4:isEnd() then
				return var_4_4
			end
		end
	end

	return nil
end

function var_0_0.ResPath(arg_5_0)
	return "ActRemasterMapBtn"
end

return var_0_0
