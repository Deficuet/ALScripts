local var_0_0 = class("IslandSettingFlagCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().flags
	local var_1_1 = getProxy(IslandProxy):GetIsland():GetSettingsAgency()
	local var_1_2 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		if var_1_1:GetFlagByType(iter_1_1.type) ~= iter_1_1.flag then
			table.insert(var_1_2, iter_1_1)
		end
	end

	if #var_1_2 == 0 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21332, {
		flag_list = var_1_2
	}, 21333, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_1:SetFlags(var_1_2)
			arg_1_0:sendNotification(GAME.ISLAND_SETTING_FLAG_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
