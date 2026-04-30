pg = pg or {}
pg.child_attr = rawget(pg, "child_attr") or setmetatable({
	__name = "child_attr"
}, confNEO)
pg.child_attr.all = {
	101,
	102,
	103,
	104,
	201,
	202,
	203,
	301,
	302,
	303,
	304,
	305,
	306
}
pg.base = pg.base or {}
pg.base.child_attr = {}

;(function()
	pg.base.child_attr[101] = {
		id = 101,
		name = "体能",
		icon = "10004",
		type = 1,
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
	pg.base.child_attr[102] = {
		id = 102,
		name = "智慧",
		icon = "10005",
		type = 1,
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
	pg.base.child_attr[103] = {
		id = 103,
		name = "气质",
		icon = "10006",
		type = 1,
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
	pg.base.child_attr[104] = {
		id = 104,
		name = "感知",
		icon = "10007",
		type = 1,
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
	pg.base.child_attr[201] = {
		id = 201,
		name = "安静",
		icon = "child_wukou",
		type = 2,
		rank = {}
	}
	pg.base.child_attr[202] = {
		id = 202,
		name = "开朗",
		icon = "child_kailang",
		type = 2,
		rank = {}
	}
	pg.base.child_attr[203] = {
		id = 203,
		name = "温柔",
		icon = "child_wenrou",
		type = 2,
		rank = {}
	}
	pg.base.child_attr[301] = {
		id = 301,
		name = "表现",
		icon = "10008",
		type = 3,
		rank = {
			{
				{
					0,
					200
				},
				"D"
			},
			{
				{
					200,
					400
				},
				"C"
			},
			{
				{
					400,
					600
				},
				"B"
			},
			{
				{
					600,
					10000
				},
				"A"
			}
		}
	}
	pg.base.child_attr[302] = {
		id = 302,
		name = "乐理",
		icon = "10009",
		type = 3,
		rank = {
			{
				{
					0,
					200
				},
				"D"
			},
			{
				{
					200,
					400
				},
				"C"
			},
			{
				{
					400,
					600
				},
				"B"
			},
			{
				{
					600,
					10000
				},
				"A"
			}
		}
	}
	pg.base.child_attr[303] = {
		id = 303,
		name = "细心",
		icon = "10010",
		type = 3,
		rank = {
			{
				{
					0,
					200
				},
				"D"
			},
			{
				{
					200,
					400
				},
				"C"
			},
			{
				{
					400,
					600
				},
				"B"
			},
			{
				{
					600,
					10000
				},
				"A"
			}
		}
	}
	pg.base.child_attr[304] = {
		id = 304,
		name = "想象",
		icon = "10011",
		type = 3,
		rank = {
			{
				{
					0,
					200
				},
				"D"
			},
			{
				{
					200,
					400
				},
				"C"
			},
			{
				{
					400,
					600
				},
				"B"
			},
			{
				{
					600,
					10000
				},
				"A"
			}
		}
	}
	pg.base.child_attr[305] = {
		id = 305,
		name = "运动",
		icon = "10012",
		type = 3,
		rank = {
			{
				{
					0,
					200
				},
				"D"
			},
			{
				{
					200,
					400
				},
				"C"
			},
			{
				{
					400,
					600
				},
				"B"
			},
			{
				{
					600,
					10000
				},
				"A"
			}
		}
	}
	pg.base.child_attr[306] = {
		id = 306,
		name = "实践",
		icon = "10013",
		type = 3,
		rank = {
			{
				{
					0,
					200
				},
				"D"
			},
			{
				{
					200,
					400
				},
				"C"
			},
			{
				{
					400,
					600
				},
				"B"
			},
			{
				{
					600,
					10000
				},
				"A"
			}
		}
	}
end)()
