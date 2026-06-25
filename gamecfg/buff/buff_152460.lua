return {
	shipInfoScene = {
		equip = {
			{
				number = 10,
				check_type = {
					11
				},
				check_indexList = {
					1
				},
				label = {
					"CB",
					"MG"
				}
			}
		}
	},
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			pop = {},
			arg_list = {
				buff_id = 152461,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 152460,
				minWeaponNumber = 1,
				check_weapon = true,
				index = {
					1
				},
				type = {
					11
				}
			}
		},
		{
			type = "BattleBuffCount",
			trigger = {
				"onTakeDamage"
			},
			arg_list = {
				maxHPRatio = 0.2,
				countType = 152460
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 152461,
				countType = 152460
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
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 152460,
	icon = 152460,
	last_effect = ""
}
