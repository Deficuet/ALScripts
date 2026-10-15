local var_0_0 = class("DockyardScene", import("..base.BaseUI"))
local var_0_1 = 2
local var_0_2 = 0.2
local var_0_3 = 1

var_0_0.MODE_OVERVIEW = "overview"
var_0_0.MODE_DESTROY = "destroy"
var_0_0.MODE_SELECT = "select"
var_0_0.MODE_MOD = "modify"
var_0_0.MODE_WORLD = "world"
var_0_0.MODE_REMOULD = "remould"
var_0_0.MODE_UPGRADE = "upgrade"
var_0_0.MODE_GUILD_BOSS = "guildboss"
var_0_0.MODE_SHIP_PHANTOM = "phantom"
var_0_0.TITLE_CN_OVERVIEW = i18n("word_dockyard")
var_0_0.TITLE_CN_UPGRADE = i18n("word_dockyardUpgrade")
var_0_0.TITLE_CN_DESTROY = i18n("word_dockyardDestroy")
var_0_0.TITLE_EN_OVERVIEW = "dockyard"
var_0_0.TITLE_EN_UPGRADE = "modernization"
var_0_0.TITLE_EN_DESTROY = "retirement"
var_0_0.PRIOR_MODE_EQUIP_UP = 1
var_0_0.PRIOR_MODE_SHIP_UP = 2

function var_0_0.getUIName(arg_1_0)
	return "DockyardUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/dockyardui_atlas",
		"energy",
		"shipstatus",
		"shipframe",
		"shiptype",
		"ui/proposeshipcard",
		"ui/heartshipcard",
		"shipYardIcon/unknown",
		"ui/iconcolorful",
		"ui/recordablesearchbarui"
	}

	table.insertto(var_2_0, arg_2_0:getDockyardShipResList())

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.getDockyardShipResList(arg_3_0)
	local var_3_0 = arg_3_0.contextData
	local var_3_1 = {}
	local var_3_2 = {}

	if var_3_0 and var_3_0.shipVOs then
		for iter_3_0, iter_3_1 in ipairs(var_3_0.shipVOs) do
			var_3_2[iter_3_1.id] = iter_3_1
		end
	elseif var_3_0 and var_3_0.mode == var_0_0.MODE_WORLD then
		for iter_3_2, iter_3_3 in ipairs(nowWorld():GetShipVOs()) do
			var_3_2[iter_3_3.id] = iter_3_3
		end
	else
		local var_3_3 = getProxy(BayProxy)

		for iter_3_4, iter_3_5 in pairs(var_3_3.data) do
			var_3_2[iter_3_4] = iter_3_5
		end
	end

	if var_3_0 and var_3_0.ignoredIds then
		for iter_3_6, iter_3_7 in ipairs(var_3_0.ignoredIds) do
			var_3_2[iter_3_7] = nil
		end
	end

	for iter_3_8, iter_3_9 in pairs(var_3_2) do
		arg_3_0:insertDockyardShipItemRes(var_3_1, iter_3_9)
	end

	if var_3_0 and var_3_0.mode == var_0_0.MODE_SHIP_PHANTOM then
		local var_3_4 = getProxy(TechnologyProxy)
		local var_3_5 = getProxy(BayProxy)

		for iter_3_10, iter_3_11 in ipairs(var_3_4:getAllBluePrintShipIds()) do
			local var_3_6 = var_3_5:getShipById(iter_3_11)

			if var_3_6 and #var_3_6:getAllShipPhantomMarks() > 1 then
				_.each(var_3_6:getAllShipPhantom(), function(arg_4_0)
					local var_4_0 = ResPathSupport.GetPaintingShipYardIconListByPaintingName(arg_4_0:getPainting())

					table.insertto(var_3_1, var_4_0)
				end)
			end
		end
	end

	return var_3_1
end

function var_0_0.insertDockyardShipItemRes(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = string.format(ResPathSupport.ConstPath.BG.ShipCard, arg_5_2:rarity2bgPrint())

	table.insert(arg_5_1, var_5_0)

	local var_5_1 = ResPathSupport.GetPaintingShipYardIconListByPaintingName(arg_5_2:getPainting())

	table.insertto(arg_5_1, var_5_1)

	local var_5_2, var_5_3 = arg_5_2:GetFrameAndEffect()
	local var_5_4 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, var_5_3)

	table.insert(arg_5_1, var_5_4)

	local var_5_5 = arg_5_2.user

	if var_5_5 then
		local var_5_6 = Ship.New({
			configId = var_5_5.icon
		}):getPrefab()
		local var_5_7 = ResPathSupport.GetSpineQIconListByPrefabName(var_5_6)

		table.insertto(arg_5_1, var_5_7)

		local var_5_8 = AttireFrame.attireFrameRes(var_5_5, false, AttireConst.TYPE_ICON_FRAME, var_5_5.propose)
		local var_5_9 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.IconFrame, var_5_8)

		table.insert(arg_5_1, var_5_9)
	end
end

function var_0_0.init(arg_6_0)
	local var_6_0 = arg_6_0.contextData

	var_6_0.mode = defaultValue(var_6_0.mode, var_0_0.MODE_SELECT)
	var_6_0.otherSelectedIds = defaultValue(var_6_0.otherSelectedIds, {})
	arg_6_0.teamTypeFilter = var_6_0.teamFilter
	arg_6_0.selectedMin = var_6_0.selectedMin or 1
	arg_6_0.leastLimitMsg = var_6_0.leastLimitMsg
	arg_6_0.selectedMax = var_6_0.selectedMax or 0
	var_6_0.selectedIds = var_6_0.selectedIds or {}

	if var_6_0.infoShipId then
		table.insert(var_6_0.selectedIds, var_6_0.infoShipId)

		var_6_0.infoShipId = nil
	end

	arg_6_0.selectedIds = underscore(var_6_0.selectedIds):chain():select(function(arg_7_0)
		return getProxy(BayProxy):RawGetShipById(arg_7_0) ~= nil
	end):first(arg_6_0.selectedMax):value()
	var_6_0.selectedIds = nil
	arg_6_0.checkShip = var_6_0.onShip or function(arg_8_0, arg_8_1, arg_8_2)
		return true
	end
	arg_6_0.onCancelShip = var_6_0.onCancelShip or function(arg_9_0, arg_9_1, arg_9_2)
		return true
	end
	arg_6_0.onClick = var_6_0.onClick or function(arg_10_0, arg_10_1, arg_10_2)
		arg_6_0:emit(DockyardMediator.ON_SHIP_DETAIL, arg_10_0, arg_10_1, arg_10_2)
	end
	arg_6_0.confirmSelect = var_6_0.confirmSelect
	arg_6_0.callbackQuit = var_6_0.callbackQuit
	arg_6_0.onSelected = var_6_0.onSelected or function(arg_11_0, arg_11_1)
		warning("not implemented.")
	end
	arg_6_0.blurPanel = arg_6_0._tf:Find("blur_panel")
	arg_6_0.settingBtn = arg_6_0.blurPanel:Find("adapt/left_length/frame/setting")
	arg_6_0.settingPanel = DockyardQuickSelectSettingPage.New(arg_6_0._tf, arg_6_0.event)

	arg_6_0.settingPanel:OnSettingChanged(function()
		arg_6_0:unselecteAllShips()
	end)

	arg_6_0.topPanel = arg_6_0.blurPanel:Find("adapt/top")
	arg_6_0.sortBtn = arg_6_0.topPanel:Find("sort_button")
	arg_6_0.sortImgAsc = arg_6_0.sortBtn:Find("asc")
	arg_6_0.sortImgDesc = arg_6_0.sortBtn:Find("desc")
	arg_6_0.leftTipsText = arg_6_0.topPanel:Find("capacity")

	onButton(arg_6_0, arg_6_0.leftTipsText:Find("switch"), function()
		arg_6_0.isCapacityMeta = not arg_6_0.isCapacityMeta

		arg_6_0:updateCapacityDisplay()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.leftTipsText:Find("plus"), function()
		gotoChargeScene()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.leftTipsText:Find("tip"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("specialshipyard_tip")
		})
	end, SFX_PANEL)
	setActive(arg_6_0.leftTipsText, false)

	arg_6_0.indexBtn = arg_6_0.topPanel:Find("index_button")
	arg_6_0.switchPanel = arg_6_0.topPanel:Find("switch")
	arg_6_0.preferenceAndAttrContainer = arg_6_0.switchPanel:Find("toggles")
	arg_6_0.preferenceBtn = arg_6_0.switchPanel:Find("toggles/preference_toggle")
	arg_6_0.attrBtn = arg_6_0.switchPanel:Find("toggles/attr_toggle")
	arg_6_0.modLockFilter = arg_6_0.topPanel:Find("mod_flter_lock")
	arg_6_0.modLeveFilter = arg_6_0.topPanel:Find("mod_flter_level")
	arg_6_0.energyDescTF = arg_6_0._tf:Find("energy_desc")
	arg_6_0.energyDescTextTF = arg_6_0.energyDescTF:Find("Text")
	arg_6_0.selectPanel = arg_6_0.blurPanel:Find("select_panel_adapt/select_panel")
	arg_6_0.selectPanelBg = arg_6_0.blurPanel:Find("select_panel_bg")
	arg_6_0.bottomTipsText = arg_6_0.selectPanel:Find("tip")
	arg_6_0.bottomTipsWithFrame = arg_6_0.selectPanel:Find("tipwithframe")

	setText(arg_6_0.selectPanel:Find("bottom_info/bg_input/selected"), i18n("disassemble_selected") .. ":")

	arg_6_0.awardTF = arg_6_0.selectPanel:Find("bottom_info/bg_award")

	setText(arg_6_0.awardTF:Find("label"), i18n("disassemble_available") .. ":")

	arg_6_0.modAttrsTF = arg_6_0.selectPanel:Find("bottom_info/bg_mod")
	arg_6_0.viewEquipmentBtn = arg_6_0.selectPanel:Find("view_equipments")
	arg_6_0.tipPanel = arg_6_0.blurPanel:Find("TipPanel")

	setActive(arg_6_0.tipPanel, false)

	arg_6_0.worldPanel = arg_6_0.blurPanel:Find("world_port_panel")

	setActive(arg_6_0.worldPanel, arg_6_0.contextData.mode == var_0_0.MODE_WORLD)

	arg_6_0.assultBtn = arg_6_0.blurPanel:Find("adapt/top/assult_btn")
	arg_6_0.stampBtn = arg_6_0.topPanel:Find("stamp")
	arg_6_0.isRemouldOrUpgradeMode = arg_6_0.contextData.mode == var_0_0.MODE_REMOULD or arg_6_0.contextData.mode == var_0_0.MODE_UPGRADE

	setActive(arg_6_0.modLeveFilter, arg_6_0.isRemouldOrUpgradeMode)
	setActive(arg_6_0.modLockFilter, arg_6_0.isRemouldOrUpgradeMode)
	setActive(arg_6_0.assultBtn, arg_6_0.contextData.mode == var_0_0.MODE_GUILD_BOSS)
	switch(arg_6_0.contextData.mode, {
		[var_0_0.MODE_OVERVIEW] = function()
			arg_6_0.selecteEnabled = false
		end,
		[var_0_0.MODE_DESTROY] = function()
			arg_6_0.selecteEnabled = true
			arg_6_0.blacklist = {}
			arg_6_0.destroyResList = UIItemList.New(arg_6_0.awardTF:Find("res_list"), arg_6_0.awardTF:Find("res_list/res"))
		end,
		[var_0_0.MODE_MOD] = function()
			arg_6_0.selecteEnabled = true

			setText(arg_6_0.modAttrsTF:Find("title/Text"), i18n("word_mod_value"))

			arg_6_0.modAttrContainer = arg_6_0.modAttrsTF:Find("attrs")
		end,
		[var_0_0.MODE_SHIP_PHANTOM] = function()
			arg_6_0.selecteEnabled = false
		end
	}, function()
		arg_6_0.selecteEnabled = true
	end)

	local var_6_1 = arg_6_0.selecteEnabled and arg_6_0.contextData.mode ~= var_0_0.MODE_WORLD

	setActive(arg_6_0.selectPanel, var_6_1)
	setActive(arg_6_0.selectPanelBg, var_6_1)
	setActive(arg_6_0.worldPanel, arg_6_0.contextData.mode == var_0_0.MODE_WORLD)

	local var_6_2 = arg_6_0.contextData.mode == var_0_0.MODE_DESTROY

	setActive(arg_6_0.settingBtn, var_6_2)
	setActive(arg_6_0.selectPanel:Find("quick_select"), var_6_2)

	if arg_6_0.contextData.priorEquipUpShipIDList and arg_6_0.contextData.priorMode then
		setActive(arg_6_0.tipPanel, true)

		local var_6_3 = arg_6_0.tipPanel:Find("EquipUP")
		local var_6_4 = arg_6_0.tipPanel:Find("ShipUP")

		setText(var_6_3, i18n("fightfail_choiceequip"))
		setText(var_6_4, i18n("fightfail_choicestrengthen"))
		setActive(var_6_3, arg_6_0.contextData.priorMode == var_0_0.PRIOR_MODE_EQUIP_UP)
		setActive(var_6_4, arg_6_0.contextData.priorMode == var_0_0.PRIOR_MODE_SHIP_UP)
	end

	arg_6_0.togglePhantom = arg_6_0._tf:Find("blur_panel/adapt/left_length/frame/toggle_phantom")

	onToggle(arg_6_0, arg_6_0.togglePhantom, function(arg_21_0)
		if arg_6_0.inPhantom ~= arg_21_0 then
			arg_6_0.inPhantom = arg_21_0

			arg_6_0:SwitchContainerDisplay()
		end
	end, SFX_PANEL)
	setActive(arg_6_0.togglePhantom, false)

	arg_6_0.helpPhantom = arg_6_0._tf:Find("blur_panel/adapt/left_length/frame/help_phantom")

	onButton(arg_6_0, arg_6_0.helpPhantom, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("projection_help")
		})
	end, SFX_PANEL)

	local var_6_5 = arg_6_0.contextData.mode == var_0_0.MODE_SHIP_PHANTOM and "phantom" or "dockyard"

	eachChild(arg_6_0.topPanel:Find("titles"), function(arg_23_0, arg_23_1)
		setActive(arg_23_0, arg_23_0.name == var_6_5)
	end)

	arg_6_0.listEmptyTF = arg_6_0._tf:Find("empty")

	setActive(arg_6_0.listEmptyTF, false)

	arg_6_0.listEmptyTxt = arg_6_0.listEmptyTF:Find("Text")

	setText(arg_6_0.listEmptyTxt, i18n("list_empty_tip_dockyardui"))

	arg_6_0.destroyPage = ShipDestroyPage.New(arg_6_0._tf, arg_6_0.event)

	arg_6_0.destroyPage:SetCardClickCallBack(function(arg_24_0)
		arg_6_0.blacklist[arg_24_0.shipVO:getGroupId()] = true

		local var_24_0 = table.indexof(arg_6_0.selectedIds, arg_24_0.shipVO.id)

		if var_24_0 and var_24_0 > 0 then
			table.remove(arg_6_0.selectedIds, var_24_0)
		end

		arg_6_0:updateDestroyRes()
		arg_6_0:updateSelected()
	end)
	arg_6_0.destroyPage:SetConfirmCallBack(function()
		local var_25_0 = {}
		local var_25_1, var_25_2 = arg_6_0:checkDestroyGold()

		if not var_25_2 then
			table.insert(var_25_0, function(arg_26_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire_1"),
					onYes = arg_26_0
				})
			end)
		end

		local var_25_3 = underscore.map(arg_6_0.selectedIds, function(arg_27_0)
			return arg_6_0.shipVOsById[arg_27_0]
		end)

		table.insert(var_25_0, function(arg_28_0)
			arg_6_0:checkDestroyShips(var_25_3, arg_28_0)
		end)
		seriesAsync(var_25_0, function()
			arg_6_0:emit(DockyardMediator.ON_DESTROY_SHIPS, arg_6_0.selectedIds)
		end)
	end)

	arg_6_0.destroyConfirmWindow = ShipDestoryConfirmWindow.New(arg_6_0._tf, arg_6_0.event)
	arg_6_0.searchBar = RecordableSearchBar.New(RecordableSearchBar.CreateData({
		refresh_pos_when_expand = true,
		holder = i18n("dockyard_search_holder"),
		onActive = function(arg_30_0)
			setActive(arg_6_0.preferenceAndAttrContainer, not arg_30_0)
		end,
		onInputChanged = function()
			arg_6_0:filter()
		end,
		key = arg_6_0.__cname,
		parent = arg_6_0.switchPanel,
		expand_parent = arg_6_0.blurPanel:Find("adapt"),
		anchoredPosition = Vector3(-33, -33, 0)
	}))
end

function var_0_0.SwitchContainerDisplay(arg_32_0)
	arg_32_0.isPhantomMode = arg_32_0.contextData.mode == var_0_0.MODE_SHIP_PHANTOM or arg_32_0.inPhantom

	setActive(arg_32_0.switchPanel, not arg_32_0.isRemouldOrUpgradeMode and not arg_32_0.isPhantomMode)
	setActive(arg_32_0.indexBtn, not arg_32_0.isRemouldOrUpgradeMode and not arg_32_0.isPhantomMode)
	setActive(arg_32_0.sortBtn, not arg_32_0.isRemouldOrUpgradeMode and not arg_32_0.isPhantomMode)
	setActive(arg_32_0._tf:Find("main/ship_container"), not arg_32_0.isPhantomMode)
	setActive(arg_32_0._tf:Find("main/phantom_container"), arg_32_0.isPhantomMode)
	setActive(arg_32_0.preferenceBtn, not arg_32_0.isPhantomMode)
	arg_32_0:updateBarInfo()
	setActive(arg_32_0.helpPhantom, arg_32_0.contextData.mode == var_0_0.MODE_SHIP_PHANTOM)

	if pg.SeriesGuideMgr.GetInstance():isEnd() and PlayerPrefs.GetInt("PHANTOM_HELP_FIRST", 0) == 0 then
		PlayerPrefs.SetInt("PHANTOM_HELP_FIRST", 1)
		triggerButton(arg_32_0.helpPhantom)
	end

	switch(tobool(arg_32_0.isPhantomMode), {
		[true] = function()
			arg_32_0.initDic = arg_32_0.initDic or {}

			if arg_32_0.initDic.phantom then
				return
			end

			arg_32_0.initDic.phantom = true

			local var_33_0 = getProxy(TechnologyProxy)
			local var_33_1 = arg_32_0._tf:Find("main/phantom_container/title/content")
			local var_33_2 = var_33_0:getConfigMaxVersion()

			UIItemList.StaticAlign(var_33_1, var_33_1:GetChild(0), var_33_2 + 1, function(arg_34_0, arg_34_1, arg_34_2)
				if arg_34_0 == UIItemList.EventUpdate then
					arg_34_2.name = "phase_" .. arg_34_1

					GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", arg_34_1, arg_34_2:Find("on"))
					GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", arg_34_1, arg_34_2:Find("off"))
					onToggle(arg_32_0, arg_34_2, function(arg_35_0)
						if arg_35_0 then
							arg_32_0.selectVersion = arg_34_1
							arg_32_0.filterBluePrint = underscore.filter(arg_32_0.shipBluePrints, function(arg_36_0)
								return arg_34_1 == 0 or arg_36_0:getConfig("blueprint_version") == arg_34_1
							end)

							arg_32_0.phantomContainer:SetTotalCount(#arg_32_0.filterBluePrint, 0)
						end
					end, SFX_PANEL)
				end
			end)
			setActive(arg_32_0._tf:Find("main/phantom_container/view/tpl"), false)

			arg_32_0.phantomContainer = arg_32_0._tf:Find("main/phantom_container/view/groups"):GetComponent("LScrollRect")
			arg_32_0.phantomContainer.enabled = true
			arg_32_0.phantomContainer.decelerationRate = 0.07

			function arg_32_0.phantomContainer.onInitItem(arg_37_0)
				arg_32_0:getOrInitPhantom(arg_37_0)
				ClearTweenItemAlphaAndWhite(arg_37_0)
			end

			function arg_32_0.phantomContainer.onUpdateItem(arg_38_0, arg_38_1)
				arg_32_0:updatePhantomGroup(arg_32_0.filterBluePrint[arg_38_0 + 1], arg_38_1)
				TweenItemAlphaAndWhite(arg_38_1)
			end

			function arg_32_0.phantomContainer.onReturnItem(arg_39_0, arg_39_1)
				if arg_32_0.exited then
					return
				end

				arg_32_0:getOrInitPhantom(arg_39_1):clear()
				ClearTweenItemAlphaAndWhite(arg_39_1)
			end

			arg_32_0.scrollPhantoms = {}
			arg_32_0.phantomGroupDic = {}

			local var_33_3 = 0

			if arg_32_0.contextData.techVersion and #underscore.filter(arg_32_0.shipBluePrints, function(arg_40_0)
				return arg_32_0.contextData.techVersion == 0 or arg_40_0:getConfig("blueprint_version") == arg_32_0.contextData.techVersion
			end) > 0 then
				var_33_3 = arg_32_0.contextData.techVersion
			end

			arg_32_0.contextData.techVersion = nil

			triggerToggle(arg_32_0._tf:Find("main/phantom_container/title/content"):GetChild(var_33_3), true)
		end,
		[false] = function()
			arg_32_0.initDic = arg_32_0.initDic or {}

			if arg_32_0.initDic.ship then
				return
			end

			arg_32_0.initDic.ship = true
			arg_32_0.shipContainer = arg_32_0._tf:Find("main/ship_container/ships"):GetComponent("LScrollRect")
			arg_32_0.shipContainer.enabled = true
			arg_32_0.shipContainer.decelerationRate = 0.07

			function arg_32_0.shipContainer.onInitItem(arg_42_0)
				arg_32_0:onInitItem(arg_42_0)
			end

			function arg_32_0.shipContainer.onUpdateItem(arg_43_0, arg_43_1)
				arg_32_0:onUpdateItem(arg_43_0, arg_43_1)
			end

			function arg_32_0.shipContainer.onReturnItem(arg_44_0, arg_44_1)
				arg_32_0:onReturnItem(arg_44_0, arg_44_1)
			end

			function arg_32_0.shipContainer.onStart()
				arg_32_0:updateSelected()
			end

			arg_32_0.shipLayout = arg_32_0._tf:Find("main/ship_container/ships")
			arg_32_0.scrollItems = {}
			arg_32_0.cardItemDic = {}

			local var_41_0 = _G[arg_32_0.contextData.preView]

			if var_41_0 then
				arg_32_0.sortIndex = var_41_0.sortIndex or ShipIndexConst.SortLevel
				arg_32_0.selectAsc = var_41_0.selectAsc or false
				arg_32_0.typeIndex = var_41_0.typeIndex or ShipIndexConst.TypeAll
				arg_32_0.campIndex = var_41_0.campIndex or ShipIndexConst.CampAll
				arg_32_0.rarityIndex = var_41_0.rarityIndex or ShipIndexConst.RarityAll
				arg_32_0.extraIndex = var_41_0.extraIndex or ShipIndexConst.ExtraAll
				arg_32_0.commonTag = var_41_0.commonTag or Ship.PREFERENCE_TAG_NONE
			elseif arg_32_0.contextData.sortData then
				local var_41_1 = arg_32_0.contextData.sortData

				arg_32_0.sortIndex = var_41_1.sort or ShipIndexConst.SortLevel
				arg_32_0.selectAsc = var_41_1.Asc or false
				arg_32_0.typeIndex = var_41_1.typeIndex or ShipIndexConst.TypeAll
				arg_32_0.campIndex = var_41_1.campIndex or ShipIndexConst.CampAll
				arg_32_0.rarityIndex = var_41_1.rarityIndex or ShipIndexConst.RarityAll
				arg_32_0.extraIndex = var_41_1.extraIndex or ShipIndexConst.ExtraAll
				arg_32_0.commonTag = var_41_1.commonTag or Ship.PREFERENCE_TAG_NONE
			else
				arg_32_0.selectAsc = DockyardScene.selectAsc or false
				arg_32_0.sortIndex = DockyardScene.sortIndex or ShipIndexConst.SortLevel
				arg_32_0.typeIndex = DockyardScene.typeIndex or ShipIndexConst.TypeAll
				arg_32_0.campIndex = DockyardScene.campIndex or ShipIndexConst.CampAll
				arg_32_0.rarityIndex = DockyardScene.rarityIndex or ShipIndexConst.RarityAll
				arg_32_0.extraIndex = DockyardScene.extraIndex or ShipIndexConst.ExtraAll
				arg_32_0.commonTag = DockyardScene.commonTag or Ship.PREFERENCE_TAG_NONE
			end

			arg_32_0:updateIndexDatas()
			triggerToggle(arg_32_0.preferenceBtn, arg_32_0.commonTag == Ship.PREFERENCE_TAG_COMMON)
			arg_32_0:initIndexPanel()

			arg_32_0.itemDetailType = -1

			if arg_32_0.contextData.mode == var_0_0.MODE_DESTROY then
				arg_32_0.blacklist = {}
				arg_32_0.selectPanel:GetComponent("HorizontalLayoutGroup").padding.right = 50

				setActive(arg_32_0.selectPanel:Find("quick_select"), true)
				setActive(arg_32_0.settingBtn, true)
			else
				arg_32_0.selectPanel:GetComponent("HorizontalLayoutGroup").padding.right = 250

				setActive(arg_32_0.selectPanel:Find("quick_select"), false)
				setActive(arg_32_0.settingBtn, false)
			end

			if arg_32_0.contextData.mode == var_0_0.MODE_GUILD_BOSS then
				arg_32_0.isShowAssultShips = false

				triggerToggle(arg_32_0.assultBtn, true)

				arg_32_0.guildShipEquipmentsPage = GuildShipEquipmentsPage.New(arg_32_0._tf, arg_32_0.event)

				arg_32_0.guildShipEquipmentsPage:SetCallBack(function()
					arg_32_0:TriggerCard(-1)
				end, function()
					arg_32_0:TriggerCard(1)
				end)
			end

			eachChild(arg_32_0.attrBtn, function(arg_48_0)
				setActive(arg_48_0, false)
			end)

			arg_32_0.isFormTactics = arg_32_0.contextData.prevPage == "NewNavalTacticsMediator"

			local var_41_2 = arg_32_0.attrBtn:Find("off"):GetComponent("Image")
			local var_41_3 = arg_32_0.attrBtn:Find("on"):GetComponent("Image")

			if arg_32_0.isFormTactics then
				GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "skill_off", var_41_2)
				GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "skill_on", var_41_3)
			else
				GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "attr_off", var_41_2)
				GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "attr_on", var_41_3)
			end

			triggerButton(arg_32_0.attrBtn)

			if arg_32_0.isRemouldOrUpgradeMode then
				local var_41_4 = getProxy(SettingsProxy)

				arg_32_0.isFilterLevelForMod = var_41_4:GetDockYardLevelBtnFlag()

				arg_32_0:OnSwitch(arg_32_0.modLeveFilter, arg_32_0.isFilterLevelForMod, function(arg_49_0)
					arg_32_0.isFilterLevelForMod = arg_49_0

					arg_32_0:filter()
				end)

				arg_32_0.isFilterLockForMod = var_41_4:GetDockYardLockBtnFlag()

				arg_32_0:OnSwitch(arg_32_0.modLockFilter, arg_32_0.isFilterLockForMod, function(arg_50_0)
					arg_32_0.isFilterLockForMod = arg_50_0

					arg_32_0:filter()
				end)
			end

			local var_41_5 = arg_32_0.shipContainer:GetComponentInChildren(typeof(GridLayoutGroup))
			local var_41_6 = arg_32_0._tf:Find("main/ship_container").rect.width
			local var_41_7 = var_41_5.cellSize.x
			local var_41_8 = var_41_5.spacing.x
			local var_41_9 = var_41_6 - var_41_5.padding.left - var_41_5.padding.right
			local var_41_10 = var_41_7 + var_41_8

			if var_41_10 > 0 then
				local var_41_11 = math.floor((var_41_9 + var_41_8) / var_41_10) - 1

				var_41_5.constraintCount = math.max(7, var_41_11)
			end

			arg_32_0:filter()
		end
	})

	if arg_32_0.isPhantomMode then
		setActive(arg_32_0.listEmptyTF, #arg_32_0.filterBluePrint == 0)
	else
		setActive(arg_32_0.listEmptyTF, #arg_32_0.shipVOs <= 0)
	end
end

function var_0_0.isDefaultStatus(arg_51_0)
	return arg_51_0.sortIndex == ShipIndexConst.SortLevel and (not arg_51_0.typeIndex or arg_51_0.typeIndex == ShipIndexConst.TypeAll) and (not arg_51_0.campIndex or arg_51_0.campIndex == ShipIndexConst.CampAll) and (not arg_51_0.rarityIndex or arg_51_0.rarityIndex == ShipIndexConst.RarityAll) and (not arg_51_0.extraIndex or arg_51_0.extraIndex == ShipIndexConst.ExtraAll)
end

function var_0_0.setShipsCount(arg_52_0, arg_52_1, arg_52_2)
	arg_52_0.shipsCount = arg_52_1
	arg_52_0.specialShipCount = arg_52_2
end

function var_0_0.GetCard(arg_53_0, arg_53_1)
	return DockyardShipItem.New(arg_53_1, arg_53_0.contextData.hideTagFlags, arg_53_0.contextData.blockTagFlags)
end

function var_0_0.OnClickCard(arg_54_0, arg_54_1)
	if arg_54_1.shipVO then
		if not arg_54_0.selecteEnabled then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_CLICK)

			DockyardScene.value = arg_54_0.shipContainer.value

			arg_54_0.onClick(arg_54_1.shipVO, arg_54_0.shipVOs)
		else
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(table.contains(arg_54_0.selectedIds, arg_54_1.shipVO.id) and SFX_UI_CANCEL or SFX_UI_FORMATION_SELECT)
			arg_54_0:selectShip(arg_54_1.shipVO)
		end
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_CLICK)

		if arg_54_0.callbackQuit then
			arg_54_0.onSelected({}, function()
				arg_54_0:back()
			end)
		elseif not arg_54_1.isLoading then
			arg_54_0.onSelected({})
			arg_54_0:back()
		end
	end
end

function var_0_0.OnClickPhantom(arg_56_0, arg_56_1)
	if arg_56_1.phantomId == 0 then
		return
	else
		arg_56_0:emit(DockyardMediator.CHANGE_SKIN, arg_56_1)
	end
end

function var_0_0.onInitItem(arg_57_0, arg_57_1)
	if arg_57_0.scrollItems[arg_57_1] then
		return arg_57_0.scrollItems[arg_57_1]
	end

	local var_57_0 = arg_57_0:GetCard(arg_57_1)

	var_57_0:updateDetail(arg_57_0.itemDetailType)

	var_57_0.isLoading = true

	onButton(arg_57_0, var_57_0.go, function()
		arg_57_0:OnClickCard(var_57_0)
	end)

	local var_57_1 = GetOrAddComponent(var_57_0.go, "UILongPressTrigger").onLongPressed

	if arg_57_0.contextData.preView == NewBackYardShipInfoLayer.__cname then
		var_57_1:RemoveAllListeners()
		var_57_1:AddListener(function()
			if var_57_0.shipVO then
				arg_57_0.contextData.selectedIds = arg_57_0.selectedIds

				arg_57_0.onClick(var_57_0.shipVO, underscore.select(arg_57_0.shipVOs, function(arg_60_0)
					return arg_60_0
				end), arg_57_0.contextData)
			end
		end)
	else
		var_57_1:RemoveAllListeners()
	end

	arg_57_0.scrollItems[arg_57_1] = var_57_0

	return var_57_0
end

function var_0_0.getOrInitPhantom(arg_61_0, arg_61_1)
	arg_61_0.scrollPhantoms[arg_61_1] = arg_61_0.scrollPhantoms[arg_61_1] or {
		isClear = true,
		go = arg_61_1,
		tf = tf(arg_61_1),
		updateSelected = function(arg_62_0, arg_62_1)
			arg_62_0.shipCard:updateSelected(arg_62_1[0])
			eachChild(arg_62_0.tf:Find("phantoms"), function(arg_63_0, arg_63_1)
				arg_63_1 = arg_63_1 + 1

				local var_63_0 = arg_62_0.phantoms[arg_63_1 + 1]

				setActive(arg_63_0:Find("selected"), var_63_0 and arg_62_1[var_63_0.phantomId])
			end)
		end,
		clear = function(arg_64_0)
			if arg_64_0.isClear then
				return
			end

			arg_64_0.shipCard:clear()

			arg_64_0.isClear = true
		end
	}

	return arg_61_0.scrollPhantoms[arg_61_1]
end

function var_0_0.updatePhantomGroup(arg_65_0, arg_65_1, arg_65_2)
	local var_65_0 = arg_65_0:getOrInitPhantom(arg_65_2)

	var_65_0.isClear = false
	arg_65_0.phantomGroupDic[arg_65_1.shipId] = arg_65_2
	var_65_0.shipCard = var_65_0.shipCard or arg_65_0:GetCard(var_65_0.tf:Find("card"):GetChild(0).gameObject)

	local var_65_1 = arg_65_0.shipVOsById[arg_65_1.shipId]:getAllShipPhantom()

	assert(var_65_1[1].phantomId == 0)

	var_65_0.phantoms = var_65_1

	var_65_0.shipCard:update(var_65_1[1])
	var_65_0.shipCard:updateSelected(underscore.any(arg_65_0.selectedIds, function(arg_66_0)
		return arg_66_0 == var_65_1[1].id
	end))
	arg_65_0:updateItemBlackBlock(var_65_0.shipCard)

	var_65_0.shipCard.isLoading = false

	var_65_0.shipCard:updateIntimacyEnergy(false)
	var_65_0.shipCard:updateIntimacy(false)
	onButton(arg_65_0, var_65_0.shipCard.tr, function()
		arg_65_0:OnClickPhantom(var_65_1[1])
	end, SFX_UI_CLICK)

	local var_65_2 = getGameset("technology_shadow_num")[1]
	local var_65_3 = var_65_0.tf:Find("phantoms")

	UIItemList.StaticAlign(var_65_3, var_65_3:GetChild(0), var_65_2, function(arg_68_0, arg_68_1, arg_68_2)
		arg_68_1 = arg_68_1 + 1

		if arg_68_0 == UIItemList.EventUpdate then
			local var_68_0 = var_65_1[arg_68_1 + 1]

			setActive(arg_68_2:Find("skin"), tobool(var_68_0))
			setActive(arg_68_2:Find("lock"), not var_68_0)

			if var_68_0 then
				GetImageSpriteFromAtlasAsync("shipYardIcon/" .. var_68_0:getPainting(), "", arg_68_2:Find("skin/Image"))

				local var_68_1 = var_68_0:getSkinId()

				changeToScrollText(arg_68_2:Find("skin/name/Text"), pg.ship_skin_template[var_68_1].name)
				setActive(arg_68_2:Find("skin/status"), false)

				local var_68_2 = var_68_0:GetShipPhantomMark()

				setActive(arg_68_2:Find("selected"), underscore.any(arg_65_0.selectedMarks or {}, function(arg_69_0)
					return var_68_2 == arg_69_0
				end))
				setActive(arg_68_2:Find("skin/mark/base"), arg_65_0.contextData.mode ~= var_0_0.MODE_SHIP_PHANTOM)
				setActive(arg_68_2:Find("skin/mark/toggle"), arg_65_0.contextData.mode == var_0_0.MODE_SHIP_PHANTOM)

				local var_68_3 = var_68_0:getRandomFlag()

				onToggle(arg_65_0, arg_68_2:Find("skin/mark/toggle"), function(arg_70_0)
					if arg_70_0 ~= var_68_3 then
						var_68_3 = arg_70_0

						arg_65_0:emit(DockyardMediator.CHANGE_RANDOM_FLAG, var_68_0:GetShipPhantomMark(), var_68_3)
					end
				end, SFX_UI_CLICK)
				triggerToggle(arg_68_2:Find("skin/mark/toggle"), var_68_3)
			else
				setActive(arg_68_2:Find("selected"), false)
			end

			onButton(arg_65_0, arg_68_2, function()
				if var_68_0 then
					arg_65_0:OnClickPhantom(var_68_0)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("shadow_unlock_tip"))
				end
			end, SFX_UI_CLICK)
		end
	end)
end

function var_0_0.showEnergyDesc(arg_72_0, arg_72_1, arg_72_2)
	if LeanTween.isTweening(go(arg_72_0.energyDescTF)) then
		LeanTween.cancel(go(arg_72_0.energyDescTF))

		arg_72_0.energyDescTF.localScale = Vector3.one
	end

	setText(arg_72_0.energyDescTextTF, i18n(arg_72_2))

	arg_72_0.energyDescTF.position = arg_72_1

	setActive(arg_72_0.energyDescTF, true)
	LeanTween.scale(arg_72_0.energyDescTF, Vector3.zero, 0.2):setDelay(1):setFrom(Vector3.one):setOnComplete(System.Action(function()
		arg_72_0.energyDescTF.localScale = Vector3.one

		setActive(arg_72_0.energyDescTF, false)
	end))
end

function var_0_0.onUpdateItem(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = arg_74_0.shipVOs[arg_74_1 + 1]
	local var_74_1 = var_74_0 and var_74_0.id or 0

	arg_74_0.cardItemDic[var_74_1] = arg_74_2

	local var_74_2 = arg_74_0:onInitItem(arg_74_2)

	var_74_2:update(var_74_0)

	if arg_74_0.contextData.mode == DockyardScene.MODE_WORLD then
		var_74_2:updateWorld()
	end

	var_74_2:updateSelected(var_74_2.shipVO and underscore.any(arg_74_0.selectedIds, function(arg_75_0)
		return var_74_2.shipVO.id == arg_75_0
	end))
	arg_74_0:updateItemBlackBlock(var_74_2)

	var_74_2.isLoading = false

	var_74_2:updateIntimacyEnergy(arg_74_0.contextData.energyDisplay or arg_74_0.sortIndex == ShipIndexConst.SortEnergy)

	local var_74_3 = (arg_74_0.sortIndex == ShipIndexConst.SortIntimacy or arg_74_0.extraIndex == ShipIndexConst.ExtraMarry) and arg_74_0.contextData.mode ~= DockyardScene.MODE_UPGRADE

	var_74_2:updateIntimacy(var_74_3)
end

function var_0_0.onReturnItem(arg_76_0, arg_76_1, arg_76_2)
	if arg_76_0.exited then
		return
	end

	local var_76_0 = arg_76_0.scrollItems[arg_76_2]

	if var_76_0 then
		var_76_0:clear()
	end
end

function var_0_0.updateIndexDatas(arg_77_0)
	arg_77_0.contextData.indexDatas = arg_77_0.contextData.indexDatas or {}
	arg_77_0.contextData.indexDatas.sortIndex = arg_77_0.sortIndex
	arg_77_0.contextData.indexDatas.typeIndex = arg_77_0.typeIndex
	arg_77_0.contextData.indexDatas.campIndex = arg_77_0.campIndex
	arg_77_0.contextData.indexDatas.rarityIndex = arg_77_0.rarityIndex
	arg_77_0.contextData.indexDatas.extraIndex = arg_77_0.extraIndex
end

function var_0_0.initIndexPanel(arg_78_0)
	onButton(arg_78_0, arg_78_0.indexBtn, function()
		local var_79_0 = {
			indexDatas = Clone(arg_78_0.contextData.indexDatas),
			customPanels = {
				minHeight = 650,
				sortIndex = {
					isSort = true,
					mode = CustomIndexLayer.Mode.OR,
					options = ShipIndexConst.SortIndexs,
					names = ShipIndexConst.SortNames
				},
				sortPropertyIndex = {
					blueSeleted = true,
					mode = CustomIndexLayer.Mode.OR,
					options = ShipIndexConst.SortPropertyIndexs,
					names = ShipIndexConst.SortPropertyNames
				},
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
				extraIndex = {
					blueSeleted = true,
					mode = CustomIndexLayer.Mode.OR,
					options = ShipIndexConst.ExtraIndexs,
					names = ShipIndexConst.ExtraNames
				},
				layoutPos = Vector2(0, -25)
			},
			groupList = {
				{
					dropdown = false,
					titleTxt = "indexsort_sort",
					titleENTxt = "indexsort_sorteng",
					tags = {
						"sortIndex"
					},
					simpleDropdown = {
						"sortPropertyIndex"
					}
				},
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
						"extraIndex"
					}
				}
			},
			callback = function(arg_80_0)
				arg_78_0.sortIndex = arg_80_0.sortIndex
				arg_78_0.typeIndex = arg_80_0.typeIndex
				arg_78_0.campIndex = arg_80_0.campIndex
				arg_78_0.rarityIndex = arg_80_0.rarityIndex
				arg_78_0.extraIndex = arg_80_0.extraIndex

				arg_78_0:updateIndexDatas()
				arg_78_0:filter()
			end
		}

		arg_78_0:emit(DockyardMediator.OPEN_DOCKYARD_INDEX, var_79_0)
	end, SFX_PANEL)
	onToggle(arg_78_0, arg_78_0.preferenceBtn, function(arg_81_0)
		if arg_81_0 then
			arg_78_0.commonTag = Ship.PREFERENCE_TAG_COMMON
		else
			arg_78_0.commonTag = Ship.PREFERENCE_TAG_NONE
		end

		arg_78_0:filter()
	end)
end

function var_0_0.setShips(arg_82_0, arg_82_1)
	arg_82_0.shipVOsById = arg_82_1

	local var_82_0 = getProxy(TechnologyProxy)

	arg_82_0.shipBluePrints = {}

	for iter_82_0, iter_82_1 in ipairs(var_82_0:getAllBluePrintShipIds()) do
		local var_82_1 = getProxy(BayProxy):getShipById(iter_82_1)

		if #var_82_1:getAllShipPhantomMarks() > 1 then
			table.insert(arg_82_0.shipBluePrints, var_82_0:getBluePrintById(var_82_1.groupId))
		end
	end

	table.sort(arg_82_0.shipBluePrints, CompareFuncs({
		function(arg_83_0)
			return arg_83_0:getConfig("blueprint_version")
		end,
		function(arg_84_0)
			return arg_84_0.id
		end
	}))
end

function var_0_0.setPlayer(arg_85_0, arg_85_1)
	arg_85_0.player = arg_85_1

	arg_85_0:updateBarInfo()
end

function var_0_0.updateBarInfo(arg_86_0)
	setActive(arg_86_0.bottomTipsText, arg_86_0.contextData.leftTopInfo)
	setText(arg_86_0.bottomTipsText, arg_86_0.contextData.leftTopInfo and i18n("dock_yard_left_tips", arg_86_0.contextData.leftTopInfo) or "")
	setActive(arg_86_0.bottomTipsWithFrame, arg_86_0.contextData.leftTopWithFrameInfo)
	setText(arg_86_0.bottomTipsWithFrame:Find("Text"), arg_86_0.contextData.leftTopWithFrameInfo or "")

	if arg_86_0.contextData.mode == var_0_0.MODE_WORLD or arg_86_0.contextData.mode == var_0_0.MODE_GUILD_BOSS or arg_86_0.contextData.mode == var_0_0.MODE_REMOULD or arg_86_0.isPhantomMode then
		setActive(arg_86_0.leftTipsText, false)
	else
		setActive(arg_86_0.leftTipsText, true)
		arg_86_0:updateCapacityDisplay()
	end
end

function var_0_0.updateCapacityDisplay(arg_87_0)
	setActive(arg_87_0.leftTipsText:Find("plus"), not arg_87_0.isCapacityMeta)
	setActive(arg_87_0.leftTipsText:Find("tip"), arg_87_0.isCapacityMeta)
	setActive(arg_87_0.leftTipsText:Find("switch/off"), not arg_87_0.isCapacityMeta)
	setActive(arg_87_0.leftTipsText:Find("switch/on"), arg_87_0.isCapacityMeta)

	if arg_87_0.isCapacityMeta then
		setText(arg_87_0.leftTipsText:Find("label"), i18n("specialshipyard_name"))
		setText(arg_87_0.leftTipsText:Find("Text"), arg_87_0.specialShipCount)
	else
		setText(arg_87_0.leftTipsText:Find("label"), i18n("ship_dockyardScene_capacity"))
		setText(arg_87_0.leftTipsText:Find("Text"), arg_87_0.shipsCount .. "/" .. arg_87_0.player:getMaxShipBag())
	end
end

function var_0_0.initWorldPanel(arg_88_0)
	onButton(arg_88_0, arg_88_0.worldPanel:Find("btn_repair"), function()
		if #arg_88_0.selectedIds > 0 then
			arg_88_0:repairWorldShip(arg_88_0.shipVOsById[arg_88_0.selectedIds[1]])
		end
	end, SFX_PANEL)
	onButton(arg_88_0, arg_88_0.worldPanel:Find("btn_repair_all"), function()
		local var_90_0 = {}
		local var_90_1 = 0

		for iter_90_0, iter_90_1 in pairs(arg_88_0.shipVOsById) do
			local var_90_2 = WorldConst.FetchWorldShip(iter_90_1.id)

			if var_90_2:IsBroken() or not var_90_2:IsHpFull() then
				table.insert(var_90_0, var_90_2.id)

				var_90_1 = var_90_1 + nowWorld():CalcRepairCost(var_90_2)
			end
		end

		if #var_90_0 == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_ship_repair_no_need"))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_ship_repair_all", var_90_1),
				onYes = function()
					arg_88_0:emit(DockyardMediator.ON_SHIP_REPAIR, var_90_0, var_90_1)
				end
			})
		end
	end, SFX_PANEL)
end

function var_0_0.repairWorldShip(arg_92_0, arg_92_1)
	local var_92_0 = WorldConst.FetchWorldShip(arg_92_1.id)
	local var_92_1 = nowWorld():CalcRepairCost(var_92_0)

	if var_92_0:IsBroken() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_ship_repair_2", arg_92_1:getName(), var_92_1),
			onYes = function()
				arg_92_0:emit(DockyardMediator.ON_SHIP_REPAIR, {
					var_92_0.id
				}, var_92_1)
			end
		})
	elseif not var_92_0:IsHpFull() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_ship_repair_1", arg_92_1:getName(), var_92_1),
			onYes = function()
				arg_92_0:emit(DockyardMediator.ON_SHIP_REPAIR, {
					var_92_0.id
				}, var_92_1)
			end
		})
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_ship_repair_no_need"))
	end
end

function var_0_0.filter(arg_95_0)
	local var_95_0 = arg_95_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	LoadImageSpriteAtlasAsync("ui/dockyardui_atlas", var_95_0, arg_95_0.indexBtn, true)

	if arg_95_0.isRemouldOrUpgradeMode then
		arg_95_0:filterForRemouldAndUpgrade()
	else
		arg_95_0:filterCommon()
	end

	local var_95_1 = 0

	if arg_95_0.contextData.quitTeam then
		var_95_1 = var_95_1 + 1

		table.insert(arg_95_0.shipVOs, var_95_1, false)
	end

	if arg_95_0.contextData.priorEquipUpShipIDList then
		local var_95_2 = {}

		for iter_95_0, iter_95_1 in ipairs(arg_95_0.contextData.priorEquipUpShipIDList) do
			var_95_2[iter_95_1] = true
		end

		for iter_95_2 = #arg_95_0.shipVOs, 1, -1 do
			local var_95_3 = type(arg_95_0.shipVOs[iter_95_2]) == "table" and arg_95_0.shipVOs[iter_95_2].id

			if var_95_2[var_95_3] then
				var_95_2[var_95_3] = table.remove(arg_95_0.shipVOs, iter_95_2)
			end
		end

		for iter_95_3, iter_95_4 in ipairs(arg_95_0.contextData.priorEquipUpShipIDList) do
			local var_95_4 = var_95_2[iter_95_4]

			if type(var_95_4) == "table" then
				var_95_1 = var_95_1 + 1

				table.insert(arg_95_0.shipVOs, var_95_1, var_95_4)
			end
		end
	end

	if var_0_0.MODE_OVERVIEW == arg_95_0.contextData.mode and DockyardScene.value then
		arg_95_0:updateShipCount(DockyardScene.value or 0)

		DockyardScene.value = nil
	else
		arg_95_0:updateShipCount(0)
	end
end

function var_0_0.filterForRemouldAndUpgrade(arg_96_0)
	arg_96_0.shipVOs = {}

	local var_96_0 = arg_96_0.isFilterLockForMod
	local var_96_1 = arg_96_0.isFilterLevelForMod

	local function var_96_2(arg_97_0)
		local var_97_0 = true

		if not var_96_0 and arg_97_0.lockState == Ship.LOCK_STATE_LOCK then
			var_97_0 = false
		end

		if not var_96_1 and arg_97_0.level > 1 then
			var_97_0 = false
		end

		return var_97_0
	end

	for iter_96_0, iter_96_1 in pairs(arg_96_0.shipVOsById) do
		if var_96_2(iter_96_1) then
			table.insert(arg_96_0.shipVOs, iter_96_1)
		end
	end

	table.sort(arg_96_0.shipVOs, CompareFuncs({
		function(arg_98_0)
			return arg_98_0.level
		end,
		function(arg_99_0)
			return arg_99_0:isTestShip() and 1 or 0
		end
	}))
end

function var_0_0.filterCommon(arg_100_0)
	arg_100_0.shipVOs = {}

	local var_100_0 = arg_100_0.sortIndex

	local function var_100_1(arg_101_0)
		if arg_100_0.contextData.mode ~= var_0_0.MODE_GUILD_BOSS then
			return true
		end

		if arg_100_0.isShowAssultShips then
			return true
		end

		if not arg_101_0.user then
			return true
		end

		if arg_101_0.user.id == arg_100_0.player.id then
			return true
		end

		return false
	end

	for iter_100_0, iter_100_1 in pairs(arg_100_0.shipVOsById) do
		if arg_100_0.contextData.blockLock and iter_100_1:GetLockState() == Ship.LOCK_STATE_LOCK then
			-- block empty
		elseif arg_100_0.teamTypeFilter and iter_100_1:getTeamType() ~= arg_100_0.teamTypeFilter then
			-- block empty
		elseif ShipIndexConst.filterByType(iter_100_1, arg_100_0.typeIndex) and ShipIndexConst.filterByCamp(iter_100_1, arg_100_0.campIndex) and ShipIndexConst.filterByRarity(iter_100_1, arg_100_0.rarityIndex) and ShipIndexConst.filterByExtra(iter_100_1, arg_100_0.extraIndex) and (arg_100_0.commonTag == Ship.PREFERENCE_TAG_NONE or arg_100_0.commonTag == iter_100_1:GetPreferenceTag()) and var_100_1(iter_100_1) then
			table.insert(arg_100_0.shipVOs, iter_100_1)
		end
	end

	local var_100_2 = arg_100_0.searchBar:GetInputText()

	if var_100_2 and var_100_2 ~= "" then
		arg_100_0.shipVOs = underscore.filter(arg_100_0.shipVOs, function(arg_102_0)
			return arg_102_0:IsMatchKey(var_100_2)
		end)
	end

	local var_100_3, var_100_4 = ShipIndexConst.getSortFuncAndName(var_100_0, arg_100_0.selectAsc)

	if (var_100_0 ~= ShipIndexConst.SortIntimacy and true or false) and not defaultValue((arg_100_0.contextData.hideTagFlags or {}).inFleet, ShipStatus.TAG_HIDE_BASE.inFleet) then
		table.insert(var_100_3, 1, function(arg_103_0)
			return arg_103_0:getFlag("inFleet") and 0 or 1
		end)
	end

	if var_100_3 then
		arg_100_0:SortShips(var_100_3)
	end

	arg_100_0:updateSelected()
	setActive(arg_100_0.sortImgAsc, arg_100_0.selectAsc)
	setActive(arg_100_0.sortImgDesc, not arg_100_0.selectAsc)
	setText(arg_100_0.sortBtn:Find("Image"), i18n(var_100_4))
end

function var_0_0.SortShips(arg_104_0, arg_104_1)
	if pg.NewGuideMgr.GetInstance():IsBusy() then
		local var_104_0 = {
			101171,
			201211,
			401231,
			301051
		}

		arg_104_1 = {
			function(arg_105_0)
				return table.contains(var_104_0, arg_105_0.configId) and 0 or 1
			end
		}
	elseif arg_104_0.isFormTactics then
		table.insert(arg_104_1, 1, function(arg_106_0)
			return arg_106_0:getNation() == Nation.META and 1 or 0
		end)
		table.insert(arg_104_1, 1, function(arg_107_0)
			return arg_107_0:isFullSkillLevel() and 1 or 0
		end)
	elseif arg_104_0.contextData.mode == var_0_0.MODE_OVERVIEW or arg_104_0.contextData.mode == var_0_0.MODE_SELECT then
		table.insert(arg_104_1, 1, function(arg_108_0)
			return -arg_108_0.activityNpc
		end)
	elseif arg_104_0.contextData.mode == var_0_0.MODE_GUILD_BOSS then
		table.insert(arg_104_1, 1, function(arg_109_0)
			return arg_109_0.guildRecommand and 0 or 1
		end)
	end

	table.sort(arg_104_0.shipVOs, CompareFuncs(arg_104_1))
end

function var_0_0.UpdateGuildViewEquipmentsBtn(arg_110_0)
	setActive(arg_110_0.viewEquipmentBtn, arg_110_0.contextData.mode == var_0_0.MODE_GUILD_BOSS and #arg_110_0.selectedIds > 0)
end

function var_0_0.GetSelectCount(arg_111_0)
	return #arg_111_0.selectedIds
end

function var_0_0.GetConfirmSelect(arg_112_0)
	return arg_112_0.selectedIds
end

function var_0_0.didEnter(arg_113_0)
	if arg_113_0:isLayer() then
		arg_113_0:OverlayPanel(arg_113_0._tf, {
			groupDelta = -1
		})
	end

	arg_113_0:OverlayPanel(arg_113_0.blurPanel)
	arg_113_0:PlayUIAnimation(arg_113_0.blurPanel, "enter")
	setActive(arg_113_0.stampBtn, getProxy(TaskProxy):mingshiTouchFlagEnabled() and arg_113_0.contextData.mode ~= var_0_0.MODE_GUILD_BOSS)
	arg_113_0:UpdateGuildViewEquipmentsBtn()
	onButton(arg_113_0, arg_113_0.stampBtn, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(1)
	end, SFX_CONFIRM)
	onButton(arg_113_0, arg_113_0.topPanel:Find("back"), function()
		arg_113_0:back()
	end, SFX_CANCEL)
	onButton(arg_113_0, arg_113_0.sortBtn, function()
		arg_113_0.selectAsc = not arg_113_0.selectAsc

		arg_113_0:filter()
	end, SFX_UI_CLICK)
	onToggle(arg_113_0, arg_113_0.assultBtn, function(arg_117_0)
		arg_113_0.isShowAssultShips = arg_117_0

		arg_113_0:filter()
	end, SFX_PANEL)
	onButton(arg_113_0, arg_113_0.viewEquipmentBtn, function()
		local var_118_0 = arg_113_0.selectedIds[#arg_113_0.selectedIds]

		if not var_118_0 then
			return
		end

		local var_118_1 = arg_113_0.shipVOsById[var_118_0]
		local var_118_2 = var_118_1.user

		arg_113_0.guildShipEquipmentsPage:ExecuteAction("Show", var_118_1, var_118_2)
	end, SFX_PANEL)
	onButton(arg_113_0, arg_113_0.attrBtn, function()
		if not arg_113_0.isFormTactics then
			arg_113_0.itemDetailType = (arg_113_0.itemDetailType + 1) % 4
		else
			arg_113_0.itemDetailType = arg_113_0.itemDetailType == DockyardShipItem.DetailType0 and DockyardShipItem.DetailType3 or DockyardShipItem.DetailType0
		end

		setActive(arg_113_0.attrBtn:Find("off"), arg_113_0.itemDetailType == DockyardShipItem.DetailType0)
		setActive(arg_113_0.attrBtn:Find("on"), arg_113_0.itemDetailType ~= DockyardShipItem.DetailType0)

		arg_113_0.attrBtn:GetComponent("Button").targetGraphic = arg_113_0.itemDetailType == DockyardShipItem.DetailType0 and imageOff or imageOn

		arg_113_0:updateItemDetailType()
	end, SFX_PANEL)
	onButton(arg_113_0, arg_113_0.selectPanel:Find("cancel_button"), function()
		if arg_113_0.animating then
			return
		end

		if arg_113_0.contextData.mode == var_0_0.MODE_DESTROY then
			if #arg_113_0.selectedIds > 0 then
				arg_113_0:unselecteAllShips()
				arg_113_0:back()
			else
				arg_113_0:back()
			end
		else
			arg_113_0:back()

			return
		end
	end, SFX_CANCEL)
	onButton(arg_113_0, arg_113_0.selectPanel:Find("confirm_button"), function()
		if arg_113_0.animating then
			return
		end

		if arg_113_0.contextData.mode == var_0_0.MODE_DESTROY then
			local var_121_0, var_121_1 = arg_113_0:checkDestroyGold()

			if not var_121_0 or not var_121_1 then
				if not var_121_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_retire"))
				elseif not var_121_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire"))
				end

				return
			end
		end

		if arg_113_0:GetSelectCount() < arg_113_0.selectedMin then
			if arg_113_0.leastLimitMsg then
				pg.TipsMgr.GetInstance():ShowTips(arg_113_0.leastLimitMsg)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_error_choiseRoleMore", arg_113_0.selectedMin))
			end

			return
		end

		if arg_113_0.contextData.mode == var_0_0.MODE_DESTROY then
			arg_113_0:displayDestroyPanel()
		else
			local var_121_2 = {}

			if arg_113_0.contextData.destroyCheck then
				local var_121_3 = underscore.map(arg_113_0.selectedIds, function(arg_122_0)
					return arg_113_0.shipVOsById[arg_122_0]
				end)

				table.insert(var_121_2, function(arg_123_0)
					arg_113_0:checkDestroyShips(var_121_3, arg_123_0)
				end)
			end

			local var_121_4 = arg_113_0:GetConfirmSelect()

			if arg_113_0.confirmSelect then
				table.insert(var_121_2, function(arg_124_0)
					arg_113_0.confirmSelect(var_121_4, function()
						arg_124_0(true)
					end, arg_124_0)
				end)
				seriesAsync(var_121_2, function(arg_126_0)
					if arg_126_0 then
						arg_113_0.onSelected(var_121_4)
					end

					arg_113_0:back()
				end)
			else
				table.insert(var_121_2, function(arg_127_0)
					if arg_113_0.callbackQuit then
						arg_113_0.onSelected(var_121_4, arg_127_0)
					else
						arg_113_0.onSelected(var_121_4)
						arg_127_0()
					end
				end)
				seriesAsync(var_121_2, function()
					arg_113_0:back()
				end)
			end
		end
	end, SFX_CONFIRM)
	onButton(arg_113_0, arg_113_0.selectPanel:Find("quick_select"), function()
		if arg_113_0.animating then
			return
		end

		local var_129_0 = {
			PlayerPrefs.GetInt("QuickSelectRarity1", 3),
			PlayerPrefs.GetInt("QuickSelectRarity2", 4),
			PlayerPrefs.GetInt("QuickSelectRarity3", 2)
		}
		local var_129_1 = 3
		local var_129_2 = {}

		for iter_129_0, iter_129_1 in pairs(var_129_0) do
			if iter_129_1 ~= 0 then
				var_129_2[iter_129_1] = var_129_2[iter_129_1] or var_129_1
				var_129_1 = var_129_1 - 1
			end
		end

		local var_129_3 = getProxy(BayProxy):getShips()
		local var_129_4 = {}
		local var_129_5 = {}

		for iter_129_2, iter_129_3 in pairs(var_129_3) do
			if iter_129_3:isMaxStar() then
				var_129_4[iter_129_3:getGroupId()] = true
			else
				local var_129_6 = iter_129_3:getMaxStar() - iter_129_3:getStar() + 1

				if iter_129_3:GetLockState() == Ship.LOCK_STATE_UNLOCK then
					var_129_6 = var_129_6 + 1
				end

				local var_129_7 = var_129_5[iter_129_3:getGroupId()]

				var_129_5[iter_129_3:getGroupId()] = var_129_7 and var_129_7 < var_129_6 and var_129_7 or var_129_6
			end
		end

		local var_129_8 = _.select(arg_113_0.shipVOs, function(arg_130_0)
			return arg_130_0.configId ~= 100001 and arg_130_0.configId ~= 100011 and arg_130_0:GetLockState() == Ship.LOCK_STATE_UNLOCK and table.contains(var_129_0, arg_130_0:getRarity()) and arg_130_0.level == 1 and not arg_113_0.blacklist[arg_130_0:getGroupId()] and not table.contains(arg_113_0.selectedIds, arg_130_0.id) and not arg_130_0:hasAnyFlag({
				"inFleet",
				"inChapter",
				"inWorld",
				"inEvent",
				"inBackyard",
				"inClass",
				"inTactics",
				"inExercise",
				"inAdmiral",
				"inElite",
				"inActivity",
				"inGuildEvent",
				"inGuildBossEvent"
			})
		end)

		if not _.all(var_129_8, function(arg_131_0)
			return arg_113_0.blacklist[arg_131_0:getGroupId()]
		end) then
			var_129_8 = _.select(var_129_8, function(arg_132_0)
				return not arg_113_0.blacklist[arg_132_0:getGroupId()]
			end)
		elseif #arg_113_0.selectedIds > 0 then
			var_129_8 = {}
		end

		table.sort(var_129_8, function(arg_133_0, arg_133_1)
			local var_133_0 = var_129_2[arg_133_0:getRarity()] or 0
			local var_133_1 = var_129_2[arg_133_1:getRarity()] or 0

			if var_133_0 == var_133_1 then
				if arg_133_0:getGroupId() == arg_133_1:getGroupId() then
					return arg_133_0.createTime > arg_133_1.createTime
				end

				return arg_133_0.configId > arg_133_1.configId
			else
				return var_133_1 < var_133_0
			end
		end)

		local var_129_9 = PlayerPrefs.GetString("QuickSelectWhenHasAtLeastOneMaxstar", "KeepNone")
		local var_129_10 = PlayerPrefs.GetString("QuickSelectWithoutMaxstar", "KeepAll")
		local var_129_11 = {}
		local var_129_12 = _.select(var_129_8, function(arg_134_0)
			if var_129_4[arg_134_0:getGroupId()] then
				if var_129_9 == "KeepNone" then
					return true
				elseif var_129_9 == "KeepOne" then
					if not var_129_11[arg_134_0:getGroupId()] then
						var_129_11[arg_134_0:getGroupId()] = true

						return false
					end

					return true
				elseif var_129_9 == "KeepAll" then
					return false
				end
			elseif var_129_10 == "KeepNone" then
				return true
			elseif var_129_10 == "KeepNeeded" then
				if var_129_5[arg_134_0:getGroupId()] > 0 then
					var_129_5[arg_134_0:getGroupId()] = var_129_5[arg_134_0:getGroupId()] - 1

					return false
				end

				return true
			elseif var_129_10 == "KeepAll" then
				return false
			end
		end)
		local var_129_13 = 0
		local var_129_14 = false
		local var_129_15 = false
		local var_129_16 = 0
		local var_129_17 = 0

		for iter_129_4, iter_129_5 in ipairs(arg_113_0.selectedIds) do
			local var_129_18, var_129_19 = arg_113_0.shipVOsById[iter_129_5]:calReturnRes()

			var_129_16 = var_129_16 + var_129_18
			var_129_17 = var_129_17 + var_129_19
		end

		for iter_129_6, iter_129_7 in ipairs(var_129_12) do
			if arg_113_0.selectedMax > 0 and arg_113_0.selectedMax <= arg_113_0:GetSelectCount() then
				break
			end

			local var_129_20, var_129_21 = iter_129_7:calReturnRes()

			var_129_16 = var_129_16 + var_129_20
			var_129_17 = var_129_17 + var_129_21
			var_129_14 = arg_113_0.player:OilMax(var_129_17)
			var_129_15 = arg_113_0.player:GoldMax(var_129_16)

			if var_129_15 then
				break
			end

			var_129_13 = var_129_13 + 1

			arg_113_0:selectShip(iter_129_7)
		end

		if var_129_13 == 0 then
			if var_129_15 then
				if #arg_113_0.selectedIds == 0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_retire"))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title"))
				end
			elseif #arg_113_0.selectedIds > 0 then
				arg_113_0:displayDestroyPanel()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("retire_selectzero"))
			end
		elseif var_129_14 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire_1"),
				onYes = function()
					arg_113_0:displayDestroyPanel()
				end
			})
		else
			arg_113_0:displayDestroyPanel()
		end
	end, SFX_CONFIRM)

	if isActive(arg_113_0.togglePhantom) then
		triggerToggle(arg_113_0.togglePhantom, tobool(arg_113_0.inPhantom))
	else
		arg_113_0:SwitchContainerDisplay()
	end

	arg_113_0:updateBarInfo()

	if arg_113_0.contextData.mode == var_0_0.MODE_WORLD then
		arg_113_0:initWorldPanel()
	elseif arg_113_0.contextData.mode == var_0_0.MODE_DESTROY and not LOCK_DESTROY_GUIDE then
		pg.SystemGuideMgr.GetInstance():Play(arg_113_0)
	end

	setAnchoredPosition(arg_113_0.topPanel, {
		y = arg_113_0.topPanel.rect.height
	})
	setAnchoredPosition(arg_113_0.selectPanel, {
		y = -1 * arg_113_0.selectPanel.rect.height
	})
	onNextTick(function()
		if arg_113_0.exited then
			return
		end

		arg_113_0:uiStartAnimating()
	end)

	arg_113_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_113_0)

	onButton(arg_113_0, arg_113_0.settingBtn, function()
		arg_113_0.settingPanel:Load()
		arg_113_0.settingPanel:ActionInvoke("Show")
	end)
	pg.SystemGuideMgr.GetInstance():Play(arg_113_0)
end

function var_0_0.TriggerCard(arg_138_0, arg_138_1)
	local var_138_0 = arg_138_0.selectedIds[1]

	if not var_138_0 then
		return
	end

	local var_138_1

	for iter_138_0, iter_138_1 in ipairs(arg_138_0.shipVOs) do
		if iter_138_1 and iter_138_1.id == var_138_0 then
			var_138_1 = iter_138_0

			break
		end
	end

	if not var_138_1 then
		return
	end

	local var_138_2 = var_138_1
	local var_138_3

	local function var_138_4()
		var_138_2 = var_138_2 + arg_138_1

		local var_139_0 = arg_138_0.shipVOs[var_138_2]

		if not var_139_0 or arg_138_0.checkShip(var_139_0) then
			return var_139_0
		else
			return var_138_4()
		end
	end

	local var_138_5 = var_138_4()

	if not var_138_5 then
		return
	end

	local function var_138_6()
		local var_140_0

		for iter_140_0, iter_140_1 in pairs(arg_138_0.scrollItems) do
			if iter_140_1.shipVO and iter_140_1.go.name ~= "-1" and iter_140_1.shipVO.id == var_138_5.id then
				var_140_0 = iter_140_1

				break
			end
		end

		return var_140_0
	end

	local var_138_7 = arg_138_0.cardItemDic[var_138_0]
	local var_138_8 = var_138_7 and arg_138_0.scrollItems[var_138_7]
	local var_138_9 = var_138_8 and var_138_8.shipVO.id == var_138_5.id and var_138_8 or nil

	if var_138_9 then
		local var_138_10 = getBounds(arg_138_0._tf:Find("main/ship_container"))
		local var_138_11 = getBounds(var_138_9.tr)

		if not var_138_10:Intersects(var_138_11) then
			local var_138_12 = arg_138_1 * (arg_138_0.shipContainer:HeadIndexToValue(7) - arg_138_0.shipContainer:HeadIndexToValue(1))
			local var_138_13 = arg_138_0.shipContainer.value + var_138_12

			arg_138_0.shipContainer:SetNormalizedPosition(var_138_13, 1)
		end
	end

	if not var_138_9 then
		local var_138_14 = (math.ceil(var_138_2 / 7) - math.ceil(var_138_1 / 7)) * (arg_138_0.shipContainer:HeadIndexToValue(21) - arg_138_0.shipContainer:HeadIndexToValue(1))
		local var_138_15 = arg_138_0.shipContainer.value + var_138_14

		arg_138_0.shipContainer:SetNormalizedPosition(var_138_15, 1)

		var_138_9 = var_138_6()
	end

	if var_138_9 then
		triggerButton(var_138_9.tr)

		local var_138_16 = arg_138_0.shipVOsById[var_138_9.shipVO.id]

		arg_138_0.guildShipEquipmentsPage:Refresh(var_138_16, var_138_16.user)
	end
end

function var_0_0.OnSwitch(arg_141_0, arg_141_1, arg_141_2, arg_141_3)
	local function var_141_0()
		setActive(arg_141_1:Find("off"), not arg_141_2)
		setActive(arg_141_1:Find("on"), arg_141_2)
	end

	onButton(arg_141_0, arg_141_1, function()
		arg_141_2 = not arg_141_2

		if arg_141_3 then
			arg_141_3(arg_141_2)
		end

		var_141_0()
	end, SFX_PANEL)
	var_141_0()
end

function var_0_0.OnShipSkinChanged(arg_144_0, arg_144_1)
	local var_144_0, var_144_1 = ShipPhantom.UnpackMark(arg_144_1)
	local var_144_2 = arg_144_0.phantomGroupDic[var_144_0]
	local var_144_3 = var_144_2 and arg_144_0.scrollPhantoms[var_144_2]

	if var_144_3 and var_144_3.shipCard.shipVO.id == var_144_0 then
		arg_144_0:updatePhantomGroup(underscore.detect(arg_144_0.filterBluePrint, function(arg_145_0)
			return arg_145_0.shipId == var_144_0
		end), var_144_2)
	end
end

function var_0_0.onBackPressed(arg_146_0)
	if arg_146_0.destroyConfirmWindow:isShowing() then
		arg_146_0.destroyConfirmWindow:Hide()

		return
	end

	if arg_146_0.destroyPage:isShowing() then
		arg_146_0.destroyPage:Hide()

		return
	end

	if arg_146_0.settingPanel:isShowing() then
		arg_146_0.settingPanel:Hide()

		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	arg_146_0:back()
end

function var_0_0.updateShipStatusById(arg_147_0, arg_147_1)
	local var_147_0 = arg_147_0.cardItemDic[arg_147_1]
	local var_147_1 = var_147_0 and arg_147_0.scrollItems[var_147_0]

	if var_147_1 and var_147_1.shipVO.id == arg_147_1 then
		var_147_1:flush(arg_147_0.selectedIds)

		if arg_147_0.contextData.mode == DockyardScene.MODE_WORLD then
			var_147_1:updateWorld()
		end
	end
end

function var_0_0.checkDestroyGold(arg_148_0, arg_148_1)
	local var_148_0 = 0
	local var_148_1 = 0

	for iter_148_0, iter_148_1 in ipairs(arg_148_0.selectedIds) do
		local var_148_2, var_148_3 = arg_148_0.shipVOsById[iter_148_1]:calReturnRes()

		var_148_0 = var_148_0 + var_148_2
		var_148_1 = var_148_1 + var_148_3
	end

	if arg_148_1 then
		local var_148_4, var_148_5 = arg_148_1:calReturnRes()

		var_148_0 = var_148_0 + var_148_4
		var_148_1 = var_148_1 + var_148_5
	end

	local var_148_6 = arg_148_0.player:OilMax(var_148_1)

	if arg_148_0.player:GoldMax(var_148_0) then
		return false, not var_148_6
	end

	return true, not var_148_6
end

function var_0_0.selectShip(arg_149_0, arg_149_1)
	local var_149_0 = false
	local var_149_1

	for iter_149_0, iter_149_1 in ipairs(arg_149_0.selectedIds) do
		if iter_149_1 == arg_149_1.id then
			var_149_0 = true
			var_149_1 = iter_149_0

			break
		end
	end

	if var_149_0 or arg_149_0.selectedMax == 1 and arg_149_0:GetSelectCount() > 0 then
		local var_149_2 = defaultValue(var_149_1, 1)
		local var_149_3 = arg_149_0.shipVOsById[arg_149_0.selectedIds[var_149_2]]
		local var_149_4, var_149_5 = arg_149_0.onCancelShip(var_149_3, function()
			if not arg_149_0.exited then
				return
			end

			arg_149_0:selectShip(arg_149_1)
		end, arg_149_0.selectedIds)

		if not var_149_4 then
			if var_149_5 then
				pg.TipsMgr.GetInstance():ShowTips(var_149_5)
			end

			return
		end

		table.remove(arg_149_0.selectedIds, var_149_2)

		if arg_149_0.selectedMax ~= 1 then
			arg_149_0:updateBlackBlocks(var_149_3)
		end
	end

	if not var_149_0 then
		local var_149_6, var_149_7 = arg_149_0.checkShip(arg_149_1, function()
			if arg_149_0.exited then
				return
			end

			arg_149_0:selectShip(arg_149_1)
		end, arg_149_0.selectedIds)

		if not var_149_6 then
			if var_149_7 then
				pg.TipsMgr.GetInstance():ShowTips(var_149_7)
			end

			return
		end

		if arg_149_0.selectedMax == 0 or arg_149_0:GetSelectCount() < arg_149_0.selectedMax then
			table.insert(arg_149_0.selectedIds, arg_149_1.id)

			if arg_149_0.selectedMax ~= 1 then
				arg_149_0:updateBlackBlocks(removeShip)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_error_choiseRoleLess", arg_149_0.selectedMax))

			return
		end
	end

	arg_149_0:updateSelected()

	if arg_149_0.contextData.mode == var_0_0.MODE_DESTROY then
		arg_149_0:updateDestroyRes()
	elseif arg_149_0.contextData.mode == var_0_0.MODE_MOD then
		arg_149_0:updateModAttr()
	end

	arg_149_0:UpdateGuildViewEquipmentsBtn()
end

function var_0_0.updateBlackBlocks(arg_152_0, arg_152_1)
	if not arg_152_0.contextData.useBlackBlock or not arg_152_1 then
		return
	end

	for iter_152_0, iter_152_1 in pairs(arg_152_0.scrollItems) do
		arg_152_0:updateItemBlackBlock(iter_152_1)
	end
end

function var_0_0.updateItemBlackBlock(arg_153_0, arg_153_1)
	if arg_153_0.contextData.useBlackBlock then
		if arg_153_0.selectedMax == 1 then
			arg_153_1:updateBlackBlock(arg_153_0.contextData.otherSelectedIds)
		else
			arg_153_1:updateBlackBlock(arg_153_0.selectedIds)
		end
	else
		arg_153_1:updateBlackBlock()
	end
end

function var_0_0.unselecteAllShips(arg_154_0)
	arg_154_0.selectedIds = {}

	arg_154_0:updateSelected()
	arg_154_0:updateDestroyRes()
end

function var_0_0.updateSelected(arg_155_0)
	if arg_155_0.shipContainer then
		for iter_155_0, iter_155_1 in pairs(arg_155_0.scrollItems) do
			if not iter_155_1.isClear then
				local var_155_0 = iter_155_1.shipVO and iter_155_1.shipVO.id or nil

				iter_155_1:updateSelected(iter_155_1.shipVO and underscore.any(arg_155_0.selectedIds, function(arg_156_0)
					return var_155_0 == arg_156_0
				end))
			end
		end
	end

	if arg_155_0.phantomContainer then
		for iter_155_2, iter_155_3 in pairs(arg_155_0.scrollPhantoms) do
			if not iter_155_3.isClear then
				local var_155_1 = iter_155_3.shipCard.shipVO.id
				local var_155_2 = {}
				local var_155_3 = getGameset("technology_shadow_num")[1]

				for iter_155_4 = 0, var_155_3 do
					if iter_155_4 == 0 then
						var_155_2[iter_155_4] = underscore.any(arg_155_0.selectedIds, function(arg_157_0)
							return var_155_1 == arg_157_0
						end)
					else
						var_155_2[iter_155_4] = underscore.any(arg_155_0.selectedMarks, function(arg_158_0)
							return arg_158_0 == ShipPhantom.PackMark(var_155_1, iter_155_4)
						end)
					end
				end

				iter_155_3:updateSelected(var_155_2)
			end
		end
	end

	if arg_155_0.selectedMax == 0 then
		setText(arg_155_0.selectPanel:Find("bottom_info/bg_input/count"), arg_155_0:GetSelectCount())
	else
		local var_155_4 = arg_155_0:GetSelectCount()

		if arg_155_0.contextData.mode ~= var_0_0.MODE_DESTROY or arg_155_0:GetSelectCount() == 0 then
			var_155_4 = setColorStr(var_155_4, COLOR_WHITE)
		elseif arg_155_0.contextData.mode == var_0_0.MODE_DESTROY then
			var_155_4 = setColorStr(var_155_4, #arg_155_0.selectedIds == 10 and COLOR_RED or COLOR_GREEN)
		end

		setText(arg_155_0.selectPanel:Find("bottom_info/bg_input/count"), var_155_4 .. "/" .. arg_155_0.selectedMax)
	end

	if arg_155_0:GetSelectCount() < arg_155_0.selectedMin then
		setActive(arg_155_0.selectPanel:Find("confirm_button/mask"), true)
	else
		setActive(arg_155_0.selectPanel:Find("confirm_button/mask"), false)
	end

	if arg_155_0.contextData.mode == var_0_0.MODE_MOD then
		arg_155_0:updateModAttr()
	end
end

function var_0_0.updateItemDetailType(arg_159_0)
	for iter_159_0, iter_159_1 in pairs(arg_159_0.scrollItems) do
		iter_159_1:updateDetail(arg_159_0.itemDetailType)
	end

	arg_159_0.shipLayout.anchoredPosition = arg_159_0.shipLayout.anchoredPosition + Vector3(0, 0.001, 0)
end

function var_0_0.closeDestroyMode(arg_160_0)
	setActive(arg_160_0.awardTF, false)
	setActive(arg_160_0.bottomTipsText, true)
end

function var_0_0.updateDestroyRes(arg_161_0)
	if table.getCount(arg_161_0.selectedIds) == 0 then
		arg_161_0:closeDestroyMode()
	else
		setActive(arg_161_0.awardTF, true)
		setActive(arg_161_0.bottomTipsText, false)
	end

	local var_161_0 = _.map(arg_161_0.selectedIds, function(arg_162_0)
		return arg_161_0.shipVOsById[arg_162_0]
	end)
	local var_161_1, var_161_2, var_161_3 = ShipCalcHelper.CalcDestoryRes(var_161_0)
	local var_161_4 = var_161_2 == 0

	if arg_161_0.destroyResList then
		local var_161_5 = (var_161_4 and 1 or 2) + #var_161_3

		arg_161_0.destroyResList:make(function(arg_163_0, arg_163_1, arg_163_2)
			if arg_163_0 == UIItemList.EventUpdate then
				local var_163_0 = ""
				local var_163_1 = 0

				if arg_163_1 == 0 then
					var_163_0, var_163_1 = "Props/gold", var_161_1
				elseif arg_163_1 == 1 then
					if not var_161_4 then
						var_163_0, var_163_1 = "Props/oil", var_161_2
					else
						local var_163_2 = var_161_3[1]

						var_163_0, var_163_1 = Item.getConfigData(var_163_2.id).icon, var_163_2.count
					end
				elseif arg_163_1 > 1 then
					local var_163_3 = var_161_4 and var_161_3[arg_163_1] or var_161_3[arg_163_1 - 1]

					var_163_0, var_163_1 = Item.getConfigData(var_163_3.id).icon, var_163_3.count
				end

				GetImageSpriteFromAtlasAsync(var_163_0, "", arg_163_2:Find("icon"))
				setText(arg_163_2:Find("Text"), "X" .. var_163_1)
			end
		end)
		arg_161_0.destroyResList:align(var_161_5)
	end

	if arg_161_0.destroyPage and arg_161_0.destroyPage:GetLoaded() and arg_161_0.destroyPage:isShowing() then
		arg_161_0.destroyPage:RefreshRes()
	end
end

function var_0_0.setModShip(arg_164_0, arg_164_1)
	arg_164_0.modShip = arg_164_1
end

function var_0_0.updateModAttr(arg_165_0)
	if table.getCount(arg_165_0.selectedIds) == 0 then
		arg_165_0:closeModAttr()
	else
		setActive(arg_165_0.modAttrsTF, true)
		setActive(arg_165_0.bottomTipsText, false)
	end

	local var_165_0 = arg_165_0.contextData.ignoredIds[1]
	local var_165_1 = {}

	for iter_165_0, iter_165_1 in ipairs(arg_165_0.selectedIds) do
		table.insert(var_165_1, arg_165_0.shipVOsById[iter_165_1])
	end

	local var_165_2 = ShipModLayer.getModExpAdditions(arg_165_0.modShip, var_165_1)

	for iter_165_2, iter_165_3 in pairs(ShipModAttr.ID_TO_ATTR) do
		if iter_165_2 ~= ShipModLayer.IGNORE_ID then
			local var_165_3 = arg_165_0.modAttrContainer:Find("attr_" .. iter_165_2)

			setText(var_165_3:Find("value"), var_165_2[iter_165_3])
			setText(var_165_3:Find("name"), ShipModAttr.id2Name(iter_165_2))
		end
	end
end

function var_0_0.closeModAttr(arg_166_0)
	setActive(arg_166_0.modAttrsTF, false)
	setActive(arg_166_0.bottomTipsText, true)
end

function var_0_0.removeShip(arg_167_0, arg_167_1)
	for iter_167_0, iter_167_1 in ipairs(arg_167_0.selectedIds) do
		if iter_167_1 == arg_167_1 then
			table.remove(arg_167_0.selectedIds, iter_167_0)

			break
		end
	end

	for iter_167_2 = #arg_167_0.shipVOs, 1, -1 do
		if arg_167_0.shipVOs[iter_167_2].id == arg_167_1 then
			table.remove(arg_167_0.shipVOs, iter_167_2)

			break
		end
	end

	arg_167_0.shipVOsById[arg_167_1] = nil
end

function var_0_0.updateShipCount(arg_168_0, arg_168_1)
	arg_168_0.shipContainer:SetTotalCount(#arg_168_0.shipVOs, defaultValue(arg_168_1, -1))
	setActive(arg_168_0.listEmptyTF, #arg_168_0.shipVOs <= 0)
end

function var_0_0.ClearShipsBlackBlock(arg_169_0)
	if not arg_169_0.shipVOsById then
		return
	end

	for iter_169_0, iter_169_1 in pairs(arg_169_0.shipVOsById) do
		iter_169_1.blackBlock = false
	end
end

function var_0_0.willExit(arg_170_0)
	arg_170_0:closeDestroyMode()
	arg_170_0:closeModAttr()
	arg_170_0:ClearShipsBlackBlock()

	if arg_170_0.guildShipEquipmentsPage then
		arg_170_0.guildShipEquipmentsPage:Destroy()
	end

	if arg_170_0.settingPanel then
		arg_170_0.settingPanel:Destroy()
	end

	if arg_170_0.destroyPage then
		arg_170_0.destroyPage:Destroy()
	end

	if arg_170_0.destroyConfirmWindow then
		arg_170_0.destroyConfirmWindow:Destroy()
	end

	if arg_170_0.contextData.mode == var_0_0.MODE_MOD then
		-- block empty
	elseif not arg_170_0.contextData.sortData then
		if _G[arg_170_0.contextData.preView] then
			_G[arg_170_0.contextData.preView].sortIndex = arg_170_0.sortIndex
			_G[arg_170_0.contextData.preView].selectAsc = arg_170_0.selectAsc
			_G[arg_170_0.contextData.preView].typeIndex = arg_170_0.typeIndex
			_G[arg_170_0.contextData.preView].campIndex = arg_170_0.campIndex
			_G[arg_170_0.contextData.preView].rarityIndex = arg_170_0.rarityIndex
			_G[arg_170_0.contextData.preView].extraIndex = arg_170_0.extraIndex
			_G[arg_170_0.contextData.preView].commonTag = arg_170_0.commonTag
		else
			DockyardScene.sortIndex = arg_170_0.sortIndex
			DockyardScene.selectAsc = arg_170_0.selectAsc
			DockyardScene.typeIndex = arg_170_0.typeIndex
			DockyardScene.campIndex = arg_170_0.campIndex
			DockyardScene.rarityIndex = arg_170_0.rarityIndex
			DockyardScene.extraIndex = arg_170_0.extraIndex
			DockyardScene.commonTag = arg_170_0.commonTag
		end
	end

	if arg_170_0.shipContainer then
		arg_170_0.shipContainer.enabled = false

		for iter_170_0, iter_170_1 in pairs(arg_170_0.scrollItems) do
			iter_170_1:clear()
			GetOrAddComponent(iter_170_1.go, "UILongPressTrigger").onLongPressed:RemoveAllListeners()
		end
	end

	if arg_170_0.phantomContainer then
		arg_170_0.phantomContainer.enabled = false

		for iter_170_2, iter_170_3 in pairs(arg_170_0.scrollPhantoms) do
			iter_170_3:clear()
		end
	end

	if LeanTween.isTweening(go(arg_170_0.energyDescTF)) then
		setActive(arg_170_0.energyDescTF, false)
		LeanTween.cancel(go(arg_170_0.energyDescTF))
	end

	arg_170_0:cancelAnimating()

	if arg_170_0.isRemouldOrUpgradeMode then
		local var_170_0 = getProxy(SettingsProxy)

		var_170_0:SetDockYardLockBtnFlag(arg_170_0.isFilterLockForMod)
		var_170_0:SetDockYardLevelBtnFlag(arg_170_0.isFilterLevelForMod)
	end

	if arg_170_0.bulinTip then
		arg_170_0.bulinTip:Destroy()

		arg_170_0.bulinTip = nil
	end

	if arg_170_0.searchBar then
		arg_170_0.searchBar:Dispose()

		arg_170_0.searchBar = nil
	end

	arg_170_0:UnOverlayPanel(arg_170_0.blurPanel, arg_170_0._tf)

	if arg_170_0:isLayer() then
		arg_170_0:UnOverlayPanel(arg_170_0._tf)
	end
end

function var_0_0.uiStartAnimating(arg_171_0)
	local var_171_0 = arg_171_0.topPanel:Find("back")
	local var_171_1 = 0
	local var_171_2 = 0.3

	if isActive(arg_171_0.selectPanel) then
		shiftPanel(arg_171_0.selectPanel, nil, 0, var_171_2, var_171_1, true, true)
	end
end

function var_0_0.uiExitAnimating(arg_172_0)
	if arg_172_0.contextData.mode == var_0_0.MODE_OVERVIEW then
		-- block empty
	else
		local var_172_0 = 0
		local var_172_1 = 0.3

		shiftPanel(arg_172_0.selectPanel, nil, -1 * arg_172_0.selectPanel.rect.height, var_172_1, var_172_0, true, true)
	end
end

function var_0_0.back(arg_173_0)
	if arg_173_0.exited then
		return
	end

	arg_173_0:closeView()
end

function var_0_0.cancelAnimating(arg_174_0)
	if LeanTween.isTweening(go(arg_174_0.topPanel)) then
		LeanTween.cancel(go(arg_174_0.topPanel))
	end

	if LeanTween.isTweening(go(arg_174_0.selectPanel)) then
		LeanTween.cancel(go(arg_174_0.selectPanel))
	end

	if arg_174_0.tweens then
		cancelTweens(arg_174_0.tweens)
	end
end

function var_0_0.quickExitFunc(arg_175_0)
	seriesAsync({
		function(arg_176_0)
			if arg_175_0.contextData.onQuickHome then
				arg_175_0.contextData.onQuickHome(arg_176_0)
			else
				arg_176_0()
			end
		end,
		function(arg_177_0)
			arg_175_0:emit(var_0_0.ON_HOME)
		end
	})
end

function var_0_0.displayDestroyPanel(arg_178_0)
	arg_178_0.destroyPage:ExecuteAction("Show")
	arg_178_0.destroyPage:ActionInvoke("Refresh", arg_178_0.selectedIds, arg_178_0.shipVOsById)
end

function var_0_0.closeDestroyPanel(arg_179_0)
	if arg_179_0.destroyPage:isShowing() then
		arg_179_0.destroyPage:Hide()
	end
end

function var_0_0.checkDestroyShips(arg_180_0, arg_180_1, arg_180_2)
	local var_180_0 = {}

	if PlayerPrefs.GetInt("RetireProtect", 1) == 0 then
		local var_180_1 = {}

		for iter_180_0, iter_180_1 in pairs(arg_180_1) do
			local var_180_2 = 0

			for iter_180_2, iter_180_3 in pairs(arg_180_1) do
				if iter_180_3:getGroupId() == iter_180_1:getGroupId() then
					var_180_2 = var_180_2 + 1
				end
			end

			if #getProxy(BayProxy):findShipsByGroup(iter_180_1:getGroupId()) == var_180_2 then
				local var_180_3 = false

				for iter_180_4, iter_180_5 in pairs(var_180_1) do
					if iter_180_5:getGroupId() == iter_180_1:getGroupId() then
						var_180_3 = true

						break
					end
				end

				if not var_180_3 then
					table.insert(var_180_1, iter_180_1)
				end
			end
		end

		if #var_180_1 > 0 then
			table.insert(var_180_0, function(arg_181_0)
				arg_180_0.destroyConfirmWindow:ExecuteAction("ShowOneShipProtect", var_180_1, arg_181_0)
			end)
		end
	end

	local var_180_4, var_180_5 = ShipCalcHelper.GetEliteAndHightLevelShips(arg_180_1)

	if #var_180_4 > 0 or #var_180_5 > 0 then
		table.insert(var_180_0, function(arg_182_0)
			local var_182_0 = false

			if arg_180_0.contextData.mode == var_0_0.MODE_DESTROY then
				var_182_0 = ({
					ShipCalcHelper.CalcDestoryRes(arg_180_1)
				})[4]
			end

			arg_180_0.destroyConfirmWindow:ExecuteAction("Show", var_180_4, var_180_5, var_182_0, arg_182_0)
		end)
	end

	local var_180_6 = underscore.filter(arg_180_1, function(arg_183_0)
		return arg_183_0:getFlag("inElite")
	end)

	if #var_180_6 > 0 then
		table.insert(var_180_0, function(arg_184_0)
			arg_180_0.destroyConfirmWindow:ExecuteAction("ShowEliteTag", var_180_6, arg_184_0)
		end)
	end

	seriesAsync(var_180_0, arg_180_2)
end

return var_0_0
