return {
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	effect_list = {},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.05
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
					number = -0.035
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.061
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
					number = -0.04
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.072
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
					number = -0.045
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.083
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
					number = -0.05
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.094
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
					number = -0.055
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.105
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
					number = -0.06
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.116
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
					number = -0.065
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.127
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
					number = -0.07
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.138
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
					number = -0.075
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttr",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "damageRatioBullet",
					number = 0.15
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
					number = -0.08
				}
			},
			{
				type = "BattleBuffCount",
				trigger = {
					"onTorpedoWeaponFire"
				},
				arg_list = {
					countTarget = 3,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBattleBuffCount"
				},
				arg_list = {
					count = 1,
					countType = 802060
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onRemove"
				},
				arg_list = {
					skill_id = 802060,
					target = "TargetSelf"
				}
			}
		}
	},
	time = 0,
	name = "",
	init_effect = "jinengchufared",
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 802062,
	icon = 802060,
	last_effect = ""
}
