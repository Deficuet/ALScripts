local var_0_0 = class("UpdateStoryListCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.storyIds
	local var_1_2 = var_1_0.callback

	if not pg.ConnectionMgr.GetInstance():getConnection() or not pg.ConnectionMgr.GetInstance():isConnected() then
		return
	end

	if not getProxy(PlayerProxy) then
		return
	end

	local var_1_3 = pg.NewStoryMgr.GetInstance()
	local var_1_4 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_1) do
		if not var_1_3:GetPlayedFlag(iter_1_1) then
			table.insert(var_1_4, iter_1_1)
		end
	end

	if #var_1_4 == 0 then
		existCall(var_1_2)

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11032, {
		story_ids = var_1_4
	}, 11033, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_3:SetPlayedFlagList(var_1_4)
			existCall(var_1_2)
			arg_1_0:sendNotification(GAME.STORY_UPDATE_LIST_DONE, {
				storyIds = var_1_4
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
