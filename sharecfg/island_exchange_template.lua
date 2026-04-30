pg = pg or {}
pg.island_exchange_template = rawget(pg, "island_exchange_template") or setmetatable({
	__name = "island_exchange_template"
}, confNEO)
pg.island_exchange_template.all = {
	101,
	102,
	103,
	104,
	201,
	202,
	203,
	204,
	205,
	206
}
pg.island_exchange_template.get_id_list_by_group = {
	{
		101,
		102,
		103,
		104
	},
	{
		201,
		202,
		203,
		204,
		205,
		206
	}
}
pg.base = pg.base or {}
pg.base.island_exchange_template = {}

;(function()
	pg.base.island_exchange_template[101] = {
		id = 101,
		target_item = 2521,
		group = 1,
		target_num = 4,
		origin_item = 5002
	}
	pg.base.island_exchange_template[102] = {
		id = 102,
		target_item = 2521,
		group = 1,
		target_num = 3,
		origin_item = 5003
	}
	pg.base.island_exchange_template[103] = {
		id = 103,
		target_item = 2521,
		group = 1,
		target_num = 2,
		origin_item = 5004
	}
	pg.base.island_exchange_template[104] = {
		id = 104,
		target_item = 2521,
		group = 1,
		target_num = 3,
		origin_item = 5007
	}
	pg.base.island_exchange_template[201] = {
		id = 201,
		target_item = 2522,
		group = 2,
		target_num = 3,
		origin_item = 5102
	}
	pg.base.island_exchange_template[202] = {
		id = 202,
		target_item = 2522,
		group = 2,
		target_num = 12,
		origin_item = 5103
	}
	pg.base.island_exchange_template[203] = {
		id = 203,
		target_item = 2522,
		group = 2,
		target_num = 5,
		origin_item = 5104
	}
	pg.base.island_exchange_template[204] = {
		id = 204,
		target_item = 2522,
		group = 2,
		target_num = 1,
		origin_item = 5105
	}
	pg.base.island_exchange_template[205] = {
		id = 205,
		target_item = 2522,
		group = 2,
		target_num = 2,
		origin_item = 5106
	}
	pg.base.island_exchange_template[206] = {
		id = 206,
		target_item = 2522,
		group = 2,
		target_num = 18,
		origin_item = 5107
	}
end)()
