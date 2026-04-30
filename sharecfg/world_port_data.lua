pg = pg or {}
pg.world_port_data = rawget(pg, "world_port_data") or setmetatable({
	__name = "world_port_data"
}, confNEO)
pg.world_port_data.all = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	20,
	30,
	100,
	301
}
pg.base = pg.base or {}
pg.base.world_port_data = {}

;(function()
	pg.base.world_port_data[1] = {
		port_bg = "port_niuyue",
		name = "NY",
		port_camp = 1,
		port_entrance_icon = "port_niuyue",
		id = 1,
		scan_desc = "一处白鹰所属的重要港口。",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[2] = {
		port_bg = "port_liwupu",
		name = "利维浦",
		port_camp = 1,
		port_entrance_icon = "port_liwupu",
		id = 2,
		scan_desc = "一处皇家所属的重要港口。",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[3] = {
		port_bg = "port_zhibuluotuo",
		name = "直布罗特",
		port_camp = 1,
		port_entrance_icon = "port_zhibuluotuo",
		id = 3,
		scan_desc = "一处皇家所属的重要港口。",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[4] = {
		port_bg = "port_shenbidebao",
		name = "圣彼得伯格",
		port_camp = 1,
		port_entrance_icon = "port_shenbidebao",
		id = 4,
		scan_desc = "一处北方联合所属的重要港口。",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[5] = {
		port_bg = "port_jier",
		name = "霍尔斯坦",
		port_camp = 2,
		port_entrance_icon = "port_jier",
		id = 5,
		scan_desc = "一处铁血所属的重要港口。",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[6] = {
		port_bg = "port_talantuo",
		name = "塔伦托",
		port_camp = 2,
		port_entrance_icon = "port_talantuo",
		id = 6,
		scan_desc = "一处撒丁帝国所属的重要港口。",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[7] = {
		port_bg = "port_buleisite",
		name = "布勒斯特",
		port_camp = 2,
		port_entrance_icon = "port_buleisite",
		id = 7,
		scan_desc = "一处维希教廷所属的重要港口。",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[8] = {
		port_bg = "port_dakaer",
		name = "达咯尔",
		port_camp = 2,
		port_entrance_icon = "port_dakaer",
		id = 8,
		scan_desc = "一处维希教廷所属的重要港口。",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[20] = {
		port_bg = "port_zuozhangangkou",
		name = "作战港口",
		port_camp = 1,
		port_entrance_icon = "",
		id = 20,
		scan_desc = "参与作战的舰队在此集结",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[30] = {
		port_bg = "port_zuozhangangkou",
		name = "核心区前哨站",
		port_camp = 1,
		port_entrance_icon = "",
		id = 30,
		scan_desc = "参与作战的舰队在此集结",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[100] = {
		port_bg = "port_chuanwu1",
		name = "海域补给商店",
		port_camp = 0,
		port_entrance_icon = "",
		id = 100,
		scan_desc = "",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
	pg.base.world_port_data[301] = {
		port_bg = "port_chongdong",
		name = "虫洞商店",
		port_camp = 0,
		port_entrance_icon = "",
		id = 301,
		scan_desc = "",
		open_condition = {
			{
				1,
				0
			},
			{
				2,
				0
			}
		}
	}
end)()
