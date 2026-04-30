pg = pg or {}
pg.vote_champion = rawget(pg, "vote_champion") or setmetatable({
	__name = "vote_champion"
}, confNEO)
pg.vote_champion.all = {
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
	12
}
pg.vote_champion.get_id_list_by_group = {
	[2017] = {
		1,
		2,
		3
	},
	[2019] = {
		4,
		5,
		6
	},
	[2021] = {
		7,
		8,
		9
	},
	[2023] = {
		10,
		11,
		12
	}
}
pg.base = pg.base or {}
pg.base.vote_champion = {}

;(function()
	pg.base.vote_champion[1] = {
		ship_group = 10706,
		task = 31017,
		rank = 1,
		id = 1,
		group = 2017,
		story = "RENQIQIYE"
	}
	pg.base.vote_champion[2] = {
		ship_group = 20212,
		task = 31018,
		rank = 2,
		id = 2,
		group = 2017,
		story = "RENQIBEIERFASITE"
	}
	pg.base.vote_champion[3] = {
		ship_group = 30114,
		task = 31019,
		rank = 3,
		id = 3,
		group = 2017,
		story = "RENQIXILI"
	}
	pg.base.vote_champion[4] = {
		ship_group = 50201,
		task = 31042,
		rank = 1,
		id = 4,
		group = 2019,
		story = "RENQIYIXIAN"
	}
	pg.base.vote_champion[5] = {
		ship_group = 10117,
		task = 31043,
		rank = 2,
		id = 5,
		group = 2019,
		story = "RENQILAFEI"
	}
	pg.base.vote_champion[6] = {
		ship_group = 20603,
		task = 31044,
		rank = 3,
		id = 6,
		group = 2019,
		story = "RENQIDUJIAOSHOU"
	}
	pg.base.vote_champion[7] = {
		ship_group = 50204,
		task = 31045,
		rank = 1,
		id = 7,
		group = 2021,
		story = "RENQIYINGRUI"
	}
	pg.base.vote_champion[8] = {
		ship_group = 29903,
		task = 31046,
		rank = 2,
		id = 8,
		group = 2021,
		story = "RENQICHAIJUN"
	}
	pg.base.vote_champion[9] = {
		ship_group = 10517,
		task = 31047,
		rank = 3,
		id = 9,
		group = 2021,
		story = "RENQIXINZEXI"
	}
	pg.base.vote_champion[10] = {
		ship_group = 50601,
		task = 31048,
		rank = 1,
		id = 10,
		group = 2023,
		story = "RENQIZHENHAI"
	}
	pg.base.vote_champion[11] = {
		ship_group = 49905,
		task = 31049,
		rank = 2,
		id = 11,
		group = 2023,
		story = "RENQIAIJIER"
	}
	pg.base.vote_champion[12] = {
		ship_group = 30708,
		task = 31050,
		rank = 3,
		id = 12,
		group = 2023,
		story = "RENQIXINNONG"
	}
end)()
