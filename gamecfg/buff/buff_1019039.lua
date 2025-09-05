return {
	blink = {
		0.8,
		0.8,
		0.8,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				add = 0,
				mul = -3000
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "dodgeRate",
				number = -100
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -3000
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -3300
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -200
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -3660
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -300
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -3990
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -400
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -4320
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -500
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -4650
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -600
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -4980
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -700
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -5310
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -800
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -5640
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -900
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffFixVelocity",
				trigger = {
					"onAttach",
					"onStack",
					"onRemove"
				},
				arg_list = {
					add = 0,
					mul = -6000
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "dodgeRate",
					number = -1000
				}
			}
		}
	},
	time = 6,
	name = "",
	init_effect = "",
	color = "yellow",
	picture = "",
	desc = "回避率降低-不被记为照明弹-对特拉法尔加造成伤害降低",
	stack = 1,
	id = 1019039,
	icon = 19030,
	last_effect = "EVDdowm"
}
