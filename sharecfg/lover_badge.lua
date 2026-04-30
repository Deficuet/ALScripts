pg = pg or {}
pg.lover_badge = rawget(pg, "lover_badge") or setmetatable({
	__name = "lover_badge"
}, confNEO)
pg.lover_badge.all = {
	1,
	2,
	3,
	4,
	5,
	6
}
pg.base = pg.base or {}
pg.base.lover_badge = {}

;(function()
	pg.base.lover_badge[1] = {
		level = 1,
		resource = "ABC"
	}
	pg.base.lover_badge[2] = {
		level = 2,
		resource = "ABC"
	}
	pg.base.lover_badge[3] = {
		level = 3,
		resource = "ABC"
	}
	pg.base.lover_badge[4] = {
		level = 4,
		resource = "ABC"
	}
	pg.base.lover_badge[5] = {
		level = 5,
		resource = "ABC"
	}
	pg.base.lover_badge[6] = {
		level = 6,
		resource = "ABC"
	}
end)()
