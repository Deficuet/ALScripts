pg = pg or {}
pg.activity_banner = {
	{
		id = 1,
		pic = "temp3",
		type = 2,
		param = {
			"scene skinshop",
			{}
		},
		time = {
			{
				{
					2025,
					6,
					5
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
					18
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	{
		id = 2,
		pic = "temp4",
		type = 2,
		param = {
			"scene charge",
			{
				wrap = 2
			}
		},
		time = {
			{
				{
					2025,
					6,
					5
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
					18
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	{
		param = "BRSCoreActivityUI",
		id = 3,
		pic = "temp5",
		type = 16,
		time = {
			{
				{
					2025,
					6,
					5
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
					19
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
		param = "5990",
		id = 4,
		pic = "temp6",
		type = 3,
		time = {
			{
				{
					2025,
					6,
					5
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
					19
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
		pic = "temp8",
		type = 2,
		param = {
			"equip transform"
		},
		time = {
			{
				{
					2025,
					6,
					5
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
					26
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
		id = 6,
		pic = "temp9",
		type = 2,
		param = {
			"game hall"
		},
		time = {
			{
				{
					2025,
					6,
					5
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
					26
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
		id = 7,
		pic = "temp1",
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
					5,
					29
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
					11
				},
				{
					23,
					59,
					59
				}
			}
		}
	},
	{
		id = 8,
		pic = "temp2",
		type = 2,
		param = {
			"scene charge",
			{
				wrap = 1
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
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
					12
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
		id = 9,
		pic = "temp7",
		type = 2,
		param = {
			"crusing"
		},
		time = {
			{
				{
					2025,
					6,
					1
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
					26
				},
				{
					12,
					0,
					0
				}
			}
		}
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
					5
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
					18
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
			5,
			6,
			7,
			8,
			9
		},
		[16] = {
			3
		},
		[3] = {
			4
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
