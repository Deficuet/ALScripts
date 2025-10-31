return {
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "cri",
				number = 0.1
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "criDamage",
				number = 0.1
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "dodgeRate",
				number = 1000
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFire"
			},
			arg_list = {
				skill_id = 114103,
				target = "TargetSelf",
				index = {
					1
				}
			}
		},
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 8,
				countType = 114100,
				index = {
					1
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id = 114104,
				countType = 114100
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.1
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.1
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 1000
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.112
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.112
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 1110
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.124
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.124
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 1220
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.145
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.145
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 1330
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.157
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.157
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 1440
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.169
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.169
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 1550
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.19
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.19
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 1660
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.208
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.208
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 1770
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.226
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.226
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 1880
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "cri",
					number = 0.25
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate"
				},
				arg_list = {
					attr = "criDamage",
					number = 0.25
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach"
				},
				arg_list = {
					attr = "dodgeRate",
					number = 2000
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					skill_id = 114103,
					target = "TargetSelf",
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onFire"
				},
				arg_list = {
					countTarget = 8,
					countType = 114100,
					index = {
						1
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					target = "TargetSelf",
					skill_id = 114104,
					countType = 114100
				}
			}
		}
	},
	desc_get = "",
	name = "",
	init_effect = "jinengchufared",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 114103,
	icon = 114100,
	last_effect = ""
}
