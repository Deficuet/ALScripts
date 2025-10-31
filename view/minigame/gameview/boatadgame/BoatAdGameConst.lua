local var_0_0 = class("BoatAdGameConst")

var_0_0.battle_sub_hp = 15
var_0_0.battle_sub_hp_boss = 30
var_0_0.player_width = 1450
var_0_0.player_height = 1080
var_0_0.spine_scale_time = 0.8
var_0_0.hp_type_sub = 1
var_0_0.hp_type_mul = 2
var_0_0.hp_type_div = 3
var_0_0.type_enemy = 1
var_0_0.type_item = 2
var_0_0.type_buff = 3
var_0_0.create_bg = {
	601,
	602,
	603
}
var_0_0.speed_down_rate = 0.3
var_0_0.enemy_move_count = {
	1,
	2,
	3,
	4,
	5
}
var_0_0.move_line_width = {
	-700,
	-350,
	0,
	350,
	700
}
var_0_0.buff_touch_width = {
	{
		-1000,
		-350
	},
	{
		-1000,
		-350
	},
	{
		-350,
		350
	},
	{
		350,
		1000
	},
	{
		350,
		1000
	}
}
var_0_0.game_round = {
	{
		id = 1,
		rule = 8
	},
	{
		id = 2,
		rule = 8
	},
	{
		id = 3,
		rule = 8
	},
	{
		id = 4,
		rule = 8
	},
	{
		id = 5,
		rule = 8
	},
	{
		id = 6,
		rule = 8
	},
	{
		id = 7,
		rule = 8
	},
	{
		id = 8,
		rule = 8
	}
}
var_0_0.game_time = {
	99999999,
	99999999,
	99999999,
	99999999,
	99999999,
	99999999,
	99999999,
	99999999
}
var_0_0.char_change_hp = {
	1000,
	2000,
	3000
}
var_0_0.game_char = {
	{
		id = 1,
		hp = 300,
		tpl = "players/char_1",
		speed = Vector2(1000, 0),
		start_pos = Vector2(0, -400)
	},
	{
		id = 2,
		hp = 300,
		tpl = "players/char_2",
		speed = Vector2(1000, 0),
		start_pos = Vector2(0, -400)
	}
}
var_0_0.game_bg = {
	[601] = {
		id = 601,
		tpl = "bgs/nongwu_1"
	},
	[602] = {
		id = 602,
		tpl = "bgs/nongwu_3"
	},
	[603] = {
		id = 603,
		tpl = "bgs/nongwu_3"
	}
}
var_0_0.game_item = {
	[301] = {
		score = 1000,
		guard = 7,
		item = true,
		buff = true,
		ad = true,
		id = 301,
		tpl = "items/buffAd",
		hp = {
			500,
			500
		},
		hp_type = var_0_0.hp_type_sub
	},
	[302] = {
		score = 500,
		buff = true,
		item = true,
		speed_down = 10,
		id = 302,
		tpl = "items/buffSpeedDown"
	},
	[303] = {
		score = 500,
		guard = 5,
		item = true,
		buff = true,
		id = 303,
		tpl = "items/buffGuard"
	},
	[304] = {
		score = 100,
		id = 304,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-100,
			-100
		},
		hp_type = var_0_0.hp_type_sub
	},
	[305] = {
		score = 100,
		id = 305,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-200,
			-200
		},
		hp_type = var_0_0.hp_type_sub
	},
	[306] = {
		score = 100,
		hp = 2,
		buff = true,
		id = 306,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[307] = {
		score = 200,
		id = 307,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			300,
			300
		},
		hp_type = var_0_0.hp_type_sub
	},
	[308] = {
		score = 200,
		id = 308,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			400,
			400
		},
		hp_type = var_0_0.hp_type_sub
	},
	[309] = {
		score = 200,
		hp = 2,
		buff = true,
		id = 309,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	},
	[311] = {
		score = 100,
		id = 311,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-10,
			-10
		},
		hp_type = var_0_0.hp_type_sub
	},
	[312] = {
		score = 100,
		id = 312,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-20,
			-20
		},
		hp_type = var_0_0.hp_type_sub
	},
	[313] = {
		score = 100,
		id = 313,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-30,
			-30
		},
		hp_type = var_0_0.hp_type_sub
	},
	[314] = {
		score = 100,
		id = 314,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-40,
			-40
		},
		hp_type = var_0_0.hp_type_sub
	},
	[315] = {
		score = 100,
		id = 315,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-50,
			-50
		},
		hp_type = var_0_0.hp_type_sub
	},
	[316] = {
		score = 100,
		id = 316,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-60,
			-60
		},
		hp_type = var_0_0.hp_type_sub
	},
	[317] = {
		score = 100,
		id = 317,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-70,
			-70
		},
		hp_type = var_0_0.hp_type_sub
	},
	[318] = {
		score = 100,
		id = 318,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-80,
			-80
		},
		hp_type = var_0_0.hp_type_sub
	},
	[319] = {
		score = 100,
		id = 319,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-90,
			-90
		},
		hp_type = var_0_0.hp_type_sub
	},
	[320] = {
		score = 100,
		id = 320,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-100,
			-100
		},
		hp_type = var_0_0.hp_type_sub
	},
	[321] = {
		score = 100,
		id = 321,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-100,
			-100
		},
		hp_type = var_0_0.hp_type_sub
	},
	[322] = {
		score = 100,
		id = 322,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-150,
			-150
		},
		hp_type = var_0_0.hp_type_sub
	},
	[323] = {
		score = 100,
		id = 323,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-200,
			-200
		},
		hp_type = var_0_0.hp_type_sub
	},
	[324] = {
		score = 100,
		id = 324,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-250,
			-250
		},
		hp_type = var_0_0.hp_type_sub
	},
	[325] = {
		score = 100,
		id = 325,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-300,
			-300
		},
		hp_type = var_0_0.hp_type_sub
	},
	[326] = {
		score = 100,
		id = 326,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-350,
			-350
		},
		hp_type = var_0_0.hp_type_sub
	},
	[327] = {
		score = 100,
		id = 327,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-400,
			-400
		},
		hp_type = var_0_0.hp_type_sub
	},
	[328] = {
		score = 100,
		id = 328,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-450,
			-450
		},
		hp_type = var_0_0.hp_type_sub
	},
	[329] = {
		score = 100,
		id = 329,
		tpl = "items/buffRed",
		buff = true,
		hp = {
			-500,
			-500
		},
		hp_type = var_0_0.hp_type_sub
	},
	[331] = {
		score = 100,
		hp = 2,
		buff = true,
		id = 331,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[332] = {
		score = 100,
		hp = 3,
		buff = true,
		id = 332,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[333] = {
		score = 100,
		hp = 4,
		buff = true,
		id = 333,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[334] = {
		score = 100,
		hp = 5,
		buff = true,
		id = 334,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[335] = {
		score = 100,
		hp = 6,
		buff = true,
		id = 335,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[336] = {
		score = 100,
		hp = 7,
		buff = true,
		id = 336,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[337] = {
		score = 100,
		hp = 8,
		buff = true,
		id = 337,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[338] = {
		score = 100,
		hp = 9,
		buff = true,
		id = 338,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[339] = {
		score = 100,
		hp = 10,
		buff = true,
		id = 339,
		tpl = "items/buffRed",
		hp_type = var_0_0.hp_type_div
	},
	[341] = {
		score = 200,
		id = 341,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			20,
			20
		},
		hp_type = var_0_0.hp_type_sub
	},
	[342] = {
		score = 200,
		id = 342,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			40,
			40
		},
		hp_type = var_0_0.hp_type_sub
	},
	[343] = {
		score = 200,
		id = 343,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			60,
			60
		},
		hp_type = var_0_0.hp_type_sub
	},
	[344] = {
		score = 200,
		id = 344,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			80,
			80
		},
		hp_type = var_0_0.hp_type_sub
	},
	[345] = {
		score = 200,
		id = 345,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			100,
			100
		},
		hp_type = var_0_0.hp_type_sub
	},
	[346] = {
		score = 200,
		id = 346,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			120,
			120
		},
		hp_type = var_0_0.hp_type_sub
	},
	[347] = {
		score = 200,
		id = 347,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			140,
			140
		},
		hp_type = var_0_0.hp_type_sub
	},
	[348] = {
		score = 200,
		id = 348,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			160,
			160
		},
		hp_type = var_0_0.hp_type_sub
	},
	[349] = {
		score = 200,
		id = 349,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			180,
			180
		},
		hp_type = var_0_0.hp_type_sub
	},
	[350] = {
		score = 200,
		id = 350,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			200,
			200
		},
		hp_type = var_0_0.hp_type_sub
	},
	[351] = {
		score = 200,
		id = 351,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			200,
			200
		},
		hp_type = var_0_0.hp_type_sub
	},
	[352] = {
		score = 200,
		id = 352,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			300,
			300
		},
		hp_type = var_0_0.hp_type_sub
	},
	[353] = {
		score = 200,
		id = 353,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			400,
			400
		},
		hp_type = var_0_0.hp_type_sub
	},
	[354] = {
		score = 200,
		id = 354,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			500,
			500
		},
		hp_type = var_0_0.hp_type_sub
	},
	[355] = {
		score = 200,
		id = 355,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			600,
			600
		},
		hp_type = var_0_0.hp_type_sub
	},
	[356] = {
		score = 200,
		id = 356,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			700,
			700
		},
		hp_type = var_0_0.hp_type_sub
	},
	[357] = {
		score = 200,
		id = 357,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			800,
			800
		},
		hp_type = var_0_0.hp_type_sub
	},
	[358] = {
		score = 200,
		id = 358,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			900,
			900
		},
		hp_type = var_0_0.hp_type_sub
	},
	[359] = {
		score = 200,
		id = 359,
		tpl = "items/buffGreen",
		buff = true,
		hp = {
			1000,
			1000
		},
		hp_type = var_0_0.hp_type_sub
	},
	[361] = {
		score = 100,
		hp = 2,
		buff = true,
		id = 361,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	},
	[362] = {
		score = 100,
		hp = 3,
		buff = true,
		id = 362,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	},
	[363] = {
		score = 100,
		hp = 4,
		buff = true,
		id = 363,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	},
	[364] = {
		score = 100,
		hp = 5,
		buff = true,
		id = 364,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	},
	[365] = {
		score = 100,
		hp = 6,
		buff = true,
		id = 365,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	},
	[366] = {
		score = 100,
		hp = 7,
		buff = true,
		id = 366,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	},
	[367] = {
		score = 100,
		hp = 8,
		buff = true,
		id = 367,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	},
	[368] = {
		score = 100,
		hp = 9,
		buff = true,
		id = 368,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	},
	[369] = {
		score = 100,
		hp = 10,
		buff = true,
		id = 369,
		tpl = "items/buffGreen",
		hp_type = var_0_0.hp_type_mul
	}
}
var_0_0.game_enemy = {
	[101] = {
		score = 200,
		id = 101,
		desc = "幽灵啾",
		tpl = "Enemys/youling",
		hp = {
			20,
			50
		}
	},
	[102] = {
		score = 200,
		id = 102,
		desc = "手下啾",
		tpl = "Enemys/shouxia",
		hp = {
			20,
			50
		}
	},
	[103] = {
		score = 200,
		id = 103,
		desc = "海妖啾",
		tpl = "Enemys/haiyao",
		hp = {
			20,
			50
		}
	},
	[104] = {
		score = 200,
		id = 104,
		desc = "海盗啾",
		tpl = "Enemys/haidao",
		hp = {
			20,
			50
		}
	},
	[105] = {
		score = 200,
		id = 105,
		desc = "触手啾",
		tpl = "Enemys/chushou",
		hp = {
			20,
			50
		}
	},
	[106] = {
		speed = 600,
		tpl = "Enemys/youling",
		score = 300,
		desc = "幽灵啾",
		id = 106,
		move = true,
		hp = {
			50,
			100
		}
	},
	[107] = {
		speed = 600,
		tpl = "Enemys/shouxia",
		score = 300,
		desc = "手下啾",
		id = 107,
		move = true,
		hp = {
			50,
			100
		}
	},
	[108] = {
		speed = 600,
		tpl = "Enemys/haiyao",
		score = 300,
		desc = "海妖啾",
		id = 108,
		move = true,
		hp = {
			50,
			100
		}
	},
	[109] = {
		speed = 600,
		tpl = "Enemys/haidao",
		score = 300,
		desc = "海盗啾",
		id = 109,
		move = true,
		hp = {
			50,
			100
		}
	},
	[110] = {
		speed = 600,
		tpl = "Enemys/chushou",
		score = 300,
		desc = "触手啾",
		id = 110,
		move = true,
		hp = {
			50,
			100
		}
	},
	[111] = {
		score = 200,
		id = 111,
		desc = "幽灵啾",
		tpl = "Enemys/youling",
		hp = {
			50,
			100
		}
	},
	[112] = {
		score = 200,
		id = 112,
		desc = "手下啾",
		tpl = "Enemys/shouxia",
		hp = {
			50,
			100
		}
	},
	[113] = {
		score = 200,
		id = 113,
		desc = "海妖啾",
		tpl = "Enemys/haiyao",
		hp = {
			50,
			100
		}
	},
	[114] = {
		score = 200,
		id = 114,
		desc = "海盗啾",
		tpl = "Enemys/haidao",
		hp = {
			50,
			100
		}
	},
	[115] = {
		score = 200,
		id = 115,
		desc = "触手啾",
		tpl = "Enemys/chushou",
		hp = {
			50,
			100
		}
	},
	[116] = {
		speed = 800,
		tpl = "Enemys/youling",
		score = 300,
		desc = "幽灵啾",
		id = 116,
		move = true,
		hp = {
			100,
			200
		}
	},
	[117] = {
		speed = 800,
		tpl = "Enemys/shouxia",
		score = 300,
		desc = "手下啾",
		id = 117,
		move = true,
		hp = {
			100,
			200
		}
	},
	[118] = {
		speed = 800,
		tpl = "Enemys/haiyao",
		score = 300,
		desc = "海妖啾",
		id = 118,
		move = true,
		hp = {
			100,
			200
		}
	},
	[119] = {
		speed = 800,
		tpl = "Enemys/haidao",
		score = 300,
		desc = "海盗啾",
		id = 119,
		move = true,
		hp = {
			100,
			200
		}
	},
	[120] = {
		speed = 800,
		tpl = "Enemys/chushou",
		score = 300,
		desc = "触手啾",
		id = 120,
		move = true,
		hp = {
			100,
			200
		}
	},
	[121] = {
		score = 200,
		id = 121,
		desc = "幽灵啾",
		tpl = "Enemys/youling",
		hp = {
			100,
			200
		}
	},
	[122] = {
		score = 200,
		id = 122,
		desc = "手下啾",
		tpl = "Enemys/shouxia",
		hp = {
			100,
			200
		}
	},
	[123] = {
		score = 200,
		id = 123,
		desc = "海妖啾",
		tpl = "Enemys/haiyao",
		hp = {
			100,
			200
		}
	},
	[124] = {
		score = 200,
		id = 124,
		desc = "海盗啾",
		tpl = "Enemys/haidao",
		hp = {
			100,
			200
		}
	},
	[125] = {
		score = 200,
		id = 125,
		desc = "触手啾",
		tpl = "Enemys/chushou",
		hp = {
			100,
			200
		}
	},
	[126] = {
		speed = 1000,
		tpl = "Enemys/youling",
		score = 300,
		desc = "幽灵啾",
		id = 126,
		move = true,
		hp = {
			200,
			500
		}
	},
	[127] = {
		speed = 1000,
		tpl = "Enemys/shouxia",
		score = 300,
		desc = "手下啾",
		id = 127,
		move = true,
		hp = {
			200,
			500
		}
	},
	[128] = {
		speed = 1000,
		tpl = "Enemys/haiyao",
		score = 300,
		desc = "海妖啾",
		id = 128,
		move = true,
		hp = {
			200,
			500
		}
	},
	[129] = {
		speed = 1000,
		tpl = "Enemys/haidao",
		score = 300,
		desc = "海盗啾",
		id = 129,
		move = true,
		hp = {
			200,
			500
		}
	},
	[130] = {
		speed = 1000,
		tpl = "Enemys/chushou",
		score = 300,
		desc = "触手啾",
		id = 130,
		move = true,
		hp = {
			200,
			500
		}
	},
	[131] = {
		score = 200,
		id = 131,
		desc = "幽灵啾",
		tpl = "Enemys/youling",
		hp = {
			200,
			500
		}
	},
	[132] = {
		score = 200,
		id = 132,
		desc = "手下啾",
		tpl = "Enemys/shouxia",
		hp = {
			200,
			500
		}
	},
	[133] = {
		score = 200,
		id = 133,
		desc = "海妖啾",
		tpl = "Enemys/haiyao",
		hp = {
			200,
			500
		}
	},
	[134] = {
		score = 200,
		id = 134,
		desc = "海盗啾",
		tpl = "Enemys/haidao",
		hp = {
			200,
			500
		}
	},
	[135] = {
		score = 200,
		id = 135,
		desc = "触手啾",
		tpl = "Enemys/chushou",
		hp = {
			200,
			500
		}
	},
	[901] = {
		score = 500,
		desc = "冈伊沙瓦号",
		hp = 500,
		boss = true,
		id = 901,
		tpl = "Enemys/boss_1"
	},
	[902] = {
		score = 500,
		desc = "海豚号",
		hp = 500,
		boss = true,
		id = 902,
		tpl = "Enemys/boss_2"
	},
	[903] = {
		score = 500,
		desc = "皇家财富号",
		hp = 500,
		boss = true,
		id = 903,
		tpl = "Enemys/boss_3"
	},
	[904] = {
		score = 500,
		desc = "幻想号",
		hp = 500,
		boss = true,
		id = 904,
		tpl = "Enemys/boss_4"
	},
	[905] = {
		score = 500,
		desc = "朴茨冒险号",
		hp = 500,
		boss = true,
		id = 905,
		tpl = "Enemys/boss_5"
	},
	[906] = {
		score = 500,
		desc = "圣马丁号",
		hp = 500,
		boss = true,
		id = 906,
		tpl = "Enemys/boss_6"
	},
	[907] = {
		score = 500,
		desc = "维达号",
		hp = 500,
		boss = true,
		id = 907,
		tpl = "Enemys/boss_7"
	},
	[908] = {
		score = 500,
		desc = "和睦号",
		hp = 500,
		boss = true,
		id = 908,
		tpl = "Enemys/boss_8"
	},
	[909] = {
		score = 500,
		desc = "莱姆号",
		hp = 500,
		boss = true,
		id = 909,
		tpl = "Enemys/boss_9"
	},
	[910] = {
		score = 500,
		desc = "珍珠号",
		hp = 500,
		boss = true,
		id = 910,
		tpl = "Enemys/boss_10"
	},
	[911] = {
		score = 500,
		desc = "冈伊沙瓦号",
		hp = 800,
		boss = true,
		id = 911,
		tpl = "Enemys/boss_1"
	},
	[912] = {
		score = 500,
		desc = "海豚号",
		hp = 800,
		boss = true,
		id = 912,
		tpl = "Enemys/boss_2"
	},
	[913] = {
		score = 500,
		desc = "皇家财富号",
		hp = 800,
		boss = true,
		id = 913,
		tpl = "Enemys/boss_3"
	},
	[914] = {
		score = 500,
		desc = "幻想号",
		hp = 800,
		boss = true,
		id = 914,
		tpl = "Enemys/boss_4"
	},
	[915] = {
		score = 500,
		desc = "朴茨冒险号",
		hp = 800,
		boss = true,
		id = 915,
		tpl = "Enemys/boss_5"
	},
	[916] = {
		score = 500,
		desc = "圣马丁号",
		hp = 800,
		boss = true,
		id = 916,
		tpl = "Enemys/boss_6"
	},
	[917] = {
		score = 500,
		desc = "维达号",
		hp = 800,
		boss = true,
		id = 917,
		tpl = "Enemys/boss_7"
	},
	[918] = {
		score = 500,
		desc = "和睦号",
		hp = 800,
		boss = true,
		id = 918,
		tpl = "Enemys/boss_8"
	},
	[919] = {
		score = 500,
		desc = "莱姆号",
		hp = 800,
		boss = true,
		id = 919,
		tpl = "Enemys/boss_9"
	},
	[920] = {
		score = 500,
		desc = "珍珠号",
		hp = 800,
		boss = true,
		id = 920,
		tpl = "Enemys/boss_10"
	},
	[921] = {
		score = 500,
		desc = "冈伊沙瓦号",
		hp = 1000,
		boss = true,
		id = 921,
		tpl = "Enemys/boss_1"
	},
	[922] = {
		score = 500,
		desc = "海豚号",
		hp = 1000,
		boss = true,
		id = 922,
		tpl = "Enemys/boss_2"
	},
	[923] = {
		score = 500,
		desc = "皇家财富号",
		hp = 1000,
		boss = true,
		id = 923,
		tpl = "Enemys/boss_3"
	},
	[924] = {
		score = 500,
		desc = "幻想号",
		hp = 1000,
		boss = true,
		id = 924,
		tpl = "Enemys/boss_4"
	},
	[925] = {
		score = 500,
		desc = "朴茨冒险号",
		hp = 1000,
		boss = true,
		id = 925,
		tpl = "Enemys/boss_5"
	},
	[926] = {
		score = 500,
		desc = "圣马丁号",
		hp = 1000,
		boss = true,
		id = 926,
		tpl = "Enemys/boss_6"
	},
	[927] = {
		score = 500,
		desc = "维达号",
		hp = 1000,
		boss = true,
		id = 927,
		tpl = "Enemys/boss_7"
	},
	[928] = {
		score = 500,
		desc = "和睦号",
		hp = 1000,
		boss = true,
		id = 928,
		tpl = "Enemys/boss_8"
	},
	[929] = {
		score = 500,
		desc = "莱姆号",
		hp = 1000,
		boss = true,
		id = 929,
		tpl = "Enemys/boss_9"
	},
	[930] = {
		score = 500,
		desc = "珍珠号",
		hp = 1000,
		boss = true,
		id = 930,
		tpl = "Enemys/boss_10"
	},
	[931] = {
		score = 500,
		desc = "冈伊沙瓦号",
		hp = 2000,
		boss = true,
		id = 931,
		tpl = "Enemys/boss_1"
	},
	[932] = {
		score = 500,
		desc = "海豚号",
		hp = 2000,
		boss = true,
		id = 932,
		tpl = "Enemys/boss_2"
	},
	[933] = {
		score = 500,
		desc = "皇家财富号",
		hp = 2000,
		boss = true,
		id = 933,
		tpl = "Enemys/boss_3"
	},
	[934] = {
		score = 500,
		desc = "幻想号",
		hp = 2000,
		boss = true,
		id = 934,
		tpl = "Enemys/boss_4"
	},
	[935] = {
		score = 500,
		desc = "朴茨冒险号",
		hp = 2000,
		boss = true,
		id = 935,
		tpl = "Enemys/boss_5"
	},
	[936] = {
		score = 500,
		desc = "圣马丁号",
		hp = 2000,
		boss = true,
		id = 936,
		tpl = "Enemys/boss_6"
	},
	[937] = {
		score = 500,
		desc = "维达号",
		hp = 2000,
		boss = true,
		id = 937,
		tpl = "Enemys/boss_7"
	},
	[938] = {
		score = 500,
		desc = "和睦号",
		hp = 2000,
		boss = true,
		id = 938,
		tpl = "Enemys/boss_8"
	},
	[939] = {
		score = 500,
		desc = "莱姆号",
		hp = 2000,
		boss = true,
		id = 939,
		tpl = "Enemys/boss_9"
	},
	[940] = {
		score = 500,
		desc = "珍珠号",
		hp = 2000,
		boss = true,
		id = 940,
		tpl = "Enemys/boss_10"
	},
	[941] = {
		score = 500,
		desc = "冈伊沙瓦号",
		hp = 3000,
		boss = true,
		id = 941,
		tpl = "Enemys/boss_1"
	},
	[942] = {
		score = 500,
		desc = "海豚号",
		hp = 3000,
		boss = true,
		id = 942,
		tpl = "Enemys/boss_2"
	},
	[943] = {
		score = 500,
		desc = "皇家财富号",
		hp = 3000,
		boss = true,
		id = 943,
		tpl = "Enemys/boss_3"
	},
	[944] = {
		score = 500,
		desc = "幻想号",
		hp = 3000,
		boss = true,
		id = 944,
		tpl = "Enemys/boss_4"
	},
	[945] = {
		score = 500,
		desc = "朴茨冒险号",
		hp = 3000,
		boss = true,
		id = 945,
		tpl = "Enemys/boss_5"
	},
	[946] = {
		score = 500,
		desc = "圣马丁号",
		hp = 3000,
		boss = true,
		id = 946,
		tpl = "Enemys/boss_6"
	},
	[947] = {
		score = 500,
		desc = "维达号",
		hp = 3000,
		boss = true,
		id = 947,
		tpl = "Enemys/boss_7"
	},
	[948] = {
		score = 500,
		desc = "和睦号",
		hp = 3000,
		boss = true,
		id = 948,
		tpl = "Enemys/boss_8"
	},
	[949] = {
		score = 500,
		desc = "莱姆号",
		hp = 3000,
		boss = true,
		id = 949,
		tpl = "Enemys/boss_9"
	},
	[950] = {
		score = 500,
		desc = "珍珠号",
		hp = 3000,
		boss = true,
		id = 950,
		tpl = "Enemys/boss_10"
	},
	[951] = {
		score = 500,
		desc = "冈伊沙瓦号",
		hp = 4000,
		boss = true,
		id = 951,
		tpl = "Enemys/boss_1"
	},
	[952] = {
		score = 500,
		desc = "海豚号",
		hp = 4000,
		boss = true,
		id = 952,
		tpl = "Enemys/boss_2"
	},
	[953] = {
		score = 500,
		desc = "皇家财富号",
		hp = 4000,
		boss = true,
		id = 953,
		tpl = "Enemys/boss_3"
	},
	[954] = {
		score = 500,
		desc = "幻想号",
		hp = 4000,
		boss = true,
		id = 954,
		tpl = "Enemys/boss_4"
	},
	[955] = {
		score = 500,
		desc = "朴茨冒险号",
		hp = 4000,
		boss = true,
		id = 955,
		tpl = "Enemys/boss_5"
	},
	[956] = {
		score = 500,
		desc = "圣马丁号",
		hp = 4000,
		boss = true,
		id = 956,
		tpl = "Enemys/boss_6"
	},
	[957] = {
		score = 500,
		desc = "维达号",
		hp = 4000,
		boss = true,
		id = 957,
		tpl = "Enemys/boss_7"
	},
	[958] = {
		score = 500,
		desc = "和睦号",
		hp = 4000,
		boss = true,
		id = 958,
		tpl = "Enemys/boss_8"
	},
	[959] = {
		score = 500,
		desc = "莱姆号",
		hp = 4000,
		boss = true,
		id = 959,
		tpl = "Enemys/boss_9"
	},
	[960] = {
		score = 500,
		desc = "珍珠号",
		hp = 4000,
		boss = true,
		id = 960,
		tpl = "Enemys/boss_10"
	},
	[961] = {
		score = 500,
		desc = "冈伊沙瓦号",
		hp = 5000,
		boss = true,
		id = 961,
		tpl = "Enemys/boss_1"
	},
	[962] = {
		score = 500,
		desc = "海豚号",
		hp = 5000,
		boss = true,
		id = 962,
		tpl = "Enemys/boss_2"
	},
	[963] = {
		score = 500,
		desc = "皇家财富号",
		hp = 5000,
		boss = true,
		id = 963,
		tpl = "Enemys/boss_3"
	},
	[964] = {
		score = 500,
		desc = "幻想号",
		hp = 5000,
		boss = true,
		id = 964,
		tpl = "Enemys/boss_4"
	},
	[965] = {
		score = 500,
		desc = "朴茨冒险号",
		hp = 5000,
		boss = true,
		id = 965,
		tpl = "Enemys/boss_5"
	},
	[966] = {
		score = 500,
		desc = "圣马丁号",
		hp = 5000,
		boss = true,
		id = 966,
		tpl = "Enemys/boss_6"
	},
	[967] = {
		score = 500,
		desc = "维达号",
		hp = 5000,
		boss = true,
		id = 967,
		tpl = "Enemys/boss_7"
	},
	[968] = {
		score = 500,
		desc = "和睦号",
		hp = 5000,
		boss = true,
		id = 968,
		tpl = "Enemys/boss_8"
	},
	[969] = {
		score = 500,
		desc = "莱姆号",
		hp = 5000,
		boss = true,
		id = 969,
		tpl = "Enemys/boss_9"
	},
	[970] = {
		score = 500,
		desc = "珍珠号",
		hp = 5000,
		boss = true,
		id = 970,
		tpl = "Enemys/boss_10"
	}
}
var_0_0.rule_data = {
	[1001] = {
		id = 1001,
		create_rate = 50,
		ids = {
			101,
			102,
			103,
			104,
			105
		},
		type = var_0_0.type_enemy
	},
	[1002] = {
		id = 1002,
		create_rate = 100,
		ids = {
			106,
			107,
			108,
			109,
			110
		},
		type = var_0_0.type_enemy
	},
	[1003] = {
		id = 1003,
		create_rate = 50,
		ids = {
			111,
			112,
			113,
			114,
			115
		},
		type = var_0_0.type_enemy
	},
	[1004] = {
		id = 1004,
		create_rate = 50,
		ids = {
			116,
			117,
			118,
			119,
			120
		},
		type = var_0_0.type_enemy
	},
	[1005] = {
		id = 1005,
		create_rate = 50,
		ids = {
			121,
			122,
			123,
			124,
			125
		},
		type = var_0_0.type_enemy
	},
	[1006] = {
		id = 1006,
		create_rate = 50,
		ids = {
			126,
			127,
			128,
			129,
			130
		},
		type = var_0_0.type_enemy
	},
	[1007] = {
		id = 1007,
		create_rate = 50,
		ids = {
			131,
			132,
			133,
			134,
			135
		},
		type = var_0_0.type_enemy
	},
	[2001] = {
		id = 2001,
		create_rate = 100,
		ids = {
			901,
			903,
			908,
			905,
			909,
			906,
			910
		},
		type = var_0_0.type_enemy
	},
	[2002] = {
		id = 2002,
		create_rate = 100,
		ids = {
			911,
			913,
			918,
			915,
			919,
			916,
			920
		},
		type = var_0_0.type_enemy
	},
	[2003] = {
		id = 2003,
		create_rate = 100,
		ids = {
			921,
			923,
			928,
			925,
			929,
			926,
			930
		},
		type = var_0_0.type_enemy
	},
	[2004] = {
		id = 2004,
		create_rate = 100,
		ids = {
			931,
			933,
			938,
			935,
			939,
			936,
			940
		},
		type = var_0_0.type_enemy
	},
	[2005] = {
		id = 2005,
		create_rate = 100,
		ids = {
			941,
			943,
			948,
			945,
			949,
			946,
			950
		},
		type = var_0_0.type_enemy
	},
	[2006] = {
		id = 2006,
		create_rate = 100,
		ids = {
			951,
			953,
			958,
			955,
			959,
			956,
			960
		},
		type = var_0_0.type_enemy
	},
	[2007] = {
		id = 2007,
		create_rate = 100,
		ids = {
			961,
			963,
			968,
			965,
			969,
			966,
			970
		},
		type = var_0_0.type_enemy
	},
	[3001] = {
		id = 3001,
		create_rate = 100,
		once = true,
		ids = {
			301,
			302,
			303,
			304,
			305,
			306,
			307,
			308,
			309
		},
		type = var_0_0.type_buff
	},
	[3002] = {
		id = 3002,
		create_rate = 100,
		once = true,
		ids = {
			301,
			302,
			303,
			311,
			312,
			313,
			314,
			315,
			316,
			317,
			318,
			319,
			320,
			341,
			342,
			343,
			344,
			345,
			346,
			347,
			348,
			349,
			350
		},
		type = var_0_0.type_buff
	},
	[3003] = {
		id = 3003,
		create_rate = 100,
		once = true,
		ids = {
			301,
			302,
			303,
			321,
			322,
			323,
			324,
			325,
			326,
			327,
			328,
			329,
			351,
			352,
			353,
			354,
			355,
			356,
			357,
			358,
			359
		},
		type = var_0_0.type_buff
	}
}
var_0_0.create_rule = {
	{
		{
			desc = "boss击杀后不刷新小怪，游戏结束",
			count = 1,
			times = 10,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2001,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动）",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1004,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止）",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "第一关卡的起点在这里",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		}
	},
	{
		{
			desc = "boss击杀后不刷新小怪，游戏结束",
			count = 1,
			times = 10,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2001,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动）",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1004,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止）",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		}
	},
	{
		{
			desc = "boss击杀后不刷新小怪，游戏结束",
			count = 1,
			times = 10,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2001,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动）",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1004,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止）",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		}
	},
	{
		{
			desc = "boss击杀后不刷新小怪，游戏结束",
			count = 1,
			times = 10,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2001,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动）",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1004,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止）",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		}
	},
	{
		{
			desc = "boss击杀后不刷新小怪，游戏结束",
			count = 1,
			times = 10,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2001,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动）",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1004,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止）",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		}
	},
	{
		{
			desc = "boss击杀后不刷新小怪，游戏结束",
			count = 1,
			times = 10,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2001,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动）",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1004,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止）",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		}
	},
	{
		{
			desc = "boss击杀后不刷新小怪，游戏结束",
			count = 1,
			times = 10,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2001,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动）",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1004,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1003,
					1003,
					1003,
					1003,
					1003
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止）",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3001,
					0,
					3001,
					0,
					3001
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		}
	},
	{
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2007,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					1006,
					1006,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1007,
					0,
					1006
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					0,
					1006,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动---从这里开始boss5000血",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1006,
					0,
					1006
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2007,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					1006,
					1006,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1007,
					0,
					1006
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					0,
					1006,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动---从这里开始boss5000血",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1006,
					0,
					1006
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2006,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					1006,
					1006,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1007,
					0,
					1006
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					0,
					1006,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动---从这里开始boss4000血",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1006,
					0,
					1006
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2006,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					1006,
					1006,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1007,
					0,
					1006
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					0,
					1006,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动---从这里开始boss4000血",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1006,
					0,
					1006
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2005,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					1006,
					1006,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1007,
					0,
					1006
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					0,
					1006,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动---从这里开始boss3000血",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1006,
					0,
					1006
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2004,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					1006,
					1006,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1007,
					0,
					1006
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					0,
					1006,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动---从这里开始boss2000血",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1006,
					0,
					1006
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2003,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					1006,
					1005,
					1007,
					0,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1005,
					0,
					1006
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1005,
					0,
					0,
					1006,
					1007
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					0,
					1007,
					0,
					1006
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1006,
					1005,
					0,
					1006
				}
			}
		},
		{
			desc = "刷新小怪（静止）----------从这里开始是3档",
			count = 4,
			times = 5,
			data = {
				{
					1006,
					1005,
					1006,
					1005,
					1005
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2002,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 2,
			data = {
				{
					1004,
					0,
					1004,
					0,
					1005
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 3,
			data = {
				{
					0,
					1005,
					1004,
					1004,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1004,
					1004,
					0,
					1004
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 3,
			data = {
				{
					1004,
					0,
					0,
					1004,
					1005
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					1004,
					0,
					1005,
					0,
					1005
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 3,
			data = {
				{
					0,
					1005,
					1003,
					1004,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 4,
			data = {
				{
					0,
					1004,
					1003,
					0,
					1004
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3003,
					0,
					3003,
					0,
					3003
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 3,
			data = {
				{
					1003,
					0,
					0,
					1004,
					1005
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2001,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 5,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 5,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 3,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 2,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 3,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "该列会刷新一个boss",
			count = 1,
			times = 1,
			data = {
				{
					0,
					0,
					2001,
					0,
					0
				}
			}
		},
		{
			desc = "空白，会留空一块距离，用来给boss预留一些出现空间",
			count = 1,
			times = 3,
			data = {
				{
					0,
					0,
					0,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 2,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 3,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 3,
			data = {
				{
					1001,
					0,
					1002,
					0,
					1001
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 3,
			data = {
				{
					0,
					0,
					1002,
					0,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪(运动",
			count = 4,
			times = 2,
			data = {
				{
					0,
					0,
					1002,
					1001,
					0
				}
			}
		},
		{
			desc = "刷新3个buff",
			count = 3,
			times = 1,
			data = {
				{
					3002,
					0,
					3002,
					0,
					3002
				}
			}
		},
		{
			desc = "刷新小怪（静止",
			count = 4,
			times = 3,
			data = {
				{
					1001,
					1001,
					1001,
					1001,
					1001
				}
			}
		}
	}
}

return var_0_0
