AppreciatePicConst = {}

local var_0_0 = AppreciatePicConst

var_0_0.MAX_COUNT = 12
var_0_0.TYPE_GALLERY = 1
var_0_0.TYPE_MANGA = 2

function var_0_0.filterExistGalleryPicIDList(arg_1_0)
	local var_1_0 = {}

	if arg_1_0 and type(arg_1_0) == "table" then
		for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
			local var_1_1 = GalleryConst.GetGalleryPicPathByID(iter_1_1)

			if var_1_1 and checkABExist(var_1_1) then
				table.insert(var_1_0, iter_1_1)
			end
		end
	end

	return var_1_0
end

function var_0_0.filterExistMangaPicIDList(arg_2_0)
	local var_2_0 = {}

	if arg_2_0 and type(arg_2_0) == "table" then
		for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
			local var_2_1 = MangaConst.GetMangaPicPathByID(iter_2_1)

			if var_2_1 and checkABExist(var_2_1) then
				table.insert(var_2_0, iter_2_1)
			end
		end
	end

	return var_2_0
end

function var_0_0.getDefaultGalleryPicIDList()
	local var_3_0 = {
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1007,
		1008,
		1009,
		1010,
		1011,
		1012
	}
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		if pg.gallery_config[iter_3_1] then
			table.insert(var_3_1, iter_3_1)
		end
	end

	return var_3_1
end

function var_0_0.getOldLoadingPicIDList()
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in ipairs(pg.gallery_config.all) do
		if iter_4_1 > 1000 then
			table.insert(var_4_0, iter_4_1)
		end
	end

	return var_4_0
end

function var_0_0.createPicInfo(arg_5_0, arg_5_1)
	local var_5_0 = {
		type = arg_5_0,
		id = arg_5_1
	}

	if arg_5_0 == var_0_0.TYPE_GALLERY then
		var_5_0.path = GalleryConst.GetGalleryPicPathByID(arg_5_1)
	elseif arg_5_0 == var_0_0.TYPE_MANGA then
		var_5_0.path = MangaConst.GetMangaPicPathByID(arg_5_1)
	end

	return var_5_0
end

function var_0_0.getRandomLoadingPic()
	if not getProxy(LoadingPicProxy) then
		return nil
	end

	local var_6_0 = getProxy(LoadingPicProxy):getGalleryPicIDList()
	local var_6_1 = getProxy(LoadingPicProxy):getMangaPicIDList()
	local var_6_2 = AppreciatePicConst.filterExistGalleryPicIDList(var_6_0)
	local var_6_3 = AppreciatePicConst.filterExistMangaPicIDList(var_6_1)
	local var_6_4 = getProxy(LoadingPicProxy):getDiyModeOpenFlag()
	local var_6_5 = #var_6_2 + #var_6_3

	if not var_6_4 or var_6_5 == 0 then
		var_6_2 = var_0_0.getDefaultGalleryPicIDList()
		var_6_3 = {}
	end

	local var_6_6 = #var_6_2 + #var_6_3

	assert(var_6_6 > 0, "loading pic count should be greater than 0")

	local var_6_7
	local var_6_8 = math.random(1, var_6_6)

	if var_6_8 <= #var_6_2 then
		local var_6_9 = var_6_2[var_6_8]

		var_6_7 = var_0_0.createPicInfo(var_0_0.TYPE_GALLERY, var_6_9)
	else
		local var_6_10 = var_6_3[var_6_8 - #var_6_2]

		var_6_7 = var_0_0.createPicInfo(var_0_0.TYPE_MANGA, var_6_10)
	end

	return var_6_7
end

function var_0_0.checkDownloadMissingPic(arg_7_0)
	local var_7_0 = AppreciatePicConst.getDefaultGalleryPicIDList()
	local var_7_1 = {}
	local var_7_2 = {}

	if getProxy(LoadingPicProxy) then
		var_7_1 = getProxy(LoadingPicProxy):getGalleryPicIDList()
		var_7_2 = getProxy(LoadingPicProxy):getMangaPicIDList()
	end

	local var_7_3 = {}

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_4 = GalleryConst.GetGalleryPicPathByID(iter_7_1)

		if var_7_4 then
			table.insert(var_7_3, var_7_4)
			table.insert(var_7_3, var_7_4 .. "_hx")
		end
	end

	for iter_7_2, iter_7_3 in ipairs(var_7_1) do
		local var_7_5 = GalleryConst.GetGalleryPicPathByID(iter_7_3)

		if var_7_5 then
			table.insert(var_7_3, var_7_5)
			table.insert(var_7_3, var_7_5 .. "_hx")
		end
	end

	for iter_7_4, iter_7_5 in ipairs(var_7_2) do
		local var_7_6 = MangaConst.GetMangaPicPathByID(iter_7_5)

		if var_7_6 then
			table.insert(var_7_3, var_7_6)
			table.insert(var_7_3, var_7_6 .. "_hx")
		end
	end

	if var_7_3 and #var_7_3 > 0 then
		local var_7_7 = {}

		var_7_7.isShowBox = false
		var_7_7.fileList = var_7_3
		var_7_7.finishFunc = arg_7_0

		function var_7_7.onNo()
			return
		end

		function var_7_7.onClose()
			return
		end

		DownloadConst.Download(var_7_7)
	elseif arg_7_0 then
		arg_7_0()
	end
end

function var_0_0.isUsedPicInfo(arg_10_0)
	local var_10_0 = false

	if arg_10_0.type == var_0_0.TYPE_GALLERY then
		var_10_0 = table.contains(getProxy(LoadingPicProxy):getGalleryPicIDList(true), arg_10_0.id)
	elseif arg_10_0.type == var_0_0.TYPE_MANGA then
		var_10_0 = table.contains(getProxy(LoadingPicProxy):getMangaPicIDList(true), arg_10_0.id)
	end

	return var_10_0
end

function var_0_0.isNewPicInfo(arg_11_0)
	local var_11_0 = var_0_0.getGalleryConfigNewIDList()
	local var_11_1 = var_0_0.getMangaConfigNewIDList()

	if arg_11_0.type == var_0_0.TYPE_GALLERY then
		if not table.contains(var_11_0, arg_11_0.id) then
			return false
		end
	elseif arg_11_0.type == var_0_0.TYPE_MANGA and not table.contains(var_11_1, arg_11_0.id) then
		return false
	end

	local var_11_2 = getProxy(LoadingPicProxy):getGalleryNewPicOpenList(true)
	local var_11_3 = getProxy(LoadingPicProxy):getMangaNewPicOpenList(true)

	if arg_11_0.type == var_0_0.TYPE_GALLERY then
		if table.contains(var_11_2, arg_11_0.id) then
			return false
		end
	elseif arg_11_0.type == var_0_0.TYPE_MANGA and table.contains(var_11_3, arg_11_0.id) then
		return false
	end

	return true
end

function var_0_0.isPicInfoLiked(arg_12_0)
	local var_12_0 = false

	if arg_12_0.type == var_0_0.TYPE_GALLERY then
		var_12_0 = GalleryConst.isGalleryLikeByID(arg_12_0.id)
	elseif arg_12_0.type == var_0_0.TYPE_MANGA then
		var_12_0 = MangaConst.isMangaLikeByID(arg_12_0.id)
	end

	return var_12_0
end

function var_0_0.getGalleryConfigNewIDList()
	local var_13_0 = pg.gameset.new_gallery_id_list.description

	if var_13_0 == nil or type(var_13_0) ~= "table" then
		var_13_0 = {}
	end

	return var_13_0
end

function var_0_0.getMangaConfigNewIDList()
	local var_14_0 = pg.gameset.new_manga_id_list.description

	if var_14_0 == nil or type(var_14_0) ~= "table" then
		var_14_0 = {}
	end

	return var_14_0
end

return var_0_0
