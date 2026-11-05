pg = pg or {}
pg.island_action = rawget(pg, "island_action") or setmetatable({
	__name = "island_action"
}, confNEO)
pg.island_action.all = {
	1000,
	1001,
	1002,
	1003,
	1004,
	1005,
	1006,
	1007,
	1008,
	1009,
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
	1027,
	1028,
	1029,
	1030,
	1031,
	1032,
	1033,
	1034,
	1035,
	1036,
	2000,
	2001,
	2002,
	2003,
	2004,
	2005,
	2006,
	2007
}
pg.island_action.get_id_list_by_type = {
	{
		1000,
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1007,
		1008,
		1009,
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
		1027,
		1028,
		1029,
		1030,
		1031,
		1032,
		1033,
		1034,
		1035,
		1036
	},
	{
		2000,
		2001,
		2002,
		2003,
		2004,
		2005,
		2006,
		2007
	}
}
pg.base = pg.base or {}
pg.base.island_action = {}

;(function()
	pg.base.island_action[1000] = {
		respond_dir = 0,
		name = "打招呼",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的打招呼，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "hi",
		tech_id = 0,
		id = 1000,
		responder_feedback = "",
		chara_sigle_action_reply = {
			101,
			102,
			104
		},
		jump_page = {}
	}
	pg.base.island_action[1001] = {
		respond_dir = 0,
		name = "道别",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的道别，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "bye",
		tech_id = 0,
		id = 1001,
		responder_feedback = "",
		chara_sigle_action_reply = {
			101
		},
		jump_page = {}
	}
	pg.base.island_action[1002] = {
		respond_dir = 0,
		name = "点头",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的点头，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "nod",
		tech_id = 0,
		id = 1002,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			105
		},
		jump_page = {}
	}
	pg.base.island_action[1003] = {
		respond_dir = 0,
		name = "摇头",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的摇头，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "shakehead",
		tech_id = 0,
		id = 1003,
		responder_feedback = "",
		chara_sigle_action_reply = {
			202,
			207
		},
		jump_page = {}
	}
	pg.base.island_action[1004] = {
		respond_dir = 0,
		name = "拍手",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的拍手，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "clap",
		tech_id = 0,
		id = 1004,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			105
		},
		jump_page = {}
	}
	pg.base.island_action[1005] = {
		respond_dir = 0,
		name = "赞美太阳",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的赞美太阳，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "handsup",
		tech_id = 0,
		id = 1005,
		responder_feedback = "",
		chara_sigle_action_reply = {
			204,
			207
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1006] = {
		respond_dir = 0,
		name = "叉腰",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的叉腰，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "akimbo",
		tech_id = 0,
		id = 1006,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106
		},
		jump_page = {}
	}
	pg.base.island_action[1007] = {
		respond_dir = 0,
		name = "鞠躬",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的鞠躬，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "bow",
		tech_id = 0,
		id = 1007,
		responder_feedback = "",
		chara_sigle_action_reply = {
			105,
			204
		},
		jump_page = {
			{
				"图鉴",
				{}
			}
		}
	}
	pg.base.island_action[1008] = {
		respond_dir = 0,
		name = "胜利起跳",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的胜利起跳，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "vjump",
		tech_id = 0,
		id = 1008,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			204
		},
		jump_page = {
			{
				"开发季I-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1009] = {
		respond_dir = 0,
		name = "跺脚",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的跺脚，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "stomp",
		tech_id = 0,
		id = 1009,
		responder_feedback = "",
		chara_sigle_action_reply = {
			201,
			207
		},
		jump_page = {}
	}
	pg.base.island_action[1011] = {
		respond_dir = 0,
		name = "展示肌肉",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的展示肌肉，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "muscle",
		tech_id = 0,
		id = 1011,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			204
		},
		jump_page = {
			{
				"开发季I-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1012] = {
		respond_dir = 0,
		name = "跳舞",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的跳舞，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "dance",
		tech_id = 0,
		id = 1012,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			204
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1013] = {
		respond_dir = 0,
		name = "英雄登场",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的英雄登场，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "herocoming",
		tech_id = 0,
		id = 1013,
		responder_feedback = "",
		chara_sigle_action_reply = {
			204,
			207
		},
		jump_page = {
			{
				"开发季I-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1014] = {
		respond_dir = 0,
		name = "伸懒腰",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的伸懒腰，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "stretch",
		tech_id = 0,
		id = 1014,
		responder_feedback = "",
		chara_sigle_action_reply = {
			207
		},
		jump_page = {
			{
				"开发季II-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1015] = {
		respond_dir = 0,
		name = "害怕",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的害怕，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "fearshake",
		tech_id = 0,
		id = 1015,
		responder_feedback = "",
		chara_sigle_action_reply = {
			201,
			207
		},
		jump_page = {
			{
				"开发季II-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1016] = {
		respond_dir = 0,
		name = "抱拳",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的抱拳，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "holdfist",
		tech_id = 0,
		id = 1016,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			107
		},
		jump_page = {
			{
				"开发季II-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1017] = {
		respond_dir = 0,
		name = "自夸",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的自夸，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "vouch",
		tech_id = 0,
		id = 1017,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			108
		},
		jump_page = {
			{
				"开发季II-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1018] = {
		respond_dir = 0,
		name = "打坐",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的打坐，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "float",
		tech_id = 0,
		id = 1018,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			108
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1019] = {
		respond_dir = 0,
		name = "拒绝",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的拒绝，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "refuse",
		tech_id = 0,
		id = 1019,
		responder_feedback = "",
		chara_sigle_action_reply = {
			204,
			207
		},
		jump_page = {
			{
				"开发季III-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1020] = {
		respond_dir = 0,
		name = "打哈欠",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的打哈欠，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "yawn",
		tech_id = 0,
		id = 1020,
		responder_feedback = "",
		chara_sigle_action_reply = {
			108,
			207
		},
		jump_page = {
			{
				"开发季III-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1021] = {
		respond_dir = 0,
		name = "擦汗",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的擦汗，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "wipingsweat",
		tech_id = 0,
		id = 1021,
		responder_feedback = "",
		chara_sigle_action_reply = {
			204
		},
		jump_page = {
			{
				"开发季III-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1022] = {
		respond_dir = 0,
		name = "挠头",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的挠头，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "scratchinghead",
		tech_id = 0,
		id = 1022,
		responder_feedback = "",
		chara_sigle_action_reply = {
			105,
			106
		},
		jump_page = {
			{
				"开发季III-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1023] = {
		respond_dir = 0,
		name = "投篮",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的投篮，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "shootingbasketball",
		tech_id = 0,
		id = 1023,
		responder_feedback = "",
		chara_sigle_action_reply = {
			102,
			106
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1024] = {
		respond_dir = 0,
		name = "飞吻",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的飞吻，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "blowkisses",
		tech_id = 0,
		id = 1024,
		responder_feedback = "",
		chara_sigle_action_reply = {
			102,
			104,
			105
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1025] = {
		respond_dir = 0,
		name = "前指",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的前指，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "point",
		tech_id = 0,
		id = 1025,
		responder_feedback = "",
		chara_sigle_action_reply = {
			105,
			204
		},
		jump_page = {
			{
				"开发季IV-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1026] = {
		respond_dir = 0,
		name = "迎宾",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的迎宾，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "welcome",
		tech_id = 0,
		id = 1026,
		responder_feedback = "",
		chara_sigle_action_reply = {
			102,
			107
		},
		jump_page = {
			{
				"开发季IV-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1027] = {
		respond_dir = 0,
		name = "审视",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的审视，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "lookover",
		tech_id = 0,
		id = 1027,
		responder_feedback = "",
		chara_sigle_action_reply = {
			105,
			201
		},
		jump_page = {
			{
				"开发季IV-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1028] = {
		respond_dir = 0,
		name = "拍肚皮",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的拍肚皮，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "slapbelly",
		tech_id = 0,
		id = 1028,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			207
		},
		jump_page = {
			{
				"开发季IV-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1029] = {
		respond_dir = 0,
		name = "瞌睡",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的瞌睡，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "doze",
		tech_id = 0,
		id = 1029,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			108
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1030] = {
		respond_dir = 0,
		name = "原地蹦跳",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的原地蹦跳，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "jumpinplace",
		tech_id = 0,
		id = 1030,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			104
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1031] = {
		respond_dir = 0,
		name = "练功",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的练功，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "kungfu",
		tech_id = 0,
		id = 1031,
		responder_feedback = "",
		chara_sigle_action_reply = {
			104,
			106
		},
		jump_page = {
			{
				"开发季V-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1032] = {
		respond_dir = 0,
		name = "揉肚子",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的揉肚子，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "rub",
		tech_id = 0,
		id = 1032,
		responder_feedback = "",
		chara_sigle_action_reply = {
			108,
			203
		},
		jump_page = {
			{
				"开发季V-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1033] = {
		respond_dir = 0,
		name = "躲避",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的躲避，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "dodge",
		tech_id = 0,
		id = 1033,
		responder_feedback = "",
		chara_sigle_action_reply = {
			202,
			103
		},
		jump_page = {
			{
				"开发季V-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1034] = {
		respond_dir = 0,
		name = "倒立",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的倒立，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "handstand",
		tech_id = 0,
		id = 1034,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			107
		},
		jump_page = {
			{
				"开发季V-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[1035] = {
		respond_dir = 0,
		name = "敬礼",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的敬礼，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "salute",
		tech_id = 0,
		id = 1035,
		responder_feedback = "",
		chara_sigle_action_reply = {
			102,
			107
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1036] = {
		respond_dir = 0,
		name = "展示",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "自然流畅的展示，生动形象地表达情感与态度。",
		sigle_action_reply_type = 2,
		resource = "show",
		tech_id = 0,
		id = 1036,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			107
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[2000] = {
		chara_sigle_action_reply = "",
		name = "击掌",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "自然流畅的击掌，生动形象地表达情感与态度。",
		respond_dir = 0,
		resource = "givemefive",
		tech_id = 0,
		id = 2000,
		responder_feedback = "givemefive_end",
		respond_point = {
			0.07173,
			0,
			1.28364
		},
		jump_page = {}
	}
	pg.base.island_action[2001] = {
		chara_sigle_action_reply = "",
		name = "握手",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "自然流畅的握手，生动形象地表达情感与态度。",
		respond_dir = 0,
		resource = "handshake",
		tech_id = 0,
		id = 2001,
		responder_feedback = "handshake_end",
		respond_point = {
			0.03018,
			0,
			1.35235
		},
		jump_page = {
			{
				"开发季I-开发商店",
				{}
			}
		}
	}
	pg.base.island_action[2002] = {
		chara_sigle_action_reply = "",
		name = "拥抱",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "自然流畅的拥抱，生动形象地表达情感与态度。",
		respond_dir = 0,
		resource = "hug",
		tech_id = 0,
		id = 2002,
		responder_feedback = "hug_end",
		respond_point = {
			0.05431,
			0,
			0.62654
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[2003] = {
		chara_sigle_action_reply = "",
		name = "庆祝 ",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "自然流畅的庆祝，生动形象地表达情感与态度。",
		respond_dir = 0,
		resource = "claphands",
		tech_id = 0,
		id = 2003,
		responder_feedback = "claphands_end",
		respond_point = {
			0,
			0,
			1.5276
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[2004] = {
		chara_sigle_action_reply = "",
		name = "比心 ",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "自然流畅的比心，生动形象地表达情感与态度。",
		respond_dir = 0,
		resource = "handheart",
		tech_id = 0,
		id = 2004,
		responder_feedback = "handheart_end",
		respond_point = {
			0,
			0,
			1.35224
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[2005] = {
		chara_sigle_action_reply = "",
		name = "谢幕",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "自然流畅的谢幕，生动形象地表达情感与态度。",
		respond_dir = 0,
		resource = "curtaincall",
		tech_id = 0,
		id = 2005,
		responder_feedback = "curtaincall_end_sp",
		respond_point = {
			0,
			0,
			2
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[2006] = {
		chara_sigle_action_reply = "",
		name = "多人共舞",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "自然流畅的多人共舞，生动形象地表达情感与态度。",
		respond_dir = 0,
		resource = "mutidance",
		tech_id = 0,
		id = 2006,
		responder_feedback = "mutidance_end",
		respond_point = {
			0,
			0,
			1.41529
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[2007] = {
		chara_sigle_action_reply = "",
		name = "合体变身",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "自然流畅的合体变身，生动形象地表达情感与态度。",
		respond_dir = 1,
		resource = "combine",
		tech_id = 0,
		id = 2007,
		responder_feedback = "combine_end_sp",
		respond_point = {
			-2.181,
			0,
			0
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
end)()
