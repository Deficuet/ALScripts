pg = pg or {}
pg.island_shop_normal_template = {
	[10003] = {
		id = 10003,
		refresh_free = 1,
		refresh_set = 5,
		refresh_time = 1,
		unlock = "",
		exist_time = {
			{
				{
					2025,
					2,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					2,
					19
				},
				{
					23,
					59,
					59
				}
			}
		},
		refresh_player = {
			{
				41,
				1001,
				100
			}
		}
	},
	[10006] = {
		refresh_player = "",
		id = 10006,
		refresh_free = 0,
		unlock = "",
		refresh_set = 0,
		refresh_time = 0,
		exist_time = "always"
	},
	all = {
		10003,
		10006
	}
}
