pg = pg or {}
pg.island_unit_interactive_item = {
	[100203] = {
		navAgentParam = "",
		name = "互动椅子",
		model = "island/item/collider/1002/prefab/chair_collider",
		slot_cnt = 2,
		id = 100203,
		timeline = {
			4
		},
		param = {
			{}
		}
	},
	[100204] = {
		navAgentParam = "",
		name = "门",
		model = "island/item/collider/1002/prefab/chair_collider",
		slot_cnt = 1,
		id = 100204,
		timeline = {
			1111,
			1112
		},
		param = {
			{
				"open",
				true
			},
			{
				"open",
				false
			}
		}
	},
	all = {
		100203,
		100204
	}
}
