return {
	effect_list = {},
	{
		effect_list = {
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -100
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -100
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -100
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -100
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
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
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -120
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -120
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -120
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -120
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
					number = -120
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
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
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -140
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -140
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -140
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -140
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
					number = -140
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
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
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -160
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -160
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -160
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -160
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
					number = -160
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
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
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -180
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -180
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -180
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -180
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
					number = -180
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
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
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -200
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -200
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -200
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -200
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
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
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -220
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -220
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -220
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -220
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
					number = -220
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
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
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -240
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -240
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -240
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -240
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
					number = -240
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
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
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -270
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -270
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -270
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -270
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
					number = -270
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
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
					"onRemove"
				},
				arg_list = {
					attr = "cannonPower",
					number = -300
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "torpedoPower",
					number = -300
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "airPower",
					number = -300
				}
			},
			{
				type = "BattleBuffAddAttrRatio",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					attr = "antiAirPower",
					number = -300
				}
			},
			{
				type = "BattleBuffAddTag",
				trigger = {
					"onAttach",
					"onRemove"
				},
				arg_list = {
					tag = "enemyantiAirPowerDownTag"
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
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv1"
					}
				}
			},
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onUpdate"
				},
				arg_list = {
					minTargetNumber = 1,
					quota = 1,
					skill_id = 150460,
					check_target = {
						"TargetShipTag"
					},
					ship_tag_list = {
						"tianchengcv2"
					}
				}
			},
			{
				type = "BattleBuffCleanse",
				trigger = {
					"onRemove"
				},
				arg_list = {
					buff_id_list = {
						150464
					}
				}
			}
		}
	},
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 150463,
	icon = 150460,
	last_effect = ""
}
