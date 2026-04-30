pg = pg or {}
pg.island_card_diy = rawget(pg, "island_card_diy") or setmetatable({
	__name = "island_card_diy"
}, confNEO)
pg.island_card_diy.__namecode__ = true
pg.island_card_diy.all = {
	4001,
	4002,
	4003,
	4004,
	4005,
	4006,
	4007,
	4008,
	4009,
	4010,
	4011,
	4012,
	4013,
	4014,
	4015,
	4016,
	4017,
	4018
}
pg.base = pg.base or {}
pg.base.island_card_diy = {}

;(function()
	pg.base.island_card_diy[4001] = {
		tech_id = 0,
		name = "默认形象",
		desc = "默认形象",
		type = 4,
		id = 4001,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4001",
		jump_page = {}
	}
	pg.base.island_card_diy[4002] = {
		tech_id = 0,
		name = "{namecode:199}形象照",
		desc = "{namecode:199}形象照",
		type = 4,
		id = 4002,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4002",
		jump_page = {}
	}
	pg.base.island_card_diy[4003] = {
		tech_id = 0,
		name = "萨拉托加形象照",
		desc = "萨拉托加形象照",
		type = 4,
		id = 4003,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4003",
		jump_page = {}
	}
	pg.base.island_card_diy[4004] = {
		tech_id = 0,
		name = "胡德形象照",
		desc = "胡德形象照",
		type = 4,
		id = 4004,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4004",
		jump_page = {}
	}
	pg.base.island_card_diy[4005] = {
		tech_id = 0,
		name = "独角兽形象照",
		desc = "独角兽形象照",
		type = 4,
		id = 4005,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4005",
		jump_page = {}
	}
	pg.base.island_card_diy[4006] = {
		tech_id = 0,
		name = "柴郡形象照",
		desc = "柴郡形象照",
		type = 4,
		id = 4006,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4006",
		jump_page = {}
	}
	pg.base.island_card_diy[4007] = {
		tech_id = 0,
		name = "{namecode:18}形象照",
		desc = "{namecode:18}形象照",
		type = 4,
		id = 4007,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4007",
		jump_page = {}
	}
	pg.base.island_card_diy[4008] = {
		tech_id = 0,
		name = "{namecode:193}形象照",
		desc = "{namecode:193}形象照",
		type = 4,
		id = 4008,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4008",
		jump_page = {}
	}
	pg.base.island_card_diy[4009] = {
		tech_id = 0,
		name = "{namecode:97}形象照",
		desc = "{namecode:97}形象照",
		type = 4,
		id = 4009,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4009",
		jump_page = {}
	}
	pg.base.island_card_diy[4010] = {
		tech_id = 0,
		name = "{namecode:98}形象照",
		desc = "{namecode:98}形象照",
		type = 4,
		id = 4010,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4010",
		jump_page = {}
	}
	pg.base.island_card_diy[4011] = {
		tech_id = 0,
		name = "{namecode:427}形象照",
		desc = "{namecode:427}形象照",
		type = 4,
		id = 4011,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4011",
		jump_page = {}
	}
	pg.base.island_card_diy[4012] = {
		tech_id = 0,
		name = "应瑞形象照",
		desc = "应瑞形象照",
		type = 4,
		id = 4012,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4012",
		jump_page = {}
	}
	pg.base.island_card_diy[4013] = {
		tech_id = 0,
		name = "肇和形象照",
		desc = "肇和形象照",
		type = 4,
		id = 4013,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4013",
		jump_page = {}
	}
	pg.base.island_card_diy[4014] = {
		tech_id = 0,
		name = "莱昂纳多·达·芬奇形象照",
		desc = "莱昂纳多·达·芬奇形象照",
		type = 4,
		id = 4014,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4014",
		jump_page = {}
	}
	pg.base.island_card_diy[4015] = {
		tech_id = 0,
		name = "塔什干形象照",
		desc = "塔什干形象照",
		type = 4,
		id = 4015,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4015",
		jump_page = {}
	}
	pg.base.island_card_diy[4016] = {
		tech_id = 0,
		name = "恶毒形象照",
		desc = "恶毒形象照",
		type = 4,
		id = 4016,
		icon = "islandprops/morensuipian",
		resource = "islandphoto/4016",
		jump_page = {}
	}
	pg.base.island_card_diy[4017] = {
		tech_id = 0,
		name = "精锐推演师",
		desc = "授予战术推演新秀的认证名片。",
		type = 4,
		id = 4017,
		icon = "islandprops/card_4017",
		resource = "islandphoto/4017",
		jump_page = {
			{
				"开发季—战术推演",
				{}
			}
		}
	}
	pg.base.island_card_diy[4018] = {
		tech_id = 0,
		name = "王牌推演师",
		desc = "颁发给战术推演大师的荣誉名片。",
		type = 4,
		id = 4018,
		icon = "islandprops/card_4018",
		resource = "islandphoto/4018",
		jump_page = {
			{
				"开发季—战术推演",
				{}
			}
		}
	}
end)()
