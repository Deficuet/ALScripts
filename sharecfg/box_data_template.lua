pg = pg or {}
pg.box_data_template = rawget(pg, "box_data_template") or setmetatable({
	__name = "box_data_template"
}, confNEO)
pg.box_data_template.__namecode__ = true
pg.box_data_template.all = {
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
	21,
	22,
	23,
	24,
	101,
	102,
	103,
	104,
	105,
	1001,
	1002,
	1003,
	1004,
	2001,
	3001,
	4001,
	5001,
	5002,
	6001,
	6002,
	10001,
	10002,
	10003,
	10004,
	10005,
	10006,
	10007,
	10008,
	10101,
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
	20001
}
pg.base = pg.base or {}
pg.base.box_data_template = {}

;(function()
	pg.base.box_data_template[1] = {
		id = 1,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10001
	}
	pg.base.box_data_template[2] = {
		id = 2,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10002
	}
	pg.base.box_data_template[3] = {
		id = 3,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10003
	}
	pg.base.box_data_template[4] = {
		id = 4,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10004
	}
	pg.base.box_data_template[5] = {
		id = 5,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10005
	}
	pg.base.box_data_template[6] = {
		id = 6,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10006
	}
	pg.base.box_data_template[7] = {
		id = 7,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10007
	}
	pg.base.box_data_template[8] = {
		id = 8,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10008
	}
	pg.base.box_data_template[9] = {
		id = 9,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10009
	}
	pg.base.box_data_template[10] = {
		id = 10,
		name = "物资箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10010
	}
	pg.base.box_data_template[21] = {
		id = 21,
		name = "食物箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10021
	}
	pg.base.box_data_template[22] = {
		id = 22,
		name = "食物箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10022
	}
	pg.base.box_data_template[23] = {
		id = 23,
		name = "食物箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10023
	}
	pg.base.box_data_template[24] = {
		id = 24,
		name = "食物箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10024
	}
	pg.base.box_data_template[101] = {
		id = 101,
		name = "装备箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10101
	}
	pg.base.box_data_template[102] = {
		id = 102,
		name = "装备箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10102
	}
	pg.base.box_data_template[103] = {
		id = 103,
		name = "装备箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10103
	}
	pg.base.box_data_template[104] = {
		id = 104,
		name = "装备箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10104
	}
	pg.base.box_data_template[105] = {
		id = 105,
		name = "装备箱",
		type = 1,
		effect_arg = 0,
		icon = "event2",
		effect_id = 10105
	}
	pg.base.box_data_template[1001] = {
		id = 1001,
		name = "事件",
		type = 2,
		effect_arg = 1,
		icon = "event2",
		effect_id = 1
	}
	pg.base.box_data_template[1002] = {
		id = 1002,
		name = "事件",
		type = 2,
		effect_arg = 1,
		icon = "event2",
		effect_id = 2
	}
	pg.base.box_data_template[1003] = {
		id = 1003,
		name = "事件",
		type = 2,
		effect_arg = 1,
		icon = "event2",
		effect_id = 3
	}
	pg.base.box_data_template[1004] = {
		id = 1004,
		name = "事件",
		type = 2,
		effect_arg = 1,
		icon = "event2",
		effect_id = 4
	}
	pg.base.box_data_template[2001] = {
		id = 2001,
		name = "触雷",
		type = 7,
		effect_arg = 0,
		icon = "torpedo",
		effect_id = 5
	}
	pg.base.box_data_template[3001] = {
		id = 3001,
		name = "空袭",
		type = 4,
		effect_arg = 0,
		icon = "event2",
		effect_id = 5
	}
	pg.base.box_data_template[4001] = {
		id = 4001,
		name = "刷怪",
		type = 5,
		effect_arg = 0,
		icon = "event2",
		effect_id = 0
	}
	pg.base.box_data_template[5001] = {
		id = 5001,
		name = "弹药补给",
		type = 6,
		effect_arg = 0,
		icon = "event2",
		effect_id = 1
	}
	pg.base.box_data_template[5002] = {
		id = 5002,
		name = "照明弹补给",
		type = 2,
		effect_arg = 3,
		icon = "event_flare",
		effect_id = 13
	}
	pg.base.box_data_template[6001] = {
		id = 6001,
		name = "绊爱空袭",
		type = 8,
		effect_arg = 0,
		icon = "event2",
		effect_id = 5
	}
	pg.base.box_data_template[6002] = {
		id = 6002,
		name = "holo岩浆",
		type = 9,
		effect_arg = 0,
		icon = "event2",
		effect_id = 5
	}
	pg.base.box_data_template[10001] = {
		id = 10001,
		name = "拼图箱",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 8106
	}
	pg.base.box_data_template[10002] = {
		id = 10002,
		name = "拼图箱",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 8107
	}
	pg.base.box_data_template[10003] = {
		id = 10003,
		name = "拼图箱",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 8108
	}
	pg.base.box_data_template[10004] = {
		id = 10004,
		name = "拼图箱",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 8109
	}
	pg.base.box_data_template[10005] = {
		id = 10005,
		name = "拼图箱",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 8110
	}
	pg.base.box_data_template[10006] = {
		id = 10006,
		name = "拼图箱",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 8111
	}
	pg.base.box_data_template[10007] = {
		id = 10007,
		name = "拼图箱",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 8112
	}
	pg.base.box_data_template[10008] = {
		id = 10008,
		name = "拼图箱",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 8113
	}
	pg.base.box_data_template[10101] = {
		id = 10101,
		name = "港区回忆NO.17",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 90828
	}
	pg.base.box_data_template[10102] = {
		id = 10102,
		name = "港区回忆NO.18",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 90829
	}
	pg.base.box_data_template[10103] = {
		id = 10103,
		name = "港区回忆NO.19",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 90830
	}
	pg.base.box_data_template[10104] = {
		id = 10104,
		name = "港区回忆NO.20",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 90831
	}
	pg.base.box_data_template[10105] = {
		id = 10105,
		name = "徽章·克利夫兰",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 92023
	}
	pg.base.box_data_template[10106] = {
		id = 10106,
		name = "徽章·谢菲尔德",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 92024
	}
	pg.base.box_data_template[10107] = {
		id = 10107,
		name = "徽章·{namecode:91}",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 92025
	}
	pg.base.box_data_template[10108] = {
		id = 10108,
		name = "徽章·{namecode:426}",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 92026
	}
	pg.base.box_data_template[10109] = {
		id = 10109,
		name = "徽章·加斯科涅",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 92027
	}
	pg.base.box_data_template[10110] = {
		id = 10110,
		name = "密码箱",
		type = 1,
		effect_arg = 0,
		icon = "event6",
		effect_id = 92880
	}
	pg.base.box_data_template[10111] = {
		id = 10111,
		name = "密码箱",
		type = 1,
		effect_arg = 0,
		icon = "event6",
		effect_id = 92882
	}
	pg.base.box_data_template[10112] = {
		id = 10112,
		name = "密码箱",
		type = 1,
		effect_arg = 0,
		icon = "event6",
		effect_id = 92884
	}
	pg.base.box_data_template[10113] = {
		id = 10113,
		name = "密码箱",
		type = 1,
		effect_arg = 0,
		icon = "event6",
		effect_id = 92886
	}
	pg.base.box_data_template[10114] = {
		id = 10114,
		name = "徽章·大青花鱼 ",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 94006
	}
	pg.base.box_data_template[10115] = {
		id = 10115,
		name = "徽章·塔什干",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 94007
	}
	pg.base.box_data_template[10116] = {
		id = 10116,
		name = "邮票·{namecode:439} ",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 94008
	}
	pg.base.box_data_template[10117] = {
		id = 10117,
		name = "杯垫·恶毒 ",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 94009
	}
	pg.base.box_data_template[10118] = {
		id = 10118,
		name = "写真·{namecode:97}",
		type = 1,
		effect_arg = 0,
		icon = "event5",
		effect_id = 94010
	}
	pg.base.box_data_template[10119] = {
		id = 10119,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_feng",
		effect_id = 77807
	}
	pg.base.box_data_template[10120] = {
		id = 10120,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_feng",
		effect_id = 77808
	}
	pg.base.box_data_template[10121] = {
		id = 10121,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_lei",
		effect_id = 77809
	}
	pg.base.box_data_template[10122] = {
		id = 10122,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_lei",
		effect_id = 77810
	}
	pg.base.box_data_template[10123] = {
		id = 10123,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_huo",
		effect_id = 77811
	}
	pg.base.box_data_template[10124] = {
		id = 10124,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_huo",
		effect_id = 77812
	}
	pg.base.box_data_template[10125] = {
		id = 10125,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_bing",
		effect_id = 77813
	}
	pg.base.box_data_template[10126] = {
		id = 10126,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_bing",
		effect_id = 77814
	}
	pg.base.box_data_template[10127] = {
		id = 10127,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_sairen",
		effect_id = 77815
	}
	pg.base.box_data_template[10128] = {
		id = 10128,
		name = "采集点",
		type = 1,
		effect_arg = 0,
		icon = "laisha_chuanson_sairen",
		effect_id = 77816
	}
	pg.base.box_data_template[10129] = {
		id = 10129,
		name = "线索",
		type = 1,
		effect_arg = 0,
		icon = "event8",
		effect_id = 901878
	}
	pg.base.box_data_template[10130] = {
		id = 10130,
		name = "线索",
		type = 1,
		effect_arg = 0,
		icon = "event8",
		effect_id = 901880
	}
	pg.base.box_data_template[10131] = {
		id = 10131,
		name = "线索",
		type = 1,
		effect_arg = 0,
		icon = "event8",
		effect_id = 901882
	}
	pg.base.box_data_template[10132] = {
		id = 10132,
		name = "线索",
		type = 1,
		effect_arg = 0,
		icon = "event8",
		effect_id = 901884
	}
	pg.base.box_data_template[10133] = {
		id = 10133,
		name = "线索",
		type = 1,
		effect_arg = 0,
		icon = "event9",
		effect_id = 905423
	}
	pg.base.box_data_template[10134] = {
		id = 10134,
		name = "线索",
		type = 1,
		effect_arg = 0,
		icon = "event9",
		effect_id = 905425
	}
	pg.base.box_data_template[10135] = {
		id = 10135,
		name = "采集点",
		type = 1,
		effect_arg = 906511,
		icon = "laisha_chuanson_feng",
		effect_id = 77807
	}
	pg.base.box_data_template[10136] = {
		id = 10136,
		name = "采集点",
		type = 1,
		effect_arg = 906512,
		icon = "laisha_chuanson_feng",
		effect_id = 77808
	}
	pg.base.box_data_template[10137] = {
		id = 10137,
		name = "采集点",
		type = 1,
		effect_arg = 906513,
		icon = "laisha_chuanson_lei",
		effect_id = 77809
	}
	pg.base.box_data_template[10138] = {
		id = 10138,
		name = "采集点",
		type = 1,
		effect_arg = 906514,
		icon = "laisha_chuanson_lei",
		effect_id = 77810
	}
	pg.base.box_data_template[10139] = {
		id = 10139,
		name = "采集点",
		type = 1,
		effect_arg = 906515,
		icon = "laisha_chuanson_huo",
		effect_id = 77811
	}
	pg.base.box_data_template[10140] = {
		id = 10140,
		name = "采集点",
		type = 1,
		effect_arg = 906516,
		icon = "laisha_chuanson_huo",
		effect_id = 77812
	}
	pg.base.box_data_template[10141] = {
		id = 10141,
		name = "采集点",
		type = 1,
		effect_arg = 906517,
		icon = "laisha_chuanson_bing",
		effect_id = 77813
	}
	pg.base.box_data_template[10142] = {
		id = 10142,
		name = "采集点",
		type = 1,
		effect_arg = 906518,
		icon = "laisha_chuanson_bing",
		effect_id = 77814
	}
	pg.base.box_data_template[10143] = {
		id = 10143,
		name = "采集点",
		type = 1,
		effect_arg = 906519,
		icon = "laisha_chuanson_sairen",
		effect_id = 77815
	}
	pg.base.box_data_template[10144] = {
		id = 10144,
		name = "采集点",
		type = 1,
		effect_arg = 906520,
		icon = "laisha_chuanson_sairen",
		effect_id = 77816
	}
	pg.base.box_data_template[10145] = {
		id = 10145,
		name = "线索",
		type = 1,
		effect_arg = 0,
		icon = "event10",
		effect_id = 909452
	}
	pg.base.box_data_template[10146] = {
		id = 10146,
		name = "线索",
		type = 1,
		effect_arg = 0,
		icon = "event10",
		effect_id = 909454
	}
	pg.base.box_data_template[20001] = {
		id = 20001,
		name = "障碍物",
		type = 0,
		effect_arg = 0,
		icon = "torpedo2",
		effect_id = 0
	}
end)()
