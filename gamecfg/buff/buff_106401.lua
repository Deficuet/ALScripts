return {
	init_effect = "",
	name = "收获节主持-全队回血",
	time = 31,
	color = "yellow",
	picture = "",
	desc = "战斗开始前30秒，全体舰队成员每15秒1.0%缓慢回复耐久，该效果结束后，雫受到的伤害降低5%，持续至战斗结束",
	stack = 1,
	id = 106401,
	icon = 106400,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				check_target = "TargetSelf",
				minTargetNumber = 1,
				targetMaxHPRatio = 0.99,
				time = 15,
				target = "TargetSelf",
				skill_id = 106401
			}
		}
	}
}
