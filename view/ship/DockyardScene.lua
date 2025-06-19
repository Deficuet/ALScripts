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

function var_0_0.init(arg_2_0)
	arg_2_0._tf:SetAsLastSibling()

	local var_2_0 = arg_2_0.contextData

	var_2_0.mode = defaultValue(var_2_0.mode, var_0_0.MODE_SELECT)
	var_2_0.otherSelectedIds = defaultValue(var_2_0.otherSelectedIds, {})
	arg_2_0.teamTypeFilter = var_2_0.teamFilter
	arg_2_0.selectedMin = var_2_0.selectedMin or 1
	arg_2_0.leastLimitMsg = var_2_0.leastLimitMsg
	arg_2_0.selectedMax = var_2_0.selectedMax or 0
	var_2_0.selectedIds = var_2_0.selectedIds or {}

	if var_2_0.infoShipId then
		table.insert(var_2_0.selectedIds, var_2_0.infoShipId)

		var_2_0.infoShipId = nil
	end

	arg_2_0.selectedIds = underscore(var_2_0.selectedIds):chain():select(function(arg_3_0)
		return getProxy(BayProxy):RawGetShipById(arg_3_0) ~= nil
	end):first(arg_2_0.selectedMax):value()
	var_2_0.selectedIds = nil
	arg_2_0.checkShip = var_2_0.onShip or function(arg_4_0, arg_4_1, arg_4_2)
		return true
	end
	arg_2_0.onCancelShip = var_2_0.onCancelShip or function(arg_5_0, arg_5_1, arg_5_2)
		return true
	end
	arg_2_0.onClick = var_2_0.onClick or function(arg_6_0, arg_6_1, arg_6_2)
		arg_2_0:emit(DockyardMediator.ON_SHIP_DETAIL, arg_6_0, arg_6_1, arg_6_2)
	end
	arg_2_0.confirmSelect = var_2_0.confirmSelect
	arg_2_0.callbackQuit = var_2_0.callbackQuit
	arg_2_0.onSelected = var_2_0.onSelected or function(arg_7_0, arg_7_1)
		warning("not implemented.")
	end
	arg_2_0.blurPanel = arg_2_0:findTF("blur_panel")
	arg_2_0.settingBtn = arg_2_0.blurPanel:Find("adapt/left_length/frame/setting")
	arg_2_0.settingPanel = DockyardQuickSelectSettingPage.New(arg_2_0._tf, arg_2_0.event)

	arg_2_0.settingPanel:OnSettingChanged(function()
		arg_2_0:unselecteAllShips()
	end)

	arg_2_0.topPanel = arg_2_0.blurPanel:Find("adapt/top")
	arg_2_0.sortBtn = arg_2_0.topPanel:Find("sort_button")
	arg_2_0.sortImgAsc = arg_2_0.sortBtn:Find("asc")
	arg_2_0.sortImgDesc = arg_2_0.sortBtn:Find("desc")
	arg_2_0.leftTipsText = arg_2_0.topPanel:Find("capacity")

	onButton(arg_2_0, arg_2_0.leftTipsText:Find("switch"), function()
		arg_2_0.isCapacityMeta = not arg_2_0.isCapacityMeta

		arg_2_0:updateCapacityDisplay()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.leftTipsText:Find("plus"), function()
		gotoChargeScene()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.leftTipsText:Find("tip"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("specialshipyard_tip")
		})
	end, SFX_PANEL)
	setActive(arg_2_0.leftTipsText, false)

	arg_2_0.indexBtn = arg_2_0.topPanel:Find("index_button")
	arg_2_0.switchPanel = arg_2_0.topPanel:Find("switch")

	triggerToggle(arg_2_0.switchPanel:Find("Image"), true)

	arg_2_0.preferenceBtn = arg_2_0.switchPanel:Find("toggles/preference_toggle")
	arg_2_0.attrBtn = arg_2_0.switchPanel:Find("toggles/attr_toggle")
	arg_2_0.nameSearchInput = arg_2_0.switchPanel:Find("search")

	setText(arg_2_0.nameSearchInput:Find("holder"), i18n("dockyard_search_holder"))
	setInputText(arg_2_0.nameSearchInput, "")
	onInputChanged(arg_2_0, arg_2_0.nameSearchInput, function()
		arg_2_0:filter()
	end)

	arg_2_0.modLockFilter = arg_2_0:findTF("mod_flter_lock", arg_2_0.topPanel)
	arg_2_0.modLeveFilter = arg_2_0:findTF("mod_flter_level", arg_2_0.topPanel)
	arg_2_0.energyDescTF = arg_2_0:findTF("energy_desc")
	arg_2_0.energyDescTextTF = arg_2_0.energyDescTF:Find("Text")
	arg_2_0.selectPanel = arg_2_0.blurPanel:Find("select_panel")
	arg_2_0.bottomTipsText = arg_2_0.selectPanel:Find("tip")
	arg_2_0.bottomTipsWithFrame = arg_2_0.selectPanel:Find("tipwithframe")

	setText(arg_2_0.selectPanel:Find("bottom_info/bg_input/selected"), i18n("disassemble_selected") .. ":")

	arg_2_0.awardTF = arg_2_0.selectPanel:Find("bottom_info/bg_award")

	setText(arg_2_0.awardTF:Find("label"), i18n("disassemble_available") .. ":")

	arg_2_0.modAttrsTF = arg_2_0.selectPanel:Find("bottom_info/bg_mod")
	arg_2_0.viewEquipmentBtn = arg_2_0.selectPanel:Find("view_equipments")
	arg_2_0.tipPanel = arg_2_0.blurPanel:Find("TipPanel")

	setActive(arg_2_0.tipPanel, false)

	arg_2_0.worldPanel = arg_2_0.blurPanel:Find("world_port_panel")

	setActive(arg_2_0.worldPanel, arg_2_0.contextData.mode == var_0_0.MODE_WORLD)

	arg_2_0.assultBtn = arg_2_0.blurPanel:Find("adapt/top/assult_btn")
	arg_2_0.stampBtn = arg_2_0.topPanel:Find("stamp")
	arg_2_0.isRemouldOrUpgradeMode = arg_2_0.contextData.mode == var_0_0.MODE_REMOULD or arg_2_0.contextData.mode == var_0_0.MODE_UPGRADE

	setActive(arg_2_0.modLeveFilter, arg_2_0.isRemouldOrUpgradeMode)
	setActive(arg_2_0.modLockFilter, arg_2_0.isRemouldOrUpgradeMode)
	setActive(arg_2_0.assultBtn, arg_2_0.contextData.mode == var_0_0.MODE_GUILD_BOSS)
	switch(arg_2_0.contextData.mode, {
		[var_0_0.MODE_OVERVIEW] = function()
			arg_2_0.selecteEnabled = false
		end,
		[var_0_0.MODE_DESTROY] = function()
			arg_2_0.selecteEnabled = true
			arg_2_0.blacklist = {}
			arg_2_0.destroyResList = UIItemList.New(arg_2_0.awardTF:Find("res_list"), arg_2_0.awardTF:Find("res_list/res"))
		end,
		[var_0_0.MODE_MOD] = function()
			arg_2_0.selecteEnabled = true

			setText(arg_2_0.modAttrsTF:Find("title/Text"), i18n("word_mod_value"))

			arg_2_0.modAttrContainer = arg_2_0.modAttrsTF:Find("attrs")
		end,
		[var_0_0.MODE_SHIP_PHANTOM] = function()
			arg_2_0.selecteEnabled = false
		end
	}, function()
		arg_2_0.selecteEnabled = true
	end)
	setActive(arg_2_0.selectPanel, arg_2_0.selecteEnabled and arg_2_0.contextData.mode ~= var_0_0.MODE_WORLD)
	setActive(arg_2_0.worldPanel, arg_2_0.contextData.mode == var_0_0.MODE_WORLD)

	local var_2_1 = arg_2_0.contextData.mode == var_0_0.MODE_DESTROY

	setActive(arg_2_0.settingBtn, var_2_1)
	setActive(arg_2_0.selectPanel:Find("quick_select"), var_2_1)

	if arg_2_0.contextData.priorEquipUpShipIDList and arg_2_0.contextData.priorMode then
		setActive(arg_2_0.tipPanel, true)

		local var_2_2 = arg_2_0:findTF("EquipUP", arg_2_0.tipPanel)
		local var_2_3 = arg_2_0:findTF("ShipUP", arg_2_0.tipPanel)

		setText(var_2_2, i18n("fightfail_choiceequip"))
		setText(var_2_3, i18n("fightfail_choicestrengthen"))
		setActive(var_2_2, arg_2_0.contextData.priorMode == var_0_0.PRIOR_MODE_EQUIP_UP)
		setActive(var_2_3, arg_2_0.contextData.priorMode == var_0_0.PRIOR_MODE_SHIP_UP)
	end

	arg_2_0.togglePhantom = arg_2_0._tf:Find("blur_panel/adapt/left_length/frame/toggle_phantom")

	onToggle(arg_2_0, arg_2_0.togglePhantom, function(arg_18_0)
		if arg_2_0.inPhantom ~= arg_18_0 then
			arg_2_0.inPhantom = arg_18_0

			arg_2_0:SwitchContainerDisplay()
		end
	end, SFX_PANEL)
	setActive(arg_2_0.togglePhantom, false)

	arg_2_0.helpPhantom = arg_2_0._tf:Find("blur_panel/adapt/left_length/frame/help_phantom")

	onButton(arg_2_0, arg_2_0.helpPhantom, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("projection_help"),
			weight = arg_2_0.contextData.LayerWeightMgr_weight or nil
		})
	end, SFX_PANEL)

	local var_2_4 = arg_2_0.contextData.mode == var_0_0.MODE_SHIP_PHANTOM and "phantom" or "dockyard"

	eachChild(arg_2_0.topPanel:Find("titles"), function(arg_20_0, arg_20_1)
		setActive(arg_20_0, arg_20_0.name == var_2_4)
	end)

	arg_2_0.listEmptyTF = arg_2_0:findTF("empty")

	setActive(arg_2_0.listEmptyTF, false)

	arg_2_0.listEmptyTxt = arg_2_0:findTF("Text", arg_2_0.listEmptyTF)

	setText(arg_2_0.listEmptyTxt, i18n("list_empty_tip_dockyardui"))

	arg_2_0.destroyPage = ShipDestroyPage.New(arg_2_0._tf, arg_2_0.event)

	arg_2_0.destroyPage:SetCardClickCallBack(function(arg_21_0)
		arg_2_0.blacklist[arg_21_0.shipVO:getGroupId()] = true

		local var_21_0 = table.indexof(arg_2_0.selectedIds, arg_21_0.shipVO.id)

		if var_21_0 and var_21_0 > 0 then
			table.remove(arg_2_0.selectedIds, var_21_0)
		end

		arg_2_0:updateDestroyRes()
		arg_2_0:updateSelected()
	end)
	arg_2_0.destroyPage:SetConfirmCallBack(function()
		local var_22_0 = {}
		local var_22_1, var_22_2 = arg_2_0:checkDestroyGold()

		if not var_22_2 then
			table.insert(var_22_0, function(arg_23_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire_1"),
					onYes = arg_23_0
				})
			end)
		end

		local var_22_3 = underscore.map(arg_2_0.selectedIds, function(arg_24_0)
			return arg_2_0.shipVOsById[arg_24_0]
		end)

		table.insert(var_22_0, function(arg_25_0)
			arg_2_0:checkDestroyShips(var_22_3, arg_25_0)
		end)
		seriesAsync(var_22_0, function()
			arg_2_0:emit(DockyardMediator.ON_DESTROY_SHIPS, arg_2_0.selectedIds)
		end)
	end)

	arg_2_0.destroyConfirmWindow = ShipDestoryConfirmWindow.New(arg_2_0._tf, arg_2_0.event)
end

function var_0_0.SwitchContainerDisplay(arg_27_0)
	arg_27_0.isPhantomMode = arg_27_0.contextData.mode == var_0_0.MODE_SHIP_PHANTOM or arg_27_0.inPhantom

	setActive(arg_27_0.switchPanel, not arg_27_0.isRemouldOrUpgradeMode and not arg_27_0.isPhantomMode)
	setActive(arg_27_0.indexBtn, not arg_27_0.isRemouldOrUpgradeMode and not arg_27_0.isPhantomMode)
	setActive(arg_27_0.sortBtn, not arg_27_0.isRemouldOrUpgradeMode and not arg_27_0.isPhantomMode)
	setActive(arg_27_0._tf:Find("main/ship_container"), not arg_27_0.isPhantomMode)
	setActive(arg_27_0._tf:Find("main/phantom_container"), arg_27_0.isPhantomMode)
	setActive(arg_27_0.preferenceBtn, not arg_27_0.isPhantomMode)
	arg_27_0:updateBarInfo()
	setActive(arg_27_0.helpPhantom, arg_27_0.contextData.mode == var_0_0.MODE_SHIP_PHANTOM)

	if pg.SeriesGuideMgr.GetInstance():isEnd() and PlayerPrefs.GetInt("PHANTOM_HELP_FIRST", 0) == 0 then
		PlayerPrefs.SetInt("PHANTOM_HELP_FIRST", 1)
		triggerButton(arg_27_0.helpPhantom)
	end

	switch(tobool(arg_27_0.isPhantomMode), {
		[true] = function()
			arg_27_0.initDic = arg_27_0.initDic or {}

			if arg_27_0.initDic.phantom then
				return
			end

			arg_27_0.initDic.phantom = true

			local var_28_0 = getProxy(TechnologyProxy)
			local var_28_1 = arg_27_0._tf:Find("main/phantom_container/title/content")
			local var_28_2 = var_28_0:getConfigMaxVersion()

			UIItemList.StaticAlign(var_28_1, var_28_1:GetChild(0), var_28_2 + 1, function(arg_29_0, arg_29_1, arg_29_2)
				if arg_29_0 == UIItemList.EventUpdate then
					arg_29_2.name = "phase_" .. arg_29_1

					GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", arg_29_1, arg_29_2:Find("on"))
					GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", arg_29_1, arg_29_2:Find("off"))
					onToggle(arg_27_0, arg_29_2, function(arg_30_0)
						if arg_30_0 then
							arg_27_0.selectVersion = arg_29_1
							arg_27_0.filterBluePrint = underscore.filter(arg_27_0.shipBluePrints, function(arg_31_0)
								return arg_29_1 == 0 or arg_31_0:getConfig("blueprint_version") == arg_29_1
							end)

							arg_27_0.phantomContainer:SetTotalCount(#arg_27_0.filterBluePrint, 0)
						end
					end, SFX_PANEL)
				end
			end)
			setActive(arg_27_0._tf:Find("main/phantom_container/view/tpl"), false)

			arg_27_0.phantomContainer = arg_27_0._tf:Find("main/phantom_container/view/groups"):GetComponent("LScrollRect")
			arg_27_0.phantomContainer.enabled = true
			arg_27_0.phantomContainer.decelerationRate = 0.07

			function arg_27_0.phantomContainer.onInitItem(arg_32_0)
				arg_27_0:getOrInitPhantom(arg_32_0)
				ClearTweenItemAlphaAndWhite(arg_32_0)
			end

			function arg_27_0.phantomContainer.onUpdateItem(arg_33_0, arg_33_1)
				arg_27_0:updatePhantomGroup(arg_27_0.filterBluePrint[arg_33_0 + 1], arg_33_1)
				TweenItemAlphaAndWhite(arg_33_1)
			end

			function arg_27_0.phantomContainer.onReturnItem(arg_34_0, arg_34_1)
				if arg_27_0.exited then
					return
				end

				arg_27_0:getOrInitPhantom(arg_34_1):clear()
				ClearTweenItemAlphaAndWhite(arg_34_1)
			end

			arg_27_0.scrollPhantoms = {}
			arg_27_0.phantomGroupDic = {}

			local var_28_3 = 0

			if arg_27_0.contextData.techVersion and #underscore.filter(arg_27_0.shipBluePrints, function(arg_35_0)
				return arg_27_0.contextData.techVersion == 0 or arg_35_0:getConfig("blueprint_version") == arg_27_0.contextData.techVersion
			end) > 0 then
				var_28_3 = arg_27_0.contextData.techVersion
			end

			arg_27_0.contextData.techVersion = nil

			triggerToggle(arg_27_0._tf:Find("main/phantom_container/title/content"):GetChild(var_28_3), true)
		end,
		[false] = function()
			arg_27_0.initDic = arg_27_0.initDic or {}

			if arg_27_0.initDic.ship then
				return
			end

			arg_27_0.initDic.ship = true
			arg_27_0.shipContainer = arg_27_0:findTF("main/ship_container/ships"):GetComponent("LScrollRect")
			arg_27_0.shipContainer.enabled = true
			arg_27_0.shipContainer.decelerationRate = 0.07

			function arg_27_0.shipContainer.onInitItem(arg_37_0)
				arg_27_0:onInitItem(arg_37_0)
			end

			function arg_27_0.shipContainer.onUpdateItem(arg_38_0, arg_38_1)
				arg_27_0:onUpdateItem(arg_38_0, arg_38_1)
			end

			function arg_27_0.shipContainer.onReturnItem(arg_39_0, arg_39_1)
				arg_27_0:onReturnItem(arg_39_0, arg_39_1)
			end

			function arg_27_0.shipContainer.onStart()
				arg_27_0:updateSelected()
			end

			arg_27_0.shipLayout = arg_27_0:findTF("main/ship_container/ships")
			arg_27_0.scrollItems = {}
			arg_27_0.cardItemDic = {}

			local var_36_0 = _G[arg_27_0.contextData.preView]

			if var_36_0 then
				arg_27_0.sortIndex = var_36_0.sortIndex or ShipIndexConst.SortLevel
				arg_27_0.selectAsc = var_36_0.selectAsc or false
				arg_27_0.typeIndex = var_36_0.typeIndex or ShipIndexConst.TypeAll
				arg_27_0.campIndex = var_36_0.campIndex or ShipIndexConst.CampAll
				arg_27_0.rarityIndex = var_36_0.rarityIndex or ShipIndexConst.RarityAll
				arg_27_0.extraIndex = var_36_0.extraIndex or ShipIndexConst.ExtraAll
				arg_27_0.commonTag = var_36_0.commonTag or Ship.PREFERENCE_TAG_NONE
			elseif arg_27_0.contextData.sortData then
				local var_36_1 = arg_27_0.contextData.sortData

				arg_27_0.sortIndex = var_36_1.sort or ShipIndexConst.SortLevel
				arg_27_0.selectAsc = var_36_1.Asc or false
				arg_27_0.typeIndex = var_36_1.typeIndex or ShipIndexConst.TypeAll
				arg_27_0.campIndex = var_36_1.campIndex or ShipIndexConst.CampAll
				arg_27_0.rarityIndex = var_36_1.rarityIndex or ShipIndexConst.RarityAll
				arg_27_0.extraIndex = var_36_1.extraIndex or ShipIndexConst.ExtraAll
				arg_27_0.commonTag = var_36_1.commonTag or Ship.PREFERENCE_TAG_NONE
			else
				arg_27_0.selectAsc = DockyardScene.selectAsc or false
				arg_27_0.sortIndex = DockyardScene.sortIndex or ShipIndexConst.SortLevel
				arg_27_0.typeIndex = DockyardScene.typeIndex or ShipIndexConst.TypeAll
				arg_27_0.campIndex = DockyardScene.campIndex or ShipIndexConst.CampAll
				arg_27_0.rarityIndex = DockyardScene.rarityIndex or ShipIndexConst.RarityAll
				arg_27_0.extraIndex = DockyardScene.extraIndex or ShipIndexConst.ExtraAll
				arg_27_0.commonTag = DockyardScene.commonTag or Ship.PREFERENCE_TAG_NONE
			end

			arg_27_0:updateIndexDatas()
			triggerToggle(arg_27_0.preferenceBtn, arg_27_0.commonTag == Ship.PREFERENCE_TAG_COMMON)
			arg_27_0:initIndexPanel()

			arg_27_0.itemDetailType = -1

			if arg_27_0.contextData.mode == var_0_0.MODE_DESTROY then
				arg_27_0.blacklist = {}
				arg_27_0.selectPanel:GetComponent("HorizontalLayoutGroup").padding.right = 50

				setActive(arg_27_0.selectPanel:Find("quick_select"), true)
				setActive(arg_27_0.settingBtn, true)
			else
				arg_27_0.selectPanel:GetComponent("HorizontalLayoutGroup").padding.right = 250

				setActive(arg_27_0.selectPanel:Find("quick_select"), false)
				setActive(arg_27_0.settingBtn, false)
			end

			if arg_27_0.contextData.mode == var_0_0.MODE_GUILD_BOSS then
				arg_27_0.isShowAssultShips = false

				triggerToggle(arg_27_0.assultBtn, true)

				arg_27_0.guildShipEquipmentsPage = GuildShipEquipmentsPage.New(arg_27_0._tf, arg_27_0.event)

				arg_27_0.guildShipEquipmentsPage:SetCallBack(function()
					arg_27_0:TriggerCard(-1)
				end, function()
					arg_27_0:TriggerCard(1)
				end)
			end

			eachChild(arg_27_0.attrBtn, function(arg_43_0)
				setActive(arg_43_0, false)
			end)

			arg_27_0.isFormTactics = arg_27_0.contextData.prevPage == "NewNavalTacticsMediator"

			local var_36_2 = arg_27_0:findTF("off", arg_27_0.attrBtn):GetComponent("Image")
			local var_36_3 = arg_27_0:findTF("on", arg_27_0.attrBtn):GetComponent("Image")

			if arg_27_0.isFormTactics then
				GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "skill_off", var_36_2)
				GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "skill_on", var_36_3)
			else
				GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "attr_off", var_36_2)
				GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "attr_on", var_36_3)
			end

			triggerButton(arg_27_0.attrBtn)

			if arg_27_0.isRemouldOrUpgradeMode then
				local var_36_4 = getProxy(SettingsProxy)

				arg_27_0.isFilterLevelForMod = var_36_4:GetDockYardLevelBtnFlag()

				arg_27_0:OnSwitch(arg_27_0.modLeveFilter, arg_27_0.isFilterLevelForMod, function(arg_44_0)
					arg_27_0.isFilterLevelForMod = arg_44_0

					arg_27_0:filter()
				end)

				arg_27_0.isFilterLockForMod = var_36_4:GetDockYardLockBtnFlag()

				arg_27_0:OnSwitch(arg_27_0.modLockFilter, arg_27_0.isFilterLockForMod, function(arg_45_0)
					arg_27_0.isFilterLockForMod = arg_45_0

					arg_27_0:filter()
				end)
			end

			arg_27_0.shipContainer:GetComponentInChildren(typeof(GridLayoutGroup)).constraintCount = 7

			arg_27_0:filter()
		end
	})

	if arg_27_0.isPhantomMode then
		setActive(arg_27_0.listEmptyTF, #arg_27_0.filterBluePrint == 0)
	else
		setActive(arg_27_0.listEmptyTF, #arg_27_0.shipVOs <= 0)
	end
end

function var_0_0.isDefaultStatus(arg_46_0)
	return arg_46_0.sortIndex == ShipIndexConst.SortLevel and (not arg_46_0.typeIndex or arg_46_0.typeIndex == ShipIndexConst.TypeAll) and (not arg_46_0.campIndex or arg_46_0.campIndex == ShipIndexConst.CampAll) and (not arg_46_0.rarityIndex or arg_46_0.rarityIndex == ShipIndexConst.RarityAll) and (not arg_46_0.extraIndex or arg_46_0.extraIndex == ShipIndexConst.ExtraAll)
end

function var_0_0.setShipsCount(arg_47_0, arg_47_1, arg_47_2)
	arg_47_0.shipsCount = arg_47_1
	arg_47_0.specialShipCount = arg_47_2
end

function var_0_0.GetCard(arg_48_0, arg_48_1)
	return DockyardShipItem.New(arg_48_1, arg_48_0.contextData.hideTagFlags, arg_48_0.contextData.blockTagFlags)
end

function var_0_0.OnClickCard(arg_49_0, arg_49_1)
	if arg_49_1.shipVO then
		if not arg_49_0.selecteEnabled then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_CLICK)

			DockyardScene.value = arg_49_0.shipContainer.value

			arg_49_0.onClick(arg_49_1.shipVO, arg_49_0.shipVOs)
		else
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(table.contains(arg_49_0.selectedIds, arg_49_1.shipVO.id) and SFX_UI_CANCEL or SFX_UI_FORMATION_SELECT)
			arg_49_0:selectShip(arg_49_1.shipVO)
		end
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_CLICK)

		if arg_49_0.callbackQuit then
			arg_49_0.onSelected({}, function()
				arg_49_0:back()
			end)
		elseif not arg_49_1.isLoading then
			arg_49_0.onSelected({})
			arg_49_0:back()
		end
	end
end

function var_0_0.OnClickPhantom(arg_51_0, arg_51_1)
	if arg_51_1.phantomId == 0 then
		return
	else
		arg_51_0:emit(DockyardMediator.CHANGE_SKIN, arg_51_1)
	end
end

function var_0_0.onInitItem(arg_52_0, arg_52_1)
	if arg_52_0.scrollItems[arg_52_1] then
		return arg_52_0.scrollItems[arg_52_1]
	end

	local var_52_0 = arg_52_0:GetCard(arg_52_1)

	var_52_0:updateDetail(arg_52_0.itemDetailType)

	var_52_0.isLoading = true

	onButton(arg_52_0, var_52_0.go, function()
		arg_52_0:OnClickCard(var_52_0)
	end)

	local var_52_1 = GetOrAddComponent(var_52_0.go, "UILongPressTrigger").onLongPressed

	if arg_52_0.contextData.preView == NewBackYardShipInfoLayer.__cname then
		var_52_1:RemoveAllListeners()
		var_52_1:AddListener(function()
			if var_52_0.shipVO then
				arg_52_0.contextData.selectedIds = arg_52_0.selectedIds

				arg_52_0.onClick(var_52_0.shipVO, underscore.select(arg_52_0.shipVOs, function(arg_55_0)
					return arg_55_0
				end), arg_52_0.contextData)
			end
		end)
	else
		var_52_1:RemoveAllListeners()
	end

	arg_52_0.scrollItems[arg_52_1] = var_52_0

	return var_52_0
end

function var_0_0.getOrInitPhantom(arg_56_0, arg_56_1)
	arg_56_0.scrollPhantoms[arg_56_1] = arg_56_0.scrollPhantoms[arg_56_1] or {
		isClear = true,
		go = arg_56_1,
		tf = tf(arg_56_1),
		updateSelected = function(arg_57_0, arg_57_1)
			arg_57_0.shipCard:updateSelected(arg_57_1[0])
			eachChild(arg_57_0.tf:Find("phantoms"), function(arg_58_0, arg_58_1)
				arg_58_1 = arg_58_1 + 1

				local var_58_0 = arg_57_0.phantoms[arg_58_1 + 1]

				setActive(arg_58_0:Find("selected"), var_58_0 and arg_57_1[var_58_0.phantomId])
			end)
		end,
		clear = function(arg_59_0)
			if arg_59_0.isClear then
				return
			end

			arg_59_0.shipCard:clear()

			arg_59_0.isClear = true
		end
	}

	return arg_56_0.scrollPhantoms[arg_56_1]
end

function var_0_0.updatePhantomGroup(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = arg_60_0:getOrInitPhantom(arg_60_2)

	var_60_0.isClear = false
	arg_60_0.phantomGroupDic[arg_60_1.shipId] = arg_60_2
	var_60_0.shipCard = var_60_0.shipCard or arg_60_0:GetCard(var_60_0.tf:Find("card"):GetChild(0).gameObject)

	local var_60_1 = arg_60_0.shipVOsById[arg_60_1.shipId]:getAllShipPhantom()

	assert(var_60_1[1].phantomId == 0)

	var_60_0.phantoms = var_60_1

	var_60_0.shipCard:update(var_60_1[1])
	var_60_0.shipCard:updateSelected(underscore.any(arg_60_0.selectedIds, function(arg_61_0)
		return arg_61_0 == var_60_1[1].id
	end))
	arg_60_0:updateItemBlackBlock(var_60_0.shipCard)

	var_60_0.shipCard.isLoading = false

	var_60_0.shipCard:updateIntimacyEnergy(false)
	var_60_0.shipCard:updateIntimacy(false)
	onButton(arg_60_0, var_60_0.shipCard.tr, function()
		arg_60_0:OnClickPhantom(var_60_1[1])
	end, SFX_UI_CLICK)

	local var_60_2 = getGameset("technology_shadow_num")[1]
	local var_60_3 = var_60_0.tf:Find("phantoms")

	UIItemList.StaticAlign(var_60_3, var_60_3:GetChild(0), var_60_2, function(arg_63_0, arg_63_1, arg_63_2)
		arg_63_1 = arg_63_1 + 1

		if arg_63_0 == UIItemList.EventUpdate then
			local var_63_0 = var_60_1[arg_63_1 + 1]

			setActive(arg_63_2:Find("skin"), tobool(var_63_0))
			setActive(arg_63_2:Find("lock"), not var_63_0)

			if var_63_0 then
				GetImageSpriteFromAtlasAsync("shipYardIcon/" .. var_63_0:getPainting(), "", arg_63_2:Find("skin/Image"))

				local var_63_1 = var_63_0:getSkinId()

				changeToScrollText(arg_63_2:Find("skin/name/Text"), pg.ship_skin_template[var_63_1].name)
				setActive(arg_63_2:Find("skin/status"), false)

				local var_63_2 = var_63_0:GetShipPhantomMark()

				setActive(arg_63_2:Find("selected"), underscore.any(arg_60_0.selectedMarks or {}, function(arg_64_0)
					return var_63_2 == arg_64_0
				end))
				setActive(arg_63_2:Find("skin/mark/base"), arg_60_0.contextData.mode ~= var_0_0.MODE_SHIP_PHANTOM)
				setActive(arg_63_2:Find("skin/mark/toggle"), arg_60_0.contextData.mode == var_0_0.MODE_SHIP_PHANTOM)

				local var_63_3 = var_63_0:getRandomFlag()

				onToggle(arg_60_0, arg_63_2:Find("skin/mark/toggle"), function(arg_65_0)
					if arg_65_0 ~= var_63_3 then
						var_63_3 = arg_65_0

						arg_60_0:emit(DockyardMediator.CHANGE_RANDOM_FLAG, var_63_0:GetShipPhantomMark(), var_63_3)
					end
				end, SFX_UI_CLICK)
				triggerToggle(arg_63_2:Find("skin/mark/toggle"), var_63_3)
			else
				setActive(arg_63_2:Find("selected"), false)
			end

			onButton(arg_60_0, arg_63_2, function()
				if var_63_0 then
					arg_60_0:OnClickPhantom(var_63_0)
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("shadow_unlock_tip"))
				end
			end, SFX_UI_CLICK)
		end
	end)
end

function var_0_0.showEnergyDesc(arg_67_0, arg_67_1, arg_67_2)
	if LeanTween.isTweening(go(arg_67_0.energyDescTF)) then
		LeanTween.cancel(go(arg_67_0.energyDescTF))

		arg_67_0.energyDescTF.localScale = Vector3.one
	end

	setText(arg_67_0.energyDescTextTF, i18n(arg_67_2))

	arg_67_0.energyDescTF.position = arg_67_1

	setActive(arg_67_0.energyDescTF, true)
	LeanTween.scale(arg_67_0.energyDescTF, Vector3.zero, 0.2):setDelay(1):setFrom(Vector3.one):setOnComplete(System.Action(function()
		arg_67_0.energyDescTF.localScale = Vector3.one

		setActive(arg_67_0.energyDescTF, false)
	end))
end

function var_0_0.onUpdateItem(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = arg_69_0.shipVOs[arg_69_1 + 1]
	local var_69_1 = var_69_0 and var_69_0.id or 0

	arg_69_0.cardItemDic[var_69_1] = arg_69_2

	local var_69_2 = arg_69_0:onInitItem(arg_69_2)

	var_69_2:update(var_69_0)

	if arg_69_0.contextData.mode == DockyardScene.MODE_WORLD then
		var_69_2:updateWorld()
	end

	var_69_2:updateSelected(var_69_2.shipVO and underscore.any(arg_69_0.selectedIds, function(arg_70_0)
		return var_69_2.shipVO.id == arg_70_0
	end))
	arg_69_0:updateItemBlackBlock(var_69_2)

	var_69_2.isLoading = false

	var_69_2:updateIntimacyEnergy(arg_69_0.contextData.energyDisplay or arg_69_0.sortIndex == ShipIndexConst.SortEnergy)

	local var_69_3 = (arg_69_0.sortIndex == ShipIndexConst.SortIntimacy or arg_69_0.extraIndex == ShipIndexConst.ExtraMarry) and arg_69_0.contextData.mode ~= DockyardScene.MODE_UPGRADE

	var_69_2:updateIntimacy(var_69_3)
end

function var_0_0.onReturnItem(arg_71_0, arg_71_1, arg_71_2)
	if arg_71_0.exited then
		return
	end

	local var_71_0 = arg_71_0.scrollItems[arg_71_2]

	if var_71_0 then
		var_71_0:clear()
	end
end

function var_0_0.updateIndexDatas(arg_72_0)
	arg_72_0.contextData.indexDatas = arg_72_0.contextData.indexDatas or {}
	arg_72_0.contextData.indexDatas.sortIndex = arg_72_0.sortIndex
	arg_72_0.contextData.indexDatas.typeIndex = arg_72_0.typeIndex
	arg_72_0.contextData.indexDatas.campIndex = arg_72_0.campIndex
	arg_72_0.contextData.indexDatas.rarityIndex = arg_72_0.rarityIndex
	arg_72_0.contextData.indexDatas.extraIndex = arg_72_0.extraIndex
end

function var_0_0.initIndexPanel(arg_73_0)
	onButton(arg_73_0, arg_73_0.indexBtn, function()
		local var_74_0 = {
			indexDatas = Clone(arg_73_0.contextData.indexDatas),
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
			callback = function(arg_75_0)
				arg_73_0.sortIndex = arg_75_0.sortIndex
				arg_73_0.typeIndex = arg_75_0.typeIndex
				arg_73_0.campIndex = arg_75_0.campIndex
				arg_73_0.rarityIndex = arg_75_0.rarityIndex
				arg_73_0.extraIndex = arg_75_0.extraIndex

				arg_73_0:updateIndexDatas()
				arg_73_0:filter()
			end
		}

		arg_73_0:emit(DockyardMediator.OPEN_DOCKYARD_INDEX, var_74_0)
	end, SFX_PANEL)
	onToggle(arg_73_0, arg_73_0.preferenceBtn, function(arg_76_0)
		if arg_76_0 then
			arg_73_0.commonTag = Ship.PREFERENCE_TAG_COMMON
		else
			arg_73_0.commonTag = Ship.PREFERENCE_TAG_NONE
		end

		arg_73_0:filter()
	end)
end

function var_0_0.setShips(arg_77_0, arg_77_1)
	arg_77_0.shipVOsById = arg_77_1

	local var_77_0 = getProxy(TechnologyProxy)

	arg_77_0.shipBluePrints = {}

	for iter_77_0, iter_77_1 in ipairs(var_77_0:getAllBluePrintShipIds()) do
		local var_77_1 = getProxy(BayProxy):getShipById(iter_77_1)

		if #var_77_1:getAllShipPhantomMarks() > 1 then
			table.insert(arg_77_0.shipBluePrints, var_77_0:getBluePrintById(var_77_1.groupId))
		end
	end

	table.sort(arg_77_0.shipBluePrints, CompareFuncs({
		function(arg_78_0)
			return arg_78_0:getConfig("blueprint_version")
		end,
		function(arg_79_0)
			return arg_79_0.id
		end
	}))
end

function var_0_0.setPlayer(arg_80_0, arg_80_1)
	arg_80_0.player = arg_80_1

	arg_80_0:updateBarInfo()
end

function var_0_0.updateBarInfo(arg_81_0)
	setActive(arg_81_0.bottomTipsText, arg_81_0.contextData.leftTopInfo)
	setText(arg_81_0.bottomTipsText, arg_81_0.contextData.leftTopInfo and i18n("dock_yard_left_tips", arg_81_0.contextData.leftTopInfo) or "")
	setActive(arg_81_0.bottomTipsWithFrame, arg_81_0.contextData.leftTopWithFrameInfo)
	setText(arg_81_0.bottomTipsWithFrame:Find("Text"), arg_81_0.contextData.leftTopWithFrameInfo or "")

	if arg_81_0.contextData.mode == var_0_0.MODE_WORLD or arg_81_0.contextData.mode == var_0_0.MODE_GUILD_BOSS or arg_81_0.contextData.mode == var_0_0.MODE_REMOULD or arg_81_0.isPhantomMode then
		setActive(arg_81_0.leftTipsText, false)
	else
		setActive(arg_81_0.leftTipsText, true)
		arg_81_0:updateCapacityDisplay()
	end
end

function var_0_0.updateCapacityDisplay(arg_82_0)
	setActive(arg_82_0.leftTipsText:Find("plus"), not arg_82_0.isCapacityMeta)
	setActive(arg_82_0.leftTipsText:Find("tip"), arg_82_0.isCapacityMeta)
	setActive(arg_82_0.leftTipsText:Find("switch/off"), not arg_82_0.isCapacityMeta)
	setActive(arg_82_0.leftTipsText:Find("switch/on"), arg_82_0.isCapacityMeta)

	if arg_82_0.isCapacityMeta then
		setText(arg_82_0.leftTipsText:Find("label"), i18n("specialshipyard_name"))
		setText(arg_82_0.leftTipsText:Find("Text"), arg_82_0.specialShipCount)
	else
		setText(arg_82_0.leftTipsText:Find("label"), i18n("ship_dockyardScene_capacity"))
		setText(arg_82_0.leftTipsText:Find("Text"), arg_82_0.shipsCount .. "/" .. arg_82_0.player:getMaxShipBag())
	end
end

function var_0_0.initWorldPanel(arg_83_0)
	onButton(arg_83_0, arg_83_0.worldPanel:Find("btn_repair"), function()
		if #arg_83_0.selectedIds > 0 then
			arg_83_0:repairWorldShip(arg_83_0.shipVOsById[arg_83_0.selectedIds[1]])
		end
	end, SFX_PANEL)
	onButton(arg_83_0, arg_83_0.worldPanel:Find("btn_repair_all"), function()
		local var_85_0 = {}
		local var_85_1 = 0

		for iter_85_0, iter_85_1 in pairs(arg_83_0.shipVOsById) do
			local var_85_2 = WorldConst.FetchWorldShip(iter_85_1.id)

			if var_85_2:IsBroken() or not var_85_2:IsHpFull() then
				table.insert(var_85_0, var_85_2.id)

				var_85_1 = var_85_1 + nowWorld():CalcRepairCost(var_85_2)
			end
		end

		if #var_85_0 == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_ship_repair_no_need"))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_ship_repair_all", var_85_1),
				onYes = function()
					arg_83_0:emit(DockyardMediator.ON_SHIP_REPAIR, var_85_0, var_85_1)
				end
			})
		end
	end, SFX_PANEL)
end

function var_0_0.repairWorldShip(arg_87_0, arg_87_1)
	local var_87_0 = WorldConst.FetchWorldShip(arg_87_1.id)
	local var_87_1 = nowWorld():CalcRepairCost(var_87_0)

	if var_87_0:IsBroken() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_ship_repair_2", arg_87_1:getName(), var_87_1),
			onYes = function()
				arg_87_0:emit(DockyardMediator.ON_SHIP_REPAIR, {
					var_87_0.id
				}, var_87_1)
			end
		})
	elseif not var_87_0:IsHpFull() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_ship_repair_1", arg_87_1:getName(), var_87_1),
			onYes = function()
				arg_87_0:emit(DockyardMediator.ON_SHIP_REPAIR, {
					var_87_0.id
				}, var_87_1)
			end
		})
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_ship_repair_no_need"))
	end
end

function var_0_0.filter(arg_90_0)
	local var_90_0 = arg_90_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	LoadImageSpriteAtlasAsync("ui/dockyardui_atlas", var_90_0, arg_90_0.indexBtn, true)

	if arg_90_0.isRemouldOrUpgradeMode then
		arg_90_0:filterForRemouldAndUpgrade()
	else
		arg_90_0:filterCommon()
	end

	local var_90_1 = 0

	if arg_90_0.contextData.quitTeam then
		var_90_1 = var_90_1 + 1

		table.insert(arg_90_0.shipVOs, var_90_1, false)
	end

	if arg_90_0.contextData.priorEquipUpShipIDList then
		local var_90_2 = {}

		for iter_90_0, iter_90_1 in ipairs(arg_90_0.contextData.priorEquipUpShipIDList) do
			var_90_2[iter_90_1] = true
		end

		for iter_90_2 = #arg_90_0.shipVOs, 1, -1 do
			local var_90_3 = type(arg_90_0.shipVOs[iter_90_2]) == "table" and arg_90_0.shipVOs[iter_90_2].id

			if var_90_2[var_90_3] then
				var_90_2[var_90_3] = table.remove(arg_90_0.shipVOs, iter_90_2)
			end
		end

		for iter_90_3, iter_90_4 in ipairs(arg_90_0.contextData.priorEquipUpShipIDList) do
			local var_90_4 = var_90_2[iter_90_4]

			if type(var_90_4) == "table" then
				var_90_1 = var_90_1 + 1

				table.insert(arg_90_0.shipVOs, var_90_1, var_90_4)
			end
		end
	end

	if var_0_0.MODE_OVERVIEW == arg_90_0.contextData.mode and DockyardScene.value then
		arg_90_0:updateShipCount(DockyardScene.value or 0)

		DockyardScene.value = nil
	else
		arg_90_0:updateShipCount(0)
	end
end

function var_0_0.filterForRemouldAndUpgrade(arg_91_0)
	arg_91_0.shipVOs = {}

	local var_91_0 = arg_91_0.isFilterLockForMod
	local var_91_1 = arg_91_0.isFilterLevelForMod

	local function var_91_2(arg_92_0)
		local var_92_0 = true

		if not var_91_0 and arg_92_0.lockState == Ship.LOCK_STATE_LOCK then
			var_92_0 = false
		end

		if not var_91_1 and arg_92_0.level > 1 then
			var_92_0 = false
		end

		return var_92_0
	end

	for iter_91_0, iter_91_1 in pairs(arg_91_0.shipVOsById) do
		if var_91_2(iter_91_1) then
			table.insert(arg_91_0.shipVOs, iter_91_1)
		end
	end

	table.sort(arg_91_0.shipVOs, CompareFuncs({
		function(arg_93_0)
			return arg_93_0.level
		end,
		function(arg_94_0)
			return arg_94_0:isTestShip() and 1 or 0
		end
	}))
end

function var_0_0.filterCommon(arg_95_0)
	arg_95_0.shipVOs = {}

	local var_95_0 = arg_95_0.sortIndex

	local function var_95_1(arg_96_0)
		if arg_95_0.contextData.mode ~= var_0_0.MODE_GUILD_BOSS then
			return true
		end

		if arg_95_0.isShowAssultShips then
			return true
		end

		if not arg_96_0.user then
			return true
		end

		if arg_96_0.user.id == arg_95_0.player.id then
			return true
		end

		return false
	end

	for iter_95_0, iter_95_1 in pairs(arg_95_0.shipVOsById) do
		if arg_95_0.contextData.blockLock and iter_95_1:GetLockState() == Ship.LOCK_STATE_LOCK then
			-- block empty
		elseif arg_95_0.teamTypeFilter and iter_95_1:getTeamType() ~= arg_95_0.teamTypeFilter then
			-- block empty
		elseif ShipIndexConst.filterByType(iter_95_1, arg_95_0.typeIndex) and ShipIndexConst.filterByCamp(iter_95_1, arg_95_0.campIndex) and ShipIndexConst.filterByRarity(iter_95_1, arg_95_0.rarityIndex) and ShipIndexConst.filterByExtra(iter_95_1, arg_95_0.extraIndex) and (arg_95_0.commonTag == Ship.PREFERENCE_TAG_NONE or arg_95_0.commonTag == iter_95_1:GetPreferenceTag()) and var_95_1(iter_95_1) then
			table.insert(arg_95_0.shipVOs, iter_95_1)
		end
	end

	local var_95_2 = getInputText(arg_95_0.nameSearchInput)

	if var_95_2 and var_95_2 ~= "" then
		arg_95_0.shipVOs = underscore.filter(arg_95_0.shipVOs, function(arg_97_0)
			return arg_97_0:IsMatchKey(var_95_2)
		end)
	end

	local var_95_3, var_95_4 = ShipIndexConst.getSortFuncAndName(var_95_0, arg_95_0.selectAsc)

	if (var_95_0 ~= ShipIndexConst.SortIntimacy and true or false) and not defaultValue((arg_95_0.contextData.hideTagFlags or {}).inFleet, ShipStatus.TAG_HIDE_BASE.inFleet) then
		table.insert(var_95_3, 1, function(arg_98_0)
			return arg_98_0:getFlag("inFleet") and 0 or 1
		end)
	end

	if var_95_3 then
		arg_95_0:SortShips(var_95_3)
	end

	arg_95_0:updateSelected()
	setActive(arg_95_0.sortImgAsc, arg_95_0.selectAsc)
	setActive(arg_95_0.sortImgDesc, not arg_95_0.selectAsc)
	setText(arg_95_0:findTF("Image", arg_95_0.sortBtn), i18n(var_95_4))
end

function var_0_0.SortShips(arg_99_0, arg_99_1)
	if pg.NewGuideMgr.GetInstance():IsBusy() then
		local var_99_0 = {
			101171,
			201211,
			401231,
			301051
		}

		arg_99_1 = {
			function(arg_100_0)
				return table.contains(var_99_0, arg_100_0.configId) and 0 or 1
			end
		}
	elseif arg_99_0.isFormTactics then
		table.insert(arg_99_1, 1, function(arg_101_0)
			return arg_101_0:getNation() == Nation.META and 1 or 0
		end)
		table.insert(arg_99_1, 1, function(arg_102_0)
			return arg_102_0:isFullSkillLevel() and 1 or 0
		end)
	elseif arg_99_0.contextData.mode == var_0_0.MODE_OVERVIEW or arg_99_0.contextData.mode == var_0_0.MODE_SELECT then
		table.insert(arg_99_1, 1, function(arg_103_0)
			return -arg_103_0.activityNpc
		end)
	elseif arg_99_0.contextData.mode == var_0_0.MODE_GUILD_BOSS then
		table.insert(arg_99_1, 1, function(arg_104_0)
			return arg_104_0.guildRecommand and 0 or 1
		end)
	end

	table.sort(arg_99_0.shipVOs, CompareFuncs(arg_99_1))
end

function var_0_0.UpdateGuildViewEquipmentsBtn(arg_105_0)
	setActive(arg_105_0.viewEquipmentBtn, arg_105_0.contextData.mode == var_0_0.MODE_GUILD_BOSS and #arg_105_0.selectedIds > 0)
end

function var_0_0.GetSelectCount(arg_106_0)
	return #arg_106_0.selectedIds
end

function var_0_0.GetConfirmSelect(arg_107_0)
	return arg_107_0.selectedIds
end

function var_0_0.didEnter(arg_108_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_108_0.blurPanel, {
		weight = arg_108_0:getWeightFromData()
	})
	arg_108_0:PlayUIAnimation(arg_108_0.blurPanel, "enter")
	setActive(arg_108_0.stampBtn, getProxy(TaskProxy):mingshiTouchFlagEnabled() and arg_108_0.contextData.mode ~= var_0_0.MODE_GUILD_BOSS)
	arg_108_0:UpdateGuildViewEquipmentsBtn()
	onButton(arg_108_0, arg_108_0.stampBtn, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(1)
	end, SFX_CONFIRM)
	onButton(arg_108_0, arg_108_0:findTF("back", arg_108_0.topPanel), function()
		arg_108_0:back()
	end, SFX_CANCEL)
	onButton(arg_108_0, arg_108_0.sortBtn, function()
		arg_108_0.selectAsc = not arg_108_0.selectAsc

		arg_108_0:filter()
	end, SFX_UI_CLICK)
	onToggle(arg_108_0, arg_108_0.assultBtn, function(arg_112_0)
		arg_108_0.isShowAssultShips = arg_112_0

		arg_108_0:filter()
	end, SFX_PANEL)
	onButton(arg_108_0, arg_108_0.viewEquipmentBtn, function()
		local var_113_0 = arg_108_0.selectedIds[#arg_108_0.selectedIds]

		if not var_113_0 then
			return
		end

		local var_113_1 = arg_108_0.shipVOsById[var_113_0]
		local var_113_2 = var_113_1.user

		arg_108_0.guildShipEquipmentsPage:ExecuteAction("Show", var_113_1, var_113_2)
	end, SFX_PANEL)
	onButton(arg_108_0, arg_108_0.attrBtn, function()
		if not arg_108_0.isFormTactics then
			arg_108_0.itemDetailType = (arg_108_0.itemDetailType + 1) % 4
		else
			arg_108_0.itemDetailType = arg_108_0.itemDetailType == DockyardShipItem.DetailType0 and DockyardShipItem.DetailType3 or DockyardShipItem.DetailType0
		end

		setActive(arg_108_0.attrBtn:Find("off"), arg_108_0.itemDetailType == DockyardShipItem.DetailType0)
		setActive(arg_108_0.attrBtn:Find("on"), arg_108_0.itemDetailType ~= DockyardShipItem.DetailType0)

		arg_108_0.attrBtn:GetComponent("Button").targetGraphic = arg_108_0.itemDetailType == DockyardShipItem.DetailType0 and imageOff or imageOn

		arg_108_0:updateItemDetailType()
	end, SFX_PANEL)
	onButton(arg_108_0, arg_108_0.selectPanel:Find("cancel_button"), function()
		if arg_108_0.animating then
			return
		end

		if arg_108_0.contextData.mode == var_0_0.MODE_DESTROY then
			if #arg_108_0.selectedIds > 0 then
				arg_108_0:unselecteAllShips()
				arg_108_0:back()
			else
				arg_108_0:back()
			end
		else
			arg_108_0:back()

			return
		end
	end, SFX_CANCEL)
	onButton(arg_108_0, arg_108_0.selectPanel:Find("confirm_button"), function()
		if arg_108_0.animating then
			return
		end

		if arg_108_0.contextData.mode == var_0_0.MODE_DESTROY then
			local var_116_0, var_116_1 = arg_108_0:checkDestroyGold()

			if not var_116_0 or not var_116_1 then
				if not var_116_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_retire"))
				elseif not var_116_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire"))
				end

				return
			end
		end

		if arg_108_0:GetSelectCount() < arg_108_0.selectedMin then
			if arg_108_0.leastLimitMsg then
				pg.TipsMgr.GetInstance():ShowTips(arg_108_0.leastLimitMsg)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_error_choiseRoleMore", arg_108_0.selectedMin))
			end

			return
		end

		if arg_108_0.contextData.mode == var_0_0.MODE_DESTROY then
			arg_108_0:displayDestroyPanel()
		else
			local var_116_2 = {}

			if arg_108_0.contextData.destroyCheck then
				local var_116_3 = underscore.map(arg_108_0.selectedIds, function(arg_117_0)
					return arg_108_0.shipVOsById[arg_117_0]
				end)

				table.insert(var_116_2, function(arg_118_0)
					arg_108_0:checkDestroyShips(var_116_3, arg_118_0)
				end)
			end

			local var_116_4 = arg_108_0:GetConfirmSelect()

			if arg_108_0.confirmSelect then
				table.insert(var_116_2, function(arg_119_0)
					arg_108_0.confirmSelect(var_116_4, function()
						arg_119_0(true)
					end, arg_119_0)
				end)
				seriesAsync(var_116_2, function(arg_121_0)
					if arg_121_0 then
						arg_108_0.onSelected(var_116_4)
					end

					arg_108_0:back()
				end)
			else
				table.insert(var_116_2, function(arg_122_0)
					if arg_108_0.callbackQuit then
						arg_108_0.onSelected(var_116_4, arg_122_0)
					else
						arg_108_0.onSelected(var_116_4)
						arg_122_0()
					end
				end)
				seriesAsync(var_116_2, function()
					arg_108_0:back()
				end)
			end
		end
	end, SFX_CONFIRM)
	onButton(arg_108_0, arg_108_0.selectPanel:Find("quick_select"), function()
		if arg_108_0.animating then
			return
		end

		local var_124_0 = {
			PlayerPrefs.GetInt("QuickSelectRarity1", 3),
			PlayerPrefs.GetInt("QuickSelectRarity2", 4),
			PlayerPrefs.GetInt("QuickSelectRarity3", 2)
		}
		local var_124_1 = 3
		local var_124_2 = {}

		for iter_124_0, iter_124_1 in pairs(var_124_0) do
			if iter_124_1 ~= 0 then
				var_124_2[iter_124_1] = var_124_2[iter_124_1] or var_124_1
				var_124_1 = var_124_1 - 1
			end
		end

		local var_124_3 = getProxy(BayProxy):getShips()
		local var_124_4 = {}
		local var_124_5 = {}

		for iter_124_2, iter_124_3 in pairs(var_124_3) do
			if iter_124_3:isMaxStar() then
				var_124_4[iter_124_3:getGroupId()] = true
			else
				local var_124_6 = iter_124_3:getMaxStar() - iter_124_3:getStar() + 1

				if iter_124_3:GetLockState() == Ship.LOCK_STATE_UNLOCK then
					var_124_6 = var_124_6 + 1
				end

				local var_124_7 = var_124_5[iter_124_3:getGroupId()]

				var_124_5[iter_124_3:getGroupId()] = var_124_7 and var_124_7 < var_124_6 and var_124_7 or var_124_6
			end
		end

		local var_124_8 = _.select(arg_108_0.shipVOs, function(arg_125_0)
			return arg_125_0.configId ~= 100001 and arg_125_0.configId ~= 100011 and arg_125_0:GetLockState() == Ship.LOCK_STATE_UNLOCK and table.contains(var_124_0, arg_125_0:getRarity()) and arg_125_0.level == 1 and not arg_108_0.blacklist[arg_125_0:getGroupId()] and not table.contains(arg_108_0.selectedIds, arg_125_0.id) and not arg_125_0:hasAnyFlag({
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

		if not _.all(var_124_8, function(arg_126_0)
			return arg_108_0.blacklist[arg_126_0:getGroupId()]
		end) then
			var_124_8 = _.select(var_124_8, function(arg_127_0)
				return not arg_108_0.blacklist[arg_127_0:getGroupId()]
			end)
		elseif #arg_108_0.selectedIds > 0 then
			var_124_8 = {}
		end

		table.sort(var_124_8, function(arg_128_0, arg_128_1)
			local var_128_0 = var_124_2[arg_128_0:getRarity()] or 0
			local var_128_1 = var_124_2[arg_128_1:getRarity()] or 0

			if var_128_0 == var_128_1 then
				if arg_128_0:getGroupId() == arg_128_1:getGroupId() then
					return arg_128_0.createTime > arg_128_1.createTime
				end

				return arg_128_0.configId > arg_128_1.configId
			else
				return var_128_1 < var_128_0
			end
		end)

		local var_124_9 = PlayerPrefs.GetString("QuickSelectWhenHasAtLeastOneMaxstar", "KeepNone")
		local var_124_10 = PlayerPrefs.GetString("QuickSelectWithoutMaxstar", "KeepAll")
		local var_124_11 = {}
		local var_124_12 = _.select(var_124_8, function(arg_129_0)
			if var_124_4[arg_129_0:getGroupId()] then
				if var_124_9 == "KeepNone" then
					return true
				elseif var_124_9 == "KeepOne" then
					if not var_124_11[arg_129_0:getGroupId()] then
						var_124_11[arg_129_0:getGroupId()] = true

						return false
					end

					return true
				elseif var_124_9 == "KeepAll" then
					return false
				end
			elseif var_124_10 == "KeepNone" then
				return true
			elseif var_124_10 == "KeepNeeded" then
				if var_124_5[arg_129_0:getGroupId()] > 0 then
					var_124_5[arg_129_0:getGroupId()] = var_124_5[arg_129_0:getGroupId()] - 1

					return false
				end

				return true
			elseif var_124_10 == "KeepAll" then
				return false
			end
		end)
		local var_124_13 = 0
		local var_124_14 = false
		local var_124_15 = false
		local var_124_16 = 0
		local var_124_17 = 0

		for iter_124_4, iter_124_5 in ipairs(arg_108_0.selectedIds) do
			local var_124_18, var_124_19 = arg_108_0.shipVOsById[iter_124_5]:calReturnRes()

			var_124_16 = var_124_16 + var_124_18
			var_124_17 = var_124_17 + var_124_19
		end

		for iter_124_6, iter_124_7 in ipairs(var_124_12) do
			if arg_108_0.selectedMax > 0 and arg_108_0.selectedMax <= arg_108_0:GetSelectCount() then
				break
			end

			local var_124_20, var_124_21 = iter_124_7:calReturnRes()

			var_124_16 = var_124_16 + var_124_20
			var_124_17 = var_124_17 + var_124_21
			var_124_14 = arg_108_0.player:OilMax(var_124_17)
			var_124_15 = arg_108_0.player:GoldMax(var_124_16)

			if var_124_15 then
				break
			end

			var_124_13 = var_124_13 + 1

			arg_108_0:selectShip(iter_124_7)
		end

		if var_124_13 == 0 then
			if var_124_15 then
				if #arg_108_0.selectedIds == 0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_retire"))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title"))
				end
			elseif #arg_108_0.selectedIds > 0 then
				arg_108_0:displayDestroyPanel()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("retire_selectzero"))
			end
		elseif var_124_14 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire_1"),
				onYes = function()
					arg_108_0:displayDestroyPanel()
				end
			})
		else
			arg_108_0:displayDestroyPanel()
		end
	end, SFX_CONFIRM)

	if isActive(arg_108_0.togglePhantom) then
		triggerToggle(arg_108_0.togglePhantom, tobool(arg_108_0.inPhantom))
	else
		arg_108_0:SwitchContainerDisplay()
	end

	arg_108_0:updateBarInfo()

	if arg_108_0.contextData.mode == var_0_0.MODE_WORLD then
		arg_108_0:initWorldPanel()
	elseif arg_108_0.contextData.mode == var_0_0.MODE_DESTROY and not LOCK_DESTROY_GUIDE then
		pg.SystemGuideMgr.GetInstance():Play(arg_108_0)
	end

	setAnchoredPosition(arg_108_0.topPanel, {
		y = arg_108_0.topPanel.rect.height
	})
	setAnchoredPosition(arg_108_0.selectPanel, {
		y = -1 * arg_108_0.selectPanel.rect.height
	})
	onNextTick(function()
		if arg_108_0.exited then
			return
		end

		arg_108_0:uiStartAnimating()
	end)

	arg_108_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_108_0)

	onButton(arg_108_0, arg_108_0.settingBtn, function()
		arg_108_0.settingPanel:Load()
		arg_108_0.settingPanel:ActionInvoke("Show")
	end)
	pg.SystemGuideMgr.GetInstance():Play(arg_108_0)
end

function var_0_0.TriggerCard(arg_133_0, arg_133_1)
	local var_133_0 = arg_133_0.selectedIds[1]

	if not var_133_0 then
		return
	end

	local var_133_1

	for iter_133_0, iter_133_1 in ipairs(arg_133_0.shipVOs) do
		if iter_133_1 and iter_133_1.id == var_133_0 then
			var_133_1 = iter_133_0

			break
		end
	end

	if not var_133_1 then
		return
	end

	local var_133_2 = var_133_1
	local var_133_3

	local function var_133_4()
		var_133_2 = var_133_2 + arg_133_1

		local var_134_0 = arg_133_0.shipVOs[var_133_2]

		if not var_134_0 or arg_133_0.checkShip(var_134_0) then
			return var_134_0
		else
			return var_133_4()
		end
	end

	local var_133_5 = var_133_4()

	if not var_133_5 then
		return
	end

	local function var_133_6()
		local var_135_0

		for iter_135_0, iter_135_1 in pairs(arg_133_0.scrollItems) do
			if iter_135_1.shipVO and iter_135_1.go.name ~= "-1" and iter_135_1.shipVO.id == var_133_5.id then
				var_135_0 = iter_135_1

				break
			end
		end

		return var_135_0
	end

	local var_133_7 = arg_133_0.cardItemDic[var_133_0]
	local var_133_8 = var_133_7 and arg_133_0.scrollItems[var_133_7]
	local var_133_9 = var_133_8 and var_133_8.shipVO.id == var_133_5.id and var_133_8 or nil

	if var_133_9 then
		local var_133_10 = getBounds(arg_133_0:findTF("main/ship_container"))
		local var_133_11 = getBounds(var_133_9.tr)

		if not var_133_10:Intersects(var_133_11) then
			local var_133_12 = arg_133_1 * (arg_133_0.shipContainer:HeadIndexToValue(7) - arg_133_0.shipContainer:HeadIndexToValue(1))
			local var_133_13 = arg_133_0.shipContainer.value + var_133_12

			arg_133_0.shipContainer:SetNormalizedPosition(var_133_13, 1)
		end
	end

	if not var_133_9 then
		local var_133_14 = (math.ceil(var_133_2 / 7) - math.ceil(var_133_1 / 7)) * (arg_133_0.shipContainer:HeadIndexToValue(21) - arg_133_0.shipContainer:HeadIndexToValue(1))
		local var_133_15 = arg_133_0.shipContainer.value + var_133_14

		arg_133_0.shipContainer:SetNormalizedPosition(var_133_15, 1)

		var_133_9 = var_133_6()
	end

	if var_133_9 then
		triggerButton(var_133_9.tr)

		local var_133_16 = arg_133_0.shipVOsById[var_133_9.shipVO.id]

		arg_133_0.guildShipEquipmentsPage:Refresh(var_133_16, var_133_16.user)
	end
end

function var_0_0.OnSwitch(arg_136_0, arg_136_1, arg_136_2, arg_136_3)
	local function var_136_0()
		setActive(arg_136_1:Find("off"), not arg_136_2)
		setActive(arg_136_1:Find("on"), arg_136_2)
	end

	onButton(arg_136_0, arg_136_1, function()
		arg_136_2 = not arg_136_2

		if arg_136_3 then
			arg_136_3(arg_136_2)
		end

		var_136_0()
	end, SFX_PANEL)
	var_136_0()
end

function var_0_0.OnShipSkinChanged(arg_139_0, arg_139_1)
	local var_139_0, var_139_1 = ShipPhantom.UnpackMark(arg_139_1)
	local var_139_2 = arg_139_0.phantomGroupDic[var_139_0]
	local var_139_3 = var_139_2 and arg_139_0.scrollPhantoms[var_139_2]

	if var_139_3 and var_139_3.shipCard.shipVO.id == var_139_0 then
		arg_139_0:updatePhantomGroup(underscore.detect(arg_139_0.filterBluePrint, function(arg_140_0)
			return arg_140_0.shipId == var_139_0
		end), var_139_2)
	end
end

function var_0_0.onBackPressed(arg_141_0)
	if arg_141_0.destroyConfirmWindow:isShowing() then
		arg_141_0.destroyConfirmWindow:Hide()

		return
	end

	if arg_141_0.destroyPage:isShowing() then
		arg_141_0.destroyPage:Hide()

		return
	end

	if arg_141_0.settingPanel:isShowing() then
		arg_141_0.settingPanel:Hide()

		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	arg_141_0:back()
end

function var_0_0.updateShipStatusById(arg_142_0, arg_142_1)
	local var_142_0 = arg_142_0.cardItemDic[arg_142_1]
	local var_142_1 = var_142_0 and arg_142_0.scrollItems[var_142_0]

	if var_142_1 and var_142_1.shipVO.id == arg_142_1 then
		var_142_1:flush(arg_142_0.selectedIds)

		if arg_142_0.contextData.mode == DockyardScene.MODE_WORLD then
			var_142_1:updateWorld()
		end
	end
end

function var_0_0.checkDestroyGold(arg_143_0, arg_143_1)
	local var_143_0 = 0
	local var_143_1 = 0

	for iter_143_0, iter_143_1 in ipairs(arg_143_0.selectedIds) do
		local var_143_2, var_143_3 = arg_143_0.shipVOsById[iter_143_1]:calReturnRes()

		var_143_0 = var_143_0 + var_143_2
		var_143_1 = var_143_1 + var_143_3
	end

	if arg_143_1 then
		local var_143_4, var_143_5 = arg_143_1:calReturnRes()

		var_143_0 = var_143_0 + var_143_4
		var_143_1 = var_143_1 + var_143_5
	end

	local var_143_6 = arg_143_0.player:OilMax(var_143_1)

	if arg_143_0.player:GoldMax(var_143_0) then
		return false, not var_143_6
	end

	return true, not var_143_6
end

function var_0_0.selectShip(arg_144_0, arg_144_1)
	local var_144_0 = false
	local var_144_1

	for iter_144_0, iter_144_1 in ipairs(arg_144_0.selectedIds) do
		if iter_144_1 == arg_144_1.id then
			var_144_0 = true
			var_144_1 = iter_144_0

			break
		end
	end

	if var_144_0 or arg_144_0.selectedMax == 1 and arg_144_0:GetSelectCount() > 0 then
		local var_144_2 = defaultValue(var_144_1, 1)
		local var_144_3 = arg_144_0.shipVOsById[arg_144_0.selectedIds[var_144_2]]
		local var_144_4, var_144_5 = arg_144_0.onCancelShip(var_144_3, function()
			if not arg_144_0.exited then
				return
			end

			arg_144_0:selectShip(arg_144_1)
		end, arg_144_0.selectedIds)

		if not var_144_4 then
			if var_144_5 then
				pg.TipsMgr.GetInstance():ShowTips(var_144_5)
			end

			return
		end

		table.remove(arg_144_0.selectedIds, var_144_2)

		if arg_144_0.selectedMax ~= 1 then
			arg_144_0:updateBlackBlocks(var_144_3)
		end
	end

	if not var_144_0 then
		local var_144_6, var_144_7 = arg_144_0.checkShip(arg_144_1, function()
			if arg_144_0.exited then
				return
			end

			arg_144_0:selectShip(arg_144_1)
		end, arg_144_0.selectedIds)

		if not var_144_6 then
			if var_144_7 then
				pg.TipsMgr.GetInstance():ShowTips(var_144_7)
			end

			return
		end

		if arg_144_0.selectedMax == 0 or arg_144_0:GetSelectCount() < arg_144_0.selectedMax then
			table.insert(arg_144_0.selectedIds, arg_144_1.id)

			if arg_144_0.selectedMax ~= 1 then
				arg_144_0:updateBlackBlocks(removeShip)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_error_choiseRoleLess", arg_144_0.selectedMax))

			return
		end
	end

	arg_144_0:updateSelected()

	if arg_144_0.contextData.mode == var_0_0.MODE_DESTROY then
		arg_144_0:updateDestroyRes()
	elseif arg_144_0.contextData.mode == var_0_0.MODE_MOD then
		arg_144_0:updateModAttr()
	end

	arg_144_0:UpdateGuildViewEquipmentsBtn()
end

function var_0_0.updateBlackBlocks(arg_147_0, arg_147_1)
	if not arg_147_0.contextData.useBlackBlock or not arg_147_1 then
		return
	end

	for iter_147_0, iter_147_1 in pairs(arg_147_0.scrollItems) do
		arg_147_0:updateItemBlackBlock(iter_147_1)
	end
end

function var_0_0.updateItemBlackBlock(arg_148_0, arg_148_1)
	if arg_148_0.contextData.useBlackBlock then
		if arg_148_0.selectedMax == 1 then
			arg_148_1:updateBlackBlock(arg_148_0.contextData.otherSelectedIds)
		else
			arg_148_1:updateBlackBlock(arg_148_0.selectedIds)
		end
	else
		arg_148_1:updateBlackBlock()
	end
end

function var_0_0.unselecteAllShips(arg_149_0)
	arg_149_0.selectedIds = {}

	arg_149_0:updateSelected()
	arg_149_0:updateDestroyRes()
end

function var_0_0.updateSelected(arg_150_0)
	if arg_150_0.shipContainer then
		for iter_150_0, iter_150_1 in pairs(arg_150_0.scrollItems) do
			if not iter_150_1.isClear then
				local var_150_0 = iter_150_1.shipVO and iter_150_1.shipVO.id or nil

				iter_150_1:updateSelected(iter_150_1.shipVO and underscore.any(arg_150_0.selectedIds, function(arg_151_0)
					return var_150_0 == arg_151_0
				end))
			end
		end
	end

	if arg_150_0.phantomContainer then
		for iter_150_2, iter_150_3 in pairs(arg_150_0.scrollPhantoms) do
			if not iter_150_3.isClear then
				local var_150_1 = iter_150_3.shipCard.shipVO.id
				local var_150_2 = {}
				local var_150_3 = getGameset("technology_shadow_num")[1]

				for iter_150_4 = 0, var_150_3 do
					if iter_150_4 == 0 then
						var_150_2[iter_150_4] = underscore.any(arg_150_0.selectedIds, function(arg_152_0)
							return var_150_1 == arg_152_0
						end)
					else
						var_150_2[iter_150_4] = underscore.any(arg_150_0.selectedMarks, function(arg_153_0)
							return arg_153_0 == ShipPhantom.PackMark(var_150_1, iter_150_4)
						end)
					end
				end

				iter_150_3:updateSelected(var_150_2)
			end
		end
	end

	if arg_150_0.selectedMax == 0 then
		setText(arg_150_0.selectPanel:Find("bottom_info/bg_input/count"), arg_150_0:GetSelectCount())
	else
		local var_150_4 = arg_150_0:GetSelectCount()

		if arg_150_0.contextData.mode ~= var_0_0.MODE_DESTROY or arg_150_0:GetSelectCount() == 0 then
			var_150_4 = setColorStr(var_150_4, COLOR_WHITE)
		elseif arg_150_0.contextData.mode == var_0_0.MODE_DESTROY then
			var_150_4 = setColorStr(var_150_4, #arg_150_0.selectedIds == 10 and COLOR_RED or COLOR_GREEN)
		end

		setText(arg_150_0.selectPanel:Find("bottom_info/bg_input/count"), var_150_4 .. "/" .. arg_150_0.selectedMax)
	end

	if arg_150_0:GetSelectCount() < arg_150_0.selectedMin then
		setActive(arg_150_0.selectPanel:Find("confirm_button/mask"), true)
	else
		setActive(arg_150_0.selectPanel:Find("confirm_button/mask"), false)
	end

	if arg_150_0.contextData.mode == var_0_0.MODE_MOD then
		arg_150_0:updateModAttr()
	end
end

function var_0_0.updateItemDetailType(arg_154_0)
	for iter_154_0, iter_154_1 in pairs(arg_154_0.scrollItems) do
		iter_154_1:updateDetail(arg_154_0.itemDetailType)
	end

	arg_154_0.shipLayout.anchoredPosition = arg_154_0.shipLayout.anchoredPosition + Vector3(0, 0.001, 0)
end

function var_0_0.closeDestroyMode(arg_155_0)
	setActive(arg_155_0.awardTF, false)
	setActive(arg_155_0.bottomTipsText, true)
end

function var_0_0.updateDestroyRes(arg_156_0)
	if table.getCount(arg_156_0.selectedIds) == 0 then
		arg_156_0:closeDestroyMode()
	else
		setActive(arg_156_0.awardTF, true)
		setActive(arg_156_0.bottomTipsText, false)
	end

	local var_156_0 = _.map(arg_156_0.selectedIds, function(arg_157_0)
		return arg_156_0.shipVOsById[arg_157_0]
	end)
	local var_156_1, var_156_2, var_156_3 = ShipCalcHelper.CalcDestoryRes(var_156_0)
	local var_156_4 = var_156_2 == 0

	if arg_156_0.destroyResList then
		local var_156_5 = (var_156_4 and 1 or 2) + #var_156_3

		arg_156_0.destroyResList:make(function(arg_158_0, arg_158_1, arg_158_2)
			if arg_158_0 == UIItemList.EventUpdate then
				local var_158_0 = ""
				local var_158_1 = 0

				if arg_158_1 == 0 then
					var_158_0, var_158_1 = "Props/gold", var_156_1
				elseif arg_158_1 == 1 then
					if not var_156_4 then
						var_158_0, var_158_1 = "Props/oil", var_156_2
					else
						local var_158_2 = var_156_3[1]

						var_158_0, var_158_1 = Item.getConfigData(var_158_2.id).icon, var_158_2.count
					end
				elseif arg_158_1 > 1 then
					local var_158_3 = var_156_4 and var_156_3[arg_158_1] or var_156_3[arg_158_1 - 1]

					var_158_0, var_158_1 = Item.getConfigData(var_158_3.id).icon, var_158_3.count
				end

				GetImageSpriteFromAtlasAsync(var_158_0, "", arg_158_2:Find("icon"))
				setText(arg_158_2:Find("Text"), "X" .. var_158_1)
			end
		end)
		arg_156_0.destroyResList:align(var_156_5)
	end

	if arg_156_0.destroyPage and arg_156_0.destroyPage:GetLoaded() and arg_156_0.destroyPage:isShowing() then
		arg_156_0.destroyPage:RefreshRes()
	end
end

function var_0_0.setModShip(arg_159_0, arg_159_1)
	arg_159_0.modShip = arg_159_1
end

function var_0_0.updateModAttr(arg_160_0)
	if table.getCount(arg_160_0.selectedIds) == 0 then
		arg_160_0:closeModAttr()
	else
		setActive(arg_160_0.modAttrsTF, true)
		setActive(arg_160_0.bottomTipsText, false)
	end

	local var_160_0 = arg_160_0.contextData.ignoredIds[1]
	local var_160_1 = {}

	for iter_160_0, iter_160_1 in ipairs(arg_160_0.selectedIds) do
		table.insert(var_160_1, arg_160_0.shipVOsById[iter_160_1])
	end

	local var_160_2 = ShipModLayer.getModExpAdditions(arg_160_0.modShip, var_160_1)

	for iter_160_2, iter_160_3 in pairs(ShipModAttr.ID_TO_ATTR) do
		if iter_160_2 ~= ShipModLayer.IGNORE_ID then
			local var_160_3 = arg_160_0.modAttrContainer:Find("attr_" .. iter_160_2)

			setText(var_160_3:Find("value"), var_160_2[iter_160_3])
			setText(var_160_3:Find("name"), ShipModAttr.id2Name(iter_160_2))
		end
	end
end

function var_0_0.closeModAttr(arg_161_0)
	setActive(arg_161_0.modAttrsTF, false)
	setActive(arg_161_0.bottomTipsText, true)
end

function var_0_0.removeShip(arg_162_0, arg_162_1)
	for iter_162_0, iter_162_1 in ipairs(arg_162_0.selectedIds) do
		if iter_162_1 == arg_162_1 then
			table.remove(arg_162_0.selectedIds, iter_162_0)

			break
		end
	end

	for iter_162_2 = #arg_162_0.shipVOs, 1, -1 do
		if arg_162_0.shipVOs[iter_162_2].id == arg_162_1 then
			table.remove(arg_162_0.shipVOs, iter_162_2)

			break
		end
	end

	arg_162_0.shipVOsById[arg_162_1] = nil
end

function var_0_0.updateShipCount(arg_163_0, arg_163_1)
	arg_163_0.shipContainer:SetTotalCount(#arg_163_0.shipVOs, defaultValue(arg_163_1, -1))
	setActive(arg_163_0.listEmptyTF, #arg_163_0.shipVOs <= 0)
end

function var_0_0.ClearShipsBlackBlock(arg_164_0)
	if not arg_164_0.shipVOsById then
		return
	end

	for iter_164_0, iter_164_1 in pairs(arg_164_0.shipVOsById) do
		iter_164_1.blackBlock = false
	end
end

function var_0_0.willExit(arg_165_0)
	arg_165_0:closeDestroyMode()
	arg_165_0:closeModAttr()
	arg_165_0:ClearShipsBlackBlock()

	if arg_165_0.guildShipEquipmentsPage then
		arg_165_0.guildShipEquipmentsPage:Destroy()
	end

	if arg_165_0.settingPanel then
		arg_165_0.settingPanel:Destroy()
	end

	if arg_165_0.destroyPage then
		arg_165_0.destroyPage:Destroy()
	end

	if arg_165_0.destroyConfirmWindow then
		arg_165_0.destroyConfirmWindow:Destroy()
	end

	if arg_165_0.contextData.mode == var_0_0.MODE_MOD then
		-- block empty
	elseif not arg_165_0.contextData.sortData then
		if _G[arg_165_0.contextData.preView] then
			_G[arg_165_0.contextData.preView].sortIndex = arg_165_0.sortIndex
			_G[arg_165_0.contextData.preView].selectAsc = arg_165_0.selectAsc
			_G[arg_165_0.contextData.preView].typeIndex = arg_165_0.typeIndex
			_G[arg_165_0.contextData.preView].campIndex = arg_165_0.campIndex
			_G[arg_165_0.contextData.preView].rarityIndex = arg_165_0.rarityIndex
			_G[arg_165_0.contextData.preView].extraIndex = arg_165_0.extraIndex
			_G[arg_165_0.contextData.preView].commonTag = arg_165_0.commonTag
		else
			DockyardScene.sortIndex = arg_165_0.sortIndex
			DockyardScene.selectAsc = arg_165_0.selectAsc
			DockyardScene.typeIndex = arg_165_0.typeIndex
			DockyardScene.campIndex = arg_165_0.campIndex
			DockyardScene.rarityIndex = arg_165_0.rarityIndex
			DockyardScene.extraIndex = arg_165_0.extraIndex
			DockyardScene.commonTag = arg_165_0.commonTag
		end
	end

	if arg_165_0.shipContainer then
		arg_165_0.shipContainer.enabled = false

		for iter_165_0, iter_165_1 in pairs(arg_165_0.scrollItems) do
			iter_165_1:clear()
			GetOrAddComponent(iter_165_1.go, "UILongPressTrigger").onLongPressed:RemoveAllListeners()
		end
	end

	if arg_165_0.phantomContainer then
		arg_165_0.phantomContainer.enabled = false

		for iter_165_2, iter_165_3 in pairs(arg_165_0.scrollPhantoms) do
			iter_165_3:clear()
		end
	end

	if LeanTween.isTweening(go(arg_165_0.energyDescTF)) then
		setActive(arg_165_0.energyDescTF, false)
		LeanTween.cancel(go(arg_165_0.energyDescTF))
	end

	arg_165_0:cancelAnimating()

	if arg_165_0.isRemouldOrUpgradeMode then
		local var_165_0 = getProxy(SettingsProxy)

		var_165_0:SetDockYardLockBtnFlag(arg_165_0.isFilterLockForMod)
		var_165_0:SetDockYardLevelBtnFlag(arg_165_0.isFilterLevelForMod)
	end

	if arg_165_0.bulinTip then
		arg_165_0.bulinTip:Destroy()

		arg_165_0.bulinTip = nil
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_165_0.blurPanel, arg_165_0._tf)
end

function var_0_0.uiStartAnimating(arg_166_0)
	local var_166_0 = arg_166_0:findTF("back", arg_166_0.topPanel)
	local var_166_1 = 0
	local var_166_2 = 0.3

	if isActive(arg_166_0.selectPanel) then
		shiftPanel(arg_166_0.selectPanel, nil, 0, var_166_2, var_166_1, true, true)
	end
end

function var_0_0.uiExitAnimating(arg_167_0)
	if arg_167_0.contextData.mode == var_0_0.MODE_OVERVIEW then
		-- block empty
	else
		local var_167_0 = 0
		local var_167_1 = 0.3

		shiftPanel(arg_167_0.selectPanel, nil, -1 * arg_167_0.selectPanel.rect.height, var_167_1, var_167_0, true, true)
	end
end

function var_0_0.back(arg_168_0)
	if arg_168_0.exited then
		return
	end

	arg_168_0:closeView()
end

function var_0_0.cancelAnimating(arg_169_0)
	if LeanTween.isTweening(go(arg_169_0.topPanel)) then
		LeanTween.cancel(go(arg_169_0.topPanel))
	end

	if LeanTween.isTweening(go(arg_169_0.selectPanel)) then
		LeanTween.cancel(go(arg_169_0.selectPanel))
	end

	if arg_169_0.tweens then
		cancelTweens(arg_169_0.tweens)
	end
end

function var_0_0.quickExitFunc(arg_170_0)
	seriesAsync({
		function(arg_171_0)
			if arg_170_0.contextData.onQuickHome then
				arg_170_0.contextData.onQuickHome(arg_171_0)
			else
				arg_171_0()
			end
		end,
		function(arg_172_0)
			arg_170_0:emit(var_0_0.ON_HOME)
		end
	})
end

function var_0_0.displayDestroyPanel(arg_173_0)
	arg_173_0.destroyPage:ExecuteAction("Show")
	arg_173_0.destroyPage:ActionInvoke("Refresh", arg_173_0.selectedIds, arg_173_0.shipVOsById)
end

function var_0_0.closeDestroyPanel(arg_174_0)
	if arg_174_0.destroyPage:isShowing() then
		arg_174_0.destroyPage:Hide()
	end
end

function var_0_0.checkDestroyShips(arg_175_0, arg_175_1, arg_175_2)
	local var_175_0 = {}

	if PlayerPrefs.GetInt("RetireProtect", 1) == 0 then
		local var_175_1 = {}

		for iter_175_0, iter_175_1 in pairs(arg_175_1) do
			local var_175_2 = 0

			for iter_175_2, iter_175_3 in pairs(arg_175_1) do
				if iter_175_3:getGroupId() == iter_175_1:getGroupId() then
					var_175_2 = var_175_2 + 1
				end
			end

			if #getProxy(BayProxy):findShipsByGroup(iter_175_1:getGroupId()) == var_175_2 then
				local var_175_3 = false

				for iter_175_4, iter_175_5 in pairs(var_175_1) do
					if iter_175_5:getGroupId() == iter_175_1:getGroupId() then
						var_175_3 = true

						break
					end
				end

				if not var_175_3 then
					table.insert(var_175_1, iter_175_1)
				end
			end
		end

		if #var_175_1 > 0 then
			table.insert(var_175_0, function(arg_176_0)
				arg_175_0.destroyConfirmWindow:ExecuteAction("ShowOneShipProtect", var_175_1, arg_176_0)
			end)
		end
	end

	local var_175_4, var_175_5 = ShipCalcHelper.GetEliteAndHightLevelShips(arg_175_1)

	if #var_175_4 > 0 or #var_175_5 > 0 then
		table.insert(var_175_0, function(arg_177_0)
			local var_177_0 = false

			if arg_175_0.contextData.mode == var_0_0.MODE_DESTROY then
				var_177_0 = ({
					ShipCalcHelper.CalcDestoryRes(arg_175_1)
				})[4]
			end

			arg_175_0.destroyConfirmWindow:ExecuteAction("Show", var_175_4, var_175_5, var_177_0, arg_177_0)
		end)
	end

	local var_175_6 = underscore.filter(arg_175_1, function(arg_178_0)
		return arg_178_0:getFlag("inElite")
	end)

	if #var_175_6 > 0 then
		table.insert(var_175_0, function(arg_179_0)
			arg_175_0.destroyConfirmWindow:ExecuteAction("ShowEliteTag", var_175_6, arg_179_0)
		end)
	end

	seriesAsync(var_175_0, arg_175_2)
end

return var_0_0
