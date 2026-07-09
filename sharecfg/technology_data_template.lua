pg = pg or {}
pg.technology_data_template = rawget(pg, "technology_data_template") or setmetatable({
	__name = "technology_data_template"
}, confNEO)
pg.technology_data_template.all = {
	1,
	2,
	3,
	4,
	11,
	12,
	13,
	14,
	15,
	16,
	17,
	18,
	21,
	22,
	23,
	31,
	32,
	33,
	34,
	35,
	36,
	37,
	38,
	41,
	42,
	43,
	44,
	45,
	46,
	51,
	52,
	53,
	54,
	55,
	56,
	61,
	62,
	63,
	64,
	65,
	66,
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
	91,
	92,
	93,
	94,
	101,
	102,
	103,
	104,
	111,
	112,
	113,
	114,
	115,
	116,
	117,
	118,
	121,
	122,
	123,
	131,
	132,
	133,
	134,
	135,
	136,
	137,
	141,
	142,
	143,
	144,
	145,
	146,
	151,
	152,
	153,
	154,
	155,
	156,
	161,
	162,
	163,
	164,
	165,
	166,
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
	191,
	192,
	193,
	194,
	201,
	202,
	203,
	204,
	211,
	212,
	213,
	214,
	215,
	216,
	217,
	218,
	221,
	222,
	223,
	231,
	232,
	233,
	234,
	235,
	236,
	237,
	241,
	242,
	243,
	244,
	245,
	246,
	251,
	252,
	253,
	254,
	255,
	261,
	262,
	263,
	264,
	265,
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
	291,
	292,
	293,
	294,
	301,
	302,
	303,
	304,
	311,
	312,
	313,
	314,
	315,
	316,
	317,
	318,
	321,
	322,
	323,
	331,
	332,
	333,
	334,
	335,
	336,
	337,
	341,
	342,
	343,
	344,
	345,
	346,
	351,
	352,
	353,
	354,
	355,
	361,
	362,
	363,
	364,
	365,
	371,
	372,
	373,
	374,
	375,
	376,
	377,
	378,
	379,
	380,
	381,
	382,
	383,
	384,
	385,
	391,
	392,
	393,
	394,
	401,
	402,
	403,
	404,
	411,
	412,
	413,
	414,
	415,
	416,
	417,
	418,
	421,
	422,
	423,
	431,
	432,
	433,
	434,
	435,
	436,
	437,
	441,
	442,
	443,
	444,
	445,
	446,
	451,
	452,
	453,
	454,
	455,
	461,
	462,
	463,
	464,
	465,
	471,
	472,
	473,
	474,
	475,
	476,
	477,
	478,
	479,
	480,
	481,
	482,
	483,
	484,
	485,
	491,
	492,
	493,
	494,
	501,
	502,
	503,
	504,
	511,
	512,
	513,
	514,
	515,
	516,
	517,
	518,
	521,
	522,
	523,
	531,
	532,
	533,
	534,
	535,
	536,
	537,
	541,
	542,
	543,
	544,
	545,
	546,
	551,
	552,
	553,
	554,
	555,
	561,
	562,
	563,
	564,
	565,
	571,
	572,
	573,
	574,
	575,
	576,
	577,
	578,
	579,
	580,
	581,
	582,
	583,
	584,
	585,
	591,
	592,
	593,
	594,
	601,
	602,
	603,
	604,
	611,
	612,
	613,
	614,
	615,
	616,
	617,
	618,
	621,
	622,
	623,
	631,
	632,
	633,
	634,
	635,
	636,
	637,
	641,
	642,
	643,
	644,
	645,
	646,
	651,
	652,
	653,
	654,
	655,
	661,
	662,
	663,
	664,
	665,
	671,
	672,
	673,
	674,
	675,
	676,
	677,
	678,
	679,
	680,
	681,
	682,
	683,
	684,
	685,
	691,
	692,
	693,
	694,
	701,
	702,
	703,
	704,
	711,
	712,
	713,
	714,
	715,
	716,
	717,
	718,
	721,
	722,
	723,
	731,
	732,
	733,
	734,
	735,
	736,
	737,
	741,
	742,
	743,
	744,
	745,
	746,
	751,
	752,
	753,
	754,
	755,
	761,
	762,
	763,
	764,
	765,
	771,
	772,
	773,
	774,
	775,
	776,
	777,
	778,
	779,
	780,
	781,
	782,
	783,
	784,
	785,
	791,
	792,
	793,
	794,
	801,
	802,
	803,
	804,
	811,
	812,
	813,
	814,
	815,
	816,
	817,
	818,
	821,
	822,
	823,
	831,
	832,
	841,
	842,
	843,
	844,
	845,
	846,
	851,
	852,
	853,
	854,
	855,
	861,
	862,
	863,
	864,
	865,
	871,
	872,
	873,
	874,
	875,
	876,
	877,
	878,
	879,
	880,
	881,
	882,
	883,
	884,
	885,
	891,
	892,
	893,
	894,
	1001,
	1002,
	1003,
	1004,
	1005,
	1006,
	1007,
	1008,
	1009,
	1010,
	1011,
	1012,
	1013,
	1014,
	1015,
	1016,
	1017,
	1018,
	1019,
	1020,
	1021,
	1022,
	1023,
	1024,
	1025,
	1026,
	1031,
	1032,
	1033,
	1034,
	1035,
	1036,
	1101,
	1102,
	1103,
	1104,
	1105,
	1106,
	1107,
	1108,
	1109,
	1110,
	1111,
	1112,
	1113,
	1114,
	1115,
	1116,
	1117,
	1118,
	1119,
	1120,
	1121,
	1122,
	1123,
	1124,
	1125,
	1126,
	1131,
	1132,
	1133,
	1134,
	1135,
	1201,
	1202,
	1203,
	1204,
	1205,
	1206,
	1207,
	1208,
	1209,
	1211,
	1212,
	1213,
	1214,
	1215,
	1216,
	1217,
	1219,
	1220,
	1221,
	1222,
	1223,
	1224,
	1225,
	1226,
	1231,
	1232,
	1233,
	1234,
	1235,
	1301,
	1302,
	1303,
	1304,
	1305,
	1306,
	1307,
	1308,
	1309,
	1311,
	1312,
	1313,
	1314,
	1315,
	1316,
	1317,
	1319,
	1320,
	1321,
	1322,
	1323,
	1324,
	1325,
	1326,
	1331,
	1332,
	1333,
	1334,
	1335,
	1401,
	1402,
	1403,
	1404,
	1405,
	1406,
	1407,
	1408,
	1409,
	1411,
	1412,
	1413,
	1414,
	1415,
	1416,
	1417,
	1419,
	1420,
	1421,
	1422,
	1423,
	1424,
	1425,
	1426,
	1431,
	1432,
	1433,
	1501,
	1502,
	1503,
	1504,
	1505,
	1506,
	1507,
	1508,
	1509,
	1511,
	1512,
	1513,
	1514,
	1515,
	1516,
	1517,
	1519,
	1520,
	1521,
	1522,
	1523,
	1524,
	1525,
	1526,
	1531,
	1532,
	1533,
	1534,
	1535,
	1601,
	1602,
	1603,
	1604,
	1605,
	1606,
	1607,
	1608,
	1609,
	1611,
	1612,
	1613,
	1614,
	1615,
	1616,
	1617,
	1619,
	1620,
	1621,
	1622,
	1623,
	1624,
	1625,
	1626,
	1632,
	1633,
	1634,
	1635,
	1701,
	1702,
	1703,
	1704,
	1705,
	1706,
	1707,
	1708,
	1709,
	1711,
	1712,
	1713,
	1714,
	1715,
	1716,
	1717,
	1719,
	1720,
	1721,
	1722,
	1723,
	1724,
	1725,
	1726,
	1731,
	1732,
	1733,
	1734,
	1735,
	1801,
	1802,
	1803,
	1804,
	1805,
	1806,
	1807,
	1808,
	1809,
	1811,
	1812,
	1813,
	1814,
	1815,
	1816,
	1817,
	1819,
	1820,
	1821,
	1822,
	1823,
	1824,
	1825,
	1826
}
pg.base = pg.base or {}
pg.base.technology_data_template = {}

;(function()
	pg.base.technology_data_template[1] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 1,
		id = 1,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[2] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 1,
		id = 2,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[3] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 1,
		id = 3,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[4] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 1,
		id = 4,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[11] = {
		name = "B-622-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52001,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 11,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[12] = {
		name = "B-636-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52002,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 12,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[13] = {
		name = "B-654-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52003,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 13,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[14] = {
		name = "B-682-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52004,
		bg = "1",
		lv_limit = 40,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 14,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[15] = {
		name = "B-235-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52005,
		bg = "2",
		lv_limit = 50,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 15,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[16] = {
		name = "B-268-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52006,
		bg = "2",
		lv_limit = 60,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 16,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[17] = {
		name = "B-128-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52007,
		bg = "2",
		lv_limit = 65,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 17,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[18] = {
		name = "B-164-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52008,
		bg = "2",
		lv_limit = 70,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 18,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[21] = {
		name = "T-018-MI",
		rarity = 1,
		time = 10800,
		type = 1,
		condition = 52021,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 1,
		id = 21,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[22] = {
		name = "T-384-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52022,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 1,
		id = 22,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[23] = {
		name = "T-249-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 52023,
		bg = "2",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 1,
		id = 23,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[31] = {
		name = "E-031-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 52031,
		bg = "1",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 31,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[32] = {
		name = "E-315-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 52032,
		bg = "2",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 32,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[33] = {
		name = "E-131-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 33,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30023,
				15
			}
		},
		drop_client = {
			{
				2,
				13001,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[34] = {
		name = "E-159-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 34,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30033,
				15
			}
		},
		drop_client = {
			{
				2,
				13003,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[35] = {
		name = "E-174-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 35,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13004,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[36] = {
		name = "E-192-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 36,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13005,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[37] = {
		name = "E-118-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 37,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30023,
				15
			}
		},
		drop_client = {
			{
				2,
				13006,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[38] = {
		name = "E-144-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 38,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30033,
				15
			}
		},
		drop_client = {
			{
				2,
				13008,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[41] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 1,
		id = 41,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[42] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 1,
		id = 42,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[43] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 1,
		id = 43,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[44] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 1,
		id = 44,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[45] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 1,
		id = 45,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[46] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 1,
		id = 46,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[51] = {
		name = "D-718-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 51,
		bg_icon = "chara_haiwangxing",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[52] = {
		name = "D-731-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 52,
		bg_icon = "chara_junzhu",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42002,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[53] = {
		name = "D-744-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 53,
		bg_icon = "chara_yichui",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42003,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[54] = {
		name = "D-759-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 54,
		bg_icon = "chara_chuyun",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42004,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[55] = {
		name = "D-774-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 55,
		bg_icon = "chara_luoen",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42005,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[56] = {
		name = "D-792-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 56,
		bg_icon = "chara_luyijiushi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42006,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[61] = {
		name = "D-318-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 61,
		bg_icon = "chara_haiwangxing",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[62] = {
		name = "D-331-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 62,
		bg_icon = "chara_junzhu",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42002,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[63] = {
		name = "D-344-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 63,
		bg_icon = "chara_yichui",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42003,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[64] = {
		name = "D-359-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 64,
		bg_icon = "chara_chuyun",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42004,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[65] = {
		name = "D-374-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 65,
		bg_icon = "chara_luoen",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42005,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[66] = {
		name = "D-392-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 66,
		bg_icon = "chara_luyijiushi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42006,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[71] = {
		name = "Q-302-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 71,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17001,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[72] = {
		name = "Q-310-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 72,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17011,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[73] = {
		name = "Q-351-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 73,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17021,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[74] = {
		name = "Q-368-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 74,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17031,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[75] = {
		name = "Q-389-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 75,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17041,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[76] = {
		name = "Q-202-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 76,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17002,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[77] = {
		name = "Q-210-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 77,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17012,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[78] = {
		name = "Q-251-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 78,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17022,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[79] = {
		name = "Q-268-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 79,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17032,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[80] = {
		name = "Q-289-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 80,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17042,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[81] = {
		name = "Q-002-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 81,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[82] = {
		name = "Q-010-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 82,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[83] = {
		name = "Q-051-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 83,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[84] = {
		name = "Q-068-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 84,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[85] = {
		name = "Q-089-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 85,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[91] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 1,
		id = 91,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[92] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 1,
		id = 92,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[93] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 1,
		id = 93,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[94] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 1,
		id = 94,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[101] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 2,
		id = 101,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[102] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 2,
		id = 102,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[103] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 2,
		id = 103,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[104] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 2,
		id = 104,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[111] = {
		name = "B-622-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52001,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 111,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[112] = {
		name = "B-636-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52002,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 112,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[113] = {
		name = "B-654-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52003,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 113,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[114] = {
		name = "B-682-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52004,
		bg = "1",
		lv_limit = 40,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 114,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[115] = {
		name = "B-235-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52005,
		bg = "2",
		lv_limit = 50,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 115,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[116] = {
		name = "B-268-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52006,
		bg = "2",
		lv_limit = 60,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 116,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[117] = {
		name = "B-128-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52007,
		bg = "2",
		lv_limit = 65,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 117,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[118] = {
		name = "B-164-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52008,
		bg = "2",
		lv_limit = 70,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 118,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[121] = {
		name = "T-018-MI",
		rarity = 1,
		time = 10800,
		type = 1,
		condition = 52021,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 2,
		id = 121,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[122] = {
		name = "T-384-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52022,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 2,
		id = 122,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[123] = {
		name = "T-249-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 52023,
		bg = "2",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 2,
		id = 123,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[131] = {
		name = "E-031-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 52031,
		bg = "1",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 131,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[132] = {
		name = "E-315-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 52032,
		bg = "2",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 132,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[133] = {
		name = "E-179-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 133,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13013,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[134] = {
		name = "E-105-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 134,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13014,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[135] = {
		name = "E-146-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 135,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30033,
				15
			}
		},
		drop_client = {
			{
				2,
				13015,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[136] = {
		name = "E-157-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 136,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30033,
				15
			}
		},
		drop_client = {
			{
				2,
				13016,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[137] = {
		name = "E-194-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 137,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13017,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[141] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 2,
		id = 141,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[142] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 2,
		id = 142,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[143] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 2,
		id = 143,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[144] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 2,
		id = 144,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[145] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 2,
		id = 145,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[146] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 2,
		id = 146,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[151] = {
		name = "D-705-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 151,
		bg_icon = "chara_xiyatu",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[152] = {
		name = "D-712-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 152,
		bg_icon = "chara_zuozhiya",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42012,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[153] = {
		name = "D-746-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 153,
		bg_icon = "chara_beifeng",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42013,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[154] = {
		name = "D-757-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 154,
		bg_icon = "chara_wuqi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42014,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[155] = {
		name = "D-779-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 155,
		bg_icon = "chara_feiteliedadi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42015,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[156] = {
		name = "D-794-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 156,
		bg_icon = "chara_jiasikenie",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42016,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[161] = {
		name = "D-305-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 161,
		bg_icon = "chara_xiyatu",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[162] = {
		name = "D-312-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 162,
		bg_icon = "chara_zuozhiya",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42012,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[163] = {
		name = "D-346-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 163,
		bg_icon = "chara_beifeng",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42013,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[164] = {
		name = "D-357-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 164,
		bg_icon = "chara_wuqi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42014,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[165] = {
		name = "D-379-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 165,
		bg_icon = "chara_feiteliedadi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42015,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[166] = {
		name = "D-394-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 166,
		bg_icon = "chara_jiasikenie",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42016,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
end)()
;(function()
	pg.base.technology_data_template[171] = {
		name = "Q-302-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 171,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17001,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[172] = {
		name = "Q-310-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 172,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17011,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[173] = {
		name = "Q-351-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 173,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17021,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[174] = {
		name = "Q-368-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 174,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17031,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[175] = {
		name = "Q-389-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 175,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17041,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[176] = {
		name = "Q-202-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 176,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17002,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[177] = {
		name = "Q-210-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 177,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17012,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[178] = {
		name = "Q-251-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 178,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17022,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[179] = {
		name = "Q-268-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 179,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17032,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[180] = {
		name = "Q-289-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 180,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17042,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[181] = {
		name = "Q-002-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 181,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[182] = {
		name = "Q-010-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 182,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[183] = {
		name = "Q-051-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 183,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[184] = {
		name = "Q-068-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 184,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[185] = {
		name = "Q-089-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 185,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[191] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 2,
		id = 191,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[192] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 2,
		id = 192,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[193] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 2,
		id = 193,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[194] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 2,
		id = 194,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[201] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 3,
		id = 201,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[202] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 3,
		id = 202,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[203] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 3,
		id = 203,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[204] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 3,
		id = 204,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[211] = {
		name = "B-622-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52001,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 211,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[212] = {
		name = "B-636-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52002,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 212,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[213] = {
		name = "B-654-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52003,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 213,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[214] = {
		name = "B-682-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52004,
		bg = "1",
		lv_limit = 40,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 214,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[215] = {
		name = "B-235-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52005,
		bg = "2",
		lv_limit = 50,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 215,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[216] = {
		name = "B-268-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52006,
		bg = "2",
		lv_limit = 60,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 216,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[217] = {
		name = "B-128-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52007,
		bg = "2",
		lv_limit = 65,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 217,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[218] = {
		name = "B-164-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52008,
		bg = "2",
		lv_limit = 70,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 218,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[221] = {
		name = "T-018-MI",
		rarity = 1,
		time = 10800,
		type = 1,
		condition = 52021,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 3,
		id = 221,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[222] = {
		name = "T-384-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52022,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 3,
		id = 222,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[223] = {
		name = "T-249-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 52023,
		bg = "2",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 3,
		id = 223,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[231] = {
		name = "E-031-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 52031,
		bg = "1",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 231,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[232] = {
		name = "E-315-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 52032,
		bg = "2",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 232,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[233] = {
		name = "E-121-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 233,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30023,
				15
			}
		},
		drop_client = {
			{
				2,
				13018,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[234] = {
		name = "E-123-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 234,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30023,
				15
			}
		},
		drop_client = {
			{
				2,
				13020,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[235] = {
		name = "E-124-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 235,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30023,
				15
			}
		},
		drop_client = {
			{
				2,
				13021,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[236] = {
		name = "E-177-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 236,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[237] = {
		name = "E-195-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 237,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13023,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[241] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 3,
		id = 241,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[242] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 3,
		id = 242,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[243] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 3,
		id = 243,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[244] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 3,
		id = 244,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[245] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 3,
		id = 245,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[246] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 3,
		id = 246,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[251] = {
		name = "D-721-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 251,
		bg_icon = "chara_chaijun",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[252] = {
		name = "D-722-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 252,
		bg_icon = "chara_deleike",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42022,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[253] = {
		name = "D-772-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 253,
		bg_icon = "chara_meiyinci",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42023,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[254] = {
		name = "D-777-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 254,
		bg_icon = "chara_aoding",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42024,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[255] = {
		name = "D-795-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 255,
		bg_icon = "chara_xiangbin",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42025,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[261] = {
		name = "D-321-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 261,
		bg_icon = "chara_chaijun",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[262] = {
		name = "D-322-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 262,
		bg_icon = "chara_deleike",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42022,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[263] = {
		name = "D-372-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 263,
		bg_icon = "chara_meiyinci",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42023,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[264] = {
		name = "D-377-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 264,
		bg_icon = "chara_aoding",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42024,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[265] = {
		name = "D-395-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 265,
		bg_icon = "chara_xiangbin",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42025,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[271] = {
		name = "Q-302-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 271,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17001,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[272] = {
		name = "Q-310-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 272,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17011,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[273] = {
		name = "Q-351-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 273,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17021,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[274] = {
		name = "Q-368-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 274,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17031,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[275] = {
		name = "Q-389-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 275,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17041,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[276] = {
		name = "Q-202-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 276,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17002,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[277] = {
		name = "Q-210-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 277,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17012,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[278] = {
		name = "Q-251-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 278,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17022,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[279] = {
		name = "Q-268-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 279,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17032,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[280] = {
		name = "Q-289-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 280,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17042,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[281] = {
		name = "Q-002-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 281,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[282] = {
		name = "Q-010-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 282,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[283] = {
		name = "Q-051-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 283,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[284] = {
		name = "Q-068-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 284,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[285] = {
		name = "Q-089-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 285,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[291] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 3,
		id = 291,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[292] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 3,
		id = 292,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[293] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 3,
		id = 293,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[294] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 3,
		id = 294,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[301] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 4,
		id = 301,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[302] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 4,
		id = 302,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[303] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 4,
		id = 303,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[304] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 4,
		id = 304,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[311] = {
		name = "B-622-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52001,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 311,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[312] = {
		name = "B-636-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52002,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 312,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[313] = {
		name = "B-654-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52003,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 313,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[314] = {
		name = "B-682-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52004,
		bg = "1",
		lv_limit = 40,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 314,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[315] = {
		name = "B-235-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52005,
		bg = "2",
		lv_limit = 50,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 315,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[316] = {
		name = "B-268-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52006,
		bg = "2",
		lv_limit = 60,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 316,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[317] = {
		name = "B-128-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52007,
		bg = "2",
		lv_limit = 65,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 317,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[318] = {
		name = "B-164-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52008,
		bg = "2",
		lv_limit = 70,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 318,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[321] = {
		name = "T-018-MI",
		rarity = 1,
		time = 10800,
		type = 1,
		condition = 52021,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 4,
		id = 321,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[322] = {
		name = "T-384-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52022,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 4,
		id = 322,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[323] = {
		name = "T-249-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 52023,
		bg = "2",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 4,
		id = 323,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[331] = {
		name = "E-031-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 52031,
		bg = "1",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 331,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[332] = {
		name = "E-315-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 52032,
		bg = "2",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 332,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[333] = {
		name = "E-175-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 333,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13025,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[334] = {
		name = "E-182-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 334,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13026,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[335] = {
		name = "E-168-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 335,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13027,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[336] = {
		name = "E-108-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 336,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13028,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[337] = {
		name = "E-163-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 337,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30033,
				15
			}
		},
		drop_client = {
			{
				2,
				13029,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[341] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 4,
		id = 341,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[342] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 4,
		id = 342,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
end)()
;(function()
	pg.base.technology_data_template[343] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 4,
		id = 343,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[344] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 4,
		id = 344,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[345] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 4,
		id = 345,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[346] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 4,
		id = 346,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[351] = {
		name = "D-708-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 351,
		bg_icon = "chara_ankeleiqi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[352] = {
		name = "D-763-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 352,
		bg_icon = "chara_bailong",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42032,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[353] = {
		name = "D-775-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 353,
		bg_icon = "chara_aijier",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42033,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[354] = {
		name = "D-782-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 354,
		bg_icon = "chara_aogusite",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42034,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[355] = {
		name = "D-768-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 355,
		bg_icon = "chara_makeboluo",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42035,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[361] = {
		name = "D-308-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 361,
		bg_icon = "chara_ankeleiqi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[362] = {
		name = "D-363-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 362,
		bg_icon = "chara_bailong",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42032,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[363] = {
		name = "D-375-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 363,
		bg_icon = "chara_aijier",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42033,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[364] = {
		name = "D-382-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 364,
		bg_icon = "chara_aogusite",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42034,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[365] = {
		name = "D-368-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 365,
		bg_icon = "chara_makeboluo",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42035,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[371] = {
		name = "Q-302-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 371,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17001,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[372] = {
		name = "Q-310-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 372,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17011,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[373] = {
		name = "Q-351-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 373,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17021,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[374] = {
		name = "Q-368-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 374,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17031,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[375] = {
		name = "Q-389-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 375,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17041,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[376] = {
		name = "Q-202-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 376,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17002,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[377] = {
		name = "Q-210-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 377,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17012,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[378] = {
		name = "Q-251-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 378,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17022,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[379] = {
		name = "Q-268-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 379,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17032,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[380] = {
		name = "Q-289-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 380,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17042,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[381] = {
		name = "Q-002-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 381,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[382] = {
		name = "Q-010-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 382,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[383] = {
		name = "Q-051-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 383,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[384] = {
		name = "Q-068-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 384,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[385] = {
		name = "Q-089-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 385,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[391] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 4,
		id = 391,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[392] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 4,
		id = 392,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[393] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 4,
		id = 393,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[394] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 4,
		id = 394,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[401] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 5,
		id = 401,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[402] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 5,
		id = 402,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[403] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 5,
		id = 403,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[404] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 5,
		id = 404,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[411] = {
		name = "B-622-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52001,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 411,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[412] = {
		name = "B-636-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52002,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 412,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[413] = {
		name = "B-654-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52003,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 413,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[414] = {
		name = "B-682-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52004,
		bg = "1",
		lv_limit = 40,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 414,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[415] = {
		name = "B-235-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52005,
		bg = "2",
		lv_limit = 50,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 415,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[416] = {
		name = "B-268-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52006,
		bg = "2",
		lv_limit = 60,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 416,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[417] = {
		name = "B-128-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52007,
		bg = "2",
		lv_limit = 65,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 417,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[418] = {
		name = "B-164-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52008,
		bg = "2",
		lv_limit = 70,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 418,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[421] = {
		name = "T-018-MI",
		rarity = 1,
		time = 10800,
		type = 1,
		condition = 52021,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 5,
		id = 421,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[422] = {
		name = "T-384-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52022,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 5,
		id = 422,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[423] = {
		name = "T-249-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 52023,
		bg = "2",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 5,
		id = 423,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[431] = {
		name = "E-031-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 52031,
		bg = "1",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 431,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[432] = {
		name = "E-315-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 52032,
		bg = "2",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 432,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[433] = {
		name = "E-193-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 433,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[434] = {
		name = "E-178-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 434,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13035,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[435] = {
		name = "E-186-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 435,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13036,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[436] = {
		name = "E-188-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 436,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13033,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[437] = {
		name = "E-189-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 437,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13034,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[441] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 5,
		id = 441,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[442] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 5,
		id = 442,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[443] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 5,
		id = 443,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[444] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 5,
		id = 444,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[445] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 5,
		id = 445,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[446] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 5,
		id = 446,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[451] = {
		name = "D-719-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 451,
		bg_icon = "chara_pulimaosi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42041,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[452] = {
		name = "D-778-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 452,
		bg_icon = "chara_lupuleixiteqinwang",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42042,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[453] = {
		name = "D-786-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 453,
		bg_icon = "chara_haerbin",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42043,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[454] = {
		name = "D-788-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 454,
		bg_icon = "chara_qikaluofu",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42044,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[455] = {
		name = "D-793-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 455,
		bg_icon = "chara_buleisite",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42045,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[461] = {
		name = "D-319-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 461,
		bg_icon = "chara_pulimaosi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42041,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[462] = {
		name = "D-378-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 462,
		bg_icon = "chara_lupuleixiteqinwang",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42042,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[463] = {
		name = "D-386-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 463,
		bg_icon = "chara_haerbin",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42043,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[464] = {
		name = "D-388-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 464,
		bg_icon = "chara_qikaluofu",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42044,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[465] = {
		name = "D-393-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 465,
		bg_icon = "chara_buleisite",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42045,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[471] = {
		name = "Q-302-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 471,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17001,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[472] = {
		name = "Q-310-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 472,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17011,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[473] = {
		name = "Q-351-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 473,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17021,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[474] = {
		name = "Q-368-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 474,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17031,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[475] = {
		name = "Q-389-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 475,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17041,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[476] = {
		name = "Q-202-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 476,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17002,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[477] = {
		name = "Q-210-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 477,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17012,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[478] = {
		name = "Q-251-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 478,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17022,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[479] = {
		name = "Q-268-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 479,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17032,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[480] = {
		name = "Q-289-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 480,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17042,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[481] = {
		name = "Q-002-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 481,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[482] = {
		name = "Q-010-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 482,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[483] = {
		name = "Q-051-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 483,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[484] = {
		name = "Q-068-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 484,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[485] = {
		name = "Q-089-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 485,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[491] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 5,
		id = 491,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[492] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 5,
		id = 492,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[493] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 5,
		id = 493,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[494] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 5,
		id = 494,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[501] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 6,
		id = 501,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[502] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 6,
		id = 502,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[503] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 6,
		id = 503,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[504] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 6,
		id = 504,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[511] = {
		name = "B-622-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52001,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 511,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[512] = {
		name = "B-636-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52002,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 512,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[513] = {
		name = "B-654-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52003,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 513,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[514] = {
		name = "B-682-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52004,
		bg = "1",
		lv_limit = 40,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 514,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[515] = {
		name = "B-235-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52005,
		bg = "2",
		lv_limit = 50,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 515,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[516] = {
		name = "B-268-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52006,
		bg = "2",
		lv_limit = 60,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 516,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
end)()
;(function()
	pg.base.technology_data_template[517] = {
		name = "B-128-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52007,
		bg = "2",
		lv_limit = 65,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 517,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[518] = {
		name = "B-164-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52008,
		bg = "2",
		lv_limit = 70,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 518,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[521] = {
		name = "T-018-MI",
		rarity = 1,
		time = 10800,
		type = 1,
		condition = 52021,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 6,
		id = 521,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[522] = {
		name = "T-384-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52022,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 6,
		id = 522,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[523] = {
		name = "T-249-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 52023,
		bg = "2",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 6,
		id = 523,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[531] = {
		name = "E-031-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 52031,
		bg = "1",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 531,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[532] = {
		name = "E-315-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 52032,
		bg = "2",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 532,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[533] = {
		name = "E-113-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 533,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13037,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[534] = {
		name = "E-139-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 534,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30033,
				15
			}
		},
		drop_client = {
			{
				2,
				13039,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[535] = {
		name = "E-171-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 535,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13040,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[536] = {
		name = "E-196-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 536,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13041,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[537] = {
		name = "E-184-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 537,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13042,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[541] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 6,
		id = 541,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[542] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 6,
		id = 542,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[543] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 6,
		id = 543,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[544] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 6,
		id = 544,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[545] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 6,
		id = 545,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[546] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 6,
		id = 546,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[551] = {
		name = "D-783-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 551,
		bg_icon = "chara_xingdengbao",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42054,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[552] = {
		name = "D-713-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 552,
		bg_icon = "chara_qiershazhi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42051,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[553] = {
		name = "D-739-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 553,
		bg_icon = "chara_siwanshi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42052,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[554] = {
		name = "D-771-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 554,
		bg_icon = "chara_feilikesishuerci",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42053,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[555] = {
		name = "D-796-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 555,
		bg_icon = "chara_fulandeer",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42055,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[561] = {
		name = "D-383-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 561,
		bg_icon = "chara_xingdengbao",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42054,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[562] = {
		name = "D-313-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 562,
		bg_icon = "chara_qiershazhi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42051,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[563] = {
		name = "D-339-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 563,
		bg_icon = "chara_siwanshi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42052,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[564] = {
		name = "D-371-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 564,
		bg_icon = "chara_feilikesishuerci",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42053,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[565] = {
		name = "D-396-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 565,
		bg_icon = "chara_fulandeer",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42055,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[571] = {
		name = "Q-302-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 571,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17001,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[572] = {
		name = "Q-310-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 572,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17011,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[573] = {
		name = "Q-351-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 573,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17021,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[574] = {
		name = "Q-368-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 574,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17031,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[575] = {
		name = "Q-389-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 575,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17041,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[576] = {
		name = "Q-202-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 576,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17002,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[577] = {
		name = "Q-210-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 577,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17012,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[578] = {
		name = "Q-251-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 578,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17022,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[579] = {
		name = "Q-268-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 579,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17032,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[580] = {
		name = "Q-289-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 580,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17042,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[581] = {
		name = "Q-002-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 581,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[582] = {
		name = "Q-010-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 582,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[583] = {
		name = "Q-051-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 583,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[584] = {
		name = "Q-068-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 584,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[585] = {
		name = "Q-089-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 585,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[591] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 6,
		id = 591,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[592] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 6,
		id = 592,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[593] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 6,
		id = 593,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[594] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 6,
		id = 594,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[601] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 7,
		id = 601,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[602] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 7,
		id = 602,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[603] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 7,
		id = 603,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[604] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 7,
		id = 604,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[611] = {
		name = "B-622-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52001,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 611,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[612] = {
		name = "B-636-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52002,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 612,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[613] = {
		name = "B-654-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52003,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 613,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[614] = {
		name = "B-682-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52004,
		bg = "1",
		lv_limit = 40,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 614,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[615] = {
		name = "B-235-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52005,
		bg = "2",
		lv_limit = 50,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 615,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[616] = {
		name = "B-268-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52006,
		bg = "2",
		lv_limit = 60,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 616,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[617] = {
		name = "B-128-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52007,
		bg = "2",
		lv_limit = 65,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 617,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[618] = {
		name = "B-164-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52008,
		bg = "2",
		lv_limit = 70,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 618,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[621] = {
		name = "T-018-MI",
		rarity = 1,
		time = 10800,
		type = 1,
		condition = 52021,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 7,
		id = 621,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[622] = {
		name = "T-384-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52022,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 7,
		id = 622,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[623] = {
		name = "T-249-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 52023,
		bg = "2",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 7,
		id = 623,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[631] = {
		name = "E-031-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 52031,
		bg = "1",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 631,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[632] = {
		name = "E-315-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 52032,
		bg = "2",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 632,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[633] = {
		name = "E-191-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 633,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13044,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[634] = {
		name = "E-166-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 634,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13045,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[635] = {
		name = "E-167-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 635,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13046,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[636] = {
		name = "E-13-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 636,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13047,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[637] = {
		name = "E-158-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 637,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30033,
				15
			}
		},
		drop_client = {
			{
				2,
				13048,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[641] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 7,
		id = 641,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[642] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 7,
		id = 642,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[643] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 7,
		id = 643,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[644] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 7,
		id = 644,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[645] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 7,
		id = 645,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[646] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 7,
		id = 646,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[651] = {
		name = "D-703-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 651,
		bg_icon = "chara_haerfude",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42061,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[652] = {
		name = "D-758-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 652,
		bg_icon = "chara_dashan",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42062,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[653] = {
		name = "D-766-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 653,
		bg_icon = "chara_nabulesi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42063,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[654] = {
		name = "D-790-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 654,
		bg_icon = "chara_naximofuhaijunshangjiang",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42064,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[655] = {
		name = "D-797-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 655,
		bg_icon = "chara_beiyade",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42065,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[661] = {
		name = "D-303-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 661,
		bg_icon = "chara_haerfude",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42061,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[662] = {
		name = "D-358-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 662,
		bg_icon = "chara_dashan",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42062,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[663] = {
		name = "D-366-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 663,
		bg_icon = "chara_nabulesi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42063,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[664] = {
		name = "D-390-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 664,
		bg_icon = "chara_naximofuhaijunshangjiang",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42064,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[665] = {
		name = "D-397-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 665,
		bg_icon = "chara_beiyade",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42065,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[671] = {
		name = "Q-302-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 671,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17001,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[672] = {
		name = "Q-310-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 672,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17011,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[673] = {
		name = "Q-351-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 673,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17021,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[674] = {
		name = "Q-368-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 674,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17031,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[675] = {
		name = "Q-389-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 675,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17041,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[676] = {
		name = "Q-202-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 676,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17002,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[677] = {
		name = "Q-210-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 677,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17012,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[678] = {
		name = "Q-251-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 678,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17022,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[679] = {
		name = "Q-268-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 679,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17032,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[680] = {
		name = "Q-289-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 680,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17042,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[681] = {
		name = "Q-002-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 681,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[682] = {
		name = "Q-010-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 682,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[683] = {
		name = "Q-051-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 683,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[684] = {
		name = "Q-068-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 684,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[685] = {
		name = "Q-089-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 685,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
end)()
;(function()
	pg.base.technology_data_template[691] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 7,
		id = 691,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[692] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 7,
		id = 692,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[693] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 7,
		id = 693,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[694] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 7,
		id = 694,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[701] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 8,
		id = 701,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[702] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 8,
		id = 702,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[703] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 8,
		id = 703,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[704] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 8,
		id = 704,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[711] = {
		name = "B-622-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52001,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 711,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[712] = {
		name = "B-636-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52002,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 712,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[713] = {
		name = "B-654-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52003,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 713,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[714] = {
		name = "B-682-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52004,
		bg = "1",
		lv_limit = 40,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 714,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[715] = {
		name = "B-235-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52005,
		bg = "2",
		lv_limit = 50,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 715,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[716] = {
		name = "B-268-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52006,
		bg = "2",
		lv_limit = 60,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 716,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[717] = {
		name = "B-128-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52007,
		bg = "2",
		lv_limit = 65,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 717,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[718] = {
		name = "B-164-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52008,
		bg = "2",
		lv_limit = 70,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 718,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[721] = {
		name = "T-018-MI",
		rarity = 1,
		time = 10800,
		type = 1,
		condition = 52021,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 8,
		id = 721,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[722] = {
		name = "T-384-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52022,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 8,
		id = 722,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[723] = {
		name = "T-249-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 52023,
		bg = "2",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 8,
		id = 723,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[731] = {
		name = "E-031-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 52031,
		bg = "1",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 731,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[732] = {
		name = "E-315-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 52032,
		bg = "2",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 732,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[733] = {
		name = "E-180-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 733,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13049,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[734] = {
		name = "E-136-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 734,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13050,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[735] = {
		name = "E-111-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 735,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13051,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[736] = {
		name = "E-164-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 736,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30043,
				15
			}
		},
		drop_client = {
			{
				2,
				13052,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[737] = {
		name = "E-187-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 50,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 737,
		bg_icon = "item_2",
		consume = {
			{
				2,
				30013,
				15
			}
		},
		drop_client = {
			{
				2,
				13054,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[741] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 8,
		id = 741,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[742] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 8,
		id = 742,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[743] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 8,
		id = 743,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[744] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 8,
		id = 744,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[745] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 8,
		id = 745,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[746] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 8,
		id = 746,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[751] = {
		name = "D-780-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 751,
		bg_icon = "chara_meikelunbao",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42072,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[752] = {
		name = "D-736-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 752,
		bg_icon = "chara_jinshi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42075,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[753] = {
		name = "D-787-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 753,
		bg_icon = "chara_dimiteli",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42074,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[754] = {
		name = "D-711-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 754,
		bg_icon = "chara_kansasi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42071,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[755] = {
		name = "D-764-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 755,
		bg_icon = "chara_kunibeierdi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42073,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[761] = {
		name = "D-380-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 761,
		bg_icon = "chara_meikelunbao",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42072,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[762] = {
		name = "D-336-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 762,
		bg_icon = "chara_jinshi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42075,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[763] = {
		name = "D-387-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 763,
		bg_icon = "chara_dimiteli",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42074,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[764] = {
		name = "D-311-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 764,
		bg_icon = "chara_kansasi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42071,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[765] = {
		name = "D-364-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 765,
		bg_icon = "chara_kunibeierdi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42073,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[771] = {
		name = "Q-302-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 771,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17001,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[772] = {
		name = "Q-310-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 772,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17011,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[773] = {
		name = "Q-351-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 773,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17021,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[774] = {
		name = "Q-368-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 774,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17031,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[775] = {
		name = "Q-389-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 775,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17041,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[776] = {
		name = "Q-202-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 776,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17002,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[777] = {
		name = "Q-210-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 777,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17012,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[778] = {
		name = "Q-251-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 778,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17022,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[779] = {
		name = "Q-268-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 779,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17032,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[780] = {
		name = "Q-289-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 780,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17042,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[781] = {
		name = "Q-002-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 781,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[782] = {
		name = "Q-010-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 782,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[783] = {
		name = "Q-051-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 783,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[784] = {
		name = "Q-068-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 784,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[785] = {
		name = "Q-089-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 785,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[791] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 8,
		id = 791,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[792] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 8,
		id = 792,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[793] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 8,
		id = 793,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[794] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 8,
		id = 794,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[801] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 9,
		id = 801,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[802] = {
		name = "C-153-MI",
		rarity = 1,
		time = 21600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 9,
		id = 802,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[803] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 9,
		id = 803,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[804] = {
		name = "C-185-MI",
		rarity = 2,
		time = 28800,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 9,
		id = 804,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[811] = {
		name = "B-622-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52001,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 811,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[812] = {
		name = "B-636-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52002,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 812,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[813] = {
		name = "B-654-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52003,
		bg = "1",
		lv_limit = 30,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 813,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[814] = {
		name = "B-682-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52004,
		bg = "1",
		lv_limit = 40,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 814,
		bg_icon = "battle_1",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[815] = {
		name = "B-235-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52005,
		bg = "2",
		lv_limit = 50,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 815,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[816] = {
		name = "B-268-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52006,
		bg = "2",
		lv_limit = 60,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 816,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[817] = {
		name = "B-128-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52007,
		bg = "2",
		lv_limit = 65,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 817,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[818] = {
		name = "B-164-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 52008,
		bg = "2",
		lv_limit = 70,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 818,
		bg_icon = "battle_2",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[821] = {
		name = "T-018-MI",
		rarity = 1,
		time = 10800,
		type = 1,
		condition = 52021,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 9,
		id = 821,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[822] = {
		name = "T-384-MI",
		rarity = 1,
		time = 14400,
		type = 1,
		condition = 52022,
		bg = "1",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 9,
		id = 822,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[823] = {
		name = "T-249-MI",
		rarity = 2,
		time = 21600,
		type = 1,
		condition = 52023,
		bg = "2",
		lv_limit = 30,
		desc = "除去建造方面，心智魔方在日用性上的研究也被提上了进程。该科研项目希望能够找出心智魔方在日用性上的可能性。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_t",
		blueprint_version = 9,
		id = 823,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[831] = {
		name = "E-031-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 52031,
		bg = "1",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 9,
		id = 831,
		bg_icon = "item_1",
		consume = {},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[832] = {
		name = "E-315-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 52032,
		bg = "2",
		lv_limit = 30,
		desc = "尝试阐明心智魔方与舰装之间的联系，但这无疑必须建立在大量的实验基础之上。用一些废弃的舰装当试验品吧。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 9,
		id = 832,
		bg_icon = "item_2",
		consume = {},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[841] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 9,
		id = 841,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[842] = {
		name = "G-412-MI",
		rarity = 1,
		time = 5400,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 9,
		id = 842,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				1500
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[843] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 9,
		id = 843,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[844] = {
		name = "G-236-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 9,
		id = 844,
		bg_icon = "gold_1",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[845] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 9,
		id = 845,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[846] = {
		name = "G-531-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "科技的高速发展，离不开金钱的推动。如果指挥官愿意投入大量的研发资金，相信一定能够取得丰硕的成果。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_g",
		blueprint_version = 9,
		id = 846,
		bg_icon = "gold_2",
		consume = {
			{
				1,
				1,
				6000
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[851] = {
		name = "D-737-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 851,
		bg_icon = "chara_waerpalaisuo",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42085,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[852] = {
		name = "D-781-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 852,
		bg_icon = "chara_makesi",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42083,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[853] = {
		name = "D-732-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 853,
		bg_icon = "chara_dengken",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42081,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[854] = {
		name = "D-740-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 854,
		bg_icon = "chara_gaoliang",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42082,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[855] = {
		name = "D-747-MI",
		rarity = 1,
		time = 9000,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 855,
		bg_icon = "chara_baofengyu",
		consume = {
			{
				1,
				1,
				3000
			}
		},
		drop_client = {
			{
				2,
				42084,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			}
		}
	}
	pg.base.technology_data_template[861] = {
		name = "D-337-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 861,
		bg_icon = "chara_waerpalaisuo",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42085,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[862] = {
		name = "D-381-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 862,
		bg_icon = "chara_makesi",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42083,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[863] = {
		name = "D-332-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 863,
		bg_icon = "chara_dengken",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42081,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[864] = {
		name = "D-340-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 864,
		bg_icon = "chara_gaoliang",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42082,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[865] = {
		name = "D-347-MI",
		rarity = 2,
		time = 18000,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 865,
		bg_icon = "chara_baofengyu",
		consume = {
			{
				1,
				1,
				5000
			}
		},
		drop_client = {
			{
				2,
				42084,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[871] = {
		name = "Q-302-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 871,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17001,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[872] = {
		name = "Q-310-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 872,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17011,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[873] = {
		name = "Q-351-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 873,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17021,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[874] = {
		name = "Q-368-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 874,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17031,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[875] = {
		name = "Q-389-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 875,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17041,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[876] = {
		name = "Q-202-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 876,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17002,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
end)()
;(function()
	pg.base.technology_data_template[877] = {
		name = "Q-210-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 877,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17012,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[878] = {
		name = "Q-251-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 878,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17022,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[879] = {
		name = "Q-268-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 879,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17032,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[880] = {
		name = "Q-289-MI",
		rarity = 1,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 880,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				17042,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52004,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[881] = {
		name = "Q-002-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 881,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[882] = {
		name = "Q-010-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 882,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[883] = {
		name = "Q-051-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 883,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[884] = {
		name = "Q-068-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 884,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[885] = {
		name = "Q-089-MI",
		rarity = 2,
		time = 14400,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "从已观测到的心智魔方与舰装的相互影响效果中，试图以可控并且稳定的方式，寻找可以利用这一效果的场景。",
		sub_name = "中型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 885,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[891] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 9,
		id = 891,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[892] = {
		name = "H-387-MI",
		rarity = 1,
		time = 3600,
		type = 1,
		condition = 0,
		bg = "1",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 9,
		id = 892,
		bg_icon = "gold_1",
		consume = {
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				54049,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[893] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 9,
		id = 893,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[894] = {
		name = "H-339-MI",
		rarity = 2,
		time = 7200,
		type = 1,
		condition = 0,
		bg = "2",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 9,
		id = 894,
		bg_icon = "gold_2",
		consume = {
			{
				2,
				20001,
				6
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				54050,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1001] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 1,
		id = 1001,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1002] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 1,
		id = 1002,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1003] = {
		name = "B-351-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52009,
		bg = "3",
		lv_limit = 75,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 1003,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1004] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52010,
		bg = "3",
		lv_limit = 80,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 1004,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1005] = {
		name = "D-418-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1005,
		bg_icon = "chara_haiwangxing",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1006] = {
		name = "D-431-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1006,
		bg_icon = "chara_junzhu",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42002,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1007] = {
		name = "D-444-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1007,
		bg_icon = "chara_yichui",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42003,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1008] = {
		name = "D-459-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1008,
		bg_icon = "chara_chuyun",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42004,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1009] = {
		name = "D-474-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1009,
		bg_icon = "chara_luoen",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42005,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1010] = {
		name = "D-492-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1010,
		bg_icon = "chara_luyijiushi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42006,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1011] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 1,
		id = 1011,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1012] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 1,
		id = 1012,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1013] = {
		name = "D-018-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1013,
		bg_icon = "chara_haiwangxing",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1014] = {
		name = "D-031-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1014,
		bg_icon = "chara_junzhu",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42002,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1015] = {
		name = "D-044-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1015,
		bg_icon = "chara_yichui",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42003,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1016] = {
		name = "D-059-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1016,
		bg_icon = "chara_chuyun",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42004,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1017] = {
		name = "D-074-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1017,
		bg_icon = "chara_luoen",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42005,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1018] = {
		name = "D-092-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 1,
		id = 1018,
		bg_icon = "chara_luyijiushi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42006,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1019] = {
		name = "Q-002-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 1019,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1020] = {
		name = "Q-010-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 1020,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1021] = {
		name = "Q-051-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 1021,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1022] = {
		name = "Q-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 1022,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1023] = {
		name = "Q-089-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 1,
		id = 1023,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1024] = {
		name = "H-085-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 1,
		id = 1024,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1025] = {
		name = "H-085-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 1,
		id = 1025,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1026] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52011,
		bg = "3",
		lv_limit = 85,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 1,
		id = 1026,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52001,
				1
			},
			{
				2,
				52002,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1031] = {
		name = "E-831-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 1031,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10040,
				45
			}
		},
		drop_client = {
			{
				2,
				13001,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1032] = {
		name = "E-859-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 1032,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10057,
				45
			}
		},
		drop_client = {
			{
				2,
				13003,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1033] = {
		name = "E-874-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 1033,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10074,
				45
			}
		},
		drop_client = {
			{
				2,
				13004,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1034] = {
		name = "E-892-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 1034,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10019,
				45
			}
		},
		drop_client = {
			{
				2,
				13005,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1035] = {
		name = "E-818-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 1035,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10037,
				45
			}
		},
		drop_client = {
			{
				2,
				13006,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1036] = {
		name = "E-844-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 1,
		id = 1036,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10052,
				45
			}
		},
		drop_client = {
			{
				2,
				13008,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1101] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 2,
		id = 1101,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1102] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 2,
		id = 1102,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1103] = {
		name = "B-351-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52009,
		bg = "3",
		lv_limit = 75,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 1103,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1104] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52010,
		bg = "3",
		lv_limit = 80,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 1104,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1105] = {
		name = "D-405-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1105,
		bg_icon = "chara_xiyatu",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1106] = {
		name = "D-412-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1106,
		bg_icon = "chara_zuozhiya",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42012,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1107] = {
		name = "D-446-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1107,
		bg_icon = "chara_beifeng",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42013,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1108] = {
		name = "D-457-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1108,
		bg_icon = "chara_wuqi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42014,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1109] = {
		name = "D-479-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1109,
		bg_icon = "chara_feiteliedadi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42015,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1110] = {
		name = "D-494-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1110,
		bg_icon = "chara_jiasikenie",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42016,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1111] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 2,
		id = 1111,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1112] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 2,
		id = 1112,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1113] = {
		name = "D-005-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1113,
		bg_icon = "chara_xiyatu",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1114] = {
		name = "D-012-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1114,
		bg_icon = "chara_zuozhiya",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42012,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1115] = {
		name = "D-046-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1115,
		bg_icon = "chara_beifeng",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42013,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1116] = {
		name = "D-057-UL",
		rarity = 4,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1116,
		bg_icon = "chara_wuqi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42014,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1117] = {
		name = "D-079-UL",
		rarity = 4,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1117,
		bg_icon = "chara_feiteliedadi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42015,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1118] = {
		name = "D-094-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 2,
		id = 1118,
		bg_icon = "chara_jiasikenie",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42016,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1119] = {
		name = "Q-002-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 1119,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1120] = {
		name = "Q-010-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 1120,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1121] = {
		name = "Q-051-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 1121,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1122] = {
		name = "Q-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 1122,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1123] = {
		name = "Q-089-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 2,
		id = 1123,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1124] = {
		name = "H-022-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 2,
		id = 1124,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1125] = {
		name = "H-022-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 2,
		id = 1125,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1126] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52011,
		bg = "3",
		lv_limit = 85,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 2,
		id = 1126,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52011,
				1
			},
			{
				2,
				52012,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1131] = {
		name = "E-879-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 1131,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10075,
				45
			}
		},
		drop_client = {
			{
				2,
				13013,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1132] = {
		name = "E-805-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 1132,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10018,
				45
			}
		},
		drop_client = {
			{
				2,
				13014,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1133] = {
		name = "E-846-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 1133,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10026,
				45
			}
		},
		drop_client = {
			{
				2,
				13015,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1134] = {
		name = "E-857-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 1134,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10056,
				45
			}
		},
		drop_client = {
			{
				2,
				13016,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1135] = {
		name = "E-894-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 2,
		id = 1135,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10077,
				45
			}
		},
		drop_client = {
			{
				2,
				13017,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1201] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 3,
		id = 1201,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1202] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 3,
		id = 1202,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1203] = {
		name = "B-351-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52009,
		bg = "3",
		lv_limit = 75,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 1203,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1204] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52010,
		bg = "3",
		lv_limit = 80,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 1204,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1205] = {
		name = "D-421-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1205,
		bg_icon = "chara_chaijun",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1206] = {
		name = "D-422-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1206,
		bg_icon = "chara_deleike",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42022,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1207] = {
		name = "D-472-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1207,
		bg_icon = "chara_meiyinci",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42023,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1208] = {
		name = "D-477-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1208,
		bg_icon = "chara_aoding",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42024,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1209] = {
		name = "D-495-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1209,
		bg_icon = "chara_xiangbin",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42025,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1211] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 3,
		id = 1211,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1212] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 3,
		id = 1212,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1213] = {
		name = "D-021-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1213,
		bg_icon = "chara_chaijun",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1214] = {
		name = "D-022-UL",
		rarity = 4,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1214,
		bg_icon = "chara_deleike",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42022,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1215] = {
		name = "D-072-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1215,
		bg_icon = "chara_meiyinci",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42023,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1216] = {
		name = "D-077-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1216,
		bg_icon = "chara_aoding",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42024,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1217] = {
		name = "D-095-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 3,
		id = 1217,
		bg_icon = "chara_xiangbin",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42025,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1219] = {
		name = "Q-002-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 1219,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1220] = {
		name = "Q-010-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 1220,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1221] = {
		name = "Q-051-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 1221,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1222] = {
		name = "Q-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 1222,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1223] = {
		name = "Q-089-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 3,
		id = 1223,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1224] = {
		name = "H-060-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 3,
		id = 1224,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1225] = {
		name = "H-060-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 3,
		id = 1225,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1226] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52011,
		bg = "3",
		lv_limit = 85,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 3,
		id = 1226,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52021,
				1
			},
			{
				2,
				52022,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
end)()
;(function()
	pg.base.technology_data_template[1231] = {
		name = "E-821-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 1231,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10038,
				45
			}
		},
		drop_client = {
			{
				2,
				13018,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1232] = {
		name = "E-823-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 1232,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10035,
				45
			}
		},
		drop_client = {
			{
				2,
				13020,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1233] = {
		name = "E-824-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 1233,
		bg_icon = "item_3",
		consume = {
			{
				2,
				11009,
				45
			}
		},
		drop_client = {
			{
				2,
				13021,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1234] = {
		name = "E-877-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 1234,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10075,
				45
			}
		},
		drop_client = {
			{
				2,
				13022,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1235] = {
		name = "E-895-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 3,
		id = 1235,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10102,
				45
			}
		},
		drop_client = {
			{
				2,
				13023,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1301] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 4,
		id = 1301,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1302] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 4,
		id = 1302,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1303] = {
		name = "B-351-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52009,
		bg = "3",
		lv_limit = 75,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 1303,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1304] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52010,
		bg = "3",
		lv_limit = 80,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 1304,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1305] = {
		name = "D-408-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1305,
		bg_icon = "chara_ankeleiqi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1306] = {
		name = "D-463-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1306,
		bg_icon = "chara_bailong",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42032,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1307] = {
		name = "D-475-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1307,
		bg_icon = "chara_aijier",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42033,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1308] = {
		name = "D-482-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1308,
		bg_icon = "chara_aogusite",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42034,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1309] = {
		name = "D-468-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1309,
		bg_icon = "chara_makeboluo",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42035,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1311] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 4,
		id = 1311,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1312] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 4,
		id = 1312,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1313] = {
		name = "D-008-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1313,
		bg_icon = "chara_ankeleiqi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1314] = {
		name = "D-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1314,
		bg_icon = "chara_bailong",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42032,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1315] = {
		name = "D-075-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1315,
		bg_icon = "chara_aijier",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42033,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1316] = {
		name = "D-082-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1316,
		bg_icon = "chara_aogusite",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42034,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1317] = {
		name = "D-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 4,
		id = 1317,
		bg_icon = "chara_makeboluo",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42035,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1319] = {
		name = "Q-002-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 1319,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1320] = {
		name = "Q-010-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 1320,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1321] = {
		name = "Q-051-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 1321,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1322] = {
		name = "Q-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 1322,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1323] = {
		name = "Q-089-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 4,
		id = 1323,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1324] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 4,
		id = 1324,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1325] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 4,
		id = 1325,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1326] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52011,
		bg = "3",
		lv_limit = 85,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 4,
		id = 1326,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52031,
				1
			},
			{
				2,
				52032,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1331] = {
		name = "E-875-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 1331,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10080,
				45
			}
		},
		drop_client = {
			{
				2,
				13025,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1332] = {
		name = "E-882-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 1332,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10084,
				45
			}
		},
		drop_client = {
			{
				2,
				13026,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1333] = {
		name = "E-868-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 1333,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10109,
				45
			}
		},
		drop_client = {
			{
				2,
				13027,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1334] = {
		name = "E-808-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 1334,
		bg_icon = "item_3",
		consume = {
			{
				2,
				65,
				45
			}
		},
		drop_client = {
			{
				2,
				13028,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1335] = {
		name = "E-863-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 4,
		id = 1335,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10068,
				45
			}
		},
		drop_client = {
			{
				2,
				13029,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1401] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 5,
		id = 1401,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1402] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 5,
		id = 1402,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1403] = {
		name = "B-351-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52009,
		bg = "3",
		lv_limit = 75,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 1403,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1404] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52010,
		bg = "3",
		lv_limit = 80,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 1404,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1405] = {
		name = "D-419-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1405,
		bg_icon = "chara_pulimaosi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42041,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1406] = {
		name = "D-478-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1406,
		bg_icon = "chara_lupuleixiteqinwang",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42042,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1407] = {
		name = "D-486-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1407,
		bg_icon = "chara_haerbin",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42043,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1408] = {
		name = "D-488-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1408,
		bg_icon = "chara_qikaluofu",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42044,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1409] = {
		name = "D-493-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1409,
		bg_icon = "chara_buleisite",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42045,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1411] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 5,
		id = 1411,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1412] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 5,
		id = 1412,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1413] = {
		name = "D-019-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1413,
		bg_icon = "chara_pulimaosi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42041,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1414] = {
		name = "D-078-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1414,
		bg_icon = "chara_lupuleixiteqinwang",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42042,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1415] = {
		name = "D-086-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1415,
		bg_icon = "chara_haerbin",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42043,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1416] = {
		name = "D-088-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1416,
		bg_icon = "chara_qikaluofu",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42044,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1417] = {
		name = "D-093-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 5,
		id = 1417,
		bg_icon = "chara_buleisite",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42045,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1419] = {
		name = "Q-002-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 1419,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1420] = {
		name = "Q-010-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 1420,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1421] = {
		name = "Q-051-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 1421,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1422] = {
		name = "Q-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 1422,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1423] = {
		name = "Q-089-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 5,
		id = 1423,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1424] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 5,
		id = 1424,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1425] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 5,
		id = 1425,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1426] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52011,
		bg = "3",
		lv_limit = 85,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 5,
		id = 1426,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52061,
				1
			},
			{
				2,
				52062,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1431] = {
		name = "E-893-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 1431,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10102,
				45
			}
		},
		drop_client = {
			{
				2,
				13032,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1432] = {
		name = "E-878-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 1432,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10077,
				45
			}
		},
		drop_client = {
			{
				2,
				13035,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1433] = {
		name = "E-886-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 5,
		id = 1433,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10122,
				45
			}
		},
		drop_client = {
			{
				2,
				13036,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1501] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 6,
		id = 1501,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1502] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 6,
		id = 1502,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1503] = {
		name = "B-351-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52009,
		bg = "3",
		lv_limit = 75,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 1503,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1504] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52010,
		bg = "3",
		lv_limit = 80,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 1504,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1505] = {
		name = "D-483-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1505,
		bg_icon = "chara_xingdengbao",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42054,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1506] = {
		name = "D-413-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1506,
		bg_icon = "chara_qiershazhi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42051,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1507] = {
		name = "D-439-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1507,
		bg_icon = "chara_siwanshi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42052,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1508] = {
		name = "D-471-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1508,
		bg_icon = "chara_feilikesishuerci",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42053,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1509] = {
		name = "D-496-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1509,
		bg_icon = "chara_fulandeer",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42055,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1511] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 6,
		id = 1511,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1512] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 6,
		id = 1512,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1513] = {
		name = "D-083-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1513,
		bg_icon = "chara_xingdengbao",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42054,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1514] = {
		name = "D-013-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1514,
		bg_icon = "chara_qiershazhi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42051,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1515] = {
		name = "D-039-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1515,
		bg_icon = "chara_siwanshi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42052,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1516] = {
		name = "D-071-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1516,
		bg_icon = "chara_feilikesishuerci",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42053,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1517] = {
		name = "D-096-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 6,
		id = 1517,
		bg_icon = "chara_fulandeer",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42055,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1519] = {
		name = "Q-002-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 1519,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1520] = {
		name = "Q-010-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 1520,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1521] = {
		name = "Q-051-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 1521,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1522] = {
		name = "Q-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 1522,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1523] = {
		name = "Q-089-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 6,
		id = 1523,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1524] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 6,
		id = 1524,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1525] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 6,
		id = 1525,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1526] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52011,
		bg = "3",
		lv_limit = 85,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 6,
		id = 1526,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52071,
				1
			},
			{
				2,
				52072,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1531] = {
		name = "E-813-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 1531,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10022,
				45
			}
		},
		drop_client = {
			{
				2,
				13037,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1532] = {
		name = "E-839-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 1532,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10055,
				45
			}
		},
		drop_client = {
			{
				2,
				13039,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1533] = {
		name = "E-871-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 1533,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10073,
				45
			}
		},
		drop_client = {
			{
				2,
				13040,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1534] = {
		name = "E-896-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 1534,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10103,
				45
			}
		},
		drop_client = {
			{
				2,
				13041,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1535] = {
		name = "E-884-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 6,
		id = 1535,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10077,
				45
			}
		},
		drop_client = {
			{
				2,
				13042,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1601] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 7,
		id = 1601,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1602] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 7,
		id = 1602,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1603] = {
		name = "B-351-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52009,
		bg = "3",
		lv_limit = 75,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 1603,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1604] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52010,
		bg = "3",
		lv_limit = 80,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 1604,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1605] = {
		name = "D-403-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1605,
		bg_icon = "chara_haerfude",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42061,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1606] = {
		name = "D-458-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1606,
		bg_icon = "chara_dashan",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42062,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1607] = {
		name = "D-466-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1607,
		bg_icon = "chara_nabulesi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42063,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1608] = {
		name = "D-490-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1608,
		bg_icon = "chara_naximofuhaijunshangjiang",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42064,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1609] = {
		name = "D-497-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1609,
		bg_icon = "chara_beiyade",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42065,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1611] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 7,
		id = 1611,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
end)()
;(function()
	pg.base.technology_data_template[1612] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 7,
		id = 1612,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1613] = {
		name = "D-003-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1613,
		bg_icon = "chara_haerfude",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42061,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1614] = {
		name = "D-058-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1614,
		bg_icon = "chara_dashan",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42062,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1615] = {
		name = "D-066-UL",
		rarity = 4,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1615,
		bg_icon = "chara_nabulesi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42063,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1616] = {
		name = "D-090-UL",
		rarity = 4,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1616,
		bg_icon = "chara_naximofuhaijunshangjiang",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42064,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1617] = {
		name = "D-097-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 7,
		id = 1617,
		bg_icon = "chara_beiyade",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42065,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1619] = {
		name = "Q-002-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 1619,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1620] = {
		name = "Q-010-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 1620,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1621] = {
		name = "Q-051-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 1621,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1622] = {
		name = "Q-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 1622,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1623] = {
		name = "Q-089-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 7,
		id = 1623,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1624] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 7,
		id = 1624,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1625] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 7,
		id = 1625,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1626] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52011,
		bg = "3",
		lv_limit = 85,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 7,
		id = 1626,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52081,
				1
			},
			{
				2,
				52082,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1632] = {
		name = "E-866-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 1632,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10106,
				45
			}
		},
		drop_client = {
			{
				2,
				13045,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1633] = {
		name = "E-867-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 1633,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10108,
				45
			}
		},
		drop_client = {
			{
				2,
				13046,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1634] = {
		name = "E-83-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 1634,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10030,
				45
			}
		},
		drop_client = {
			{
				2,
				13047,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1635] = {
		name = "E-858-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 7,
		id = 1635,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10057,
				45
			}
		},
		drop_client = {
			{
				2,
				13048,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1701] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 8,
		id = 1701,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1702] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 8,
		id = 1702,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1703] = {
		name = "B-351-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52009,
		bg = "3",
		lv_limit = 75,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 1703,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1704] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52010,
		bg = "3",
		lv_limit = 80,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 1704,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1705] = {
		name = "D-480-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1705,
		bg_icon = "chara_meikelunbao",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42072,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1706] = {
		name = "D-436-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1706,
		bg_icon = "chara_jinshi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42075,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1707] = {
		name = "D-487-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1707,
		bg_icon = "chara_dimiteli",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42074,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1708] = {
		name = "D-411-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1708,
		bg_icon = "chara_kansasi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42071,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1709] = {
		name = "D-464-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1709,
		bg_icon = "chara_kunibeierdi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42073,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1711] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 8,
		id = 1711,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1712] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 8,
		id = 1712,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1713] = {
		name = "D-080-UL",
		rarity = 4,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1713,
		bg_icon = "chara_meikelunbao",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42072,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1714] = {
		name = "D-036-UL",
		rarity = 4,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1714,
		bg_icon = "chara_jinshi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42075,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1715] = {
		name = "D-087-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1715,
		bg_icon = "chara_dimiteli",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42074,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1716] = {
		name = "D-011-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1716,
		bg_icon = "chara_kansasi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42071,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1717] = {
		name = "D-064-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 8,
		id = 1717,
		bg_icon = "chara_kunibeierdi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42073,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1719] = {
		name = "Q-002-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 1719,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1720] = {
		name = "Q-010-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 1720,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1721] = {
		name = "Q-051-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 1721,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1722] = {
		name = "Q-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 1722,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1723] = {
		name = "Q-089-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 8,
		id = 1723,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1724] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 8,
		id = 1724,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1725] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 8,
		id = 1725,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1726] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52011,
		bg = "3",
		lv_limit = 85,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 8,
		id = 1726,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52091,
				1
			},
			{
				2,
				52092,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1731] = {
		name = "E-880-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 1731,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10075,
				45
			}
		},
		drop_client = {
			{
				2,
				13049,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1732] = {
		name = "E-836-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 1732,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10080,
				45
			}
		},
		drop_client = {
			{
				2,
				13050,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1733] = {
		name = "E-811-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 1733,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10022,
				45
			}
		},
		drop_client = {
			{
				2,
				13051,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1734] = {
		name = "E-864-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 1734,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10109,
				45
			}
		},
		drop_client = {
			{
				2,
				13052,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1735] = {
		name = "E-887-MI",
		rarity = 3,
		time = 7200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 80,
		desc = "对现实武器设备的解析，将为新型装备的研发提供决定性的参考，至于解析期间的装备损耗，只能说是必要的投入了",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_e",
		blueprint_version = 8,
		id = 1735,
		bg_icon = "item_3",
		consume = {
			{
				2,
				10122,
				45
			}
		},
		drop_client = {
			{
				2,
				13054,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1801] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 9,
		id = 1801,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1802] = {
		name = "C-038-RF",
		rarity = 3,
		time = 43200,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "目前一切关于心智魔方的理论基础，其基石都来源于对心智魔方的基础构造的了解程度。一些工程师们正致力于推导心智魔方的基础构造。",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_c",
		blueprint_version = 9,
		id = 1802,
		bg_icon = "item_3",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			},
			{
				2,
				59001,
				1
			}
		}
	}
	pg.base.technology_data_template[1803] = {
		name = "B-351-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52009,
		bg = "3",
		lv_limit = 75,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 1803,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1804] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52010,
		bg = "3",
		lv_limit = 80,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 1804,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1805] = {
		name = "D-437-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1805,
		bg_icon = "chara_waerpalaisuo",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42085,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1806] = {
		name = "D-481-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1806,
		bg_icon = "chara_makesi",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42083,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1807] = {
		name = "D-432-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1807,
		bg_icon = "chara_dengken",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42081,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1808] = {
		name = "D-440-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1808,
		bg_icon = "chara_gaoliang",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42082,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1809] = {
		name = "D-447-RF",
		rarity = 3,
		time = 28800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "心智魔方能够具象化人类对于某一事物的认知集合，如果能够定向心智魔方具象化的目标，会有什么样的效果呢？",
		sub_name = "大型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1809,
		bg_icon = "chara_baofengyu",
		consume = {
			{
				1,
				1,
				8000
			}
		},
		drop_client = {
			{
				2,
				42084,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1811] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 9,
		id = 1811,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1812] = {
		name = "H-207-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "虽然至今仍未有成功的记录。但是对于心智魔方的构造研究，最简单并且粗暴的方法，就是将心智魔方分解解析。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_h",
		blueprint_version = 9,
		id = 1812,
		bg_icon = "gold_3",
		consume = {
			{
				2,
				20001,
				10
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1813] = {
		name = "D-037-UL",
		rarity = 4,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1813,
		bg_icon = "chara_waerpalaisuo",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42085,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1814] = {
		name = "D-081-UL",
		rarity = 4,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "4",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1814,
		bg_icon = "chara_makesi",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42083,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1815] = {
		name = "D-032-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1815,
		bg_icon = "chara_dengken",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42081,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1816] = {
		name = "D-040-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1816,
		bg_icon = "chara_gaoliang",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42082,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1817] = {
		name = "D-047-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方的认知具象化实验中，突然产生异常的离散值升高的现象。找到异常的产生原因将会大大拓展我们对心智魔方的理论认知。",
		sub_name = "小型项目",
		label = "tag_red",
		label_color = "tag_sp",
		blueprint_version = 9,
		id = 1817,
		bg_icon = "chara_baofengyu",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				20001,
				5
			}
		},
		drop_client = {
			{
				2,
				42084,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1819] = {
		name = "Q-002-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 1819,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17003,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1820] = {
		name = "Q-010-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 1820,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17013,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1821] = {
		name = "Q-051-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 1821,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17023,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1822] = {
		name = "Q-068-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 1822,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17033,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1823] = {
		name = "Q-089-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "在心智魔方与舰装的影响实验中，突然对某一部件产生了极高的相适度，也许这其中隐藏着一些我们都未所知的原理存在。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_q",
		blueprint_version = 9,
		id = 1823,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				5000
			},
			{
				2,
				17043,
				20
			}
		},
		drop_client = {
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
	pg.base.technology_data_template[1824] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 9,
		id = 1824,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1825] = {
		name = "H-063-UL",
		rarity = 3,
		time = 1800,
		type = 2,
		condition = 0,
		bg = "3",
		lv_limit = 30,
		desc = "被军部实验室列为最高机密的项目，其结果对人类，乃至整个生态圈，都能产生巨大的影响。",
		sub_name = "小型项目",
		label = "tag_blue",
		label_color = "tag_sh",
		blueprint_version = 9,
		id = 1825,
		bg_icon = "gold_3",
		consume = {
			{
				1,
				1,
				8000
			},
			{
				2,
				20001,
				3
			}
		},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				54051,
				1
			},
			{
				2,
				15008,
				1
			}
		}
	}
	pg.base.technology_data_template[1826] = {
		name = "B-397-RF",
		rarity = 3,
		time = 14400,
		type = 2,
		condition = 52011,
		bg = "3",
		lv_limit = 85,
		desc = "工程师们在对心智魔方的研究过程中，提出了大量天马行空般的设想。该科研项目致力于通过实战的手段，收集各种实验数据以验证实验设想。",
		sub_name = "中型项目",
		label = "tag_red",
		label_color = "tag_b",
		blueprint_version = 9,
		id = 1826,
		bg_icon = "battle_3",
		consume = {},
		drop_client = {
			{
				2,
				52101,
				1
			},
			{
				2,
				52102,
				1
			},
			{
				2,
				52003,
				1
			}
		}
	}
end)()
