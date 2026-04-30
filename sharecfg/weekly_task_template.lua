pg = pg or {}
pg.weekly_task_template = rawget(pg, "weekly_task_template") or setmetatable({
	__name = "weekly_task_template"
}, confNEO)
pg.weekly_task_template.all = {
	10001,
	10002,
	10003,
	10004,
	10005,
	10006,
	10007,
	10011,
	10012,
	10013,
	10014,
	10015,
	10016,
	10021,
	10022,
	10023,
	10024,
	10025,
	10031,
	10032,
	10033,
	10041,
	10042,
	10043,
	10044,
	10051,
	10052,
	10053,
	10054,
	10055,
	10061,
	10062,
	10063,
	10064,
	10071,
	10072,
	10073,
	10074,
	10075,
	10081,
	10082,
	10083,
	10084,
	10085,
	10091,
	10092,
	10093,
	10101,
	10102,
	10103,
	10104,
	10105,
	10111,
	10112,
	10113,
	10114,
	10121,
	10122,
	10123,
	10124,
	10125,
	10131,
	10132,
	10133,
	10134,
	10135,
	10141,
	10142,
	10143,
	10144,
	10151,
	10152,
	10153,
	10154,
	10155
}
pg.base = pg.base or {}
pg.base.weekly_task_template = {}

;(function()
	pg.base.weekly_task_template[10001] = {
		target_id = "0",
		sub_type = 20,
		target_id_for_client = 0,
		desc = "【1/7】舰队出征，获得1次胜利。",
		id = 10001,
		target_num = 1,
		level = 1,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10002] = {
		target_id = "0",
		sub_type = 20,
		target_id_for_client = 0,
		desc = "【2/7】舰队出征，获得5次胜利。",
		id = 10002,
		target_num = 5,
		level = 1,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10003] = {
		target_id = "0",
		sub_type = 20,
		target_id_for_client = 0,
		desc = "【3/7】舰队出征，获得10次胜利。",
		id = 10003,
		target_num = 10,
		level = 1,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10004] = {
		target_id = "0",
		sub_type = 20,
		target_id_for_client = 0,
		desc = "【4/7】舰队出征，获得20次胜利。",
		id = 10004,
		target_num = 20,
		level = 1,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10005] = {
		target_id = "0",
		sub_type = 20,
		target_id_for_client = 0,
		desc = "【5/7】舰队出征，获得50次胜利。",
		id = 10005,
		target_num = 50,
		level = 1,
		award_display = {
			8,
			59012,
			50
		}
	}
	pg.base.weekly_task_template[10006] = {
		target_id = "0",
		sub_type = 20,
		target_id_for_client = 0,
		desc = "【6/7】舰队出征，获得100次胜利。",
		id = 10006,
		target_num = 100,
		level = 1,
		award_display = {
			8,
			59012,
			60
		}
	}
	pg.base.weekly_task_template[10007] = {
		target_id = "0",
		sub_type = 20,
		target_id_for_client = 0,
		desc = "【7/7】舰队出征，获得200次胜利。",
		id = 10007,
		target_num = 200,
		level = 1,
		award_display = {
			8,
			59012,
			70
		}
	}
	pg.base.weekly_task_template[10011] = {
		target_id = "0",
		sub_type = 11,
		target_id_for_client = 0,
		desc = "【1/6】击沉任意敌人50艘。",
		id = 10011,
		target_num = 50,
		level = 1,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10012] = {
		target_id = "0",
		sub_type = 11,
		target_id_for_client = 0,
		desc = "【2/6】击沉任意敌人100艘。",
		id = 10012,
		target_num = 100,
		level = 1,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10013] = {
		target_id = "0",
		sub_type = 11,
		target_id_for_client = 0,
		desc = "【3/6】击沉任意敌人200艘。",
		id = 10013,
		target_num = 200,
		level = 1,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10014] = {
		target_id = "0",
		sub_type = 11,
		target_id_for_client = 0,
		desc = "【4/6】击沉任意敌人500艘。",
		id = 10014,
		target_num = 500,
		level = 1,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10015] = {
		target_id = "0",
		sub_type = 11,
		target_id_for_client = 0,
		desc = "【5/6】击沉任意敌人1000艘。",
		id = 10015,
		target_num = 1000,
		level = 1,
		award_display = {
			8,
			59012,
			50
		}
	}
	pg.base.weekly_task_template[10016] = {
		target_id = "0",
		sub_type = 11,
		target_id_for_client = 0,
		desc = "【6/6】击沉任意敌人2000艘。",
		id = 10016,
		target_num = 2000,
		level = 1,
		award_display = {
			8,
			59012,
			60
		}
	}
	pg.base.weekly_task_template[10021] = {
		target_id = "0",
		sub_type = 60,
		target_id_for_client = 0,
		desc = "【1/5】后宅补给存粮5000。",
		id = 10021,
		target_num = 5000,
		level = 8,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10022] = {
		target_id = "0",
		sub_type = 60,
		target_id_for_client = 0,
		desc = "【2/5】后宅补给存粮10000。",
		id = 10022,
		target_num = 10000,
		level = 8,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10023] = {
		target_id = "0",
		sub_type = 60,
		target_id_for_client = 0,
		desc = "【3/5】后宅补给存粮20000。",
		id = 10023,
		target_num = 20000,
		level = 8,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10024] = {
		target_id = "0",
		sub_type = 60,
		target_id_for_client = 0,
		desc = "【4/5】后宅补给存粮50000。",
		id = 10024,
		target_num = 50000,
		level = 8,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10025] = {
		target_id = "0",
		sub_type = 60,
		target_id_for_client = 0,
		desc = "【5/5】后宅补给存粮100000。",
		id = 10025,
		target_num = 100000,
		level = 8,
		award_display = {
			8,
			59012,
			50
		}
	}
	pg.base.weekly_task_template[10031] = {
		target_id = "0",
		sub_type = 170,
		target_id_for_client = 0,
		desc = "【1/3】训练指挥喵1只。",
		id = 10031,
		target_num = 1,
		level = 40,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10032] = {
		target_id = "0",
		sub_type = 170,
		target_id_for_client = 0,
		desc = "【2/3】训练指挥喵5只。",
		id = 10032,
		target_num = 5,
		level = 40,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10033] = {
		target_id = "0",
		sub_type = 170,
		target_id_for_client = 0,
		desc = "【3/3】训练指挥喵7只。",
		id = 10033,
		target_num = 7,
		level = 40,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10041] = {
		target_id = "0",
		sub_type = 30,
		target_id_for_client = 0,
		desc = "【1/4】建造舰船1次。",
		id = 10041,
		target_num = 1,
		level = 1,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10042] = {
		target_id = "0",
		sub_type = 30,
		target_id_for_client = 0,
		desc = "【2/4】建造舰船5次。",
		id = 10042,
		target_num = 5,
		level = 1,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10043] = {
		target_id = "0",
		sub_type = 30,
		target_id_for_client = 0,
		desc = "【3/4】建造舰船7次。",
		id = 10043,
		target_num = 7,
		level = 1,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10044] = {
		target_id = "0",
		sub_type = 30,
		target_id_for_client = 0,
		desc = "【4/4】建造舰船10次。",
		id = 10044,
		target_num = 10,
		level = 1,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10051] = {
		target_id = "0",
		sub_type = 121,
		target_id_for_client = 0,
		desc = "【1/5】累计消耗石油1000。",
		id = 10051,
		target_num = 1000,
		level = 1,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10052] = {
		target_id = "0",
		sub_type = 121,
		target_id_for_client = 0,
		desc = "【2/5】累计消耗石油2000。",
		id = 10052,
		target_num = 2000,
		level = 1,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10053] = {
		target_id = "0",
		sub_type = 121,
		target_id_for_client = 0,
		desc = "【3/5】累计消耗石油3000。",
		id = 10053,
		target_num = 3000,
		level = 1,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10054] = {
		target_id = "0",
		sub_type = 121,
		target_id_for_client = 0,
		desc = "【4/5】累计消耗石油5000。",
		id = 10054,
		target_num = 5000,
		level = 1,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10055] = {
		target_id = "0",
		sub_type = 121,
		target_id_for_client = 0,
		desc = "【5/5】累计消耗石油7500。",
		id = 10055,
		target_num = 7500,
		level = 1,
		award_display = {
			8,
			59012,
			50
		}
	}
	pg.base.weekly_task_template[10061] = {
		target_id = "0",
		sub_type = 23,
		target_id_for_client = 0,
		desc = "【1/4】舰队出征，以A评价通关1次。 ",
		id = 10061,
		target_num = 1,
		level = 1,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10062] = {
		target_id = "0",
		sub_type = 23,
		target_id_for_client = 0,
		desc = "【2/4】舰队出征，以A评价通关10次。 ",
		id = 10062,
		target_num = 10,
		level = 1,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10063] = {
		target_id = "0",
		sub_type = 23,
		target_id_for_client = 0,
		desc = "【3/4】舰队出征，以A评价通关20次。 ",
		id = 10063,
		target_num = 20,
		level = 1,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10064] = {
		target_id = "0",
		sub_type = 23,
		target_id_for_client = 0,
		desc = "【4/4】舰队出征，以A评价通关50次。 ",
		id = 10064,
		target_num = 50,
		level = 1,
		award_display = {
			8,
			59012,
			50
		}
	}
	pg.base.weekly_task_template[10071] = {
		target_id = "0",
		sub_type = 110,
		target_id_for_client = 0,
		desc = "【1/5】完成科研1次。",
		id = 10071,
		target_num = 1,
		level = 30,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10072] = {
		target_id = "0",
		sub_type = 110,
		target_id_for_client = 0,
		desc = "【2/5】完成科研3次。",
		id = 10072,
		target_num = 3,
		level = 30,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10073] = {
		target_id = "0",
		sub_type = 110,
		target_id_for_client = 0,
		desc = "【3/5】完成科研5次。",
		id = 10073,
		target_num = 5,
		level = 30,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10074] = {
		target_id = "0",
		sub_type = 110,
		target_id_for_client = 0,
		desc = "【4/5】完成科研10次。",
		id = 10074,
		target_num = 10,
		level = 30,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10075] = {
		target_id = "0",
		sub_type = 110,
		target_id_for_client = 0,
		desc = "【5/5】完成科研20次。",
		id = 10075,
		target_num = 20,
		level = 30,
		award_display = {
			8,
			59012,
			50
		}
	}
	pg.base.weekly_task_template[10081] = {
		target_id = "0",
		sub_type = 34,
		target_id_for_client = 0,
		desc = "【1/5】舰船强化1次。",
		id = 10081,
		target_num = 1,
		level = 1,
		award_display = {
			8,
			59012,
			5
		}
	}
	pg.base.weekly_task_template[10082] = {
		target_id = "0",
		sub_type = 34,
		target_id_for_client = 0,
		desc = "【2/5】舰船强化5次。",
		id = 10082,
		target_num = 5,
		level = 1,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10083] = {
		target_id = "0",
		sub_type = 34,
		target_id_for_client = 0,
		desc = "【3/5】舰船强化10次。",
		id = 10083,
		target_num = 10,
		level = 1,
		award_display = {
			8,
			59012,
			15
		}
	}
	pg.base.weekly_task_template[10084] = {
		target_id = "0",
		sub_type = 34,
		target_id_for_client = 0,
		desc = "【4/5】舰船强化20次。",
		id = 10084,
		target_num = 20,
		level = 1,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10085] = {
		target_id = "0",
		sub_type = 34,
		target_id_for_client = 0,
		desc = "【5/5】舰船强化50次。",
		id = 10085,
		target_num = 50,
		level = 1,
		award_display = {
			8,
			59012,
			25
		}
	}
	pg.base.weekly_task_template[10091] = {
		target_id = "0",
		sub_type = 40,
		target_id_for_client = 0,
		desc = "【1/3】装备强化1次。",
		id = 10091,
		target_num = 1,
		level = 1,
		award_display = {
			8,
			59012,
			5
		}
	}
	pg.base.weekly_task_template[10092] = {
		target_id = "0",
		sub_type = 40,
		target_id_for_client = 0,
		desc = "【2/3】装备强化5次。",
		id = 10092,
		target_num = 5,
		level = 1,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10093] = {
		target_id = "0",
		sub_type = 40,
		target_id_for_client = 0,
		desc = "【3/3】装备强化10次。",
		id = 10093,
		target_num = 10,
		level = 1,
		award_display = {
			8,
			59012,
			15
		}
	}
	pg.base.weekly_task_template[10101] = {
		target_id = "0",
		sub_type = 26,
		target_id_for_client = 0,
		desc = "【1/5】完成3个「每日挑战」关卡。",
		id = 10101,
		target_num = 3,
		level = 10,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10102] = {
		target_id = "0",
		sub_type = 26,
		target_id_for_client = 0,
		desc = "【2/5】完成9个「每日挑战」关卡。",
		id = 10102,
		target_num = 9,
		level = 10,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10103] = {
		target_id = "0",
		sub_type = 26,
		target_id_for_client = 0,
		desc = "【3/5】完成15个「每日挑战」关卡。",
		id = 10103,
		target_num = 15,
		level = 10,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10104] = {
		target_id = "0",
		sub_type = 26,
		target_id_for_client = 0,
		desc = "【4/5】完成21个「每日挑战」关卡。",
		id = 10104,
		target_num = 21,
		level = 10,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10105] = {
		target_id = "0",
		sub_type = 26,
		target_id_for_client = 0,
		desc = "【5/5】完成27个「每日挑战」关卡。",
		id = 10105,
		target_num = 27,
		level = 10,
		award_display = {
			8,
			59012,
			50
		}
	}
	pg.base.weekly_task_template[10111] = {
		target_id = "0",
		sub_type = 71,
		target_id_for_client = 0,
		desc = "【1/4】进行战术训练1次。",
		id = 10111,
		target_num = 1,
		level = 1,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10112] = {
		target_id = "0",
		sub_type = 71,
		target_id_for_client = 0,
		desc = "【2/4】进行战术训练5次。",
		id = 10112,
		target_num = 5,
		level = 1,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10113] = {
		target_id = "0",
		sub_type = 71,
		target_id_for_client = 0,
		desc = "【3/4】进行战术训练10次。",
		id = 10113,
		target_num = 10,
		level = 1,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10114] = {
		target_id = "0",
		sub_type = 71,
		target_id_for_client = 0,
		desc = "【4/4】进行战术训练15次。",
		id = 10114,
		target_num = 15,
		level = 1,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10121] = {
		target_id = "0",
		sub_type = 80,
		target_id_for_client = 0,
		desc = "【1/5】执行军事委托5次。",
		id = 10121,
		target_num = 5,
		level = 12,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10122] = {
		target_id = "0",
		sub_type = 80,
		target_id_for_client = 0,
		desc = "【2/5】执行军事委托10次。",
		id = 10122,
		target_num = 10,
		level = 12,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10123] = {
		target_id = "0",
		sub_type = 80,
		target_id_for_client = 0,
		desc = "【3/5】执行军事委托20次。",
		id = 10123,
		target_num = 20,
		level = 12,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10124] = {
		target_id = "0",
		sub_type = 80,
		target_id_for_client = 0,
		desc = "【4/5】执行军事委托30次。",
		id = 10124,
		target_num = 30,
		level = 12,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10125] = {
		target_id = "0",
		sub_type = 80,
		target_id_for_client = 0,
		desc = "【5/5】执行军事委托50次。",
		id = 10125,
		target_num = 50,
		level = 12,
		award_display = {
			8,
			59012,
			50
		}
	}
	pg.base.weekly_task_template[10131] = {
		target_id = "1",
		sub_type = 27,
		target_id_for_client = 1,
		desc = "【1/5】获得5次军事演习胜利。",
		id = 10131,
		target_num = 5,
		level = 15,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10132] = {
		target_id = "1",
		sub_type = 27,
		target_id_for_client = 1,
		desc = "【2/5】获得10次军事演习胜利。",
		id = 10132,
		target_num = 10,
		level = 15,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10133] = {
		target_id = "1",
		sub_type = 27,
		target_id_for_client = 1,
		desc = "【3/5】获得20次军事演习胜利。",
		id = 10133,
		target_num = 20,
		level = 15,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10134] = {
		target_id = "1",
		sub_type = 27,
		target_id_for_client = 1,
		desc = "【4/5】获得30次军事演习胜利。",
		id = 10134,
		target_num = 30,
		level = 15,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10135] = {
		target_id = "1",
		sub_type = 27,
		target_id_for_client = 1,
		desc = "【5/5】获得50次军事演习胜利。",
		id = 10135,
		target_num = 50,
		level = 15,
		award_display = {
			8,
			59012,
			50
		}
	}
	pg.base.weekly_task_template[10141] = {
		target_id = "0",
		sub_type = 31,
		target_id_for_client = 0,
		desc = "【1/4】舰船退役1次。",
		id = 10141,
		target_num = 1,
		level = 1,
		award_display = {
			8,
			59012,
			5
		}
	}
	pg.base.weekly_task_template[10142] = {
		target_id = "0",
		sub_type = 31,
		target_id_for_client = 0,
		desc = "【2/4】舰船退役3次。",
		id = 10142,
		target_num = 3,
		level = 1,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10143] = {
		target_id = "0",
		sub_type = 31,
		target_id_for_client = 0,
		desc = "【3/4】舰船退役5次。",
		id = 10143,
		target_num = 5,
		level = 1,
		award_display = {
			8,
			59012,
			15
		}
	}
	pg.base.weekly_task_template[10144] = {
		target_id = "0",
		sub_type = 31,
		target_id_for_client = 0,
		desc = "【4/4】舰船退役10次。",
		id = 10144,
		target_num = 10,
		level = 1,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10151] = {
		target_id = "10101",
		sub_type = 182,
		target_id_for_client = 0,
		desc = "【1/5】通关3次「困难副本」。",
		id = 10151,
		target_num = 3,
		level = 10,
		award_display = {
			8,
			59012,
			10
		}
	}
	pg.base.weekly_task_template[10152] = {
		target_id = "10101",
		sub_type = 182,
		target_id_for_client = 0,
		desc = "【2/5】通关6次「困难副本」。",
		id = 10152,
		target_num = 6,
		level = 10,
		award_display = {
			8,
			59012,
			20
		}
	}
	pg.base.weekly_task_template[10153] = {
		target_id = "10101",
		sub_type = 182,
		target_id_for_client = 0,
		desc = "【3/5】通关9次「困难副本」。",
		id = 10153,
		target_num = 9,
		level = 10,
		award_display = {
			8,
			59012,
			30
		}
	}
	pg.base.weekly_task_template[10154] = {
		target_id = "10101",
		sub_type = 182,
		target_id_for_client = 0,
		desc = "【4/5】通关12次「困难副本」。",
		id = 10154,
		target_num = 12,
		level = 10,
		award_display = {
			8,
			59012,
			40
		}
	}
	pg.base.weekly_task_template[10155] = {
		target_id = "10101",
		sub_type = 182,
		target_id_for_client = 0,
		desc = "【5/5】通关15次「困难副本」。",
		id = 10155,
		target_num = 15,
		level = 10,
		award_display = {
			8,
			59012,
			50
		}
	}
end)()
