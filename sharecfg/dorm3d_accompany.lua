pg = pg or {}
pg.dorm3d_accompany = rawget(pg, "dorm3d_accompany") or setmetatable({
	__name = "dorm3d_accompany"
}, confNEO)
pg.dorm3d_accompany.all = {
	1,
	2,
	3,
	21,
	22,
	31,
	32,
	111,
	112,
	121,
	122,
	141,
	142,
	211,
	212
}
pg.dorm3d_accompany.get_id_list_by_ship_id = {
	[10517] = {
		111,
		112
	},
	[19903] = {
		31,
		32
	},
	[20220] = {
		1,
		2,
		3
	},
	[30221] = {
		21,
		22
	},
	[30707] = {
		121,
		122
	},
	[49905] = {
		141,
		142
	},
	[79902] = {
		211,
		212
	}
}
pg.base = pg.base or {}
pg.base.dorm3d_accompany = {}

;(function()
	pg.base.dorm3d_accompany[1] = {
		ship_id = 20220,
		name = "日常相伴",
		resource_room = 1,
		performance_time = 20,
		id = 1,
		image = "tianlangxing_accompany_room",
		timeline = "Xiangban_shinei",
		sceneInfo = "map_siriushostel_01|Tianlangxing_DB/SiriusHostel",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {}
	}
	pg.base.dorm3d_accompany[2] = {
		ship_id = 20220,
		name = "休闲相伴",
		resource_room = 4,
		performance_time = 20,
		id = 2,
		image = "tianlangxing_accompany_beach",
		timeline = "Xiangban_shatan",
		sceneInfo = "map_beach_01|Beach",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {
			5,
			4,
			20220
		}
	}
	pg.base.dorm3d_accompany[3] = {
		ship_id = 20220,
		name = "休闲相伴",
		resource_room = 16,
		performance_time = 20,
		id = 3,
		image = "cafe_accompany",
		timeline = "Xiangban_cafe_20220",
		sceneInfo = "map_publiccafe_01|Publiccafe",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {
			5,
			16,
			20220
		}
	}
	pg.base.dorm3d_accompany[21] = {
		ship_id = 30221,
		name = "日常相伴",
		resource_room = 2,
		performance_time = 20,
		id = 21,
		image = "nengdai_accompany_room",
		timeline = "Xiangban_shinei_ND",
		sceneInfo = "map_noshirohostel_01|Nengdai_DB/NoshiroHostel",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {}
	}
	pg.base.dorm3d_accompany[22] = {
		ship_id = 30221,
		name = "休闲相伴",
		resource_room = 4,
		performance_time = 20,
		id = 22,
		image = "tianlangxing_accompany_beach",
		timeline = "Xiangban_shatan_ND",
		sceneInfo = "map_beach_01|Beach",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {
			5,
			4,
			30221
		}
	}
	pg.base.dorm3d_accompany[31] = {
		ship_id = 19903,
		name = "日常相伴",
		resource_room = 3,
		performance_time = 20,
		id = 31,
		image = "ankeleiqi_accompany_room",
		timeline = "Xiangban_shinei_Ab",
		sceneInfo = "map_anchoragehostel_01|Ankeleiqi_DB/Anchoragehostel",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {}
	}
	pg.base.dorm3d_accompany[32] = {
		ship_id = 19903,
		name = "休闲相伴",
		resource_room = 4,
		performance_time = 20,
		id = 32,
		image = "tianlangxing_accompany_beach",
		timeline = "Xiangban_shatan_Ab",
		sceneInfo = "map_beach_01|Beach",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {
			5,
			4,
			19903
		}
	}
	pg.base.dorm3d_accompany[111] = {
		ship_id = 10517,
		name = "日常相伴",
		resource_room = 11,
		performance_time = 20,
		id = 111,
		image = "xinzexi_accompany_room",
		timeline = "Xiangban_personal_10517",
		sceneInfo = "map_newjerseyhostel_01|Xinzexi_DB/Newjerseyhostel",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {}
	}
	pg.base.dorm3d_accompany[112] = {
		ship_id = 10517,
		name = "休闲相伴",
		resource_room = 16,
		performance_time = 20,
		id = 112,
		image = "cafe_accompany",
		timeline = "Xiangban_cafe_10517",
		sceneInfo = "map_publiccafe_01|Publiccafe",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {
			5,
			16,
			10517
		}
	}
	pg.base.dorm3d_accompany[121] = {
		ship_id = 30707,
		name = "日常相伴",
		resource_room = 12,
		performance_time = 20,
		id = 121,
		image = "dafeng_accompany_room",
		timeline = "Xiangban_personal_30707",
		sceneInfo = "map_dafeng_01|Dafeng_DB/Dafenghostel",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {}
	}
	pg.base.dorm3d_accompany[122] = {
		ship_id = 30707,
		name = "休闲相伴",
		resource_room = 16,
		performance_time = 20,
		id = 122,
		image = "cafe_accompany",
		timeline = "Xiangban_cafe_30707",
		sceneInfo = "map_publiccafe_01|Publiccafe",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {
			5,
			16,
			30707
		}
	}
	pg.base.dorm3d_accompany[141] = {
		ship_id = 49905,
		name = "日常相伴",
		resource_room = 14,
		performance_time = 20,
		id = 141,
		image = "aijier_accompany_room",
		timeline = "Xiangban_personal_49905",
		sceneInfo = "map_aijier_01|Aijier_DB/Aijierhostel",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {}
	}
	pg.base.dorm3d_accompany[142] = {
		ship_id = 49905,
		name = "休闲相伴",
		resource_room = 16,
		performance_time = 20,
		id = 142,
		image = "cafe_accompany",
		timeline = "Xiangban_cafe_49905",
		sceneInfo = "map_publiccafe_01|Publiccafe",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {
			5,
			16,
			49905
		}
	}
	pg.base.dorm3d_accompany[211] = {
		ship_id = 79902,
		name = "日常相伴",
		resource_room = 21,
		performance_time = 20,
		id = 211,
		image = "naximofu_accompany_room",
		timeline = "Xiangban_personal_79902",
		sceneInfo = "map_naximofu_01|Naximofu_DB/Naximofuhostel",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {}
	}
	pg.base.dorm3d_accompany[212] = {
		ship_id = 79902,
		name = "休闲相伴",
		resource_room = 26,
		performance_time = 20,
		id = 212,
		image = "carwash_accompany",
		timeline = "Xiangban_carwash_79902",
		sceneInfo = "map_carwash_01|Carwash",
		favor = {
			300,
			{
				1015,
				1016,
				1017
			}
		},
		jump_trigger = {},
		unlock = {
			5,
			26,
			79902
		}
	}
end)()
