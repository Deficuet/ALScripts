local var_0_0 = class("SpinePaintingConst")

var_0_0.drag_type_normal = 1
var_0_0.drag_type_rgb = 2
var_0_0.drag_type_list = 3
var_0_0.ship_drag_datas = {
	gaoxiong_6 = {
		multiple_face = {},
		drag_data = {
			type = 1,
			name = {
				"gaoxiong_6"
			}
		}
	},
	jianye_5 = {
		multiple_face = {},
		drag_data = {
			type = 1,
			name = {
				"jianye_5"
			}
		}
	},
	aimudeng_4 = {
		multiple_count = 5,
		multiple_face = {
			"aimudeng_4",
			"aimudeng_4M"
		},
		drag_data = {
			type = 2,
			name = {
				"aimudeng_4M"
			}
		}
	},
	yaerweite_2 = {
		multiple_face = {},
		drag_data = {},
		drag_click_data = {
			type = 3,
			lock_layer = true,
			list = {
				"touch"
			}
		}
	},
	kaiersheng_3 = {
		multiple_face = {},
		drag_click_data = {
			type = 1,
			name = {
				"kaiersheng_3"
			}
		}
	}
}
var_0_0.ship_action_extend = {
	jianwu_3 = {
		"login",
		"touch_body",
		"touch_head",
		"touch_special"
	}
}
var_0_0.ship_effect_action_able = {
	jianwu_3 = {
		"login"
	}
}

return var_0_0
