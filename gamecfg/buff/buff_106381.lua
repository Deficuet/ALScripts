return {
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "Hito_Shuziku"
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
				number = 100
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onChargeWeaponFire"
			},
			arg_list = {
				maxTargetNumber = 0,
				rant = 5000,
				skill_id = 106386,
				target = "TargetSelf",
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Shizuku_fox"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onChargeWeaponFire"
			},
			arg_list = {
				minTargetNumber = 1,
				rant = 5000,
				skill_id = 106387,
				target = "TargetSelf",
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Shizuku_fox"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 10,
				target = "TargetSelf",
				skill_id = 106381
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
					number = 100
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 5000,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 5000,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
					number = 200
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 5330,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 5330,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
					number = 300
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 5660,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 5660,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
					number = 400
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 5990,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 5990,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
					number = 500
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 6320,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 6320,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
					number = 600
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 6650,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 6650,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
					number = 700
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 6980,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 6980,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
					number = 800
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 7310,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 7310,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
					number = 900
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 7640,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 7640,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	{
		effect_list = {
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach"
				},
				arg_list = {
					tag = "Hito_Shuziku"
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
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					maxTargetNumber = 0,
					rant = 8000,
					skill_id = 106386,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					minTargetNumber = 1,
					rant = 8000,
					skill_id = 106387,
					target = "TargetSelf",
					check_target = {
						"TargetSelf",
						"TargetShipTag"
					},
					ship_tag_list = {
						"Shizuku_fox"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					time = 10,
					target = "TargetSelf",
					skill_id = 106381
				}
			}
		}
	},
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 106381,
	icon = 106380,
	last_effect = ""
}
