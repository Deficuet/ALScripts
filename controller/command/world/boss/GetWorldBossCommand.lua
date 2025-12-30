local var_0_0 = class("GetWorldBossCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = (arg_1_1:getBody() or {}).callback
	local var_1_1 = nowWorld()

	if not var_1_1.worldBossProxy then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(34501, {
		type = 0
	}, 34502, function(arg_2_0)
		local var_2_0 = var_1_1.worldBossProxy

		if var_2_0.currentBossLV ~= nil then
			var_2_0.currentBossLV = arg_2_0.self_boss_lv

			if var_1_0 then
				var_1_0()
			end

			return
		end

		var_2_0:Setup(arg_2_0)
		arg_1_0:sendNotification(GAME.WORLD_GET_BOSS_DONE)

		if not var_2_0:IsOpen() and var_2_0:GetSelfBoss() ~= nil then
			originalPrint("Notification : boss is overtime")
			pg.ConnectionMgr.GetInstance():Send(34513, {
				type = 0
			}, 34514, function(arg_3_0)
				return
			end)
		end

		if var_1_0 then
			var_1_0()
		end
	end)
end

return var_0_0
