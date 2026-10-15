return {
	GetMaxFormationSuggestionID = function()
		return getProxy(ChapterProxy):getLastUnlockMap().id
	end,
	GetSuggestionMapIDList = function(arg_2_0)
		local var_2_0 = pg.expedition_data_by_map[arg_2_0].type
		local var_2_1 = pg.expedition_data_by_map.get_id_list_by_type[var_2_0]
		local var_2_2 = getProxy(ChapterProxy)
		local var_2_3 = {}

		for iter_2_0, iter_2_1 in ipairs(var_2_1) do
			if var_2_2:getMapById(iter_2_1):isUnlock() and pg.chapter_suggestion_formation.get_id_list_by_chapter[iter_2_1] then
				table.insert(var_2_3, iter_2_1)
			end
		end

		return var_2_3
	end,
	HasUnlockSuggestionMap = function()
		local var_3_0 = getProxy(ChapterProxy)

		for iter_3_0, iter_3_1 in ipairs(pg.expedition_data_by_map.get_id_list_by_type[1]) do
			if var_3_0:getMapById(iter_3_1):isUnlock() and pg.chapter_suggestion_formation.get_id_list_by_chapter[iter_3_1] then
				return true
			end
		end

		return false
	end,
	HasUnlockSuggestionHardMap = function()
		local var_4_0 = getProxy(ChapterProxy)

		for iter_4_0, iter_4_1 in ipairs(pg.expedition_data_by_map.get_id_list_by_type[2]) do
			if var_4_0:getMapById(iter_4_1):isUnlock() and pg.chapter_suggestion_formation.get_id_list_by_chapter[iter_4_1] then
				return true
			end
		end
	end
}
