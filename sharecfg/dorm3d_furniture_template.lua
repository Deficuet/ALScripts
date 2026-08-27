pg = pg or {}
pg.dorm3d_furniture_template = rawget(pg, "dorm3d_furniture_template") or setmetatable({
	__name = "dorm3d_furniture_template"
}, confNEO)
pg.dorm3d_furniture_template.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	121,
	122,
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
	221,
	222,
	223,
	151,
	251,
	301,
	302,
	303,
	304,
	305,
	306,
	307,
	321,
	322,
	401,
	323,
	324,
	1101,
	1102,
	1103,
	1104,
	1105,
	1106,
	1107,
	1108,
	1151,
	1152,
	1153,
	1154,
	1201,
	1202,
	1203,
	1211,
	1212,
	1213,
	1214,
	1215,
	1221,
	1222,
	1223,
	1401,
	1402,
	1403,
	1411,
	1412,
	1413,
	1414,
	1415,
	1461,
	1462,
	1463,
	1468,
	2101,
	2102,
	2103,
	2111,
	2112,
	2113,
	2114,
	2115,
	2161
}
pg.dorm3d_furniture_template.get_id_list_by_room_id = {
	{
		1,
		2,
		3,
		4,
		5,
		6,
		121,
		122,
		151
	},
	{
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
		221,
		222,
		223,
		251
	},
	{
		301,
		302,
		303,
		304,
		305,
		306,
		307,
		321,
		322,
		323,
		324
	},
	{
		401
	},
	[11] = {
		1101,
		1102,
		1103,
		1104,
		1105,
		1106,
		1107,
		1108,
		1151,
		1152,
		1153,
		1154
	},
	[12] = {
		1201,
		1202,
		1203,
		1211,
		1212,
		1213,
		1214,
		1215,
		1221,
		1222,
		1223
	},
	[14] = {
		1401,
		1402,
		1403,
		1411,
		1412,
		1413,
		1414,
		1415,
		1461,
		1462,
		1463,
		1468
	},
	[21] = {
		2101,
		2102,
		2103,
		2111,
		2112,
		2113,
		2114,
		2115,
		2161
	}
}
pg.base = pg.base or {}
pg.base.dorm3d_furniture_template = {}

;(function()
	pg.base.dorm3d_furniture_template[1] = {
		name = "吧台椅",
		rarity = 3,
		unlock_tips = "",
		type = 6,
		is_special = 0,
		room_id = 1,
		icon = "dorm3dIcon/3Ddrom_tianlangxing_CommonFurniture5",
		desc = "做工精细的吧台椅，由黑色木质底座和红色皮革坐垫组成。坐垫厚度适中，即使久坐也不会感到疲劳。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 1,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			100202
		},
		touch_id = {
			{
				20220,
				10100201
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[2] = {
		name = "榨汁机",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 1,
		is_special = 0,
		desc = "只需将水果或蔬菜切成小块，放入其中并按下启动键即可。功能齐全，使用方便，厨房新手必备佳品。 ",
		icon = "dorm3dIcon/3Ddrom_tianlangxing_CommonFurniture4",
		acesses = "",
		model = "Pay_Siriushostel/pre_db_sh_electrical03",
		unlock_banners = "",
		id = 2,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			100201
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[3] = {
		name = "经典沙发",
		rarity = 3,
		unlock_tips = "",
		type = 5,
		is_special = 0,
		room_id = 1,
		icon = "dorm3dIcon/3Ddrom_tianlangxing_CommonFurniture6",
		desc = "造型经典，长度适宜的皮质沙发。不仅可以为客厅增添一抹奢华气息，更能提供舒适的坐享体验。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 3,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			100301
		},
		touch_id = {
			{
				20220,
				10100303
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[4] = {
		name = "简约木床",
		rarity = 3,
		unlock_tips = "",
		type = 4,
		is_special = 0,
		room_id = 1,
		icon = "dorm3dIcon/3Ddrom_tianlangxing_CommonFurniture3",
		desc = "床架由坚固耐用的木材制成，可以轻松支撑起使用者的重量。设计简单舒适，足够使用者拥有一个好梦。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 4,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			100102
		},
		touch_id = {
			{
				20220,
				10100104
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[5] = {
		name = "台灯",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 1,
		is_special = 0,
		desc = "天狼星梳妆台上的台灯。夜晚光线不佳时，她便会打开这盏台灯。似乎是想时刻方便自己检查仪容，以方便用最佳的状态来迎接所思所念之人。",
		icon = "dorm3dIcon/3Ddrom_tianlangxing_CommonFurniture2",
		acesses = "",
		model = "Pay_Siriushostel/pre_db_sh_chandelier01",
		unlock_banners = "",
		id = 5,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			100101
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[6] = {
		name = "邮轮模型",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 1,
		is_special = 0,
		desc = "邮轮之旅结束后，天狼星亲自购买并手动拼装的邮轮模型。或许寄托着少女某些小小的心思。 ",
		icon = "dorm3dIcon/3Ddrom_tianlangxing_CommonFurniture1",
		acesses = "",
		model = "Pay_Siriushostel/pre_db_sh_decoration01",
		unlock_banners = "",
		id = 6,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			100402
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[121] = {
		name = "甜蜜心事",
		rarity = 4,
		is_special = 0,
		type = 4,
		icon = "dorm3dIcon/3Ddrom_tianlangxing_PremiumFurniture4",
		room_id = 1,
		desc = "床身各处点缀着可爱的蝴蝶结装饰。红白色调的枕头和被子，营造出甜蜜浪漫的氛围。",
		acesses = "",
		model = "Pay_Siriushostel/pre_db_sh_bed01",
		id = 121,
		is_exclusive = 1,
		scene_hides = "",
		target_slots = {
			100102
		},
		touch_id = {
			{
				20220,
				10100107
			}
		},
		shop_id = {
			270101
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture121"
		}
	}
	pg.base.dorm3d_furniture_template[122] = {
		name = "午后遐乡",
		rarity = 4,
		is_special = 0,
		type = 5,
		icon = "dorm3dIcon/3Ddrom_tianlangxing_PremiumFurniture2",
		room_id = 1,
		desc = "舒适的躺椅沙发。\n柔软舒适的沙发上摆放着靠枕和毯子，方便使用者随时入睡。",
		acesses = "",
		model = "Pay_Siriushostel/pre_db_sh_chair02",
		id = 122,
		is_exclusive = 1,
		scene_hides = "",
		target_slots = {
			100301
		},
		touch_id = {
			{
				20220,
				10100202
			}
		},
		shop_id = {
			270103
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture122"
		}
	}
	pg.base.dorm3d_furniture_template[201] = {
		name = "简然舒眠",
		rarity = 3,
		unlock_tips = "",
		type = 4,
		is_special = 0,
		room_id = 2,
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture1",
		desc = "配色素雅的榻榻米床铺，清爽大方，柔软而舒适。\n躺下的一刻，疲惫尽散。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 201,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			120103
		},
		touch_id = {
			{
				30221,
				2200310
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[202] = {
		name = "惬意一餐",
		rarity = 3,
		unlock_tips = "",
		type = 6,
		is_special = 0,
		room_id = 2,
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture2",
		desc = "相对而坐，轻声细语间，食物的气味在空气中弥漫。\n在她的笑容中，连时光都变得温柔起来。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 202,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			120203
		},
		touch_id = {
			{
				30221,
				2200210
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[203] = {
		name = "午后微风",
		rarity = 3,
		unlock_tips = "",
		type = 5,
		is_special = 0,
		room_id = 2,
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture3",
		desc = "令人安心的植物材质上，承载着闲适的小憩时光。\n微风带来阵阵清香，伴随着细碎的响声，编织着完美的午后。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 203,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			120303
		},
		touch_id = {
			{
				30221,
				2200110
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[204] = {
		name = "瓶中暖意",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 2,
		is_special = 0,
		desc = "素雅的瓷器勾勒出优美的线条，盛开的花朵是最美的点缀。\n花香与器形相得益彰，为空间增添一份生机与雅致。",
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture4",
		acesses = "",
		model = "Pay_Noshirohostel/pre_db_nh_vase01",
		unlock_banners = "",
		id = 204,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			120101
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[205] = {
		name = "啾啾玩偶",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 2,
		is_special = 0,
		desc = "可爱的形态总能勾起会心的微笑，细腻的做工传递着温暖的心意。\n它安静地守候在角落，却是空间里最暖心的存在。",
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture5",
		acesses = "",
		model = "Pay_Noshirohostel/pre_db_nh_toy02",
		unlock_banners = "",
		id = 205,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			120102
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[206] = {
		name = "杯沿春色",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 2,
		is_special = 0,
		desc = "春日，粉嫩花瓣轻抚杯沿，如同一抹温柔的风景。\n让人想起与她置身于浪漫唯美的樱花雨下，尽享茶韵与春意的美妙时光。",
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture6",
		acesses = "",
		model = "Pay_Noshirohostel/pre_db_nh_tableware02",
		unlock_banners = "",
		id = 206,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			120201
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[207] = {
		name = "一支青霄",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 2,
		is_special = 0,
		desc = "挺拔的枝干优雅延伸，如同云端的诗意。\n疏密有致的枝叶间，是生命向往闲适与自得的悠然姿态。",
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture7",
		acesses = "",
		model = "",
		unlock_banners = "",
		id = 207,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			120202
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[208] = {
		name = "闲时留白",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 2,
		is_special = 0,
		desc = "简约的瓷盆与翠绿的植物，演绎着留白的艺术。\n不张扬的生命力，却能让整个空间充满禅意般的宁静。",
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture8",
		acesses = "",
		model = "",
		unlock_banners = "",
		id = 208,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			120301
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[209] = {
		name = "瓶中灿景",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 2,
		is_special = 0,
		desc = "玲珑的器形中绽放着季节的色彩，花枝自然舒展，仿佛一幅流动的画卷。\n每一次插花都是对美的重新诠释。",
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture9",
		acesses = "",
		model = "Pay_Noshirohostel/pre_db_nh_vase02",
		unlock_banners = "",
		id = 209,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			120302
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[210] = {
		name = "好运将至",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 2,
		is_special = 0,
		desc = "福气降至，吉祥如意。\n圆滚可爱的造型为整个空间都带来了温馨的韵味。",
		icon = "dorm3dIcon/3Ddrom_nengdai_CommonFurniture10",
		acesses = "",
		model = "Pay_Noshirohostel/pre_db_nh_decoration02",
		unlock_banners = "",
		id = 210,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			120202
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[221] = {
		name = "柔软怀抱",
		rarity = 4,
		is_special = 0,
		type = 4,
		icon = "dorm3dIcon/3Ddrom_nengdai_PremiumFurniture1",
		room_id = 2,
		desc = "柔软的触感，适宜的温度，能将整个人温柔地包裹。\n不论是依偎还是拥抱，都是和它相处的最舒适姿态。",
		acesses = "",
		model = "Pay_Noshirohostel/pre_db_nh_bed01",
		id = 221,
		is_exclusive = 1,
		scene_hides = "",
		target_slots = {
			120103
		},
		touch_id = {
			{
				30221,
				2200410
			}
		},
		shop_id = {
			270201
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture221"
		}
	}
	pg.base.dorm3d_furniture_template[222] = {
		name = "对坐之谈",
		rarity = 3,
		is_special = 0,
		type = 6,
		icon = "dorm3dIcon/3Ddrom_nengdai_PremiumFurniture2",
		room_id = 2,
		desc = "宽敞的餐桌承载着每一次的喜悦与期待。\n精心布置的座位，静候着一场私密相聚。",
		acesses = "",
		model = "Pay_Noshirohostel/pre_db_nh_diningroom01",
		id = 222,
		is_exclusive = 1,
		target_slots = {
			120203
		},
		touch_id = {
			{
				30221,
				2200610
			}
		},
		shop_id = {
			270202
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture222"
		},
		scene_hides = {
			"fbx/no_bake_pay_prop/diningroom"
		}
	}
	pg.base.dorm3d_furniture_template[223] = {
		name = "安逸时光",
		rarity = 4,
		is_special = 0,
		type = 5,
		icon = "dorm3dIcon/3Ddrom_nengdai_PremiumFurniture3",
		room_id = 2,
		desc = "柔软的布艺包裹着疲惫的身躯，靠枕轻轻拥住每一个慵懒的姿态。\n这里是一天中最温柔的角落，让人不自觉沉醉其中。",
		acesses = "",
		model = "Pay_Noshirohostel/pre_db_nh_livingroom01",
		id = 223,
		is_exclusive = 1,
		target_slots = {
			120303
		},
		touch_id = {
			{
				30221,
				2200710
			}
		},
		shop_id = {
			270203
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture223"
		},
		scene_hides = {
			"fbx/no_bake_pay_prop/livingroom"
		}
	}
	pg.base.dorm3d_furniture_template[151] = {
		name = "圣诞雪橇沙发套组",
		rarity = 5,
		is_special = 1,
		type = 5,
		icon = "dorm3dIcon/3Ddrom_tianlangxing_PremiumFurniture5",
		room_id = 1,
		desc = "雪花飘落、烛光温馨，圣诞之约。\n造型别致的驯鹿雪橇上是柔软的坐垫和舒服的毛毯，交织着祝福与期待的星光下还隐藏着一份令人期待的小惊喜。\n圣诞晚餐后，在这份温暖与美好间，说不定还会发生一些美好的小故事。",
		acesses = "",
		model = "Pay_Siriushostel/Sh_Sp_Xmas/pre_db_sp_sh_xmas01",
		id = 151,
		is_exclusive = 1,
		target_slots = {
			100301
		},
		touch_id = {
			{
				20220,
				10100203
			}
		},
		shop_id = {
			270104
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture151"
		},
		scene_hides = {
			"fbx/litmap_03/pre_db_chandelier06",
			"fbx/litmap_03/pre_db_table02",
			"fbx/litmap_03/pre_db_ceram01",
			"fbx/litmap_03/pre_db_ceram01b (1)",
			"fbx/litmap_03/pre_db_book01"
		}
	}
	pg.base.dorm3d_furniture_template[251] = {
		name = "暖意入梦",
		rarity = 5,
		is_special = 1,
		type = 5,
		icon = "dorm3dIcon/3Ddrom_nengdai_PremiumFurniture251",
		room_id = 2,
		desc = "被炉里温暖的气息，让人想起冬日里懒洋洋的午后。\n阳光透过窗棂，洒在榻榻米上，与被炉的暖意交织，仿佛能融化所有的疲惫。",
		acesses = "",
		model = "Pay_Noshirohostel/Nh_Sp_NewYearsDay/pre_db_nh_sp_nyd_livingroom01",
		id = 251,
		is_exclusive = 1,
		target_slots = {
			120303
		},
		touch_id = {
			{
				30221,
				2200510
			}
		},
		shop_id = {
			270105
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture251"
		},
		scene_hides = {
			"fbx/no_bake_pay_prop/livingroom"
		}
	}
	pg.base.dorm3d_furniture_template[301] = {
		name = "海盐曲奇木床",
		rarity = 3,
		unlock_tips = "",
		type = 4,
		is_special = 0,
		room_id = 3,
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_CommonFurniture2",
		desc = "小熊曲奇饼干形状的床头，简洁又不失童趣。\n躺在这张床上，仿佛能嗅到海盐曲奇的香气，让人忘却疲惫，进入甜蜜的梦乡。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 301,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			130103
		},
		touch_id = {
			{
				19903,
				1990330
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[302] = {
		name = "湛蓝奇趣",
		rarity = 3,
		unlock_tips = "",
		type = 6,
		is_special = 0,
		room_id = 3,
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_CommonFurniture3",
		desc = "彩色的装饰与此刻绽放的想象力都让这一方湛蓝的小天地布满了奇妙的气息。在这片小角落，即使下着雨也会有好心情",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 302,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			130202
		},
		touch_id = {
			{
				19903,
				1990320
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[303] = {
		name = "曲奇沙发",
		rarity = 3,
		unlock_tips = "",
		type = 5,
		is_special = 0,
		room_id = 3,
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_CommonFurniture1",
		desc = "仿佛刚刚出炉的曲奇饼干，散发出温暖的香气。\n每一处弧线都充满了童趣与甜蜜，打造最治愈的角落。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 303,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			130302
		},
		touch_id = {
			{
				19903,
				1990310
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[304] = {
		name = "海洋生物玩偶",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 3,
		is_special = 0,
		desc = "造型可爱的海洋生物玩偶，采用柔软织物填充。\n抱在怀中十分舒适。",
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_CommonFurniture5",
		acesses = "",
		model = "Pay_Anchoragehostel/pre_db_ah_toy05",
		unlock_banners = "",
		id = 304,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			130101
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[305] = {
		name = "自然之息",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 3,
		is_special = 0,
		desc = "小小的绿意。层层叠叠。\n无论是放在哪里，都能为你的空间增添一份自然的治愈。",
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_CommonFurniture4",
		acesses = "",
		model = "Pay_Anchoragehostel/pre_db_ah_pottedplant01",
		unlock_banners = "",
		id = 305,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			130102
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[306] = {
		name = "时光印记",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 3,
		is_special = 0,
		desc = "一组清新风格的画框，装点着充满童趣风格的画作。\n或许有一天，画框中会被放入最珍贵的回忆。",
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_CommonFurniture6",
		acesses = "",
		model = "Pay_Anchoragehostel/pre_db_ah_billboard01_group01",
		unlock_banners = "",
		id = 306,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			130201
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[307] = {
		name = "海洋奇遇",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 3,
		is_special = 0,
		desc = "不仅是一件装饰品，更像是一个开关。\n轻轻一按就让窗户变成了通往海洋的魔法窗口。",
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_CommonFurniture7",
		acesses = "",
		model = "Pay_Anchoragehostel/pre_db_ah_decoration02",
		unlock_banners = "",
		id = 307,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			130301
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[321] = {
		name = "童心下午茶",
		rarity = 4,
		is_special = 0,
		type = 6,
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_PremiumFurniture1",
		room_id = 3,
		desc = "咖啡杯中盛着的是属于幻想时刻的自得与惬意，童话故事中的下午茶时光，属于在这方天地中的每一个人。",
		acesses = "",
		model = "Pay_Anchoragehostel/pre_db_ah_entertainmentarea01",
		id = 321,
		is_exclusive = 1,
		target_slots = {
			130202
		},
		touch_id = {
			{
				19903,
				1990340
			}
		},
		shop_id = {
			270301
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture321"
		},
		scene_hides = {
			"fbx/no_bake_pay_prop/entertainmentarea"
		}
	}
	pg.base.dorm3d_furniture_template[322] = {
		name = "星河满船",
		rarity = 4,
		is_special = 0,
		type = 4,
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_PremiumFurniture2",
		room_id = 3,
		desc = "船型设计搭配深邃的海蓝色调，柔软的床铺仿佛漂浮在夜空下，让人沉醉于浪漫的冒险情怀。",
		acesses = "",
		model = "Pay_Anchoragehostel/pre_db_ah_bedroom01",
		id = 322,
		is_exclusive = 1,
		target_slots = {
			130103
		},
		touch_id = {
			{
				19903,
				1990350
			}
		},
		shop_id = {
			270302
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture322"
		},
		scene_hides = {
			"fbx/no_bake_pay_prop/bedroom"
		}
	}
	pg.base.dorm3d_furniture_template[401] = {
		name = "滨海欢愉 ",
		rarity = 5,
		is_exclusive = 0,
		type = 3,
		is_special = 1,
		room_id = 4,
		icon = "dorm3dIcon/3Ddrom_beach_PremiumFurniture1",
		desc = "度假时间开始~！椰树下的阳光，海岸边的清凉。从高处直冲而下时，迎面扑来海风混合着飞溅的水珠。只是刹那间就跃入了一片假期的欢愉。",
		acesses = "",
		model = "pay_publicplace/slide",
		id = 401,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			140101
		},
		shop_id = {
			270401
		},
		unlock_tips = {
			7
		},
		unlock_banners = {
			"banner_furniture401"
		}
	}
	pg.base.dorm3d_furniture_template[323] = {
		name = "云中甜梦",
		rarity = 4,
		is_special = 0,
		type = 5,
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_PremiumFurniture8",
		room_id = 3,
		desc = "轻轻晃动的蓬松云朵，柔软细腻的触感，或许这就是坐进一团棉花糖的感觉，和她一起在诱人的香甜气息中享受轻松时光吧。 ",
		acesses = "",
		model = "Pay_Anchoragehostel/pre_db_ah_livingroom01",
		id = 323,
		is_exclusive = 1,
		target_slots = {
			130302
		},
		touch_id = {
			{
				19903,
				1990360
			}
		},
		shop_id = {
			270303
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture323"
		},
		scene_hides = {
			"fbx/no_bake_pay_prop/livingroom"
		}
	}
	pg.base.dorm3d_furniture_template[324] = {
		name = "童心乐园 ",
		rarity = 5,
		is_special = 1,
		type = 4,
		icon = "dorm3dIcon/3Ddrom_ankeleiqi_PremiumFurniture9",
		room_id = 3,
		desc = "松软甜蜜的心形抱枕，闪烁星光的玩具灯球，一同点缀着海蓝色的甜蜜美梦，欢迎进入无忧无虑的童心乐园。",
		acesses = "",
		model = "Pay_Anchoragehostel/Ah_Sp_ValentinesDay/pre_db_aklq_sp_vd01",
		id = 324,
		is_exclusive = 1,
		target_slots = {
			130103
		},
		touch_id = {
			{
				19903,
				1990370
			}
		},
		shop_id = {
			270304
		},
		unlock_tips = {
			8
		},
		unlock_banners = {
			"banner_furniture324"
		},
		scene_hides = {
			"fbx/no_bake_pay_prop/bedroom",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01",
			"fbx/no_bake/pre_db_anchoragehostel01_lamp01_night"
		}
	}
	pg.base.dorm3d_furniture_template[1101] = {
		name = "兔兔摇篮",
		rarity = 3,
		unlock_tips = "",
		type = 4,
		is_special = 0,
		room_id = 11,
		icon = "dorm3dIcon/3Ddrom_xinzexi_CommonFurniture1",
		desc = "注重体验的舒适大床，结构稳定，坚固耐用。抱着柔软的兔兔抱枕入睡，或许会梦见星河下的胡萝卜庄园？",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 1101,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			1110102
		},
		touch_id = {
			{
				10517,
				1051730
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1102] = {
		name = "极冰纪元",
		rarity = 3,
		unlock_tips = "",
		type = 6,
		is_special = 0,
		room_id = 11,
		icon = "dorm3dIcon/3Ddrom_xinzexi_CommonFurniture2",
		desc = "以简约线条勾勒未来美学，搭载澎湃制冷系统。提供酸素可乐畅饮，为生活注入冰爽与惬意。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 1102,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			1110203
		},
		touch_id = {
			{
				10517,
				1051710
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1103] = {
		name = "日光棉岛",
		rarity = 3,
		unlock_tips = "",
		type = 5,
		is_special = 0,
		room_id = 11,
		icon = "dorm3dIcon/3Ddrom_xinzexi_CommonFurniture3",
		desc = "一款经典的布艺沙发，质感蓬松柔软。每当午后阳光洒落其上，这里就是最适合打盹的一小块漂浮陆地。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 1103,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			1110303
		},
		touch_id = {
			{
				10517,
				1051720
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1104] = {
		name = "惑星夜灯",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 11,
		is_special = 0,
		desc = "形似行星的台灯，在夜晚静静发出朦胧微光。深空之中，总有一颗不熄灭的星星在静静守候着你。",
		icon = "dorm3dIcon/3Ddrom_xinzexi_CommonFurniture6",
		acesses = "",
		model = "Pay_Newjerseyhostel/pre_db_njh_electrical03",
		unlock_banners = "",
		id = 1104,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1110101
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1105] = {
		name = "装饰画",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 11,
		is_special = 0,
		desc = "精美的装饰画，为咖啡店增添艺术气息和美感，让咖啡时光更具温馨。",
		icon = "dorm3dIcon/3Ddrom_xinzexi_CommonFurniture5",
		acesses = "",
		model = "Pay_Newjerseyhostel/pre_db_njh_billboard01",
		unlock_banners = "",
		id = 1105,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1110301
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1106] = {
		name = "静谧深蓝",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 11,
		is_special = 0,
		desc = "轻轻拧动开关，柔光如流水般漫溢而出，水母群浮游于深蓝色的虚空。是从何时……坠入了这如梦似幻的海洋？",
		icon = "dorm3dIcon/3Ddrom_xinzexi_CommonFurniture7",
		acesses = "",
		model = "Pay_Newjerseyhostel/pre_db_njh_fishtank01",
		unlock_banners = "",
		id = 1106,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1110302
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1107] = {
		name = "微波炉",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 11,
		is_special = 0,
		desc = "方便快捷的加热工具，无论是早餐还是下午茶，都能让美食保持温暖，为每一餐增添一份贴心的关怀。",
		icon = "dorm3dIcon/3Ddrom_xinzexi_CommonFurniture8",
		acesses = "",
		model = "Pay_Newjerseyhostel/pre_db_njh_electrical04",
		unlock_banners = "",
		id = 1107,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1110201
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1108] = {
		name = "绿意盆栽",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 11,
		is_special = 0,
		desc = "别小看它，美化环境的同时还能净化空气哦~",
		icon = "dorm3dIcon/3Ddrom_xinzexi_CommonFurniture9",
		acesses = "",
		model = "Pay_Newjerseyhostel/pre_db_njh_pottedplant01",
		unlock_banners = "",
		id = 1108,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1110202
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1151] = {
		name = "星空一隅",
		rarity = 4,
		is_special = 0,
		type = 5,
		icon = "dorm3dIcon/3Ddrom_xinzexi_PremiumFurniture1",
		room_id = 11,
		desc = "未来感十足的新概念卡座，同步配置了智能控温功能。24小时供应冰镇饮品，诠释对服务和舒适的极致追求。",
		acesses = "",
		model = "Pay_Newjerseyhostel/pre_db_njh_livingroom01",
		id = 1151,
		is_exclusive = 1,
		target_slots = {
			1110303
		},
		touch_id = {
			{
				10517,
				1051740
			}
		},
		shop_id = {
			271101
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture1151"
		},
		scene_hides = {
			"no_bake_pay_prop/livingroom"
		}
	}
	pg.base.dorm3d_furniture_template[1152] = {
		name = "动感飞轮",
		rarity = 5,
		is_special = 1,
		type = 5,
		icon = "dorm3dIcon/3Ddrom_xinzexi_PremiumFurniture4",
		room_id = 11,
		desc = "专业的健身器材，甚至考虑到了使用者的精神娱乐需求。\n只要蹬上踏板，足不出户也能开启一段心跳加速的畅快旅途。",
		acesses = "",
		model = "Pay_Newjerseyhostel/pre_db_njh_entertainment01",
		id = 1152,
		is_exclusive = 1,
		target_slots = {
			1110303
		},
		touch_id = {
			{
				10517,
				1051750
			}
		},
		shop_id = {
			270204
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture1152"
		},
		scene_hides = {
			"no_bake_pay_prop/livingroom"
		}
	}
	pg.base.dorm3d_furniture_template[1153] = {
		name = "天外庇所 ",
		rarity = 4,
		is_special = 0,
		type = 4,
		icon = "dorm3dIcon/3Ddrom_xinzexi_PremiumFurniture2",
		room_id = 11,
		desc = "将科技美学转化为私密的休憩空间，构建出一处甜蜜的天外庇护所。\n投身其中，就仿佛置身于遥远星空外的温暖角落。",
		acesses = "",
		model = "Pay_Newjerseyhostel/pre_db_njh_bedroom01",
		id = 1153,
		is_exclusive = 1,
		target_slots = {
			1110102
		},
		touch_id = {
			{
				10517,
				1051760
			}
		},
		shop_id = {
			270205
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture1153"
		},
		scene_hides = {
			"no_bake_pay_prop/bedroom"
		}
	}
	pg.base.dorm3d_furniture_template[1154] = {
		name = "智能冰箱IB-7",
		rarity = 4,
		is_special = 0,
		type = 6,
		icon = "dorm3dIcon/3Ddrom_xinzexi_PremiumFurniture3",
		room_id = 11,
		desc = "您好，欢迎使用智能冰箱IB-7。\n现打草莓冰激凌已制作完成，就是您最喜欢的口味。\n想要更多个性化推荐吗？该功能暂未开发，敬请期待吧！",
		acesses = "",
		model = "Pay_Newjerseyhostel/pre_db_njh_kitchen01",
		id = 1154,
		is_exclusive = 1,
		scene_hides = "",
		target_slots = {
			1110204
		},
		touch_id = {
			{
				10517,
				1051780
			}
		},
		shop_id = {
			270206
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture1154"
		}
	}
	pg.base.dorm3d_furniture_template[1201] = {
		name = "温馨软床 ",
		rarity = 3,
		unlock_tips = "",
		type = 4,
		is_special = 0,
		room_id = 12,
		icon = "dorm3dIcon/3Ddrom_dafeng_CommonFurniture1",
		desc = "温馨柔软的双人床，床铺上铺着舒适的床垫，被褥枕头齐全，随时都能钻进被窝缓解一天积攒下来的疲劳。",
		acesses = "",
		model = "",
		id = 1201,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			1120103
		},
		touch_id = {
			{
				30707,
				3070710
			}
		},
		shop_id = {},
		unlock_banners = {
			"banner_furniture1151"
		}
	}
	pg.base.dorm3d_furniture_template[1202] = {
		name = "木制餐桌",
		rarity = 3,
		unlock_tips = "",
		type = 6,
		is_special = 0,
		room_id = 12,
		icon = "dorm3dIcon/3Ddrom_dafeng_CommonFurniture2",
		desc = "只有椅面和椅背的简约座椅，专为榻榻米设计，搭配柔软坐垫使用舒适，即使久坐也不用担心肌肉疲劳。",
		acesses = "",
		model = "",
		id = 1202,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			1120203
		},
		touch_id = {
			{
				30707,
				3070720
			}
		},
		shop_id = {},
		unlock_banners = {
			"banner_furniture1151"
		}
	}
	pg.base.dorm3d_furniture_template[1203] = {
		name = "简约座椅",
		rarity = 3,
		unlock_tips = "",
		type = 5,
		is_special = 0,
		room_id = 12,
		icon = "dorm3dIcon/3Ddrom_dafeng_CommonFurniture3",
		desc = "由坚固耐用的优质木材制成的桌子，桌面光滑平整便于清理，深色耐脏还原檀木本身质感。",
		acesses = "",
		model = "",
		id = 1203,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			1120303
		},
		touch_id = {
			{
				30707,
				3070730
			}
		},
		shop_id = {},
		unlock_banners = {
			"banner_furniture1152"
		}
	}
	pg.base.dorm3d_furniture_template[1211] = {
		name = "古典挂画",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 12,
		is_special = 0,
		desc = "古典挂画，淡雅节制，禅意自然，色彩与室内风格匹配协调，为宿舍增添一份宁静与雅致。 ",
		icon = "dorm3dIcon/3Ddrom_dafeng_CommonFurniture4",
		acesses = "",
		model = "Pay_Dafenghostel/pre_db_df_wallscrolls01",
		unlock_banners = "",
		id = 1211,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1120301
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1212] = {
		name = "黑色比基尼",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 12,
		is_special = 0,
		desc = "黑色的比基尼泳衣，材质轻盈柔软，穿上仿若无物十分舒适。 ",
		icon = "dorm3dIcon/3Ddrom_dafeng_CommonFurniture5",
		acesses = "",
		model = "Pay_Dafenghostel/pre_db_df_cloth01",
		unlock_banners = "",
		id = 1212,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1120101
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1213] = {
		name = "落地灯",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 12,
		is_special = 0,
		desc = "方形高挑的木制灯立在地板上，从内向外散发着柔和的光晕，是她精心挑选的装饰用光源。 ",
		icon = "dorm3dIcon/3Ddrom_dafeng_CommonFurniture6",
		acesses = "",
		model = "Pay_Dafenghostel/pre_db_df_floorlamp01",
		unlock_banners = "",
		id = 1213,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1120302
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1214] = {
		name = "半透明屏风",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 12,
		is_special = 0,
		desc = "一扇半透明的屏风，屏风上绘有精致的花纹，她喜欢将屏风放在床边，屏风的半透明设计给室内增添了一丝暧昧。 ",
		icon = "dorm3dIcon/3Ddrom_dafeng_CommonFurniture7",
		acesses = "",
		model = "Pay_Dafenghostel/pre_db_df_frame01",
		unlock_banners = "",
		id = 1214,
		touch_id = "",
		target_slots = {
			1120102
		},
		shop_id = {},
		scene_hides = {
			"no_bake_prop_substitute/pre_db_frame32"
		}
	}
	pg.base.dorm3d_furniture_template[1215] = {
		name = "小夜灯",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 12,
		is_special = 0,
		desc = "造型可爱的小夜灯，内部有藤木枝条的装饰，灯光温暖柔和，为宿舍增添一份温馨。 ",
		icon = "dorm3dIcon/3Ddrom_dafeng_CommonFurniture8",
		acesses = "",
		model = "Pay_Dafenghostel/pre_db_df_desklamp01",
		unlock_banners = "",
		id = 1215,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1120104
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1221] = {
		name = "爱之巢",
		rarity = 4,
		unlock_tips = "",
		type = 4,
		is_special = 0,
		room_id = 12,
		icon = "dorm3dIcon/3Ddrom_dafeng_PremiumFurniture1",
		desc = "一张以简约风格为主的双人床，选用了高强度材料，坚固的金属框架可以承担相当大的拉力而不被折损，搭配精心挑选的记忆棉床垫，保证睡眠安全舒适。 ",
		acesses = "",
		model = "Pay_Dafenghostel/pre_db_df_bedroom_01",
		id = 1221,
		is_exclusive = 1,
		target_slots = {
			1120103
		},
		touch_id = {
			{
				30707,
				3070740
			}
		},
		shop_id = {
			270501
		},
		unlock_banners = {
			"banner_furniture1221"
		},
		scene_hides = {
			"no_bake_pay_prop/bedroom"
		}
	}
	pg.base.dorm3d_furniture_template[1222] = {
		name = "花乐留韵",
		rarity = 5,
		is_special = 1,
		type = 99,
		icon = "dorm3dIcon/3Ddrom_dafeng_PremiumFurniture2",
		room_id = 12,
		desc = "淡雅的光晕透出，抚过绽开的花瓣，留下她动人的身影。花影与乐声交织，仿佛自然的低语流淌其中。",
		acesses = "",
		model = "Pay_Dafenghostel/pre_db_df_tedian01",
		id = 1222,
		is_exclusive = 1,
		target_slots = {
			1120304
		},
		touch_id = {
			{
				30707,
				3070750
			}
		},
		shop_id = {
			270502
		},
		unlock_tips = {
			8
		},
		unlock_banners = {
			"banner_furniture1222"
		},
		scene_hides = {
			"no_bake_pay_prop/entertainment"
		}
	}
	pg.base.dorm3d_furniture_template[1223] = {
		name = "绯樱雅席 ",
		rarity = 4,
		is_special = 0,
		type = 5,
		icon = "dorm3dIcon/3Ddrom_dafeng_PremiumFurniture3",
		room_id = 12,
		desc = "古典纸灯映照绯红长绸，茶香氤氲间可见精巧茶器，两侧樱瓣坐垫点缀榻榻米，恰成一方典雅待客之所。 ",
		acesses = "",
		model = "Pay_Dafenghostel/pre_db_df_livingroom_01",
		id = 1223,
		is_exclusive = 1,
		target_slots = {
			1120303
		},
		touch_id = {
			{
				30707,
				3070760
			}
		},
		shop_id = {
			270503
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture1223"
		},
		scene_hides = {
			"no_bake_pay_prop/livingroom"
		}
	}
	pg.base.dorm3d_furniture_template[1401] = {
		name = "丝绒软床",
		rarity = 3,
		unlock_tips = "",
		type = 4,
		is_special = 0,
		room_id = 14,
		icon = "dorm3dIcon/3Ddrom_aijier_CommonFurniture1",
		desc = "采用经典双人床设计，黑色床头搭配红色丝绒被褥，柔软的床垫与枕头为疲惫的身心提供了温暖的庇护。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 1401,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			1140101
		},
		touch_id = {
			{
				49905,
				4990510
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1402] = {
		name = "简约书桌",
		rarity = 3,
		unlock_tips = "",
		type = 6,
		is_special = 0,
		room_id = 14,
		icon = "dorm3dIcon/3Ddrom_aijier_CommonFurniture2",
		desc = "该书桌采用黑色木料制成，搭配简约的红色座椅，整体设计既实用又充满古典气息。 ",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 1402,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			1140201
		},
		touch_id = {
			{
				49905,
				4990520
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1403] = {
		name = "真皮沙发",
		rarity = 3,
		unlock_tips = "",
		type = 5,
		is_special = 0,
		room_id = 14,
		icon = "dorm3dIcon/3Ddrom_aijier_CommonFurniture3",
		desc = "真皮沙发，柔软舒适，搭配圆形小茶几，是享受个人时光的理想角落。 ",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 1403,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			1140301
		},
		touch_id = {
			{
				49905,
				4990530
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1411] = {
		name = "长杆蜡烛",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 14,
		is_special = 0,
		desc = "经典象牙白长杆蜡烛，烛光温暖柔和，为夜晚增添一份宁静与浪漫的氛围。 ",
		icon = "dorm3dIcon/3Ddrom_aijier_CommonFurniture4",
		acesses = "",
		model = "Pay_Aijierhostel/pre_db_aje_decoration01",
		unlock_banners = "",
		id = 1411,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1140303
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1412] = {
		name = "绿意盆栽",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 14,
		is_special = 0,
		desc = "高大的盆栽植物，叶片宽大碧绿，不仅为房间增添生机，还能有效净化空气。 ",
		icon = "dorm3dIcon/3Ddrom_aijier_CommonFurniture5",
		acesses = "",
		model = "Pay_Aijierhostel/pre_db_aje_bonsai01",
		unlock_banners = "",
		id = 1412,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1140202
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1413] = {
		name = "护眼台灯",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 14,
		is_special = 0,
		desc = "书桌上的小台灯，从内向外散发着温暖的光晕，为夜晚阅读或工作提供舒适的照明。 ",
		icon = "dorm3dIcon/3Ddrom_aijier_CommonFurniture6",
		acesses = "",
		model = "Pay_Aijierhostel/pre_db_aje_desklamp01_on",
		unlock_banners = "",
		id = 1413,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1140103
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1414] = {
		name = "老式相机",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 14,
		is_special = 0,
		desc = "一台经典的复古相机，保留了老式相机的独特设计，适合喜欢摄影的人收藏使用。 ",
		icon = "dorm3dIcon/3Ddrom_aijier_CommonFurniture7",
		acesses = "",
		model = "Pay_Aijierhostel/pre_db_aje_camera01",
		unlock_banners = "",
		id = 1414,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1140102
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1415] = {
		name = "肖像画",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 14,
		is_special = 0,
		desc = "一幅风格古典的抽象派肖像画，鲜艳与深邃的色彩相互矛盾却又并存，意外地和房间的氛围很搭。",
		icon = "dorm3dIcon/3Ddrom_aijier_CommonFurniture8",
		acesses = "",
		model = "Pay_Aijierhostel/pre_db_aje_billboard01",
		unlock_banners = "",
		id = 1415,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			1140302
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[1461] = {
		name = "真红谧影",
		rarity = 4,
		is_special = 0,
		type = 4,
		icon = "dorm3dIcon/3Ddrom_aijier_PremiumFurniture1",
		room_id = 14,
		desc = "私密与浪漫的避风港，红色丝绒被褥与可拉床帘组合，在夜色中轻松享受静谧与温馨。 ",
		acesses = "",
		model = "Pay_Aijierhostel/pre_db_aijier_bed01",
		id = 1461,
		is_exclusive = 1,
		target_slots = {
			1140101
		},
		touch_id = {
			{
				49905,
				4990540
			}
		},
		shop_id = {
			270601
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture1461"
		},
		scene_hides = {
			"no_bake_pay_prop/bedroom"
		}
	}
	pg.base.dorm3d_furniture_template[1462] = {
		name = "知韵沉思",
		rarity = 4,
		is_special = 0,
		type = 6,
		icon = "dorm3dIcon/3Ddrom_aijier_PremiumFurniture2",
		room_id = 14,
		desc = "采用古典设计的书桌，表面光滑平整，框架坚实牢固，还兼具着储物的作用，是学习和工作的不二之选。",
		acesses = "",
		model = "Pay_Aijierhostel/pre_db_aijier_study01",
		id = 1462,
		is_exclusive = 1,
		target_slots = {
			1140201
		},
		touch_id = {
			{
				49905,
				4990550
			}
		},
		shop_id = {
			270602
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture1462"
		},
		scene_hides = {
			"no_bake_pay_prop/study"
		}
	}
	pg.base.dorm3d_furniture_template[1463] = {
		name = "深红逸趣",
		rarity = 4,
		is_special = 0,
		type = 5,
		icon = "dorm3dIcon/3Ddrom_aijier_PremiumFurniture3",
		room_id = 14,
		desc = "通体真皮材质，低调奢华，搭配精致茶几，将生活的惬意与趣味都凝聚于此。",
		acesses = "",
		model = "Pay_Aijierhostel/pre_db_aijier_living01",
		id = 1463,
		is_exclusive = 1,
		target_slots = {
			1140301
		},
		touch_id = {
			{
				49905,
				4990560
			}
		},
		shop_id = {
			270603
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture1463"
		},
		scene_hides = {
			"no_bake_pay_prop/livingroom"
		}
	}
	pg.base.dorm3d_furniture_template[1468] = {
		name = "悸动一刻",
		rarity = 5,
		is_special = 1,
		type = 99,
		icon = "dorm3dIcon/3Ddrom_aijier_PremiumFurniture4",
		room_id = 14,
		desc = "奢华与诱惑，浪漫与激情，感受那波涛汹涌下的悸动吧。",
		acesses = "",
		model = "Pay_Aijierhostel/pre_db_aijier_special01",
		id = 1468,
		is_exclusive = 1,
		target_slots = {
			1140104
		},
		touch_id = {
			{
				49905,
				4990570
			}
		},
		shop_id = {
			270604
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture1468"
		},
		scene_hides = {
			"no_bake_pay_prop/entertainment"
		}
	}
	pg.base.dorm3d_furniture_template[2101] = {
		name = "纸壳小窝 ",
		rarity = 3,
		unlock_tips = "",
		type = 4,
		is_special = 0,
		room_id = 21,
		icon = "dorm3dIcon/3Ddrom_naximofu_CommonFurniture1",
		desc = "纸板拼接而成的小窝，轻巧易挪动，简约却又不失舒适，很适合她喜欢蜷缩在小地方的睡眠习惯。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 2101,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			2210101
		},
		touch_id = {
			{
				79902,
				7990210
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[2102] = {
		name = "多用置物架",
		rarity = 3,
		unlock_tips = "",
		type = 6,
		is_special = 0,
		room_id = 21,
		icon = "dorm3dIcon/3Ddrom_naximofu_CommonFurniture2",
		desc = "五层开放格架从地面延伸到视线平行处，书籍、工具等物件各得其所。生活的痕迹就摆在那里，每一格都是随手可触的日常。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 2102,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			2210201
		},
		touch_id = {
			{
				79902,
				7990220
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[2103] = {
		name = "阳光暖意沙发",
		rarity = 3,
		unlock_tips = "",
		type = 5,
		is_special = 0,
		room_id = 21,
		icon = "dorm3dIcon/3Ddrom_naximofu_CommonFurniture3",
		desc = "纯白沙发围成温暖的转角，橙色靠垫如阳光碎片点缀其间。搭配同色矮桌与绒毯，每一处都适合放松休息。",
		unlock_banners = "",
		acesses = "",
		model = "",
		id = 2103,
		is_exclusive = 0,
		scene_hides = "",
		target_slots = {
			2210301
		},
		touch_id = {
			{
				79902,
				7990230
			}
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[2111] = {
		name = "窗边绿植",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 21,
		is_special = 0,
		desc = "摆放在窗边的绿色盆栽，枝干挺拔，叶片舒展，为房间注入满满的生机与自然气息。",
		icon = "dorm3dIcon/3Ddrom_naximofu_CommonFurniture4",
		acesses = "",
		model = "Pay_Naximofuhostel/pre_db_nxmf_flowerpot01",
		unlock_banners = "",
		id = 2111,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			2210303
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[2112] = {
		name = "猫猫坐垫",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 21,
		is_special = 0,
		desc = "厚实柔软的圆形坐垫，放在哪里，哪里就成了可以赖着不走的地方。",
		icon = "dorm3dIcon/3Ddrom_naximofu_CommonFurniture5",
		acesses = "",
		model = "Pay_Naximofuhostel/pre_db_nxmf_cushion01",
		unlock_banners = "",
		id = 2112,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			2210304
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[2113] = {
		name = "原子球模型",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 21,
		is_special = 0,
		desc = "原子球与晶体结构的科学艺术装置，既可作为物理爱好者的收藏，也是格调独特的桌面摆件。",
		icon = "dorm3dIcon/3Ddrom_naximofu_CommonFurniture6",
		acesses = "",
		model = "Pay_Naximofuhostel/pre_db_nxmf_decoration01",
		unlock_banners = "",
		id = 2113,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			2210302
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[2114] = {
		name = "黄釉圆瓶",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 21,
		is_special = 0,
		desc = "圆滚滚的黄色瓷瓶，釉面温润光亮，造型憨厚可爱，像一只被拉长的甜甜圈。",
		icon = "dorm3dIcon/3Ddrom_naximofu_CommonFurniture7",
		acesses = "",
		model = "Pay_Naximofuhostel/pre_db_nxmf_ceram01",
		unlock_banners = "",
		id = 2114,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			2210103
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[2115] = {
		name = "香薰瓶",
		rarity = 2,
		unlock_tips = "",
		type = 3,
		is_exclusive = 0,
		room_id = 21,
		is_special = 0,
		desc = "明黄色的陶瓷小瓶中插着纤细的扩香棒，无需点燃香气便悄然弥漫，缓缓充盈整个房间。",
		icon = "dorm3dIcon/3Ddrom_naximofu_CommonFurniture8",
		acesses = "",
		model = "Pay_Naximofuhostel/pre_db_nxmf_cosmetic01",
		unlock_banners = "",
		id = 2115,
		touch_id = "",
		scene_hides = "",
		target_slots = {
			2210102
		},
		shop_id = {}
	}
	pg.base.dorm3d_furniture_template[2161] = {
		name = "魔方检测仪",
		rarity = 4,
		is_special = 0,
		type = 6,
		icon = "dorm3dIcon/3Ddrom_naximofu_PremiumFurniture1",
		room_id = 21,
		desc = "圆形的检测仪缓缓转动，屏幕上的数据如星河流淌，按下启动键的那一刻，或许会揭开什么科学奥秘呢~",
		acesses = "",
		model = "Pay_Naximofuhostel/pre_db_naximofu_basement01",
		id = 2161,
		is_exclusive = 1,
		target_slots = {
			2210201
		},
		touch_id = {
			{
				79902,
				7990240
			}
		},
		shop_id = {
			270701
		},
		unlock_tips = {
			3
		},
		unlock_banners = {
			"banner_furniture2161"
		},
		scene_hides = {
			"no_bake_pay_prop/basement/pre_db_naximofu_basement01_0"
		}
	}
end)()
