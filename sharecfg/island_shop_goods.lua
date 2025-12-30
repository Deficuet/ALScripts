pg = pg or {}
pg.island_shop_goods = setmetatable({
	__name = "island_shop_goods",
	all = {
		10000,
		10001,
		10002,
		10003,
		10004,
		10005,
		10006,
		10007,
		10008,
		10009,
		10010,
		10011,
		10012,
		10013,
		10014,
		10015,
		10016,
		10017,
		10018,
		10019,
		10020,
		10021,
		10022,
		10023,
		10024,
		10025,
		10026,
		10027,
		10028,
		10029,
		10030,
		10031,
		10032,
		10033,
		10034,
		10035,
		10036,
		10037,
		10038,
		10039,
		10040,
		10041,
		10042,
		10043,
		10044,
		10045,
		10046,
		10047,
		10048,
		10049,
		10050,
		10051,
		10052,
		10053,
		10054,
		10055,
		10056,
		10057,
		10058,
		10102,
		10103,
		10104,
		10105,
		10106,
		10107,
		10108,
		10109,
		10110,
		10111,
		10112,
		10113,
		10114,
		10115,
		10116,
		10117,
		10118,
		10119,
		10120,
		10121,
		10122,
		10123,
		10124,
		10125,
		10126,
		10127,
		10128,
		10129,
		10130,
		10131,
		10132,
		10133,
		10134,
		10135,
		10136,
		10137,
		10138,
		10139,
		10140,
		10141,
		10142,
		10143,
		10144,
		10145,
		10146,
		10147,
		10148,
		10149,
		10150,
		10151,
		10152,
		10153,
		10154,
		10155,
		10156,
		10157,
		10158,
		103000,
		103001,
		103002,
		103003,
		103004,
		411000,
		411001,
		411002,
		411003,
		411004,
		411005,
		411006,
		411007,
		411008,
		411009,
		411010,
		411011,
		411012,
		411014,
		411015,
		411016,
		411017,
		411018,
		411019,
		411020,
		411021,
		411022,
		411023,
		411024,
		412000,
		4600001,
		4600002,
		4600003,
		5010001,
		5020001,
		5030001,
		471070301,
		473120101,
		471051701
	}
}, confHX)
pg.base = pg.base or {}
pg.base.island_shop_goods = {
	[10000] = {
		desc = "指揮官用浮遊着せ替え「艦船ビット」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "艦船ビット",
		icon = "IslandDressIcon/dress_1020001",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				1020001,
				1
			}
		}
	},
	[10001] = {
		desc = "友好の握手は、信頼と協力の始まりである",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "握手",
		icon = "IslandActionIcon/handshake",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				2001,
				1
			}
		}
	},
	[10002] = {
		desc = "激動のジャンプは、勝利への最高の雄叫びである",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "元気ジャンプ",
		icon = "IslandActionIcon/vjump",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1008,
				1
			}
		}
	},
	[10003] = {
		desc = "努力によって築かれた偉業。全ての人に展示する価値がある",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "筋肉自慢",
		icon = "IslandActionIcon/muscle",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1011,
				1
			}
		}
	},
	[10004] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	},
	[10005] = {
		desc = "収穫したばかりの新鮮な小麦。小麦粉を作るのに欠かせない原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10005,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	},
	[10006] = {
		desc = "黄金色に実ったとうもろこし。畑に甘い香りが漂う。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "とうもろこし",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10006,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	},
	[10007] = {
		desc = "高品質な牧草。牧場に溢れるほどの活気を！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10007,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	},
	[10008] = {
		desc = "白くて上質な米。豊富なでんぷんと穀物たんぱく質を含む。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	},
	[10009] = {
		desc = "みずみずしくておいしい白菜。採れたて新鮮！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10009,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	},
	[10010] = {
		desc = "丸くてふっくら、たんぱく質が豊富。料理だけでなく工業にもいろいろ使われる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10010,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	},
	[10011] = {
		desc = "野菜界のでんぷん代表。様々な形に調理できる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "じゃがいも",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10011,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	},
	[10012] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10012,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	},
	[10013] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10013,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	},
	[10014] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10014,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	},
	[10015] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10015,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	},
	[10016] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10016,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	},
	[10017] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10017,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	},
	[10018] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10018,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	},
	[10019] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10019,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	},
	[10020] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10020,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	},
	[10021] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10021,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	},
	[10022] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10022,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	},
	[10023] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10023,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	},
	[10024] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10024,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	},
	[10025] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10025,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	},
	[10026] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10026,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	},
	[10027] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10027,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	},
	[10028] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10028,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	},
	[10029] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10029,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	},
	[10030] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10030,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	},
	[10031] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10031,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	},
	[10032] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10032,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	},
	[10033] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10033,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	},
	[10034] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10034,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	},
	[10035] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10035,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	},
	[10036] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10036,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	},
	[10037] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10037,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	},
	[10038] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10038,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	},
	[10039] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10039,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	},
	[10040] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10040,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	},
	[10041] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10041,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	},
	[10042] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10042,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	},
	[10043] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10043,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	},
	[10044] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10044,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	},
	[10045] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10045,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	},
	[10046] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10046,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	},
	[10047] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10047,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	},
	[10048] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10048,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	},
	[10049] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10049,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	},
	[10050] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10050,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	},
	[10051] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10051,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	},
	[10052] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10052,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	},
	[10053] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10053,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	},
	[10054] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10054,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	},
	[10055] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10055,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	},
	[10056] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10056,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	},
	[10057] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10057,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	},
	[10058] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10058,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	},
	[10102] = {
		desc = "指揮官用浮遊着せ替え「草わらの影」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "草わらの影",
		icon = "IslandDressIcon/dress_1010007",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 1000,
		discount = 0,
		groups_detail_type = "",
		id = 10102,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				46,
				1010007,
				1
			}
		}
	},
	[10103] = {
		desc = "ヒーロー登場！生き生きとした感情と生き方を表現する",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 1,
		unlock = "",
		goods_name = "ヒーロー登場",
		icon = "IslandActionIcon/herocoming",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 500,
		discount = 0,
		groups_detail_type = "",
		id = 10103,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			5000
		},
		items = {
			{
				51,
				1013,
				1
			}
		}
	},
	[10104] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10104,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	},
	[10105] = {
		desc = "収穫したばかりの新鮮な小麦。小麦粉を作るのに欠かせない原料。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "小麦",
		icon = "IslandProps/item_2000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10105,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2000,
				10
			}
		}
	},
	[10106] = {
		desc = "黄金色に実ったとうもろこし。畑に甘い香りが漂う。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "とうもろこし",
		icon = "IslandProps/item_2001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10106,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2001,
				10
			}
		}
	},
	[10107] = {
		desc = "高品質な牧草。牧場に溢れるほどの活気を！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "牧草",
		icon = "IslandProps/item_2008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10107,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2008,
				10
			}
		}
	},
	[10108] = {
		desc = "白くて上質な米。豊富なでんぷんと穀物たんぱく質を含む。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "米",
		icon = "IslandProps/item_2002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10108,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2002,
				10
			}
		}
	},
	[10109] = {
		desc = "みずみずしくておいしい白菜。採れたて新鮮！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "白菜",
		icon = "IslandProps/item_2003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10109,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2003,
				10
			}
		}
	},
	[10110] = {
		desc = "丸くてふっくら、たんぱく質が豊富。料理だけでなく工業にもいろいろ使われる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "大豆",
		icon = "IslandProps/item_2006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10110,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				2006,
				10
			}
		}
	},
	[10111] = {
		desc = "野菜界のでんぷん代表。様々な形に調理できる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "じゃがいも",
		icon = "IslandProps/item_2005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 40,
		discount = 0,
		groups_detail_type = "",
		id = 10111,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			400
		},
		items = {
			{
				41,
				2005,
				10
			}
		}
	},
	[10112] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10112,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	},
	[10113] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10113,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	},
	[10114] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10114,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	},
	[10115] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10115,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	},
	[10116] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10116,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	},
	[10117] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 6,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10117,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	},
	[10118] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10118,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	},
	[10119] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10119,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	},
	[10120] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10120,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	},
	[10121] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10121,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	},
	[10122] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10122,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	},
	[10123] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10123,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	},
	[10124] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10124,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	},
	[10125] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10125,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	},
	[10126] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10126,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	},
	[10127] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10127,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	},
	[10128] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 25,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10128,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	},
	[10129] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10129,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	},
	[10130] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10130,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	},
	[10131] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10131,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	},
	[10132] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10132,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	},
	[10133] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 8,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10133,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	},
	[10134] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 3,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10134,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	},
	[10135] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10135,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	},
	[10136] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10136,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	},
	[10137] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10137,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	},
	[10138] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10138,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	},
	[10139] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10139,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	},
	[10140] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10140,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	},
	[10141] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10141,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	},
	[10142] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 2,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10142,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	},
	[10143] = {
		desc = "星の輝きが煌めくチケット。「星彩賞」にて賞品を抽選可能。「星彩賞」開催期間終了時、自動で消費され抽選が行われます（余ったチケットはダイヤに変換されます）",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "星彩チケット",
		icon = "IslandGoodsIcon/170000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10143,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				8,
				170000,
				1
			}
		}
	},
	[10144] = {
		desc = "離島生活の基礎知識をまとめた指南教科書。使用すると、キャラクターの離島EXPが少し増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 50,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T1",
		icon = "IslandProps/item_100001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 20,
		discount = 0,
		groups_detail_type = "",
		id = 10144,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100001,
				1
			}
		}
	},
	[10145] = {
		desc = "離島生活の経験を詳しくまとめた指南教科書。使用すると、キャラクターの離島EXPがそこそこ増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 15,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T2",
		icon = "IslandProps/item_100002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10145,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100002,
				1
			}
		}
	},
	[10146] = {
		desc = "離島生活の経験を豊富にまとめた指南教科書。使用すると、キャラクターの離島EXPが大幅に増加する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "離島EXP教科書 T3",
		icon = "IslandProps/item_100003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1600,
		discount = 0,
		groups_detail_type = "",
		id = 10146,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			16000
		},
		items = {
			{
				41,
				100003,
				1
			}
		}
	},
	[10147] = {
		desc = "生産物スキルの基礎知識をまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが少し上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T1",
		icon = "IslandProps/item_100101",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 200,
		discount = 0,
		groups_detail_type = "",
		id = 10147,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			200
		},
		items = {
			{
				41,
				100101,
				1
			}
		}
	},
	[10148] = {
		desc = "生産物スキルの知識を詳しくまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルがそこそこ上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T2",
		icon = "IslandProps/item_100102",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 400,
		discount = 0,
		groups_detail_type = "",
		id = 10148,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			4000
		},
		items = {
			{
				41,
				100102,
				1
			}
		}
	},
	[10149] = {
		desc = "生産物スキルの知識を豊富にまとめた指南教科書。使用すると、キャラクターの離島開発における生産物スキルレベルが大幅に上昇する。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "生産スキル教科書 T3",
		icon = "IslandProps/item_100103",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 1500,
		discount = 0,
		groups_detail_type = "",
		id = 10149,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			15000
		},
		items = {
			{
				41,
				100103,
				1
			}
		}
	},
	[10150] = {
		desc = "離島開発経験の結晶。キャラの突破に必要な素材",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 5,
		limited_show = 1,
		unlock = "",
		goods_name = "離島開発結晶",
		icon = "IslandProps/item_100201",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 2000,
		discount = 0,
		groups_detail_type = "",
		id = 10150,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20000
		},
		items = {
			{
				41,
				100201,
				1
			}
		}
	},
	[10151] = {
		desc = "インクの香りとノスタルジックな雰囲気を纏うハードカバー本。机上に置き、幾度となく読み返すにふさわしい一冊。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "特装本",
		icon = "IslandGoodsIcon/gift02",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10151,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180002,
				1
			}
		}
	},
	[10152] = {
		desc = "華やかで新鮮な花々。自然の生命力と明るい彩りがあふれ、日々に心地よい喜びを運んでくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "花束",
		icon = "IslandGoodsIcon/gift03",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10152,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180003,
				1
			}
		}
	},
	[10153] = {
		desc = "流麗なシルエットが金属の冷たい輝きを放つ礼装の剣。秩序と威厳を無言で物語る。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "儀式剣",
		icon = "IslandGoodsIcon/gift04",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10153,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180004,
				1
			}
		}
	},
	[10154] = {
		desc = "ふわふわ手触りの愛らしいぬいぐるみ。抱きしめれば、もふもふで温かい感触と無邪気な笑顔が心を和ませてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ふわふわのぬいぐるみ",
		icon = "IslandGoodsIcon/gift05",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10154,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180005,
				1
			}
		}
	},
	[10155] = {
		desc = "時の流れが深み増し、気品を宿したアンティークな調度品。静かに佇むそれが、空間に落ち着きと趣を添えてくれる。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "アンティーク装飾品",
		icon = "IslandGoodsIcon/gift06",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10155,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180006,
				1
			}
		}
	},
	[10156] = {
		desc = "華美ではないものの、繊細で細やかな技に輝く一品。日常の小さな瞬間を明るく照らすだろう。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "精緻なアクセサリー",
		icon = "IslandGoodsIcon/gift07",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10156,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180007,
				1
			}
		}
	},
	[10157] = {
		desc = "簡素な瓶には清らかな香りが秘められている。上品さ格調を映し出す、優雅なフレグランス。",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "高級香水",
		icon = "IslandGoodsIcon/gift08",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10157,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180008,
				1
			}
		}
	},
	[10158] = {
		desc = "余暇を完璧に満たしてくれるエンタメアイテム。ラクラクで遊べるコンテンツが揃っていて、心配りの行き届いた贈り物である",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 4,
		limited_show = 1,
		unlock = "",
		goods_name = "ゲーム機セット",
		icon = "IslandGoodsIcon/gift09",
		goods_detail_type = 1,
		time = "always",
		remian_show = 1,
		pt_award = 300,
		discount = 0,
		groups_detail_type = "",
		id = 10158,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			3000
		},
		items = {
			{
				2,
				180009,
				1
			}
		}
	},
	[103000] = {
		desc = "コッコートリ専用の飼料。小麦を加工して作れる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "コッコートリの餌",
		icon = "IslandProps/item_3000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2000,
			30
		},
		items = {
			{
				41,
				3000,
				10
			}
		}
	},
	[103001] = {
		desc = "ブーブーブタ専用の飼料。とうもろこしを加工して作れる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "ブーブーブタの餌",
		icon = "IslandProps/item_3001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2001,
			30
		},
		items = {
			{
				41,
				3001,
				10
			}
		}
	},
	[103002] = {
		desc = "モーモーウシ専用の飼料。牧草を加工して作れる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "モーモーウシの餌",
		icon = "IslandProps/item_3002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2008,
			30
		},
		items = {
			{
				41,
				3002,
				10
			}
		}
	},
	[103003] = {
		desc = "メェメーヒツジ専用の飼料。牧草を加工して作れる",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "メェメーヒツジの餌",
		icon = "IslandProps/item_3003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2008,
			30
		},
		items = {
			{
				41,
				3003,
				10
			}
		}
	},
	[103004] = {
		desc = "小麦を挽いた小麦粉",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "小麦粉",
		icon = "IslandProps/item_3004",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 103004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			2000,
			6
		},
		items = {
			{
				41,
				3004,
				1
			}
		}
	},
	[411000] = {
		desc = "購入で「小麦の種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "小麦の種",
		icon = "IslandProps/item_1000",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20
		},
		items = {
			{
				41,
				1000,
				1
			}
		}
	},
	[411001] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「とうもろこしの種」を入手可能",
		goods_name = "とうもろこしの種",
		icon = "IslandProps/item_1001",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40
		},
		items = {
			{
				41,
				1001,
				1
			}
		},
		unlock = {
			3101002
		}
	},
	[411002] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「陸稲の種」を入手可能",
		goods_name = "陸稲の種",
		icon = "IslandProps/item_1002",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			40
		},
		items = {
			{
				41,
				1002,
				1
			}
		},
		unlock = {
			3101005
		}
	},
	[411003] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「白菜の種」を入手可能",
		goods_name = "白菜の種",
		icon = "IslandProps/item_1003",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60
		},
		items = {
			{
				41,
				1003,
				1
			}
		},
		unlock = {
			3101006
		}
	},
	[411004] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「ニンジンの種」を入手可能",
		goods_name = "ニンジンの種",
		icon = "IslandProps/item_1004",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411004,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1004,
				1
			}
		},
		unlock = {
			3502006
		}
	},
	[411005] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「じゃがいもの種」を入手可能",
		goods_name = "じゃがいもの種",
		icon = "IslandProps/item_1005",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411005,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20
		},
		items = {
			{
				41,
				1005,
				1
			}
		},
		unlock = {
			3101008
		}
	},
	[411006] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「大豆の種」を入手可能",
		goods_name = "大豆の種",
		icon = "IslandProps/item_1006",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411006,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60
		},
		items = {
			{
				41,
				1006,
				1
			}
		},
		unlock = {
			3101007
		}
	},
	[411007] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「玉ねぎの種」を入手可能",
		goods_name = "玉ねぎの種",
		icon = "IslandProps/item_1007",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411007,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1007,
				1
			}
		},
		unlock = {
			3502007
		}
	},
	[411008] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「牧草の種」を入手可能",
		goods_name = "牧草の種",
		icon = "IslandProps/item_1008",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411008,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			20
		},
		items = {
			{
				41,
				1008,
				1
			}
		},
		unlock = {
			3101003
		}
	},
	[411009] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「コーヒーの木の種」を入手可能",
		goods_name = "コーヒーの木の種",
		icon = "IslandProps/item_1009",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411009,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1009,
				1
			}
		},
		unlock = {
			3101004
		}
	},
	[411010] = {
		desc = "購入で「亜麻の種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "亜麻の種",
		icon = "IslandProps/item_1010",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411010,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60
		},
		items = {
			{
				41,
				1010,
				1
			}
		}
	},
	[411011] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「いちごの種」を入手可能",
		goods_name = "いちごの種",
		icon = "IslandProps/item_1011",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411011,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1011,
				1
			}
		},
		unlock = {
			3502002
		}
	},
	[411012] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「綿の種」を入手可能",
		goods_name = "綿の種",
		icon = "IslandProps/item_1012",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411012,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			80
		},
		items = {
			{
				41,
				1012,
				1
			}
		},
		unlock = {
			3502003
		}
	},
	[411014] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「茶の木の種」を入手可能",
		goods_name = "茶の木の種",
		icon = "IslandProps/item_1014",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411014,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			150
		},
		items = {
			{
				41,
				1014,
				1
			}
		},
		unlock = {
			3502004
		}
	},
	[411015] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「ラベンダーの種」を入手可能",
		goods_name = "ラベンダーの種",
		icon = "IslandProps/item_1015",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411015,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			160
		},
		items = {
			{
				41,
				1015,
				1
			}
		},
		unlock = {
			3502005
		}
	},
	[411016] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「りんごの木の種」を入手可能",
		goods_name = "りんごの木の種",
		icon = "IslandProps/item_1016",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411016,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			100
		},
		items = {
			{
				41,
				1016,
				1
			}
		},
		unlock = {
			3501001
		}
	},
	[411017] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「柑橘類の木の種」を入手可能",
		goods_name = "柑橘類の木の種",
		icon = "IslandProps/item_1017",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411017,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				1017,
				1
			}
		},
		unlock = {
			3501002
		}
	},
	[411018] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「バナナの木の種」を入手可能",
		goods_name = "バナナの木の種",
		icon = "IslandProps/item_1018",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411018,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			140
		},
		items = {
			{
				41,
				1018,
				1
			}
		},
		unlock = {
			3501003
		}
	},
	[411019] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「マンゴーの木の種」を入手可能",
		goods_name = "マンゴーの木の種",
		icon = "IslandProps/item_1019",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411019,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				1019,
				1
			}
		},
		unlock = {
			3501004
		}
	},
	[411020] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「レモンの木の種」を入手可能",
		goods_name = "レモンの木の種",
		icon = "IslandProps/item_1020",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411020,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			80
		},
		items = {
			{
				41,
				1020,
				1
			}
		},
		unlock = {
			3501005
		}
	},
	[411021] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「アボカドの木の種」を入手可能",
		goods_name = "アボカドの木の種",
		icon = "IslandProps/item_1021",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411021,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			240
		},
		items = {
			{
				41,
				1021,
				1
			}
		},
		unlock = {
			3501006
		}
	},
	[411022] = {
		pay_id = 0,
		goods_have = 0,
		items_model = "",
		have_show = 0,
		limited_show = 0,
		limited_num = 0,
		desc = "購入で「ゴムの木の種」を入手可能",
		goods_name = "ゴムの木の種",
		icon = "IslandProps/item_1022",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411022,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			280
		},
		items = {
			{
				41,
				1022,
				1
			}
		},
		unlock = {
			3501007
		}
	},
	[411023] = {
		desc = "購入で「宵月梨の種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "宵月梨の種",
		icon = "IslandProps/item_4006",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411023,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			120
		},
		items = {
			{
				41,
				4006,
				1
			}
		},
		time = {
			{
				{
					2025,
					9,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					2,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	},
	[411024] = {
		desc = "購入で「柿の種」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "柿の種",
		icon = "IslandProps/item_4008",
		goods_detail_type = 1,
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 411024,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			180
		},
		items = {
			{
				41,
				4008,
				1
			}
		},
		time = {
			{
				{
					2025,
					9,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					2,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	},
	[412000] = {
		desc = "購入で「着せ替えカラー」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 0,
		limited_show = 0,
		unlock = "",
		goods_name = "着せ替えカラー",
		icon = "IslandGoodsIcon/3",
		goods_detail_type = 1,
		time = "always",
		remian_show = 0,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 412000,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			100
		},
		items = {
			{
				41,
				3,
				1
			}
		}
	},
	[4600001] = {
		desc = "キャラ用浮遊着せ替え「ワタアメ雲」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "ワタアメ雲",
		icon = "IslandDressIcon/dress_2020001",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4600001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2020001,
				1
			}
		}
	},
	[4600002] = {
		desc = "キャラ用足跡着せ替え「舞桜見物」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "舞桜見物",
		icon = "IslandDressIcon/dress_2030004",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4600002,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2030004,
				1
			}
		}
	},
	[4600003] = {
		desc = "キャラ用背中着せ替え「ロケットパック」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "ロケットパック",
		icon = "IslandDressIcon/dress_2010001",
		goods_detail_type = 2,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 4600003,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			200
		},
		items = {
			{
				46,
				2010001,
				1
			}
		}
	},
	[5010001] = {
		desc = "進行中のタスクを1分間短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 100,
		limited_show = 1,
		unlock = "",
		goods_name = "1分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket1",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5010001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			1000
		},
		items = {
			{
				50,
				10001,
				1
			}
		},
		time = {
			{
				{
					2025,
					9,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					2,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	},
	[5020001] = {
		desc = "進行中のタスクを10分間短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 30,
		limited_show = 1,
		unlock = "",
		goods_name = "10分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket2",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5020001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			10000
		},
		items = {
			{
				50,
				20001,
				1
			}
		},
		time = {
			{
				{
					2025,
					9,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					2,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	},
	[5030001] = {
		desc = "進行中のタスクを60分間短縮できる。開発をもっとスピーディーに！",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 0,
		limited_num = 10,
		limited_show = 1,
		unlock = "",
		goods_name = "60分加速券（シーズン）",
		icon = "IslandGoodsIcon/item_speedup_ticket3",
		goods_detail_type = 1,
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 5030001,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			41,
			1,
			60000
		},
		items = {
			{
				50,
				30001,
				1
			}
		},
		time = {
			{
				{
					2025,
					9,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					2,
					5
				},
				{
					12,
					0,
					0
				}
			}
		}
	},
	[471070301] = {
		desc = "サラトガの離島キャラ用衣装着せ替え・「キャンバスデー」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "キャンバスデー",
		icon = "IslandGoodsIcon/skin_1070301",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471070301,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1070301,
				1
			}
		}
	},
	[473120101] = {
		desc = "明石の離島キャラ用衣装着せ替え・「空鈴の夜」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "空鈴の夜",
		icon = "IslandGoodsIcon/skin_3120101",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 473120101,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				3120101,
				1
			}
		}
	},
	[471051701] = {
		desc = "ニュージャージーの離島キャラ用衣装着せ替え・「日々ステップ」を入手可能",
		goods_have = 0,
		items_model = "",
		pay_id = 0,
		have_show = 1,
		limited_num = 1,
		limited_show = 0,
		unlock = "",
		goods_name = "日々ステップ",
		icon = "IslandGoodsIcon/skin_1051701",
		goods_detail_type = 4,
		time = "always",
		remian_show = 1,
		pt_award = 0,
		discount = 0,
		groups_detail_type = "",
		id = 471051701,
		weight = 0,
		discount_time = "",
		model_param = {
			{
				0,
				0
			},
			0,
			1
		},
		resource_consume = {
			1,
			14,
			900
		},
		items = {
			{
				47,
				1051701,
				1
			}
		}
	}
}
