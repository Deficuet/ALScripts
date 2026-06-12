return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "强化版901010",
	stack = 1,
	id = 902400,
	icon = 902400,
	last_effect = "",
	shipInfoScene = {
		equip = {
			{
				number = 10,
				check_label = {
					"CA",
					"MG"
				},
				label = {
					"CA",
					"MG"
				}
			}
		}
	},
	effect_list = {
		{
			type = "BattleBuffAddProficiency",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 0.1,
				label = {
					"CA",
					"MG"
				},
				index = {
					1
				}
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "sp_far"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 901030,
				fleetPos = "Leader",
				target = "TargetFleetIndex"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onLeader"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 901014,
				target = "TargetSelf",
				maxTargetNumber = 1,
				check_target = {
					"TargetPlayerVanguardFleet",
					"TargetShipTag"
				},
				ship_tag_list = {
					"sp_far"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onLeader"
			},
			arg_list = {
				minTargetNumber = 2,
				buff_id = 901015,
				target = "TargetSelf",
				maxTargetNumber = 2,
				check_target = {
					"TargetPlayerVanguardFleet",
					"TargetShipTag"
				},
				ship_tag_list = {
					"sp_far"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onLeader"
			},
			arg_list = {
				minTargetNumber = 3,
				buff_id = 901016,
				target = "TargetSelf",
				maxTargetNumber = 3,
				check_target = {
					"TargetPlayerVanguardFleet",
					"TargetShipTag"
				},
				ship_tag_list = {
					"sp_far"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onLeader"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 901024,
				target = "TargetSelf",
				maxTargetNumber = 1,
				check_target = {
					"TargetPlayerVanguardFleet",
					"TargetShipTag"
				},
				ship_tag_list = {
					"sp_near"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onLeader"
			},
			arg_list = {
				minTargetNumber = 2,
				buff_id = 901025,
				target = "TargetSelf",
				maxTargetNumber = 2,
				check_target = {
					"TargetPlayerVanguardFleet",
					"TargetShipTag"
				},
				ship_tag_list = {
					"sp_near"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onLeader"
			},
			arg_list = {
				minTargetNumber = 3,
				buff_id = 901026,
				target = "TargetSelf",
				maxTargetNumber = 3,
				check_target = {
					"TargetPlayerVanguardFleet",
					"TargetShipTag"
				},
				ship_tag_list = {
					"sp_near"
				}
			}
		}
	}
}
