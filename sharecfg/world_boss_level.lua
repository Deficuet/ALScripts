pg = pg or {}
pg.world_boss_level = rawget(pg, "world_boss_level") or setmetatable({
	__name = "world_boss_level"
}, confNEO)
pg.world_boss_level.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
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
	23,
	24,
	25,
	26,
	27,
	28,
	29,
	30,
	31,
	32,
	33,
	34,
	35,
	36,
	37,
	38,
	39,
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
	77,
	78,
	79,
	80,
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
	100,
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
	115,
	116,
	117,
	118,
	119,
	120,
	121,
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
	144,
	145,
	146,
	147,
	148,
	149,
	150,
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
	166,
	167,
	168,
	169,
	170,
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
	188,
	189,
	190,
	191,
	192,
	193,
	194,
	195,
	196,
	197,
	198,
	199,
	200,
	201,
	202,
	203,
	204,
	205,
	206,
	207,
	208,
	209,
	210,
	211,
	212,
	213,
	214,
	215,
	216,
	217,
	218,
	219,
	220,
	221,
	222,
	223,
	224,
	225,
	226,
	227,
	228,
	229,
	230,
	231,
	232,
	233,
	234,
	235,
	236,
	237,
	238,
	239,
	240,
	241,
	242,
	243,
	244,
	245,
	246,
	247,
	248,
	249,
	250,
	251,
	252,
	253,
	254,
	255,
	256,
	257,
	258,
	259,
	260,
	261,
	262,
	263,
	264,
	265,
	266,
	267,
	268,
	269,
	270,
	271,
	272,
	273,
	274,
	275,
	276,
	277,
	278,
	279,
	280,
	281,
	282,
	283,
	284,
	285,
	286,
	287,
	288,
	289,
	290,
	291,
	292,
	293,
	294,
	295,
	296,
	297,
	298,
	299,
	300,
	301,
	302,
	303,
	304,
	305,
	306,
	307,
	308,
	309,
	310,
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
	321,
	322,
	323,
	324,
	325,
	326,
	327,
	328,
	329,
	330,
	331,
	332,
	333,
	334,
	335,
	336,
	337,
	338,
	339,
	340,
	341,
	342,
	343,
	344,
	345,
	346,
	347,
	348,
	349,
	350,
	351,
	352,
	353,
	354,
	355,
	356,
	357,
	358,
	359,
	360
}
pg.base = pg.base or {}
pg.base.world_boss_level = {}

;(function()
	pg.base.world_boss_level[1] = {
		id = 1,
		enemy_id = 295001,
		hp = 50000,
		expedition_id = 296001,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[2] = {
		id = 2,
		enemy_id = 295002,
		hp = 54000,
		expedition_id = 296002,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[3] = {
		id = 3,
		enemy_id = 295003,
		hp = 58000,
		expedition_id = 296003,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[4] = {
		id = 4,
		enemy_id = 295004,
		hp = 70000,
		expedition_id = 296004,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[5] = {
		id = 5,
		enemy_id = 295005,
		hp = 110000,
		expedition_id = 296005,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[6] = {
		id = 6,
		enemy_id = 295006,
		hp = 150000,
		expedition_id = 296006,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[7] = {
		id = 7,
		enemy_id = 295007,
		hp = 230000,
		expedition_id = 296007,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[8] = {
		id = 8,
		enemy_id = 295008,
		hp = 310000,
		expedition_id = 296008,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[9] = {
		id = 9,
		enemy_id = 295009,
		hp = 390000,
		expedition_id = 296009,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[10] = {
		id = 10,
		enemy_id = 295010,
		hp = 480000,
		expedition_id = 296010,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[11] = {
		id = 11,
		enemy_id = 295011,
		hp = 600000,
		expedition_id = 296011,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[12] = {
		id = 12,
		enemy_id = 295012,
		hp = 760000,
		expedition_id = 296012,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[13] = {
		id = 13,
		enemy_id = 295013,
		hp = 950000,
		expedition_id = 296013,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[14] = {
		id = 14,
		enemy_id = 295014,
		hp = 1170000,
		expedition_id = 296014,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[15] = {
		id = 15,
		enemy_id = 295015,
		hp = 1420000,
		expedition_id = 296015,
		drop_show_self = {
			{
				1,
				3001,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3001,
				100
			}
		}
	}
	pg.base.world_boss_level[16] = {
		id = 16,
		enemy_id = 295016,
		hp = 50000,
		expedition_id = 296016,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[17] = {
		id = 17,
		enemy_id = 295017,
		hp = 54000,
		expedition_id = 296017,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[18] = {
		id = 18,
		enemy_id = 295018,
		hp = 58000,
		expedition_id = 296018,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[19] = {
		id = 19,
		enemy_id = 295019,
		hp = 70000,
		expedition_id = 296019,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[20] = {
		id = 20,
		enemy_id = 295020,
		hp = 110000,
		expedition_id = 296020,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[21] = {
		id = 21,
		enemy_id = 295021,
		hp = 150000,
		expedition_id = 296021,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[22] = {
		id = 22,
		enemy_id = 295022,
		hp = 230000,
		expedition_id = 296022,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[23] = {
		id = 23,
		enemy_id = 295023,
		hp = 310000,
		expedition_id = 296023,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[24] = {
		id = 24,
		enemy_id = 295024,
		hp = 390000,
		expedition_id = 296024,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[25] = {
		id = 25,
		enemy_id = 295025,
		hp = 480000,
		expedition_id = 296025,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[26] = {
		id = 26,
		enemy_id = 295026,
		hp = 600000,
		expedition_id = 296026,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[27] = {
		id = 27,
		enemy_id = 295027,
		hp = 760000,
		expedition_id = 296027,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[28] = {
		id = 28,
		enemy_id = 295028,
		hp = 950000,
		expedition_id = 296028,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[29] = {
		id = 29,
		enemy_id = 295029,
		hp = 1170000,
		expedition_id = 296029,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[30] = {
		id = 30,
		enemy_id = 295030,
		hp = 1420000,
		expedition_id = 296030,
		drop_show_self = {
			{
				1,
				3003,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3003,
				100
			}
		}
	}
	pg.base.world_boss_level[31] = {
		id = 31,
		enemy_id = 295031,
		hp = 40000,
		expedition_id = 296031,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[32] = {
		id = 32,
		enemy_id = 295032,
		hp = 44000,
		expedition_id = 296032,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[33] = {
		id = 33,
		enemy_id = 295033,
		hp = 52000,
		expedition_id = 296033,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[34] = {
		id = 34,
		enemy_id = 295034,
		hp = 68000,
		expedition_id = 296034,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[35] = {
		id = 35,
		enemy_id = 295035,
		hp = 100000,
		expedition_id = 296035,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[36] = {
		id = 36,
		enemy_id = 295036,
		hp = 140000,
		expedition_id = 296036,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[37] = {
		id = 37,
		enemy_id = 295037,
		hp = 190000,
		expedition_id = 296037,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[38] = {
		id = 38,
		enemy_id = 295038,
		hp = 260000,
		expedition_id = 296038,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[39] = {
		id = 39,
		enemy_id = 295039,
		hp = 350000,
		expedition_id = 296039,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[40] = {
		id = 40,
		enemy_id = 295040,
		hp = 460000,
		expedition_id = 296040,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[41] = {
		id = 41,
		enemy_id = 295041,
		hp = 590000,
		expedition_id = 296041,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[42] = {
		id = 42,
		enemy_id = 295042,
		hp = 740000,
		expedition_id = 296042,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[43] = {
		id = 43,
		enemy_id = 295043,
		hp = 910000,
		expedition_id = 296043,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[44] = {
		id = 44,
		enemy_id = 295044,
		hp = 1100000,
		expedition_id = 296044,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[45] = {
		id = 45,
		enemy_id = 295045,
		hp = 1320000,
		expedition_id = 296045,
		drop_show_self = {
			{
				1,
				3004,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3004,
				100
			}
		}
	}
	pg.base.world_boss_level[46] = {
		id = 46,
		enemy_id = 295046,
		hp = 50000,
		expedition_id = 296046,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[47] = {
		id = 47,
		enemy_id = 295047,
		hp = 54000,
		expedition_id = 296047,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[48] = {
		id = 48,
		enemy_id = 295048,
		hp = 58000,
		expedition_id = 296048,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[49] = {
		id = 49,
		enemy_id = 295049,
		hp = 70000,
		expedition_id = 296049,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[50] = {
		id = 50,
		enemy_id = 295050,
		hp = 110000,
		expedition_id = 296050,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[51] = {
		id = 51,
		enemy_id = 295051,
		hp = 150000,
		expedition_id = 296051,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[52] = {
		id = 52,
		enemy_id = 295052,
		hp = 230000,
		expedition_id = 296052,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[53] = {
		id = 53,
		enemy_id = 295053,
		hp = 310000,
		expedition_id = 296053,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[54] = {
		id = 54,
		enemy_id = 295054,
		hp = 390000,
		expedition_id = 296054,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[55] = {
		id = 55,
		enemy_id = 295055,
		hp = 480000,
		expedition_id = 296055,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[56] = {
		id = 56,
		enemy_id = 295056,
		hp = 600000,
		expedition_id = 296056,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[57] = {
		id = 57,
		enemy_id = 295057,
		hp = 750000,
		expedition_id = 296057,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[58] = {
		id = 58,
		enemy_id = 295058,
		hp = 930000,
		expedition_id = 296058,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[59] = {
		id = 59,
		enemy_id = 295059,
		hp = 1140000,
		expedition_id = 296059,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[60] = {
		id = 60,
		enemy_id = 295060,
		hp = 1380000,
		expedition_id = 296060,
		drop_show_self = {
			{
				1,
				3005,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3005,
				100
			}
		}
	}
	pg.base.world_boss_level[61] = {
		id = 61,
		enemy_id = 295061,
		hp = 50000,
		expedition_id = 296061,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[62] = {
		id = 62,
		enemy_id = 295062,
		hp = 54000,
		expedition_id = 296062,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[63] = {
		id = 63,
		enemy_id = 295063,
		hp = 58000,
		expedition_id = 296063,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[64] = {
		id = 64,
		enemy_id = 295064,
		hp = 70000,
		expedition_id = 296064,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[65] = {
		id = 65,
		enemy_id = 295065,
		hp = 110000,
		expedition_id = 296065,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[66] = {
		id = 66,
		enemy_id = 295066,
		hp = 150000,
		expedition_id = 296066,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[67] = {
		id = 67,
		enemy_id = 295067,
		hp = 230000,
		expedition_id = 296067,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[68] = {
		id = 68,
		enemy_id = 295068,
		hp = 310000,
		expedition_id = 296068,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[69] = {
		id = 69,
		enemy_id = 295069,
		hp = 390000,
		expedition_id = 296069,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[70] = {
		id = 70,
		enemy_id = 295070,
		hp = 480000,
		expedition_id = 296070,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[71] = {
		id = 71,
		enemy_id = 295071,
		hp = 600000,
		expedition_id = 296071,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[72] = {
		id = 72,
		enemy_id = 295072,
		hp = 780000,
		expedition_id = 296072,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[73] = {
		id = 73,
		enemy_id = 295073,
		hp = 1000000,
		expedition_id = 296073,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[74] = {
		id = 74,
		enemy_id = 295074,
		hp = 1240000,
		expedition_id = 296074,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[75] = {
		id = 75,
		enemy_id = 295075,
		hp = 1480000,
		expedition_id = 296075,
		drop_show_self = {
			{
				1,
				3006,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3006,
				100
			}
		}
	}
	pg.base.world_boss_level[76] = {
		id = 76,
		enemy_id = 295076,
		hp = 50000,
		expedition_id = 296076,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[77] = {
		id = 77,
		enemy_id = 295077,
		hp = 54000,
		expedition_id = 296077,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[78] = {
		id = 78,
		enemy_id = 295078,
		hp = 58000,
		expedition_id = 296078,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[79] = {
		id = 79,
		enemy_id = 295079,
		hp = 70000,
		expedition_id = 296079,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[80] = {
		id = 80,
		enemy_id = 295080,
		hp = 110000,
		expedition_id = 296080,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[81] = {
		id = 81,
		enemy_id = 295081,
		hp = 150000,
		expedition_id = 296081,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[82] = {
		id = 82,
		enemy_id = 295082,
		hp = 230000,
		expedition_id = 296082,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[83] = {
		id = 83,
		enemy_id = 295083,
		hp = 310000,
		expedition_id = 296083,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[84] = {
		id = 84,
		enemy_id = 295084,
		hp = 390000,
		expedition_id = 296084,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[85] = {
		id = 85,
		enemy_id = 295085,
		hp = 480000,
		expedition_id = 296085,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[86] = {
		id = 86,
		enemy_id = 295086,
		hp = 600000,
		expedition_id = 296086,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[87] = {
		id = 87,
		enemy_id = 295087,
		hp = 780000,
		expedition_id = 296087,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[88] = {
		id = 88,
		enemy_id = 295088,
		hp = 1000000,
		expedition_id = 296088,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[89] = {
		id = 89,
		enemy_id = 295089,
		hp = 1240000,
		expedition_id = 296089,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[90] = {
		id = 90,
		enemy_id = 295090,
		hp = 1480000,
		expedition_id = 296090,
		drop_show_self = {
			{
				1,
				3007,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3007,
				100
			}
		}
	}
	pg.base.world_boss_level[91] = {
		id = 91,
		enemy_id = 295091,
		hp = 50000,
		expedition_id = 296091,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[92] = {
		id = 92,
		enemy_id = 295092,
		hp = 54000,
		expedition_id = 296092,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[93] = {
		id = 93,
		enemy_id = 295093,
		hp = 58000,
		expedition_id = 296093,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[94] = {
		id = 94,
		enemy_id = 295094,
		hp = 70000,
		expedition_id = 296094,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[95] = {
		id = 95,
		enemy_id = 295095,
		hp = 110000,
		expedition_id = 296095,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[96] = {
		id = 96,
		enemy_id = 295096,
		hp = 150000,
		expedition_id = 296096,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[97] = {
		id = 97,
		enemy_id = 295097,
		hp = 230000,
		expedition_id = 296097,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[98] = {
		id = 98,
		enemy_id = 295098,
		hp = 310000,
		expedition_id = 296098,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[99] = {
		id = 99,
		enemy_id = 295099,
		hp = 390000,
		expedition_id = 296099,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[100] = {
		id = 100,
		enemy_id = 295100,
		hp = 480000,
		expedition_id = 296100,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
end)()
;(function()
	pg.base.world_boss_level[101] = {
		id = 101,
		enemy_id = 295101,
		hp = 600000,
		expedition_id = 296101,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[102] = {
		id = 102,
		enemy_id = 295102,
		hp = 780000,
		expedition_id = 296102,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[103] = {
		id = 103,
		enemy_id = 295103,
		hp = 1000000,
		expedition_id = 296103,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[104] = {
		id = 104,
		enemy_id = 295104,
		hp = 1240000,
		expedition_id = 296104,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[105] = {
		id = 105,
		enemy_id = 295105,
		hp = 1480000,
		expedition_id = 296105,
		drop_show_self = {
			{
				1,
				3008,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3008,
				100
			}
		}
	}
	pg.base.world_boss_level[106] = {
		id = 106,
		enemy_id = 295106,
		hp = 50000,
		expedition_id = 296106,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[107] = {
		id = 107,
		enemy_id = 295107,
		hp = 54000,
		expedition_id = 296107,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[108] = {
		id = 108,
		enemy_id = 295108,
		hp = 58000,
		expedition_id = 296108,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[109] = {
		id = 109,
		enemy_id = 295109,
		hp = 70000,
		expedition_id = 296109,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[110] = {
		id = 110,
		enemy_id = 295110,
		hp = 110000,
		expedition_id = 296110,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[111] = {
		id = 111,
		enemy_id = 295111,
		hp = 150000,
		expedition_id = 296111,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[112] = {
		id = 112,
		enemy_id = 295112,
		hp = 230000,
		expedition_id = 296112,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[113] = {
		id = 113,
		enemy_id = 295113,
		hp = 310000,
		expedition_id = 296113,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[114] = {
		id = 114,
		enemy_id = 295114,
		hp = 390000,
		expedition_id = 296114,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[115] = {
		id = 115,
		enemy_id = 295115,
		hp = 480000,
		expedition_id = 296115,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[116] = {
		id = 116,
		enemy_id = 295116,
		hp = 600000,
		expedition_id = 296116,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[117] = {
		id = 117,
		enemy_id = 295117,
		hp = 780000,
		expedition_id = 296117,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[118] = {
		id = 118,
		enemy_id = 295118,
		hp = 1000000,
		expedition_id = 296118,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[119] = {
		id = 119,
		enemy_id = 295119,
		hp = 1240000,
		expedition_id = 296119,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[120] = {
		id = 120,
		enemy_id = 295120,
		hp = 1480000,
		expedition_id = 296120,
		drop_show_self = {
			{
				1,
				3009,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3009,
				100
			}
		}
	}
	pg.base.world_boss_level[121] = {
		id = 121,
		enemy_id = 295121,
		hp = 54000,
		expedition_id = 296121,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[122] = {
		id = 122,
		enemy_id = 295122,
		hp = 58000,
		expedition_id = 296122,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[123] = {
		id = 123,
		enemy_id = 295123,
		hp = 63000,
		expedition_id = 296123,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[124] = {
		id = 124,
		enemy_id = 295124,
		hp = 76000,
		expedition_id = 296124,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[125] = {
		id = 125,
		enemy_id = 295125,
		hp = 120000,
		expedition_id = 296125,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[126] = {
		id = 126,
		enemy_id = 295126,
		hp = 160000,
		expedition_id = 296126,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[127] = {
		id = 127,
		enemy_id = 295127,
		hp = 250000,
		expedition_id = 296127,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[128] = {
		id = 128,
		enemy_id = 295128,
		hp = 340000,
		expedition_id = 296128,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[129] = {
		id = 129,
		enemy_id = 295129,
		hp = 420000,
		expedition_id = 296129,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[130] = {
		id = 130,
		enemy_id = 295130,
		hp = 520000,
		expedition_id = 296130,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[131] = {
		id = 131,
		enemy_id = 295131,
		hp = 650000,
		expedition_id = 296131,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[132] = {
		id = 132,
		enemy_id = 295132,
		hp = 840000,
		expedition_id = 296132,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[133] = {
		id = 133,
		enemy_id = 295133,
		hp = 1080000,
		expedition_id = 296133,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[134] = {
		id = 134,
		enemy_id = 295134,
		hp = 1340000,
		expedition_id = 296134,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[135] = {
		id = 135,
		enemy_id = 295135,
		hp = 1600000,
		expedition_id = 296135,
		drop_show_self = {
			{
				1,
				3010,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3010,
				100
			}
		}
	}
	pg.base.world_boss_level[136] = {
		id = 136,
		enemy_id = 295136,
		hp = 54000,
		expedition_id = 296136,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[137] = {
		id = 137,
		enemy_id = 295137,
		hp = 58000,
		expedition_id = 296137,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[138] = {
		id = 138,
		enemy_id = 295138,
		hp = 63000,
		expedition_id = 296138,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[139] = {
		id = 139,
		enemy_id = 295139,
		hp = 76000,
		expedition_id = 296139,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[140] = {
		id = 140,
		enemy_id = 295140,
		hp = 120000,
		expedition_id = 296140,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[141] = {
		id = 141,
		enemy_id = 295141,
		hp = 160000,
		expedition_id = 296141,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[142] = {
		id = 142,
		enemy_id = 295142,
		hp = 250000,
		expedition_id = 296142,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[143] = {
		id = 143,
		enemy_id = 295143,
		hp = 340000,
		expedition_id = 296143,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[144] = {
		id = 144,
		enemy_id = 295144,
		hp = 420000,
		expedition_id = 296144,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[145] = {
		id = 145,
		enemy_id = 295145,
		hp = 520000,
		expedition_id = 296145,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[146] = {
		id = 146,
		enemy_id = 295146,
		hp = 650000,
		expedition_id = 296146,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[147] = {
		id = 147,
		enemy_id = 295147,
		hp = 840000,
		expedition_id = 296147,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[148] = {
		id = 148,
		enemy_id = 295148,
		hp = 1080000,
		expedition_id = 296148,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[149] = {
		id = 149,
		enemy_id = 295149,
		hp = 1340000,
		expedition_id = 296149,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[150] = {
		id = 150,
		enemy_id = 295150,
		hp = 1600000,
		expedition_id = 296150,
		drop_show_self = {
			{
				1,
				3011,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3011,
				100
			}
		}
	}
	pg.base.world_boss_level[151] = {
		id = 151,
		enemy_id = 295151,
		hp = 50000,
		expedition_id = 296151,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[152] = {
		id = 152,
		enemy_id = 295152,
		hp = 54000,
		expedition_id = 296152,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[153] = {
		id = 153,
		enemy_id = 295153,
		hp = 58000,
		expedition_id = 296153,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[154] = {
		id = 154,
		enemy_id = 295154,
		hp = 70000,
		expedition_id = 296154,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[155] = {
		id = 155,
		enemy_id = 295155,
		hp = 111000,
		expedition_id = 296155,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[156] = {
		id = 156,
		enemy_id = 295156,
		hp = 152000,
		expedition_id = 296156,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[157] = {
		id = 157,
		enemy_id = 295157,
		hp = 233000,
		expedition_id = 296157,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[158] = {
		id = 158,
		enemy_id = 295158,
		hp = 314000,
		expedition_id = 296158,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[159] = {
		id = 159,
		enemy_id = 295159,
		hp = 395000,
		expedition_id = 296159,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[160] = {
		id = 160,
		enemy_id = 295160,
		hp = 486000,
		expedition_id = 296160,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[161] = {
		id = 161,
		enemy_id = 295161,
		hp = 608000,
		expedition_id = 296161,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[162] = {
		id = 162,
		enemy_id = 295162,
		hp = 790000,
		expedition_id = 296162,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[163] = {
		id = 163,
		enemy_id = 295163,
		hp = 1013000,
		expedition_id = 296163,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[164] = {
		id = 164,
		enemy_id = 295164,
		hp = 1256000,
		expedition_id = 296164,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[165] = {
		id = 165,
		enemy_id = 295165,
		hp = 1500000,
		expedition_id = 296165,
		drop_show_self = {
			{
				1,
				3012,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3012,
				100
			}
		}
	}
	pg.base.world_boss_level[166] = {
		id = 166,
		enemy_id = 295166,
		hp = 50000,
		expedition_id = 296166,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[167] = {
		id = 167,
		enemy_id = 295167,
		hp = 54000,
		expedition_id = 296167,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[168] = {
		id = 168,
		enemy_id = 295168,
		hp = 58000,
		expedition_id = 296168,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[169] = {
		id = 169,
		enemy_id = 295169,
		hp = 70000,
		expedition_id = 296169,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[170] = {
		id = 170,
		enemy_id = 295170,
		hp = 110000,
		expedition_id = 296170,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[171] = {
		id = 171,
		enemy_id = 295171,
		hp = 150000,
		expedition_id = 296171,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[172] = {
		id = 172,
		enemy_id = 295172,
		hp = 230000,
		expedition_id = 296172,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[173] = {
		id = 173,
		enemy_id = 295173,
		hp = 310000,
		expedition_id = 296173,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[174] = {
		id = 174,
		enemy_id = 295174,
		hp = 390000,
		expedition_id = 296174,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[175] = {
		id = 175,
		enemy_id = 295175,
		hp = 480000,
		expedition_id = 296175,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[176] = {
		id = 176,
		enemy_id = 295176,
		hp = 600000,
		expedition_id = 296176,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[177] = {
		id = 177,
		enemy_id = 295177,
		hp = 760000,
		expedition_id = 296177,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[178] = {
		id = 178,
		enemy_id = 295178,
		hp = 950000,
		expedition_id = 296178,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[179] = {
		id = 179,
		enemy_id = 295179,
		hp = 1170000,
		expedition_id = 296179,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[180] = {
		id = 180,
		enemy_id = 295180,
		hp = 1420000,
		expedition_id = 296180,
		drop_show_self = {
			{
				1,
				3013,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3013,
				100
			}
		}
	}
	pg.base.world_boss_level[181] = {
		id = 181,
		enemy_id = 295181,
		hp = 50000,
		expedition_id = 296181,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[182] = {
		id = 182,
		enemy_id = 295182,
		hp = 54000,
		expedition_id = 296182,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[183] = {
		id = 183,
		enemy_id = 295183,
		hp = 58000,
		expedition_id = 296183,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[184] = {
		id = 184,
		enemy_id = 295184,
		hp = 70000,
		expedition_id = 296184,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[185] = {
		id = 185,
		enemy_id = 295185,
		hp = 110000,
		expedition_id = 296185,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[186] = {
		id = 186,
		enemy_id = 295186,
		hp = 150000,
		expedition_id = 296186,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[187] = {
		id = 187,
		enemy_id = 295187,
		hp = 230000,
		expedition_id = 296187,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[188] = {
		id = 188,
		enemy_id = 295188,
		hp = 310000,
		expedition_id = 296188,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[189] = {
		id = 189,
		enemy_id = 295189,
		hp = 390000,
		expedition_id = 296189,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[190] = {
		id = 190,
		enemy_id = 295190,
		hp = 480000,
		expedition_id = 296190,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[191] = {
		id = 191,
		enemy_id = 295191,
		hp = 600000,
		expedition_id = 296191,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[192] = {
		id = 192,
		enemy_id = 295192,
		hp = 760000,
		expedition_id = 296192,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[193] = {
		id = 193,
		enemy_id = 295193,
		hp = 950000,
		expedition_id = 296193,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[194] = {
		id = 194,
		enemy_id = 295194,
		hp = 1170000,
		expedition_id = 296194,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[195] = {
		id = 195,
		enemy_id = 295195,
		hp = 1420000,
		expedition_id = 296195,
		drop_show_self = {
			{
				1,
				3014,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3014,
				100
			}
		}
	}
	pg.base.world_boss_level[196] = {
		id = 196,
		enemy_id = 295196,
		hp = 383000,
		expedition_id = 296196,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[197] = {
		id = 197,
		enemy_id = 295197,
		hp = 435000,
		expedition_id = 296197,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[198] = {
		id = 198,
		enemy_id = 295198,
		hp = 491000,
		expedition_id = 296198,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[199] = {
		id = 199,
		enemy_id = 295199,
		hp = 547000,
		expedition_id = 296199,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[200] = {
		id = 200,
		enemy_id = 295200,
		hp = 599000,
		expedition_id = 296200,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
end)()
;(function()
	pg.base.world_boss_level[201] = {
		id = 201,
		enemy_id = 295201,
		hp = 655000,
		expedition_id = 296201,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[202] = {
		id = 202,
		enemy_id = 295202,
		hp = 711000,
		expedition_id = 296202,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[203] = {
		id = 203,
		enemy_id = 295203,
		hp = 766000,
		expedition_id = 296203,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[204] = {
		id = 204,
		enemy_id = 295204,
		hp = 819000,
		expedition_id = 296204,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[205] = {
		id = 205,
		enemy_id = 295205,
		hp = 874000,
		expedition_id = 296205,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[206] = {
		id = 206,
		enemy_id = 295206,
		hp = 930000,
		expedition_id = 296206,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[207] = {
		id = 207,
		enemy_id = 295207,
		hp = 983000,
		expedition_id = 296207,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[208] = {
		id = 208,
		enemy_id = 295208,
		hp = 1038000,
		expedition_id = 296208,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[209] = {
		id = 209,
		enemy_id = 295209,
		hp = 1094000,
		expedition_id = 296209,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[210] = {
		id = 210,
		enemy_id = 295210,
		hp = 1150000,
		expedition_id = 296210,
		drop_show_self = {
			{
				1,
				3015,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3015,
				100
			}
		}
	}
	pg.base.world_boss_level[211] = {
		id = 211,
		enemy_id = 295211,
		hp = 45000,
		expedition_id = 296211,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[212] = {
		id = 212,
		enemy_id = 295212,
		hp = 49000,
		expedition_id = 296212,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[213] = {
		id = 213,
		enemy_id = 295213,
		hp = 52000,
		expedition_id = 296213,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[214] = {
		id = 214,
		enemy_id = 295214,
		hp = 63000,
		expedition_id = 296214,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[215] = {
		id = 215,
		enemy_id = 295215,
		hp = 100000,
		expedition_id = 296215,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[216] = {
		id = 216,
		enemy_id = 295216,
		hp = 136000,
		expedition_id = 296216,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[217] = {
		id = 217,
		enemy_id = 295217,
		hp = 209000,
		expedition_id = 296217,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[218] = {
		id = 218,
		enemy_id = 295218,
		hp = 282000,
		expedition_id = 296218,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[219] = {
		id = 219,
		enemy_id = 295219,
		hp = 355000,
		expedition_id = 296219,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[220] = {
		id = 220,
		enemy_id = 295220,
		hp = 437000,
		expedition_id = 296220,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[221] = {
		id = 221,
		enemy_id = 295221,
		hp = 547000,
		expedition_id = 296221,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[222] = {
		id = 222,
		enemy_id = 295222,
		hp = 711000,
		expedition_id = 296222,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[223] = {
		id = 223,
		enemy_id = 295223,
		hp = 912000,
		expedition_id = 296223,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[224] = {
		id = 224,
		enemy_id = 295224,
		hp = 1131000,
		expedition_id = 296224,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[225] = {
		id = 225,
		enemy_id = 295225,
		hp = 1350000,
		expedition_id = 296225,
		drop_show_self = {
			{
				1,
				3016,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3016,
				100
			}
		}
	}
	pg.base.world_boss_level[226] = {
		id = 226,
		enemy_id = 295226,
		hp = 50000,
		expedition_id = 296226,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[227] = {
		id = 227,
		enemy_id = 295227,
		hp = 54000,
		expedition_id = 296227,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[228] = {
		id = 228,
		enemy_id = 295228,
		hp = 58000,
		expedition_id = 296228,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[229] = {
		id = 229,
		enemy_id = 295229,
		hp = 70000,
		expedition_id = 296229,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[230] = {
		id = 230,
		enemy_id = 295230,
		hp = 110000,
		expedition_id = 296230,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[231] = {
		id = 231,
		enemy_id = 295231,
		hp = 150000,
		expedition_id = 296231,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[232] = {
		id = 232,
		enemy_id = 295232,
		hp = 230000,
		expedition_id = 296232,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[233] = {
		id = 233,
		enemy_id = 295233,
		hp = 310000,
		expedition_id = 296233,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[234] = {
		id = 234,
		enemy_id = 295234,
		hp = 390000,
		expedition_id = 296234,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[235] = {
		id = 235,
		enemy_id = 295235,
		hp = 480000,
		expedition_id = 296235,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[236] = {
		id = 236,
		enemy_id = 295236,
		hp = 600000,
		expedition_id = 296236,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[237] = {
		id = 237,
		enemy_id = 295237,
		hp = 760000,
		expedition_id = 296237,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[238] = {
		id = 238,
		enemy_id = 295238,
		hp = 950000,
		expedition_id = 296238,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[239] = {
		id = 239,
		enemy_id = 295239,
		hp = 1170000,
		expedition_id = 296239,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[240] = {
		id = 240,
		enemy_id = 295240,
		hp = 1420000,
		expedition_id = 296240,
		drop_show_self = {
			{
				1,
				3017,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3017,
				100
			}
		}
	}
	pg.base.world_boss_level[241] = {
		id = 241,
		enemy_id = 295241,
		hp = 54000,
		expedition_id = 296241,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[242] = {
		id = 242,
		enemy_id = 295242,
		hp = 58000,
		expedition_id = 296242,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[243] = {
		id = 243,
		enemy_id = 295243,
		hp = 62000,
		expedition_id = 296243,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[244] = {
		id = 244,
		enemy_id = 295244,
		hp = 75000,
		expedition_id = 296244,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[245] = {
		id = 245,
		enemy_id = 295245,
		hp = 118000,
		expedition_id = 296245,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[246] = {
		id = 246,
		enemy_id = 295246,
		hp = 162000,
		expedition_id = 296246,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[247] = {
		id = 247,
		enemy_id = 295247,
		hp = 248000,
		expedition_id = 296247,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[248] = {
		id = 248,
		enemy_id = 295248,
		hp = 335000,
		expedition_id = 296248,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[249] = {
		id = 249,
		enemy_id = 295249,
		hp = 421000,
		expedition_id = 296249,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[250] = {
		id = 250,
		enemy_id = 295250,
		hp = 518000,
		expedition_id = 296250,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[251] = {
		id = 251,
		enemy_id = 295251,
		hp = 648000,
		expedition_id = 296251,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[252] = {
		id = 252,
		enemy_id = 295252,
		hp = 843000,
		expedition_id = 296252,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[253] = {
		id = 253,
		enemy_id = 295253,
		hp = 1081000,
		expedition_id = 296253,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[254] = {
		id = 254,
		enemy_id = 295254,
		hp = 1340000,
		expedition_id = 296254,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[255] = {
		id = 255,
		enemy_id = 295255,
		hp = 1600000,
		expedition_id = 296255,
		drop_show_self = {
			{
				1,
				3018,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3018,
				100
			}
		}
	}
	pg.base.world_boss_level[256] = {
		id = 256,
		enemy_id = 295256,
		hp = 43000,
		expedition_id = 296256,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[257] = {
		id = 257,
		enemy_id = 295257,
		hp = 46000,
		expedition_id = 296257,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[258] = {
		id = 258,
		enemy_id = 295258,
		hp = 50000,
		expedition_id = 296258,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[259] = {
		id = 259,
		enemy_id = 295259,
		hp = 60000,
		expedition_id = 296259,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[260] = {
		id = 260,
		enemy_id = 295260,
		hp = 95000,
		expedition_id = 296260,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[261] = {
		id = 261,
		enemy_id = 295261,
		hp = 129000,
		expedition_id = 296261,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[262] = {
		id = 262,
		enemy_id = 295262,
		hp = 198000,
		expedition_id = 296262,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[263] = {
		id = 263,
		enemy_id = 295263,
		hp = 268000,
		expedition_id = 296263,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[264] = {
		id = 264,
		enemy_id = 295264,
		hp = 337000,
		expedition_id = 296264,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[265] = {
		id = 265,
		enemy_id = 295265,
		hp = 415000,
		expedition_id = 296265,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[266] = {
		id = 266,
		enemy_id = 295266,
		hp = 518000,
		expedition_id = 296266,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[267] = {
		id = 267,
		enemy_id = 295267,
		hp = 674000,
		expedition_id = 296267,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[268] = {
		id = 268,
		enemy_id = 295268,
		hp = 864000,
		expedition_id = 296268,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[269] = {
		id = 269,
		enemy_id = 295269,
		hp = 1072000,
		expedition_id = 296269,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[270] = {
		id = 270,
		enemy_id = 295270,
		hp = 1280000,
		expedition_id = 296270,
		drop_show_self = {
			{
				1,
				3019,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3019,
				100
			}
		}
	}
	pg.base.world_boss_level[271] = {
		id = 271,
		enemy_id = 295271,
		hp = 54000,
		expedition_id = 296271,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[272] = {
		id = 272,
		enemy_id = 295272,
		hp = 58000,
		expedition_id = 296272,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[273] = {
		id = 273,
		enemy_id = 295273,
		hp = 62000,
		expedition_id = 296273,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[274] = {
		id = 274,
		enemy_id = 295274,
		hp = 75000,
		expedition_id = 296274,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[275] = {
		id = 275,
		enemy_id = 295275,
		hp = 118000,
		expedition_id = 296275,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[276] = {
		id = 276,
		enemy_id = 295276,
		hp = 162000,
		expedition_id = 296276,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[277] = {
		id = 277,
		enemy_id = 295277,
		hp = 248000,
		expedition_id = 296277,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[278] = {
		id = 278,
		enemy_id = 295278,
		hp = 335000,
		expedition_id = 296278,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[279] = {
		id = 279,
		enemy_id = 295279,
		hp = 421000,
		expedition_id = 296279,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[280] = {
		id = 280,
		enemy_id = 295280,
		hp = 518000,
		expedition_id = 296280,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[281] = {
		id = 281,
		enemy_id = 295281,
		hp = 648000,
		expedition_id = 296281,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[282] = {
		id = 282,
		enemy_id = 295282,
		hp = 843000,
		expedition_id = 296282,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[283] = {
		id = 283,
		enemy_id = 295283,
		hp = 1081000,
		expedition_id = 296283,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[284] = {
		id = 284,
		enemy_id = 295284,
		hp = 1340000,
		expedition_id = 296284,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[285] = {
		id = 285,
		enemy_id = 295285,
		hp = 1600000,
		expedition_id = 296285,
		drop_show_self = {
			{
				1,
				3020,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3020,
				100
			}
		}
	}
	pg.base.world_boss_level[286] = {
		id = 286,
		enemy_id = 295286,
		hp = 52000,
		expedition_id = 296286,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[287] = {
		id = 287,
		enemy_id = 295287,
		hp = 56000,
		expedition_id = 296287,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[288] = {
		id = 288,
		enemy_id = 295288,
		hp = 60000,
		expedition_id = 296288,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[289] = {
		id = 289,
		enemy_id = 295289,
		hp = 72000,
		expedition_id = 296289,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[290] = {
		id = 290,
		enemy_id = 295290,
		hp = 114000,
		expedition_id = 296290,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[291] = {
		id = 291,
		enemy_id = 295291,
		hp = 156000,
		expedition_id = 296291,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[292] = {
		id = 292,
		enemy_id = 295292,
		hp = 239000,
		expedition_id = 296292,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[293] = {
		id = 293,
		enemy_id = 295293,
		hp = 322000,
		expedition_id = 296293,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[294] = {
		id = 294,
		enemy_id = 295294,
		hp = 405000,
		expedition_id = 296294,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[295] = {
		id = 295,
		enemy_id = 295295,
		hp = 499000,
		expedition_id = 296295,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[296] = {
		id = 296,
		enemy_id = 295296,
		hp = 624000,
		expedition_id = 296296,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[297] = {
		id = 297,
		enemy_id = 295297,
		hp = 811000,
		expedition_id = 296297,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[298] = {
		id = 298,
		enemy_id = 295298,
		hp = 1040000,
		expedition_id = 296298,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[299] = {
		id = 299,
		enemy_id = 295299,
		hp = 1290000,
		expedition_id = 296299,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
	pg.base.world_boss_level[300] = {
		id = 300,
		enemy_id = 295300,
		hp = 1540000,
		expedition_id = 296300,
		drop_show_self = {
			{
				1,
				3021,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3021,
				100
			}
		}
	}
end)()
;(function()
	pg.base.world_boss_level[301] = {
		id = 301,
		enemy_id = 295301,
		hp = 50000,
		expedition_id = 296301,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[302] = {
		id = 302,
		enemy_id = 295302,
		hp = 54000,
		expedition_id = 296302,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[303] = {
		id = 303,
		enemy_id = 295303,
		hp = 58000,
		expedition_id = 296303,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[304] = {
		id = 304,
		enemy_id = 295304,
		hp = 70000,
		expedition_id = 296304,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[305] = {
		id = 305,
		enemy_id = 295305,
		hp = 111000,
		expedition_id = 296305,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[306] = {
		id = 306,
		enemy_id = 295306,
		hp = 152000,
		expedition_id = 296306,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[307] = {
		id = 307,
		enemy_id = 295307,
		hp = 233000,
		expedition_id = 296307,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[308] = {
		id = 308,
		enemy_id = 295308,
		hp = 314000,
		expedition_id = 296308,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[309] = {
		id = 309,
		enemy_id = 295309,
		hp = 395000,
		expedition_id = 296309,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[310] = {
		id = 310,
		enemy_id = 295310,
		hp = 486000,
		expedition_id = 296310,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[311] = {
		id = 311,
		enemy_id = 295311,
		hp = 608000,
		expedition_id = 296311,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[312] = {
		id = 312,
		enemy_id = 295312,
		hp = 790000,
		expedition_id = 296312,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[313] = {
		id = 313,
		enemy_id = 295313,
		hp = 1013000,
		expedition_id = 296313,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[314] = {
		id = 314,
		enemy_id = 295314,
		hp = 1256000,
		expedition_id = 296314,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[315] = {
		id = 315,
		enemy_id = 295315,
		hp = 1500000,
		expedition_id = 296315,
		drop_show_self = {
			{
				1,
				3022,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3022,
				100
			}
		}
	}
	pg.base.world_boss_level[316] = {
		id = 316,
		enemy_id = 295316,
		hp = 60000,
		expedition_id = 296316,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[317] = {
		id = 317,
		enemy_id = 295317,
		hp = 64000,
		expedition_id = 296317,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[318] = {
		id = 318,
		enemy_id = 295318,
		hp = 69000,
		expedition_id = 296318,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[319] = {
		id = 319,
		enemy_id = 295319,
		hp = 84000,
		expedition_id = 296319,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[320] = {
		id = 320,
		enemy_id = 295320,
		hp = 132000,
		expedition_id = 296320,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[321] = {
		id = 321,
		enemy_id = 295321,
		hp = 180000,
		expedition_id = 296321,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[322] = {
		id = 322,
		enemy_id = 295322,
		hp = 276000,
		expedition_id = 296322,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[323] = {
		id = 323,
		enemy_id = 295323,
		hp = 372000,
		expedition_id = 296323,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[324] = {
		id = 324,
		enemy_id = 295324,
		hp = 469000,
		expedition_id = 296324,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[325] = {
		id = 325,
		enemy_id = 295325,
		hp = 577000,
		expedition_id = 296325,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[326] = {
		id = 326,
		enemy_id = 295326,
		hp = 721000,
		expedition_id = 296326,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[327] = {
		id = 327,
		enemy_id = 295327,
		hp = 938000,
		expedition_id = 296327,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[328] = {
		id = 328,
		enemy_id = 295328,
		hp = 1202000,
		expedition_id = 296328,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[329] = {
		id = 329,
		enemy_id = 295329,
		hp = 1491000,
		expedition_id = 296329,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[330] = {
		id = 330,
		enemy_id = 295330,
		hp = 1780000,
		expedition_id = 296330,
		drop_show_self = {
			{
				1,
				3023,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3023,
				100
			}
		}
	}
	pg.base.world_boss_level[331] = {
		id = 331,
		enemy_id = 295331,
		hp = 54000,
		expedition_id = 296331,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[332] = {
		id = 332,
		enemy_id = 295332,
		hp = 58000,
		expedition_id = 296332,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[333] = {
		id = 333,
		enemy_id = 295333,
		hp = 62000,
		expedition_id = 296333,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[334] = {
		id = 334,
		enemy_id = 295334,
		hp = 75000,
		expedition_id = 296334,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[335] = {
		id = 335,
		enemy_id = 295335,
		hp = 118000,
		expedition_id = 296335,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[336] = {
		id = 336,
		enemy_id = 295336,
		hp = 162000,
		expedition_id = 296336,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[337] = {
		id = 337,
		enemy_id = 295337,
		hp = 248000,
		expedition_id = 296337,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[338] = {
		id = 338,
		enemy_id = 295338,
		hp = 335000,
		expedition_id = 296338,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[339] = {
		id = 339,
		enemy_id = 295339,
		hp = 421000,
		expedition_id = 296339,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[340] = {
		id = 340,
		enemy_id = 295340,
		hp = 518000,
		expedition_id = 296340,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[341] = {
		id = 341,
		enemy_id = 295341,
		hp = 648000,
		expedition_id = 296341,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[342] = {
		id = 342,
		enemy_id = 295342,
		hp = 843000,
		expedition_id = 296342,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[343] = {
		id = 343,
		enemy_id = 295343,
		hp = 1081000,
		expedition_id = 296343,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[344] = {
		id = 344,
		enemy_id = 295344,
		hp = 1340000,
		expedition_id = 296344,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[345] = {
		id = 345,
		enemy_id = 295345,
		hp = 1600000,
		expedition_id = 296345,
		drop_show_self = {
			{
				1,
				3024,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3024,
				100
			}
		}
	}
	pg.base.world_boss_level[346] = {
		id = 346,
		enemy_id = 295346,
		hp = 61000,
		expedition_id = 296346,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[347] = {
		id = 347,
		enemy_id = 295347,
		hp = 66000,
		expedition_id = 296347,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[348] = {
		id = 348,
		enemy_id = 295348,
		hp = 71000,
		expedition_id = 296348,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[349] = {
		id = 349,
		enemy_id = 295349,
		hp = 86000,
		expedition_id = 296349,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[350] = {
		id = 350,
		enemy_id = 295350,
		hp = 135000,
		expedition_id = 296350,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[351] = {
		id = 351,
		enemy_id = 295351,
		hp = 184000,
		expedition_id = 296351,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[352] = {
		id = 352,
		enemy_id = 295352,
		hp = 282000,
		expedition_id = 296352,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[353] = {
		id = 353,
		enemy_id = 295353,
		hp = 381000,
		expedition_id = 296353,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[354] = {
		id = 354,
		enemy_id = 295354,
		hp = 479000,
		expedition_id = 296354,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[355] = {
		id = 355,
		enemy_id = 295355,
		hp = 590000,
		expedition_id = 296355,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[356] = {
		id = 356,
		enemy_id = 295356,
		hp = 737000,
		expedition_id = 296356,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[357] = {
		id = 357,
		enemy_id = 295357,
		hp = 959000,
		expedition_id = 296357,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[358] = {
		id = 358,
		enemy_id = 295358,
		hp = 1229000,
		expedition_id = 296358,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[359] = {
		id = 359,
		enemy_id = 295359,
		hp = 1524000,
		expedition_id = 296359,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
	pg.base.world_boss_level[360] = {
		id = 360,
		enemy_id = 295360,
		hp = 1820000,
		expedition_id = 296360,
		drop_show_self = {
			{
				1,
				3025,
				100
			}
		},
		drop_show_other = {
			{
				1,
				3025,
				100
			}
		}
	}
end)()
