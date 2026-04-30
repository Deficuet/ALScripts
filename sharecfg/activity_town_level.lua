pg = pg or {}
pg.activity_town_level = rawget(pg, "activity_town_level") or setmetatable({
	__name = "activity_town_level"
}, confNEO)
pg.activity_town_level.all = {
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
	15
}
pg.base = pg.base or {}
pg.base.activity_town_level = {}

;(function()
	pg.base.activity_town_level[1] = {
		exp = 30,
		unlock_story = "HUANGYEJIARIKAITUOJI1",
		id = 1,
		gold_max = 999999000,
		gold = 50000,
		unlock_chara = 3,
		story = 0,
		unlock_work = {
			{
				1
			},
			{}
		}
	}
	pg.base.activity_town_level[2] = {
		exp = 60,
		unlock_story = "",
		id = 2,
		gold_max = 999999000,
		gold = 200000,
		unlock_chara = 3,
		story = 0,
		unlock_work = {
			{},
			{
				5
			}
		}
	}
	pg.base.activity_town_level[3] = {
		exp = 100,
		unlock_story = "HUANGYEJIARIKAITUOJI2",
		id = 3,
		gold_max = 999999000,
		gold = 500000,
		unlock_chara = 4,
		story = 2,
		unlock_work = {
			{
				11
			},
			{}
		}
	}
	pg.base.activity_town_level[4] = {
		exp = 200,
		unlock_story = "",
		id = 4,
		gold_max = 999999000,
		gold = 1500000,
		unlock_chara = 4,
		story = 0,
		unlock_work = {
			{
				101
			},
			{
				15
			}
		}
	}
	pg.base.activity_town_level[5] = {
		exp = 300,
		unlock_story = "HUANGYEJIARIKAITUOJI3",
		id = 5,
		gold_max = 999999000,
		gold = 5000000,
		unlock_chara = 5,
		story = 4,
		unlock_work = {
			{
				21
			},
			{
				105
			}
		}
	}
	pg.base.activity_town_level[6] = {
		exp = 400,
		unlock_story = "",
		id = 6,
		gold_max = 999999000,
		gold = 10000000,
		unlock_chara = 6,
		story = 0,
		unlock_work = {
			{
				111
			},
			{
				25
			}
		}
	}
	pg.base.activity_town_level[7] = {
		exp = 600,
		unlock_story = "HUANGYEJIARIKAITUOJI4",
		id = 7,
		gold_max = 999999000,
		gold = 20000000,
		unlock_chara = 7,
		story = 6,
		unlock_work = {
			{
				31
			},
			{
				115
			}
		}
	}
	pg.base.activity_town_level[8] = {
		exp = 800,
		unlock_story = "",
		id = 8,
		gold_max = 999999000,
		gold = 40000000,
		unlock_chara = 8,
		story = 0,
		unlock_work = {
			{
				131
			},
			{
				35
			}
		}
	}
	pg.base.activity_town_level[9] = {
		exp = 1000,
		unlock_story = "",
		id = 9,
		gold_max = 999999000,
		gold = 80000000,
		unlock_chara = 9,
		story = 0,
		unlock_work = {
			{
				121
			},
			{
				134
			}
		}
	}
	pg.base.activity_town_level[10] = {
		exp = 1100,
		unlock_story = "HUANGYEJIARIKAITUOJI5",
		id = 10,
		gold_max = 9999999000,
		gold = 160000000,
		unlock_chara = 9,
		story = 0,
		unlock_work = {
			{},
			{
				137
			}
		}
	}
	pg.base.activity_town_level[11] = {
		exp = 1200,
		unlock_story = "",
		id = 11,
		gold_max = 9999999000,
		gold = 240000000,
		unlock_chara = 9,
		story = 0,
		unlock_work = {
			{},
			{}
		}
	}
	pg.base.activity_town_level[12] = {
		exp = 1300,
		unlock_story = "",
		id = 12,
		gold_max = 9999999000,
		gold = 320000000,
		unlock_chara = 9,
		story = 0,
		unlock_work = {
			{},
			{}
		}
	}
	pg.base.activity_town_level[13] = {
		exp = 1400,
		unlock_story = "",
		id = 13,
		gold_max = 9999999000,
		gold = 640000000,
		unlock_chara = 9,
		story = 0,
		unlock_work = {
			{},
			{}
		}
	}
	pg.base.activity_town_level[14] = {
		exp = 1500,
		unlock_story = "",
		id = 14,
		gold_max = 9999999000,
		gold = 1000000000,
		unlock_chara = 9,
		story = 0,
		unlock_work = {
			{},
			{}
		}
	}
	pg.base.activity_town_level[15] = {
		exp = 0,
		unlock_story = "",
		id = 15,
		gold_max = 99999999000,
		gold = 0,
		unlock_chara = 9,
		story = 0,
		unlock_work = {
			{},
			{}
		}
	}
end)()
