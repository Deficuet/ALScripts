return {
	blink = {
		1,
		0,
		0,
		0.9,
		0.8
	},
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					117050
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFire"
			},
			arg_list = {
				maxTargetNumber = 0,
				skill_id = 117051,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"A2_skill1"
				},
				index = {
					2
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFire"
			},
			arg_list = {
				minTargetNumber = 1,
				skill_id = 117054,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"A2_skill1"
				},
				index = {
					2
				}
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "cannonPower",
				number = 1000
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate",
				"onRemove"
			},
			arg_list = {
				attr = "cri",
				number = 0.1
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 2,
				target = "TargetSelf",
				skill_id = 117052
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBeforeFatalDamage",
				"onRemove"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 117053
			}
		},
		{
			type = "BattleBuffCancelBuff",
			trigger = {
				"onBeforeFatalDamage"
			},
			arg_list = {
				count = 1
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 117059
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 1000
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 1110
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.111
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 1220
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.122
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 1330
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.133
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 1440
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.144
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 1550
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.155
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 1660
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.166
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 1770
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.177
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 1880
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.188
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onAttach"
				},
				arg_list = {
					buff_id_list = {
						117050
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					skill_id = 117051,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onFire"
				},
				arg_list = {
					minTargetNumber = 1,
					skill_id = 117054,
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"A2_skill1"
					},
					index = {
						2
					}
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = 2000
				}
			},
			{
				type = "BattleBuffAddBulletAttr",
				trigger = {
					"onBulletCreate",
					"onRemove"
				},
				arg_list = {
					attr = "cri",
					number = 0.2
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 2,
					target = "TargetSelf",
					skill_id = 117052
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onBeforeFatalDamage",
					"onRemove"
				},
				arg_list = {
					quota = 1,
					target = "TargetSelf",
					skill_id = 117053
				}
			},
			{
				type = "BattleBuffCancelBuff",
				trigger = {
					"onBeforeFatalDamage"
				},
				arg_list = {
					count = 1
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onAttach"
				},
				arg_list = {
					skill_id = 117059
				}
			}
		}
	},
	desc_get = "",
	name = "",
	init_effect = "",
	time = 40,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 117052,
	icon = 117050,
	last_effect = ""
}
