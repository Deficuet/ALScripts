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

function var_0_0.createPicInfo(arg_4_0, arg_4_1)
	local var_4_0 = {
		type = arg_4_0,
		id = arg_4_1
	}

	if arg_4_0 == var_0_0.TYPE_GALLERY then
		var_4_0.path = GalleryConst.GetGalleryPicPathByID(arg_4_1)
	elseif arg_4_0 == var_0_0.TYPE_MANGA then
		var_4_0.path = MangaConst.GetMangaPicPathByID(arg_4_1)
	end

	return var_4_0
end

function var_0_0.getRandomLoadingPic()
	if not getProxy(LoadingPicProxy) then
		return nil
	end

	local var_5_0 = getProxy(LoadingPicProxy):getGalleryPicIDList()
	local var_5_1 = getProxy(LoadingPicProxy):getMangaPicIDList()
	local var_5_2 = AppreciatePicConst.filterExistGalleryPicIDList(var_5_0)
	local var_5_3 = AppreciatePicConst.filterExistMangaPicIDList(var_5_1)
	local var_5_4 = getProxy(LoadingPicProxy):getDiyModeOpenFlag()
	local var_5_5 = #var_5_2 + #var_5_3

	if not var_5_4 or var_5_5 == 0 then
		var_5_2 = var_0_0.getDefaultGalleryPicIDList()
		var_5_3 = {}
	end

	local var_5_6 = #var_5_2 + #var_5_3

	assert(var_5_6 > 0, "loading pic count should be greater than 0")

	local var_5_7
	local var_5_8 = math.random(1, var_5_6)

	if var_5_8 <= #var_5_2 then
		local var_5_9 = var_5_2[var_5_8]

		var_5_7 = var_0_0.createPicInfo(var_0_0.TYPE_GALLERY, var_5_9)
	else
		local var_5_10 = var_5_3[var_5_8 - #var_5_2]

		var_5_7 = var_0_0.createPicInfo(var_0_0.TYPE_MANGA, var_5_10)
	end

	return var_5_7
end

function var_0_0.checkDownloadMissingPic(arg_6_0)
	local var_6_0 = AppreciatePicConst.getDefaultGalleryPicIDList()
	local var_6_1 = {}
	local var_6_2 = {}

	if getProxy(LoadingPicProxy) then
		var_6_1 = getProxy(LoadingPicProxy):getGalleryPicIDList()
		var_6_2 = getProxy(LoadingPicProxy):getMangaPicIDList()
	end

	local var_6_3 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		local var_6_4 = GalleryConst.GetGalleryPicPathByID(iter_6_1)

		if var_6_4 then
			table.insert(var_6_3, var_6_4)
			table.insert(var_6_3, var_6_4 .. "_hx")
		end
	end

	for iter_6_2, iter_6_3 in ipairs(var_6_1) do
		local var_6_5 = GalleryConst.GetGalleryPicPathByID(iter_6_3)

		if var_6_5 then
			table.insert(var_6_3, var_6_5)
			table.insert(var_6_3, var_6_5 .. "_hx")
		end
	end

	for iter_6_4, iter_6_5 in ipairs(var_6_2) do
		local var_6_6 = MangaConst.GetMangaPicPathByID(iter_6_5)

		if var_6_6 then
			table.insert(var_6_3, var_6_6)
			table.insert(var_6_3, var_6_6 .. "_hx")
		end
	end

	if var_6_3 and #var_6_3 > 0 then
		local var_6_7 = {}

		var_6_7.isShowBox = false
		var_6_7.fileList = var_6_3
		var_6_7.finishFunc = arg_6_0

		function var_6_7.onNo()
			return
		end

		function var_6_7.onClose()
			return
		end

		DownloadConst.Download(var_6_7)
	elseif arg_6_0 then
		arg_6_0()
	end
end

function var_0_0.isUsedPicInfo(arg_9_0)
	local var_9_0 = false

	if arg_9_0.type == var_0_0.TYPE_GALLERY then
		var_9_0 = table.contains(getProxy(LoadingPicProxy):getGalleryPicIDList(true), arg_9_0.id)
	elseif arg_9_0.type == var_0_0.TYPE_MANGA then
		var_9_0 = table.contains(getProxy(LoadingPicProxy):getMangaPicIDList(true), arg_9_0.id)
	end

	return var_9_0
end

function var_0_0.isNewPicInfo(arg_10_0)
	local var_10_0 = var_0_0.getGalleryConfigNewIDList()
	local var_10_1 = var_0_0.getMangaConfigNewIDList()

	if arg_10_0.type == var_0_0.TYPE_GALLERY then
		if not table.contains(var_10_0, arg_10_0.id) then
			return false
		end
	elseif arg_10_0.type == var_0_0.TYPE_MANGA and not table.contains(var_10_1, arg_10_0.id) then
		return false
	end

	local var_10_2 = getProxy(LoadingPicProxy):getGalleryNewPicOpenList(true)
	local var_10_3 = getProxy(LoadingPicProxy):getMangaNewPicOpenList(true)

	if arg_10_0.type == var_0_0.TYPE_GALLERY then
		if table.contains(var_10_2, arg_10_0.id) then
			return false
		end
	elseif arg_10_0.type == var_0_0.TYPE_MANGA and table.contains(var_10_3, arg_10_0.id) then
		return false
	end

	return true
end

function var_0_0.isPicInfoLiked(arg_11_0)
	local var_11_0 = false

	if arg_11_0.type == var_0_0.TYPE_GALLERY then
		var_11_0 = GalleryConst.isGalleryLikeByID(arg_11_0.id)
	elseif arg_11_0.type == var_0_0.TYPE_MANGA then
		var_11_0 = MangaConst.isMangaLikeByID(arg_11_0.id)
	end

	return var_11_0
end

function var_0_0.getGalleryConfigNewIDList()
	local var_12_0 = pg.gameset.new_gallery_id_list.description

	if var_12_0 == nil or type(var_12_0) ~= "table" then
		var_12_0 = {}
	end

	return var_12_0
end

function var_0_0.getMangaConfigNewIDList()
	local var_13_0 = pg.gameset.new_manga_id_list.description

	if var_13_0 == nil or type(var_13_0) ~= "table" then
		var_13_0 = {}
	end

	return var_13_0
end

return var_0_0
