(function()
	_G.pg.base.bullet_template_2[171002] = {
		hit_sfx = "battle/torpedo-hit",
		range_offset = 0,
		modle_ID = "None",
		type = 3,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 171002,
		random_damage_rate = 0,
		miss_sfx = "battle/torpedo-hit",
		range = 0,
		miss_fx = "musashi_hit",
		pierce_count = 0,
		ammo_type = 2,
		alert_fx = "",
		velocity = 0.1,
		damage_type = {
			1.5,
			1.5,
			1.5
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
			width = 120,
			height = 10,
			time = -1
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
	_G.pg.base.bullet_template_2[171000] = {
		hit_sfx = "battle/lightning-hit",
		range_offset = 20,
		modle_ID = "wuzang_luolei_3",
		type = 2,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "ShellHit",
		effect_type = 1,
		id = 171000,
		random_damage_rate = 0,
		miss_sfx = "",
		range = 200,
		miss_fx = "ShellHit",
		pierce_count = 0,
		ammo_type = 6,
		alert_fx = "AlertArea",
		velocity = 1.5,
		damage_type = {
			1,
			1.4,
			1.4
		},
		DMG_font = {
			{
				2,
				1
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
			range = 15
		},
		attach_buff = {},
		extra_param = {
			gravity = -0.05,
			launchVrtSpeed = -3,
			airdrop = true,
			offsetX = -5,
			offsetY = 40,
			randomOffsetX = 10,
			randomOffsetZ = 10,
			diveFilter = {
				2
			}
		}
	}
end)()

(function()
	_G.pg.base.bullet_template_2[171001] = {
		hit_sfx = "battle/hit",
		range_offset = 0,
		modle_ID = "xiaowuzang_zhanlangjian",
		type = 9,
		out_bound = 0,
		antisub_enhancement = 0,
		hit_fx = "Clhit",
		effect_type = 1,
		id = 171001,
		random_damage_rate = 0,
		miss_sfx = "battle/sink",
		range = 1,
		miss_fx = "ShellMissBig",
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
			range = 0
		},
		attach_buff = {
			{
				friendly = false,
				buff_id = 528,
				flare = false
			}
		},
		extra_param = {}
	}
end)()

