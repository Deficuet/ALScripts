pg = pg or {}
pg.island_interaction = {
	[101] = {
		text = "与明石交谈",
		param = "island_1",
		id = 101,
		type = 1,
		groupId = 1
	},
	[102] = {
		text = "询问岛屿详情",
		param = "island_3",
		id = 102,
		type = 2,
		groupId = 1
	},
	[103] = {
		text = "明石躲避游戏",
		param = "10090001",
		id = 103,
		type = 7,
		groupId = 1
	},
	[201] = {
		text = "坐下",
		param = "sit_1__s2",
		id = 201,
		type = 3,
		groupId = 2
	},
	[301] = {
		text = "与岛风交谈",
		param = "island_2",
		id = 301,
		type = 0,
		groupId = 3
	},
	[401] = {
		text = "与家具互动",
		param = "",
		id = 401,
		type = 4,
		groupId = 4
	},
	[501] = {
		text = "取消互动",
		param = "",
		id = 501,
		type = 5,
		groupId = 5
	},
	[701] = {
		text = "传送",
		param = "10050001",
		id = 701,
		type = 7,
		groupId = 7
	},
	[801] = {
		text = "管理矿场",
		param = "IslandRoleDelegationPage",
		id = 801,
		type = 6,
		groupId = 8
	},
	[802] = {
		text = "timeline播放测试",
		param = "ISLANDSTORY2",
		id = 802,
		type = 1,
		groupId = 8
	},
	[901] = {
		text = "查看船舶订单",
		param = "IslandShipOrderPage",
		id = 901,
		type = 6,
		groupId = 9
	},
	[1001] = {
		text = "传送点",
		param = "10040001",
		id = 1001,
		type = 7,
		groupId = 10
	},
	[11001] = {
		text = "开门",
		groupId = 11,
		id = 11001,
		type = 8,
		param = {
			"open",
			true
		}
	},
	[1101] = {
		text = "进入咖啡馆",
		param = "10090001",
		id = 1101,
		type = 7,
		groupId = 11
	},
	[1201] = {
		text = "管理咖啡馆",
		param = "IslandRoleDelegationPage",
		id = 1201,
		type = 6,
		groupId = 12
	},
	[1202] = {
		text = "营业管理",
		param = "",
		id = 1202,
		type = 0,
		groupId = 12
	},
	get_id_list_by_groupId = {
		{
			101,
			102,
			103
		},
		{
			201
		},
		{
			301
		},
		{
			401
		},
		{
			501
		},
		[7] = {
			701
		},
		[8] = {
			801,
			802
		},
		[9] = {
			901
		},
		[10] = {
			1001
		},
		[11] = {
			11001,
			1101
		},
		[12] = {
			1201,
			1202
		}
	},
	all = {
		101,
		102,
		103,
		201,
		301,
		401,
		501,
		701,
		801,
		802,
		901,
		1001,
		11001,
		1101,
		1201,
		1202
	}
}
