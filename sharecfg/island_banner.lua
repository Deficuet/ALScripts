pg = pg or {}
pg.island_banner = rawget(pg, "island_banner") or setmetatable({
	__name = "island_banner"
}, confNEO)
pg.island_banner.all = {
	1,
	2,
	3
}
pg.base = pg.base or {}
pg.base.island_banner = {}

;(function()
	pg.base.island_banner[1] = {
		param = "1005",
		id = 1,
		pic = "temp1",
		type = 4,
		time = {
			{
				{
					2025,
					7,
					4
				},
				{
					12,
					0,
					0
				}
			},
			{
				{
					2025,
					7,
					9
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
	pg.base.island_banner[2] = {
		param = "",
		id = 2,
		pic = "temp2",
		type = 0,
		time = {
			{
				{
					2025,
					7,
					2
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					7,
					4
				},
				{
					11,
					59,
					59
				}
			}
		}
	}
	pg.base.island_banner[3] = {
		id = 3,
		pic = "temp4",
		type = 4,
		param = {
			"IslandSeasonPage",
			{
				{
					target_act_id = 7110
				}
			}
		},
		time = {
			{
				{
					2026,
					1,
					8
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
					1,
					22
				},
				{
					23,
					59,
					59
				}
			}
		}
	}
end)()
