pg = pg or {}
pg.activity_event_question = rawget(pg, "activity_event_question") or setmetatable({
	__name = "activity_event_question"
}, confNEO)
pg.activity_event_question.all = {
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
	98
}
pg.base = pg.base or {}
pg.base.activity_event_question = {}

;(function()
	pg.base.activity_event_question[85] = {
		answer_right = "赤道",
		answer_false1 = "国际日期变更线",
		question = "漫长的远洋航行中,官兵们会在跨越(  )线时举行庆祝,从而放松一下",
		type = 1,
		id = 85,
		answer_false3 = "马甲线",
		wrong_time = 30,
		answer_false2 = "本初子午线"
	}
	pg.base.activity_event_question[86] = {
		answer_right = "争取巡逻机架次",
		answer_false1 = "短波电台放噪音",
		question = "帮助护航船团规避潜艇攻击的手段中,最有用的是",
		type = 1,
		id = 86,
		answer_false3 = "周期性对海开火",
		wrong_time = 30,
		answer_false2 = "贿赂沿途海豚"
	}
	pg.base.activity_event_question[87] = {
		answer_right = "推动船只航行",
		answer_false1 = "舰船舱室的地暖",
		question = "军舰上锅炉烧出的蒸汽主要用于",
		type = 1,
		id = 87,
		answer_false3 = "厨师烧菜泡茶",
		wrong_time = 30,
		answer_false2 = "气压机旋转炮塔"
	}
	pg.base.activity_event_question[88] = {
		answer_right = "调理心里健康",
		answer_false1 = "靠夜视晚班放哨",
		question = "不再需要用来防治鼠患后,水兵们在舰上养猫更多是为了",
		type = 1,
		id = 88,
		answer_false3 = "外聘随船渔夫",
		wrong_time = 30,
		answer_false2 = "感知风暴低气压"
	}
	pg.base.activity_event_question[89] = {
		answer_right = "航空兵投入实战",
		answer_false1 = "主炮越打越远",
		question = "主力舰二级主炮逐渐退出历史舞台的原因不包括",
		type = 1,
		id = 89,
		answer_false3 = "护航舰分担职能",
		wrong_time = 30,
		answer_false2 = "齐射精度提升"
	}
	pg.base.activity_event_question[90] = {
		answer_right = "Oscar",
		answer_false1 = "Ginger",
		question = "以下哪只猫咪被称为“不沉的山姆”（Unsinkable Sam）",
		type = 1,
		id = 90,
		answer_false3 = "Sam",
		wrong_time = 30,
		answer_false2 = "Fishcakes"
	}
	pg.base.activity_event_question[91] = {
		answer_right = "古代祈福的延续",
		answer_false1 = "测试船体硬度",
		question = "新船下水典礼时行祝礼,采用在船头砸酒瓶的理由是",
		type = 1,
		id = 91,
		answer_false3 = "安抚机魂",
		wrong_time = 30,
		answer_false2 = "波塞冬不会英语"
	}
	pg.base.activity_event_question[92] = {
		answer_right = "第十六章",
		answer_false1 = "第十五章",
		question = "主线最新章节是第几章",
		type = 2,
		id = 92,
		answer_false3 = "第十七章",
		wrong_time = 30,
		answer_false2 = "第十四章"
	}
	pg.base.activity_event_question[93] = {
		answer_right = "改良声纳",
		answer_false1 = "液压舵机",
		question = "以下哪件装备航母舰种不适用",
		type = 2,
		id = 93,
		answer_false3 = "防鱼雷隔舱",
		wrong_time = 30,
		answer_false2 = "对空雷达"
	}
	pg.base.activity_event_question[94] = {
		answer_right = "天狼星",
		answer_false1 = "柴郡",
		question = "第一个加入宿舍计划的角色是",
		type = 2,
		id = 94,
		answer_false3 = "安克雷奇",
		wrong_time = 30,
		answer_false2 = "萨拉托加"
	}
	pg.base.activity_event_question[95] = {
		answer_right = "马塞纳",
		answer_false1 = "埃佛森",
		question = "以下哪个角色不属于郁金王国阵营",
		type = 2,
		id = 95,
		answer_false3 = "七省",
		wrong_time = 30,
		answer_false2 = "金狮"
	}
	pg.base.activity_event_question[96] = {
		answer_right = "圣地亚哥",
		answer_false1 = "彗星",
		question = "星辉闪耀爆射枪是( )的专属特殊兵装",
		type = 2,
		id = 96,
		answer_false3 = "水星纪念",
		wrong_time = 30,
		answer_false2 = "海王星"
	}
	pg.base.activity_event_question[97] = {
		answer_right = "青花鱼",
		answer_false1 = "F6F地狱猫",
		question = "以下哪种舰载机属于鱼雷机",
		type = 2,
		id = 97,
		answer_false3 = "F4F野猫",
		wrong_time = 30,
		answer_false2 = "萤火虫"
	}
	pg.base.activity_event_question[98] = {
		answer_right = "舰艇攻击教材T4",
		answer_false1 = "心智单元",
		question = "以下哪个道具可用于在战术学院中提升舰船技能等级",
		type = 2,
		id = 98,
		answer_false3 = "心智魔方",
		wrong_time = 30,
		answer_false2 = "驱逐改造图纸T2"
	}
end)()
