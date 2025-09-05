local var_0_0 = class("IslandChangeDressupCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.ship_id
	local var_1_2 = var_1_0.dress_List
	local var_1_3 = var_1_0.skin_id
	local var_1_4 = var_1_0.color_id
	local var_1_5 = var_1_0.color_list

	pg.ConnectionMgr.GetInstance():Send(21617, {
		ship_id = var_1_1,
		dress_List = var_1_2,
		color_list = var_1_5,
		skin_id = var_1_3,
		color_id = var_1_4
	}, 21618, function(arg_2_0)
		if arg_2_0.result == 0 then
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandWearDress(var_1_1, var_1_2))

			local var_2_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
			local var_2_1 = var_2_0:GetShipById(var_1_1)

			var_2_1:ChangeSkinId(var_1_3)
			var_2_0:SetSkinCurrentColor(var_1_3, var_1_4)

			for iter_2_0, iter_2_1 in ipairs(var_1_5) do
				var_2_1:ChangeDressColor(iter_2_1)
			end

			pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_save1"))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
