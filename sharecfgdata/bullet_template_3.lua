(function()
	_G.pg.base.bullet_template_3[3390001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			cldMax = 15,
			scaleSpeed = 3
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390003] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "unknownV_mal_yulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3390003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 1,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.03,
				v = 0,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3390102,
					barrage_ID = 3390102,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3390103,
					barrage_ID = 3390103,
					emitterType = "BattleBulletEmitter"
				},
				FXID = "huoqiubaozha2"
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390102] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 3,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 3,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390104] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.1,
				v = 0,
				flip = false,
				t = 0.7
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3390105,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3390110
				},
				{
					bullet_ID = 3390106,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3390111
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390105] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390106] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390106,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390107] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "unknownV_mal_yulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3390107,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 4,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390108] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "unknownV_mal_yulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3390108,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 3.5,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390201] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390201,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3390202,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3390203,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3390204,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3390205,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3390206,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3390207,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3390208,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390202] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390202,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390203] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390203,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390204] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390204,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390205] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390205,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390206] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390206,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390207] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390207,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390208] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390208,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390209] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390209,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3390211,
					barrage_ID = 3230205,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390210] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390210,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3390212,
					barrage_ID = 3230205,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390211] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390211,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390212] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390212,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390213] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "unknownV_mal_yulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3390213,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 2,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.02,
				v = 0,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390214] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "unknownV_mal_yulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3390214,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 2,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.02,
				v = 0,
				flip = false,
				t = 0.7
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.4
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390215] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390215,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3390216,
					barrage_ID = 3230215,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390216] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390216,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3390217,
					barrage_ID = 3230215,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390217] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390217,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390218] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390218,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390219] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390219,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3390220,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3239038
				},
				{
					initialSplit = true,
					bullet_ID = 3390220,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3239039
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390220] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bulletGER",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390220,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390221] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390221,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3390222,
					barrage_ID = 3230220,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3390222,
					barrage_ID = 3230221,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3390222] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3390222,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 1
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391012,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391013,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391014,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391015,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391016,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391018,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391019,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391020,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391021,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391022,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheHE",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 12,
		damage_type = {
			1,
			1.1,
			1.2
		},
		DMG_font = {
			{
				4,
				0.7
			},
			{
				2,
				1.3
			},
			{
				2,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 10
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.1,
			ignoreShield = true,
			ignoreB = true,
			randomOffsetX = 32,
			randomOffsetZ = 32,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391024] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 12,
		damage_type = {
			1.35,
			0.95,
			0.7
		},
		DMG_font = {
			{
				4,
				0.7
			},
			{
				2,
				1.3
			},
			{
				2,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 10
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.1,
			ignoreShield = true,
			ignoreB = true,
			randomOffsetX = 32,
			randomOffsetZ = 32,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 6,
		damage_type = {
			0.7,
			1,
			0.9
		},
		DMG_font = {
			{
				4,
				0.9
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 15
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			randomOffsetZ = 15,
			randomOffsetX = 15,
			accuracy = "chargeBulletAccuracy",
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391027,
					barrage_ID = 3239020,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391028,
					barrage_ID = 3239021,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391027] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391028] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391028,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391029] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391029,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391030,
					barrage_ID = 3159052,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391030] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391030,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391031] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391031,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391032,
					barrage_ID = 3159055,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391032] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391032,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391033] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391033,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -26,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391034] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391034,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -26,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391035] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheHE",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391035,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1.1,
			0.8,
			0.7
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -32,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391036] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheHE",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391036,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1.1,
			0.8,
			0.7
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -32,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391037] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391037,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -38,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391038] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391038,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -38,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391039] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheHE",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391039,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1.1,
			0.8,
			0.7
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -44,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391040] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheHE",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391040,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1.1,
			0.8,
			0.7
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -44,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391041] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391041,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -50,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391042] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391042,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -50,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391043] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheHE",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391043,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1.1,
			0.8,
			0.7
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -56,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391044] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheHE",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391044,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1.1,
			0.8,
			0.7
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -56,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391045] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391045,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -62,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391046] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391046,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -62,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391047] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheHE",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391047,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1.1,
			0.8,
			0.7
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -68,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391048] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheHE",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391048,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1.1,
			0.8,
			0.7
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -68,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391049] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391049,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -74,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391050] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3391050,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1
			},
			{
				2,
				1.3
			},
			{
				2,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			targetFixX = -74,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391051] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391051,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391052] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391052,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391053,
					barrage_ID = 3251043,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391053] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391053,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391102,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391103,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391104,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391105,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391106,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391107,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391102] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391104] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391105] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391106] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391106,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391107] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391107,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391108] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391108,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391109,
					barrage_ID = 350201,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391110,
					barrage_ID = 350202,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391111,
					barrage_ID = 350203,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391112,
					barrage_ID = 350204,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391113,
					barrage_ID = 350205,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391114,
					barrage_ID = 350206,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391115,
					barrage_ID = 350207,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391116,
					barrage_ID = 350208,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391117,
					barrage_ID = 350209,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391118,
					barrage_ID = 350210,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391109] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391109,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391110] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391110,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391111] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391111,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391112] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391112,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391113] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391113,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391114] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391114,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391115] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391115,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391116] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391116,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391117] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391117,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391118] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391118,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391119] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391119,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 3391102,
					bullet_ID = 3391120,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391121,
					barrage_ID = 3391103,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391120] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391120,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391121] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391121,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391122] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391122,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391123,
					barrage_ID = 3391105,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391123,
					barrage_ID = 3391106,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391123,
					barrage_ID = 3391107,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391123] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391123,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391124] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 4,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391124,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 3,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391125,
					barrage_ID = 3320207,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391125] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391125,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391126,
					barrage_ID = 3320208,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391127,
					barrage_ID = 3320209,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391128,
					barrage_ID = 3320210,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391126] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391126,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391127] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391127,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391128] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391128,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391129] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391129,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391130,
					barrage_ID = 3320212,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391131,
					barrage_ID = 3320214,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391130] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391130,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			3,
			2.7,
			2.4
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391131] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391131,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391132,
					barrage_ID = 3320213,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3391133,
					barrage_ID = 3320213,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391132] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391132,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391133] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391133,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391201] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 4,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391201,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3391202,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3391203
				},
				{
					bullet_ID = 3391202,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3391204
				},
				{
					bullet_ID = 3391203,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3391205
				},
				{
					bullet_ID = 3391203,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3391206
				},
				{
					barrage_ID = 3391207,
					bullet_ID = 3391204,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391202] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391202,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391203] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391203,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391204] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391204,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391205] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391205,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391207,
					barrage_ID = 3391212,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391206] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391206,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391207,
					barrage_ID = 3391213,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391207] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kedouzidan_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391207,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391208] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391208,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391209,
					barrage_ID = 3391215,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391209] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391209,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391210] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391210,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391211] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391211,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391212,
					barrage_ID = 3391223,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391212] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391212,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391213] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391213,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391214,
					barrage_ID = 3391223,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391214] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391214,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391215] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391215,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3391216,
					barrage_ID = 3391225,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391216] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391216,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3391217] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3391217,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			3,
			2.7,
			2.4
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			2,
			2,
			2
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3395002,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3395104
				},
				{
					bullet_ID = 3395002,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3395105
				},
				{
					bullet_ID = 3395003,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3395106
				},
				{
					bullet_ID = 3395003,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3395107
				},
				{
					initialSplit = true,
					bullet_ID = 730154,
					barrage_ID = 730221,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.7
			},
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.7
			},
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			directHit = true,
			shrapnel = {
				{
					barrage_ID = 3395110,
					bullet_ID = 3395006,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395111,
					bullet_ID = 3395007,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			directHit = true,
			shrapnel = {
				{
					barrage_ID = 3395112,
					bullet_ID = 3395006,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395113,
					bullet_ID = 3395007,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395008,
					barrage_ID = 3395114,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3395009,
					barrage_ID = 3395115,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3395015,
					barrage_ID = 3395120,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395008,
					barrage_ID = 3395116,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3395009,
					barrage_ID = 3395117,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3395015,
					barrage_ID = 3395120,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 16.3,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395010,
					barrage_ID = 3395118,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 16.3,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395011,
					barrage_ID = 3395119,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395013,
					barrage_ID = 3395122,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			cldMax = 15,
			scaleSpeed = 2
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 4,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 20,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3395126,
					bullet_ID = 3395017,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					barrage_ID = 3395127,
					bullet_ID = 3395018,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395128,
					bullet_ID = 3395019,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395129,
					bullet_ID = 3226005,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1.5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395021,
					barrage_ID = 3395134,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			cldMax = 15,
			scaleSpeed = 2
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 4,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3395137,
					bullet_ID = 3395024,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395138,
					bullet_ID = 3395025,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395024] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1.3,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.3
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1.6,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.4
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			2,
			2,
			2
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3395102,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3395104
				},
				{
					bullet_ID = 3395102,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3395105
				},
				{
					bullet_ID = 3395103,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3395106
				},
				{
					bullet_ID = 3395103,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3395107
				},
				{
					initialSplit = true,
					bullet_ID = 730154,
					barrage_ID = 730221,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395102] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.7
			},
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.7
			},
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395104] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			directHit = true,
			shrapnel = {
				{
					barrage_ID = 3395110,
					bullet_ID = 3395106,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395111,
					bullet_ID = 3395107,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395105] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			directHit = true,
			shrapnel = {
				{
					barrage_ID = 3395112,
					bullet_ID = 3395106,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395113,
					bullet_ID = 3395107,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395106] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395106,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395108,
					barrage_ID = 3395114,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3395109,
					barrage_ID = 3395115,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3395115,
					barrage_ID = 3395120,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395107] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395107,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395108,
					barrage_ID = 3395116,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3395109,
					barrage_ID = 3395117,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3395115,
					barrage_ID = 3395120,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395108] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395108,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 16.3,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			fragile = 1,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395110,
					barrage_ID = 3395118,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395109] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395109,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 16.3,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395111,
					barrage_ID = 3395119,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395110] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395110,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395111] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395111,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395112] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395112,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395113,
					barrage_ID = 3395122,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395113] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395113,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395114] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395114,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395115] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395115,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395116] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 4,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395116,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 20,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3395126,
					bullet_ID = 3395117,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					barrage_ID = 3395127,
					bullet_ID = 3395118,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395128,
					bullet_ID = 3395119,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395129,
					bullet_ID = 3226005,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395117] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395117,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395118] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395118,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1.5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			velocity_offsetF = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395119] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395119,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.5,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395120] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395120,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3395121,
					barrage_ID = 3395134,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395121] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395121,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395122] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395122,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395123] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 4,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395123,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3395137,
					bullet_ID = 3395124,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3395138,
					bullet_ID = 3395125,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395124] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395124,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1.3,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			velocity_offsetF = 0.3
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395125] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395125,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1.6,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.4,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3395126] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3395126,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3396007,
					barrage_ID = 3218001,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396007,
					barrage_ID = 3218002,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396007] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "unknownV_mal_yulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3396007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 4,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.3,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.3
			},
			{
				u = -0.3,
				v = 0,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					rotateOffset = true,
					bullet_ID = 3396010,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218005
				},
				{
					rotateOffset = true,
					bullet_ID = 3396010,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218006
				},
				{
					rotateOffset = true,
					bullet_ID = 3396010,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218007
				},
				{
					rotateOffset = true,
					bullet_ID = 3396010,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218008
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396012] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "shenyuanlaser_lashen",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "shenyuanjiguang_shouji",
		effect_type = 1,
		id = 3396012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			2,
			1.8,
			1.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3396023,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218014
				},
				{
					initialSplit = true,
					bullet_ID = 730154,
					barrage_ID = 730221,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396024] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "unknownV_mal_yulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3396024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 3,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3396026,
					barrage_ID = 3218017,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396026,
					barrage_ID = 3218018,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396027,
					barrage_ID = 3218019,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396027,
					barrage_ID = 3218020,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396027,
					barrage_ID = 3218021,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396027] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396028] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396028,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3396029,
					barrage_ID = 3218022,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396030,
					barrage_ID = 3218022,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396031,
					barrage_ID = 3218022,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396029] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396029,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396030] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396030,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396031] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396031,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396032] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3396032,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 16,
			targetOffsetZ = 0,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396033] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3396033,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = -16,
			targetOffsetZ = 0,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396034] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3396034,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = 16,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396035] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3396035,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = -16,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396036] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3396036,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 8,
			targetOffsetZ = 0,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396037] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3396037,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = -8,
			targetOffsetZ = 0,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396038] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3396038,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = 8,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396039] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3396039,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = -8,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396040] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3396040,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 15
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			randomOffsetX = 16,
			randomOffsetZ = 16,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396041] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396041,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396042] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396042,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396043] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396043,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3396041,
					barrage_ID = 3218030,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396042,
					barrage_ID = 3218031,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396044] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396044,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					rotateOffset = true,
					bullet_ID = 3396043,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218032
				},
				{
					rotateOffset = true,
					bullet_ID = 3396043,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218033
				},
				{
					rotateOffset = true,
					bullet_ID = 3396043,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218034
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396045] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396045,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			velocity_offsetF = 1.5,
			fragile = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3396046,
					reaim = 1,
					emitterType = "BattleBulletEmitter",
					barrage_ID = 3218055
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396046] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_bullet",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396046,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396047] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396047,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396048] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "unknownV_mal_yulei",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 3396048,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 6,
		alert_fx = "AlertArea",
		velocity = 0,
		damage_type = {
			0.8,
			0.9,
			1.1
		},
		DMG_font = {
			{
				3,
				0.9
			},
			{
				3,
				1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			targetOffsetX = -1,
			airdrop = true,
			randomOffsetX = 12,
			offsetY = 70,
			launchVrtSpeed = -4,
			randomOffsetZ = 12,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396049] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396049,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3396050,
					barrage_ID = 3218059,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396050] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396050,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396051] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396051,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 3396003,
					bullet_ID = 3396052,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396053,
					barrage_ID = 3396004,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396052] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396052,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396053] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396053,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396054] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396054,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3396055,
					barrage_ID = 3396006,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396055,
					barrage_ID = 3396007,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396055,
					barrage_ID = 3396008,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396055] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396055,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396056] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396056,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				4,
				0.8
			},
			{
				4,
				0.6
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.6
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396057] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "gulite_jianci",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396057,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396058] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396058,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396059] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_zhangyu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396059,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396060] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "gulite_putong",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396060,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396061] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "chuantoudan",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHitSmall",
		effect_type = 1,
		id = 3396061,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 6,
		alert_fx = "AlertArea",
		velocity = 2,
		damage_type = {
			0.8,
			0.9,
			1.1
		},
		DMG_font = {
			{
				3,
				0.9
			},
			{
				3,
				1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 7
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.1,
			randomOffsetX = 16,
			randomOffsetZ = 16,
			offsetY = 60,
			airdrop = true,
			dropOffset = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396062] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jialisuoniai_jianqi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jianqi_shouji",
		effect_type = 1,
		id = 3396062,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "jianqi_shouji",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				1.2
			},
			{
				3,
				1.2
			}
		},
		acceleration = {},
		cld_box = {
			8,
			6,
			6
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396063] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissPoison",
		effect_type = 1,
		id = 3396063,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissPoison",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 9,
		damage_type = {
			0.8,
			0.9,
			1.1
		},
		DMG_font = {
			{
				4,
				0.7
			},
			{
				2,
				1.3
			},
			{
				2,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 8
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.3,
			randomOffsetX = 24,
			randomOffsetZ = 24,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396064] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_siwangliandao",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396064,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3396065,
					barrage_ID = 3396020,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3396066,
					barrage_ID = 3396021,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396065] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396065,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			0.3,
			0.3,
			0.3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396066] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_siwangliandao",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396066,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396067] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "gulite_jianci",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396067,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1
			},
			{
				3,
				0.9
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {
			{
				buff_id = 201770,
				hit_ignore = true
			}
		},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396068] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396068,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3396025,
					bullet_ID = 3396069,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3396026,
					bullet_ID = 3396070,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396069] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "chuantoudan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396069,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1
			},
			{
				3,
				0.9
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			4,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {
			{
				buff_id = 201770,
				hit_ignore = true
			}
		},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396070] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "chuantoudan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396070,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1
			},
			{
				3,
				0.9
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			4,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {
			{
				buff_id = 201770,
				hit_ignore = true
			}
		},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396071] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "udf_weixingjiguang_big",
		type = 14,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jiguang_shouji",
		effect_type = 1,
		id = 3396071,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "weixingjiguang_warning",
		velocity = 2.5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			tracker = {
				angular = 10,
				range = 200
			}
		},
		cld_box = {
			12,
			12,
			12
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			interval = 0.2
		},
		attach_buff = {},
		extra_param = {
			aim_time = 2,
			attack_time = 6,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396072] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "gulite_jianci",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3396072,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1
			},
			{
				3,
				0.9
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0.1,
				v = 0,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.2
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3396073] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "udf_weixingjiguang_big",
		type = 14,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jiguang_shouji",
		effect_type = 1,
		id = 3396073,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "weixingjiguang_warning",
		velocity = 2.5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			tracker = {
				angular = 10,
				range = 200
			}
		},
		cld_box = {
			50,
			50,
			50
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			interval = 0.2
		},
		attach_buff = {},
		extra_param = {
			aim_time = 2,
			attack_time = 6,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_yingbi02",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 1,
		miss_fx = "None",
		pierce_count = 99,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.1,
			shrapnel = {
				{
					bullet_ID = 3400004,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820088
				},
				{
					bullet_ID = 3400004,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820089
				},
				{
					bullet_ID = 3400004,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820090
				},
				{
					bullet_ID = 3400004,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820091
				},
				{
					bullet_ID = 3400004,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820092
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 1,
		miss_fx = "None",
		pierce_count = 99,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.1,
			shrapnel = {
				{
					bullet_ID = 3400005,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820092
				},
				{
					bullet_ID = 3400005,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820091
				},
				{
					bullet_ID = 3400005,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820090
				},
				{
					bullet_ID = 3400005,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820089
				},
				{
					bullet_ID = 3400005,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 820088
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_blue",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.7
			},
			{
				u = -0.2,
				v = 0,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.7
			},
			{
				u = -0.2,
				v = 0,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet13",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1.35,
			0.95,
			0.7
		},
		DMG_font = {
			{
				1,
				1.1
			},
			{
				1,
				1
			},
			{
				4,
				1
			}
		},
		acceleration = {
			{
				u = -0.12,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.5
			},
			{
				u = 0.5,
				v = -0.3,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet4",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = -0.12,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.5
			},
			{
				u = 0.5,
				v = -0.15,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet13",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1.35,
			0.95,
			0.7
		},
		DMG_font = {
			{
				1,
				1.1
			},
			{
				1,
				1
			},
			{
				4,
				1
			}
		},
		acceleration = {
			{
				u = -0.12,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.5
			},
			{
				u = 0.5,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet4",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = -0.12,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.5
			},
			{
				u = 0.5,
				v = 0.15,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet13",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1.35,
			0.95,
			0.7
		},
		DMG_font = {
			{
				1,
				1.1
			},
			{
				1,
				1
			},
			{
				4,
				1
			}
		},
		acceleration = {
			{
				u = -0.12,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.5
			},
			{
				u = 0.5,
				v = 0.3,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400101] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "paodan_shaizi",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_shaizi_hit",
		effect_type = 1,
		id = 3400101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "paodan_shaizi_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 12,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 15
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			randomOffsetX = 16,
			randomOffsetZ = 16,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400102] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "paodan_shaizi",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_shaizi_hit",
		effect_type = 1,
		id = 3400102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "paodan_shaizi_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.1,
			1.3
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 16
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = 40,
			gravity = -0.04,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400103] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "paodan_shaizi",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_shaizi_hit",
		effect_type = 1,
		id = 3400103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "paodan_shaizi_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.1,
			1.3
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 16
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = 24,
			gravity = -0.04,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400104] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "paodan_shaizi",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_shaizi_hit",
		effect_type = 1,
		id = 3400104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "paodan_shaizi_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.1,
			1.3
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 16
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = 8,
			gravity = -0.04,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400105] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "paodan_shaizi",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_shaizi_hit",
		effect_type = 1,
		id = 3400105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "paodan_shaizi_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.1,
			1.3
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 16
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = -8,
			gravity = -0.04,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400106] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "paodan_shaizi",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_shaizi_hit",
		effect_type = 1,
		id = 3400106,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "paodan_shaizi_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.1,
			1.3
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 16
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = -24,
			gravity = -0.04,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400107] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "paodan_shaizi",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_shaizi_hit",
		effect_type = 1,
		id = 3400107,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "paodan_shaizi_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 13,
		damage_type = {
			1,
			1.1,
			1.3
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 16
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = -40,
			gravity = -0.04,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400108] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_moshuqiqiu",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400108,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400109] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400109,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3400108,
					barrage_ID = 3070202,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400110] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400110,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400111] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400111,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400112] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400112,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400113] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400113,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400114] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400114,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400115] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400115,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400116] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400116,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400117] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400117,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400118] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400118,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400119] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400119,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400120] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400120,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3070209,
					bullet_ID = 3400110,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070210,
					bullet_ID = 3400111,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070211,
					bullet_ID = 3400112,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070212,
					bullet_ID = 3400113,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070213,
					bullet_ID = 3400114,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070214,
					bullet_ID = 3400115,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070215,
					bullet_ID = 3400116,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070216,
					bullet_ID = 3400117,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070217,
					bullet_ID = 3400118,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070218,
					bullet_ID = 3400119,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400121] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui03",
		type = 1,
		out_bound = 1,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400121,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400122] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400122,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3070224,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070225,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070226,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070227,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070228,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070229,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070230,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070231,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070232,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070233,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070234,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3070235,
					bullet_ID = 3400121,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400123] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 1,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400123,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400124] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400124,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3070238,
					bullet_ID = 3400123,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400125] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400125,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3070239,
					bullet_ID = 3400123,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400126] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "shenyuanlaser_short",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "shenyuanjiguang_shouji",
		effect_type = 1,
		id = 3400126,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			0.8,
			0.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400127] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "shenyuanlaser_blue_short",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jiguang_shouji",
		effect_type = 1,
		id = 3400127,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			0.8,
			0.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400201] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "yulei_moshubang",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "qiqiu_hit",
		effect_type = 1,
		id = 3400201,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400202] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "yulei_kapai",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "zidan_kapai_hit",
		effect_type = 1,
		id = 3400202,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 5,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400203] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "yulei_kapai",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "zidan_kapai_hit",
		effect_type = 1,
		id = 3400203,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 4,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400204] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "yulei_kapai",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "zidan_kapai_hit",
		effect_type = 1,
		id = 3400204,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			tracker = {
				angular = 1.5,
				range = 24
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400205] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400205,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "TorAlert",
		velocity = 9,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400206] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu04",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400206,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "TorAlert",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400207] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu05",
		type = 5,
		out_bound = 4,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400207,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 3,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3400208,
					barrage_ID = 3400207,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400208] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400208,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3400209,
					barrage_ID = 3400208,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3400210,
					barrage_ID = 3400209,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3400211,
					barrage_ID = 3400210,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400209] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400209,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400210] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400210,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400211] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan07",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400211,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400212] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400212,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3400213,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3400214,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3400215,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3400216,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3400217,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3400218,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400213] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_puke_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400213,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400214] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_puke_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400214,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400215] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_puke_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400215,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400216] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_puke_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400216,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400217] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_puke_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400217,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400218] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_puke_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400218,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400219] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400219,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 60,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3400215,
					bullet_ID = 3400221,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400220] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu04",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400220,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3400216,
					bullet_ID = 3400222,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400221] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "DoubleBulletUSA_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400221,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400222] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "DoubleBulletUSA",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400222,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400223] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400223,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3400224,
					barrage_ID = 3400218,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3400225,
					barrage_ID = 3400219,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400224] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet4",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400224,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3400225] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet4",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3400225,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bingzhuibig",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "bingzhui_hit",
		effect_type = 1,
		id = 3404001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "bingzhui_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			randomLaunchOffsetZ = 40
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bingzhuibig",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "bingzhui_hit",
		effect_type = 1,
		id = 3404002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "bingzhui_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.7
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.1,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3404005,
					barrage_ID = 3404006,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.1,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3404006,
					barrage_ID = 3404007,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun05",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "TorAlert",
		velocity = 0.01,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.08,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.2,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun06",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "TorAlert",
		velocity = 0.01,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.08,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.2,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			randomLaunchOffsetZ = 30,
			scaleSpeed = 1,
			lastTime = 0.01,
			randomLaunchOffsetX = 8,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 3404008,
					rotateOffset = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315118
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315119
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315120
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315121
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315122
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315123
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315124
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 150,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			3,
			2.7,
			2,
			4
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_blue",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 150,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 3404008,
					rotateOffset = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315118
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315119
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315120
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315121
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315122
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315123
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3404009,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3315124
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet07",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet07",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3404022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3404022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			scaleSpeed = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shuidizidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 18,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				4,
				0.8
			},
			{
				4,
				0.6
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_zuqiu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				4,
				0.8
			},
			{
				4,
				0.6
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406003] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "yulei_hailang",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3406003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 3,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shuidizidan04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.75,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.025,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.22
			},
			{
				u = 0.2,
				v = 0,
				flip = false,
				t = 0.4
			}
		},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bulletHuaban",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				4,
				0.8
			},
			{
				4,
				0.6
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406006] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "yulei_aixin",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3406006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 3,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_maozhua_small",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 18,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shuidizidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 18,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				4,
				0.8
			},
			{
				4,
				0.6
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "music_yinfuzidan05_m",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 18,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				4,
				0.8
			},
			{
				4,
				0.6
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_changpian",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3406010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1.1
			},
			{
				1,
				1
			},
			{
				4,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1,
			1.3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 4
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "music_genzong1",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				1,
				1.1
			},
			{
				1,
				1
			},
			{
				4,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1,
			1.3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_qiuxingshandian",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_shandian_hit",
		effect_type = 1,
		id = 3406012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "paodan_shandian_hit",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 12,
		damage_type = {
			0.7,
			1,
			0.9
		},
		DMG_font = {
			{
				4,
				0.9
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			randomOffsetZ = 19,
			randomOffsetX = 19,
			accuracy = "chargeBulletAccuracy",
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_qiuxingshandian",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_shandian_hit",
		effect_type = 1,
		id = 3406013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "paodan_shandian_hit",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 12,
		damage_type = {
			0.7,
			1,
			0.9
		},
		DMG_font = {
			{
				4,
				0.9
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 15
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			randomOffsetZ = 19,
			randomOffsetX = 19,
			accuracy = "chargeBulletAccuracy",
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_tianti",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "",
		velocity = 18,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_youhun",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3406015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 18,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				4,
				0.8
			},
			{
				4,
				0.6
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406016] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "shenyuanbullet4",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3406016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 3,
		damage_type = {
			0.8,
			1,
			1.5
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.4
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3406017] = {
		hit_sfx = "battle/hit",
		range_offset = 0,
		modle_ID = "paodan_xigua",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 3406017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 6,
		alert_fx = "AlertArea",
		velocity = 0,
		damage_type = {
			0.8,
			0.9,
			1.1
		},
		DMG_font = {
			{
				3,
				0.9
			},
			{
				3,
				1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			offsetY = 70,
			launchVrtSpeed = -4,
			targetOffsetX = -1,
			airdrop = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			directHit = true,
			shrapnel = {
				{
					barrage_ID = 3409002,
					bullet_ID = 3409002,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409003,
					bullet_ID = 3409003,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409004,
					bullet_ID = 3409004,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409005,
					bullet_ID = 3409005,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 9,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {
			time = 1.3,
			range = 16
		},
		attach_buff = {
			{
				buff_id = 200454,
				effect_id = "AlertArea_looping"
			}
		},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "A2_slash_enemy",
		effect_type = 1,
		id = 3409003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "A2_slash_enemy",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.1,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			3,
			3.9,
			3.9
		},
		DMG_font = {
			{
				2,
				1.4
			},
			{
				2,
				1.4
			},
			{
				2,
				1.4
			}
		},
		acceleration = {},
		cld_box = {
			16,
			16,
			16
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409005] = {
		hit_sfx = "battle/hit",
		range_offset = 0,
		modle_ID = "jianqi_blue",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3409005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissBig",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1.4
			},
			{
				2,
				1.4
			},
			{
				2,
				1.4
			}
		},
		acceleration = {},
		cld_box = {
			4,
			1,
			8
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3409006,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3409006
				},
				{
					bullet_ID = 3409007,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3409007
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 2
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3409010,
					barrage_ID = 3409010,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3409011,
					barrage_ID = 3409010,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3409012,
					barrage_ID = 3409011,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409013,
					barrage_ID = 3409012,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409014,
					barrage_ID = 3409013,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409015,
					barrage_ID = 3409014,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409016,
					barrage_ID = 3409015,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3409012,
					barrage_ID = 3409015,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409013,
					barrage_ID = 3409014,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409014,
					barrage_ID = 3409013,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409015,
					barrage_ID = 3409012,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409016,
					barrage_ID = 3409011,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kedouzidan_cyan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 80,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kedouzidan_cyan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 80,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kedouzidan_cyan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 80,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kedouzidan_cyan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 80,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kedouzidan_cyan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 80,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409017] = {
		hit_sfx = "battle/hit",
		range_offset = 0,
		modle_ID = "jianqi_blue",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3409017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissBig",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1.4
			},
			{
				2,
				1.4
			},
			{
				2,
				1.4
			}
		},
		acceleration = {},
		cld_box = {
			4,
			1,
			8
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3409019,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409020,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409021,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409022,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409023,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3409024,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409024] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet2_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.2,
				flip = false,
				t = 0
			},
			{
				u = 0.1,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet2_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.2,
				flip = false,
				t = 0
			},
			{
				u = 0.1,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			directHit = true,
			shrapnel = {
				{
					barrage_ID = 3409102,
					bullet_ID = 3409102,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409103,
					bullet_ID = 3409103,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409104,
					bullet_ID = 3409104,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409105,
					bullet_ID = 3409105,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409106,
					bullet_ID = 3409105,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409107,
					bullet_ID = 3409105,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409108,
					bullet_ID = 3409105,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3409109,
					bullet_ID = 3409106,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409102] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 9,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {
			time = 1.3,
			range = 16
		},
		attach_buff = {
			{
				buff_id = 200454,
				effect_id = "AlertArea_looping"
			}
		},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "2B_zhanji_all_enemy",
		effect_type = 1,
		id = 3409103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "2B_zhanji_all_enemy",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409104] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "2B_slash_enemy",
		effect_type = 1,
		id = 3409104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "2B_slash_enemy",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409105] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.1,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1.4
			},
			{
				2,
				1.4
			},
			{
				2,
				1.4
			}
		},
		acceleration = {},
		cld_box = {
			16,
			16,
			16
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409106] = {
		hit_sfx = "battle/hit",
		range_offset = 0,
		modle_ID = "2B_daoguangzidan01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3409106,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissBig",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1.4
			},
			{
				2,
				1.4
			},
			{
				2,
				1.4
			}
		},
		acceleration = {},
		cld_box = {
			4,
			1,
			8
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3409107,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3409110
				},
				{
					bullet_ID = 3409108,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3409111
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409107] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan12",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409107,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409108] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409108,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409109] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "hwxqb_2",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409109,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.05,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409110] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "hwxqb_2",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409110,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.05,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409111] = {
		hit_sfx = "battle/hit",
		range_offset = 0,
		modle_ID = "2B_daoguangzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3409111,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissBig",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1.4
			},
			{
				2,
				1.4
			},
			{
				2,
				1.4
			}
		},
		acceleration = {},
		cld_box = {
			4,
			1,
			8
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409112] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "2B_daoguangzidan02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3409112,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissBig",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1.4
			},
			{
				2,
				1.4
			},
			{
				2,
				1.4
			}
		},
		acceleration = {},
		cld_box = {
			4,
			1,
			8
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409113] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "2B_daoguangzidan03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3409113,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissBig",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				2,
				1.4
			},
			{
				2,
				1.4
			},
			{
				2,
				1.4
			}
		},
		acceleration = {},
		cld_box = {
			4,
			1,
			8
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409114] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu04",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409114,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3409116,
					barrage_ID = 3409118,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409115] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409115,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3409117,
					barrage_ID = 3409119,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409116] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409116,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3409118,
					barrage_ID = 3409120,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409117] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409117,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3409119,
					barrage_ID = 3409120,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409118] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletGER_yellow",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409118,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3409119] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletGER_white",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3409119,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410001] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "yulei_aixin",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "yulei_xiangsuaixin_hit",
		effect_type = 1,
		id = 3410001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3410003,
					barrage_ID = 3410008,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bulletUSA8",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3410006,
					barrage_ID = 3410013,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3410007,
					barrage_ID = 3410013,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan02",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.04,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0.05,
				v = 0.08,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan11",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.04,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0.05,
				v = -0.08,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "kuasheSAP",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet13",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu02",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "TorAlert",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3410012,
					barrage_ID = 3410018,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu09",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "TorAlert",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3410013,
					barrage_ID = 3410018,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.03,
				v = 0,
				flip = false,
				t = 2.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3410013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan11",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3410013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.024,
				v = 0,
				flip = false,
				t = 2.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411002,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411003,
					barrage_ID = 3411003,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411004,
					barrage_ID = 3411004,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411005,
					barrage_ID = 3411005,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411006,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411007,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7.2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411009,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411010,
					barrage_ID = 3411003,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411011,
					barrage_ID = 3411004,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411012,
					barrage_ID = 3411005,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411013,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411014,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7.2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411015] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "yulei_tiwenji",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3411015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.04,
				v = 0,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 25,
		miss_fx = "None",
		pierce_count = 5,
		ammo_type = 2,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 1,
					bullet_ID = 3411022,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3411014,
					bullet_ID = 3411024,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu04",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 25,
		miss_fx = "None",
		pierce_count = 5,
		ammo_type = 2,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 1,
					bullet_ID = 3411023,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3411014,
					bullet_ID = 3411025,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan07",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan07",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411018,
					barrage_ID = 3411012,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411019,
					barrage_ID = 3411013,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu04",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411020,
					barrage_ID = 3411012,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411021,
					barrage_ID = 3411013,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411024] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411018,
					barrage_ID = 3411012,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411019,
					barrage_ID = 3411013,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411020,
					barrage_ID = 3411012,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3411021,
					barrage_ID = 3411013,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411027,
					barrage_ID = 3411017,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411027] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.6,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411028,
					barrage_ID = 3411018,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411028] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411028,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411029] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411029,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411030,
					barrage_ID = 3411017,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411030] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411030,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.6,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3411031,
					barrage_ID = 3411019,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3411031] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3411031,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					rotateOffset = true,
					bullet_ID = 3412002,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 1
				},
				{
					inheritAngle = 1,
					bullet_ID = 3412003,
					barrage_ID = 3412005,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3412003,
					barrage_ID = 3412006,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3412003,
					barrage_ID = 3412007,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3412003,
					barrage_ID = 3412008,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3412003,
					barrage_ID = 3412009,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3412003,
					barrage_ID = 3412010,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu09",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 150,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			3,
			2.7,
			2.4
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_pink",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 150,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun07",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun07",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.7,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun07",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.9,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun07",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun07",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3.3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "chuantoudan_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0.1,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan11",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.15,
				flip = false,
				t = 0.2
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan11",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.15,
				flip = false,
				t = 0.2
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412012] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "yulei_aixin",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "yulei_xiangsuaixin_hit",
		effect_type = 1,
		id = 3412012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3412013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "DoubleBulletUSA_pink",
		type = 1,
		out_bound = 1,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3412013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet05",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					bullet_ID = 3413002,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3223012
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			cldMax = 15,
			scaleSpeed = 3
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					bullet_ID = 3413004,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3223012
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang03",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1.3,
			1.3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			cldMax = 15,
			scaleSpeed = 3
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 5,
		ammo_type = 2,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3413007,
					barrage_ID = 3413009,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu02",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 5,
		ammo_type = 2,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3413008,
					barrage_ID = 3413009,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet05",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413009,
					barrage_ID = 3413010,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413010,
					barrage_ID = 3413011,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 2
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan11",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 2
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413005,
					barrage_ID = 3413005,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3413006,
					barrage_ID = 3413006,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3413005,
					barrage_ID = 3413007,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3413006,
					barrage_ID = 3413008,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "pulimaosizidan",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.5,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					barrage_ID = 3413015,
					bullet_ID = 3413013,
					reaim = true,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "pulimaosizidan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu09",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 5,
		ammo_type = 2,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 3413016,
					bullet_ID = 3413015,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3413018,
					bullet_ID = 3413018,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3413020,
					bullet_ID = 3413020,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3413022,
					barrage_ID = 3413022,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3413022,
					barrage_ID = 3413023,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 5,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413016,
					barrage_ID = 3413017,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 3,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413017,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bulletHuaban",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.01,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 12
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 13
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 10,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413019,
					barrage_ID = 3413019,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 6,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413017,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 14,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413021,
					barrage_ID = 3413021,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 10,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413017,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu09",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 5,
		ammo_type = 2,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3413023,
					barrage_ID = 3413024,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "pulimaosizidan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413024] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3413025,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3413026
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3413027,
					bullet_ID = 3413026,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3413028,
					bullet_ID = 3413027,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "xiaoguanghui_shengguang_small",
		effect_type = 1,
		id = 3413026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "xiaoguanghui_shengguang_small",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3413027] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3413027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 1,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 6,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			15,
			15,
			15
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3414001,
					barrage_ID = 3414001,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3414001,
					barrage_ID = 3414002,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3414001,
					barrage_ID = 3414003,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3414001,
					barrage_ID = 3414004,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3414004,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3414005,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3414006,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			randomLaunchOffsetZ = 10,
			lastTime = 0.01,
			randomLaunchOffsetX = 10,
			shrapnel = {
				{
					barrage_ID = 3414007,
					bullet_ID = 3414007,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -25,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -25,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -25,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -25,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -25,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -40,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -40,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -40,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -40,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -40,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -55,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -55,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -55,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -55,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -55,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414024] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -70,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -70,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -70,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414027] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -70,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414028] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_yaoxiang",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3414028,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.1,
			1,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.15,
			targetFixX = -70,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414029] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414029,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			2,
			2,
			2
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414030] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414030,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414031] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414031,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					rotateOffset = true,
					bullet_ID = 3414032,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3414012
				},
				{
					rotateOffset = true,
					bullet_ID = 3414032,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3414013
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414032] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414032,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				2,
				0.8
			},
			{
				2,
				1.2
			},
			{
				2,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414033] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414033,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.1,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3414037,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 3414014
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414034] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414034,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.1,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3414038,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 3414015
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414035] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414035,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.1,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3414037,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 3414014
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414036] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414036,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.1,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 3
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3414038,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 3414015
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414037] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414037,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414038] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414038,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414039] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3414039,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 130,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 1,
			randomLaunchOffsetZ = 40
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414040] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanlaser_blue_short",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jiguang_shouji",
		effect_type = 1,
		id = 3414040,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3414041] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanlaser_short",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jiguang_shouji",
		effect_type = 1,
		id = 3414041,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			2,
			2,
			2
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3.2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "huali_zidan",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.8,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					barrage_ID = 1,
					bullet_ID = 3415004,
					reaim = true,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "huali_zidan",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3415006,
					barrage_ID = 3415005,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 16,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3.2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.5,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3415007,
					barrage_ID = 3415006,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415008,
					barrage_ID = 3415007,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan11",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			randomLaunchOffsetZ = 16,
			lastTime = 0.01,
			randomLaunchOffsetX = 8,
			shrapnel = {
				{
					barrage_ID = 3415009,
					bullet_ID = 3415010,
					reaim = true,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "chuantoudan_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu09",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "TorAlert",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreShield = true,
			shrapnel = {
				{
					bullet_ID = 3415012,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3415011
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415012] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "yulei_aixin_low",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "yulei_xiangsuaixin_hit",
		effect_type = 1,
		id = 3415012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 0.5,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.03,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3415017,
					barrage_ID = 3415016,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3415017,
					barrage_ID = 3415017,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3415017,
					barrage_ID = 3415016,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3415017,
					barrage_ID = 3415017,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3415019,
					barrage_ID = 3415022,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 60,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3415020,
					barrage_ID = 3415023,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "xiafei_baiseyumao",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.08,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3415022,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415022,
					barrage_ID = 3415025,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415022,
					barrage_ID = 3415026,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3415023,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415024,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415025,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415026,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415027,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415028,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415029,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415030,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415031,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3415032,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415024] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3.8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415027] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415028] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415028,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415029] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415029,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7.8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415030] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415030,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8.6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415031] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415031,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9.4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415032] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3415032,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10.2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415033] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "yulei_aixin_low",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "yulei_xiangsuaixin_hit",
		effect_type = 1,
		id = 3415033,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.1,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			},
			{
				u = -0.03,
				v = 0,
				flip = false,
				t = 2.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.8
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3415034] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "yulei_aixin_low",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "yulei_xiangsuaixin_hit",
		effect_type = 1,
		id = 3415034,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.1,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			},
			{
				u = -0.03,
				v = 0,
				flip = false,
				t = 2.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.8
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3416001] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "zidan_niunaiping",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3416001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 4,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420002,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420003,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420004,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420005,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420006,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420007,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420008,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				XID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420011,
					barrage_ID = 3230205,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420012,
					barrage_ID = 3230205,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3420014,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3239038
				},
				{
					initialSplit = true,
					bullet_ID = 3420014,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3239039
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420016,
					barrage_ID = 3230220,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420016,
					barrage_ID = 3230221,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan12",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 1
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420102] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420104] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420105] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420106] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420106,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420107] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420107,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420108] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420108,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420109] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420109,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420110] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu07",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420110,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420111] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420111,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420112,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420113,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420114,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420115,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420116,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420112] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420112,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420113] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420113,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420114] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420114,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420115] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420115,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420116] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420116,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420117] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420117,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420118,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420119,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420120,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420121,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420122,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420118] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "mofazidan06_nt",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420118,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420119] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "mofazidan06_nt",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420119,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420120] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "mofazidan06_nt",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420120,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420121] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "mofazidan06_nt",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420121,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420122] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "mofazidan06_nt",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420122,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420123] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet14",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3420123,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 12,
		damage_type = {
			1,
			1.1,
			1.2
		},
		DMG_font = {
			{
				4,
				0.7
			},
			{
				2,
				1.3
			},
			{
				2,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 10
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.1,
			randomOffsetX = 32,
			randomOffsetZ = 32,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420124] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3420124,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 12,
		damage_type = {
			1.35,
			0.95,
			0.7
		},
		DMG_font = {
			{
				4,
				0.7
			},
			{
				2,
				1.3
			},
			{
				2,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 10
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.1,
			randomOffsetX = 32,
			randomOffsetZ = 32,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420125] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420125,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420126,
					barrage_ID = 3239020,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420127,
					barrage_ID = 3239021,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420126] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan08",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420126,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420127] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan08",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420127,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420128] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420128,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420129,
					barrage_ID = 3159052,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420129] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420129,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420130] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420130,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420131,
					barrage_ID = 3159055,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420131] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_green",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420131,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420201] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420201,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420202,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420203,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420204,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420205,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420206,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420207,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420202] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420202,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420203] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420203,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420204] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420204,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420205] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420205,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420206] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420206,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420207] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420207,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420208] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420208,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420209,
					barrage_ID = 350201,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420210,
					barrage_ID = 350202,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420211,
					barrage_ID = 350203,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420212,
					barrage_ID = 350204,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420213,
					barrage_ID = 350205,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420214,
					barrage_ID = 350206,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420215,
					barrage_ID = 350207,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420216,
					barrage_ID = 350208,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420217,
					barrage_ID = 350209,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420218,
					barrage_ID = 350210,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420209] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420209,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420210] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420210,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420211] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420211,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420212] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420212,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420213] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420213,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420214] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420214,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420215] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420215,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420216] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420216,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420217] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420217,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420218] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420218,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420219] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420219,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 3391102,
					bullet_ID = 3420220,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420221,
					barrage_ID = 3391103,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420220] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang08",
		type = 15,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420220,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420221] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black_small",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420221,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420222] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420222,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420223,
					barrage_ID = 3391105,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420223,
					barrage_ID = 3391106,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420223,
					barrage_ID = 3391107,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420223] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black_small",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420223,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420224] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 4,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420224,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 3,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420225,
					barrage_ID = 3320207,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420225] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420225,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420226,
					barrage_ID = 3320208,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420227,
					barrage_ID = 3320209,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420228,
					barrage_ID = 3320210,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420226] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420226,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420227] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420227,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420228] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420228,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420229] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420229,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420230,
					barrage_ID = 3320212,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420231,
					barrage_ID = 3320214,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420230] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420230,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			3,
			2.7,
			2.4
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420231] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420231,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3420232,
					barrage_ID = 3320213,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3420233,
					barrage_ID = 3320213,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420232] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black_small",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420232,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3420233] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black_small",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3420233,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421001] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "sairenyulei_shadow",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3421001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 3,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421002] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "sairenyulei_shadow",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3421002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 2.5,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421003] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "sairenyulei_shadow",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3421003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 4,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			tracker = {
				angular = 1.6,
				range = 36
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.25,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.3
			},
			{
				u = 0.1,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 1,
			shrapnel = {
				{
					barrage_ID = 3421022,
					bullet_ID = 3421018,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3421022,
					bullet_ID = 3421019,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.03,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.03,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421020] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "sairenyulei_shadow",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3421020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissRedFire",
		effect_type = 1,
		id = 3421101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissRedFire",
		pierce_count = 0,
		ammo_type = 3,
		alert_fx = "AlertArea",
		velocity = 10,
		damage_type = {
			1.35,
			0.95,
			0.7
		},
		DMG_font = {
			{
				4,
				0.7
			},
			{
				2,
				1.3
			},
			{
				2,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 10
		},
		attach_buff = {
			{
				rant = 3000,
				buff_id = 311,
				group_level = 1
			}
		},
		extra_param = {
			gravity = -0.1,
			randomOffsetX = 32,
			randomOffsetZ = 32,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421102] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421104] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 18,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421105] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 18,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421201] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421201,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.2,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.6
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421202] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421202,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.2,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.6
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421203] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421203,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421204] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421204,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421205] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421205,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.15,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421206] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421206,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.15,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421207] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421207,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421208] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421208,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421209] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421209,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 18,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3421210] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3421210,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3421207,
					barrage_ID = 3421211,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3421208,
					barrage_ID = 3421212,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 2.5,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425007,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 2,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425007,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 1.5,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425007,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 1,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425007,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.5,
			ignoreShield = true,
			fragile = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425007,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425001,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425002,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425003,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425004,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425005,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425006,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425008,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425001,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425002,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425003,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425004,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425005,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425006,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425009,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425001,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425002,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425003,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425004,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425005,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425006,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425010,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425001,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425002,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425003,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425004,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425005,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425006,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425011,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425001,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425002,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425003,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425004,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425005,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425006,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425012,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3425109,
					bullet_ID = 3425019,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 10,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 5,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425029,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425021,
					barrage_ID = 3425110,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 10,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 5,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425030,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					rotateOffset = true,
					bullet_ID = 3425023,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425115
				},
				{
					rotateOffset = true,
					bullet_ID = 3425023,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425116
				},
				{
					rotateOffset = true,
					bullet_ID = 3425023,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425117
				},
				{
					rotateOffset = true,
					bullet_ID = 3425023,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425118
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425024,
					barrage_ID = 3425119,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3425025,
					barrage_ID = 3425120,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425024] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bulletGER",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 3425027,
					rotateOffset = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 1
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425028,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425123
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425028,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425124
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425028,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425125
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425028,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425126
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425028,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425127
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425028,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425128
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425027] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			3,
			3,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425028] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425028,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425029] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425029,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425030] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425030,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425035] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425035,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425037,
					barrage_ID = 3425138,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425036] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425036,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425038,
					barrage_ID = 3425138,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425037] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425037,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.06,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425038] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425038,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.06,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425102] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425104] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425105] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425106] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425106,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425107] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425107,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425108] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425108,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			fragile = 1,
			lastTime = 2.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425107,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425109] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425109,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			fragile = 1,
			lastTime = 2,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425107,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425110] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425110,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			fragile = 1,
			lastTime = 1.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425107,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425111] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425111,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			fragile = 1,
			lastTime = 1,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425107,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425112] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425112,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			2,
			2.6,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			fragile = 1,
			lastTime = 0.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425107,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425113] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425113,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425101,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425102,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425103,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425104,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425105,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425106,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425108,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425114] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425114,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425101,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425102,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425103,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425104,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425105,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425106,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425109,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425115] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425115,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425101,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425102,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425103,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425104,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425105,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425106,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425110,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425116] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425116,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425101,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425102,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425103,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425104,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425105,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425106,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425111,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425117] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425117,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			lastTime = 0.01,
			velocity_offsetF = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3425101,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425102,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425103,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425104,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425105,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425106,
					barrage_ID = 3425101,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				{
					initialSplit = true,
					bullet_ID = 3425112,
					barrage_ID = 3425102,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425118] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425118,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3425109,
					bullet_ID = 3425119,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425119] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425119,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425120] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425120,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425121,
					barrage_ID = 3425110,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425121] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425121,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425122] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425122,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					rotateOffset = true,
					bullet_ID = 3425123,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425115
				},
				{
					rotateOffset = true,
					bullet_ID = 3425123,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425116
				},
				{
					rotateOffset = true,
					bullet_ID = 3425123,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425117
				},
				{
					rotateOffset = true,
					bullet_ID = 3425123,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425118
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425123] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425123,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425124,
					barrage_ID = 3425119,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3425125,
					barrage_ID = 3425120,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425124] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bulletGER",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425124,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425125] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425125,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425126] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425126,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 3425127,
					rotateOffset = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 1
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425128,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425123
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425128,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425124
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425128,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425125
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425128,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425126
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425128,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425127
				},
				{
					inheritSpeed = 1,
					bullet_ID = 3425128,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425128
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425127] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425127,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			3,
			3,
			3
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425128] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_red",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425128,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425129] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425129,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 3425132,
					bullet_ID = 3425132,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425130] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425130,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 3425133,
					bullet_ID = 3425132,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425131] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425131,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 3425134,
					bullet_ID = 3425132,
					emitterType = "BattleBulletEmitter",
					reaim = {
						"TargetEnemyLeaderShip"
					}
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425132] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425132,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 15,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3425133,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3425135
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425133] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "AlertArea_looping",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425133,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 1.5,
			shrapnel = {
				{
					barrage_ID = 1,
					bullet_ID = 3425134,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425134] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "bisimai_jiguang",
		effect_type = 1,
		id = 3425134,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.1,
		miss_fx = "bisimai_jiguang",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "AlertArea",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1.2
			},
			{
				1,
				1.2
			},
			{
				1,
				1.2
			}
		},
		acceleration = {},
		cld_box = {
			9,
			9,
			9
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425135] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425135,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425137,
					barrage_ID = 3425138,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425136] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425136,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3425138,
					barrage_ID = 3425138,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425137] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425137,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.06,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3425138] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3425138,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1.3,
			1.5
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.06,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 9.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 11,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3426007,
					barrage_ID = 3218001,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426007,
					barrage_ID = 3218002,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426007] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "paodan_huoqiu_middle",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "paodan_huoqiu_hit",
		effect_type = 1,
		id = 3426007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 4,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			3,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.3,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.3
			},
			{
				u = -0.3,
				v = 0,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					rotateOffset = true,
					bullet_ID = 3426010,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218005
				},
				{
					rotateOffset = true,
					bullet_ID = 3426010,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218006
				},
				{
					rotateOffset = true,
					bullet_ID = 3426010,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218007
				},
				{
					rotateOffset = true,
					bullet_ID = 3426010,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218008
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426012] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "shenyuanlaser_blue",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "shenyuanjiguang_shouji",
		effect_type = 1,
		id = 3426012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426014] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426015] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 7,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			2,
			1.8,
			1.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3426023,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218014
				},
				{
					initialSplit = true,
					bullet_ID = 730154,
					barrage_ID = 730221,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan12",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426024] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "shenyuanbullet19",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3426024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 3,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3426026,
					barrage_ID = 3218017,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426026,
					barrage_ID = 3218018,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426027,
					barrage_ID = 3218019,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426027,
					barrage_ID = 3218020,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426027,
					barrage_ID = 3218021,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet14",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426027] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shenyuanbullet14",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			6,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426028] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426028,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3426029,
					barrage_ID = 3218022,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426030,
					barrage_ID = 3218022,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426031,
					barrage_ID = 3218022,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426029] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426029,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426030] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426030,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426031] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426031,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426032] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3426032,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 16,
			targetOffsetZ = 0,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426033] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3426033,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = -16,
			targetOffsetZ = 0,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426034] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3426034,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = 16,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426035] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3426035,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = -16,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426036] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3426036,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 8,
			targetOffsetZ = 0,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426037] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3426037,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = -8,
			targetOffsetZ = 0,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426038] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3426038,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = 8,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426039] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3426039,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			targetOffsetX = 0,
			targetOffsetZ = -8,
			gravity = -0.03,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426040] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissGreenFire",
		effect_type = 1,
		id = 3426040,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "ShellMissGreenFire",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 15,
		damage_type = {
			1,
			1.3,
			1.1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				0.9
			},
			{
				3,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 15
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			randomOffsetX = 16,
			randomOffsetZ = 16,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426041] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426041,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426042] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426042,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426043] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426043,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3426041,
					barrage_ID = 3218030,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426042,
					barrage_ID = 3218031,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426044] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426044,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					rotateOffset = true,
					bullet_ID = 3426043,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218032
				},
				{
					rotateOffset = true,
					bullet_ID = 3426043,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218033
				},
				{
					rotateOffset = true,
					bullet_ID = 3426043,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218034
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426045] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black_small",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426045,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			velocity_offsetF = 1.5,
			fragile = 1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3426046,
					reaim = 1,
					emitterType = "BattleBulletEmitter",
					barrage_ID = 3218055
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426046] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black_small",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426046,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426047] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426047,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426048] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_black_middle",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 3426048,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 6,
		alert_fx = "AlertArea",
		velocity = 0,
		damage_type = {
			0.8,
			0.9,
			1.1
		},
		DMG_font = {
			{
				3,
				0.9
			},
			{
				3,
				1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			targetOffsetX = -1,
			airdrop = true,
			randomOffsetX = 12,
			offsetY = 70,
			launchVrtSpeed = -4,
			randomOffsetZ = 12,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426049] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426049,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3426050,
					barrage_ID = 3218059,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426050] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "paodan_huoqiu_small",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426050,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426051] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426051,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					barrage_ID = 3396003,
					bullet_ID = 3426052,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426053,
					barrage_ID = 3396004,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426052] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang07",
		type = 15,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426052,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426053] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426053,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426054] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu08",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426054,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 15,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			lastTime = 0.01,
			ignoreB = true,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3426055,
					barrage_ID = 3396006,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426055,
					barrage_ID = 3396007,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3426055,
					barrage_ID = 3396008,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426055] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan12",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426055,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426056] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 20,
		modle_ID = "shenyuanbullet19",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3426056,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 4,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426057] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bomberbombblack",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMissBig",
		effect_type = 1,
		id = 3426057,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 6,
		alert_fx = "AlertArea",
		velocity = 0,
		damage_type = {
			0.8,
			0.9,
			1.1
		},
		DMG_font = {
			{
				3,
				0.9
			},
			{
				3,
				1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			offsetY = 70,
			launchVrtSpeed = -4,
			targetOffsetX = -1,
			airdrop = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426058] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426058,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426059] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shikongxuanwo_danmu",
		type = 5,
		out_bound = 4,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426059,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 3,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.2
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3426002,
					bullet_ID = 3426060,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 1,
					bullet_ID = 3426061,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426060] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426060,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426061] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426061,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3426062,
					barrage_ID = 3426004,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3426062] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3426062,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427001] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "yuekecheng_huaban",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHitSmall",
		effect_type = 1,
		id = 3427001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "None",
		pierce_count = 1,
		ammo_type = 6,
		alert_fx = "",
		velocity = 0.3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.001,
			targetOffsetZ = 3,
			dropOffset = true,
			targetOffsetX = 5,
			randomOffsetX = 15,
			randomOffsetZ = 15,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427002] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "yuekecheng_huaban",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHitSmall",
		effect_type = 1,
		id = 3427002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "None",
		pierce_count = 1,
		ammo_type = 6,
		alert_fx = "",
		velocity = 0.3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.001,
			targetOffsetZ = -3,
			dropOffset = true,
			targetOffsetX = 5,
			randomOffsetX = 15,
			randomOffsetZ = 15,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427003] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "yuekecheng_huaban",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHitSmall",
		effect_type = 1,
		id = 3427003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "None",
		pierce_count = 1,
		ammo_type = 6,
		alert_fx = "",
		velocity = 0.3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.001,
			targetOffsetZ = 25,
			dropOffset = true,
			targetOffsetX = 5,
			randomOffsetX = 15,
			randomOffsetZ = 15,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427004] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "yuekecheng_huaban",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHitSmall",
		effect_type = 1,
		id = 3427004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "None",
		pierce_count = 1,
		ammo_type = 6,
		alert_fx = "",
		velocity = 0.3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.001,
			targetOffsetZ = -25,
			dropOffset = true,
			targetOffsetX = 5,
			randomOffsetX = 15,
			randomOffsetZ = 15,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427005] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "yuekecheng_huaban",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHitSmall",
		effect_type = 1,
		id = 3427005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "None",
		pierce_count = 1,
		ammo_type = 6,
		alert_fx = "",
		velocity = 0.3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.001,
			targetOffsetZ = 31,
			dropOffset = true,
			targetOffsetX = 5,
			randomOffsetX = 15,
			randomOffsetZ = 15,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427006] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "yuekecheng_huaban",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHitSmall",
		effect_type = 1,
		id = 3427006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "None",
		pierce_count = 1,
		ammo_type = 6,
		alert_fx = "",
		velocity = 0.3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 6
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.001,
			targetOffsetZ = -31,
			dropOffset = true,
			targetOffsetX = 5,
			randomOffsetX = 15,
			randomOffsetZ = 15,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3427007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3427008,
					barrage_ID = 3427002,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "zidan_yuekecheng_huaduo",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3427008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.02,
				v = 0,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3427101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3427103,
					barrage_ID = 3427101,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427102] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3427102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3427104,
					barrage_ID = 3427101,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3427103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.06,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427104] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heiqiye04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3427104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.06,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3427105] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet3_faxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3427105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 120,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 9,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1
			},
			{
				3,
				0.9
			}
		},
		acceleration = {
			{
				u = -0.05,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0.1,
				v = 0,
				flip = false,
				t = 1.5
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2.2
			}
		},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "daofengbullet1",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 12,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429102] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "dianciyulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3429102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3429104,
					barrage_ID = 3429110,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429104] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "dianciyulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3429104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429105] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bailong_zhanji",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "CAHit",
		effect_type = 1,
		id = 3429105,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMiss",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 13,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				2,
				1.2
			},
			{
				2,
				1.2
			},
			{
				2,
				1.2
			}
		},
		acceleration = {},
		cld_box = {
			4,
			1,
			8
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429106] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429106,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3429107,
					barrage_ID = 3429115,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429107] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bailong_zhanji",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "CAHit",
		effect_type = 1,
		id = 3429107,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "ShellMiss",
		pierce_count = 50,
		ammo_type = 2,
		alert_fx = "",
		velocity = 13,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				2,
				1.2
			},
			{
				2,
				1.2
			},
			{
				2,
				1.2
			}
		},
		acceleration = {},
		cld_box = {
			2,
			1,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429301] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429301,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 3429302,
					barrage_ID = 3429301,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3429303,
					barrage_ID = 3429302,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3429302,
					barrage_ID = 3429303,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 3429303,
					barrage_ID = 3429304,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429302] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shuidizidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429302,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429303] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shuidizidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429303,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429304] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu04",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429304,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			2,
			2,
			2
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 3429308,
					bullet_ID = 3429305,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3429309,
					bullet_ID = 3429306,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3429310,
					bullet_ID = 3429305,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3429311,
					bullet_ID = 3429306,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 3429312,
					bullet_ID = 3429305,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429305] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "ouxiang_huang",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429305,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429306] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429306,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429307] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "dianciyulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 3429307,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429308] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shachenbao_zidan",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429308,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 4,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = -0.0075,
				v = -0.15,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = -0.15,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = -0.03,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			dontRotate = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429309] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "shachenbao_zidan",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429309,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 4,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {
			{
				u = -0.0075,
				v = 0.15,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = 0.15,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = 0.03,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			dontRotate = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429310] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429310,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			2,
			2,
			2
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.0075,
				v = -0.15,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = -0.15,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = -0.03,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3429312,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 3429317
				},
				{
					bullet_ID = 3429313,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 3429318
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429311] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429311,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			2,
			2,
			2
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.0075,
				v = 0.15,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = 0.15,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = 0.03,
				flip = false,
				t = 2.5
			}
		},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 3429312,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 3429317
				},
				{
					bullet_ID = 3429313,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 3429318
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429312] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429312,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429313] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429313,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429314] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Hwxqb_2",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429314,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.05,
				v = 0,
				flip = false,
				t = 0.8
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429315] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429315,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				2,
				1.2
			},
			{
				2,
				1.2
			},
			{
				2,
				1.2
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.1,
			shrapnel = {
				{
					initialSplit = true,
					bullet_ID = 3345148,
					barrage_ID = 3429322,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429316] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletUSA2_low",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429316,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			0.8,
			0.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429317] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletUSA2_low",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 3429317,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.8,
			0.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[3429318] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "paodan_baopodan",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 3429318,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 6,
		alert_fx = "AlertArea",
		velocity = 0,
		damage_type = {
			0.8,
			1,
			1.2
		},
		DMG_font = {
			{
				3,
				0.9
			},
			{
				3,
				1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 9
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			offsetY = 70,
			launchVrtSpeed = -4,
			targetOffsetX = -1,
			airdrop = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665001] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			directHit = true,
			shrapnel = {
				{
					barrage_ID = 29665001,
					bullet_ID = 29665003,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 29665002,
					bullet_ID = 29665004,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665002] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 29665001,
					bullet_ID = 29665003,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 29665002,
					bullet_ID = 29665004,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665003] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 9,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {
			time = 5,
			range = 16
		},
		attach_buff = {
			{
				friendly = false,
				buff_id = 201785,
				effect_id = "bulisituoer_alter_lamp"
			}
		},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665004] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 9,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {
			time = 1.3,
			range = 16
		},
		attach_buff = {
			{
				buff_id = 200454,
				effect_id = "AlertArea_looping"
			}
		},
		extra_param = {
			ignoreB = true,
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665005] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29665006,
					barrage_ID = 29665006,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29665007,
					barrage_ID = 29665007,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665006] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			2,
			1.8,
			1.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665007] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "newbullet3",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665008] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie06",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.01,
				v = 0.2,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665009,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 29665010
				},
				{
					bullet_ID = 29665010,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 29665011
				},
				{
					bullet_ID = 730154,
					initialSplit = true,
					barrage_ID = 730221,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665009] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.01,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0
			},
			{
				{
					u = 0,
					v = 0,
					flip = false,
					t = 2.5
				},
				u = 0.01,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665010] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.01,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0
			},
			{
				{
					u = 0,
					v = 0,
					flip = false,
					t = 2.5
				},
				u = 0.01,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665011] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie05",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.01,
				v = -0.2,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 5
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665012,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 29665010
				},
				{
					bullet_ID = 29665013,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 2,
					barrage_ID = 29665011
				},
				{
					bullet_ID = 730154,
					initialSplit = true,
					barrage_ID = 730221,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665012] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.01,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0
			},
			{
				{
					u = 0,
					v = 0,
					flip = false,
					t = 2.5
				},
				u = 0.01,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665013] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_jianzhui04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.01,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0
			},
			{
				{
					u = 0,
					v = 0,
					flip = false,
					t = 2.5
				},
				u = 0.01,
				v = 0,
				flip = false,
				t = 1.5
			}
		},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665014] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "dianciyulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 29665014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 4,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665015] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "dianciyulei",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "TorpedoHit3",
		effect_type = 1,
		id = 29665015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "",
		pierce_count = 0,
		ammo_type = 4,
		alert_fx = "TorAlert",
		velocity = 3,
		damage_type = {
			0.8,
			1,
			1.3
		},
		DMG_font = {
			{
				3,
				0.8
			},
			{
				3,
				1
			},
			{
				3,
				1.3
			}
		},
		acceleration = {},
		cld_box = {
			1.8,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 3
		},
		attach_buff = {},
		extra_param = {
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665016] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29665017,
					barrage_ID = 29665015,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29665018,
					barrage_ID = 29665016,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665017] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665019,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665017
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665018] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665019,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665018
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665019] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29665002,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29665020,
					barrage_ID = 29665019,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29665021,
					barrage_ID = 29665019,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665020] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			velocity_offsetF = 1,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 29665022,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665020
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665021] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 3,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			velocity_offsetF = 1,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 29665023,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665021
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665022] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665023] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan09",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665024] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "shenyuanlaser_blue",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jiguang_shouji",
		effect_type = 1,
		id = 29665024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 7,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665025] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie01",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			fragile = 1,
			randomLaunchOffsetZ = 36,
			lastTime = 0.5,
			randomLaunchOffsetX = 8,
			velocity_offsetF = 1,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 29665026,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665034
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665026] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665027] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie02",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			fragile = 1,
			randomLaunchOffsetZ = 36,
			lastTime = 0.5,
			randomLaunchOffsetX = 8,
			velocity_offsetF = 1,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 29665028,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665034
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665028] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665028,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665029] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie03",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665029,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			fragile = 1,
			randomLaunchOffsetZ = 36,
			lastTime = 0.5,
			randomLaunchOffsetX = 8,
			velocity_offsetF = 1,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 29665030,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665034
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665030] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665030,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665031] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie04",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665031,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			fragile = 1,
			randomLaunchOffsetZ = 36,
			lastTime = 0.5,
			randomLaunchOffsetX = 8,
			velocity_offsetF = 1,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 29665032,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665034
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665032] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie04",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665032,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665033] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie05",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665033,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			fragile = 1,
			randomLaunchOffsetZ = 36,
			lastTime = 0.5,
			randomLaunchOffsetX = 8,
			velocity_offsetF = 1,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 29665034,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665034
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665034] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665034,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665035] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie06",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665035,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			fragile = 1,
			randomLaunchOffsetZ = 36,
			lastTime = 0.5,
			randomLaunchOffsetX = 8,
			velocity_offsetF = 1,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 29665036,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665034
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665036] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665036,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665037] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie08",
		type = 5,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665037,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			fragile = 1,
			randomLaunchOffsetZ = 36,
			lastTime = 0.5,
			randomLaunchOffsetX = 8,
			velocity_offsetF = 1,
			shrapnel = {
				{
					inheritSpeed = 1,
					bullet_ID = 29665038,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665034
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665038] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie08",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665038,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665039] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665039,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			randomLaunchOffsetZ = 8,
			lastTime = 0.01,
			randomLaunchOffsetX = 6,
			shrapnel = {
				{
					barrage_ID = 29665044,
					bullet_ID = 29665040,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 29665045,
					bullet_ID = 29665041,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 29665046,
					bullet_ID = 29665042,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 29665047,
					bullet_ID = 29665043,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 29665048,
					bullet_ID = 29665044,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 29665049,
					bullet_ID = 29665045,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					barrage_ID = 29665050,
					bullet_ID = 29665046,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665040] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu01",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665040,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665041] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu05",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665041,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665042] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu04",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665042,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665043] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu07",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665043,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665044] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu06",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665044,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665045] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu03",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665045,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665046] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu09",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665046,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665047] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665047,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.046,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665048,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665051
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665048] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletUSA2_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665048,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665049] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie03",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665049,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.046,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665050,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665051
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665050] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletUSA_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665050,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665051] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie04",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665051,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.046,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665052,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665051
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665052] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletUSA3_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665052,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665053] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie05",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665053,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.046,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665054,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665051
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665054] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletUSA4_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665054,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665055] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie06",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665055,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.046,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665056,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665051
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665056] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletUSA7_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665056,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665057] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_feie08",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665057,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.046,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665058,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665051
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665058] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "BulletUSA5_big",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665058,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665059] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun03",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665059,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665060] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665060,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665061] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665061,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665062] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun06",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665062,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665063] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun05",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665063,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665064] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_guanglun07",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665064,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			4,
			4,
			4
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665065] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665065,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665067,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665066
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665066] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665066,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 6,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29665067,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29665067
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665067] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665067,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29665002,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29665068,
					barrage_ID = 29665068,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665068] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan_random",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29665068,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 1
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29665069] = {
		hit_sfx = "",
		range_offset = 20,
		modle_ID = "yurenjie_laser01",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jiguang_shouji",
		effect_type = 1,
		id = 29665069,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666001] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666001,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -10,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666002] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666002,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -10,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666003] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666003,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -10,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666004] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666004,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -10,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666005] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666005,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -10,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666006] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666006,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -21,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666007] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666007,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -21,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666008] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666008,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -21,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666009] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666009,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -21,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666010] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666010,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -21,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666011] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666011,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -32,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666012] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666012,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -32,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666013] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666013,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -32,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666014] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666014,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -32,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666015] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666015,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -32,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666016] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666016,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -43,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666017] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666017,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -43,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666018] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666018,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -43,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666019] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666019,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -43,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666020] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666020,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -43,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666021] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666021,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -54,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666022] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666022,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -54,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666023] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666023,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -54,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666024] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666024,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -54,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666025] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666025,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -54,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666026] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666026,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -65,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666027] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666027,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -65,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666028] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666028,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -65,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666029] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666029,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -65,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666030] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan04",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666030,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -65,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666031] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666031,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -76,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666032] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666032,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -76,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666033] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666033,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -76,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666034] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666034,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -76,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666035] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666035,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -76,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666036] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666036,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666037,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666038,
					barrage_ID = 29666008,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666038,
					barrage_ID = 29666009,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666038,
					barrage_ID = 29666010,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666038,
					barrage_ID = 29666011,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666037] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_blue",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666037,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666038] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet07",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666038,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666039] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666039,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666040,
					barrage_ID = 1,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666041,
					barrage_ID = 29666008,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666041,
					barrage_ID = 29666009,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666041,
					barrage_ID = 29666010,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666041,
					barrage_ID = 29666011,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666040] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "heifangzhou_zhongyu_cyan",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666040,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666041] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet06",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666041,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666042] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu09",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666042,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					barrage_ID = 1,
					bullet_ID = 29666043,
					reaim = 1,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666043] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "bullet_dayu09",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666043,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666044,
					barrage_ID = 29666016,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666045,
					barrage_ID = 29666017,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666044] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "Bullet_maoxi",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666044,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666045] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan11",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666045,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666046] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666046,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -87,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666047] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666047,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -87,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666048] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666048,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -87,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666049] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666049,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -87,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666050] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666050,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -98,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666051] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666051,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -98,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666052] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666052,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -98,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666053] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666053,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -98,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666054] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666054,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -98,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666055] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666055,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -109,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666056] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666056,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -109,
			targetFixZ = 80,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666057] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666057,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -109,
			targetFixZ = 65,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666058] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666058,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -109,
			targetFixZ = 50,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666059] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666059,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -109,
			targetFixZ = 35,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666060] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "lanhuopaodan03",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 29666060,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellMissBig",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "AlertArea",
		velocity = 18,
		damage_type = {
			0.9,
			1.2,
			1.5
		},
		DMG_font = {
			{
				3,
				1.4
			},
			{
				3,
				1.1
			},
			{
				3,
				1.1
			}
		},
		acceleration = {},
		cld_box = {
			5,
			2,
			2
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {
			time = -1,
			range = 12
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.8,
			ignoreShield = true,
			ignoreB = true,
			targetFixX = -109,
			targetFixZ = 20,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666061] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "ouxiang_fense",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666061,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 4,
		damage_type = {
			2,
			1.8,
			1.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			3,
			3,
			3
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					bullet_ID = 29666062,
					initialSplit = true,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 29666029
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666062] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666062,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666063,
					barrage_ID = 29666030,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666065,
					barrage_ID = 29666030,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666063] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "ouxiang_dayu_xinxin",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666063,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666064] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "hololive_xingxingzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666064,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = -0.08,
				v = 0,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 0.5
			},
			{
				u = 0.06,
				v = 0,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666065] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666065,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			velocity_offsetF = 0.5
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666066] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666066,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666067,
					barrage_ID = 29666037,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666067,
					barrage_ID = 29666038,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666067] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666067,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			0.1,
			0.1,
			0.1
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666068,
					barrage_ID = 29666039,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666069,
					barrage_ID = 29666040,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666068] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "music_yinfuzidan07_small",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666068,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 3,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = 0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666069] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "music_yinfuzidan07_small",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666069,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 3,
		ammo_type = 1,
		alert_fx = "",
		velocity = 8,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0,
				v = -0.27,
				flip = false,
				t = 0
			},
			{
				u = 0,
				v = 0.27,
				flip = false,
				t = 0.5
			},
			{
				u = 0,
				v = -0.5,
				flip = false,
				t = 1
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1.2
			}
		},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666070] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "music_genzong1",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666070,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 3,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			1,
			0.9,
			0.8
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {
			{
				u = 0.03,
				v = 0,
				flip = false,
				t = 0.3
			},
			{
				u = 0,
				v = 0,
				flip = false,
				t = 1
			}
		},
		cld_box = {
			7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666071] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "music_yinfuzidan01",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666071,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			2,
			1.8,
			1.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666072] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "music_yinfuzidan02",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666072,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 2.5,
		damage_type = {
			2,
			1.8,
			1.6
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666073] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "ouxiang_huangse_laser01",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jiguang_shouji_yellow",
		effect_type = 1,
		id = 29666073,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 7,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666074] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "ouxiang_lanse_laser01",
		type = 10,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "jiguang_shouji",
		effect_type = 1,
		id = 29666074,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 7,
		alert_fx = "",
		velocity = 1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.7,
			1.7,
			1.7
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			mainFilter = true,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666075] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666075,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666076,
					barrage_ID = 29666066,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666076] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666076,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 0.01,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666077,
					barrage_ID = 29666069,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666081,
					barrage_ID = 29666070,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666085,
					barrage_ID = 29666071,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666089,
					barrage_ID = 29666072,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666093,
					barrage_ID = 29666073,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666097,
					barrage_ID = 29666074,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666101,
					barrage_ID = 29666075,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666077] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666077,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666078,
					barrage_ID = 29666067,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666078] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet05",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666078,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666079,
					barrage_ID = 29666068,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666080,
					barrage_ID = 29666082,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666079] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan05",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666079,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666080] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang05",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666080,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666081] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666081,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666082,
					barrage_ID = 29666067,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666082] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet04",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666082,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666083,
					barrage_ID = 29666068,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666084,
					barrage_ID = 29666082,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666083] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan07",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666083,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666084] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang04",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666084,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666085] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666085,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666086,
					barrage_ID = 29666067,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666086] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet03",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666086,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666087,
					barrage_ID = 29666068,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666088,
					barrage_ID = 29666082,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666087] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan08",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666087,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666088] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang01",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666088,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666089] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666089,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666090,
					barrage_ID = 29666067,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666090] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet06",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666090,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666091,
					barrage_ID = 29666068,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666092,
					barrage_ID = 29666082,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666091] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan09",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666091,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666092] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang02",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666092,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666093] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666093,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666094,
					barrage_ID = 29666067,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666094] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet07",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666094,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666095,
					barrage_ID = 29666068,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666096,
					barrage_ID = 29666082,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666095] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan10",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666095,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666096] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang06",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666096,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666097] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666097,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666098,
					barrage_ID = 29666067,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666098] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet01",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666098,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666099,
					barrage_ID = 29666068,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666100,
					barrage_ID = 29666082,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666099] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan11",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666099,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666100] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang03",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666100,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666101] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "None",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666101,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 40,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 10,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			2,
			2,
			2
		},
		cld_offset = {
			100,
			0,
			100
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.01,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666102,
					barrage_ID = 29666067,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666102] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "cave_bullet09",
		type = 5,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666102,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 20,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1.5,
			1.5,
			1.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreB = true,
			ignoreShield = true,
			lastTime = 0.5,
			shrapnel = {
				{
					inheritAngle = 1,
					bullet_ID = 29666103,
					barrage_ID = 29666068,
					emitterType = "BattleBulletEmitter"
				},
				{
					inheritAngle = 1,
					bullet_ID = 29666104,
					barrage_ID = 29666082,
					emitterType = "BattleBulletEmitter"
				},
				FXID = ""
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666103] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "jiantouzidan12",
		type = 1,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666103,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				1
			},
			{
				1,
				1
			}
		},
		acceleration = {},
		cld_box = {
			1,
			1,
			1
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {}
	}
end)()

(function()
	_G.pg.base.bullet_template_3[29666104] = {
		hit_sfx = "",
		range_offset = 0,
		modle_ID = "dongfangjiguang07",
		type = 15,
		out_bound = 3,
		antisub_enhancement = 0,
		hit_fx = "None",
		effect_type = 1,
		id = 29666104,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 100,
		miss_fx = "None",
		pierce_count = 50,
		ammo_type = 1,
		alert_fx = "",
		velocity = 5,
		damage_type = {
			1,
			1,
			1
		},
		DMG_font = {
			{
				1,
				1
			},
			{
				1,
				0.8
			},
			{
				4,
				0.7
			}
		},
		acceleration = {},
		cld_box = {
			0.5,
			0.5,
			0.5
		},
		cld_offset = {
			0,
			0,
			0
		},
		hit_type = {},
		attach_buff = {},
		extra_param = {
			ignoreShield = true,
			scaleSpeed = 2,
			cldMax = 15
		}
	}
end)()

