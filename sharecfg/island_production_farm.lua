pg = pg or {}
pg.island_production_farm = rawget(pg, "island_production_farm") or setmetatable({
	__name = "island_production_farm"
}, confNEO)
pg.island_production_farm.all = {
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
	201,
	202,
	203,
	204,
	205,
	206
}
pg.island_production_farm.get_id_list_by_place_id = {
	[101] = {
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
		36
	},
	[501] = {
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
		116
	},
	[502] = {
		201,
		202,
		203,
		204,
		205,
		206
	}
}
pg.base = pg.base or {}
pg.base.island_production_farm = {}

;(function()
	pg.base.island_production_farm[1] = {
		idle_unit = 1001,
		parent_slot = 10101,
		slotId = 1001,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 1,
		objId = 10010004,
		unlock_type = 0,
		array = {
			1,
			1
		}
	}
	pg.base.island_production_farm[2] = {
		idle_unit = 1001,
		parent_slot = 10101,
		slotId = 1002,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 2,
		objId = 10010005,
		unlock_type = 0,
		array = {
			1,
			2
		}
	}
	pg.base.island_production_farm[3] = {
		idle_unit = 1001,
		parent_slot = 10101,
		slotId = 1003,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 3,
		objId = 10010006,
		unlock_type = 0,
		array = {
			1,
			3
		}
	}
	pg.base.island_production_farm[4] = {
		idle_unit = 1001,
		parent_slot = 10101,
		slotId = 1004,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 4,
		objId = 10010010,
		unlock_type = 0,
		array = {
			2,
			1
		}
	}
	pg.base.island_production_farm[5] = {
		idle_unit = 1001,
		parent_slot = 10101,
		slotId = 1005,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 5,
		objId = 10010011,
		unlock_type = 0,
		array = {
			2,
			2
		}
	}
	pg.base.island_production_farm[6] = {
		idle_unit = 1001,
		parent_slot = 10101,
		slotId = 1006,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 6,
		objId = 10010012,
		unlock_type = 0,
		array = {
			2,
			3
		}
	}
	pg.base.island_production_farm[7] = {
		idle_unit = 1001,
		parent_slot = 10101,
		slotId = 1007,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 7,
		objId = 10010016,
		unlock_type = 0,
		array = {
			3,
			1
		}
	}
	pg.base.island_production_farm[8] = {
		idle_unit = 1001,
		parent_slot = 10101,
		slotId = 1008,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 8,
		objId = 10010017,
		unlock_type = 0,
		array = {
			3,
			2
		}
	}
	pg.base.island_production_farm[9] = {
		idle_unit = 1001,
		parent_slot = 10101,
		slotId = 1009,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 9,
		objId = 10010018,
		unlock_type = 0,
		array = {
			3,
			3
		}
	}
	pg.base.island_production_farm[10] = {
		idle_unit = 1001,
		parent_slot = 10102,
		slotId = 1010,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 10,
		objId = 10010022,
		unlock_type = 1,
		array = {
			4,
			1
		}
	}
	pg.base.island_production_farm[11] = {
		idle_unit = 1001,
		parent_slot = 10102,
		slotId = 1011,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 11,
		objId = 10010023,
		unlock_type = 1,
		array = {
			4,
			2
		}
	}
	pg.base.island_production_farm[12] = {
		idle_unit = 1001,
		parent_slot = 10102,
		slotId = 1012,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 12,
		objId = 10010024,
		unlock_type = 1,
		array = {
			4,
			3
		}
	}
	pg.base.island_production_farm[13] = {
		idle_unit = 1001,
		parent_slot = 10102,
		slotId = 1013,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 13,
		objId = 10010028,
		unlock_type = 1,
		array = {
			5,
			1
		}
	}
	pg.base.island_production_farm[14] = {
		idle_unit = 1001,
		parent_slot = 10102,
		slotId = 1014,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 14,
		objId = 10010029,
		unlock_type = 1,
		array = {
			5,
			2
		}
	}
	pg.base.island_production_farm[15] = {
		idle_unit = 1001,
		parent_slot = 10102,
		slotId = 1015,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 15,
		objId = 10010030,
		unlock_type = 1,
		array = {
			5,
			3
		}
	}
	pg.base.island_production_farm[16] = {
		idle_unit = 1001,
		parent_slot = 10102,
		slotId = 1016,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 16,
		objId = 10010034,
		unlock_type = 1,
		array = {
			6,
			1
		}
	}
	pg.base.island_production_farm[17] = {
		idle_unit = 1001,
		parent_slot = 10102,
		slotId = 1017,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 17,
		objId = 10010035,
		unlock_type = 1,
		array = {
			6,
			2
		}
	}
	pg.base.island_production_farm[18] = {
		idle_unit = 1001,
		parent_slot = 10102,
		slotId = 1018,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 18,
		objId = 10010036,
		unlock_type = 1,
		array = {
			6,
			3
		}
	}
	pg.base.island_production_farm[19] = {
		idle_unit = 1001,
		parent_slot = 10103,
		slotId = 1019,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 19,
		objId = 10010007,
		unlock_type = 1,
		array = {
			1,
			4
		}
	}
	pg.base.island_production_farm[20] = {
		idle_unit = 1001,
		parent_slot = 10103,
		slotId = 1020,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 20,
		objId = 10010008,
		unlock_type = 1,
		array = {
			1,
			5
		}
	}
	pg.base.island_production_farm[21] = {
		idle_unit = 1001,
		parent_slot = 10103,
		slotId = 1021,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 21,
		objId = 10010009,
		unlock_type = 1,
		array = {
			1,
			6
		}
	}
	pg.base.island_production_farm[22] = {
		idle_unit = 1001,
		parent_slot = 10103,
		slotId = 1022,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 22,
		objId = 10010013,
		unlock_type = 1,
		array = {
			2,
			4
		}
	}
	pg.base.island_production_farm[23] = {
		idle_unit = 1001,
		parent_slot = 10103,
		slotId = 1023,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 23,
		objId = 10010014,
		unlock_type = 1,
		array = {
			2,
			5
		}
	}
	pg.base.island_production_farm[24] = {
		idle_unit = 1001,
		parent_slot = 10103,
		slotId = 1024,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 24,
		objId = 10010015,
		unlock_type = 1,
		array = {
			2,
			6
		}
	}
	pg.base.island_production_farm[25] = {
		idle_unit = 1001,
		parent_slot = 10103,
		slotId = 1025,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 25,
		objId = 10010019,
		unlock_type = 1,
		array = {
			3,
			4
		}
	}
	pg.base.island_production_farm[26] = {
		idle_unit = 1001,
		parent_slot = 10103,
		slotId = 1026,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 26,
		objId = 10010020,
		unlock_type = 1,
		array = {
			3,
			5
		}
	}
	pg.base.island_production_farm[27] = {
		idle_unit = 1001,
		parent_slot = 10103,
		slotId = 1027,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 27,
		objId = 10010021,
		unlock_type = 1,
		array = {
			3,
			6
		}
	}
	pg.base.island_production_farm[28] = {
		idle_unit = 1001,
		parent_slot = 10104,
		slotId = 1028,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 28,
		objId = 10010025,
		unlock_type = 1,
		array = {
			4,
			4
		}
	}
	pg.base.island_production_farm[29] = {
		idle_unit = 1001,
		parent_slot = 10104,
		slotId = 1029,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 29,
		objId = 10010026,
		unlock_type = 1,
		array = {
			4,
			5
		}
	}
	pg.base.island_production_farm[30] = {
		idle_unit = 1001,
		parent_slot = 10104,
		slotId = 1030,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 30,
		objId = 10010027,
		unlock_type = 1,
		array = {
			4,
			6
		}
	}
	pg.base.island_production_farm[31] = {
		idle_unit = 1001,
		parent_slot = 10104,
		slotId = 1031,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 31,
		objId = 10010031,
		unlock_type = 1,
		array = {
			5,
			4
		}
	}
	pg.base.island_production_farm[32] = {
		idle_unit = 1001,
		parent_slot = 10104,
		slotId = 1032,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 32,
		objId = 10010032,
		unlock_type = 1,
		array = {
			5,
			5
		}
	}
	pg.base.island_production_farm[33] = {
		idle_unit = 1001,
		parent_slot = 10104,
		slotId = 1033,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 33,
		objId = 10010033,
		unlock_type = 1,
		array = {
			5,
			6
		}
	}
	pg.base.island_production_farm[34] = {
		idle_unit = 1001,
		parent_slot = 10104,
		slotId = 1034,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 34,
		objId = 10010037,
		unlock_type = 1,
		array = {
			6,
			4
		}
	}
	pg.base.island_production_farm[35] = {
		idle_unit = 1001,
		parent_slot = 10104,
		slotId = 1035,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 35,
		objId = 10010038,
		unlock_type = 1,
		array = {
			6,
			5
		}
	}
	pg.base.island_production_farm[36] = {
		idle_unit = 1001,
		parent_slot = 10104,
		slotId = 1036,
		place_id = 101,
		unlock_unit = 1003,
		work_unit = 1002,
		id = 36,
		objId = 10010039,
		unlock_type = 1,
		array = {
			6,
			6
		}
	}
	pg.base.island_production_farm[101] = {
		idle_unit = 1014,
		array = "",
		slotId = 1101,
		parent_slot = 50101,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 101,
		objId = 10050010,
		unlock_type = 0
	}
	pg.base.island_production_farm[102] = {
		idle_unit = 1014,
		array = "",
		slotId = 1102,
		parent_slot = 50101,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 102,
		objId = 10050011,
		unlock_type = 0
	}
	pg.base.island_production_farm[103] = {
		idle_unit = 1014,
		array = "",
		slotId = 1103,
		parent_slot = 50101,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 103,
		objId = 10050012,
		unlock_type = 0
	}
	pg.base.island_production_farm[104] = {
		idle_unit = 1014,
		array = "",
		slotId = 1104,
		parent_slot = 50101,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 104,
		objId = 10050013,
		unlock_type = 0
	}
	pg.base.island_production_farm[105] = {
		idle_unit = 1014,
		array = "",
		slotId = 1105,
		parent_slot = 50102,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 105,
		objId = 10050014,
		unlock_type = 1
	}
	pg.base.island_production_farm[106] = {
		idle_unit = 1014,
		array = "",
		slotId = 1106,
		parent_slot = 50102,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 106,
		objId = 10050015,
		unlock_type = 1
	}
	pg.base.island_production_farm[107] = {
		idle_unit = 1014,
		array = "",
		slotId = 1107,
		parent_slot = 50102,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 107,
		objId = 10050016,
		unlock_type = 1
	}
	pg.base.island_production_farm[108] = {
		idle_unit = 1014,
		array = "",
		slotId = 1108,
		parent_slot = 50102,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 108,
		objId = 10050017,
		unlock_type = 1
	}
	pg.base.island_production_farm[109] = {
		idle_unit = 1014,
		array = "",
		slotId = 1109,
		parent_slot = 50103,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 109,
		objId = 10050018,
		unlock_type = 1
	}
	pg.base.island_production_farm[110] = {
		idle_unit = 1014,
		array = "",
		slotId = 1110,
		parent_slot = 50103,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 110,
		objId = 10050019,
		unlock_type = 1
	}
	pg.base.island_production_farm[111] = {
		idle_unit = 1014,
		array = "",
		slotId = 1111,
		parent_slot = 50103,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 111,
		objId = 10050020,
		unlock_type = 1
	}
	pg.base.island_production_farm[112] = {
		idle_unit = 1014,
		array = "",
		slotId = 1112,
		parent_slot = 50103,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 112,
		objId = 10050021,
		unlock_type = 1
	}
	pg.base.island_production_farm[113] = {
		idle_unit = 1014,
		array = "",
		slotId = 1113,
		parent_slot = 50104,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 113,
		objId = 10050022,
		unlock_type = 1
	}
	pg.base.island_production_farm[114] = {
		idle_unit = 1014,
		array = "",
		slotId = 1114,
		parent_slot = 50104,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 114,
		objId = 10050023,
		unlock_type = 1
	}
	pg.base.island_production_farm[115] = {
		idle_unit = 1014,
		array = "",
		slotId = 1115,
		parent_slot = 50104,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 115,
		objId = 10050024,
		unlock_type = 1
	}
	pg.base.island_production_farm[116] = {
		idle_unit = 1014,
		array = "",
		slotId = 1116,
		parent_slot = 50104,
		place_id = 501,
		unlock_unit = 20153,
		work_unit = 1014,
		id = 116,
		objId = 10050025,
		unlock_type = 1
	}
	pg.base.island_production_farm[201] = {
		idle_unit = 1014,
		array = "",
		slotId = 1201,
		parent_slot = 60101,
		place_id = 502,
		unlock_unit = 20152,
		work_unit = 1014,
		id = 201,
		objId = 10050026,
		unlock_type = 0
	}
	pg.base.island_production_farm[202] = {
		idle_unit = 1014,
		array = "",
		slotId = 1202,
		parent_slot = 60101,
		place_id = 502,
		unlock_unit = 20152,
		work_unit = 1014,
		id = 202,
		objId = 10050027,
		unlock_type = 0
	}
	pg.base.island_production_farm[203] = {
		idle_unit = 1014,
		array = "",
		slotId = 1203,
		parent_slot = 60101,
		place_id = 502,
		unlock_unit = 20152,
		work_unit = 1014,
		id = 203,
		objId = 10050028,
		unlock_type = 0
	}
	pg.base.island_production_farm[204] = {
		idle_unit = 1014,
		array = "",
		slotId = 1204,
		parent_slot = 60102,
		place_id = 502,
		unlock_unit = 20152,
		work_unit = 1014,
		id = 204,
		objId = 10050029,
		unlock_type = 1
	}
	pg.base.island_production_farm[205] = {
		idle_unit = 1014,
		array = "",
		slotId = 1205,
		parent_slot = 60102,
		place_id = 502,
		unlock_unit = 20152,
		work_unit = 1014,
		id = 205,
		objId = 10050030,
		unlock_type = 1
	}
	pg.base.island_production_farm[206] = {
		idle_unit = 1014,
		array = "",
		slotId = 1206,
		parent_slot = 60102,
		place_id = 502,
		unlock_unit = 20152,
		work_unit = 1014,
		id = 206,
		objId = 10050031,
		unlock_type = 1
	}
end)()
