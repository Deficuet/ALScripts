local var_0_0 = class("MangaFullScreenLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "MangaViewUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:findUI()
	arg_2_0:initData()
	arg_2_0:addListener()
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
	arg_3_0:readManga()
	arg_3_0:updatePicImg()
	arg_3_0:updateLikeBtn()
end

function var_0_0.willExit(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)
	arg_4_0.resLoader:Clear()

	if arg_4_0.contextData.mangaContext then
		local var_4_0 = arg_4_0.mangaIDLIst[arg_4_0.curMangaIndex]

		arg_4_0.contextData.mangaContext:updateToMangaID(var_4_0)
	end
end

function var_0_0.onBackPressed(arg_5_0)
	if not arg_5_0.isShowing then
		arg_5_0:closeView()
	end
end

function var_0_0.findUI(arg_6_0)
	arg_6_0.bg = arg_6_0._tf:Find("BG")
	arg_6_0.picImg = arg_6_0._tf:Find("Manga/Pic")
	arg_6_0.indexText = arg_6_0._tf:Find("Manga/Index")
	arg_6_0.preBtn = arg_6_0._tf:Find("LeftBtn")
	arg_6_0.rightBtn = arg_6_0._tf:Find("RightBtn")
	arg_6_0.tipText = arg_6_0._tf:Find("Tip")
	arg_6_0.likeOnBtn = arg_6_0._tf:Find("Manga/LikeOn")
	arg_6_0.likeOffBtn = arg_6_0._tf:Find("Manga/LikeOff")

	setText(arg_6_0.tipText, i18n("world_collection_back"))
end

function var_0_0.initData(arg_7_0)
	arg_7_0.resLoader = AutoLoader.New()
	arg_7_0.curMangaIndex = arg_7_0.contextData.mangaIndex
	arg_7_0.mangaIDLIst = arg_7_0.contextData.mangaIDLIst
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.bg, function()
		if not arg_8_0.isShowing then
			arg_8_0:closeView()
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.preBtn, function()
		if arg_8_0.curMangaIndex > 1 then
			arg_8_0.curMangaIndex = arg_8_0.curMangaIndex - 1

			arg_8_0:readManga()
			arg_8_0:updatePicImg()
			arg_8_0:updateLikeBtn()
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.rightBtn, function()
		if arg_8_0.curMangaIndex < #arg_8_0.mangaIDLIst then
			arg_8_0.curMangaIndex = arg_8_0.curMangaIndex + 1

			arg_8_0:readManga()
			arg_8_0:updatePicImg()
			arg_8_0:updateLikeBtn()
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.likeOnBtn, function()
		local var_12_0 = arg_8_0.mangaIDLIst[arg_8_0.curMangaIndex]

		pg.m02:sendNotification(GAME.APPRECIATE_MANGA_LIKE, {
			mangaID = var_12_0,
			action = MangaConst.CANCEL_MANGA_LIKE
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.likeOffBtn, function()
		local var_13_0 = arg_8_0.mangaIDLIst[arg_8_0.curMangaIndex]

		pg.m02:sendNotification(GAME.APPRECIATE_MANGA_LIKE, {
			mangaID = var_13_0,
			action = MangaConst.SET_MANGA_LIKE
		})
	end, SFX_PANEL)
	addSlip(SLIP_TYPE_HRZ, arg_8_0.picImg, function()
		triggerButton(arg_8_0.preBtn)
	end, function()
		triggerButton(arg_8_0.rightBtn)
	end)
	addSlip(SLIP_TYPE_HRZ, arg_8_0.bg, function()
		triggerButton(arg_8_0.preBtn)
	end, function()
		triggerButton(arg_8_0.rightBtn)
	end)
end

function var_0_0.updatePicImg(arg_18_0)
	local var_18_0 = arg_18_0.mangaIDLIst[arg_18_0.curMangaIndex]
	local var_18_1 = pg.cartoon[var_18_0].resource
	local var_18_2 = MangaConst.MANGA_PATH_PREFIX .. var_18_1

	arg_18_0.resLoader:LoadSprite(var_18_2, var_18_1, arg_18_0.picImg, false)

	local var_18_3

	if arg_18_0.contextData.isShowingNotRead then
		var_18_3 = "#" .. pg.cartoon[var_18_0].cartoon_id
	else
		var_18_3 = "#" .. pg.cartoon[var_18_0].cartoon_id .. "/" .. #arg_18_0.mangaIDLIst
	end

	setText(arg_18_0.indexText, var_18_3)

	arg_18_0.isShowing = true

	arg_18_0:managedTween(LeanTween.value, nil, go(arg_18_0.picImg), 0, 1, 0.3):setOnUpdate(System.Action_float(function(arg_19_0)
		setImageAlpha(arg_18_0.picImg, arg_19_0)
	end)):setOnComplete(System.Action(function()
		arg_18_0.isShowing = false

		setImageAlpha(arg_18_0.picImg, 1)
	end))
	setActive(arg_18_0.preBtn, arg_18_0.curMangaIndex > 1)
	setActive(arg_18_0.rightBtn, arg_18_0.curMangaIndex < #arg_18_0.mangaIDLIst)
end

function var_0_0.updateLikeBtn(arg_21_0)
	local var_21_0 = arg_21_0.mangaIDLIst[arg_21_0.curMangaIndex]
	local var_21_1 = MangaConst.isMangaLikeByID(var_21_0)

	setActive(arg_21_0.likeOnBtn, var_21_1)
	setActive(arg_21_0.likeOffBtn, not var_21_1)
end

function var_0_0.readManga(arg_22_0)
	local var_22_0 = arg_22_0.mangaIDLIst[arg_22_0.curMangaIndex]

	if not MangaConst.isMangaEverReadByID(var_22_0) then
		pg.m02:sendNotification(GAME.APPRECIATE_MANGA_READ, {
			mangaID = var_22_0
		})
	end
end

return var_0_0
