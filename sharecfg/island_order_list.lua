pg = pg or {}
pg.island_order_list = {
	[101] = {
		id = 101,
		name = "普通订单1",
		unlock_level = 1,
		type = 1,
		unlock_cost = {}
	},
	[102] = {
		id = 102,
		name = "普通订单2",
		unlock_level = 5,
		type = 1,
		unlock_cost = {}
	},
	[103] = {
		id = 103,
		name = "普通订单3",
		unlock_level = 10,
		type = 1,
		unlock_cost = {}
	},
	[104] = {
		id = 104,
		name = "普通订单4",
		unlock_level = 15,
		type = 1,
		unlock_cost = {}
	},
	[105] = {
		id = 105,
		name = "普通订单5",
		unlock_level = 20,
		type = 1,
		unlock_cost = {}
	},
	[201] = {
		id = 201,
		name = "加急订单1",
		unlock_level = 5,
		type = 2,
		unlock_cost = {}
	},
	[301] = {
		id = 301,
		name = "船舶订单1",
		unlock_level = 10,
		type = 3,
		unlock_cost = {
			{
				1,
				0
			}
		}
	},
	[302] = {
		id = 302,
		name = "船舶订单2",
		unlock_level = 20,
		type = 3,
		unlock_cost = {
			{
				1,
				500
			}
		}
	},
	[303] = {
		id = 303,
		name = "船舶订单3",
		unlock_level = 30,
		type = 3,
		unlock_cost = {
			{
				1,
				1000
			}
		}
	},
	get_id_list_by_type = {
		{
			101,
			102,
			103,
			104,
			105
		},
		{
			201
		},
		{
			301,
			302,
			303
		}
	},
	all = {
		101,
		102,
		103,
		104,
		105,
		201,
		301,
		302,
		303
	}
}
