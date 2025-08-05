return {
	last_effect_stack_list = {
		[2] = "skill_aerbi2",
		[3] = "skill_aerbi3"
	},
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				attr = "cannonPower",
				number = 350
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				attr = "torpedoPower",
				number = 350
			}
		},
		{
			type = "BattleBuffCount",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				countTarget = 3,
				countType = 112291
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				buff_id = 112292,
				target = "TargetSelf",
				countType = 112291
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 350
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 350
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 400
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 400
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 450
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 450
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 500
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 500
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 550
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 550
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 600
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 600
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 650
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 650
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 700
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 700
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 750
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 750
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 800
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = 800
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onAttach",
					"onStack"
				},
				arg_list = {
					countTarget = 3,
					countType = 112291
				}
			},
			{
				type = "BattleBuffAddBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					buff_id = 112292,
					target = "TargetSelf",
					countType = 112291
				}
			}
		}
	},
	time = 0,
	name = "",
	init_effect = "jinengchufared",
	picture = "",
	desc = "",
	stack = 3,
	id = 112291,
	icon = 112280,
	last_effect = "skill_aerbi1"
}
