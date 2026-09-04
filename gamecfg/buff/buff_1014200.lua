return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minWeaponNumber = 1,
				target = "TargetSelf",
				skill_id = 1014200,
				check_weapon = true,
				index = {
					1
				},
				label = {
					"SN",
					"MG"
				}
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
				skill_id = 1014200,
				check_weapon = true,
				index = {
					1
				},
				label = {
					"KMS",
					"MG"
				}
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
				skill_id = 1014201,
				check_weapon = true,
				index = {
					1
				},
				label = {
					"AP",
					"MG"
				}
			}
		},
		{
			type = "BattleBuffCount",
			trigger = {
				"onFoeDying"
			},
			arg_list = {
				countTarget = 1,
				killer = "self",
				countType = 1014200
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				quota = 3,
				target = "TargetSelf",
				skill_id = 1014202,
				countType = 1014200
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
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 1014200,
	icon = 14200,
	last_effect = ""
}
