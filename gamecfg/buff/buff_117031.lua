return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 117031,
	icon = 117010,
	last_effect = "Shield",
	effect_list = {
		{
			type = "BattleBuffRecoilShield",
			trigger = {
				"onAttach",
				"onTakeDamage",
				"onFinishGame"
			},
			arg_list = {
				casterCurretnHPRatio = 1,
				recoilRate = 0.8
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				skill_id = 117031,
				target = "TargetSelf",
				effectAttachData = {
					"BattleBuffShield<=0"
				}
			}
		}
	}
}
