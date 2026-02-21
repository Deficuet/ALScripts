local var_0_0 = class("BossRushConst")

function var_0_0.GetPassedLayer(arg_1_0)
	return switch(arg_1_0, {
		[ActivityConst.ALVIT_BOSS_RUSH_ID] = function()
			return BossRushAlvitPassedLayer
		end,
		[ActivityConst.ZENGKEHAIJUNSHANGJIANG_BOSS_RUSH_ID] = function()
			return BossRushVerZenkerPassedLayer
		end
	}, function()
		local var_4_0 = checkExist(pg.activity_template[arg_1_0], {
			"config_client"
		}, {
			"passed"
		})

		return var_4_0 and _G[var_4_0] or BossRushPassedLayer
	end)
end

function var_0_0.GetEXBattleResultLayer(arg_5_0)
	return switch(arg_5_0, {
		[ActivityConst.ALVIT_BOSS_RUSH_ID] = function()
			return BossRushAlvitEXBattleResultLayer
		end,
		[ActivityConst.ZENGKEHAIJUNSHANGJIANG_BOSS_RUSH_ID] = function()
			return BossRushVerZenkerEXBattleResultLayer
		end
	}, function()
		local var_8_0 = checkExist(pg.activity_template[arg_5_0], {
			"config_client"
		}, {
			"result"
		})

		return var_8_0 and _G[var_8_0] or BossRushEXBattleResultLayer
	end)
end

return var_0_0
