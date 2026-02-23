return {
	time = 0,
	name = "2025列克星敦II活动 SP 与变形BOSS生命共享",
	init_effect = "",
	stack = 1,
	id = 201657,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201658,
				target = {
					"TargetSpectreUnit",
					"TargetShipTag"
				},
				ship_tag_list = {
					"BOSS"
				}
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = 1
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onBeforeFatalDamage"
			},
			arg_list = {
				buff_id = 201661,
				target = {
					"TargetSpectreUnit",
					"TargetShipTag"
				},
				ship_tag_list = {
					"BOSS"
				}
			}
		}
	}
}
