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
		return BossRushPassedLayer
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
		return BossRushEXBattleResultLayer
	end)
end

return var_0_0
