local var_0_0 = class("AppreciatePicViewLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AppreciatePicViewUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:findUI()
	arg_2_0:initData()
	arg_2_0:addListener()
	arg_2_0:updatePanel()
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.willExit(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)
	arg_4_0.resLoader:Clear()
end

function var_0_0.findUI(arg_5_0)
	setText(arg_5_0.galleryPicSetLoadingTipText, i18n("loading_set_tip"))
	setText(arg_5_0.mangaPicSetLoadingTipText, i18n("loading_set_tip"))
end

function var_0_0.initData(arg_6_0)
	arg_6_0.resLoader = AutoLoader.New()
	arg_6_0.curPicInfo = arg_6_0.contextData.curPicInfo
	arg_6_0.picInfoList = arg_6_0.contextData.picInfoList
	arg_6_0.curIndex = arg_6_0:getPicInfoIndex(arg_6_0.curPicInfo)
	arg_6_0.loadingPicProxy = getProxy(LoadingPicProxy)

	arg_6_0:addOpenList()
end

function var_0_0.addListener(arg_7_0)
	onButton(arg_7_0, arg_7_0.bg, function()
		arg_7_0:closeView()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.galleryAddLoadingBtn, function()
		arg_7_0:addLoadingPic(arg_7_0.curPicInfo)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.galleryRemoveLoadingBtn, function()
		arg_7_0:removeLoadingPic(arg_7_0.curPicInfo)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.mangaAddLoadingBtn, function()
		arg_7_0:addLoadingPic(arg_7_0.curPicInfo)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.mangaRemoveLoadingBtn, function()
		arg_7_0:removeLoadingPic(arg_7_0.curPicInfo)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.galleryPicImg, function()
		arg_7_0:openFullScreenLayer()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.mangaPicImg, function()
		arg_7_0:openFullScreenLayer()
	end, SFX_PANEL)
	addSlip(SLIP_TYPE_HRZ, arg_7_0.galleryPicImg, function()
		arg_7_0:switchToPrePic()
	end, function()
		arg_7_0:switchToNextPic()
	end)
	addSlip(SLIP_TYPE_HRZ, arg_7_0.mangaPicImg, function()
		arg_7_0:switchToPrePic()
	end, function()
		arg_7_0:switchToNextPic()
	end)
	onButton(arg_7_0, arg_7_0.galleryLeftBtn, function()
		arg_7_0:switchToPrePic()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.galleryRightBtn, function()
		arg_7_0:switchToNextPic()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.mangaLeftBtn, function()
		arg_7_0:switchToPrePic()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.mangaRightBtn, function()
		arg_7_0:switchToNextPic()
	end, SFX_PANEL)
end

function var_0_0.updatePanel(arg_23_0)
	if arg_23_0.curPicInfo.type == AppreciatePicConst.TYPE_GALLERY then
		arg_23_0:updateGalleryPanel()
		arg_23_0:setImage(arg_23_0.galleryPicImg, arg_23_0.curPicInfo)
		setActive(arg_23_0.galleryPanel, true)
		setActive(arg_23_0.mangaPanel, false)
	else
		arg_23_0:updateMangaPanel()
		arg_23_0:setImage(arg_23_0.mangaPicImg, arg_23_0.curPicInfo)
		setActive(arg_23_0.galleryPanel, false)
		setActive(arg_23_0.mangaPanel, true)
	end
end

function var_0_0.updateGalleryPanel(arg_24_0)
	arg_24_0:setImage(arg_24_0.galleryPicBG, arg_24_0.curPicInfo)

	local var_24_0 = arg_24_0:isPicInfoUsed(arg_24_0.curPicInfo)

	setActive(arg_24_0.galleryAddLoadingBtn, not var_24_0)
	setActive(arg_24_0.galleryRemoveLoadingBtn, var_24_0)
end

function var_0_0.updateMangaPanel(arg_25_0)
	arg_25_0:setImage(arg_25_0.mangaPicBG, arg_25_0.curPicInfo)

	local var_25_0 = arg_25_0:isPicInfoUsed(arg_25_0.curPicInfo)

	setActive(arg_25_0.mangaAddLoadingBtn, not var_25_0)
	setActive(arg_25_0.mangaRemoveLoadingBtn, var_25_0)
end

function var_0_0.setImage(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_2.path
	local var_26_1 = GetFileName(var_26_0)
	local var_26_2 = GetComponent(arg_26_1, typeof(Image)).sprite

	if not IsNil(var_26_2) then
		local var_26_3 = var_26_2.name

		if string.lower(var_26_3) ~= string.lower(var_26_1) then
			arg_26_0.resLoader:LoadSprite(var_26_0, var_26_1, arg_26_1, false)
		end
	else
		arg_26_0.resLoader:LoadSprite(var_26_0, var_26_1, arg_26_1, false)
	end

	setImageAlpha(arg_26_1, 1)
end

function var_0_0.openFullScreenLayer(arg_27_0)
	LoadContextCommand.LoadLayerOnTopContext(Context.New({
		mediator = AppreciatePicFullScreenMediator,
		viewComponent = AppreciatePicFullScreenLayer,
		data = {
			curPicInfo = arg_27_0.curPicInfo
		}
	}))
end

function var_0_0.switchToPrePic(arg_28_0)
	if arg_28_0.curIndex > 1 then
		arg_28_0.curIndex = arg_28_0.curIndex - 1
		arg_28_0.curPicInfo = arg_28_0.picInfoList[arg_28_0.curIndex]

		arg_28_0:updatePanel()
	end
end

function var_0_0.switchToNextPic(arg_29_0)
	if arg_29_0.curIndex < #arg_29_0.picInfoList then
		arg_29_0.curIndex = arg_29_0.curIndex + 1
		arg_29_0.curPicInfo = arg_29_0.picInfoList[arg_29_0.curIndex]

		arg_29_0:updatePanel()
	end
end

function var_0_0.isPicInfoUsed(arg_30_0, arg_30_1)
	return AppreciatePicConst.isUsedPicInfo(arg_30_1)
end

function var_0_0.removeLoadingPic(arg_31_0, arg_31_1)
	local var_31_0 = {}

	if arg_31_1.type == AppreciatePicConst.TYPE_GALLERY then
		local var_31_1 = arg_31_0.loadingPicProxy:getGalleryPicIDList()

		for iter_31_0, iter_31_1 in ipairs(var_31_1) do
			if iter_31_1 == arg_31_1.id then
				table.remove(var_31_1, iter_31_0)

				break
			end
		end

		var_31_0.galleryPicIDList = var_31_1
	elseif arg_31_1.type == AppreciatePicConst.TYPE_MANGA then
		local var_31_2 = arg_31_0.loadingPicProxy:getMangaPicIDList()

		for iter_31_2, iter_31_3 in ipairs(var_31_2) do
			if iter_31_3 == arg_31_1.id then
				table.remove(var_31_2, iter_31_2)

				break
			end
		end

		var_31_0.mangaPicIDList = var_31_2
	end

	pg.m02:sendNotification(GAME.UPDATE_LOADING_PIC, var_31_0)
end

function var_0_0.addLoadingPic(arg_32_0, arg_32_1)
	if arg_32_0:isPicInfoUsed(arg_32_1) then
		warning("already used.", arg_32_1.type, arg_32_1.id)

		return
	end

	local var_32_0 = {}

	if arg_32_1.type == AppreciatePicConst.TYPE_GALLERY then
		local var_32_1 = arg_32_0.loadingPicProxy:getGalleryPicIDList()

		table.insert(var_32_1, arg_32_1.id)

		var_32_0.galleryPicIDList = var_32_1
	elseif arg_32_1.type == AppreciatePicConst.TYPE_MANGA then
		local var_32_2 = arg_32_0.loadingPicProxy:getMangaPicIDList()

		table.insert(var_32_2, arg_32_1.id)

		var_32_0.mangaPicIDList = var_32_2
	end

	pg.m02:sendNotification(GAME.UPDATE_LOADING_PIC, var_32_0)
end

function var_0_0.addOpenList(arg_33_0)
	if arg_33_0.curPicInfo.type == AppreciatePicConst.TYPE_GALLERY then
		getProxy(LoadingPicProxy):addGalleryNewPicOpenList(arg_33_0.curPicInfo.id)
	elseif arg_33_0.curPicInfo.type == AppreciatePicConst.TYPE_MANGA then
		getProxy(LoadingPicProxy):addMangaNewPicOpenList(arg_33_0.curPicInfo.id)
	end
end

function var_0_0.getPicInfoIndex(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0.picInfoList) do
		if iter_34_1.id == arg_34_1.id and iter_34_1.type == arg_34_1.type then
			return iter_34_0
		end
	end

	return nil
end

return var_0_0
