local var_0_0 = class("TechnologyTreeScene", import("..base.BaseUI"))

var_0_0.NationTrige = {
	All = 0,
	Mot = 3,
	Meta = 2,
	Other = 1
}
var_0_0.TypeTrige = {
	All = 0,
	Other = 1
}

function var_0_0.getUIName(arg_1_0)
	return "TechnologyTreeUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/Technologytreeui",
		"ui/technologytreeui_atlas",
		"tecclasslevelicon",
		"tecnation",
		"shipraritybaseicon",
		"tecnation"
	}
	local var_2_1 = {}

	for iter_2_0, iter_2_1 in ipairs(pg.fleet_tech_ship_class.all) do
		local var_2_2 = pg.fleet_tech_ship_class[iter_2_1]

		for iter_2_2, iter_2_3 in ipairs(var_2_2.ships) do
			local var_2_3 = ShipGroup.getDefaultSkin(iter_2_3)

			if var_2_3 then
				table.insertto(var_2_1, ResPathSupport.GetShipSkinSpineShipModelList(var_2_3.id))
			end
		end
	end

	return ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_2_0), var_2_0, var_2_1)
end

function var_0_0.init(arg_3_0)
	arg_3_0:initData()
	arg_3_0:findUI()
	arg_3_0:initNationToggleUIList()
	arg_3_0:initTecClassUIList()
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:initTypeToggleUIList()
	arg_4_0:updateTecItemList()
	arg_4_0:addBtnListener()
	setText(arg_4_0.pointNumText, arg_4_0.point)
	arg_4_0:updateRedPoint(getProxy(TechnologyNationProxy):getShowRedPointTag())

	if not PlayerPrefs.HasKey("first_comein_technologytree") then
		triggerButton(arg_4_0.helpBtn)
		PlayerPrefs.SetInt("first_comein_technologytree", 1)
		PlayerPrefs.Save()
	end
end

function var_0_0.updateRedPoint(arg_5_0, arg_5_1)
	setActive(arg_5_0.redPointImg, arg_5_1)
end

function var_0_0.willExit(arg_6_0)
	arg_6_0:UnOverlayPanel(arg_6_0.blurPanel, arg_6_0._tf)

	arg_6_0.rightLSC.onReturnItem = nil

	if arg_6_0.emptyPage then
		arg_6_0.emptyPage:Destroy()

		arg_6_0.emptyPage = nil
	end
end

function var_0_0.initData(arg_7_0)
	TechnologyConst.CreateMetaClassConfig()

	arg_7_0.nationToggleList = {}
	arg_7_0.typeToggleList = {}
	arg_7_0.nationSelectedList = {}
	arg_7_0.typeSelectedList = {}
	arg_7_0.nationSelectedCount = 0
	arg_7_0.typeSelectedCount = 0
	arg_7_0.lastNationTrige = nil
	arg_7_0.lastTypeTrige = nil
	arg_7_0.countInEveryRow = 5
	arg_7_0.collectionProxy = getProxy(CollectionProxy)
	arg_7_0.nationProxy = getProxy(TechnologyNationProxy)
	arg_7_0.curClassIDList = nil
	arg_7_0.groupIDGotList = {}

	local var_7_0 = arg_7_0.collectionProxy.shipGroups

	for iter_7_0, iter_7_1 in pairs(var_7_0) do
		arg_7_0.groupIDGotList[#arg_7_0.groupIDGotList + 1] = iter_7_1.id
	end

	arg_7_0.point = arg_7_0.nationProxy:getPoint()
	arg_7_0.expanded = {}
end

function var_0_0.findUI(arg_8_0)
	arg_8_0.nationAllToggle = nil
	arg_8_0.nationAllToggleCom = nil
	arg_8_0.nationMetaToggle = arg_8_0._tf:Find("Adapt/Left/MetaToggle")
	arg_8_0.nationMetaToggleCom = GetComponent(arg_8_0.nationMetaToggle, "Toggle")
	arg_8_0.nationMotToggle = arg_8_0._tf:Find("Adapt/Left/MotToggle")
	arg_8_0.nationMotToggleCom = GetComponent(arg_8_0.nationMotToggle, "Toggle")
	arg_8_0.typeAllToggle = nil
	arg_8_0.typeAllToggleCom = nil
	arg_8_0.blurPanel = arg_8_0._tf:Find("blur_panel")
	arg_8_0.adapt = arg_8_0.blurPanel:Find("adapt")
	arg_8_0.backBtn = arg_8_0.adapt:Find("top/back")
	arg_8_0.homeBtn = arg_8_0.adapt:Find("top/option")
	arg_8_0.additionDetailBtn = arg_8_0.adapt:Find("AdditionDetailBtn")
	arg_8_0.switchBtn = arg_8_0.adapt:Find("SwitchToggle")
	arg_8_0.pointTF = arg_8_0.adapt:Find("PointCount")
	arg_8_0.pointNumText = arg_8_0.adapt:Find("PointCount/PointNumText")
	arg_8_0.redPointImg = arg_8_0.switchBtn:Find("RedPoint")
	arg_8_0.helpBtn = arg_8_0.adapt:Find("help_btn")
	arg_8_0.leftContainer = arg_8_0._tf:Find("Adapt/Left/Scroll View/Content")
	arg_8_0.selectNationItem = arg_8_0._tf:Find("SelectCampItem")
	arg_8_0.bottomContainer = arg_8_0._tf:Find("Adapt/Bottom/Content")
	arg_8_0.selectTypeItem = arg_8_0._tf:Find("SelectTypeItem")
	arg_8_0.rightContainer = arg_8_0._tf:Find("Adapt/Right/Container")
	arg_8_0.rightLSC = arg_8_0.rightContainer:GetComponent("LScrollRect")
	arg_8_0.rightLayoutGroup = arg_8_0.rightContainer:GetComponent("VerticalLayoutGroup")
	arg_8_0.headItem = arg_8_0._tf:Find("HeadItem")
	arg_8_0.rowHeight = arg_8_0.headItem.rect.height
	arg_8_0.maxRowHeight = 853.5
	arg_8_0.emptyPage = BaseEmptyListPage.New(arg_8_0._tf:Find("Adapt/Right/ViewPort"), arg_8_0.event)
end

function var_0_0.onBackPressed(arg_9_0)
	triggerButton(arg_9_0.backBtn)
end

function var_0_0.addBtnListener(arg_10_0)
	onButton(arg_10_0, arg_10_0.backBtn, function()
		arg_10_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_10_0, arg_10_0.additionDetailBtn, function()
		arg_10_0:emit(TechnologyConst.OPEN_ALL_BUFF_DETAIL)
	end)
	onToggle(arg_10_0, arg_10_0.switchBtn, function(arg_13_0)
		if arg_13_0 then
			setActive(arg_10_0.pointTF, false)
			arg_10_0:OverlayPanel(arg_10_0.blurPanel)
			arg_10_0:emit(TechnologyConst.OPEN_TECHNOLOGY_NATION_LAYER)
		else
			setActive(arg_10_0.pointTF, true)
			arg_10_0:UnOverlayPanel(arg_10_0.blurPanel, arg_10_0._tf)
			arg_10_0:emit(TechnologyConst.CLOSE_TECHNOLOGY_NATION_LAYER)
		end
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.helpBtn, function()
		if pg.gametip.help_technologytree then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_technologytree.tip
			})
		end
	end, SFX_PANEL)
end

function var_0_0.initNationToggleUIList(arg_15_0)
	arg_15_0.nationAllToggle = nil
	arg_15_0.nationAllToggleCom = nil
	arg_15_0.nationMetaToggle = arg_15_0._tf:Find("Adapt/Left/MetaToggle")
	arg_15_0.nationMetaToggleCom = GetComponent(arg_15_0.nationMetaToggle, "Toggle")
	arg_15_0.nationMotToggle = arg_15_0._tf:Find("Adapt/Left/MotToggle")
	arg_15_0.nationMotToggleCom = GetComponent(arg_15_0.nationMotToggle, "Toggle")

	setActive(arg_15_0.nationMetaToggle, not LOCK_TEC_META)

	if LOCK_TEC_META then
		local var_15_0 = arg_15_0._tf:Find("Adapt/Left/Scroll View")

		var_15_0.offsetMin = Vector2.New(var_15_0.offsetMin.x, 0)
	end

	local var_15_1 = UIItemList.New(arg_15_0.leftContainer, arg_15_0.selectNationItem)

	var_15_1:make(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == UIItemList.EventUpdate then
			arg_16_2:Find("UnSelectedImg"):GetComponent("Image").sprite, arg_16_2:Find("SelectedImg"):GetComponent("Image").sprite = TechnologyConst.GetNationSpriteByIndex(arg_16_1 + 1)

			if arg_16_1 == 0 then
				arg_15_0.nationAllToggle = arg_16_2
				arg_15_0.nationAllToggleCom = GetComponent(arg_16_2, "Toggle")
				arg_15_0.nationAllToggleCom.interactable = false

				triggerToggle(arg_16_2, true)
			else
				arg_15_0.nationToggleList[arg_16_1] = arg_16_2

				triggerToggle(arg_16_2, false)
			end

			setActive(arg_16_2, true)
		end
	end)
	var_15_1:align(#TechnologyConst.NationResName)
	setActive(arg_15_0.nationMotToggle, not LOCK_TEC_MOT)

	if not LOCK_TEC_MOT then
		setParent(arg_15_0.nationMotToggle, arg_15_0.leftContainer)
	end

	onToggle(arg_15_0, arg_15_0.nationAllToggle, function(arg_17_0)
		if arg_17_0 == true then
			arg_15_0.lastNationTrige = var_0_0.NationTrige.All
			arg_15_0.nationAllToggleCom.interactable = false
			arg_15_0.nationSelectedCount = 0
			arg_15_0.nationSelectedList = {}

			arg_15_0:updateTecItemList()
			arg_15_0:updateNationToggleUIList()
		else
			arg_15_0.nationAllToggleCom.interactable = true
		end
	end, SFX_PANEL)
	onToggle(arg_15_0, arg_15_0.nationMetaToggle, function(arg_18_0)
		if arg_18_0 == true then
			arg_15_0.lastNationTrige = var_0_0.NationTrige.Meta
			arg_15_0.nationMetaToggleCom.interactable = false
			arg_15_0.nationSelectedCount = 0
			arg_15_0.nationSelectedList = {}

			arg_15_0:updateTecItemList()
			arg_15_0:updateNationToggleUIList()
		else
			arg_15_0.nationMetaToggleCom.interactable = true
		end
	end, SFX_PANEL)
	onToggle(arg_15_0, arg_15_0.nationMotToggle, function(arg_19_0)
		if arg_19_0 == true then
			arg_15_0.lastNationTrige = var_0_0.NationTrige.Mot
			arg_15_0.nationMotToggleCom.interactable = false
			arg_15_0.nationSelectedCount = 0
			arg_15_0.nationSelectedList = {}

			arg_15_0:updateTecItemList()
			arg_15_0:updateNationToggleUIList()
		else
			arg_15_0.nationMotToggleCom.interactable = true
		end
	end, SFX_PANEL)

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.nationToggleList) do
		onToggle(arg_15_0, iter_15_1, function(arg_20_0)
			if arg_20_0 == true then
				arg_15_0.lastNationTrige = var_0_0.NationTrige.Other
				arg_15_0.nationSelectedCount = arg_15_0.nationSelectedCount + 1

				table.insert(arg_15_0.nationSelectedList, TechnologyConst.NationOrder[iter_15_0])

				if arg_15_0.nationSelectedCount < #arg_15_0.nationToggleList then
					arg_15_0:updateNationToggleUIList()
					arg_15_0:updateTecItemList()
				elseif arg_15_0.nationSelectedCount == #arg_15_0.nationToggleList then
					arg_15_0:updateNationToggleUIList()
				end
			elseif arg_15_0.nationSelectedCount > 0 then
				arg_15_0.nationSelectedCount = arg_15_0.nationSelectedCount - 1

				local var_20_0 = table.indexof(arg_15_0.nationSelectedList, TechnologyConst.NationOrder[iter_15_0], 1)

				if var_20_0 then
					table.remove(arg_15_0.nationSelectedList, var_20_0)
				end

				if arg_15_0.nationSelectedCount > 0 then
					arg_15_0:updateNationToggleUIList()
					arg_15_0:updateTecItemList()
				elseif arg_15_0.nationSelectedCount == 0 then
					arg_15_0:updateNationToggleUIList()
				end
			end
		end, SFX_PANEL)
	end
end

function var_0_0.updateNationToggleUIList(arg_21_0)
	if arg_21_0.lastNationTrige == var_0_0.NationTrige.All then
		_.each(arg_21_0.nationToggleList, function(arg_22_0)
			triggerToggle(arg_22_0, false)
			onNextTick(function()
				local var_23_0 = arg_22_0:Find("UnSelectedImg")

				setActive(var_23_0, true)
			end)
		end)
		triggerToggle(arg_21_0.nationMetaToggle, false)
		triggerToggle(arg_21_0.nationMotToggle, false)
	elseif arg_21_0.lastNationTrige == var_0_0.NationTrige.Meta then
		triggerToggle(arg_21_0.nationAllToggle, false)
		_.each(arg_21_0.nationToggleList, function(arg_24_0)
			triggerToggle(arg_24_0, false)
		end)
		triggerToggle(arg_21_0.nationMotToggle, false)
	elseif arg_21_0.lastNationTrige == var_0_0.NationTrige.Mot then
		triggerToggle(arg_21_0.nationAllToggle, false)
		_.each(arg_21_0.nationToggleList, function(arg_25_0)
			triggerToggle(arg_25_0, false)
		end)
		triggerToggle(arg_21_0.nationMetaToggle, false)
	elseif arg_21_0.lastNationTrige == var_0_0.NationTrige.Other then
		if arg_21_0.nationSelectedCount <= 0 or arg_21_0.nationSelectedCount >= #arg_21_0.nationToggleList then
			triggerToggle(arg_21_0.nationAllToggle, true)
		else
			triggerToggle(arg_21_0.nationAllToggle, false)
			triggerToggle(arg_21_0.nationMetaToggle, false)
			triggerToggle(arg_21_0.nationMotToggle, false)
		end
	end
end

function var_0_0.initTypeToggleUIList(arg_26_0)
	arg_26_0.typeAllToggle = nil
	arg_26_0.typeAllToggleCom = nil

	local var_26_0 = UIItemList.New(arg_26_0.bottomContainer, arg_26_0.selectTypeItem)

	var_26_0:make(function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == UIItemList.EventUpdate then
			arg_27_2:Find("UnSelectedImg"):GetComponent("Image").sprite, arg_27_2:Find("SelectedImg"):GetComponent("Image").sprite = TechnologyConst.GetTypeSpriteByIndex(arg_27_1 + 1)
			arg_27_1 = arg_27_1 + 1

			if arg_27_1 == #TechnologyConst.TypeResName then
				arg_26_0.typeAllToggle = arg_27_2
				arg_26_0.typeAllToggleCom = GetComponent(arg_27_2, "Toggle")
				arg_26_0.typeAllToggleCom.interactable = false

				triggerToggle(arg_27_2, true)
			else
				arg_26_0.typeToggleList[arg_27_1] = arg_27_2

				triggerToggle(arg_27_2, false)
			end

			setActive(arg_27_2, true)
		end
	end)
	var_26_0:align(#TechnologyConst.TypeResName)
	onToggle(arg_26_0, arg_26_0.typeAllToggle, function(arg_28_0)
		arg_26_0.lastTypeTrige = var_0_0.TypeTrige.All

		if arg_28_0 == true then
			arg_26_0.typeAllToggleCom.interactable = false
			arg_26_0.typeSelectedCount = 0
			arg_26_0.typeSelectedList = {}

			arg_26_0:updateTecItemList()
			arg_26_0:updateTypeToggleUIList()
		else
			arg_26_0.typeAllToggleCom.interactable = true
		end
	end)

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.typeToggleList) do
		onToggle(arg_26_0, iter_26_1, function(arg_29_0)
			arg_26_0.lastTypeTrige = var_0_0.TypeTrige.Other

			if arg_29_0 == true then
				arg_26_0.typeSelectedCount = arg_26_0.typeSelectedCount + 1

				for iter_29_0, iter_29_1 in ipairs(TechnologyConst.TypeOrder[iter_26_0]) do
					table.insert(arg_26_0.typeSelectedList, iter_29_1)
				end

				if arg_26_0.typeSelectedCount < #arg_26_0.typeToggleList then
					arg_26_0:updateTypeToggleUIList()
					arg_26_0:updateTecItemList()
				elseif arg_26_0.typeSelectedCount == #arg_26_0.typeToggleList then
					arg_26_0:updateTypeToggleUIList()
				end
			elseif arg_26_0.typeSelectedCount > 0 then
				arg_26_0.typeSelectedCount = arg_26_0.typeSelectedCount - 1

				for iter_29_2, iter_29_3 in ipairs(TechnologyConst.TypeOrder[iter_26_0]) do
					local var_29_0 = table.indexof(arg_26_0.typeSelectedList, iter_29_3, 1)

					if var_29_0 then
						table.remove(arg_26_0.typeSelectedList, var_29_0)
					end
				end

				if arg_26_0.typeSelectedCount > 0 then
					arg_26_0:updateTypeToggleUIList()
					arg_26_0:updateTecItemList()
				elseif arg_26_0.typeSelectedCount == 0 then
					arg_26_0:updateTypeToggleUIList()
				end
			end
		end, SFX_PANEL)
	end
end

function var_0_0.updateTypeToggleUIList(arg_30_0)
	if arg_30_0.lastTypeTrige == var_0_0.TypeTrige.All then
		_.each(arg_30_0.typeToggleList, function(arg_31_0)
			triggerToggle(arg_31_0, false)
			onNextTick(function()
				local var_32_0 = arg_31_0:Find("UnSelectedImg")

				setActive(var_32_0, true)
			end)
		end)
	elseif arg_30_0.lastTypeTrige == var_0_0.TypeTrige.Other then
		if arg_30_0.typeSelectedCount <= 0 or arg_30_0.typeSelectedCount >= #arg_30_0.typeToggleList then
			triggerToggle(arg_30_0.typeAllToggle, true)
		else
			triggerToggle(arg_30_0.typeAllToggle, false)
		end
	end
end

function var_0_0.updatePreferredHeight(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = tf(arg_33_1):Find("ShipScrollView/ShipContainer")
	local var_33_1 = arg_33_2 + arg_33_0.rowHeight

	arg_33_0.rightLayoutGroup.padding.bottom = arg_33_0.rightLayoutGroup.padding.bottom + var_33_1 - GetComponent(arg_33_1, "LayoutElement").preferredHeight
	GetComponent(arg_33_1, "LayoutElement").preferredHeight = var_33_1

	local var_33_2 = tf(arg_33_1):Find("ClickBtn/ArrowBtn")

	setLocalRotation(var_33_2, {
		z = arg_33_2 > 0 and 0 or 180
	})
end

function var_0_0.onClassItemUpdate(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = tf(arg_34_2):Find("Name/NameText")
	local var_34_1 = tf(arg_34_2):Find("CampBG")
	local var_34_2 = tf(arg_34_2):Find("Level/LevelImg")
	local var_34_3 = tf(arg_34_2):Find("Level/TypeTextImg")
	local var_34_4 = tf(arg_34_2):Find("ClickBtn")
	local var_34_5 = var_34_4:Find("ArrowBtn")
	local var_34_6 = arg_34_0:getClassConfigForShow(arg_34_1 + 1)
	local var_34_7 = var_34_6.name
	local var_34_8 = var_34_6.nation
	local var_34_9 = var_34_6.shiptype
	local var_34_10 = var_34_6.t_level
	local var_34_11 = var_34_6.ships
	local var_34_12 = arg_34_0:isMetaOn()
	local var_34_13 = arg_34_0:isMotOn()

	setText(var_34_0, var_34_7)

	local var_34_14

	if var_34_12 or var_34_13 then
		setActive(var_34_2, false)
		setActive(var_34_3, false)

		if var_34_12 then
			var_34_14 = GetSpriteFromAtlas("TecNation", "bg_nation_meta")
		elseif var_34_13 then
			var_34_14 = GetSpriteFromAtlas("TecNation", "bg_nation_mot")
		end
	else
		setImageSprite(var_34_2, GetSpriteFromAtlas("TecClassLevelIcon", "T" .. var_34_10), true)
		setImageSprite(var_34_3, GetSpriteFromAtlas("ShipType", "ch_title_" .. var_34_9), true)
		setActive(var_34_2, true)
		setActive(var_34_3, true)

		var_34_14 = GetSpriteFromAtlas("TecNation", "bg_nation_" .. var_34_8)
	end

	setImageSprite(var_34_1, var_34_14)

	local var_34_15 = tf(arg_34_2):Find("ClickBtn/ArrowBtn")

	setLocalRotation(var_34_15, {
		z = 180
	})

	local var_34_16 = tf(arg_34_2):Find("ShipScrollView/ShipContainer")

	arg_34_0:updateShipItemList(var_34_11, var_34_16)

	arg_34_0.expanded[arg_34_1] = 0

	arg_34_0:updatePreferredHeight(arg_34_2, arg_34_0.expanded[arg_34_1])
	setActive(var_34_4, #var_34_11 > 5)
	onButton(arg_34_0, var_34_4, function()
		if defaultValue(arg_34_0.expanded[arg_34_1], 0) > 0 then
			arg_34_0.expanded[arg_34_1] = 0
		else
			arg_34_0.expanded[arg_34_1] = var_34_16.rect.height - arg_34_0.rowHeight
		end

		arg_34_0:updatePreferredHeight(arg_34_2, arg_34_0.expanded[arg_34_1])
	end, SFX_PANEL)
end

function var_0_0.onClassItemReturn(arg_36_0, arg_36_1, arg_36_2)
	if defaultValue(arg_36_0.expanded[arg_36_1], 0) > 0 then
		arg_36_0.expanded[arg_36_1] = 0

		arg_36_0:updatePreferredHeight(arg_36_2, arg_36_0.expanded[arg_36_1])
	end
end

function var_0_0.initTecClassUIList(arg_37_0)
	function arg_37_0.rightLSC.onUpdateItem(arg_38_0, arg_38_1)
		arg_37_0:onClassItemUpdate(arg_38_0, arg_38_1)
	end

	function arg_37_0.rightLSC.onReturnItem(arg_39_0, arg_39_1)
		arg_37_0:onClassItemReturn(arg_39_0, arg_39_1)
	end
end

function var_0_0.updateTecItemList(arg_40_0)
	arg_40_0.expanded = {}

	local var_40_0 = arg_40_0:getClassIDListForShow()

	if arg_40_0.rightLSC.totalCount ~= 0 then
		arg_40_0.rightLSC:SetTotalCount(0)
	end

	arg_40_0.rightLSC:SetTotalCount(#var_40_0)
	arg_40_0.rightLSC:BeginLayout()
	arg_40_0.rightLSC:EndLayout()

	local var_40_1 = #var_40_0

	if var_40_1 <= 0 then
		arg_40_0.emptyPage:ExecuteAction("ShowOrHide", true)
		arg_40_0.emptyPage:ExecuteAction("SetEmptyText", i18n("technology_filter_placeholder"))
	elseif var_40_1 > 0 and arg_40_0.emptyPage:GetLoaded() then
		arg_40_0.emptyPage:ExecuteAction("ShowOrHide", false)
	end
end

function var_0_0.updateShipItemList(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = UIItemList.New(arg_41_2, arg_41_0.headItem)

	var_41_0:make(function(arg_42_0, arg_42_1, arg_42_2)
		if arg_42_0 == UIItemList.EventUpdate then
			local var_42_0 = arg_42_2:Find("BaseImg")
			local var_42_1 = arg_42_2:Find("BaseImg/CharImg")
			local var_42_2 = arg_42_2:Find("NameBG")
			local var_42_3 = var_42_2:Find("NameText")
			local var_42_4 = arg_42_2:Find("Frame")
			local var_42_5 = arg_42_2:Find("Star")
			local var_42_6 = arg_42_2:Find("Star/StarImg")
			local var_42_7 = arg_42_2:Find("Info")
			local var_42_8 = var_42_7:Find("PointText")
			local var_42_9 = var_42_7:Find("BuffGet")
			local var_42_10 = var_42_9:Find("TypeIcon")
			local var_42_11 = var_42_10:Find("AttrIcon")
			local var_42_12 = var_42_10:Find("NumText")
			local var_42_13 = var_42_7:Find("Lock")
			local var_42_14 = var_42_7:Find("BuffComplete")
			local var_42_15 = var_42_14:Find("TypeIcon")
			local var_42_16 = var_42_15:Find("AttrIcon")
			local var_42_17 = var_42_15:Find("NumText")
			local var_42_18 = arg_42_2:Find("BottomBG")
			local var_42_19 = arg_42_2:Find("BottomBG/StatusUnknow")
			local var_42_20 = arg_42_2:Find("BottomBG/StatusResearching")
			local var_42_21 = arg_42_2:Find("ViewIcon")
			local var_42_22 = arg_42_2:Find("keyansaohguang")
			local var_42_23 = arg_41_1[arg_42_1 + 1]

			setText(var_42_3, shortenString(ShipGroup.getDefaultShipNameByGroupID(var_42_23), 6))

			local var_42_24 = var_42_23 * 10 + 1

			setImageSprite(var_42_0, GetSpriteFromAtlas("shipraritybaseicon", "base_" .. pg.ship_data_statistics[var_42_24].rarity))
			LoadSpriteAsync("shipmodels/" .. Ship.getPaintingName(var_42_24), function(arg_43_0)
				if arg_43_0 and not arg_41_0.exited then
					setImageSprite(var_42_1, arg_43_0, true)

					rtf(var_42_1).pivot = getSpritePivot(arg_43_0)
				end
			end)

			if table.indexof(arg_41_0.groupIDGotList, var_42_23, 1) then
				local var_42_25 = pg.fleet_tech_ship_template[var_42_23].add_get_shiptype[1]
				local var_42_26 = pg.fleet_tech_ship_template[var_42_23].add_get_attr
				local var_42_27 = pg.fleet_tech_ship_template[var_42_23].add_get_value

				setImageSprite(var_42_10, GetSpriteFromAtlas("ui/technologytreeui_atlas", "label_" .. var_42_25))
				setImageSprite(var_42_11, GetSpriteFromAtlas("attricon", pg.attribute_info_by_type[var_42_26].name))
				setText(var_42_12, "+" .. var_42_27)
				setActive(var_42_9, true)

				local var_42_28 = arg_41_0.collectionProxy:getShipGroup(var_42_23)

				if var_42_28.maxLV < TechnologyConst.SHIP_LEVEL_FOR_BUFF then
					setActive(var_42_20, true)
					setActive(var_42_19, false)
					setActive(var_42_14, false)
					setImageSprite(var_42_4, GetSpriteFromAtlas("ui/technologytreeui_atlas", "card_bg_normal"))
					setActive(var_42_18, true)
					setActive(var_42_21, true)
					setActive(var_42_13, true)
					setActive(var_42_22, false)

					if var_42_28.star == pg.fleet_tech_ship_template[var_42_23].max_star then
						setText(var_42_8, "+" .. pg.fleet_tech_ship_template[var_42_23].pt_get + pg.fleet_tech_ship_template[var_42_23].pt_upgrage)
					else
						setText(var_42_8, "+" .. pg.fleet_tech_ship_template[var_42_23].pt_get)
					end
				else
					local var_42_29 = pg.fleet_tech_ship_template[var_42_23].add_level_shiptype[1]
					local var_42_30 = pg.fleet_tech_ship_template[var_42_23].add_level_attr
					local var_42_31 = pg.fleet_tech_ship_template[var_42_23].add_level_value

					setImageSprite(var_42_15, GetSpriteFromAtlas("ui/technologytreeui_atlas", "label_" .. var_42_29))
					setImageSprite(var_42_16, GetSpriteFromAtlas("attricon", pg.attribute_info_by_type[var_42_30].name))
					setText(var_42_17, "+" .. var_42_31)
					setActive(var_42_14, true)

					if var_42_28.star == pg.fleet_tech_ship_template[var_42_23].max_star then
						setText(var_42_8, "+" .. pg.fleet_tech_ship_template[var_42_23].pt_get + pg.fleet_tech_ship_template[var_42_23].pt_level + pg.fleet_tech_ship_template[var_42_23].pt_upgrage)
						setImageSprite(var_42_4, GetSpriteFromAtlas("ui/technologytreeui_atlas", "card_bg_finished"))
						setActive(var_42_18, false)
						setActive(var_42_21, false)
						setActive(var_42_20, false)
						setActive(var_42_19, false)
						setActive(var_42_22, true)
					else
						setText(var_42_8, "+" .. pg.fleet_tech_ship_template[var_42_23].pt_get + pg.fleet_tech_ship_template[var_42_23].pt_level)
						setImageSprite(var_42_4, GetSpriteFromAtlas("ui/technologytreeui_atlas", "card_bg_normal"))
						setActive(var_42_18, true)
						setActive(var_42_21, true)
						setActive(var_42_20, true)
						setActive(var_42_19, false)
						setActive(var_42_22, false)
					end

					setActive(var_42_13, false)
				end

				setImageColor(var_42_1, Color.New(1, 1, 1, 1))
				setActive(var_42_2, true)
				setActive(var_42_7, true)
				setActive(var_42_5, true)

				if var_42_28.star == pg.fleet_tech_ship_template[var_42_23].max_star then
					setActive(var_42_6, true)
				else
					setActive(var_42_6, false)
				end

				onButton(arg_41_0, arg_42_2, function()
					arg_41_0:emit(TechnologyConst.OPEN_SHIP_BUFF_DETAIL, var_42_23, var_42_28.maxLV, var_42_28.star)
				end)
			else
				setImageSprite(var_42_4, GetSpriteFromAtlas("ui/technologytreeui_atlas", "card_bg_normal"))
				setImageColor(var_42_1, Color.New(0, 0, 0, 0.4))
				setActive(var_42_21, false)
				setActive(var_42_2, false)
				setActive(var_42_7, false)
				setActive(var_42_20, false)
				setActive(var_42_19, true)
				setActive(var_42_5, false)
				setActive(var_42_13, false)
				setActive(var_42_22, false)
				removeOnButton(arg_42_2)
			end

			setActive(arg_42_2, true)
		end
	end)
	var_41_0:align(#arg_41_1)
end

function var_0_0.getClassIDListForShow(arg_45_0, arg_45_1, arg_45_2)
	arg_45_1 = arg_45_1 or arg_45_0.nationSelectedList
	arg_45_2 = arg_45_2 or arg_45_0.typeSelectedList

	local var_45_0 = arg_45_0:isMetaOn()
	local var_45_1 = arg_45_0:isMotOn()

	if not var_45_0 and not var_45_1 then
		local var_45_2 = TechnologyConst.GetOrderClassList()
		local var_45_3

		if #arg_45_1 == 0 and #arg_45_2 == 0 then
			var_45_3 = var_45_2
		else
			local var_45_4 = #arg_45_1 == 0 and TechnologyConst.NationOrder or arg_45_1

			var_45_3 = _.select(var_45_2, function(arg_46_0)
				local var_46_0 = pg.fleet_tech_ship_class[arg_46_0].nation

				if table.contains(var_45_4, var_46_0) then
					if #arg_45_0.typeSelectedList == 0 then
						return true
					else
						local var_46_1 = pg.fleet_tech_ship_class[arg_46_0].shiptype

						return table.contains(arg_45_0.typeSelectedList, var_46_1)
					end
				else
					return false
				end
			end)
		end

		arg_45_0.curClassIDList = var_45_3

		return var_45_3
	elseif var_45_0 then
		arg_45_0.curMetaClassIDList = TechnologyConst.GetOrderMetaClassList(arg_45_2)

		return arg_45_0.curMetaClassIDList
	elseif var_45_1 then
		arg_45_0.curMotClassIDList = TechnologyConst.GetOrderMotClassList(arg_45_2)

		return arg_45_0.curMotClassIDList
	end
end

function var_0_0.getClassConfigForShow(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:isMetaOn()
	local var_47_1 = arg_47_0:isMotOn()

	if not var_47_0 and not var_47_1 then
		local var_47_2 = arg_47_0.curClassIDList[arg_47_1]

		return pg.fleet_tech_ship_class[var_47_2]
	elseif var_47_0 then
		local var_47_3 = arg_47_0.curMetaClassIDList[arg_47_1]

		return TechnologyConst.GetMetaClassConfig(var_47_3, arg_47_0.typeSelectedList)
	elseif var_47_1 then
		local var_47_4 = arg_47_0.curMotClassIDList[arg_47_1]

		return TechnologyConst.GetMotClassConfig(var_47_4, arg_47_0.typeSelectedList)
	end
end

function var_0_0.isMetaOn(arg_48_0)
	if arg_48_0.lastNationTrige == var_0_0.NationTrige.All then
		return false
	elseif arg_48_0.lastNationTrige == var_0_0.NationTrige.Mot then
		return false
	end

	return arg_48_0.nationMetaToggleCom.isOn
end

function var_0_0.isMotOn(arg_49_0)
	if arg_49_0.lastNationTrige == var_0_0.NationTrige.All then
		return false
	elseif arg_49_0.lastNationTrige == var_0_0.NationTrige.Meta then
		return false
	end

	return arg_49_0.nationMotToggleCom.isOn
end

return var_0_0
