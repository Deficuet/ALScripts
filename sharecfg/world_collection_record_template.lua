pg = pg or {}
pg.world_collection_record_template = rawget(pg, "world_collection_record_template") or setmetatable({
	__name = "world_collection_record_template"
}, confNEO)
pg.world_collection_record_template.all = {
	100001,
	100002,
	100003,
	100004,
	100005,
	100006,
	100007,
	100008,
	100009,
	100010,
	100011,
	100012,
	100013,
	100014,
	100015,
	100016,
	100017,
	100018,
	100019,
	100020,
	100021,
	100022,
	100023,
	100024,
	100025,
	100026,
	100027,
	100028,
	100029,
	100030,
	100031,
	100032,
	100033,
	100034,
	100035,
	100036,
	100037,
	100038,
	100039,
	100040,
	100041,
	100042,
	100043,
	100044,
	100045,
	100046,
	100047,
	100048,
	100049,
	100050,
	100051,
	100052,
	100053,
	100054,
	100055,
	100056,
	100057,
	100058,
	100059,
	100060,
	100061,
	100062,
	100063,
	100064,
	100065,
	100066,
	100071,
	100076,
	100077,
	100078,
	100079,
	100080,
	100081,
	100082,
	100083,
	100084,
	100085,
	100086,
	100087,
	100088,
	100089,
	100090,
	100091,
	100092,
	100093,
	100094,
	100095,
	100096,
	100097
}
pg.base = pg.base or {}
pg.base.world_collection_record_template = {}

;(function()
	pg.base.world_collection_record_template[100001] = {
		type = 1,
		name = "作战简报",
		id = 100001,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "开始「大型作战」",
		story = "WORLD100A"
	}
	pg.base.world_collection_record_template[100002] = {
		type = 1,
		name = "序幕I",
		id = 100002,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "开始第一章-序幕",
		story = "GWORLD101A"
	}
	pg.base.world_collection_record_template[100003] = {
		type = 1,
		name = "序幕II",
		id = 100003,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "遭遇大黄蜂",
		story = "GWORLD101B"
	}
	pg.base.world_collection_record_template[100004] = {
		type = 1,
		name = "序幕III",
		id = 100004,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "击败大黄蜂",
		story = "GWORLD101C"
	}
	pg.base.world_collection_record_template[100005] = {
		type = 1,
		name = "序幕IV",
		id = 100005,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "成功撤离战斗后",
		story = "GWORLD101D"
	}
	pg.base.world_collection_record_template[100006] = {
		type = 1,
		name = "号响",
		id = 100006,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "进入演习海域内的NY港",
		story = "WORLD102A"
	}
	pg.base.world_collection_record_template[100007] = {
		type = 1,
		name = "似曾相识",
		id = 100007,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "开始第一章-第二节",
		story = "WORLD105A"
	}
	pg.base.world_collection_record_template[100008] = {
		type = 1,
		name = "TB系统",
		id = 100008,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD105B"
	}
	pg.base.world_collection_record_template[100009] = {
		type = 1,
		name = "回忆",
		id = 100009,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "击败一区域所有敌人",
		story = "WORLD105C"
	}
	pg.base.world_collection_record_template[100010] = {
		type = 1,
		name = "火光",
		id = 100010,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "击败二区域所有敌人",
		story = "WORLD105D"
	}
	pg.base.world_collection_record_template[100011] = {
		type = 1,
		name = "另一个神秘人",
		id = 100011,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "WORLD105E"
	}
	pg.base.world_collection_record_template[100012] = {
		type = 1,
		name = "敌人的敌人",
		id = 100012,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "开始第一章-第三节",
		story = "WORLD106A"
	}
	pg.base.world_collection_record_template[100013] = {
		type = 1,
		name = "探索I",
		id = 100013,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD106B"
	}
	pg.base.world_collection_record_template[100014] = {
		type = 1,
		name = "探索II",
		id = 100014,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "WORLD106C"
	}
	pg.base.world_collection_record_template[100015] = {
		type = 1,
		name = "探索III",
		id = 100015,
		mask = "bg/bg_memory",
		group_ID = 15,
		icon = "memory_dashijie",
		condition = "前往第三个探索点",
		story = "WORLD106D"
	}
	pg.base.world_collection_record_template[100016] = {
		type = 1,
		name = "阶段性进展",
		id = 100016,
		mask = "bg/bg_memory",
		group_ID = 16,
		icon = "memory_dashijie",
		condition = "击败所有敌人",
		story = "WORLD106E"
	}
	pg.base.world_collection_record_template[100017] = {
		type = 1,
		name = "阶段性进展",
		id = 100017,
		mask = "bg/bg_memory",
		group_ID = 17,
		icon = "memory_dashijie",
		condition = "开始第一章-第四节",
		story = "WORLD107A"
	}
	pg.base.world_collection_record_template[100018] = {
		type = 1,
		name = "赤色舰队",
		id = 100018,
		mask = "bg/bg_memory",
		group_ID = 18,
		icon = "memory_dashijie",
		condition = "击败五队敌人",
		story = "WORLD107B"
	}
	pg.base.world_collection_record_template[100019] = {
		type = 1,
		name = "通讯",
		id = 100019,
		mask = "bg/bg_memory",
		group_ID = 19,
		icon = "memory_dashijie",
		condition = "前往第一章-第五节第一个探索点",
		story = "WORLD108A"
	}
	pg.base.world_collection_record_template[100020] = {
		type = 1,
		name = "空战",
		id = 100020,
		mask = "bg/bg_memory",
		group_ID = 20,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "WORLD108B"
	}
	pg.base.world_collection_record_template[100021] = {
		type = 1,
		name = "停火",
		id = 100021,
		mask = "bg/bg_memory",
		group_ID = 21,
		icon = "memory_dashijie",
		condition = "击败铁血主力舰队",
		story = "WORLD108C"
	}
	pg.base.world_collection_record_template[100022] = {
		type = 1,
		name = "准备工作",
		id = 100022,
		mask = "bg/bg_memory",
		group_ID = 22,
		icon = "memory_dashijie",
		condition = "前往第一章-第六节第一个探索点",
		story = "WORLD109A"
	}
	pg.base.world_collection_record_template[100023] = {
		type = 1,
		name = "准备完成",
		id = 100023,
		mask = "bg/bg_memory",
		group_ID = 23,
		icon = "memory_dashijie",
		condition = "前往第三个探索点",
		story = "WORLD109B"
	}
	pg.base.world_collection_record_template[100024] = {
		type = 1,
		name = "信标·META",
		id = 100024,
		mask = "bg/bg_memory",
		group_ID = 24,
		icon = "memory_dashijie",
		condition = "解锁「信标·META」系统",
		story = "GWORLD109A"
	}
	pg.base.world_collection_record_template[100025] = {
		type = 1,
		name = "女王的职责",
		id = 100025,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "进入第二章-第一节内的利维浦港",
		story = "WORLD200A"
	}
	pg.base.world_collection_record_template[100026] = {
		type = 1,
		name = "集结",
		id = 100026,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD200B"
	}
	pg.base.world_collection_record_template[100027] = {
		type = 1,
		name = "并肩作战",
		id = 100027,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "前往第二章-第二节第一个探索点",
		story = "WORLD201A"
	}
	pg.base.world_collection_record_template[100028] = {
		type = 1,
		name = "外围清扫",
		id = 100028,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "开始第二章-第三节",
		story = "WORLD202A"
	}
	pg.base.world_collection_record_template[100029] = {
		type = 1,
		name = "求援信号",
		id = 100029,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "击败所有敌人",
		story = "WORLD202B"
	}
	pg.base.world_collection_record_template[100030] = {
		type = 1,
		name = "遇难地点",
		id = 100030,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "开始第二章-第四节",
		story = "WORLD203A"
	}
	pg.base.world_collection_record_template[100031] = {
		type = 1,
		name = "残骸",
		id = 100031,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD203B"
	}
	pg.base.world_collection_record_template[100032] = {
		type = 1,
		name = "残影",
		id = 100032,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "WORLD203C"
	}
	pg.base.world_collection_record_template[100033] = {
		type = 1,
		name = "科研任务",
		id = 100033,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "前往第三个探索点",
		story = "WORLD203D"
	}
	pg.base.world_collection_record_template[100034] = {
		type = 1,
		name = "女王的联络",
		id = 100034,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "前往第二章-第五节第一个探索点",
		story = "WORLD204A"
	}
	pg.base.world_collection_record_template[100035] = {
		type = 1,
		name = "重力异常",
		id = 100035,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "开始第二章-第六节",
		story = "WORLD205A"
	}
	pg.base.world_collection_record_template[100036] = {
		type = 1,
		name = "练手",
		id = 100036,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "击败所有敌人",
		story = "WORLD205B"
	}
	pg.base.world_collection_record_template[100037] = {
		type = 1,
		name = "强敌登场",
		id = 100037,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "击败第二章-第六节内的敌方特殊单位",
		story = "WORLD205C"
	}
	pg.base.world_collection_record_template[100038] = {
		type = 1,
		name = "第二座前哨",
		id = 100038,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "击败敌方特殊单位",
		story = "WORLD205D"
	}
	pg.base.world_collection_record_template[100039] = {
		type = 1,
		name = "另一处攻击",
		id = 100039,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "进入第三章-第一节内的港口",
		story = "WORLD300A"
	}
	pg.base.world_collection_record_template[100040] = {
		type = 1,
		name = "TB系统测试",
		id = 100040,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD300B"
	}
	pg.base.world_collection_record_template[100041] = {
		type = 1,
		name = "铁血的动向",
		id = 100041,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "前往第三章-第二节第一个探索点",
		story = "WORLD301A"
	}
	pg.base.world_collection_record_template[100042] = {
		type = 1,
		name = "友方信号",
		id = 100042,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "前往第三章-第三节第一个探索点",
		story = "WORLD302A"
	}
	pg.base.world_collection_record_template[100043] = {
		type = 1,
		name = "干扰",
		id = 100043,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "WORLD302B"
	}
	pg.base.world_collection_record_template[100044] = {
		type = 1,
		name = "救援",
		id = 100044,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "开始第三章-第四节",
		story = "WORLD303A"
	}
	pg.base.world_collection_record_template[100045] = {
		type = 1,
		name = "疑惑",
		id = 100045,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD303B"
	}
	pg.base.world_collection_record_template[100046] = {
		type = 1,
		name = "分散计划",
		id = 100046,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "开始第三章-第五节",
		story = "WORLD304A"
	}
	pg.base.world_collection_record_template[100047] = {
		type = 1,
		name = "残影",
		id = 100047,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD304B"
	}
	pg.base.world_collection_record_template[100048] = {
		type = 1,
		name = "仲裁机关",
		id = 100048,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "WORLD304C"
	}
	pg.base.world_collection_record_template[100049] = {
		type = 1,
		name = "增援",
		id = 100049,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "击败所有敌人",
		story = "WORLD304D"
	}
	pg.base.world_collection_record_template[100050] = {
		type = 1,
		name = "滴水不漏",
		id = 100050,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "击败敌方特殊单位",
		story = "WORLD304E"
	}
	pg.base.world_collection_record_template[100051] = {
		type = 1,
		name = "一鼓作气",
		id = 100051,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "开始第三章-第六节",
		story = "WORLD305A"
	}
	pg.base.world_collection_record_template[100052] = {
		type = 1,
		name = "修整",
		id = 100052,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD305B"
	}
	pg.base.world_collection_record_template[100053] = {
		type = 1,
		name = "初临陆间海",
		id = 100053,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "前往第四章-第一节第一个探索点",
		story = "WORLD400A"
	}
	pg.base.world_collection_record_template[100054] = {
		type = 1,
		name = "撒丁舰队",
		id = 100054,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "WORLD400B"
	}
	pg.base.world_collection_record_template[100055] = {
		type = 1,
		name = "塔兰托港",
		id = 100055,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "开始第四章-第二节",
		story = "WORLD401A"
	}
	pg.base.world_collection_record_template[100056] = {
		type = 1,
		name = "中途离席",
		id = 100056,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD401B"
	}
	pg.base.world_collection_record_template[100057] = {
		type = 1,
		name = "达喀尔港",
		id = 100057,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "开始第四章-第三节",
		story = "WORLD402A"
	}
	pg.base.world_collection_record_template[100058] = {
		type = 1,
		name = "单独行动",
		id = 100058,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD402B"
	}
	pg.base.world_collection_record_template[100059] = {
		type = 1,
		name = "疑惑",
		id = 100059,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "击败第四章-第四节所有敌人",
		story = "WORLD403A"
	}
	pg.base.world_collection_record_template[100060] = {
		type = 1,
		name = "突击",
		id = 100060,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "开始第四章-第五节",
		story = "WORLD404A"
	}
	pg.base.world_collection_record_template[100061] = {
		type = 1,
		name = "异样",
		id = 100061,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD404B"
	}
	pg.base.world_collection_record_template[100062] = {
		type = 1,
		name = "AF作战",
		id = 100062,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "WORLD404C"
	}
	pg.base.world_collection_record_template[100063] = {
		type = 1,
		name = "替代品",
		id = 100063,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "前往第三个探索点",
		story = "WORLD404D"
	}
	pg.base.world_collection_record_template[100064] = {
		type = 1,
		name = "军师的传承",
		id = 100064,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "前往第四章-第六节第一个探索点",
		story = "WORLD405A"
	}
	pg.base.world_collection_record_template[100065] = {
		type = 1,
		name = "敌影",
		id = 100065,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "击败所有敌人",
		story = "WORLD405B"
	}
	pg.base.world_collection_record_template[100066] = {
		type = 1,
		name = "修整",
		id = 100066,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "击败敌方特殊单位",
		story = "WORLD405C"
	}
	pg.base.world_collection_record_template[100071] = {
		type = 1,
		name = "DMRECX074：META",
		id = 100071,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "前往第一章-第六节第二个探索点",
		story = "WORLD9901A"
	}
	pg.base.world_collection_record_template[100076] = {
		type = 1,
		name = "泥沼",
		id = 100076,
		mask = "bg/bg_memory",
		group_ID = 1,
		icon = "memory_dashijie",
		condition = "进入第五章-第一节内的前哨站",
		story = "WORLD500A"
	}
	pg.base.world_collection_record_template[100077] = {
		type = 1,
		name = "分歧",
		id = 100077,
		mask = "bg/bg_memory",
		group_ID = 2,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD500B"
	}
	pg.base.world_collection_record_template[100078] = {
		type = 1,
		name = "雷霆",
		id = 100078,
		mask = "bg/bg_memory",
		group_ID = 3,
		icon = "memory_dashijie",
		condition = "再次进入第五章-第一节内的前哨站",
		story = "WORLD500C"
	}
	pg.base.world_collection_record_template[100079] = {
		type = 1,
		name = "英雄",
		id = 100079,
		mask = "bg/bg_memory",
		group_ID = 4,
		icon = "memory_dashijie",
		condition = "开始第五章-第二节",
		story = "WORLD501A"
	}
	pg.base.world_collection_record_template[100080] = {
		type = 1,
		name = "信标",
		id = 100080,
		mask = "bg/bg_memory",
		group_ID = 5,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD501B"
	}
	pg.base.world_collection_record_template[100081] = {
		type = 1,
		name = "熟悉感",
		id = 100081,
		mask = "bg/bg_memory",
		group_ID = 6,
		icon = "memory_dashijie",
		condition = "遭遇龙·META",
		story = "WORLD501C"
	}
	pg.base.world_collection_record_template[100082] = {
		type = 1,
		name = "幻影",
		id = 100082,
		mask = "bg/bg_memory",
		group_ID = 7,
		icon = "memory_dashijie",
		condition = "开始第五章-第三节",
		story = "WORLD502A"
	}
	pg.base.world_collection_record_template[100083] = {
		type = 1,
		name = "下定决心",
		id = 100083,
		mask = "bg/bg_memory",
		group_ID = 8,
		icon = "memory_dashijie",
		condition = "前往第五章-第四节第一个探索点",
		story = "WORLD503A"
	}
	pg.base.world_collection_record_template[100084] = {
		type = 1,
		name = "茶会",
		id = 100084,
		mask = "bg/bg_memory",
		group_ID = 9,
		icon = "memory_dashijie",
		condition = "进入第五章-第四节内的前哨站",
		story = "WORLD503B"
	}
	pg.base.world_collection_record_template[100085] = {
		type = 1,
		name = "总攻开始",
		id = 100085,
		mask = "bg/bg_memory",
		group_ID = 10,
		icon = "memory_dashijie",
		condition = "开始第五章-第五节",
		story = "WORLD504A"
	}
	pg.base.world_collection_record_template[100086] = {
		type = 1,
		name = "炮击支援群",
		id = 100086,
		mask = "bg/bg_memory",
		group_ID = 11,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD504B"
	}
	pg.base.world_collection_record_template[100087] = {
		type = 1,
		name = "游击支援群",
		id = 100087,
		mask = "bg/bg_memory",
		group_ID = 12,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "WORLD504C"
	}
	pg.base.world_collection_record_template[100088] = {
		type = 1,
		name = "航空支援群",
		id = 100088,
		mask = "bg/bg_memory",
		group_ID = 13,
		icon = "memory_dashijie",
		condition = "前往第三个探索点",
		story = "WORLD504D"
	}
	pg.base.world_collection_record_template[100089] = {
		type = 1,
		name = "测试者量产机",
		id = 100089,
		mask = "bg/bg_memory",
		group_ID = 14,
		icon = "memory_dashijie",
		condition = "前往第四个探索点",
		story = "WORLD504E"
	}
	pg.base.world_collection_record_template[100090] = {
		type = 1,
		name = "圆环",
		id = 100090,
		mask = "bg/bg_memory",
		group_ID = 15,
		icon = "memory_dashijie",
		condition = "开始第五章-第六节",
		story = "WORLD505A"
	}
	pg.base.world_collection_record_template[100091] = {
		type = 1,
		name = "另一个奇异点",
		id = 100091,
		mask = "bg/bg_memory",
		group_ID = 16,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD505B"
	}
	pg.base.world_collection_record_template[100092] = {
		type = 1,
		name = "邀约",
		id = 100092,
		mask = "bg/bg_memory",
		group_ID = 17,
		icon = "memory_dashijie",
		condition = "开始第五章-第七节",
		story = "WORLD506A"
	}
	pg.base.world_collection_record_template[100093] = {
		type = 1,
		name = "战场维修舰",
		id = 100093,
		mask = "bg/bg_memory",
		group_ID = 18,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD506B"
	}
	pg.base.world_collection_record_template[100094] = {
		type = 1,
		name = "排异",
		id = 100094,
		mask = "bg/bg_memory",
		group_ID = 19,
		icon = "memory_dashijie",
		condition = "开始第五章-第八节",
		story = "WORLD507A"
	}
	pg.base.world_collection_record_template[100095] = {
		type = 1,
		name = "交汇之地",
		id = 100095,
		mask = "bg/bg_memory",
		group_ID = 20,
		icon = "memory_dashijie",
		condition = "前往第一个探索点",
		story = "WORLD507E"
	}
	pg.base.world_collection_record_template[100096] = {
		type = 2,
		name = "BAD-恍然",
		id = 100096,
		mask = "bg/bg_memory",
		group_ID = 21,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "312671"
	}
	pg.base.world_collection_record_template[100097] = {
		type = 2,
		name = "TRUE-新的开端",
		id = 100097,
		mask = "bg/bg_memory",
		group_ID = 22,
		icon = "memory_dashijie",
		condition = "前往第二个探索点",
		story = "312672"
	}
end)()
