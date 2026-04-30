pg = pg or {}
pg.battle_attribute_range = rawget(pg, "battle_attribute_range") or setmetatable({
	__name = "battle_attribute_range"
}, confNEO)
pg.base = pg.base or {}
pg.base.battle_attribute_range = {}

;(function()
	pg.base.battle_attribute_range.DMG_TAG_EHC_N_99 = {
		attribute = "DMG_TAG_EHC_N_99",
		min = 0,
		max = 2000
	}
end)()
