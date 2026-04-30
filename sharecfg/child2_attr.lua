pg = pg or {}
pg.child2_attr = rawget(pg, "child2_attr") or setmetatable({
	__name = "child2_attr"
}, confNEO)
pg.child2_attr.all = {
	101,
	102,
	103,
	104,
	201,
	301,
	302,
	303,
	304,
	305
}
pg.child2_attr.get_id_list_by_character = {
	{
		101,
		102,
		103,
		104,
		201
	},
	{
		301,
		302,
		303,
		304,
		305
	}
}
pg.base = pg.base or {}
pg.base.child2_attr = {}

;(function()
	pg.base.child2_attr[101] = {
		default_value = 0,
		name = "体能",
		icon = "attr_tineng",
		type = 1,
		max_value = 999999,
		min_value = 0,
		character = 1,
		id = 101,
		item_icon = "attr_tineng2",
		rank = {
			{
				{
					0,
					599
				},
				"D"
			},
			{
				{
					600,
					1199
				},
				"C"
			},
			{
				{
					1200,
					2399
				},
				"B"
			},
			{
				{
					2400,
					90000
				},
				"A"
			}
		}
	}
	pg.base.child2_attr[102] = {
		default_value = 0,
		name = "知识",
		icon = "attr_zhishi",
		type = 1,
		max_value = 999999,
		min_value = 0,
		character = 1,
		id = 102,
		item_icon = "attr_zhishi2",
		rank = {
			{
				{
					0,
					599
				},
				"D"
			},
			{
				{
					600,
					1199
				},
				"C"
			},
			{
				{
					1200,
					2399
				},
				"B"
			},
			{
				{
					2400,
					90000
				},
				"A"
			}
		}
	}
	pg.base.child2_attr[103] = {
		default_value = 0,
		name = "实践",
		icon = "attr_shijian",
		type = 1,
		max_value = 999999,
		min_value = 0,
		character = 1,
		id = 103,
		item_icon = "attr_shijian2",
		rank = {
			{
				{
					0,
					599
				},
				"D"
			},
			{
				{
					600,
					1199
				},
				"C"
			},
			{
				{
					1200,
					2399
				},
				"B"
			},
			{
				{
					2400,
					90000
				},
				"A"
			}
		}
	}
	pg.base.child2_attr[104] = {
		default_value = 0,
		name = "感知",
		icon = "attr_ganzhi",
		type = 1,
		max_value = 999999,
		min_value = 0,
		character = 1,
		id = 104,
		item_icon = "attr_ganzhi2",
		rank = {
			{
				{
					0,
					599
				},
				"D"
			},
			{
				{
					600,
					1199
				},
				"C"
			},
			{
				{
					1200,
					2399
				},
				"B"
			},
			{
				{
					2400,
					90000
				},
				"A"
			}
		}
	}
	pg.base.child2_attr[201] = {
		default_value = 155,
		name = "性格",
		icon = "attr_xingge",
		type = 2,
		max_value = 300,
		min_value = 0,
		character = 1,
		id = 201,
		item_icon = "attr_xingge",
		rank = {}
	}
	pg.base.child2_attr[301] = {
		default_value = 0,
		name = "体能",
		icon = "attr_tineng",
		type = 1,
		max_value = 99999999,
		min_value = 0,
		character = 2,
		id = 301,
		item_icon = "attr_tineng2",
		rank = {
			{
				{
					0,
					599
				},
				"D"
			},
			{
				{
					600,
					1199
				},
				"C"
			},
			{
				{
					1200,
					2399
				},
				"B"
			},
			{
				{
					2400,
					90000
				},
				"A"
			}
		}
	}
	pg.base.child2_attr[302] = {
		default_value = 0,
		name = "知识",
		icon = "attr_zhishi",
		type = 1,
		max_value = 99999999,
		min_value = 0,
		character = 2,
		id = 302,
		item_icon = "attr_zhishi2",
		rank = {
			{
				{
					0,
					599
				},
				"D"
			},
			{
				{
					600,
					1199
				},
				"C"
			},
			{
				{
					1200,
					2399
				},
				"B"
			},
			{
				{
					2400,
					90000
				},
				"A"
			}
		}
	}
	pg.base.child2_attr[303] = {
		default_value = 0,
		name = "实践",
		icon = "attr_shijian",
		type = 1,
		max_value = 99999999,
		min_value = 0,
		character = 2,
		id = 303,
		item_icon = "attr_shijian2",
		rank = {
			{
				{
					0,
					599
				},
				"D"
			},
			{
				{
					600,
					1199
				},
				"C"
			},
			{
				{
					1200,
					2399
				},
				"B"
			},
			{
				{
					2400,
					90000
				},
				"A"
			}
		}
	}
	pg.base.child2_attr[304] = {
		default_value = 0,
		name = "感知",
		icon = "attr_ganzhi",
		type = 1,
		max_value = 99999999,
		min_value = 0,
		character = 2,
		id = 304,
		item_icon = "attr_ganzhi2",
		rank = {
			{
				{
					0,
					599
				},
				"D"
			},
			{
				{
					600,
					1199
				},
				"C"
			},
			{
				{
					1200,
					2399
				},
				"B"
			},
			{
				{
					2400,
					90000
				},
				"A"
			}
		}
	}
	pg.base.child2_attr[305] = {
		default_value = 145,
		name = "性格",
		icon = "attr_xingge",
		type = 2,
		max_value = 300,
		min_value = 0,
		character = 2,
		id = 305,
		item_icon = "attr_xingge",
		rank = {}
	}
end)()
