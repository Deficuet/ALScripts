return {
	init_effect = "",
	name = "双发实心弹-风帆SV暴伤",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "风帆S/风帆V 主炮暴击伤害提升20%",
	stack = 1,
	id = 61161,
	icon = 61160,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "criDamage",
				number = 0.2,
				index = {
					1,
					2
				}
			}
		}
	}
}
