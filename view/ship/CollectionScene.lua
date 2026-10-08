local var_0_0 = class("CollectionScene", import("..base.BaseUI"))

var_0_0.SHOW_DETAIL = "event show detail"
var_0_0.GET_AWARD = "event get award"
var_0_0.ACTIVITY_OP = "event activity op"
var_0_0.BEGIN_STAGE = "event begin state"
var_0_0.ON_INDEX = "event on index"
var_0_0.UPDATE_RED_POINT = "CollectionScene:UPDATE_RED_POINT"
var_0_0.ShipOrderAsc = false
var_0_0.ShipIndex = {
	typeIndex = ShipIndexConst.TypeAll,
	campIndex = ShipIndexConst.CampAll,
	rarityIndex = ShipIndexConst.RarityAll,
	collExtraIndex = ShipIndexConst.CollExtraAll
}
var_0_0.ShipIndexData = {
	customPanels = {
		typeIndex = {
			blueSeleted = true,
			mode = CustomIndexLayer.Mode.AND,
			options = ShipIndexConst.TypeIndexs,
			names = ShipIndexConst.TypeNames
		},
		campIndex = {
			blueSeleted = true,
			mode = CustomIndexLayer.Mode.AND,
			options = ShipIndexConst.CampIndexs,
			names = ShipIndexConst.CampNames
		},
		rarityIndex = {
			blueSeleted = true,
			mode = CustomIndexLayer.Mode.AND,
			options = ShipIndexConst.RarityIndexs,
			names = ShipIndexConst.RarityNames
		},
		collExtraIndex = {
			blueSeleted = true,
			mode = CustomIndexLayer.Mode.AND,
			options = ShipIndexConst.CollExtraIndexs,
			names = ShipIndexConst.CollExtraNames
		}
	},
	groupList = {
		{
			dropdown = false,
			titleTxt = "indexsort_index",
			titleENTxt = "indexsort_indexeng",
			tags = {
				"typeIndex"
			}
		},
		{
			dropdown = false,
			titleTxt = "indexsort_camp",
			titleENTxt = "indexsort_campeng",
			tags = {
				"campIndex"
			}
		},
		{
			dropdown = false,
			titleTxt = "indexsort_rarity",
			titleENTxt = "indexsort_rarityeng",
			tags = {
				"rarityIndex"
			}
		},
		{
			dropdown = false,
			titleTxt = "indexsort_extraindex",
			titleENTxt = "indexsort_indexeng",
			tags = {
				"collExtraIndex"
			}
		}
	}
}
var_0_0.SHIPCOLLECTION_INDEX = 1
var_0_0.MANGA_INDEX = 4
var_0_0.GALLERY_INDEX = 5
var_0_0.MUSIC_INDEX = 6

function var_0_0.isDefaultStatus(arg_1_0)
	return var_0_0.ShipIndex.typeIndex == ShipIndexConst.TypeAll and (var_0_0.ShipIndex.campIndex == ShipIndexConst.CampAll or arg_1_0.contextData.toggle == 1 and arg_1_0.contextData.cardToggle == 2) and var_0_0.ShipIndex.rarityIndex == ShipIndexConst.RarityAll and var_0_0.ShipIndex.collExtraIndex == ShipIndexConst.CollExtraAll
end

function var_0_0.getUIName(arg_2_0)
	return "CollectionUI"
end

function var_0_0.getResource(arg_3_0, arg_3_1)
	local var_3_0 = {
		"ui/collectionui",
		"ui/share/index_atlas"
	}

	local function var_3_1()
		local var_4_0 = {}

		for iter_4_0, iter_4_1 in ipairs(pg.storeup_data_template.all) do
			local var_4_1 = pg.storeup_data_template[iter_4_1]

			for iter_4_2, iter_4_3 in ipairs(var_4_1.char_list or {}) do
				local var_4_2 = ShipGroup.getDefaultSkin(iter_4_3)

				if var_4_2 then
					table.insertto(var_4_0, ResPathSupport.GetShipSkinSpineShipModelList(var_4_2.id))
				end
			end
		end

		return var_4_0
	end

	local function var_3_2()
		local var_5_0 = {}

		local function var_5_1(arg_6_0)
			local var_6_0 = Drop.New({
				type = arg_6_0[1],
				id = arg_6_0[2],
				count = arg_6_0[3]
			})

			if var_6_0.type == DROP_TYPE_SHIP then
				local var_6_1 = Ship.New({
					configId = var_6_0.id
				})

				table.insertto(var_5_0, ResPathSupport.GetPaintingSquareIconListByPaintingName(var_6_1:getPainting()))
				table.insertto(var_5_0, ResPathSupport.GetPaintingShipYardIconListByPaintingName(var_6_1:getPainting()))
				table.insert(var_5_0, string.format(ResPathSupport.ConstPath.BG.ShipCard, var_6_1:rarity2bgPrint()))
			elseif var_6_0.type == DROP_TYPE_EQUIP then
				local var_6_2 = var_6_0:getSubClass()

				table.insert(var_5_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.Equipment.Equip, var_6_2:getConfig("icon")))
			elseif var_6_0.type == DROP_TYPE_FURNITURE then
				table.insert(var_5_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.FurnitureIcon, var_6_0:getIcon()))
			elseif var_6_0.type == DROP_TYPE_ITEM or var_6_0.type == DROP_TYPE_VITEM or var_6_0.type == DROP_TYPE_META_PT or var_6_0.type == DROP_TYPE_LOVE_LETTER then
				local var_6_3 = var_6_0:getSubClass()
				local var_6_4 = var_6_3.icon or var_6_3:getConfig("icon")

				if noEmptyStr(var_6_4) then
					table.insert(var_5_0, var_6_4)
				end
			elseif var_6_0.type == DROP_TYPE_RESOURCE then
				local var_6_5 = id2ItemId(var_6_0.id)

				if var_6_5 then
					var_5_1({
						DROP_TYPE_ITEM,
						var_6_5,
						var_6_0.count
					})
				end
			end
		end

		for iter_5_0, iter_5_1 in ipairs(pg.storeup_data_template.all) do
			local var_5_2 = pg.storeup_data_template[iter_5_1]

			for iter_5_2, iter_5_3 in ipairs(var_5_2.award_display or {}) do
				var_5_1(iter_5_3)
			end
		end

		return var_5_0
	end

	local function var_3_3()
		local var_7_0 = {}

		for iter_7_0, iter_7_1 in ipairs(pg.ship_data_group.all) do
			local var_7_1 = pg.ship_data_group[iter_7_1].group_type
			local var_7_2 = ShipGroup.getDefaultSkin(var_7_1)
			local var_7_3 = ShipGroup.New({
				id = var_7_1
			})

			if var_7_2 then
				table.insertto(var_7_0, ResPathSupport.GetShipSkinPaintingShipYardIconList(var_7_2.id))
			end

			table.insert(var_7_0, string.format(ResPathSupport.ConstPath.BG.ShipCard, var_7_3:rarity2bgPrint(false)))

			if pg.ship_data_trans[var_7_1] then
				local var_7_4 = ShipGroup.getModSkin(var_7_1)

				if var_7_4 then
					table.insertto(var_7_0, ResPathSupport.GetShipSkinPaintingShipYardIconList(var_7_4.id))
				end

				var_7_3.trans = true

				table.insert(var_7_0, string.format(ResPathSupport.ConstPath.BG.ShipCard, var_7_3:rarity2bgPrint(true)))
			end
		end

		return var_7_0
	end

	local function var_3_4()
		local var_8_0 = {}

		for iter_8_0, iter_8_1 in ipairs(pg.cartoon.all) do
			local var_8_1 = MangaConst.GetMangaPicPathByID(iter_8_1)

			if var_8_1 then
				table.insert(var_8_0, var_8_1)
			end
		end

		return var_8_0
	end

	local function var_3_5()
		local var_9_0 = {}

		for iter_9_0, iter_9_1 in ipairs(pg.gallery_config.all) do
			local var_9_1 = GalleryConst.GetGalleryPicPathByID(iter_9_1)
			local var_9_2 = GalleryConst.GetGalleryPreviewPicPathByID(iter_9_1)

			if var_9_1 then
				table.insert(var_9_0, var_9_1)
			end

			if var_9_2 then
				table.insert(var_9_0, var_9_2)
			end
		end

		return var_9_0
	end

	local function var_3_6()
		local var_10_0 = {}

		for iter_10_0, iter_10_1 in ipairs(pg.music_album.all) do
			local var_10_1 = pg.music_album[iter_10_1].cover

			if var_10_1 and var_10_1 ~= "" then
				table.insert(var_10_0, MusicCollectionConst.MUSIC_COVER_PATH_PREFIX .. var_10_1)
			end
		end

		return var_10_0
	end

	return ResPathSupport.UniqueLuaArr(ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_3_0, arg_3_1), var_3_0, var_3_1(), var_3_3(), var_3_2(), var_3_4(), var_3_5(), var_3_6()))
end

function var_0_0.setShipGroups(arg_11_0, arg_11_1)
	arg_11_0.shipGroups = arg_11_1
end

function var_0_0.setAwards(arg_12_0, arg_12_1)
	arg_12_0.awards = arg_12_1
end

function var_0_0.setCollectionRate(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	arg_13_0.rate = arg_13_1
	arg_13_0.count = arg_13_2
	arg_13_0.totalCount = arg_13_3
end

function var_0_0.setLinkCollectionCount(arg_14_0, arg_14_1)
	arg_14_0.linkCount = arg_14_1
end

function var_0_0.setPlayer(arg_15_0, arg_15_1)
	arg_15_0.player = arg_15_1
end

function var_0_0.setProposeList(arg_16_0, arg_16_1)
	arg_16_0.proposeList = arg_16_1
end

function var_0_0.init(arg_17_0)
	arg_17_0:initEvents()

	arg_17_0.blurPanel = arg_17_0._tf:Find("blur_panel")
	arg_17_0.top = arg_17_0._tf:Find("blur_panel/adapt/top")
	arg_17_0.leftPanel = arg_17_0._tf:Find("blur_panel/adapt/left_length")
	arg_17_0.backBtn = findTF(arg_17_0.top, "back_btn")
	arg_17_0.contextData.toggle = arg_17_0.contextData.toggle or 2
	arg_17_0.toggles = {
		arg_17_0.leftPanel:Find("frame/tagRoot/card"),
		arg_17_0.leftPanel:Find("frame/tagRoot/display"),
		arg_17_0.leftPanel:Find("frame/tagRoot/trans"),
		arg_17_0.leftPanel:Find("frame/tagRoot/manga"),
		arg_17_0.leftPanel:Find("frame/tagRoot/gallery"),
		arg_17_0.leftPanel:Find("frame/tagRoot/music")
	}
	arg_17_0.toggleUpdates = {
		"initCardPanel",
		"initDisplayPanel",
		"initCardPanel",
		"initMangaPanel",
		"initGalleryPanel",
		"initMusicPanel"
	}
	arg_17_0.cardList = arg_17_0._tf:Find("main/list_card/scroll"):GetComponent("LScrollRect")

	function arg_17_0.cardList.onInitItem(arg_18_0)
		arg_17_0:onInitCard(arg_18_0)
	end

	function arg_17_0.cardList.onUpdateItem(arg_19_0, arg_19_1)
		arg_17_0:onUpdateCard(arg_19_0, arg_19_1)
	end

	function arg_17_0.cardList.onReturnItem(arg_20_0, arg_20_1)
		arg_17_0:onReturnCard(arg_20_0, arg_20_1)
	end

	arg_17_0.cardItems = {}
	arg_17_0.cardContent = tf(arg_17_0.cardList):Find("ships")
	arg_17_0.contextData.cardToggle = arg_17_0.contextData.cardToggle or 1
	arg_17_0.cardToggleGroup = arg_17_0._tf:Find("main/list_card/types")
	arg_17_0.cardToggles = {
		arg_17_0.cardToggleGroup:Find("char"),
		arg_17_0.cardToggleGroup:Find("link"),
		arg_17_0.cardToggleGroup:Find("blueprint"),
		arg_17_0.cardToggleGroup:Find("meta")
	}
	arg_17_0.cardList.decelerationRate = 0.07
	arg_17_0.bonusPanel = arg_17_0._tf:Find("bonus_panel")
	arg_17_0.charTpl = arg_17_0:getTpl("chartpl")
	arg_17_0.tip = arg_17_0.toggles[2]:Find("tip")

	local var_17_0 = pg.storeup_data_template

	arg_17_0.favoriteVOs = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0.all) do
		local var_17_1 = Favorite.New({
			id = iter_17_0
		})

		table.insert(arg_17_0.favoriteVOs, var_17_1)
	end

	arg_17_0.memoryGroups = _.map(pg.memory_group.all, function(arg_21_0)
		return pg.memory_group[arg_21_0]
	end)
	arg_17_0.memories = nil
	arg_17_0.memoryList = arg_17_0._tf:Find("main/list_memory"):GetComponent("LScrollRect")

	function arg_17_0.memoryList.onInitItem(arg_22_0)
		arg_17_0:onInitMemory(arg_22_0)
	end

	function arg_17_0.memoryList.onUpdateItem(arg_23_0, arg_23_1)
		arg_17_0:onUpdateMemory(arg_23_0, arg_23_1)
	end

	function arg_17_0.memoryList.onReturnItem(arg_24_0, arg_24_1)
		arg_17_0:onReturnMemory(arg_24_0, arg_24_1)
	end

	arg_17_0.memoryViewport = arg_17_0._tf:Find("main/list_memory/viewport")
	arg_17_0.memoriesGrid = arg_17_0._tf:Find("main/list_memory/viewport/memories"):GetComponent(typeof(GridLayoutGroup))
	arg_17_0.memoryItems = {}

	local var_17_2 = tf(arg_17_0.memoryList):Find("memory")

	arg_17_0.memoryMask = arg_17_0._tf:Find("blur_panel/story_mask")

	setActive(var_17_2, false)
	setActive(arg_17_0.memoryMask, false)

	arg_17_0.memoryTogGroup = arg_17_0.top:Find("memory")

	setActive(arg_17_0.memoryTogGroup, false)

	arg_17_0.memoryToggles = {
		arg_17_0.top:Find("memory/0"),
		arg_17_0.top:Find("memory/1"),
		arg_17_0.top:Find("memory/2"),
		arg_17_0.top:Find("memory/3")
	}
	arg_17_0.memoryFilterIndex = {
		true,
		true,
		true
	}
	arg_17_0.galleryPanelContainer = arg_17_0._tf:Find("main/GalleryContainer")
	arg_17_0.musicPanelContainer = arg_17_0._tf:Find("main/MusicContainer")
	arg_17_0.mangaPanelContainer = arg_17_0._tf:Find("main/MangaContainer")

	arg_17_0:initIndexPanel()
end

function var_0_0.didEnter(arg_25_0)
	onButton(arg_25_0, arg_25_0.backBtn, function()
		arg_25_0.contextData.cardScrollValue = 0

		arg_25_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)

	arg_25_0.helpBtn = arg_25_0.leftPanel:Find("help_btn")

	onButton(arg_25_0, arg_25_0.helpBtn, function()
		if arg_25_0.contextData.toggle == var_0_0.MUSIC_INDEX then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.NewMusic_help.tip
			})
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.collection_help.tip
			})
		end
	end, SFX_PANEL)

	local var_25_0 = arg_25_0.top:Find("stamp")

	setActive(var_25_0, getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(arg_25_0, var_25_0, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(8)
	end, SFX_CONFIRM)

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.toggles) do
		if PLATFORM_CODE == PLATFORM_CH and (iter_25_0 == 1 or iter_25_0 == 3) and LOCK_COLLECTION then
			setActive(iter_25_1, false)
		else
			onToggle(arg_25_0, iter_25_1, function(arg_29_0)
				if arg_29_0 then
					if arg_25_0.contextData.toggle ~= iter_25_0 then
						if arg_25_0.contextData.toggle == var_0_0.SHIPCOLLECTION_INDEX then
							setActive(arg_25_0.helpBtn, false)

							if arg_25_0.bulinTip then
								arg_25_0.bulinTip.buffer:Hide()
							end

							if arg_25_0.contextData.cardToggle == 1 then
								arg_25_0.contextData.cardScrollValue = arg_25_0.cardList.value
							end
						end

						arg_25_0.contextData.toggle = iter_25_0

						if arg_25_0.toggleUpdates[iter_25_0] then
							arg_25_0[arg_25_0.toggleUpdates[iter_25_0]](arg_25_0)
							arg_25_0:calFavoriteRate()
						end
					end

					if iter_25_0 == var_0_0.SHIPCOLLECTION_INDEX then
						setActive(arg_25_0.helpBtn, true)

						local var_29_0 = getProxy(SettingsProxy)

						if not var_29_0:IsShowCollectionHelp() then
							triggerButton(arg_25_0.helpBtn)
							var_29_0:SetCollectionHelpFlag(true)
						end

						if arg_25_0.bulinTip then
							arg_25_0.bulinTip.buffer:Show()
						else
							arg_25_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_25_0, arg_25_0._tf:Find("main"))
						end
					end

					if iter_25_0 ~= var_0_0.MUSIC_INDEX then
						if arg_25_0.musicView and arg_25_0.musicView:CheckState(BaseSubView.STATES.INITED) then
							arg_25_0.musicView:tryPauseMusic()
							arg_25_0.musicView:closeAlbumListPanel()
						end

						pg.BgmMgr.GetInstance():ContinuePlay()
					elseif iter_25_0 == var_0_0.MUSIC_INDEX then
						pg.BgmMgr.GetInstance():StopPlay()

						if arg_25_0.musicView and arg_25_0.musicView:CheckState(BaseSubView.STATES.INITED) then
							arg_25_0.musicView:tryPlayMusic()
						end
					end
				end
			end, SFX_UI_TAG)
		end
	end

	for iter_25_2, iter_25_3 in ipairs(arg_25_0.memoryToggles) do
		onToggle(arg_25_0, iter_25_3, function(arg_30_0)
			if arg_30_0 then
				if iter_25_2 == 1 then
					arg_25_0.memoryFilterIndex = {
						true,
						true,
						true
					}
				else
					for iter_30_0 in ipairs(arg_25_0.memoryFilterIndex) do
						arg_25_0.memoryFilterIndex[iter_30_0] = iter_25_2 - 1 == iter_30_0
					end
				end

				arg_25_0:memoryFilter()
			end
		end, SFX_UI_TAG)
	end

	local var_25_1 = arg_25_0.contextData.toggle

	arg_25_0.contextData.toggle = -1

	triggerToggle(arg_25_0.toggles[var_25_1], true)

	local var_25_2 = arg_25_0.contextData.memoryGroup

	if var_25_2 and pg.memory_group[var_25_2] then
		arg_25_0:showSubMemories(pg.memory_group[var_25_2])
	else
		triggerToggle(arg_25_0.memoryToggles[1], true)
	end

	for iter_25_4, iter_25_5 in ipairs(arg_25_0.cardToggles) do
		triggerToggle(iter_25_5, arg_25_0.contextData.cardToggle == iter_25_4)
		onToggle(arg_25_0, iter_25_5, function(arg_31_0)
			if arg_31_0 and arg_25_0.contextData.cardToggle ~= iter_25_4 then
				if arg_25_0.contextData.cardToggle == 1 then
					arg_25_0.contextData.cardScrollValue = arg_25_0.cardList.value
				end

				arg_25_0.contextData.cardToggle = iter_25_4

				arg_25_0:initCardPanel()
				arg_25_0:calFavoriteRate()
			end
		end)
	end

	arg_25_0:calFavoriteRate()
	arg_25_0:OverlayPanel(arg_25_0.blurPanel)
	onButton(arg_25_0, arg_25_0.bonusPanel, function()
		arg_25_0:closeBonus()
	end, SFX_PANEL)
end

function var_0_0.updateCollectNotices(arg_33_0, arg_33_1)
	setActive(arg_33_0.tip, arg_33_1)
	setActive(arg_33_0.toggles[var_0_0.GALLERY_INDEX]:Find("tip"), getProxy(AppreciateProxy):isGalleryHaveNewRes())
	setActive(arg_33_0.toggles[var_0_0.MUSIC_INDEX]:Find("tip"), getProxy(AppreciateProxy):isMusicHaveNewRes())
	setActive(arg_33_0.toggles[var_0_0.MANGA_INDEX]:Find("tip"), getProxy(AppreciateProxy):isMangaHaveNewRes())
end

function var_0_0.calFavoriteRate(arg_34_0)
	local var_34_0 = arg_34_0.contextData.toggle == 1 and arg_34_0.contextData.cardToggle == 2

	setActive(arg_34_0.top:Find("total/char"), not var_34_0)
	setActive(arg_34_0.top:Find("total/link"), var_34_0)
	setText(arg_34_0.top:Find("total/char/rate/Text"), arg_34_0.rate * 100 .. "%")
	setText(arg_34_0.top:Find("total/char/count/Text"), arg_34_0.count .. "/" .. arg_34_0.totalCount)
	setText(arg_34_0.top:Find("total/link/count/Text"), arg_34_0.linkCount)
end

function var_0_0.initCardPanel(arg_35_0)
	local var_35_0 = arg_35_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/share/index_atlas", var_35_0, function(arg_36_0)
		setImageSprite(arg_35_0.indexBtn, arg_36_0, true)
	end)

	if arg_35_0.contextData.toggle == 1 then
		setActive(arg_35_0.cardToggleGroup, true)
		arg_35_0:cardFilter()
	elseif arg_35_0.contextData.toggle == 3 then
		setActive(arg_35_0.cardToggleGroup, false)
		arg_35_0:transFilter()
	end

	table.sort(arg_35_0.codeShips, function(arg_37_0, arg_37_1)
		return arg_37_0.index_id < arg_37_1.index_id
	end)
	arg_35_0.cardList:SetTotalCount(#arg_35_0.codeShips, arg_35_0.contextData.cardScrollValue or 0)
end

function var_0_0.initIndexPanel(arg_38_0)
	arg_38_0.indexBtn = arg_38_0.top:Find("index_button")

	onButton(arg_38_0, arg_38_0.indexBtn, function()
		local var_39_0 = Clone(var_0_0.ShipIndexData)

		if arg_38_0.contextData.toggle == 1 and arg_38_0.contextData.cardToggle == 2 then
			var_39_0.customPanels.campIndex = nil
			var_39_0.groupList[2] = nil
		end

		var_39_0.indexDatas = Clone(var_0_0.ShipIndex)

		function var_39_0.callback(arg_40_0)
			var_0_0.ShipIndex.typeIndex = arg_40_0.typeIndex

			if arg_40_0.campIndex then
				var_0_0.ShipIndex.campIndex = arg_40_0.campIndex
			end

			var_0_0.ShipIndex.rarityIndex = arg_40_0.rarityIndex
			var_0_0.ShipIndex.collExtraIndex = arg_40_0.collExtraIndex

			arg_38_0:initCardPanel()
		end

		arg_38_0:emit(var_0_0.ON_INDEX, var_39_0)
	end, SFX_PANEL)
end

function var_0_0.onInitCard(arg_41_0, arg_41_1)
	if arg_41_0.exited then
		return
	end

	local var_41_0 = CollectionShipCard.New(arg_41_1)

	onButton(arg_41_0, var_41_0.go, function()
		if not arg_41_0.isClicked then
			arg_41_0.isClicked = true

			LeanTween.delayedCall(0.2, System.Action(function()
				arg_41_0.isClicked = false

				if not var_41_0:getIsInited() then
					return
				end

				if var_41_0.state == ShipGroup.STATE_UNLOCK then
					arg_41_0.contextData.cardScrollValue = arg_41_0.cardList.value

					arg_41_0:emit(var_0_0.SHOW_DETAIL, var_41_0.showTrans, var_41_0.shipGroup.id)
				elseif var_41_0.state == ShipGroup.STATE_NOTGET then
					if var_41_0.showTrans == true and var_41_0.shipGroup.trans == true then
						return
					end

					if var_41_0.config then
						arg_41_0:showObtain(var_41_0.config.description, var_41_0.shipGroup:getShipConfigId())
					end
				end
			end))
		end
	end, SOUND_BACK)

	arg_41_0.cardItems[arg_41_1] = var_41_0
end

function var_0_0.showObtain(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = {
		type = MSGBOX_TYPE_OBTAIN,
		shipId = arg_44_2,
		list = arg_44_1,
		mediatorName = CollectionMediator.__cname
	}

	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		var_44_0.unknown_small = true
	end

	arg_44_0.contextData.cardScrollValue = arg_44_0.cardList.value

	pg.MsgboxMgr.GetInstance():ShowMsgBox(var_44_0)
end

function var_0_0.skipIn(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0.contextData.displayGroupId = arg_45_2

	triggerToggle(arg_45_0.toggles[arg_45_1], true)
end

function var_0_0.onUpdateCard(arg_46_0, arg_46_1, arg_46_2)
	if arg_46_0.exited then
		return
	end

	local var_46_0 = arg_46_0.cardItems[arg_46_2]

	if not var_46_0 then
		arg_46_0:onInitCard(arg_46_2)

		var_46_0 = arg_46_0.cardItems[arg_46_2]
	end

	local var_46_1 = arg_46_1 + 1
	local var_46_2 = arg_46_0.codeShips[var_46_1]

	if not var_46_2 then
		return
	end

	local var_46_3 = false

	if var_46_2.group then
		var_46_3 = arg_46_0.proposeList[var_46_2.group.id]
	end

	var_46_0:update(var_46_2.code, var_46_2.group, var_46_2.showTrans, var_46_3, var_46_2.id)
end

function var_0_0.onReturnCard(arg_47_0, arg_47_1, arg_47_2)
	if arg_47_0.exited then
		return
	end

	local var_47_0 = arg_47_0.cardItems[arg_47_2]

	if var_47_0 then
		var_47_0:clear()
	end
end

function var_0_0.cardFilter(arg_48_0)
	arg_48_0.codeShips = {}

	local var_48_0 = _.filter(pg.ship_data_group.all, function(arg_49_0)
		return pg.ship_data_group[arg_49_0].handbook_type == arg_48_0.contextData.cardToggle - 1
	end)

	table.sort(var_48_0)

	for iter_48_0, iter_48_1 in ipairs(var_48_0) do
		local var_48_1 = pg.ship_data_group[iter_48_1]
		local var_48_2 = arg_48_0.shipGroups[var_48_1.group_type] or ShipGroup.New({
			id = var_48_1.group_type
		})

		if ShipIndexConst.filterByType(var_48_2, var_0_0.ShipIndex.typeIndex) and (arg_48_0.contextData.cardToggle == 2 or ShipIndexConst.filterByCamp(var_48_2, var_0_0.ShipIndex.campIndex)) and arg_48_0.contextData.cardToggle == 4 == Nation.IsMeta(ShipGroup.getDefaultShipConfig(var_48_1.group_type).nationality) and ShipIndexConst.filterByRarity(var_48_2, var_0_0.ShipIndex.rarityIndex) and ShipIndexConst.filterByCollExtra(var_48_2, var_0_0.ShipIndex.collExtraIndex) then
			arg_48_0.codeShips[#arg_48_0.codeShips + 1] = {
				showTrans = false,
				id = iter_48_1,
				code = iter_48_1 - (arg_48_0.contextData.cardToggle - 1) * 10000,
				group = arg_48_0.shipGroups[var_48_1.group_type],
				index_id = var_48_1.index_id
			}
		end
	end
end

function var_0_0.transFilter(arg_50_0)
	arg_50_0.codeShips = {}

	local var_50_0 = _.filter(pg.ship_data_group.all, function(arg_51_0)
		return pg.ship_data_group[arg_51_0].handbook_type == 0
	end)

	table.sort(var_50_0)

	for iter_50_0, iter_50_1 in ipairs(var_50_0) do
		local var_50_1 = pg.ship_data_group[iter_50_1]

		if pg.ship_data_trans[var_50_1.group_type] then
			local var_50_2 = arg_50_0.shipGroups[var_50_1.group_type] or ShipGroup.New({
				remoulded = true,
				id = var_50_1.group_type
			})

			if ShipIndexConst.filterByType(var_50_2, var_0_0.ShipIndex.typeIndex) and ShipIndexConst.filterByCamp(var_50_2, var_0_0.ShipIndex.campIndex) and ShipIndexConst.filterByRarity(var_50_2, var_0_0.ShipIndex.rarityIndex) and ShipIndexConst.filterByCollExtra(var_50_2, var_0_0.ShipIndex.collExtraIndex) then
				arg_50_0.codeShips[#arg_50_0.codeShips + 1] = {
					showTrans = true,
					id = iter_50_1,
					code = 3000 + iter_50_1,
					group = var_50_2.trans and var_50_2 or nil,
					index_id = var_50_1.index_id
				}
			end
		end
	end
end

function var_0_0.sortDisplay(arg_52_0)
	table.sort(arg_52_0.favoriteVOs, function(arg_53_0, arg_53_1)
		local var_53_0 = arg_53_0:getState(arg_52_0.shipGroups, arg_52_0.awards)
		local var_53_1 = arg_53_1:getState(arg_52_0.shipGroups, arg_52_0.awards)

		if var_53_0 == var_53_1 then
			return arg_53_0.id < arg_53_1.id
		else
			return var_53_0 < var_53_1
		end
	end)

	local var_52_0 = 0
	local var_52_1 = arg_52_0.contextData.displayGroupId

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.favoriteVOs) do
		if iter_52_1:containShipGroup(var_52_1) then
			var_52_0 = iter_52_0

			break
		end
	end

	arg_52_0.displayRect:SetTotalCount(#arg_52_0.favoriteVOs, arg_52_0.displayRect:HeadIndexToValue(var_52_0 - 1))
end

function var_0_0.initDisplayPanel(arg_54_0)
	if not arg_54_0.isInitDisplay then
		arg_54_0.isInitDisplay = true
		arg_54_0.displayRect = arg_54_0._tf:Find("main/list_display"):GetComponent("LScrollRect")
		arg_54_0.displayRect.decelerationRate = 0.07

		function arg_54_0.displayRect.onInitItem(arg_55_0)
			arg_54_0:initFavoriteCard(arg_55_0)
		end

		function arg_54_0.displayRect.onUpdateItem(arg_56_0, arg_56_1)
			arg_54_0:updateFavoriteCard(arg_56_0, arg_56_1)
		end

		arg_54_0.favoriteCards = {}
	end

	arg_54_0:sortDisplay()
end

function var_0_0.initFavoriteCard(arg_57_0, arg_57_1)
	if arg_57_0.exited then
		return
	end

	local var_57_0 = FavoriteCard.New(arg_57_1, arg_57_0.charTpl)

	onButton(arg_57_0, var_57_0.awardTF, function()
		if var_57_0.state == Favorite.STATE_AWARD then
			arg_57_0:emit(var_0_0.GET_AWARD, var_57_0.favoriteVO.id, var_57_0.favoriteVO:getNextAwardIndex(var_57_0.awards))
		elseif var_57_0.state == Favorite.STATE_LOCK then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collection_lock"))
		elseif var_57_0.state == Favorite.STATE_FETCHED then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collection_fetched"))
		elseif var_57_0.state == Favorite.STATE_STATE_WAIT then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collection_nostar"))
		end
	end, SFX_PANEL)
	onButton(arg_57_0, var_57_0.box, function()
		arg_57_0:openBonus(var_57_0.favoriteVO)
	end, SFX_PANEL)

	arg_57_0.favoriteCards[arg_57_1] = var_57_0
end

function var_0_0.updateFavoriteCard(arg_60_0, arg_60_1, arg_60_2)
	if arg_60_0.exited then
		return
	end

	local var_60_0 = arg_60_0.favoriteCards[arg_60_2]

	if not var_60_0 then
		arg_60_0:initFavoriteCard(arg_60_2)

		var_60_0 = arg_60_0.favoriteCards[arg_60_2]
	end

	local var_60_1 = arg_60_0.favoriteVOs[arg_60_1 + 1]

	var_60_0:update(var_60_1, arg_60_0.shipGroups, arg_60_0.awards)
end

function var_0_0.openBonus(arg_61_0, arg_61_1)
	if not arg_61_0.isInitBound then
		arg_61_0.isInitBound = true
		arg_61_0.boundName = findTF(arg_61_0.bonusPanel, "frame/name/Text"):GetComponent(typeof(Text))
		arg_61_0.progressSlider = findTF(arg_61_0.bonusPanel, "frame/process"):GetComponent(typeof(Slider))
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_61_0.bonusPanel)
	setActive(arg_61_0.bonusPanel, true)

	arg_61_0.boundName.text = arg_61_1:getConfig("name")

	local var_61_0 = arg_61_1:getConfig("award_display")
	local var_61_1 = arg_61_1:getConfig("level")

	for iter_61_0, iter_61_1 in ipairs(var_61_1) do
		local var_61_2 = var_61_0[iter_61_0]
		local var_61_3 = findTF(arg_61_0.bonusPanel, "frame/awards/award" .. iter_61_0)

		setText(findTF(var_61_3, "process"), iter_61_1)

		local var_61_4 = arg_61_1:getAwardState(arg_61_0.shipGroups, arg_61_0.awards, iter_61_0)

		setActive(findTF(var_61_3, "item_tpl/unfinish"), var_61_4 == Favorite.STATE_WAIT)
		setActive(findTF(var_61_3, "item_tpl/get"), var_61_4 == Favorite.STATE_AWARD)
		setActive(findTF(var_61_3, "item_tpl/got"), var_61_4 == Favorite.STATE_FETCHED)
		setActive(findTF(var_61_3, "item_tpl/lock"), var_61_4 == Favorite.STATE_LOCK)
		setActive(findTF(var_61_3, "item_tpl/icon_bg"), var_61_4 ~= Favorite.STATE_LOCK)
		setActive(findTF(var_61_3, "item_tpl/bg"), var_61_4 ~= Favorite.STATE_LOCK)

		if var_61_2 then
			local var_61_5 = {
				count = 0,
				type = var_61_2[1],
				id = var_61_2[2]
			}

			updateDrop(findTF(var_61_3, "item_tpl"), var_61_5)

			var_61_5.count = var_61_2[3]

			onButton(arg_61_0, var_61_3, function()
				arg_61_0:emit(var_0_0.ON_DROP, var_61_5)
			end, SFX_PANEL)
		else
			GetOrAddComponent(var_61_3, typeof(Button)).onClick:RemoveAllListeners()
		end
	end

	local var_61_6 = arg_61_1:getStarCount(arg_61_0.shipGroups)

	arg_61_0.progressSlider.value = var_61_6 / var_61_1[#var_61_1]
end

function var_0_0.closeBonus(arg_63_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_63_0.bonusPanel, arg_63_0._tf)
	setActive(arg_63_0.bonusPanel, false)
end

function var_0_0.showSubMemories(arg_64_0, arg_64_1)
	arg_64_0.contextData.memoryGroup = arg_64_1.id
	arg_64_0.memories = _.map(arg_64_1.memories, function(arg_65_0)
		return pg.memory_template[arg_65_0]
	end)

	for iter_64_0 in ipairs(arg_64_0.memories) do
		arg_64_0.memories[iter_64_0].index = iter_64_0
	end

	arg_64_0.memoryList:SetTotalCount(#arg_64_0.memories, 0)
	setActive(arg_64_0.top:Find("memory"), false)
end

local var_0_1 = 3

function var_0_0.return2MemoryGroup(arg_66_0)
	local var_66_0 = arg_66_0.contextData.memoryGroup

	arg_66_0.contextData.memoryGroup = nil
	arg_66_0.memories = nil

	local var_66_1 = 0

	if var_66_0 then
		local var_66_2 = 0

		for iter_66_0, iter_66_1 in ipairs(arg_66_0.memoryGroups) do
			if iter_66_1.id == var_66_0 then
				var_66_2 = iter_66_0

				break
			end
		end

		if var_66_2 >= 0 then
			local var_66_3 = arg_66_0.memoryList
			local var_66_4 = arg_66_0.memoriesGrid.cellSize.y + arg_66_0.memoriesGrid.spacing.y
			local var_66_5 = var_66_4 * math.ceil(#arg_66_0.memoryGroups / var_0_1)

			var_66_1 = (var_66_4 * math.floor((var_66_2 - 1) / var_0_1) + var_66_3.paddingFront) / (var_66_5 - arg_66_0.memoryViewport.rect.height)
			var_66_1 = Mathf.Clamp01(var_66_1)
		end
	end

	arg_66_0.memoryList:SetTotalCount(#arg_66_0.memoryGroups, var_66_1)
	setActive(arg_66_0.top:Find("memory"), true)
end

function var_0_0.initMemoryPanel(arg_67_0)
	local var_67_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.QIXI_ACTIVITY_ID)

	if var_67_0 and not var_67_0:isEnd() then
		local var_67_1 = var_67_0:getConfig("config_data")
		local var_67_2 = _.flatten(var_67_1)
		local var_67_3 = var_67_2[#var_67_2]
		local var_67_4 = getProxy(TaskProxy):getTaskById(var_67_3)

		if var_67_4 and not var_67_4:isFinish() then
			pg.NewStoryMgr.GetInstance():Play("HOSHO8", function()
				arg_67_0:emit(CollectionScene.ACTIVITY_OP, {
					cmd = 2,
					activity_id = var_67_0.id
				})
			end, true)
		end
	end

	arg_67_0:memoryFilter()
end

function var_0_0.onInitMemory(arg_69_0, arg_69_1)
	if arg_69_0.exited then
		return
	end

	local var_69_0 = MemoryCard.New(arg_69_1)

	onButton(arg_69_0, var_69_0.go, function()
		if var_69_0.info then
			if var_69_0.isGroup then
				arg_69_0:showSubMemories(var_69_0.info)
			elseif var_69_0.info.is_open == 1 or pg.NewStoryMgr.GetInstance():IsPlayed(var_69_0.info.unlock_pre, true) then
				arg_69_0:playMemory(var_69_0.info)
			end
		end
	end, SOUND_BACK)

	arg_69_0.memoryItems[arg_69_1] = var_69_0
end

function var_0_0.onUpdateMemory(arg_71_0, arg_71_1, arg_71_2)
	if arg_71_0.exited then
		return
	end

	local var_71_0 = arg_71_0.memoryItems[arg_71_2]

	if not var_71_0 then
		arg_71_0:onInitMemory(arg_71_2)

		var_71_0 = arg_71_0.memoryItems[arg_71_2]
	end

	if arg_71_0.memories then
		var_71_0:update(false, arg_71_0.memories[arg_71_1 + 1])
	else
		var_71_0:update(true, arg_71_0.memoryGroups[arg_71_1 + 1])
	end

	local var_71_1 = {
		var_71_0.lock,
		var_71_0.normal,
		var_71_0.group
	}

	_.any(var_71_1, function(arg_72_0)
		local var_72_0 = isActive(arg_72_0)

		if var_72_0 then
			var_71_0.go:GetComponent(typeof(Button)).targetGraphic = arg_72_0:GetComponent(typeof(Image))
		end

		return var_72_0
	end)
end

function var_0_0.onReturnMemory(arg_73_0, arg_73_1, arg_73_2)
	if arg_73_0.exited then
		return
	end

	local var_73_0 = arg_73_0.memoryItems[arg_73_2]

	if var_73_0 then
		var_73_0:clear()
	end
end

function var_0_0.playMemory(arg_74_0, arg_74_1)
	if arg_74_1.type == 1 then
		local var_74_0 = findTF(arg_74_0.memoryMask, "pic")

		if string.len(arg_74_1.mask) > 0 then
			setActive(var_74_0, true)

			var_74_0:GetComponent(typeof(Image)).sprite = LoadSprite(arg_74_1.mask)
		else
			setActive(var_74_0, false)
		end

		setActive(arg_74_0.memoryMask, true)
		pg.NewStoryMgr.GetInstance():Play(arg_74_1.story, function()
			setActive(arg_74_0.memoryMask, false)
		end, true)
	elseif arg_74_1.type == 2 then
		local var_74_1 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_74_1.story)

		arg_74_0:emit(var_0_0.BEGIN_STAGE, {
			memory = true,
			system = SYSTEM_PERFORM,
			stageId = var_74_1
		})
	end
end

function var_0_0.memoryFilter(arg_76_0)
	arg_76_0.memoryGroups = {}

	for iter_76_0, iter_76_1 in ipairs(pg.memory_group.all) do
		local var_76_0 = pg.memory_group[iter_76_1]

		if arg_76_0.memoryFilterIndex[var_76_0.type] then
			table.insert(arg_76_0.memoryGroups, var_76_0)
		end
	end

	table.sort(arg_76_0.memoryGroups, function(arg_77_0, arg_77_1)
		return arg_77_0.id < arg_77_1.id
	end)
	arg_76_0.memoryList:SetTotalCount(#arg_76_0.memoryGroups, 0)
end

function var_0_0.willExit(arg_78_0)
	if arg_78_0.bulinTip then
		arg_78_0.bulinTip:Destroy()

		arg_78_0.bulinTip = nil
	end

	if arg_78_0.tweens then
		cancelTweens(arg_78_0.tweens)
	end

	arg_78_0:UnOverlayPanel(arg_78_0.blurPanel, arg_78_0._tf)

	if arg_78_0.bonusPanel.gameObject.activeSelf then
		arg_78_0:closeBonus()
	end

	Destroy(arg_78_0.bonusPanel)

	arg_78_0.bonusPanel = nil

	for iter_78_0, iter_78_1 in pairs(arg_78_0.cardItems) do
		iter_78_1:clear()
	end

	if arg_78_0.resPanel then
		arg_78_0.resPanel:exit()

		arg_78_0.resPanel = nil
	end

	if arg_78_0.galleryView then
		arg_78_0.galleryView:Destroy()

		arg_78_0.galleryView = nil
	end

	if arg_78_0.musicView then
		arg_78_0.musicView:Destroy()

		arg_78_0.musicView = nil
	end

	if arg_78_0.mangaView then
		arg_78_0.mangaView:Destroy()

		arg_78_0.mangaView = nil
	end
end

function var_0_0.initGalleryPanel(arg_79_0)
	if not arg_79_0.galleryView then
		arg_79_0.galleryView = GalleryView.New(arg_79_0.galleryPanelContainer, arg_79_0.event, arg_79_0.contextData)

		arg_79_0.galleryView:RegisterView(arg_79_0)
		arg_79_0.galleryView:Reset()
		arg_79_0.galleryView:Load()
	end
end

function var_0_0.initMusicPanel(arg_80_0)
	if not arg_80_0.musicView then
		arg_80_0.musicView = MusicCollectionView.New(arg_80_0.musicPanelContainer, arg_80_0.event, arg_80_0.contextData)

		arg_80_0.musicView:Reset()
		arg_80_0.musicView:Load()
		pg.CriMgr.GetInstance():StopBGM()
	end
end

function var_0_0.initMangaPanel(arg_81_0)
	if not arg_81_0.mangaView then
		arg_81_0.mangaView = MangaView.New(arg_81_0.mangaPanelContainer, arg_81_0.event, arg_81_0.contextData)

		arg_81_0.mangaView:Reset()
		arg_81_0.mangaView:Load()
	end
end

function var_0_0.initEvents(arg_82_0)
	arg_82_0:bind(var_0_0.UPDATE_RED_POINT, function()
		arg_82_0:updateCollectNotices()
	end)
end

function var_0_0.onBackPressed(arg_84_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_84_0.bonusPanel.gameObject.activeSelf then
		arg_84_0:closeBonus()

		return
	end

	if arg_84_0.galleryView then
		if arg_84_0.galleryView:onBackPressed() == true then
			arg_84_0.galleryView:Destroy()

			arg_84_0.galleryView = nil
		else
			return
		end
	end

	if arg_84_0.musicView then
		if arg_84_0.musicView:onBackPressed() == true then
			arg_84_0.musicView:Destroy()

			arg_84_0.musicView = nil
		else
			return
		end
	end

	if arg_84_0.mangaView then
		if arg_84_0.mangaView:onBackPressed() == true then
			arg_84_0.mangaView:Destroy()

			arg_84_0.mangaView = nil
		else
			return
		end
	end

	triggerButton(arg_84_0.backBtn)
end

return var_0_0
