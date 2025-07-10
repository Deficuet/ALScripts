pg = pg or {}
pg.activity_banner = {
	{
		id = 1,
		pic = "temp2",
		time = "stop",
		type = 2,
		param = {
			"scene skinshop",
			{}
		}
	},
	{
		id = 2,
		pic = "temp3",
		time = "stop",
		type = 2,
		param = {
			"scene get boat",
			{
				projectName = "new",
				page = 1
			}
		}
	},
	{
		param = "50013",
		time = "stop",
		type = 3,
		id = 3,
		pic = "temp4"
	},
	{
		id = 4,
		pic = "temp5",
		type = 2,
		param = {
			"scene charge",
			{
				wrap = 4
			}
		},
		time = {
			{
				{
					2025,
					7,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					7,
					17
				},
				{
					12,
					0,
					0
				}
			}
		}
	},
	{
		id = 5,
		pic = "temp6",
		time = "stop",
		type = 2,
		param = {
			"scene court yard"
		}
	},
	{
		id = 6,
		pic = "temp7",
		time = "stop",
		type = 2,
		param = {
			"scene shop",
			{
				warp = "shopstreet"
			}
		}
	},
	{
		id = 7,
		pic = "temp8",
		type = 2,
		param = {
			"seltechnology"
		},
		time = {
			{
				{
					2025,
					7,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					7,
					17
				},
				{
					12,
					0,
					0
				}
			}
		}
	},
	{
		id = 8,
		pic = "temp9",
		type = 2,
		param = {
			"scene equip",
			{
				designPage = 2,
				warp = "WARP_TO_DESIGN"
			}
		},
		time = {
			{
				{
					2025,
					7,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					7,
					17
				},
				{
					12,
					0,
					0
				}
			}
		}
	},
	{
		param = "7502",
		time = "stop",
		type = 3,
		id = 9,
		pic = "temp1"
	},
	[90] = {
		param = "",
		id = 90,
		pic = "temp99",
		type = 9,
		time = {
			{
				{
					2025,
					6,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					30
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	[91] = {
		param = "",
		time = "stop",
		type = 9,
		id = 91,
		pic = "temp98"
	},
	[95] = {
		param = "",
		time = "stop",
		type = 11,
		id = 95,
		pic = "temp100"
	},
	[99] = {
		param = "",
		time = "stop",
		type = 12,
		id = 99,
		pic = "limit_skin"
	},
	[100] = {
		param = "饺子|广受欢迎的传统特色食物！<color=#6dd329>（提高经验加成5%，持续60分钟）</color>",
		time = "stop",
		type = 10,
		id = 100,
		pic = "dumpling"
	},
	[101] = {
		param = "镜饼|要开了才能吃哦？<color=#6dd329>（提高经验加成5%，持续60分钟）</color>",
		time = "stop",
		type = 10,
		id = 101,
		pic = "jingbing"
	},
	[200] = {
		param = "",
		time = "always",
		type = 13,
		id = 200,
		pic = "spring"
	},
	[201] = {
		param = "",
		time = "stop",
		type = 13,
		id = 201,
		pic = "christmas"
	},
	[202] = {
		param = "",
		time = "stop",
		type = 13,
		id = 202,
		pic = "winter"
	},
	get_id_list_by_type = {
		[2] = {
			1,
			2,
			4,
			5,
			6,
			7,
			8
		},
		[3] = {
			3,
			9
		},
		[9] = {
			90,
			91
		},
		[11] = {
			95
		},
		[12] = {
			99
		},
		[10] = {
			100,
			101
		},
		[13] = {
			200,
			201,
			202
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		90,
		91,
		95,
		99,
		100,
		101,
		200,
		201,
		202
	}
}
