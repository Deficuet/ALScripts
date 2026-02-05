local var_0_0 = class("IslandInviteTradeCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.list
	local var_1_2 = var_1_0.mapId
	local var_1_3 = var_1_0.price

	if #var_1_1 <= 0 then
		return
	end

	local var_1_4 = getProxy(IslandProxy):GetIsland():GetTradeAgency()

	pg.ConnectionMgr.GetInstance():Send(21245, {
		friend_list = var_1_1,
		map_id = var_1_2,
		price = var_1_3
	}, 21246, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_4:UpdateInviteList(var_1_1)
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_trade_invite_success"))
		end
	end)
end

return var_0_0
