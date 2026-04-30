pg = pg or {}
pg.island_dialogue = rawget(pg, "island_dialogue") or setmetatable({
	__name = "island_dialogue"
}, confNEO)
pg.island_dialogue.all = {
	101,
	102,
	103,
	104,
	105,
	201,
	202,
	301,
	302,
	303,
	401,
	501,
	502
}
pg.island_dialogue.get_id_list_by_groupId = {
	{
		101,
		102,
		103,
		104,
		105
	},
	{
		201,
		202
	},
	{
		301,
		302,
		303
	},
	{
		401
	},
	{
		501,
		502
	}
}
pg.base = pg.base or {}
pg.base.island_dialogue = {}

;(function()
	pg.base.island_dialogue[101] = {
		text = "测试测试",
		id = 101,
		action = "hello__s2",
		groupId = 1,
		duration = 2
	}
	pg.base.island_dialogue[102] = {
		text = "能看见我的气泡吗",
		id = 102,
		action = "",
		groupId = 1,
		duration = 2
	}
	pg.base.island_dialogue[103] = {
		text = "诶",
		id = 103,
		action = "",
		groupId = 1,
		duration = 2
	}
	pg.base.island_dialogue[104] = {
		text = "能看见吗！",
		id = 104,
		action = "",
		groupId = 1,
		duration = 2
	}
	pg.base.island_dialogue[105] = {
		text = "太好了",
		id = 105,
		action = "",
		groupId = 1,
		duration = 2
	}
	pg.base.island_dialogue[201] = {
		text = "种子用完了怎么办呢",
		id = 201,
		action = "",
		groupId = 2,
		duration = 3
	}
	pg.base.island_dialogue[202] = {
		text = "希望指挥官能早点到达",
		id = 202,
		action = "",
		groupId = 2,
		duration = 3
	}
	pg.base.island_dialogue[301] = {
		text = "还有事情要做...",
		id = 301,
		action = "",
		groupId = 3,
		duration = 3
	}
	pg.base.island_dialogue[302] = {
		text = "今天也是辛勤劳动的一天",
		id = 302,
		action = "",
		groupId = 3,
		duration = 3
	}
	pg.base.island_dialogue[303] = {
		text = "晚上吃什么好呢~",
		id = 303,
		action = "",
		groupId = 3,
		duration = 3
	}
	pg.base.island_dialogue[401] = {
		text = "指挥官好~",
		id = 401,
		action = "",
		groupId = 4,
		duration = 2
	}
	pg.base.island_dialogue[501] = {
		text = "在岛屿上，指挥官可以尽情的干自己想干的事情",
		id = 501,
		action = "",
		groupId = 5,
		duration = 2
	}
	pg.base.island_dialogue[502] = {
		text = "未来还会有很多伙伴们登上岛屿哦",
		id = 502,
		action = "",
		groupId = 5,
		duration = 2
	}
end)()
