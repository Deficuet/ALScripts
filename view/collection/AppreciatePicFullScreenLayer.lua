local var_0_0 = class("AppreciatePicFullScreenLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AppreciatePicFullScreenUI"
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
	return
end

function var_0_0.initData(arg_6_0)
	arg_6_0.resLoader = AutoLoader.New()
	arg_6_0.curPicInfo = arg_6_0.contextData.curPicInfo
end

function var_0_0.addListener(arg_7_0)
	onButton(arg_7_0, arg_7_0.bg, function()
		arg_7_0:closeView()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.galleryPicImg, function()
		arg_7_0:closeView()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.mangaPicImg, function()
		arg_7_0:closeView()
	end, SFX_PANEL)
end

function var_0_0.updatePanel(arg_11_0)
	setActive(arg_11_0.galleryPanel, arg_11_0.curPicInfo.type == AppreciatePicConst.TYPE_GALLERY)
	setActive(arg_11_0.mangaPanel, arg_11_0.curPicInfo.type == AppreciatePicConst.TYPE_MANGA)

	if arg_11_0.curPicInfo.type == AppreciatePicConst.TYPE_GALLERY then
		arg_11_0:updateGalleryPanel()
	elseif arg_11_0.curPicInfo.type == AppreciatePicConst.TYPE_MANGA then
		arg_11_0:updateMangaPanel()
	end
end

function var_0_0.updateGalleryPanel(arg_12_0)
	arg_12_0:setImage(arg_12_0.galleryPicImg, arg_12_0.curPicInfo)
end

function var_0_0.updateMangaPanel(arg_13_0)
	arg_13_0:setImage(arg_13_0.mangaPicImg, arg_13_0.curPicInfo)
end

function var_0_0.setImage(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_2.path
	local var_14_1 = GetFileName(var_14_0)
	local var_14_2 = GetComponent(arg_14_1, typeof(Image)).sprite

	if not IsNil(var_14_2) then
		local var_14_3 = var_14_2.name

		if string.lower(var_14_3) ~= string.lower(var_14_1) then
			arg_14_0.resLoader:LoadSprite(var_14_0, var_14_1, arg_14_1, false)
		end
	else
		arg_14_0.resLoader:LoadSprite(var_14_0, var_14_1, arg_14_1, false)
	end
end

return var_0_0
