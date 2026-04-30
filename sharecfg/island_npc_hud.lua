pg = pg or {}
pg.island_npc_hud = rawget(pg, "island_npc_hud") or setmetatable({
	__name = "island_npc_hud"
}, confNEO)
pg.island_npc_hud.__namecode__ = true
pg.island_npc_hud.all = {
	1001,
	1002,
	1003,
	1004,
	1005,
	1006,
	1007,
	1008,
	1009,
	1010,
	1011,
	1012,
	1013,
	1014,
	1015,
	1016,
	1018
}
pg.base = pg.base or {}
pg.base.island_npc_hud = {}

;(function()
	pg.base.island_npc_hud[1001] = {
		id = 1001,
		title = "磨坊管理员",
		name = "奥林匹克 ",
		icon = "1001",
		show_condition = {}
	}
	pg.base.island_npc_hud[1002] = {
		id = 1002,
		title = "订单管理员 ",
		name = "帕特莉 ",
		icon = "1002",
		show_condition = {}
	}
	pg.base.island_npc_hud[1003] = {
		id = 1003,
		title = "货运管理员 ",
		name = "斯蒂芬妮 ",
		icon = "1003",
		show_condition = {}
	}
	pg.base.island_npc_hud[1004] = {
		id = 1004,
		title = "农田管理员 ",
		name = "赫莫 ",
		icon = "1004",
		show_condition = {}
	}
	pg.base.island_npc_hud[1005] = {
		id = 1005,
		title = "牧场管理员 ",
		name = "梅莉 ",
		icon = "1005",
		show_condition = {}
	}
	pg.base.island_npc_hud[1006] = {
		id = 1006,
		title = "矿山管理员",
		name = "乔安 ",
		icon = "1006",
		show_condition = {}
	}
	pg.base.island_npc_hud[1007] = {
		id = 1007,
		title = "林场管理员",
		name = "奥布莱恩 ",
		icon = "1007",
		show_condition = {}
	}
	pg.base.island_npc_hud[1008] = {
		id = 1008,
		title = "商区管理员 ",
		name = "阿莫玛 ",
		icon = "1008",
		show_condition = {}
	}
	pg.base.island_npc_hud[1009] = {
		id = 1009,
		title = "工厂管理员",
		name = "萝莎 ",
		icon = "1009",
		show_condition = {}
	}
	pg.base.island_npc_hud[1010] = {
		id = 1010,
		title = "集会岛接待员 ",
		name = "莉莎 ",
		icon = "1010",
		show_condition = {}
	}
	pg.base.island_npc_hud[1011] = {
		id = 1011,
		title = "果园管理员 ",
		name = "露西 ",
		icon = "1011",
		show_condition = {}
	}
	pg.base.island_npc_hud[1012] = {
		id = 1012,
		title = "啾咖啡店员 ",
		name = "布莱梅 ",
		icon = "1012",
		show_condition = {}
	}
	pg.base.island_npc_hud[1013] = {
		id = 1013,
		title = "集会岛向导",
		name = "玛丽",
		icon = "",
		show_condition = {}
	}
	pg.base.island_npc_hud[1014] = {
		id = 1014,
		title = "苗圃管理员 ",
		name = "拉科尼娅",
		icon = "1014",
		show_condition = {}
	}
	pg.base.island_npc_hud[1015] = {
		id = 1015,
		title = "神秘商人",
		name = "珂汀 ",
		icon = "",
		show_condition = {}
	}
	pg.base.island_npc_hud[1016] = {
		id = 1016,
		title = "开发季管理员 ",
		name = "佩芮 ",
		icon = "",
		show_condition = {}
	}
	pg.base.island_npc_hud[1018] = {
		id = 1018,
		title = "渔场管理员",
		name = "布莉缇",
		icon = "1018",
		show_condition = {}
	}
end)()
