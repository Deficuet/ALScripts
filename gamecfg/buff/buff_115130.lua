return {
	time = 0,
	name = "",
	init_effect = "jinengchufared",
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 115130,
	icon = 115130,
	last_effect = "",
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				buff_id = 115131
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "CRI_TAG_EHC_stuned",
				bulletID = 180016,
				number = 1
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "CRI_TAG_EHC_stuned",
				bulletID = 180017,
				number = 1
			}
		}
	}
}
