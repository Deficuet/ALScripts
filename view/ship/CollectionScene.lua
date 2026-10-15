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

function var_0_0.getResource(arg_3_0)
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

		for iter_8_0, iter_8_1 in ipairs(pg.music_album.all) do
			local var_8_1 = pg.music_album[iter_8_1].cover

			if var_8_1 and var_8_1 ~= "" then
				table.insert(var_8_0, MusicCollectionConst.MUSIC_COVER_PATH_PREFIX .. var_8_1)
			end
		end

		return var_8_0
	end

	return ResPathSupport.UniqueLuaArr(ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_3_0), var_3_0, var_3_1(), var_3_3(), var_3_2(), var_3_4()))
end

function var_0_0.setShipGroups(arg_9_0, arg_9_1)
	arg_9_0.shipGroups = arg_9_1
end

function var_0_0.setAwards(arg_10_0, arg_10_1)
	arg_10_0.awards = arg_10_1
end

function var_0_0.setCollectionRate(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_0.rate = arg_11_1
	arg_11_0.count = arg_11_2
	arg_11_0.totalCount = arg_11_3
end

function var_0_0.setLinkCollectionCount(arg_12_0, arg_12_1)
	arg_12_0.linkCount = arg_12_1
end

function var_0_0.setPlayer(arg_13_0, arg_13_1)
	arg_13_0.player = arg_13_1
end

function var_0_0.setProposeList(arg_14_0, arg_14_1)
	arg_14_0.proposeList = arg_14_1
end

function var_0_0.init(arg_15_0)
	arg_15_0:initEvents()

	arg_15_0.blurPanel = arg_15_0._tf:Find("blur_panel")
	arg_15_0.top = arg_15_0._tf:Find("blur_panel/adapt/top")
	arg_15_0.leftPanel = arg_15_0._tf:Find("blur_panel/adapt/left_length")
	arg_15_0.backBtn = findTF(arg_15_0.top, "back_btn")
	arg_15_0.contextData.toggle = arg_15_0.contextData.toggle or 2
	arg_15_0.toggles = {
		arg_15_0.leftPanel:Find("frame/tagRoot/card"),
		arg_15_0.leftPanel:Find("frame/tagRoot/display"),
		arg_15_0.leftPanel:Find("frame/tagRoot/trans"),
		arg_15_0.leftPanel:Find("frame/tagRoot/manga"),
		arg_15_0.leftPanel:Find("frame/tagRoot/gallery"),
		arg_15_0.leftPanel:Find("frame/tagRoot/music")
	}
	arg_15_0.toggleUpdates = {
		"initCardPanel",
		"initDisplayPanel",
		"initCardPanel",
		"initMangaPanel",
		"initGalleryPanel",
		"initMusicPanel"
	}
	arg_15_0.cardList = arg_15_0._tf:Find("main/list_card/scroll"):GetComponent("LScrollRect")

	function arg_15_0.cardList.onInitItem(arg_16_0)
		arg_15_0:onInitCard(arg_16_0)
	end

	function arg_15_0.cardList.onUpdateItem(arg_17_0, arg_17_1)
		arg_15_0:onUpdateCard(arg_17_0, arg_17_1)
	end

	function arg_15_0.cardList.onReturnItem(arg_18_0, arg_18_1)
		arg_15_0:onReturnCard(arg_18_0, arg_18_1)
	end

	arg_15_0.cardItems = {}
	arg_15_0.cardContent = tf(arg_15_0.cardList):Find("ships")
	arg_15_0.contextData.cardToggle = arg_15_0.contextData.cardToggle or 1
	arg_15_0.cardToggleGroup = arg_15_0._tf:Find("main/list_card/types")
	arg_15_0.cardToggles = {
		arg_15_0.cardToggleGroup:Find("char"),
		arg_15_0.cardToggleGroup:Find("link"),
		arg_15_0.cardToggleGroup:Find("blueprint"),
		arg_15_0.cardToggleGroup:Find("meta")
	}
	arg_15_0.cardList.decelerationRate = 0.07

	local var_15_0 = arg_15_0.cardContent:GetComponentInChildren(typeof(GridLayoutGroup))
	local var_15_1 = tf(arg_15_0.cardList).rect.width
	local var_15_2 = var_15_0.cellSize.x
	local var_15_3 = var_15_0.spacing.x
	local var_15_4 = var_15_1 - var_15_0.padding.left - var_15_0.padding.right
	local var_15_5 = var_15_2 + var_15_3

	if var_15_5 > 0 then
		local var_15_6 = math.floor((var_15_4 + var_15_3) / var_15_5)

		var_15_0.constraintCount = math.max(6, var_15_6)
	end

	arg_15_0.bonusPanel = arg_15_0._tf:Find("bonus_panel")
	arg_15_0.charTpl = arg_15_0:getTpl("chartpl")
	arg_15_0.tip = arg_15_0.toggles[2]:Find("tip")

	local var_15_7 = pg.storeup_data_template

	arg_15_0.favoriteVOs = {}

	for iter_15_0, iter_15_1 in ipairs(var_15_7.all) do
		local var_15_8 = Favorite.New({
			id = iter_15_0
		})

		table.insert(arg_15_0.favoriteVOs, var_15_8)
	end

	arg_15_0.memoryGroups = _.map(pg.memory_group.all, function(arg_19_0)
		return pg.memory_group[arg_19_0]
	end)
	arg_15_0.memories = nil
	arg_15_0.memoryList = arg_15_0._tf:Find("main/list_memory"):GetComponent("LScrollRect")

	function arg_15_0.memoryList.onInitItem(arg_20_0)
		arg_15_0:onInitMemory(arg_20_0)
	end

	function arg_15_0.memoryList.onUpdateItem(arg_21_0, arg_21_1)
		arg_15_0:onUpdateMemory(arg_21_0, arg_21_1)
	end

	function arg_15_0.memoryList.onReturnItem(arg_22_0, arg_22_1)
		arg_15_0:onReturnMemory(arg_22_0, arg_22_1)
	end

	arg_15_0.memoryViewport = arg_15_0._tf:Find("main/list_memory/viewport")
	arg_15_0.memoriesGrid = arg_15_0._tf:Find("main/list_memory/viewport/memories"):GetComponent(typeof(GridLayoutGroup))
	arg_15_0.memoryItems = {}

	local var_15_9 = tf(arg_15_0.memoryList):Find("memory")

	arg_15_0.memoryMask = arg_15_0._tf:Find("blur_panel/story_mask")

	setActive(var_15_9, false)
	setActive(arg_15_0.memoryMask, false)

	arg_15_0.memoryTogGroup = arg_15_0.top:Find("memory")

	setActive(arg_15_0.memoryTogGroup, false)

	arg_15_0.memoryToggles = {
		arg_15_0.top:Find("memory/0"),
		arg_15_0.top:Find("memory/1"),
		arg_15_0.top:Find("memory/2"),
		arg_15_0.top:Find("memory/3")
	}
	arg_15_0.memoryFilterIndex = {
		true,
		true,
		true
	}
	arg_15_0.galleryPanelContainer = arg_15_0._tf:Find("main/GalleryContainer")
	arg_15_0.musicPanelContainer = arg_15_0._tf:Find("main/MusicContainer")
	arg_15_0.mangaPanelContainer = arg_15_0._tf:Find("main/MangaContainer")

	arg_15_0:initIndexPanel()
end

function var_0_0.didEnter(arg_23_0)
	onButton(arg_23_0, arg_23_0.backBtn, function()
		arg_23_0.contextData.cardScrollValue = 0

		arg_23_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)

	arg_23_0.helpBtn = arg_23_0.leftPanel:Find("help_btn")

	onButton(arg_23_0, arg_23_0.helpBtn, function()
		if arg_23_0.contextData.toggle == var_0_0.MUSIC_INDEX then
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

	local var_23_0 = arg_23_0.top:Find("stamp")

	setActive(var_23_0, getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(arg_23_0, var_23_0, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(8)
	end, SFX_CONFIRM)

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.toggles) do
		if PLATFORM_CODE == PLATFORM_CH and (iter_23_0 == 1 or iter_23_0 == 3) and LOCK_COLLECTION then
			setActive(iter_23_1, false)
		else
			onToggle(arg_23_0, iter_23_1, function(arg_27_0)
				if arg_27_0 then
					if arg_23_0.contextData.toggle ~= iter_23_0 then
						if arg_23_0.contextData.toggle == var_0_0.SHIPCOLLECTION_INDEX then
							setActive(arg_23_0.helpBtn, false)

							if arg_23_0.bulinTip then
								arg_23_0.bulinTip.buffer:Hide()
							end

							if arg_23_0.contextData.cardToggle == 1 then
								arg_23_0.contextData.cardScrollValue = arg_23_0.cardList.value
							end
						end

						arg_23_0.contextData.toggle = iter_23_0

						if arg_23_0.toggleUpdates[iter_23_0] then
							arg_23_0[arg_23_0.toggleUpdates[iter_23_0]](arg_23_0)
							arg_23_0:calFavoriteRate()
						end
					end

					if iter_23_0 == var_0_0.SHIPCOLLECTION_INDEX then
						setActive(arg_23_0.helpBtn, true)

						local var_27_0 = getProxy(SettingsProxy)

						if not var_27_0:IsShowCollectionHelp() then
							triggerButton(arg_23_0.helpBtn)
							var_27_0:SetCollectionHelpFlag(true)
						end

						if arg_23_0.bulinTip then
							arg_23_0.bulinTip.buffer:Show()
						else
							arg_23_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_23_0, arg_23_0._tf:Find("main"))
						end
					end

					if iter_23_0 ~= var_0_0.MUSIC_INDEX then
						if arg_23_0.musicView and arg_23_0.musicView:CheckState(BaseSubView.STATES.INITED) then
							arg_23_0.musicView:tryPauseMusic()
							arg_23_0.musicView:closeAlbumListPanel()
						end

						pg.BgmMgr.GetInstance():ContinuePlay()
					elseif iter_23_0 == var_0_0.MUSIC_INDEX then
						pg.BgmMgr.GetInstance():StopPlay()

						if arg_23_0.musicView and arg_23_0.musicView:CheckState(BaseSubView.STATES.INITED) then
							arg_23_0.musicView:tryPlayMusic()
						end
					end
				end
			end, SFX_UI_TAG)
		end
	end

	for iter_23_2, iter_23_3 in ipairs(arg_23_0.memoryToggles) do
		onToggle(arg_23_0, iter_23_3, function(arg_28_0)
			if arg_28_0 then
				if iter_23_2 == 1 then
					arg_23_0.memoryFilterIndex = {
						true,
						true,
						true
					}
				else
					for iter_28_0 in ipairs(arg_23_0.memoryFilterIndex) do
						arg_23_0.memoryFilterIndex[iter_28_0] = iter_23_2 - 1 == iter_28_0
					end
				end

				arg_23_0:memoryFilter()
			end
		end, SFX_UI_TAG)
	end

	local var_23_1 = arg_23_0.contextData.toggle

	arg_23_0.contextData.toggle = -1

	triggerToggle(arg_23_0.toggles[var_23_1], true)

	local var_23_2 = arg_23_0.contextData.memoryGroup

	if var_23_2 and pg.memory_group[var_23_2] then
		arg_23_0:showSubMemories(pg.memory_group[var_23_2])
	else
		triggerToggle(arg_23_0.memoryToggles[1], true)
	end

	for iter_23_4, iter_23_5 in ipairs(arg_23_0.cardToggles) do
		triggerToggle(iter_23_5, arg_23_0.contextData.cardToggle == iter_23_4)
		onToggle(arg_23_0, iter_23_5, function(arg_29_0)
			if arg_29_0 and arg_23_0.contextData.cardToggle ~= iter_23_4 then
				if arg_23_0.contextData.cardToggle == 1 then
					arg_23_0.contextData.cardScrollValue = arg_23_0.cardList.value
				end

				arg_23_0.contextData.cardToggle = iter_23_4

				arg_23_0:initCardPanel()
				arg_23_0:calFavoriteRate()
			end
		end)
	end

	arg_23_0:calFavoriteRate()
	arg_23_0:OverlayPanel(arg_23_0.blurPanel)
	onButton(arg_23_0, arg_23_0.bonusPanel, function()
		arg_23_0:closeBonus()
	end, SFX_PANEL)
end

function var_0_0.updateCollectNotices(arg_31_0, arg_31_1)
	setActive(arg_31_0.tip, arg_31_1)
	setActive(arg_31_0.toggles[var_0_0.GALLERY_INDEX]:Find("tip"), getProxy(AppreciateProxy):isGalleryHaveNewRes())
	setActive(arg_31_0.toggles[var_0_0.MUSIC_INDEX]:Find("tip"), getProxy(AppreciateProxy):isMusicHaveNewRes())
	setActive(arg_31_0.toggles[var_0_0.MANGA_INDEX]:Find("tip"), getProxy(AppreciateProxy):isMangaHaveNewRes())
end

function var_0_0.calFavoriteRate(arg_32_0)
	local var_32_0 = arg_32_0.contextData.toggle == 1 and arg_32_0.contextData.cardToggle == 2

	setActive(arg_32_0.top:Find("total/char"), not var_32_0)
	setActive(arg_32_0.top:Find("total/link"), var_32_0)
	setText(arg_32_0.top:Find("total/char/rate/Text"), arg_32_0.rate * 100 .. "%")
	setText(arg_32_0.top:Find("total/char/count/Text"), arg_32_0.count .. "/" .. arg_32_0.totalCount)
	setText(arg_32_0.top:Find("total/link/count/Text"), arg_32_0.linkCount)
end

function var_0_0.initCardPanel(arg_33_0)
	local var_33_0 = arg_33_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/share/index_atlas", var_33_0, function(arg_34_0)
		setImageSprite(arg_33_0.indexBtn, arg_34_0, true)
	end)

	if arg_33_0.contextData.toggle == 1 then
		setActive(arg_33_0.cardToggleGroup, true)
		arg_33_0:cardFilter()
	elseif arg_33_0.contextData.toggle == 3 then
		setActive(arg_33_0.cardToggleGroup, false)
		arg_33_0:transFilter()
	end

	table.sort(arg_33_0.codeShips, function(arg_35_0, arg_35_1)
		return arg_35_0.index_id < arg_35_1.index_id
	end)
	arg_33_0.cardList:SetTotalCount(#arg_33_0.codeShips, arg_33_0.contextData.cardScrollValue or 0)
end

function var_0_0.initIndexPanel(arg_36_0)
	arg_36_0.indexBtn = arg_36_0.top:Find("index_button")

	onButton(arg_36_0, arg_36_0.indexBtn, function()
		local var_37_0 = Clone(var_0_0.ShipIndexData)

		if arg_36_0.contextData.toggle == 1 and arg_36_0.contextData.cardToggle == 2 then
			var_37_0.customPanels.campIndex = nil
			var_37_0.groupList[2] = nil
		end

		var_37_0.indexDatas = Clone(var_0_0.ShipIndex)

		function var_37_0.callback(arg_38_0)
			var_0_0.ShipIndex.typeIndex = arg_38_0.typeIndex

			if arg_38_0.campIndex then
				var_0_0.ShipIndex.campIndex = arg_38_0.campIndex
			end

			var_0_0.ShipIndex.rarityIndex = arg_38_0.rarityIndex
			var_0_0.ShipIndex.collExtraIndex = arg_38_0.collExtraIndex

			arg_36_0:initCardPanel()
		end

		arg_36_0:emit(var_0_0.ON_INDEX, var_37_0)
	end, SFX_PANEL)
end

function var_0_0.onInitCard(arg_39_0, arg_39_1)
	if arg_39_0.exited then
		return
	end

	local var_39_0 = CollectionShipCard.New(arg_39_1)

	onButton(arg_39_0, var_39_0.go, function()
		if not arg_39_0.isClicked then
			arg_39_0.isClicked = true

			LeanTween.delayedCall(0.2, System.Action(function()
				arg_39_0.isClicked = false

				if not var_39_0:getIsInited() then
					return
				end

				if var_39_0.state == ShipGroup.STATE_UNLOCK then
					arg_39_0.contextData.cardScrollValue = arg_39_0.cardList.value

					arg_39_0:emit(var_0_0.SHOW_DETAIL, var_39_0.showTrans, var_39_0.shipGroup.id)
				elseif var_39_0.state == ShipGroup.STATE_NOTGET then
					if var_39_0.showTrans == true and var_39_0.shipGroup.trans == true then
						return
					end

					if var_39_0.config then
						arg_39_0:showObtain(var_39_0.config.description, var_39_0.shipGroup:getShipConfigId())
					end
				end
			end))
		end
	end, SOUND_BACK)

	arg_39_0.cardItems[arg_39_1] = var_39_0
end

function var_0_0.showObtain(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = {
		type = MSGBOX_TYPE_OBTAIN,
		shipId = arg_42_2,
		list = arg_42_1,
		mediatorName = CollectionMediator.__cname
	}

	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		var_42_0.unknown_small = true
	end

	arg_42_0.contextData.cardScrollValue = arg_42_0.cardList.value

	pg.MsgboxMgr.GetInstance():ShowMsgBox(var_42_0)
end

function var_0_0.skipIn(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0.contextData.displayGroupId = arg_43_2

	triggerToggle(arg_43_0.toggles[arg_43_1], true)
end

function var_0_0.onUpdateCard(arg_44_0, arg_44_1, arg_44_2)
	if arg_44_0.exited then
		return
	end

	local var_44_0 = arg_44_0.cardItems[arg_44_2]

	if not var_44_0 then
		arg_44_0:onInitCard(arg_44_2)

		var_44_0 = arg_44_0.cardItems[arg_44_2]
	end

	local var_44_1 = arg_44_1 + 1
	local var_44_2 = arg_44_0.codeShips[var_44_1]

	if not var_44_2 then
		return
	end

	local var_44_3 = false

	if var_44_2.group then
		var_44_3 = arg_44_0.proposeList[var_44_2.group.id]
	end

	var_44_0:update(var_44_2.code, var_44_2.group, var_44_2.showTrans, var_44_3, var_44_2.id)
end

function var_0_0.onReturnCard(arg_45_0, arg_45_1, arg_45_2)
	if arg_45_0.exited then
		return
	end

	local var_45_0 = arg_45_0.cardItems[arg_45_2]

	if var_45_0 then
		var_45_0:clear()
	end
end

function var_0_0.cardFilter(arg_46_0)
	arg_46_0.codeShips = {}

	local var_46_0 = _.filter(pg.ship_data_group.all, function(arg_47_0)
		return pg.ship_data_group[arg_47_0].handbook_type == arg_46_0.contextData.cardToggle - 1
	end)

	table.sort(var_46_0)

	for iter_46_0, iter_46_1 in ipairs(var_46_0) do
		local var_46_1 = pg.ship_data_group[iter_46_1]
		local var_46_2 = arg_46_0.shipGroups[var_46_1.group_type] or ShipGroup.New({
			id = var_46_1.group_type
		})

		if ShipIndexConst.filterByType(var_46_2, var_0_0.ShipIndex.typeIndex) and (arg_46_0.contextData.cardToggle == 2 or ShipIndexConst.filterByCamp(var_46_2, var_0_0.ShipIndex.campIndex)) and arg_46_0.contextData.cardToggle == 4 == Nation.IsMeta(ShipGroup.getDefaultShipConfig(var_46_1.group_type).nationality) and ShipIndexConst.filterByRarity(var_46_2, var_0_0.ShipIndex.rarityIndex) and ShipIndexConst.filterByCollExtra(var_46_2, var_0_0.ShipIndex.collExtraIndex) then
			arg_46_0.codeShips[#arg_46_0.codeShips + 1] = {
				showTrans = false,
				id = iter_46_1,
				code = iter_46_1 - (arg_46_0.contextData.cardToggle - 1) * 10000,
				group = arg_46_0.shipGroups[var_46_1.group_type],
				index_id = var_46_1.index_id
			}
		end
	end
end

function var_0_0.transFilter(arg_48_0)
	arg_48_0.codeShips = {}

	local var_48_0 = _.filter(pg.ship_data_group.all, function(arg_49_0)
		return pg.ship_data_group[arg_49_0].handbook_type == 0
	end)

	table.sort(var_48_0)

	for iter_48_0, iter_48_1 in ipairs(var_48_0) do
		local var_48_1 = pg.ship_data_group[iter_48_1]

		if pg.ship_data_trans[var_48_1.group_type] then
			local var_48_2 = arg_48_0.shipGroups[var_48_1.group_type] or ShipGroup.New({
				remoulded = true,
				id = var_48_1.group_type
			})

			if ShipIndexConst.filterByType(var_48_2, var_0_0.ShipIndex.typeIndex) and ShipIndexConst.filterByCamp(var_48_2, var_0_0.ShipIndex.campIndex) and ShipIndexConst.filterByRarity(var_48_2, var_0_0.ShipIndex.rarityIndex) and ShipIndexConst.filterByCollExtra(var_48_2, var_0_0.ShipIndex.collExtraIndex) then
				arg_48_0.codeShips[#arg_48_0.codeShips + 1] = {
					showTrans = true,
					id = iter_48_1,
					code = 3000 + iter_48_1,
					group = var_48_2.trans and var_48_2 or nil,
					index_id = var_48_1.index_id
				}
			end
		end
	end
end

function var_0_0.sortDisplay(arg_50_0)
	table.sort(arg_50_0.favoriteVOs, function(arg_51_0, arg_51_1)
		local var_51_0 = arg_51_0:getState(arg_50_0.shipGroups, arg_50_0.awards)
		local var_51_1 = arg_51_1:getState(arg_50_0.shipGroups, arg_50_0.awards)

		if var_51_0 == var_51_1 then
			return arg_51_0.id < arg_51_1.id
		else
			return var_51_0 < var_51_1
		end
	end)

	local var_50_0 = 0
	local var_50_1 = arg_50_0.contextData.displayGroupId

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.favoriteVOs) do
		if iter_50_1:containShipGroup(var_50_1) then
			var_50_0 = iter_50_0

			break
		end
	end

	arg_50_0.displayRect:SetTotalCount(#arg_50_0.favoriteVOs, arg_50_0.displayRect:HeadIndexToValue(var_50_0 - 1))
end

function var_0_0.initDisplayPanel(arg_52_0)
	if not arg_52_0.isInitDisplay then
		arg_52_0.isInitDisplay = true
		arg_52_0.displayRect = arg_52_0._tf:Find("main/list_display"):GetComponent("LScrollRect")
		arg_52_0.displayRect.decelerationRate = 0.07

		function arg_52_0.displayRect.onInitItem(arg_53_0)
			arg_52_0:initFavoriteCard(arg_53_0)
		end

		function arg_52_0.displayRect.onUpdateItem(arg_54_0, arg_54_1)
			arg_52_0:updateFavoriteCard(arg_54_0, arg_54_1)
		end

		arg_52_0.favoriteCards = {}
	end

	arg_52_0:sortDisplay()
end

function var_0_0.initFavoriteCard(arg_55_0, arg_55_1)
	if arg_55_0.exited then
		return
	end

	local var_55_0 = FavoriteCard.New(arg_55_1, arg_55_0.charTpl)

	onButton(arg_55_0, var_55_0.awardTF, function()
		if var_55_0.state == Favorite.STATE_AWARD then
			arg_55_0:emit(var_0_0.GET_AWARD, var_55_0.favoriteVO.id, var_55_0.favoriteVO:getNextAwardIndex(var_55_0.awards))
		elseif var_55_0.state == Favorite.STATE_LOCK then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collection_lock"))
		elseif var_55_0.state == Favorite.STATE_FETCHED then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collection_fetched"))
		elseif var_55_0.state == Favorite.STATE_STATE_WAIT then
			pg.TipsMgr.GetInstance():ShowTips(i18n("collection_nostar"))
		end
	end, SFX_PANEL)
	onButton(arg_55_0, var_55_0.box, function()
		arg_55_0:openBonus(var_55_0.favoriteVO)
	end, SFX_PANEL)

	arg_55_0.favoriteCards[arg_55_1] = var_55_0
end

function var_0_0.updateFavoriteCard(arg_58_0, arg_58_1, arg_58_2)
	if arg_58_0.exited then
		return
	end

	local var_58_0 = arg_58_0.favoriteCards[arg_58_2]

	if not var_58_0 then
		arg_58_0:initFavoriteCard(arg_58_2)

		var_58_0 = arg_58_0.favoriteCards[arg_58_2]
	end

	local var_58_1 = arg_58_0.favoriteVOs[arg_58_1 + 1]

	var_58_0:update(var_58_1, arg_58_0.shipGroups, arg_58_0.awards)
end

function var_0_0.openBonus(arg_59_0, arg_59_1)
	if not arg_59_0.isInitBound then
		arg_59_0.isInitBound = true
		arg_59_0.boundName = findTF(arg_59_0.bonusPanel, "frame/name/Text"):GetComponent(typeof(Text))
		arg_59_0.progressSlider = findTF(arg_59_0.bonusPanel, "frame/process"):GetComponent(typeof(Slider))
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_59_0.bonusPanel)
	setActive(arg_59_0.bonusPanel, true)

	arg_59_0.boundName.text = arg_59_1:getConfig("name")

	local var_59_0 = arg_59_1:getConfig("award_display")
	local var_59_1 = arg_59_1:getConfig("level")

	for iter_59_0, iter_59_1 in ipairs(var_59_1) do
		local var_59_2 = var_59_0[iter_59_0]
		local var_59_3 = findTF(arg_59_0.bonusPanel, "frame/awards/award" .. iter_59_0)

		setText(findTF(var_59_3, "process"), iter_59_1)

		local var_59_4 = arg_59_1:getAwardState(arg_59_0.shipGroups, arg_59_0.awards, iter_59_0)

		setActive(findTF(var_59_3, "item_tpl/unfinish"), var_59_4 == Favorite.STATE_WAIT)
		setActive(findTF(var_59_3, "item_tpl/get"), var_59_4 == Favorite.STATE_AWARD)
		setActive(findTF(var_59_3, "item_tpl/got"), var_59_4 == Favorite.STATE_FETCHED)
		setActive(findTF(var_59_3, "item_tpl/lock"), var_59_4 == Favorite.STATE_LOCK)
		setActive(findTF(var_59_3, "item_tpl/icon_bg"), var_59_4 ~= Favorite.STATE_LOCK)
		setActive(findTF(var_59_3, "item_tpl/bg"), var_59_4 ~= Favorite.STATE_LOCK)

		if var_59_2 then
			local var_59_5 = {
				count = 0,
				type = var_59_2[1],
				id = var_59_2[2]
			}

			updateDrop(findTF(var_59_3, "item_tpl"), var_59_5)

			var_59_5.count = var_59_2[3]

			onButton(arg_59_0, var_59_3, function()
				arg_59_0:emit(var_0_0.ON_DROP, var_59_5)
			end, SFX_PANEL)
		else
			GetOrAddComponent(var_59_3, typeof(Button)).onClick:RemoveAllListeners()
		end
	end

	local var_59_6 = arg_59_1:getStarCount(arg_59_0.shipGroups)

	arg_59_0.progressSlider.value = var_59_6 / var_59_1[#var_59_1]
end

function var_0_0.closeBonus(arg_61_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_61_0.bonusPanel, arg_61_0._tf)
	setActive(arg_61_0.bonusPanel, false)
end

function var_0_0.showSubMemories(arg_62_0, arg_62_1)
	arg_62_0.contextData.memoryGroup = arg_62_1.id
	arg_62_0.memories = _.map(arg_62_1.memories, function(arg_63_0)
		return pg.memory_template[arg_63_0]
	end)

	for iter_62_0 in ipairs(arg_62_0.memories) do
		arg_62_0.memories[iter_62_0].index = iter_62_0
	end

	arg_62_0.memoryList:SetTotalCount(#arg_62_0.memories, 0)
	setActive(arg_62_0.top:Find("memory"), false)
end

local var_0_1 = 3

function var_0_0.return2MemoryGroup(arg_64_0)
	local var_64_0 = arg_64_0.contextData.memoryGroup

	arg_64_0.contextData.memoryGroup = nil
	arg_64_0.memories = nil

	local var_64_1 = 0

	if var_64_0 then
		local var_64_2 = 0

		for iter_64_0, iter_64_1 in ipairs(arg_64_0.memoryGroups) do
			if iter_64_1.id == var_64_0 then
				var_64_2 = iter_64_0

				break
			end
		end

		if var_64_2 >= 0 then
			local var_64_3 = arg_64_0.memoryList
			local var_64_4 = arg_64_0.memoriesGrid.cellSize.y + arg_64_0.memoriesGrid.spacing.y
			local var_64_5 = var_64_4 * math.ceil(#arg_64_0.memoryGroups / var_0_1)

			var_64_1 = (var_64_4 * math.floor((var_64_2 - 1) / var_0_1) + var_64_3.paddingFront) / (var_64_5 - arg_64_0.memoryViewport.rect.height)
			var_64_1 = Mathf.Clamp01(var_64_1)
		end
	end

	arg_64_0.memoryList:SetTotalCount(#arg_64_0.memoryGroups, var_64_1)
	setActive(arg_64_0.top:Find("memory"), true)
end

function var_0_0.initMemoryPanel(arg_65_0)
	local var_65_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.QIXI_ACTIVITY_ID)

	if var_65_0 and not var_65_0:isEnd() then
		local var_65_1 = var_65_0:getConfig("config_data")
		local var_65_2 = _.flatten(var_65_1)
		local var_65_3 = var_65_2[#var_65_2]
		local var_65_4 = getProxy(TaskProxy):getTaskById(var_65_3)

		if var_65_4 and not var_65_4:isFinish() then
			pg.NewStoryMgr.GetInstance():Play("HOSHO8", function()
				arg_65_0:emit(CollectionScene.ACTIVITY_OP, {
					cmd = 2,
					activity_id = var_65_0.id
				})
			end, true)
		end
	end

	arg_65_0:memoryFilter()
end

function var_0_0.onInitMemory(arg_67_0, arg_67_1)
	if arg_67_0.exited then
		return
	end

	local var_67_0 = MemoryCard.New(arg_67_1)

	onButton(arg_67_0, var_67_0.go, function()
		if var_67_0.info then
			if var_67_0.isGroup then
				arg_67_0:showSubMemories(var_67_0.info)
			elseif var_67_0.info.is_open == 1 or pg.NewStoryMgr.GetInstance():IsPlayed(var_67_0.info.unlock_pre, true) then
				arg_67_0:playMemory(var_67_0.info)
			end
		end
	end, SOUND_BACK)

	arg_67_0.memoryItems[arg_67_1] = var_67_0
end

function var_0_0.onUpdateMemory(arg_69_0, arg_69_1, arg_69_2)
	if arg_69_0.exited then
		return
	end

	local var_69_0 = arg_69_0.memoryItems[arg_69_2]

	if not var_69_0 then
		arg_69_0:onInitMemory(arg_69_2)

		var_69_0 = arg_69_0.memoryItems[arg_69_2]
	end

	if arg_69_0.memories then
		var_69_0:update(false, arg_69_0.memories[arg_69_1 + 1])
	else
		var_69_0:update(true, arg_69_0.memoryGroups[arg_69_1 + 1])
	end

	local var_69_1 = {
		var_69_0.lock,
		var_69_0.normal,
		var_69_0.group
	}

	_.any(var_69_1, function(arg_70_0)
		local var_70_0 = isActive(arg_70_0)

		if var_70_0 then
			var_69_0.go:GetComponent(typeof(Button)).targetGraphic = arg_70_0:GetComponent(typeof(Image))
		end

		return var_70_0
	end)
end

function var_0_0.onReturnMemory(arg_71_0, arg_71_1, arg_71_2)
	if arg_71_0.exited then
		return
	end

	local var_71_0 = arg_71_0.memoryItems[arg_71_2]

	if var_71_0 then
		var_71_0:clear()
	end
end

function var_0_0.playMemory(arg_72_0, arg_72_1)
	if arg_72_1.type == 1 then
		local var_72_0 = findTF(arg_72_0.memoryMask, "pic")

		if string.len(arg_72_1.mask) > 0 then
			setActive(var_72_0, true)

			var_72_0:GetComponent(typeof(Image)).sprite = LoadSprite(arg_72_1.mask)
		else
			setActive(var_72_0, false)
		end

		setActive(arg_72_0.memoryMask, true)
		pg.NewStoryMgr.GetInstance():Play(arg_72_1.story, function()
			setActive(arg_72_0.memoryMask, false)
		end, true)
	elseif arg_72_1.type == 2 then
		local var_72_1 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_72_1.story)

		arg_72_0:emit(var_0_0.BEGIN_STAGE, {
			memory = true,
			system = SYSTEM_PERFORM,
			stageId = var_72_1
		})
	end
end

function var_0_0.memoryFilter(arg_74_0)
	arg_74_0.memoryGroups = {}

	for iter_74_0, iter_74_1 in ipairs(pg.memory_group.all) do
		local var_74_0 = pg.memory_group[iter_74_1]

		if arg_74_0.memoryFilterIndex[var_74_0.type] then
			table.insert(arg_74_0.memoryGroups, var_74_0)
		end
	end

	table.sort(arg_74_0.memoryGroups, function(arg_75_0, arg_75_1)
		return arg_75_0.id < arg_75_1.id
	end)
	arg_74_0.memoryList:SetTotalCount(#arg_74_0.memoryGroups, 0)
end

function var_0_0.willExit(arg_76_0)
	if arg_76_0.bulinTip then
		arg_76_0.bulinTip:Destroy()

		arg_76_0.bulinTip = nil
	end

	if arg_76_0.tweens then
		cancelTweens(arg_76_0.tweens)
	end

	arg_76_0:UnOverlayPanel(arg_76_0.blurPanel, arg_76_0._tf)

	if arg_76_0.bonusPanel.gameObject.activeSelf then
		arg_76_0:closeBonus()
	end

	Destroy(arg_76_0.bonusPanel)

	arg_76_0.bonusPanel = nil

	for iter_76_0, iter_76_1 in pairs(arg_76_0.cardItems) do
		iter_76_1:clear()
	end

	if arg_76_0.resPanel then
		arg_76_0.resPanel:exit()

		arg_76_0.resPanel = nil
	end

	if arg_76_0.galleryView then
		arg_76_0.galleryView:Destroy()

		arg_76_0.galleryView = nil
	end

	if arg_76_0.musicView then
		arg_76_0.musicView:Destroy()

		arg_76_0.musicView = nil
	end

	if arg_76_0.mangaView then
		arg_76_0.mangaView:Destroy()

		arg_76_0.mangaView = nil
	end
end

function var_0_0.initGalleryPanel(arg_77_0)
	if not arg_77_0.galleryView then
		arg_77_0.galleryView = GalleryView.New(arg_77_0.galleryPanelContainer, arg_77_0.event, arg_77_0.contextData)

		arg_77_0.galleryView:RegisterView(arg_77_0)
		arg_77_0.galleryView:Reset()
		arg_77_0.galleryView:Load()
	end
end

function var_0_0.initMusicPanel(arg_78_0)
	if not arg_78_0.musicView then
		arg_78_0.musicView = MusicCollectionView.New(arg_78_0.musicPanelContainer, arg_78_0.event, arg_78_0.contextData)

		arg_78_0.musicView:Reset()
		arg_78_0.musicView:Load()
		pg.CriMgr.GetInstance():StopBGM()
	end
end

function var_0_0.initMangaPanel(arg_79_0)
	if not arg_79_0.mangaView then
		arg_79_0.mangaView = MangaView.New(arg_79_0.mangaPanelContainer, arg_79_0.event, arg_79_0.contextData)

		arg_79_0.mangaView:Reset()
		arg_79_0.mangaView:Load()
	end
end

function var_0_0.initEvents(arg_80_0)
	arg_80_0:bind(var_0_0.UPDATE_RED_POINT, function()
		arg_80_0:updateCollectNotices()
	end)
end

function var_0_0.onBackPressed(arg_82_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_82_0.bonusPanel.gameObject.activeSelf then
		arg_82_0:closeBonus()

		return
	end

	if arg_82_0.galleryView then
		if arg_82_0.galleryView:onBackPressed() == true then
			arg_82_0.galleryView:Destroy()

			arg_82_0.galleryView = nil
		else
			return
		end
	end

	if arg_82_0.musicView then
		if arg_82_0.musicView:onBackPressed() == true then
			arg_82_0.musicView:Destroy()

			arg_82_0.musicView = nil
		else
			return
		end
	end

	if arg_82_0.mangaView then
		if arg_82_0.mangaView:onBackPressed() == true then
			arg_82_0.mangaView:Destroy()

			arg_82_0.mangaView = nil
		else
			return
		end
	end

	triggerButton(arg_82_0.backBtn)
end

return var_0_0
