local var_0_0 = class("GuildCapitalLog", import("..BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.memberId = arg_1_1.member_id
	arg_1_0.name = arg_1_1.name
	arg_1_0.eventType = arg_1_1.event_type
	arg_1_0.eventTarget = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.event_target) do
		table.insert(arg_1_0.eventTarget, iter_1_1)
	end

	arg_1_0.time = arg_1_1.time
	arg_1_0.text = arg_1_0:buildText()
end

function var_0_0.buildText(arg_2_0)
	local var_2_0 = ""
	local var_2_1 = pg.TimeMgr.GetInstance():STimeDescC(arg_2_0.time)
	local var_2_2 = arg_2_0.eventTarget[1]

	if arg_2_0.eventType == GuildConst.TYPE_DONATE then
		local var_2_3 = pg.guild_contribution_template[var_2_2]
		local var_2_4

		if var_2_3.type == DROP_TYPE_RESOURCE then
			var_2_4 = Item.New({
				id = id2ItemId(var_2_3.type_id)
			}):getConfig("name")
		else
			var_2_4 = Item.New({
				id = var_2_3.type_id
			}):getConfig("name")
		end

		var_2_0 = i18n("guild_donate_log", var_2_1, arg_2_0.name, var_2_3.consume, var_2_4, var_2_3.award_capital)
	elseif arg_2_0.eventType == GuildConst.TYPE_SUPPLY then
		local var_2_5 = getProxy(GuildProxy):getRawData()

		if var_2_5 then
			local var_2_6, var_2_7 = var_2_5:getSupplyConsume()

			var_2_0 = i18n("guild_supply_log", var_2_1, arg_2_0.name, var_2_6, var_2_7)
		end
	elseif arg_2_0.eventType == GuildConst.WEEKLY_TASK then
		var_2_0 = i18n("guild_weektask_log", var_2_1, var_2_2)
	elseif arg_2_0.eventType == GuildConst.START_BATTLE then
		var_2_0 = i18n("guild_battle_log", var_2_1, arg_2_0.name, var_2_2)
	elseif arg_2_0.eventType == GuildConst.TECHNOLOGY then
		local var_2_8 = pg.guild_technology_template[var_2_2]

		assert(var_2_8, var_2_2)

		local var_2_9 = var_2_8.contribution_consume
		local var_2_10 = var_2_8.name

		var_2_0 = i18n("guild_tech_log", var_2_1, arg_2_0.name, var_2_9, var_2_10, level)
	elseif arg_2_0.eventType == GuildConst.TECHNOLOGY_OVER then
		local var_2_11 = pg.guild_technology_template[var_2_2]

		assert(var_2_11, var_2_2)

		local var_2_12 = var_2_11.contribution_consume
		local var_2_13 = var_2_11.name

		var_2_0 = i18n("guild_tech_over_log", var_2_1, arg_2_0.name, var_2_13)
	elseif arg_2_0.eventType == GuildConst.SWITCH_TOGGLE then
		local var_2_14 = pg.guild_technology_template[var_2_2].name

		var_2_0 = i18n("guild_tech_change_log", var_2_1, arg_2_0.name, var_2_14)
	end

	return var_2_0
end

function var_0_0.getText(arg_3_0)
	return arg_3_0.text
end

function var_0_0.IsSameType(arg_4_0, arg_4_1)
	return _.any(arg_4_1, function(arg_5_0)
		return arg_4_0.eventType == arg_5_0
	end)
end

return var_0_0
