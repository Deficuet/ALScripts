local var_0_0 = class("BossRushConst")

function var_0_0.GetPassedLayer(arg_1_0)
	return switch(arg_1_0, {
		[ActivityConst.ALVIT_BOSS_RUSH_ID] = function()
			return BossRushAlvitPassedLayer
		end,
		[ActivityConst.ZENGKEHAIJUNSHANGJIANG_BOSS_RUSH_ID] = function()
			return BossRushSardiniaPassedLayer
		end,
		[ActivityConst.ESCAPE_BOSS_RUSH_ID] = function()
			return BossRushEscapeManorPassedLayer
		end,
		[ActivityConst.VERITASACADEMY_BOSS_RUSH_ACT_ID] = function()
			return BossRushVeritasAcademyPassedLayer
		end
	}, function()
		local var_6_0 = checkExist(pg.activity_template[arg_1_0], {
			"config_client"
		}, {
			"passed"
		})

		return var_6_0 and _G[var_6_0] or BossRushPassedCombatLoadLayer
	end)
end

function var_0_0.GetEXBattleResultLayer(arg_7_0)
	return switch(arg_7_0, {
		[ActivityConst.ALVIT_BOSS_RUSH_ID] = function()
			return BossRushAlvitEXBattleResultLayer
		end,
		[ActivityConst.ZENGKEHAIJUNSHANGJIANG_BOSS_RUSH_ID] = function()
			return BossRushVerZenkerEXBattleResultLayer
		end,
		[ActivityConst.ESCAPE_BOSS_RUSH_ID] = function()
			return BossRushEscapeManorBattleResultLayer
		end,
		[ActivityConst.VERITASACADEMY_BOSS_RUSH_ACT_ID] = function()
			return BossRushVeritasAcademyBattleResultLayer
		end
	}, function()
		local var_12_0 = checkExist(pg.activity_template[arg_7_0], {
			"config_client"
		}, {
			"result"
		})

		return var_12_0 and _G[var_12_0] or BossRushEXBattleResultLayer
	end)
end

return var_0_0
