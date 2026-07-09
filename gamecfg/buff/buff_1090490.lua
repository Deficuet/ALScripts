return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 1090491,
				time = 20,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minWeaponNumber = 1,
				target = "TargetSelf",
				skill_id = 1090492,
				check_weapon = true,
				label = {
					"CA",
					"MG",
					"AP"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 1090493,
				minWeaponNumber = 1,
				check_weapon = true,
				label = {
					"CA",
					"MG",
					"HE"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 1090493,
				minWeaponNumber = 1,
				check_weapon = true,
				label = {
					"CA",
					"MG",
					"SAP"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				hpUpperBound = 0.3,
				target = "TargetSelf",
				skill_id = 1090495,
				quota = 1
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	desc_get = "每隔20秒，有25%的概率发动，提高全队5.0%(满级25.0%)装填，持续8秒，同技能效果不叠加",
	name = "装填号令",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "每隔20秒，有25%的概率发动，提高全队$1装填，持续8秒，同技能效果不叠加",
	stack = 1,
	id = 1090490,
	icon = 2020,
	last_effect = ""
}
