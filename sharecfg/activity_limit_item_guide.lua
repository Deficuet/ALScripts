pg = pg or {}
pg.activity_limit_item_guide = rawget(pg, "activity_limit_item_guide") or setmetatable({
	__name = "activity_limit_item_guide"
}, confNEO)
pg.activity_limit_item_guide.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	10,
	11,
	12,
	13,
	14,
	15,
	16,
	17,
	18,
	19,
	20,
	21,
	22,
	30,
	31,
	32,
	33,
	34,
	35,
	36,
	40,
	41,
	42,
	43,
	44,
	45,
	46,
	47,
	48,
	49,
	50,
	51,
	52,
	53,
	54,
	55,
	56,
	57,
	58,
	59,
	60,
	61,
	62,
	63,
	64,
	65,
	66,
	67,
	68,
	69,
	70,
	71,
	72,
	73,
	74,
	75,
	76,
	81,
	82,
	83,
	84,
	85,
	86,
	87,
	88,
	89,
	90,
	91,
	92,
	93,
	94,
	95,
	96,
	97,
	98,
	99,
	101,
	102,
	103,
	104,
	105,
	106,
	107,
	108,
	109,
	110,
	111,
	112,
	113,
	114,
	116,
	117,
	118,
	120,
	122,
	123,
	124,
	125,
	126,
	127,
	128,
	129,
	130,
	131,
	132,
	133,
	134,
	135,
	136,
	137,
	138,
	139,
	140,
	141,
	142,
	143,
	151,
	152,
	153,
	154,
	155,
	156,
	157,
	158,
	159,
	160,
	161,
	162,
	163,
	164,
	165,
	171,
	172,
	173,
	174,
	175,
	176,
	177,
	178,
	179,
	180,
	181,
	182,
	183,
	184,
	185,
	186,
	187,
	188
}
pg.activity_limit_item_guide.get_id_list_by_activity = {
	[4937] = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		22,
		30,
		31,
		32,
		33,
		34,
		35,
		36,
		40,
		41,
		42,
		43,
		44,
		45,
		46,
		47,
		48
	},
	[5690] = {
		49,
		50,
		51,
		52,
		53,
		54,
		55,
		56,
		57,
		58,
		59,
		60,
		61,
		62,
		63,
		64,
		65,
		66,
		67,
		68,
		69,
		70,
		71,
		72,
		73,
		74,
		75,
		76
	},
	[5988] = {
		81,
		82,
		83,
		84,
		85,
		86,
		87,
		88,
		89,
		90,
		91,
		92,
		93,
		94,
		95,
		96,
		97,
		98,
		99
	},
	[6032] = {
		180,
		181,
		182,
		183,
		184,
		185,
		186,
		187,
		188
	},
	[50064] = {
		101,
		102,
		103,
		104,
		105,
		106,
		107,
		108,
		109,
		110,
		111,
		112,
		113,
		114,
		116,
		117,
		118,
		120,
		122,
		123,
		124,
		125,
		126,
		127,
		128,
		129,
		130
	},
	[50066] = {
		131,
		132,
		133,
		134,
		135,
		136,
		137,
		138,
		139,
		140,
		141,
		142,
		143
	},
	[50155] = {
		151,
		152,
		153,
		154,
		155,
		156,
		157,
		158,
		159,
		160,
		161,
		162,
		163,
		164,
		165
	},
	[50249] = {
		171,
		172,
		173,
		174,
		175,
		176,
		177,
		178,
		179
	}
}
pg.base = pg.base or {}
pg.base.activity_limit_item_guide = {}

;(function()
	pg.base.activity_limit_item_guide[1] = {
		id = 1,
		activity = 4937,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 89640,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[2] = {
		id = 2,
		activity = 4937,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 89660,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[3] = {
		id = 3,
		activity = 4937,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89300,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[4] = {
		id = 4,
		activity = 4937,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89320,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[5] = {
		id = 5,
		activity = 4937,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89340,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[6] = {
		id = 6,
		activity = 4937,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89360,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[7] = {
		id = 7,
		activity = 4937,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89380,
		order = 0,
		link_params = {
			{
				3,
				4934,
				"累计「弧光结晶」领取"
			}
		}
	}
	pg.base.activity_limit_item_guide[8] = {
		id = 8,
		activity = 4937,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89400,
		order = 0,
		link_params = {
			{
				3,
				4934,
				"累计「弧光结晶」领取"
			}
		}
	}
	pg.base.activity_limit_item_guide[10] = {
		id = 10,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 84188,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[11] = {
		id = 11,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 84189,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[12] = {
		id = 12,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 84187,
		order = 0,
		link_params = {
			{
				3,
				4934,
				"累计「弧光结晶」领取"
			}
		}
	}
	pg.base.activity_limit_item_guide[13] = {
		id = 13,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 1,
		drop_id = 84184,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[14] = {
		id = 14,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 1,
		drop_id = 84185,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[15] = {
		id = 15,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 84186,
		order = 0,
		link_params = {
			{
				3,
				4934,
				"累计「弧光结晶」领取"
			}
		}
	}
	pg.base.activity_limit_item_guide[16] = {
		id = 16,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 84179,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「梦芽的环游之旅」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[17] = {
		id = 17,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 84180,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「梦芽的环游之旅」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[18] = {
		id = 18,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 84181,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「梦芽的环游之旅」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[19] = {
		id = 19,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 84182,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「梦芽的环游之旅」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[20] = {
		id = 20,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 84183,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「梦芽的环游之旅」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[21] = {
		id = 21,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 84301,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「激战！古立特啾VS怪兽啾！II」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[22] = {
		id = 22,
		activity = 4937,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 1,
		drop_id = 84174,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[30] = {
		id = 30,
		activity = 4937,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 800,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「激战！古立特啾VS怪兽啾！II」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[31] = {
		id = 31,
		activity = 4937,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 801,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「激战！古立特啾VS怪兽啾！II」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[32] = {
		id = 32,
		activity = 4937,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 802,
		order = 0,
		link_params = {
			{
				3,
				4934,
				"累计「弧光结晶」领取"
			}
		}
	}
	pg.base.activity_limit_item_guide[33] = {
		id = 33,
		activity = 4937,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 803,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「激战！古立特啾VS怪兽啾！II」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[34] = {
		id = 34,
		activity = 4937,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 804,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「激战！古立特啾VS怪兽啾！II」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[35] = {
		id = 35,
		activity = 4937,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 805,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「激战！古立特啾VS怪兽啾！II」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[36] = {
		id = 36,
		activity = 4937,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 806,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[40] = {
		id = 40,
		activity = 4937,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 12220,
		order = 0,
		link_params = {
			{
				3,
				4934,
				"累计「弧光结晶」领取"
			}
		}
	}
	pg.base.activity_limit_item_guide[41] = {
		id = 41,
		activity = 4937,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 12120,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[42] = {
		id = 42,
		activity = 4937,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 12240,
		order = 0,
		link_params = {
			{
				2,
				{
					"SSSS ACADEMY"
				},
				"「激战！古立特啾VS怪兽啾！II」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[43] = {
		id = 43,
		activity = 4937,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 12140,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[44] = {
		id = 44,
		activity = 4937,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 12180,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene task"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[45] = {
		id = 45,
		activity = 4937,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 12200,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene task"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[46] = {
		id = 46,
		activity = 4937,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 12160,
		order = 0,
		link_params = {
			{
				3,
				4934,
				"累计「弧光结晶」领取"
			}
		}
	}
	pg.base.activity_limit_item_guide[47] = {
		id = 47,
		activity = 4937,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 12080,
		order = 0,
		link_params = {
			{
				3,
				4934,
				"累计「弧光结晶」领取"
			}
		}
	}
	pg.base.activity_limit_item_guide[48] = {
		id = 48,
		activity = 4937,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 12100,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 4930,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[49] = {
		id = 49,
		activity = 5690,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150440,
		order = 0,
		link_params = {
			{
				2,
				{
					"puzzle connect"
				},
				"在「帮帮我吧，菈菈小姐！」玩法中，完成委托订单1"
			}
		}
	}
	pg.base.activity_limit_item_guide[50] = {
		id = 50,
		activity = 5690,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150460,
		order = 0,
		link_params = {
			{
				2,
				{
					"puzzle connect"
				},
				"在「帮帮我吧，菈菈小姐！」玩法中，完成委托订单2"
			}
		}
	}
	pg.base.activity_limit_item_guide[51] = {
		id = 51,
		activity = 5690,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 150480,
		order = 0,
		link_params = {
			{
				2,
				{
					"puzzle connect"
				},
				"在「帮帮我吧，菈菈小姐！」玩法中，完成委托订单3"
			}
		}
	}
	pg.base.activity_limit_item_guide[52] = {
		id = 52,
		activity = 5690,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 150500,
		order = 0,
		link_params = {
			{
				2,
				{
					"puzzle connect"
				},
				"在「帮帮我吧，菈菈小姐！」玩法中，完成委托订单4"
			}
		}
	}
	pg.base.activity_limit_item_guide[53] = {
		id = 53,
		activity = 5690,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 150520,
		order = 0,
		link_params = {
			{
				2,
				{
					"puzzle connect"
				},
				"在「帮帮我吧，菈菈小姐！」玩法中，完成委托订单5"
			}
		}
	}
	pg.base.activity_limit_item_guide[54] = {
		id = 54,
		activity = 5690,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 150540,
		order = 0,
		link_params = {
			{
				2,
				{
					"puzzle connect"
				},
				"在「帮帮我吧，菈菈小姐！」玩法中，完成委托订单6"
			}
		}
	}
	pg.base.activity_limit_item_guide[55] = {
		id = 55,
		activity = 5690,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 150560,
		order = 0,
		link_params = {
			{
				2,
				{
					"puzzle connect"
				},
				"在「帮帮我吧，菈菈小姐！」玩法中，完成委托订单7"
			}
		}
	}
	pg.base.activity_limit_item_guide[56] = {
		id = 56,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 316103,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[57] = {
		id = 57,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 316120,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[58] = {
		id = 58,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 1,
		drop_id = 316106,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene level"
				},
				"完成剧情模式"
			}
		}
	}
	pg.base.activity_limit_item_guide[59] = {
		id = 59,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 1,
		drop_id = 316123,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[60] = {
		id = 60,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 316307,
		order = 0,
		link_params = {
			{
				7,
				{
					69
				},
				"累计参与「滴滴特训君」可获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[61] = {
		id = 61,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 1,
		drop_id = 316309,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[62] = {
		id = 62,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 316303,
		order = 0,
		link_params = {
			{
				7,
				{
					69
				},
				"累计参与「滴滴特训君」可获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[63] = {
		id = 63,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 316306,
		order = 0,
		link_params = {
			{
				7,
				{
					69
				},
				"累计参与「滴滴特训君」可获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[64] = {
		id = 64,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 1,
		drop_id = 316308,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[65] = {
		id = 65,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 316110,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[66] = {
		id = 66,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 316111,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[67] = {
		id = 67,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 316119,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[68] = {
		id = 68,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 316108,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[69] = {
		id = 69,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 316102,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[70] = {
		id = 70,
		activity = 5690,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 316113,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[71] = {
		id = 71,
		activity = 5690,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 13660,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成「帮帮我，菈菈小姐！」玩法相关任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[72] = {
		id = 72,
		activity = 5690,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 13680,
		order = 0,
		link_params = {
			{
				7,
				{
					69
				},
				"完成「滴滴特训君」玩法相关任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[73] = {
		id = 73,
		activity = 5690,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 13700,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[74] = {
		id = 74,
		activity = 5690,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 13720,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[75] = {
		id = 75,
		activity = 5690,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 13740,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[76] = {
		id = 76,
		activity = 5690,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 13760,
		order = 0,
		link_params = {
			{
				2,
				{
					"TOLOVE_COLLAB_BACKHILL"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[81] = {
		id = 81,
		activity = 5988,
		count = 1,
		type = 4,
		is_new = 1,
		count_storage = 0,
		drop_id = 11200011,
		order = 0,
		link_params = {
			{
				3,
				5986,
				"「BLACK之痕」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[82] = {
		id = 82,
		activity = 5988,
		count = 1,
		type = 4,
		is_new = 1,
		count_storage = 0,
		drop_id = 11200021,
		order = 0,
		link_params = {
			{
				3,
				5984,
				"「DEATH之意」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[83] = {
		id = 83,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1471,
		order = 0,
		link_params = {
			{
				3,
				5986,
				"「BLACK之痕」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[84] = {
		id = 84,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1475,
		order = 0,
		link_params = {
			{
				3,
				5986,
				"「BLACK之痕」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[85] = {
		id = 85,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1477,
		order = 0,
		link_params = {
			{
				3,
				5986,
				"「BLACK之痕」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[86] = {
		id = 86,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1479,
		order = 0,
		link_params = {
			{
				3,
				5986,
				"「BLACK之痕」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[87] = {
		id = 87,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1476,
		order = 0,
		link_params = {
			{
				3,
				5984,
				"「DEATH之意」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[88] = {
		id = 88,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1478,
		order = 0,
		link_params = {
			{
				3,
				5984,
				"「DEATH之意」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[89] = {
		id = 89,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1480,
		order = 0,
		link_params = {
			{
				3,
				5984,
				"「DEATH之意」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[90] = {
		id = 90,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1472,
		order = 0,
		link_params = {
			{
				3,
				5984,
				"「DEATH之意」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[91] = {
		id = 91,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1473,
		order = 0,
		link_params = {
			{
				3,
				5984,
				"「DEATH之意」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[92] = {
		id = 92,
		activity = 5988,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1474,
		order = 0,
		link_params = {
			{
				3,
				5984,
				"「DEATH之意」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[93] = {
		id = 93,
		activity = 5988,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 323001,
		order = 0,
		link_params = {
			{
				3,
				5989,
				"「幻影挑战」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[94] = {
		id = 94,
		activity = 5988,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 323002,
		order = 0,
		link_params = {
			{
				3,
				5989,
				"「幻影挑战」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[95] = {
		id = 95,
		activity = 5988,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 323101,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[96] = {
		id = 96,
		activity = 5988,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 323102,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[97] = {
		id = 97,
		activity = 5988,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 307,
		order = 0,
		link_params = {
			{
				3,
				5989,
				"「幻影挑战」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[98] = {
		id = 98,
		activity = 5988,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14240,
		order = 0,
		link_params = {
			{
				3,
				5986,
				"「BLACK之痕」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[99] = {
		id = 99,
		activity = 5988,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14260,
		order = 0,
		link_params = {
			{
				3,
				5984,
				"「DEATH之意」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[101] = {
		id = 101,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89420,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[102] = {
		id = 102,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89440,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[103] = {
		id = 103,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89460,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[104] = {
		id = 104,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89480,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[105] = {
		id = 105,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89500,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[106] = {
		id = 106,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89520,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[107] = {
		id = 107,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89540,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[108] = {
		id = 108,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89560,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[109] = {
		id = 109,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89580,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[110] = {
		id = 110,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89600,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[111] = {
		id = 111,
		activity = 50064,
		count = 1,
		type = 3,
		is_new = 0,
		count_storage = 0,
		drop_id = 89620,
		order = 0,
		link_params = {
			{
				3,
				50055,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[112] = {
		id = 112,
		activity = 50064,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 95108,
		order = 0,
		link_params = {
			{
				3,
				50044,
				"「港区委托版」任务奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[113] = {
		id = 113,
		activity = 50064,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 95113,
		order = 0,
		link_params = {
			{
				3,
				50044,
				"「港区委托版」任务奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[114] = {
		id = 114,
		activity = 50064,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 95115,
		order = 0,
		link_params = {
			{
				3,
				50044,
				"「港区委托版」任务奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[116] = {
		id = 116,
		activity = 50064,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 95127,
		order = 0,
		link_params = {
			{
				3,
				50044,
				"「港区委托版」任务奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[117] = {
		id = 117,
		activity = 50064,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 95128,
		order = 0,
		link_params = {
			{
				3,
				50044,
				"「港区委托版」任务奖励"
			}
		}
	}
end)()
;(function()
	pg.base.activity_limit_item_guide[118] = {
		id = 118,
		activity = 50064,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 95132,
		order = 0,
		link_params = {
			{
				3,
				50044,
				"「港区委托版」任务奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[120] = {
		id = 120,
		activity = 50064,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 95140,
		order = 0,
		link_params = {
			{
				3,
				50044,
				"「港区委托版」任务奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[122] = {
		id = 122,
		activity = 50064,
		count = 1,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 95142,
		order = 0,
		link_params = {
			{
				3,
				50049,
				"「噗尼的异世界之旅」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[123] = {
		id = 123,
		activity = 50064,
		count = 10,
		type = 5,
		is_new = 0,
		count_storage = 0,
		drop_id = 95144,
		order = 0,
		link_params = {
			{
				3,
				50044,
				"「港区委托版」任务奖励"
			},
			{
				3,
				50046,
				"「温泉开发战」奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[124] = {
		id = 124,
		activity = 50064,
		count = 4,
		type = 9,
		is_new = 0,
		count_storage = 0,
		drop_id = 1218,
		order = 0,
		link_params = {
			{
				3,
				50044,
				"「港区委托版」任务奖励"
			},
			{
				3,
				50046,
				"「温泉开发战」奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[125] = {
		id = 125,
		activity = 50064,
		count = 1,
		type = 21,
		is_new = 0,
		count_storage = 0,
		drop_id = 10360,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[126] = {
		id = 126,
		activity = 50064,
		count = 1,
		type = 21,
		is_new = 0,
		count_storage = 0,
		drop_id = 10380,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[127] = {
		id = 127,
		activity = 50064,
		count = 1,
		type = 21,
		is_new = 0,
		count_storage = 0,
		drop_id = 10400,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[128] = {
		id = 128,
		activity = 50064,
		count = 1,
		type = 21,
		is_new = 0,
		count_storage = 0,
		drop_id = 10420,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[129] = {
		id = 129,
		activity = 50064,
		count = 1,
		type = 21,
		is_new = 0,
		count_storage = 0,
		drop_id = 10440,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[130] = {
		id = 130,
		activity = 50064,
		count = 1,
		type = 21,
		is_new = 0,
		count_storage = 0,
		drop_id = 10460,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[131] = {
		id = 131,
		activity = 50066,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150680,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[132] = {
		id = 132,
		activity = 50066,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150700,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[133] = {
		id = 133,
		activity = 50066,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150720,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[134] = {
		id = 134,
		activity = 50066,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150740,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[135] = {
		id = 135,
		activity = 50066,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150760,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[136] = {
		id = 136,
		activity = 50066,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150780,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[137] = {
		id = 137,
		activity = 50066,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150800,
		order = 0,
		link_params = {
			{
				3,
				50058,
				"累计「天际微尘」领取"
			}
		}
	}
	pg.base.activity_limit_item_guide[138] = {
		id = 138,
		activity = 50066,
		count = 5,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 325110,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene task"
				},
				"完成活动任务"
			},
			{
				3,
				50063,
				"「据点建装」奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[139] = {
		id = 139,
		activity = 50066,
		count = 4,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1499,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene task"
				},
				"完成活动任务"
			},
			{
				3,
				50063,
				"「据点建装」奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[140] = {
		id = 140,
		activity = 50066,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14320,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[141] = {
		id = 141,
		activity = 50066,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14340,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[142] = {
		id = 142,
		activity = 50066,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14360,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[143] = {
		id = 143,
		activity = 50066,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14380,
		order = 0,
		link_params = {
			{
				3,
				50043,
				"「炼金工房」调合获得"
			}
		}
	}
	pg.base.activity_limit_item_guide[151] = {
		id = 151,
		activity = 50155,
		count = 1,
		type = 4,
		is_new = 1,
		count_storage = 0,
		drop_id = 11400011,
		order = 0,
		link_params = {
			{
				3,
				50153,
				"「圣火不灭 」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[152] = {
		id = 152,
		activity = 50155,
		count = 1,
		type = 4,
		is_new = 1,
		count_storage = 0,
		drop_id = 11400021,
		order = 0,
		link_params = {
			{
				3,
				50151,
				"「疾风不息」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[153] = {
		id = 153,
		activity = 50155,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1501,
		order = 0,
		link_params = {
			{
				3,
				50151,
				"「疾风不息」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[154] = {
		id = 154,
		activity = 50155,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1502,
		order = 0,
		link_params = {
			{
				3,
				50153,
				"「圣火不灭 」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[155] = {
		id = 155,
		activity = 50155,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1503,
		order = 0,
		link_params = {
			{
				3,
				50153,
				"「圣火不灭 」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[156] = {
		id = 156,
		activity = 50155,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1504,
		order = 0,
		link_params = {
			{
				3,
				50153,
				"「圣火不灭 」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[157] = {
		id = 157,
		activity = 50155,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1505,
		order = 0,
		link_params = {
			{
				3,
				50151,
				"「疾风不息」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[158] = {
		id = 158,
		activity = 50155,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1506,
		order = 0,
		link_params = {
			{
				3,
				50151,
				"「疾风不息」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[159] = {
		id = 159,
		activity = 50155,
		count = 1,
		type = 9,
		is_new = 1,
		count_storage = 0,
		drop_id = 1507,
		order = 0,
		link_params = {
			{
				3,
				50151,
				"「疾风不息」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[160] = {
		id = 160,
		activity = 50155,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 330102,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[161] = {
		id = 161,
		activity = 50155,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14580,
		order = 0,
		link_params = {
			{
				3,
				50153,
				"「圣火不灭 」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[162] = {
		id = 162,
		activity = 50155,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14600,
		order = 0,
		link_params = {
			{
				3,
				50151,
				"「疾风不息」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[163] = {
		id = 163,
		activity = 50155,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 330001,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[164] = {
		id = 164,
		activity = 50155,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 330002,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[165] = {
		id = 165,
		activity = 50155,
		count = 1,
		type = 5,
		is_new = 1,
		count_storage = 0,
		drop_id = 330101,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene court yard",
					{}
				},
				"家具商店购买"
			}
		}
	}
	pg.base.activity_limit_item_guide[171] = {
		id = 171,
		activity = 50249,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150860,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene task"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[172] = {
		id = 172,
		activity = 50249,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150880,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 50246,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[173] = {
		id = 173,
		activity = 50249,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 150900,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 50246,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[174] = {
		id = 174,
		activity = 50249,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14780,
		order = 0,
		link_params = {
			{
				2,
				{
					"bossrush dal collab",
					{}
				},
				"「异常海域·1号战区」完全压制奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[175] = {
		id = 175,
		activity = 50249,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14760,
		order = 0,
		link_params = {
			{
				2,
				{
					"bossrush dal collab",
					{}
				},
				"「异常海域·2号战区」完全压制奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[176] = {
		id = 176,
		activity = 50249,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14800,
		order = 0,
		link_params = {
			{
				2,
				{
					"bossrush dal collab",
					{}
				},
				"「异常海域·3号战区」完全压制奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[177] = {
		id = 177,
		activity = 50249,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14840,
		order = 0,
		link_params = {
			{
				2,
				{
					"bossrush dal collab",
					{}
				},
				"「异常海域·4号战区」完全压制奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[178] = {
		id = 178,
		activity = 50249,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14860,
		order = 0,
		link_params = {
			{
				2,
				{
					"bossrush dal collab",
					{}
				},
				"「异常海域·5号战区」完全压制奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[179] = {
		id = 179,
		activity = 50249,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 14820,
		order = 0,
		link_params = {
			{
				2,
				{
					"bossrush dal collab",
					{}
				},
				"「异常海域·6号战区」完全压制奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[180] = {
		id = 180,
		activity = 6032,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 15200,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene task"
				},
				"完成活动任务"
			}
		}
	}
	pg.base.activity_limit_item_guide[181] = {
		id = 181,
		activity = 6032,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 15220,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 6035,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[182] = {
		id = 182,
		activity = 6032,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 15240,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 6035,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[183] = {
		id = 183,
		activity = 6032,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 15260,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 6035,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[184] = {
		id = 184,
		activity = 6032,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 15280,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene level"
				},
				"完成剧情模式"
			}
		}
	}
	pg.base.activity_limit_item_guide[185] = {
		id = 185,
		activity = 6032,
		count = 1,
		type = 21,
		is_new = 1,
		count_storage = 0,
		drop_id = 15300,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 6035,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
	pg.base.activity_limit_item_guide[186] = {
		id = 186,
		activity = 6032,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 151080,
		order = 0,
		link_params = {
			{
				3,
				6031,
				"「海滨补给站」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[187] = {
		id = 187,
		activity = 6032,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 151100,
		order = 0,
		link_params = {
			{
				3,
				6031,
				"「海滨补给站」活动奖励"
			}
		}
	}
	pg.base.activity_limit_item_guide[188] = {
		id = 188,
		activity = 6032,
		count = 1,
		type = 3,
		is_new = 1,
		count_storage = 0,
		drop_id = 151120,
		order = 0,
		link_params = {
			{
				2,
				{
					"scene shop",
					{
						actId = 6035,
						warp = 1
					}
				},
				"补给商店兑换"
			}
		}
	}
end)()
