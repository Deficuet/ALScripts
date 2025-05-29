local var_0_0 = class("MusicCollectionView", import("..base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "MusicCollectionUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
	arg_2_0:initPlateListPanel()
	arg_2_0:Show()
	arg_2_0:recoverRunData()
	arg_2_0:tryShowTipMsgBox()
end

function var_0_0.OnDestroy(arg_3_0)
	arg_3_0.bgmMgr:UnregisterMusicCallback(arg_3_0.__cname)
	arg_3_0.resLoader:Clear()
	arg_3_0:closeAlbumListPanel(true)
end

function var_0_0.onBackPressed(arg_4_0)
	if isActive(arg_4_0.albumListPanel) then
		arg_4_0:closeAlbumListPanel()

		return false
	else
		return true
	end
end

function var_0_0.initData(arg_5_0)
	arg_5_0.bgmMgr = pg.BgmMgr.GetInstance()
	arg_5_0.appreciateProxy = getProxy(AppreciateProxy)
	arg_5_0.albumNames = underscore.keys(pg.music_collect_config.get_id_list_by_album_name)

	table.sort(arg_5_0.albumNames, CompareFuncs({
		function(arg_6_0)
			return pg.music_collect_config.get_id_list_by_album_name[arg_6_0][1]
		end
	}))

	arg_5_0.plateTFList = {}
	arg_5_0.albumTFList = {}
	arg_5_0.likeDic = {}
	arg_5_0.likeIds = {}
	arg_5_0.curMidddleIndex = 1
	arg_5_0.isPlayingAni = false
	arg_5_0.resLoader = AutoLoader.New()
end

function var_0_0.saveRunData(arg_7_0)
	arg_7_0.appreciateProxy:updateMusicRunData(arg_7_0.sortValue, arg_7_0.curMidddleIndex, arg_7_0.likeValue)
end

function var_0_0.recoverRunData(arg_8_0)
	local var_8_0 = arg_8_0.appreciateProxy:getMusicRunData()

	arg_8_0.sortValue = var_8_0.sortValue
	arg_8_0.curMidddleIndex = var_8_0.middleIndex
	arg_8_0.likeValue = var_8_0.likeValue
	arg_8_0.albumSortValue = "asc"
	arg_8_0.likeIds = arg_8_0.appreciateProxy:getAlbumMusicList("favor")

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.likeIds) do
		arg_8_0.likeDic[iter_8_1] = true
	end

	arg_8_0.lScrollPageSC.MiddleIndexOnInit = arg_8_0.curMidddleIndex - 1

	arg_8_0:updatePlateListPanel()

	if getProxy(AppreciateProxy):CanPlayMainMusicPlayer() then
		arg_8_0:NewMusicPlayer(arg_8_0.appreciateProxy:getMainPlayerAlbumName())
	else
		arg_8_0:NewMusicPlayer(arg_8_0.tempPlateList[arg_8_0.curMidddleIndex])
	end

	arg_8_0.bgmMgr:RegisterMusicCallback(arg_8_0.__cname, "TempMusicPlayer", {
		startCall = function(arg_9_0)
			if arg_8_0.plateTFList[arg_8_0.curMidddleIndex] then
				arg_8_0:updatePlateList(arg_8_0.plateTFList[arg_8_0.curMidddleIndex], arg_8_0.curMidddleIndex)
			end

			arg_8_0:updateAlbumListPanel()
			arg_8_0:updatePlayPanel(arg_9_0)
		end,
		progressCall = function(arg_10_0)
			if arg_8_0.onDrag then
				return
			end

			arg_8_0:updatePlayProgress(arg_10_0)
		end,
		noPlayCall = function()
			arg_8_0:NewMusicPlayer(arg_8_0.tempPlateList[arg_8_0.curMidddleIndex])
		end
	})
	arg_8_0:updateAlbumListPanel()
	arg_8_0:updateLikeToggle()
	arg_8_0:updatePlayType()
end

function var_0_0.findUI(arg_12_0)
	setLocalPosition(arg_12_0._tf, Vector2.zero)

	arg_12_0._tf.anchorMin = Vector2.zero
	arg_12_0._tf.anchorMax = Vector2.one
	arg_12_0._tf.offsetMax = Vector2.zero
	arg_12_0._tf.offsetMin = Vector2.zero
	arg_12_0.topPanel = arg_12_0:findTF("TopPanel")
	arg_12_0.likeFilteToggle = arg_12_0:findTF("LikeBtn", arg_12_0.topPanel)

	setActive(arg_12_0.likeFilteToggle, true)

	arg_12_0.serchInputText = arg_12_0.topPanel:Find("serch")

	setText(arg_12_0.serchInputText:Find("Placeholder"), i18n("NewMusic_2"))

	arg_12_0.plateListPanel = arg_12_0:findTF("PlateList")
	arg_12_0.plateTpl = arg_12_0:findTF("Plate", arg_12_0.plateListPanel)

	setActive(arg_12_0.plateTpl, false)
	setText(arg_12_0.plateTpl:Find("list/panel/view/empty/icon/Text"), i18n("NewMusic_3"))

	arg_12_0.lScrollPageSC = GetComponent(arg_12_0.plateListPanel, "LScrollPage")
	arg_12_0.playPanel = arg_12_0:findTF("PLayPanel")
	arg_12_0.playPanelNameText = arg_12_0:findTF("NameText", arg_12_0.playPanel)
	arg_12_0.likeToggle = arg_12_0:findTF("LikeBtn", arg_12_0.playPanel)
	arg_12_0.likeOnImg = arg_12_0:findTF("On", arg_12_0.likeToggle)
	arg_12_0.songImg = arg_12_0:findTF("SongImg/face", arg_12_0.playPanel)
	arg_12_0.pauseBtn = arg_12_0:findTF("PlayingBtn", arg_12_0.playPanel)
	arg_12_0.playBtn = arg_12_0:findTF("StopingBtn", arg_12_0.playPanel)
	arg_12_0.playDesc = arg_12_0.playPanel:Find("PlayDesc")
	arg_12_0.nextBtn = arg_12_0:findTF("NextBtn", arg_12_0.playPanel)
	arg_12_0.preBtn = arg_12_0:findTF("PreBtn", arg_12_0.playPanel)
	arg_12_0.playProgressBar = arg_12_0:findTF("Progress", arg_12_0.playPanel)
	arg_12_0.nowTimeText = arg_12_0:findTF("NowTimeText", arg_12_0.playProgressBar)
	arg_12_0.totalTimeText = arg_12_0:findTF("TotalTimeText", arg_12_0.playProgressBar)
	arg_12_0.playSliderSC = GetComponent(arg_12_0.playProgressBar, "LSlider")
	arg_12_0.listBtn = arg_12_0:findTF("ListBtn", arg_12_0.playPanel)

	setActive(arg_12_0.listBtn:Find("on"), false)
	setActive(arg_12_0.listBtn:Find("off"), true)

	arg_12_0.albumListPanel = arg_12_0._tf:Find("AlbumListPanel")
	arg_12_0.closeBtn = arg_12_0.albumListPanel:Find("BG")
	arg_12_0.panel = arg_12_0.albumListPanel:Find("Panel")

	setText(arg_12_0.panel:Find("top/name"), i18n("NewMusic_6"))

	arg_12_0.albumToggle = arg_12_0.panel:Find("bottom/sort_btn")
	arg_12_0.albumInputText = arg_12_0.panel:Find("bottom/serch")

	setText(arg_12_0.albumInputText:Find("Placeholder"), i18n("NewMusic_2"))

	arg_12_0.albumContainer = arg_12_0.panel:Find("middle/Content")
	arg_12_0.albumItemList = UIItemList.New(arg_12_0.albumContainer, arg_12_0.albumContainer:GetChild(0))

	arg_12_0.albumItemList:make(function(arg_13_0, arg_13_1, arg_13_2)
		arg_13_1 = arg_13_1 + 1

		if arg_13_0 == UIItemList.EventUpdate then
			arg_12_0.albumTFList[arg_13_1] = arg_13_2

			arg_12_0:updateAlbumTF(arg_13_2, arg_13_1)
		end
	end)

	arg_12_0.likeFilteOnImg = arg_12_0.likeFilteToggle:Find("TextLike/On")
	arg_12_0.playLoopBtn = arg_12_0.playPanel:Find("PlayTypeBtn")
end

function var_0_0.addListener(arg_14_0)
	onButton(arg_14_0, arg_14_0.listBtn, function()
		arg_14_0:openAlbumListPanel()
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.closeBtn, function()
		arg_14_0:closeAlbumListPanel()
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.albumToggle, function()
		if arg_14_0.albumSortValue == "asc" then
			arg_14_0.albumSortValue = "desc"
		elseif arg_14_0.albumSortValue == "desc" then
			arg_14_0.albumSortValue = "asc"
		end

		arg_14_0:updateAlbumListPanel()
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.likeFilteToggle, function()
		arg_14_0.likeValue = 1 - arg_14_0.likeValue
		arg_14_0.curMidddleIndex = 1

		arg_14_0:saveRunData()
		arg_14_0:updateLikeToggle()
		arg_14_0:updatePlateListPanel()
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.playBtn, function()
		if not arg_14_0.musicPlayer then
			return
		end

		arg_14_0.musicPlayer:Resume()
		SetActive(arg_14_0.pauseBtn, true)
		SetActive(arg_14_0.playBtn, false)
		setActive(arg_14_0.playDesc, true)
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.pauseBtn, function()
		if not arg_14_0.musicPlayer then
			return
		end

		arg_14_0.musicPlayer:Pause()
		SetActive(arg_14_0.pauseBtn, false)
		SetActive(arg_14_0.playBtn, true)
		setActive(arg_14_0.playDesc, false)
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.preBtn, function()
		if not arg_14_0.musicPlayer then
			return
		end

		if arg_14_0.isPlayingAni then
			return
		end

		arg_14_0.musicPlayer:Last()
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.nextBtn, function()
		if not arg_14_0.musicPlayer then
			return
		end

		if arg_14_0.isPlayingAni then
			return
		end

		arg_14_0.musicPlayer:Next()
	end, SFX_PANEL)
	onButton(arg_14_0, arg_14_0.likeToggle, function()
		local var_23_0 = arg_14_0.musicPlayer:GetCurrentMusicId()
		local var_23_1 = pg.music_collect_config[var_23_0].id

		pg.m02:sendNotification(GAME.APPRECIATE_MUSIC_LIKE, {
			musicID = var_23_1,
			isAdd = arg_14_0.likeDic[var_23_1] and 1 or 0
		})
		arg_14_0:ChangeLike(var_23_1)
		arg_14_0:updateLikeToggle()
		setActive(arg_14_0.likeOnImg, arg_14_0.likeDic[var_23_1])
		arg_14_0:updatePlateList(arg_14_0.plateTFList[arg_14_0.curMidddleIndex], arg_14_0.curMidddleIndex)
	end, SFX_PANEL)

	local var_14_0

	arg_14_0.playSliderSC:AddPointDownFunc(function(arg_24_0)
		if arg_14_0.onDrag then
			return
		end

		arg_14_0.onDrag = true
		var_14_0 = arg_14_0.musicPlayer:IsPaused()

		if not var_14_0 then
			arg_14_0.musicPlayer:Pause()
		end
	end)
	arg_14_0.playSliderSC:AddPointUpFunc(function(arg_25_0)
		if not arg_14_0.onDrag then
			return
		end

		arg_14_0.onDrag = false

		arg_14_0.musicPlayer:SetProgress(arg_14_0.playSliderSC.value)

		if not var_14_0 then
			arg_14_0.musicPlayer:Resume()
		end
	end)
	onButton(arg_14_0, arg_14_0.playLoopBtn, function()
		local var_26_0 = getProxy(AppreciateProxy):getMusicPlayerLoopType()

		switch(var_26_0, {
			list = function()
				var_26_0 = "random"
			end,
			random = function()
				var_26_0 = "one"
			end,
			one = function()
				var_26_0 = "list"
			end
		})
		pg.m02:sendNotification(GAME.APPRECIATE_CHANGE_MUSIC_PLAY_LOOP_TYPE, {
			loopType = var_26_0
		})
		arg_14_0:updatePlayType(var_26_0)

		if arg_14_0.musicPlayer then
			arg_14_0.musicPlayer.loopType = var_26_0
		end
	end, SFX_PANEL)
	onInputChanged(arg_14_0, arg_14_0.serchInputText, function(arg_30_0)
		if arg_14_0.likeValue ~= MusicCollectionConst.Filte_Like_Value then
			return
		end

		arg_14_0:updatePlateList(arg_14_0.plateTFList[arg_14_0.curMidddleIndex], arg_14_0.curMidddleIndex)
	end)
	onInputChanged(arg_14_0, arg_14_0.albumInputText, function(arg_31_0)
		arg_14_0:updateAlbumListPanel()
	end)
end

function var_0_0.tryShowTipMsgBox(arg_32_0)
	if arg_32_0.appreciateProxy:isMusicHaveNewRes() then
		local function var_32_0()
			arg_32_0.lScrollPageSC:MoveToItemID(MusicCollectionConst.AutoScrollIndex - 1)
			PlayerPrefs.SetInt("musicVersion", MusicCollectionConst.Version)
			arg_32_0:emit(CollectionScene.UPDATE_RED_POINT)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideClose = true,
			hideNo = true,
			content = i18n("res_music_new_tip", MusicCollectionConst.NewCount),
			onYes = var_32_0,
			onCancel = var_32_0,
			onClose = var_32_0
		})
	end
end

function var_0_0.initPlateListPanel(arg_34_0)
	function arg_34_0.lScrollPageSC.itemInitedCallback(arg_35_0, arg_35_1)
		local var_35_0 = arg_35_0 + 1

		arg_34_0.plateTFList[var_35_0] = arg_35_1

		arg_35_1:GetComponent("DftAniEvent"):SetEndEvent(function()
			local var_36_0 = arg_34_0.animCallback

			arg_34_0.animCallback = nil

			existCall(var_36_0)
		end)
		arg_34_0:updatePlateTF(arg_35_1, var_35_0)
	end

	function arg_34_0.lScrollPageSC.itemClickCallback(arg_37_0, arg_37_1)
		local var_37_0 = arg_37_0 + 1

		if arg_34_0.curMidddleIndex ~= var_37_0 and not arg_34_0.isPlayingAni then
			arg_34_0:setAniState(true)
			arg_34_0:closePlateAni(arg_34_0.plateTFList[arg_34_0.curMidddleIndex])
			arg_34_0.lScrollPageSC:MoveToItemID(arg_37_0)
		end
	end

	function arg_34_0.lScrollPageSC.itemPitchCallback(arg_38_0, arg_38_1)
		local var_38_0 = arg_38_0 + 1

		arg_34_0.curMidddleIndex = var_38_0

		arg_34_0:saveRunData()
		arg_34_0:updatePlateList(arg_38_1, var_38_0)
		arg_34_0:playPlateAni(arg_38_1, true)
	end

	function arg_34_0.lScrollPageSC.itemRecycleCallback(arg_39_0, arg_39_1)
		arg_34_0.plateTFList[arg_39_0 + 1] = nil
	end

	addSlip(SLIP_TYPE_HRZ, arg_34_0.plateListPanel, function()
		if arg_34_0.curMidddleIndex > 1 and not arg_34_0.isPlayingAni then
			arg_34_0:setAniState(true)
			arg_34_0.lScrollPageSC:MoveToItemID(arg_34_0.curMidddleIndex - 1 - 1)
			arg_34_0:closePlateAni(arg_34_0.plateTFList[arg_34_0.curMidddleIndex])
		end
	end, function()
		if arg_34_0.curMidddleIndex < arg_34_0.lScrollPageSC.DataCount and not arg_34_0.isPlayingAni then
			arg_34_0:setAniState(true)
			arg_34_0.lScrollPageSC:MoveToItemID(arg_34_0.curMidddleIndex + 1 - 1)
			arg_34_0:closePlateAni(arg_34_0.plateTFList[arg_34_0.curMidddleIndex])
		end
	end)
end

function var_0_0.updatePlateListPanel(arg_42_0)
	local var_42_0 = arg_42_0.likeValue == MusicCollectionConst.Filte_Like_Value

	if var_42_0 then
		arg_42_0.tempPlateList = {
			"favor"
		}
	else
		arg_42_0.tempPlateList = arg_42_0.albumNames
	end

	setActive(arg_42_0.serchInputText, var_42_0)
	setActive(arg_42_0.listBtn, not var_42_0)

	arg_42_0.lScrollPageSC.DataCount = #arg_42_0.tempPlateList

	arg_42_0.lScrollPageSC:Init(arg_42_0.curMidddleIndex - 1)
end

function var_0_0.updatePlateTF(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_0.likeValue == MusicCollectionConst.Filte_Like_Value
	local var_43_1 = arg_43_0.tempPlateList[arg_43_2]
	local var_43_2 = var_43_0 and arg_43_0.likeIds or arg_43_0.appreciateProxy:getAlbumMusicList(var_43_1)
	local var_43_3

	if var_43_0 then
		if #var_43_2 > 0 then
			var_43_3 = pg.music_collect_config[var_43_2[#var_43_2]].cover
		end
	else
		var_43_3 = pg.music_collect_config[var_43_2[1]].cover
	end

	setText(arg_43_1:Find("PlateImg/empty/Text"), i18n("NewMusic_7"))
	setActive(arg_43_1:Find("PlateImg/face"), var_43_3)
	setActive(arg_43_1:Find("PlateImg/empty"), not var_43_3)

	if var_43_3 then
		local var_43_4 = MusicCollectionConst.MUSIC_COVER_PATH_PREFIX .. var_43_3

		arg_43_0.resLoader:LoadSprite(var_43_4, var_43_3, arg_43_1:Find("PlateImg/face"), false)
	end

	if arg_43_2 == arg_43_0.curMidddleIndex then
		arg_43_0:updatePlateList(arg_43_1, arg_43_2)
	end
end

function var_0_0.updatePlateList(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_0.likeValue == MusicCollectionConst.Filte_Like_Value
	local var_44_1 = arg_44_0.tempPlateList[arg_44_2]
	local var_44_2 = var_44_0 and arg_44_0.likeIds or arg_44_0.appreciateProxy:getAlbumMusicList(var_44_1)
	local var_44_3 = arg_44_1:Find("list")

	setText(var_44_3:Find("album_name"), var_44_1 == "favor" and i18n("NewMusic_5") or var_44_1)

	local var_44_4 = arg_44_0.appreciateProxy:getMainPlayerAlbumName() == var_44_1
	local var_44_5 = var_44_3:Find("btn_home")

	setActive(var_44_5:Find("off"), not var_44_4)
	setActive(var_44_5:Find("on"), var_44_4)
	onButton(arg_44_0, var_44_5, function()
		if arg_44_0.appreciateProxy:getMainPlayerAlbumName() == var_44_1 then
			pg.m02:sendNotification(GAME.APPRECIATE_CHANGE_MAIN_PLAY_ALBUM, {
				albumName = "none"
			})
			setActive(var_44_5:Find("off"), true)
			setActive(var_44_5:Find("on"), false)
		else
			pg.m02:sendNotification(GAME.APPRECIATE_CHANGE_MAIN_PLAY_ALBUM, {
				albumName = var_44_1
			})
			setActive(var_44_5:Find("off"), false)
			setActive(var_44_5:Find("on"), true)
		end

		arg_44_0:updateAlbumListPanel()
	end, SFX_CONFIRM)

	local var_44_6 = var_44_3:Find("panel/view/container")

	local function var_44_7(arg_46_0)
		local var_46_0

		if not var_44_0 or arg_44_0.sortValue == MusicCollectionConst.Sort_Order_Down then
			var_46_0 = underscore.to_array(var_44_2)
		elseif arg_44_0.sortValue == MusicCollectionConst.Sort_Order_Up then
			var_46_0 = underscore.reverse(var_44_2)
		else
			assert(false)
		end

		local var_46_1 = string.lower(getInputText(arg_44_0.serchInputText))
		local var_46_2 = var_44_0 and underscore.filter(var_46_0, function(arg_47_0)
			local var_47_0 = pg.music_collect_config[arg_47_0].name

			return not var_46_1 or var_46_1 == "" or string.find(string.lower(var_47_0), var_46_1)
		end) or underscore.to_array(var_46_0)

		UIItemList.StaticAlign(var_44_6, var_44_6:GetChild(0), #var_46_2, function(arg_48_0, arg_48_1, arg_48_2)
			arg_48_1 = arg_48_1 + 1

			if arg_48_0 == UIItemList.EventUpdate then
				local var_48_0 = pg.music_collect_config[var_46_2[arg_48_1]]

				if var_44_0 and arg_44_0.sortValue == MusicCollectionConst.Sort_Order_Up then
					setText(arg_48_2:Find("mark/Text"), string.format("%02d", #var_46_2 - arg_48_1 + 1))
				else
					setText(arg_48_2:Find("mark/Text"), string.format("%02d", arg_48_1))
				end

				changeToScrollText(arg_48_2:Find("name"), var_48_0.name)
				setText(arg_48_2:Find("time"), arg_44_0:descTime(var_48_0.music_time))
				setActive(arg_48_2:Find("line"), arg_48_1 < #var_46_2)
				onButton(arg_44_0, arg_48_2:Find("like"), function()
					local var_49_0 = var_48_0.id

					pg.m02:sendNotification(GAME.APPRECIATE_MUSIC_LIKE, {
						musicID = var_49_0,
						isAdd = arg_44_0.likeDic[var_49_0] and 1 or 0
					})
					arg_44_0:ChangeLike(var_49_0)
					arg_44_0:updateLikeToggle()
					arg_44_0:updatePlateList(arg_44_1, arg_44_2)

					if arg_44_0.musicPlayer and arg_44_0.musicPlayer:GetCurrentMusicId() == var_49_0 then
						setActive(arg_44_0.likeOnImg, arg_44_0.likeDic[var_49_0])
					end
				end, SFX_CONFIRM)
				setActive(arg_48_2:Find("like/off"), not arg_44_0.likeDic[var_48_0.id])
				setActive(arg_48_2:Find("like/on"), arg_44_0.likeDic[var_48_0.id])

				local var_48_1 = arg_44_0.musicPlayer and arg_44_0.musicPlayer.albumName == var_44_1 and arg_44_0.musicPlayer:GetCurrentMusicId() == var_48_0.id

				setActive(arg_48_2:Find("mark/Text"), not var_48_1)
				setActive(arg_48_2:Find("mark/icon"), var_48_1)
				setTextColor(arg_48_2:Find("name/subText"), var_48_1 and Color.NewHex("FF596E") or Color.white)
				setTextColor(arg_48_2:Find("time"), var_48_1 and Color.NewHex("FF596E") or Color.white)
				onButton(arg_44_0, arg_48_2, function()
					arg_44_0:NewMusicPlayer(var_44_1, var_46_0, var_48_0.id)
				end, SFX_CONFIRM)
			end
		end)
		setActive(var_44_3:Find("panel/view/empty"), #var_46_2 == 0)
	end

	setActive(var_44_3:Find("panel/sort"), var_44_0)

	if var_44_0 then
		local var_44_8 = var_44_3:Find("panel/sort/bg/asc")
		local var_44_9 = var_44_3:Find("panel/sort/bg/desc")

		setText(var_44_8:Find("Text"), i18n("word_asc"))
		onToggle(arg_44_0, var_44_8, function(arg_51_0)
			if arg_51_0 then
				arg_44_0.sortValue = MusicCollectionConst.Sort_Order_Up

				arg_44_0:saveRunData()
				var_44_7(not arg_51_0)
			end

			setImageAlpha(var_44_8, arg_51_0 and 1 or 0)
			setCanvasGroupAlpha(var_44_8, arg_51_0 and 1 or 0.3)
		end, SFX_PANEL)
		setText(var_44_9:Find("Text"), i18n("word_desc"))
		onToggle(arg_44_0, var_44_9, function(arg_52_0)
			if arg_52_0 then
				arg_44_0.sortValue = MusicCollectionConst.Sort_Order_Down

				arg_44_0:saveRunData()
				var_44_7(arg_52_0)
			end

			setImageAlpha(var_44_9, arg_52_0 and 1 or 0)
			setCanvasGroupAlpha(var_44_9, arg_52_0 and 1 or 0.3)
		end, SFX_PANEL)

		if arg_44_0.sortValue == MusicCollectionConst.Sort_Order_Up then
			triggerToggle(var_44_8, true)
		else
			triggerToggle(var_44_9, true)
		end
	else
		var_44_7(false)
	end
end

function var_0_0.updateAlbumListPanel(arg_53_0)
	local var_53_0 = string.lower(getInputText(arg_53_0.albumInputText))

	arg_53_0.tempAlbumList = underscore.filter(arg_53_0.albumNames, function(arg_54_0)
		if string.find(string.lower(arg_54_0), var_53_0) then
			return true
		else
			return underscore.any(arg_53_0.appreciateProxy:getAlbumMusicList(arg_54_0), function(arg_55_0)
				return string.find(string.lower(pg.music_collect_config[arg_55_0].name), var_53_0)
			end)
		end
	end)

	arg_53_0.albumItemList:align(#arg_53_0.tempAlbumList)
	setActive(arg_53_0.panel:Find("middle/empty"), #arg_53_0.tempAlbumList == 0)
	setActive(arg_53_0.albumToggle:Find("asc"), arg_53_0.albumSortValue == "asc")
	setActive(arg_53_0.albumToggle:Find("desc"), arg_53_0.albumSortValue == "desc")
end

function var_0_0.updateAlbumTF(arg_56_0, arg_56_1, arg_56_2)
	if arg_56_0.albumSortValue == "desc" then
		arg_56_2 = #arg_56_0.tempAlbumList + 1 - arg_56_2
	end

	local var_56_0 = arg_56_0.tempAlbumList[arg_56_2]

	setText(arg_56_1:Find("index"), string.format("%02d", arg_56_2))

	local var_56_1 = arg_56_0.appreciateProxy:getAlbumMusicList(var_56_0)
	local var_56_2 = pg.music_collect_config[var_56_1[1]].cover
	local var_56_3 = MusicCollectionConst.MUSIC_COVER_PATH_PREFIX .. var_56_2

	arg_56_0.resLoader:LoadSprite(var_56_3, var_56_2, arg_56_1:Find("icon/face"), false)
	changeToScrollText(arg_56_1:Find("name"), var_56_0)
	setActive(arg_56_1:Find("icon/main"), var_56_0 == arg_56_0.appreciateProxy:getMainPlayerAlbumName())

	local var_56_4 = arg_56_0.musicPlayer and arg_56_0.musicPlayer.albumName == var_56_0

	setActive(arg_56_1:Find("playing"), var_56_4)
	setActive(arg_56_1:Find("line"), arg_56_2 < #arg_56_0.tempAlbumList)
	onButton(arg_56_0, arg_56_1, function()
		arg_56_0:closeAlbumListPanel()

		arg_56_0.curMidddleIndex = arg_56_2

		if arg_56_0.likeValue == MusicCollectionConst.Filte_Like_Value then
			arg_56_0.likeValue = MusicCollectionConst.Filte_Normal_Value

			arg_56_0:updatePlateListPanel()
		else
			arg_56_0.lScrollPageSC:Init(arg_56_0.curMidddleIndex - 1)
		end

		arg_56_0:saveRunData()
	end, SFX_PANEL)
end

function var_0_0.updateLikeToggle(arg_58_0)
	setActive(arg_58_0.likeFilteOnImg, arg_58_0.likeValue == MusicCollectionConst.Filte_Like_Value)

	local var_58_0 = underscore.reduce(underscore.keys(arg_58_0.likeDic), 0, function(arg_59_0, arg_59_1)
		return arg_59_0 + (arg_58_0.likeDic[arg_59_1] and 1 or 0)
	end)

	setText(arg_58_0.likeFilteToggle:Find("TextNum"), string.format("(%d)", var_58_0))
end

function var_0_0.updatePlayPanel(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0.musicPlayer:GetCurrentMusicId()
	local var_60_1 = pg.music_collect_config[var_60_0]
	local var_60_2 = var_60_1.cover
	local var_60_3 = MusicCollectionConst.MUSIC_COVER_PATH_PREFIX .. var_60_2

	arg_60_0.resLoader:LoadSprite(var_60_3, var_60_2, arg_60_0.songImg, false)

	local var_60_4 = var_60_1.name

	changeToScrollText(arg_60_0.playPanelNameText, var_60_4)
	setActive(arg_60_0.likeOnImg, arg_60_0.likeDic[var_60_1.id])
	setActive(arg_60_0.playBtn, false)
	setActive(arg_60_0.playDesc, true)
	setActive(arg_60_0.pauseBtn, true)
	setSlider(arg_60_0.playProgressBar, 0, arg_60_1, 0)
	setText(arg_60_0.totalTimeText, arg_60_0:descTime(arg_60_1))
	setActive(arg_60_0.nowTimeText, true)
	setActive(arg_60_0.totalTimeText, true)
end

function var_0_0.updatePlayType(arg_61_0, arg_61_1)
	arg_61_1 = arg_61_1 or getProxy(AppreciateProxy):getMusicPlayerLoopType()

	eachChild(arg_61_0.playLoopBtn, function(arg_62_0, arg_62_1)
		setActive(arg_62_0, arg_62_0.name == arg_61_1)
	end)
end

function var_0_0.updatePlayProgress(arg_63_0, arg_63_1)
	arg_63_0.playSliderSC:SetValueWithoutEvent(arg_63_1)
	setText(arg_63_0.nowTimeText, arg_63_0:descTime(arg_63_1))
end

function var_0_0.playPlateAni(arg_64_0, arg_64_1, arg_64_2, arg_64_3, arg_64_4)
	arg_64_0:setAniState(true)
	setActive(arg_64_1:Find("list"), true)

	function arg_64_0.animCallback()
		arg_64_0:setAniState(false)
	end

	quickPlayAnimation(arg_64_1, "anim_MusicCollectionUI_Plate_expand")
end

function var_0_0.closePlateAni(arg_66_0, arg_66_1)
	arg_66_0:setAniState(true)

	function arg_66_0.animCallback()
		setActive(arg_66_1:Find("list"), false)
		arg_66_0:setAniState(false)
	end

	quickPlayAnimation(arg_66_1, "anim_MusicCollectionUI_Plate_retract")
end

function var_0_0.setAniState(arg_68_0, arg_68_1)
	arg_68_0.isPlayingAni = arg_68_1
end

function var_0_0.openAlbumListPanel(arg_69_0)
	setActive(arg_69_0.albumListPanel, true)
	setActive(arg_69_0.listBtn:Find("on"), true)
	setActive(arg_69_0.listBtn:Find("off"), false)
end

function var_0_0.closeAlbumListPanel(arg_70_0, arg_70_1)
	setActive(arg_70_0.albumListPanel, false)
	setActive(arg_70_0.listBtn:Find("on"), false)
	setActive(arg_70_0.listBtn:Find("off"), true)
end

function var_0_0.checkupdateAlbumTF(arg_71_0)
	if #arg_71_0.albumTFList > 0 then
		arg_71_0:updateAlbumTF(arg_71_0.albumTFList[arg_71_0.curMidddleIndex], arg_71_0.curMidddleIndex)
	end
end

function var_0_0.NewMusicPlayer(arg_72_0, arg_72_1, arg_72_2, arg_72_3)
	local var_72_0 = {
		loopType = getProxy(AppreciateProxy):getMusicPlayerLoopType(),
		albumName = arg_72_1,
		list = arg_72_2 or nil,
		index = arg_72_3 and table.indexof(arg_72_2, arg_72_3) or nil
	}

	arg_72_0.bgmMgr:TempPlay("TempMusicPlayer", var_72_0)

	arg_72_0.musicPlayer = arg_72_0.bgmMgr:GetMusicPlayer()
end

function var_0_0.ChangeLike(arg_73_0, arg_73_1)
	arg_73_0.likeDic[arg_73_1] = not arg_73_0.likeDic[arg_73_1]

	if arg_73_0.likeDic[arg_73_1] then
		table.insert(arg_73_0.likeIds, arg_73_1)
	else
		table.removebyvalue(arg_73_0.likeIds, arg_73_1)
	end
end

function var_0_0.tryPlayMusic(arg_74_0)
	triggerButton(arg_74_0.playBtn)
end

function var_0_0.tryPauseMusic(arg_75_0)
	triggerButton(arg_75_0.pauseBtn)
end

function var_0_0.descTime(arg_76_0, arg_76_1)
	local var_76_0 = math.floor(arg_76_1 / 1000)
	local var_76_1 = math.floor(var_76_0 / 3600)
	local var_76_2 = var_76_0 - var_76_1 * 3600
	local var_76_3 = math.floor(var_76_2 / 60)
	local var_76_4 = var_76_2 % 60

	if var_76_1 ~= 0 then
		return string.format("%02d:%02d:%02d", var_76_1, var_76_3, var_76_4)
	else
		return string.format("%02d:%02d", var_76_3, var_76_4)
	end
end

return var_0_0
