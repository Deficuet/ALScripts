return {
	init_effect = "",
	name = "2025拉斐尔活动 新EX模式我方判定 领舰 复活时无敌护盾",
	time = 2,
	picture = "",
	desc = "",
	stack = 1,
	id = 201296,
	icon = 201296,
	last_effect = "wudihudun",
	effect_list = {
		{
			type = "BattleBuffSetBattleUnitType",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				value = -100
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201266,
				target = "TargetPlayerFlagShip"
			}
		}
	}
}
