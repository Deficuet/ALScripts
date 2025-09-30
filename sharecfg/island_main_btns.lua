pg = pg or {}
pg.island_main_btns = {
	{
		main_type = 2,
		name = "仓库",
		order = 1,
		open_page = "IslandInventoryPage",
		id = 1,
		icon = "inventory",
		ability_id = 9,
		btn_name = "inventory",
		page_param = {}
	},
	{
		main_type = 1,
		name = "角色",
		order = 5,
		open_page = "IslandShipMainPage",
		id = 2,
		icon = "char",
		ability_id = 28,
		btn_name = "char",
		page_param = {}
	},
	{
		main_type = 1,
		name = "地图",
		order = 2,
		open_page = "IslandMapPage",
		id = 3,
		icon = "map",
		ability_id = 6,
		btn_name = "map",
		page_param = {}
	},
	{
		main_type = 1,
		name = "商店",
		order = 1,
		open_page = "IslandShopPage",
		id = 4,
		icon = "shop",
		ability_id = 35,
		btn_name = "shop",
		page_param = {
			{
				1,
				2,
				3,
				4,
				5
			},
			{
				10109,
				50111,
				10130
			},
			1
		}
	},
	{
		main_type = 1,
		name = "设备",
		order = 6,
		open_page = "IslandDevicePage",
		id = 5,
		icon = "device",
		ability_id = 2,
		btn_name = "device",
		page_param = {}
	},
	{
		main_type = 2,
		name = "岛屿订单",
		order = 2,
		open_page = "IslandOrderPage",
		id = 6,
		icon = "order",
		ability_id = 7,
		btn_name = "order",
		page_param = {}
	},
	{
		main_type = 2,
		name = "货运委托",
		order = 3,
		open_page = "IslandShipOrderPage",
		id = 7,
		icon = "ship_order",
		ability_id = 32,
		btn_name = "ship_order",
		page_param = {}
	},
	{
		main_type = 2,
		name = "管理",
		order = 4,
		open_page = "IslandPostManagePage",
		id = 8,
		icon = "post_manage",
		ability_id = 37001,
		btn_name = "post_manage",
		page_param = {}
	},
	{
		main_type = 2,
		name = "套餐图鉴",
		order = 5,
		open_page = "IslandSetMealHandbookPage",
		id = 9,
		icon = "collection",
		ability_id = 29001,
		btn_name = "collection",
		page_param = {}
	},
	{
		main_type = 2,
		name = "成就",
		order = 6,
		open_page = "IslandAchvDetailPage",
		id = 10,
		icon = "achievement",
		ability_id = 30,
		btn_name = "achievement",
		page_param = {}
	},
	{
		main_type = 1,
		name = "开发季",
		order = 3,
		open_page = "IslandSeasonPage",
		id = 11,
		icon = "season",
		ability_id = 31,
		btn_name = "season",
		page_param = {}
	},
	{
		main_type = 1,
		name = "科技研发",
		order = 4,
		open_page = "IslandTechnologyPage",
		id = 12,
		icon = "technology",
		ability_id = 28,
		btn_name = "technology",
		page_param = {}
	},
	{
		main_type = 2,
		name = "好友",
		order = 7,
		open_page = "IslandFriendPage",
		id = 13,
		icon = "friend",
		ability_id = 27,
		btn_name = "friend",
		page_param = {}
	},
	{
		main_type = 2,
		name = "装扮",
		order = 8,
		open_page = "IslandShipIslandCommanderMainPage",
		id = 14,
		icon = "commander",
		ability_id = 33,
		btn_name = "commander",
		page_param = {}
	},
	{
		main_type = 2,
		name = "计划",
		order = 9,
		open_page = "Island3dTaskPage",
		id = 15,
		icon = "task",
		ability_id = 2,
		btn_name = "task",
		page_param = {}
	},
	{
		main_type = 2,
		name = "邮件",
		order = 10,
		open_page = "IslandMailPage",
		id = 16,
		icon = "mail",
		ability_id = 0,
		btn_name = "mail",
		page_param = {}
	},
	{
		main_type = 2,
		name = "设置",
		order = 11,
		open_page = "IslandSettingsPage",
		id = 17,
		icon = "setting",
		ability_id = 0,
		btn_name = "setting",
		page_param = {}
	},
	{
		main_type = 2,
		name = "图鉴",
		order = 12,
		open_page = "IslandBookPage",
		id = 18,
		icon = "book",
		ability_id = 0,
		btn_name = "book",
		page_param = {}
	},
	{
		main_type = 2,
		name = "拍照",
		order = 13,
		open_page = "IslandPhotoMainPage",
		id = 19,
		icon = "photo",
		ability_id = 41,
		btn_name = "photo",
		page_param = {}
	},
	get_id_list_by_main_type = {
		[2] = {
			1,
			6,
			7,
			8,
			9,
			10,
			13,
			14,
			15,
			16,
			17,
			18,
			19
		},
		{
			2,
			3,
			4,
			5,
			11,
			12
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19
	}
}
