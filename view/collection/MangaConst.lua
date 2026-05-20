MangaConst = {}

local var_0_0 = MangaConst

var_0_0.Version = 0
var_0_0.NewCount = 0

function var_0_0.setVersionAndNewCount()
	local var_1_0 = #pg.cartoon.all
	local var_1_1 = pg.cartoon.all[var_1_0]

	var_0_0.Version = pg.cartoon[var_1_1].mark

	local var_1_2 = 0

	for iter_1_0 = var_1_0, 1, -1 do
		local var_1_3 = pg.cartoon.all[iter_1_0]
		local var_1_4 = pg.cartoon[var_1_3].mark

		if var_1_4 == var_0_0.Version then
			var_1_2 = var_1_2 + 1
		elseif var_1_4 < var_0_0.Version then
			break
		end
	end

	var_0_0.NewCount = var_1_2
end

var_0_0.MANGA_PATH_PREFIX = "mangapic/"
var_0_0.SET_MANGA_LIKE = 0
var_0_0.CANCEL_MANGA_LIKE = 1

function var_0_0.isMangaEverReadByID(arg_2_0)
	local var_2_0 = getProxy(AppreciateProxy):getMangaReadIDList()

	return table.contains(var_2_0, arg_2_0)
end

function var_0_0.isMangaNewByID(arg_3_0)
	local var_3_0 = pg.cartoon[arg_3_0]

	assert(var_3_0, "Manga info is null, ID:" .. tostring(arg_3_0))

	return var_3_0.mark >= var_0_0.Version
end

function var_0_0.isMangaLikeByID(arg_4_0)
	local var_4_0 = getProxy(AppreciateProxy):getMangaLikeIDList()

	return table.contains(var_4_0, arg_4_0)
end

function var_0_0.GetMangaPicPathByID(arg_5_0)
	local var_5_0 = pg.cartoon[arg_5_0]

	if not var_5_0 then
		return nil
	end

	local var_5_1 = var_5_0.resource

	return var_0_0.MANGA_PATH_PREFIX .. var_5_1
end

return var_0_0
