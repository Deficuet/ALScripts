return {
	init_effect = "",
	name = "2026信标BOSS 雷根斯堡meta 印记施加给角色",
	time = 0,
	stack = 99,
	id = 201731,
	picture = "",
	last_effect = "leigensibao_alter_sign",
	last_effect_stack_text = {
		node = "scale/stack/text"
	},
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = 0.1
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStack"
			},
			arg_list = {
				buff_id = 201730
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onSink"
			},
			arg_list = {
				buff_id = 201733,
				repeat_count = -1,
				target = "TargetShipTag",
				check_target = {
					"TargetAllHarm",
					"TargetShipTag"
				},
				ship_tag_list = {
					"BOSS"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 200789,
				minTargetNumber = 1,
				target = "TargetSelf",
				check_target = {
					"TargetSelf",
					"TargetPlayerMainFleet"
				}
			}
		}
	}
}
