pg = pg or {}
pg.child2_resource = {
	{
		default_value = 50,
		name = "金钱",
		icon = "res_jinqian",
		type = 1,
		max_value = 99999,
		min_value = 0,
		desc = "虚拟小镇的货币，用处多多",
		character = 1,
		id = 1,
		item_icon = "res_jinqian2"
	},
	{
		default_value = 50,
		name = "心情",
		icon = "res_xinqing",
		type = 2,
		max_value = 100,
		min_value = 0,
		desc = "$1\n心情将会影响属性、金钱的收益\n0~19:收益减少40%      20~39:收益减少20%\n40~59:收益不变             60~100: 收益增加40%",
		character = 1,
		id = 2,
		item_icon = "res_xinqing2"
	},
	{
		default_value = 3,
		name = "行动力",
		icon = "res_xingdongli",
		type = 3,
		max_value = 3,
		min_value = 0,
		desc = "用于大地图出行，每回合会回复至满值。",
		character = 1,
		id = 3,
		item_icon = "res_xingdongli2"
	},
	{
		default_value = 50,
		name = "好感度",
		icon = "res_haogandu",
		type = 4,
		max_value = 500,
		min_value = 0,
		desc = "完成主界面对话事件可增加好感度。\n好感度提升可获得奖励。",
		character = 1,
		id = 4,
		item_icon = "res_haogandu2"
	},
	[301] = {
		default_value = 50,
		name = "金钱",
		icon = "res_jinqian",
		type = 1,
		max_value = 99999,
		min_value = 0,
		desc = "虚拟小镇的货币，用处多多",
		character = 2,
		id = 301,
		item_icon = "res_jinqian2"
	},
	[302] = {
		default_value = 50,
		name = "心情",
		icon = "res_xinqing",
		type = 2,
		max_value = 100,
		min_value = 0,
		desc = "$1\n心情将会影响属性、金钱的收益\n0~19:收益减少40%      20~39:收益减少20%\n40~59:收益不变             60~100: 收益增加40%",
		character = 2,
		id = 302,
		item_icon = "res_xinqing2"
	},
	[303] = {
		default_value = 3,
		name = "行动力",
		icon = "res_xingdongli",
		type = 3,
		max_value = 99,
		min_value = 0,
		desc = "用于大地图出行，每回合会回复至满值。",
		character = 2,
		id = 303,
		item_icon = "res_xingdongli2"
	},
	[304] = {
		default_value = 50,
		name = "好感度",
		icon = "res_haogandu",
		type = 4,
		max_value = 500,
		min_value = 0,
		desc = "完成主界面对话事件可增加好感度。\n好感度提升可获得奖励。",
		character = 2,
		id = 304,
		item_icon = "res_haogandu2"
	},
	[305] = {
		default_value = 0,
		name = "占星馆刷新次数",
		icon = "res_refresh1",
		type = 5,
		max_value = 3,
		min_value = 0,
		desc = "在占星馆可消耗占星馆刷新次数来刷新商品内容。",
		character = 2,
		id = 305,
		item_icon = "res_refresh1"
	},
	[306] = {
		default_value = 5,
		name = "重抽次数",
		icon = "res_refresh2",
		type = 6,
		max_value = 500,
		min_value = 0,
		desc = "在选择界面可消耗重抽次数来刷新可获得的塔罗牌或释义。",
		character = 2,
		id = 306,
		item_icon = "res_refresh2"
	},
	get_id_list_by_character = {
		{
			1,
			2,
			3,
			4
		},
		{
			301,
			302,
			303,
			304,
			305,
			306
		}
	},
	all = {
		1,
		2,
		3,
		4,
		301,
		302,
		303,
		304,
		305,
		306
	}
}
