local var_0_0 = class("SpinePaintingConst")

var_0_0.drag_type_normal = 1
var_0_0.drag_type_rgb = 2
var_0_0.drag_type_list = 3
var_0_0.ship_drag_datas = {
	gaoxiong_6 = {
		click_trigger = false,
		multiple_face = {},
		hit_area = {
			"drag"
		},
		drag_data = {
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					is_default = true,
					idle = "normal",
					action = "drag",
					change_idle = "ex"
				},
				{
					is_default = false,
					idle = "ex",
					action = "drag_ex",
					change_idle = "normal"
				}
			}
		}
	},
	jianye_5 = {
		click_trigger = false,
		multiple_face = {},
		hit_area = {
			"drag"
		},
		drag_data = {
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					is_default = true,
					idle = "normal",
					action = "drag",
					change_idle = "ex"
				},
				{
					is_default = false,
					idle = "ex",
					action = "drag_ex",
					change_idle = "normal"
				}
			}
		}
	},
	aimudeng_4 = {
		click_trigger = false,
		multiple_face = {
			name = {
				"aimudeng_4",
				"aimudeng_4M"
			},
			data = {
				{
					"normal",
					0
				},
				{
					"ex",
					5
				}
			}
		},
		hit_area = {
			"drag"
		},
		drag_data = {
			material = "SkeletonGraphicDefaultRGBSplit",
			type = var_0_0.drag_type_rgb,
			config_client = {
				{
					is_default = true,
					idle = "normal",
					action = "drag",
					change_idle = "ex"
				},
				{
					is_default = false,
					idle = "ex",
					action = "drag_ex",
					change_idle = "normal"
				}
			}
		}
	},
	yaerweite_2 = {
		click_trigger = true,
		multiple_face = {},
		drag_data = {},
		hit_area = {
			"drag"
		},
		drag_data = {
			lock_layer = true,
			type = var_0_0.drag_type_list,
			config_client = {
				"touch",
				"normal"
			}
		}
	},
	kaiersheng_3 = {
		click_trigger = true,
		multiple_face = {},
		hit_area = {
			"drag"
		},
		drag_data = {
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					is_default = true,
					idle = "normal",
					action = "drag",
					change_idle = "ex"
				},
				{
					is_default = false,
					idle = "ex",
					action = "drag_ex",
					change_idle = "normal"
				}
			}
		}
	},
	siwanshi_4 = {
		click_trigger = true,
		multiple_face = {},
		hit_area = {
			"touch_head",
			"touch_body",
			"touch_special",
			"touch_special_2",
			"touch_special_back",
			"touch_head_2"
		},
		action_enable = {
			{
				name = "normal",
				ignore = {}
			},
			{
				name = "touch_special_normal",
				ignore = {
					"touch_body",
					"touch_head",
					"change_out"
				}
			}
		},
		drag_data = {
			lock_layer = true,
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					change_idle = "normal",
					idle = "normal",
					action = "touch_body",
					is_default = true,
					event = "TouchBody",
					hit = "touch_body"
				},
				{
					change_idle = "normal",
					idle = "normal",
					action = "touch_head",
					is_default = true,
					event = "TouchHead",
					hit = "touch_head"
				},
				{
					change_idle = "touch_special_normal",
					action = "touch_special",
					idle = "normal",
					event = "TouchSpecial",
					is_default = true,
					fold = true,
					hit = "touch_special",
					effect_hide = {
						"lihui_siwanshi_4"
					}
				},
				{
					change_idle = "",
					idle = "touch_special_normal",
					action = "",
					is_default = false,
					event = "TouchSpecial",
					hit = "touch_special_2"
				},
				{
					change_idle = "",
					idle = "touch_special_normal",
					action = "",
					is_default = false,
					event = "TouchHead",
					hit = "touch_head_2"
				},
				{
					change_idle = "normal",
					idle = "touch_special_normal",
					action = "touch_special_2",
					fold = true,
					is_default = false,
					hit = "touch_special_back",
					effect_hide = {
						"lihui_siwanshi_4"
					}
				}
			}
		}
	},
	telinida_2 = {
		click_trigger = false,
		multiple_face = {},
		hit_area = {
			"drag"
		},
		drag_data = {
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					is_default = true,
					idle = "normal",
					action = "drag",
					change_idle = "ex"
				},
				{
					is_default = false,
					idle = "ex",
					action = "drag_ex",
					change_idle = "normal"
				}
			}
		}
	},
	molisen_3 = {
		click_trigger = true,
		multiple_face = {
			name = {
				"molisen_3"
			},
			data = {
				{
					"normal",
					0
				},
				{
					"ex",
					5
				}
			}
		},
		hit_area = {
			"drag",
			"random"
		},
		action_enable = {
			{
				name = "normal",
				ignore = {}
			},
			{
				name = "ex",
				ignore = {
					"touch_random1",
					"touch_random2"
				}
			}
		},
		drag_data = {
			lock_layer = true,
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					change_idle = "ex",
					idle = "normal",
					action = "drag",
					is_default = true,
					active = true,
					hit = "drag"
				},
				{
					fold = true,
					change_idle = "normal",
					idle = "normal",
					is_default = true,
					hit = "random",
					action = {
						"touch_random1",
						"touch_random2"
					}
				},
				{
					change_idle = "normal",
					idle = "ex",
					action = "drag_ex",
					is_default = false,
					active = true,
					hit = "drag"
				}
			}
		}
	},
	suweiaitongmeng_4 = {
		click_trigger = true,
		multiple_face = {},
		hit_area = {
			"touch_body",
			"touch_head",
			"touch_special",
			"touch_special_2",
			"touch_special_back"
		},
		action_enable = {
			{
				name = "normal",
				ignore = {}
			},
			{
				name = "touch_special_normal",
				ignore = {
					"touch_body",
					"change_out"
				}
			}
		},
		drag_data = {
			lock_layer = true,
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					change_idle = "normal",
					idle = "normal",
					action = "touch_body",
					is_default = true,
					event = "TouchBody",
					hit = "touch_body"
				},
				{
					change_idle = "normal",
					idle = "normal",
					action = "touch_head",
					is_default = true,
					event = "TouchHead",
					hit = "touch_head"
				},
				{
					change_idle = "touch_special_normal",
					action = "touch_special",
					idle = "normal",
					event = "TouchSpecial",
					is_default = true,
					fold = true,
					hit = "touch_special",
					effect_hide = {
						"lihui_suweiaitongmeng_4"
					}
				},
				{
					change_idle = "normal",
					idle = "touch_special_normal",
					action = "touch_special_2",
					fold = true,
					is_default = false,
					hit = "touch_special_2",
					effect_hide = {
						"lihui_suweiaitongmeng_4"
					}
				}
			}
		}
	},
	I404_2 = {
		click_trigger = true,
		multiple_face = {},
		hit_area = {
			"drag"
		},
		replace_word = {
			"ex"
		},
		drag_data = {
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					change_idle = "ex",
					idle = "normal",
					action = "drag",
					is_default = true,
					active = true,
					hit = "drag"
				},
				{
					change_idle = "normal",
					idle = "ex",
					action = "drag_ex",
					is_default = false,
					active = true,
					hit = "drag"
				}
			}
		}
	},
	laimuhao_2 = {
		click_trigger = false,
		multiple_face = {},
		hit_area = {
			"drag"
		},
		replace_word = {
			"ex"
		},
		drag_data = {
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					change_idle = "ex",
					idle = "normal",
					action = "drag",
					is_default = true,
					active = true,
					hit = "drag"
				},
				{
					change_idle = "normal",
					idle = "ex",
					action = "drag_ex",
					is_default = false,
					active = true,
					hit = "drag"
				}
			}
		}
	},
	maoxianhao_2 = {
		click_trigger = true,
		multiple_face = {},
		hit_area = {
			"touch_special"
		},
		drag_data = {
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					change_idle = "normal",
					idle = "normal",
					action = "touch_special",
					is_default = true,
					hit = "touch_special"
				}
			}
		}
	},
	bote_2 = {
		click_trigger = true,
		multiple_face = {},
		hit_area = {
			"drag"
		},
		drag_data = {
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					change_idle = "normal_lv2",
					idle = "normal",
					action = "normal_lv1-2",
					is_default = true,
					active = true,
					hit = "drag"
				},
				{
					change_idle = "normal_lv3",
					idle = "normal_lv2",
					action = "normal_lv2-3",
					is_default = true,
					active = true,
					hit = "drag"
				},
				{
					change_idle = "normal_lv5",
					idle = "normal_lv3",
					action = "normal_lv3-5",
					is_default = true,
					active = true,
					hit = "drag"
				},
				{
					change_idle = "normal",
					idle = "normal_lv5",
					action = "normal_lv5-1",
					is_default = true,
					active = true,
					hit = "drag"
				}
			}
		}
	},
	yuekechengII_4 = {
		click_trigger = true,
		multiple_face = {},
		hit_area = {
			"touch_body",
			"touch_head",
			"touch_special",
			"touch_special_2",
			"touch_special_back"
		},
		action_enable = {
			{
				name = "normal",
				ignore = {}
			},
			{
				name = "touch_special_normal",
				ignore = {
					"touch_body",
					"change_out"
				}
			}
		},
		drag_data = {
			lock_layer = true,
			type = var_0_0.drag_type_normal,
			config_client = {
				{
					change_idle = "normal",
					idle = "normal",
					action = "touch_body",
					is_default = true,
					event = "TouchBody",
					hit = "touch_body"
				},
				{
					change_idle = "normal",
					idle = "normal",
					action = "touch_head",
					is_default = true,
					event = "TouchHead",
					hit = "touch_head"
				},
				{
					change_idle = "touch_special_normal",
					action = "touch_special",
					idle = "normal",
					event = "TouchSpecial",
					is_default = true,
					fold = true,
					hit = "touch_special",
					effect_hide = {
						"lihui_yuekechengII_4"
					}
				},
				{
					event = "TouchSpecial",
					is_default = false,
					idle = "touch_special_normal",
					hit = "touch_special_2"
				},
				{
					change_idle = "normal",
					idle = "touch_special_normal",
					action = "touch_special_2",
					fold = true,
					is_default = false,
					hit = "touch_special_back",
					effect_hide = {
						"lihui_yuekechengII_4"
					}
				}
			}
		}
	}
}
var_0_0.ship_effect_action_able = {
	jianwu_3 = {
		"login"
	}
}

return var_0_0
