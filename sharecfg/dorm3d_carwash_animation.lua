pg = pg or {}
pg.dorm3d_carwash_animation = rawget(pg, "dorm3d_carwash_animation") or setmetatable({
	__name = "dorm3d_carwash_animation"
}, confNEO)
pg.dorm3d_carwash_animation.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	12,
	10,
	11,
	99
}
pg.base = pg.base or {}
pg.base.dorm3d_carwash_animation = {}

;(function()
	pg.base.dorm3d_carwash_animation[1] = {
		anim_r = "XC1_idle_fb01_R",
		id = 1,
		hidden_reaction = "",
		mood_value_plus = 10,
		anim_l = "XC1_idle_fb01_L",
		anim = "",
		collider = {
			"Pelvis Collider",
			""
		},
		gun_type = {
			3
		}
	}
	pg.base.dorm3d_carwash_animation[2] = {
		anim_r = "",
		id = 2,
		hidden_reaction = "",
		mood_value_plus = 11,
		anim_l = "",
		anim = "XC1_idle_fb02",
		collider = {
			"RightChestAssistA01",
			"R UpperArm Collider",
			"Spine3 Collider",
			"Spine2 Collider",
			"Spine1 Collider"
		},
		gun_type = {
			1
		}
	}
	pg.base.dorm3d_carwash_animation[3] = {
		anim_r = "",
		id = 3,
		hidden_reaction = "",
		mood_value_plus = 9,
		anim_l = "",
		anim = "XC1_idle_fb03",
		collider = {
			"L Thigh1 Collider",
			"L Thigh2 Collider",
			"R Thigh1 Collider",
			"R Thigh2 Collider"
		},
		gun_type = {
			2
		}
	}
	pg.base.dorm3d_carwash_animation[4] = {
		anim_r = "",
		id = 4,
		mood_value_plus = -10,
		anim_l = "",
		anim = "",
		collider = {
			"Head Collider"
		},
		hidden_reaction = {
			sceneName = "XiChe_79902_TSZS-1",
			sceneAB = "dorm3d/character/naximofu_db/timeline/xiche_79902_tszs-1/xiche_79902_tszs-1_scene",
			enter = "white",
			exit = "black"
		},
		gun_type = {
			1,
			2
		}
	}
	pg.base.dorm3d_carwash_animation[5] = {
		anim_r = "",
		id = 5,
		hidden_reaction = "",
		mood_value_plus = 10,
		anim_l = "",
		anim = "XC2_idle_fb01",
		collider = {
			"Pelvis Collider",
			"LeftChestAssistA01",
			"R UpperArm Collider",
			"Spine1 Collider",
			"Spine Collider"
		},
		gun_type = {
			1
		}
	}
	pg.base.dorm3d_carwash_animation[6] = {
		anim_r = "",
		id = 6,
		hidden_reaction = "",
		mood_value_plus = 10,
		anim_l = "",
		anim = "XC2_idle_fb02",
		collider = {
			"Pelvis Collider",
			"Spine3 Collider",
			"Spine2 Collider",
			"Spine1 Collider",
			"Spine Collider",
			"L Thigh1 Collider"
		},
		gun_type = {
			2
		}
	}
	pg.base.dorm3d_carwash_animation[7] = {
		anim_r = "",
		id = 7,
		hidden_reaction = "",
		mood_value_plus = 10,
		anim_l = "",
		anim = "XC2_idle_fb03",
		collider = {
			"R Thigh1 Collider",
			"R Thigh2 Collider",
			"R Calf1 Collider",
			"R Calf2 Collider"
		},
		gun_type = {
			1,
			2
		}
	}
	pg.base.dorm3d_carwash_animation[8] = {
		anim_r = "",
		id = 8,
		hidden_reaction = "",
		mood_value_plus = 11,
		anim_l = "",
		anim = "XC2_idle_fb04",
		collider = {
			"Pelvis Collider",
			"Spine3 Collider",
			"Spine2 Collider",
			"Spine1 Collider",
			"Spine Collider"
		},
		gun_type = {
			3
		}
	}
	pg.base.dorm3d_carwash_animation[9] = {
		anim_r = "XC3_idle_CW_fb01_R",
		id = 9,
		hidden_reaction = "",
		mood_value_plus = 9,
		anim_l = "XC3_idle_CW_fb01_L",
		anim = "",
		collider = {
			"Pelvis Collider",
			"Spine Collider",
			"Spine3 Collider",
			"Spine2 Collider",
			"Spine1 Collider"
		},
		gun_type = {
			1,
			2,
			3
		}
	}
	pg.base.dorm3d_carwash_animation[12] = {
		anim_r = "XC3_idle_CW_fb01_R",
		id = 12,
		hidden_reaction = "",
		mood_value_plus = 8,
		anim_l = "XC3_idle_CW_fb01_L",
		anim = "",
		collider = {
			"RightChestAssistA01",
			"LeftChestAssistA01",
			"R Thigh1 Collider",
			"R Thigh2 Collider",
			"L Thigh1 Collider",
			"L Thigh2 Collider"
		},
		gun_type = {
			1,
			2,
			3
		}
	}
	pg.base.dorm3d_carwash_animation[10] = {
		anim_r = "",
		id = 10,
		hidden_reaction = "",
		mood_value_plus = 0,
		anim_l = "",
		anim = "XC3_idle_CN_fb01",
		collider = {
			"R Hand Collider"
		},
		gun_type = {}
	}
	pg.base.dorm3d_carwash_animation[11] = {
		anim_r = "",
		id = 11,
		hidden_reaction = "",
		mood_value_plus = 0,
		anim_l = "",
		anim = "XC3_idle_CN_fb02",
		collider = {
			"LeftChestAssistA01"
		},
		gun_type = {}
	}
	pg.base.dorm3d_carwash_animation[99] = {
		anim_r = "",
		id = 99,
		mood_value_plus = -10,
		anim_l = "",
		anim = "",
		collider = {
			"Head Collider"
		},
		hidden_reaction = {
			sceneName = "XiChe_79902_TSZS-2",
			sceneAB = "dorm3d/character/naximofu_db/timeline/xiche_79902_tszs-2/xiche_79902_tszs-2_scene",
			enter = "white",
			exit = "black"
		},
		gun_type = {
			1,
			2
		}
	}
end)()
