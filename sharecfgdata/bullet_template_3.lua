(function()
	_G.pg.base.bullet_template_3[1607] = {
		hit_sfx = "battle/hit",
		range_offset = 10,
		modle_ID = "BulletUK",
		type = 1,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellMiss",
		effect_type = 1,
		id = 1607,
		random_damage_rate = 0,
		miss_sfx = "battle/sink",
		range = 55,
		miss_fx = "ShellMiss",
		pierce_count = 0,
		ammo_type = 1,
		alert_fx = "",
		velocity = 14,
		damage_type = {
			1,
			0.75,
			0.4
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
				XID = ""
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
					bullet_ID = 3396011,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218005
				},
				{
					rotateOffset = true,
					bullet_ID = 3396011,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218006
				},
				{
					rotateOffset = true,
					bullet_ID = 3396011,
					emitterType = "BattleBulletEmitter",
					inheritAngle = 1,
					barrage_ID = 3218007
				},
				{
					rotateOffset = true,
					bullet_ID = 3396011,
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

