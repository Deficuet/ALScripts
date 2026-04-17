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
				skill_id = 106396,
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
				skill_id = 106397,
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
				skill_id = 106391
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
					skill_id = 106396,
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
					skill_id = 106397,
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
					skill_id = 106391
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
					rant = 5500,
					skill_id = 106396,
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
					rant = 5500,
					skill_id = 106397,
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
					skill_id = 106391
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
					rant = 6000,
					skill_id = 106396,
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
					rant = 6000,
					skill_id = 106397,
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
					skill_id = 106391
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
					rant = 6500,
					skill_id = 106396,
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
					rant = 6500,
					skill_id = 106397,
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
					skill_id = 106391
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
					rant = 7000,
					skill_id = 106396,
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
					rant = 7000,
					skill_id = 106397,
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
					skill_id = 106391
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
					rant = 7500,
					skill_id = 106396,
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
					rant = 7500,
					skill_id = 106397,
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
					skill_id = 106391
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
					rant = 8000,
					skill_id = 106396,
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
					skill_id = 106397,
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
					skill_id = 106391
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
					rant = 8500,
					skill_id = 106396,
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
					rant = 8500,
					skill_id = 106397,
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
					skill_id = 106391
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
					rant = 9000,
					skill_id = 106396,
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
					rant = 9000,
					skill_id = 106397,
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
					skill_id = 106391
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
					rant = 10000,
					skill_id = 106396,
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
					rant = 10000,
					skill_id = 106397,
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
					skill_id = 106391
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
	id = 106391,
	icon = 106390,
	last_effect = ""
}
