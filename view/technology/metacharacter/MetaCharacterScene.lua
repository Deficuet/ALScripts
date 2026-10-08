local var_0_0 = class("MetaCharacterScene", import("...base.BaseUI"))

var_0_0.PAGES = {
	REPAIR = 3,
	ENERGY = 1,
	TACTICS = 2,
	SYN = 4
}
var_0_0.PAGES_EVENTS = {
	MetaCharacterMediator.ON_ENERGY,
	MetaCharacterMediator.ON_TACTICS,
	MetaCharacterMediator.ON_REPAIR,
	MetaCharacterMediator.ON_SYN
}
var_0_0.SCALE_ON_PITCH = {
	x = 1.7,
	y = 1.7
}
var_0_0.ON_SKILL = "MetaCharacterScene:ON_SKILL"

function var_0_0.getUIName(arg_1_0)
	return "MetaCharacterUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/metacharacterui",
		"ui/metacharactertacticsui",
		"ui/metacharacterenergyui",
		"ui/metacharacterrepairui",
		"ui/metacharactersynui"
	}
	local var_2_1 = {}
	local var_2_2 = getProxy(MetaCharacterProxy):getMetaProgressVOList()

	for iter_2_0, iter_2_1 in ipairs(var_2_2) do
		if iter_2_1 and iter_2_1:isShow() then
			local var_2_3, var_2_4 = iter_2_1:getBannerPathAndName()

			table.insert(var_2_1, var_2_3)

			local var_2_5, var_2_6 = iter_2_1:getPaintPathAndName()

			table.insert(var_2_1, var_2_5)

			local var_2_7, var_2_8 = iter_2_1:getBGNamePathAndName()

			table.insert(var_2_1, var_2_7)
		end
	end

	return ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_2_0, arg_2_1), var_2_0, var_2_1)
end

function var_0_0.init(arg_3_0)
	Input.multiTouchEnabled = false

	arg_3_0:initUITextTips()
	arg_3_0:initData()
	arg_3_0:findUI()
	arg_3_0:addListener()
	arg_3_0:initMetaProgressList()
	arg_3_0:initBannerList()
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:overLayPanel(true)
	arg_4_0:updateStart()
	arg_4_0:autoOpenFunc()
end

function var_0_0.willExit(arg_5_0)
	Input.multiTouchEnabled = true

	arg_5_0:overLayPanel(false)
end

function var_0_0.initUITextTips(arg_6_0)
	local var_6_0 = arg_6_0._tf:Find("HidePanel/ScrollPanel/ListPanel/BannerTpl/ForScale")
	local var_6_1 = var_6_0:Find("Empty/ActType/TipText")
	local var_6_2 = var_6_0:Find("Empty/BuildType/TipText")
	local var_6_3 = var_6_0:Find("Active/ActType/Text")
	local var_6_4 = var_6_0:Find("Active/BuildType/Text")

	setText(var_6_1, i18n("meta_syn_rate"))
	setText(var_6_2, i18n("meta_build"))
	setText(var_6_3, i18n("meta_repair_rate"))
	setText(var_6_4, i18n("meta_build"))

	local var_6_5 = arg_6_0._tf:Find("HidePanel/PTPanel/Progress/Story/TipText1")
	local var_6_6 = arg_6_0._tf:Find("HidePanel/PTPanel/Progress/Story/TipText2")

	setText(var_6_5, i18n("meta_story_tip_1"))
	setText(var_6_6, i18n("meta_story_tip_2"))

	local var_6_7 = arg_6_0._tf:Find("HidePanel/ActTimeTip/Tip")

	setText(var_6_7, i18n("meta_acttime_limit"))
end

function var_0_0.initData(arg_7_0)
	arg_7_0.metaProgressVOList = {}
	arg_7_0.curMetaGroupID = nil
	arg_7_0.curMetaProgress = nil
	arg_7_0.toggleList = {}
	arg_7_0.bannerTFList = {}
	arg_7_0.curPageIndex = nil
	arg_7_0.curMetaIndex = nil
	arg_7_0.metaCharacterProxy = getProxy(MetaCharacterProxy)
	arg_7_0.bayProxy = getProxy(BayProxy)
	arg_7_0.indexDatas = {}
end

function var_0_0.findUI(arg_8_0)
	arg_8_0.shipImg = arg_8_0._tf:Find("HidePanel/ShipImg")
	arg_8_0.shipNameImg = arg_8_0._tf:Find("HidePanel/NameImg")
	arg_8_0.noCharTF = arg_8_0._tf:Find("BG/NoCharacter")
	arg_8_0.indexBtn = arg_8_0._tf:Find("blur_panel/adapt/top/index")
	arg_8_0.hidePanel = arg_8_0._tf:Find("HidePanel")
	arg_8_0.scrollPanel = arg_8_0.hidePanel:Find("ScrollPanel")
	arg_8_0.bannerListPanel = arg_8_0.scrollPanel:Find("ListPanel")
	arg_8_0.bannerContainer = arg_8_0.bannerListPanel:Find("Container")
	arg_8_0.bannerTpl = arg_8_0.bannerListPanel:Find("BannerTpl")
	arg_8_0.actTimePanel = arg_8_0.hidePanel:Find("ActTimeTip")
	arg_8_0.actTimeText = arg_8_0.actTimePanel:Find("Text")
	arg_8_0.menuPanel = arg_8_0.hidePanel:Find("MenuPanel")
	arg_8_0.energyBtn = arg_8_0.menuPanel:Find("EnergyBtn")
	arg_8_0.repairBtn = arg_8_0.menuPanel:Find("RepairBtn")
	arg_8_0.tacticsBtn = arg_8_0.menuPanel:Find("TacticsBtn")
	arg_8_0.synBtn = arg_8_0.menuPanel:Find("SynBtn")
	arg_8_0.synDecorateTF = arg_8_0.menuPanel:Find("SynDecorate")
	arg_8_0.synBtnLimitTimeTF = arg_8_0.synBtn:Find("Limit")
	arg_8_0.synBtnLock = arg_8_0.synBtn:Find("LockMask")
	arg_8_0.ptPanel = arg_8_0.hidePanel:Find("PTPanel")
	arg_8_0.ptRedBarImg = arg_8_0.ptPanel:Find("RedBar")
	arg_8_0.ptPreviewBtn = arg_8_0.ptPanel:Find("PreviewBtn")
	arg_8_0.ptGetBtn = arg_8_0.ptPanel:Find("SynBtn")
	arg_8_0.ptGetBtnTag = arg_8_0.ptGetBtn:Find("Tag")
	arg_8_0.ptShowWayBtn = arg_8_0.ptPanel:Find("ShowWayBtn")

	local var_8_0 = arg_8_0.ptPanel:Find("Progress")

	arg_8_0.ptProgressImg = var_8_0:Find("CircleProgress/ProgressImg")
	arg_8_0.ptProgressScaleLine = var_8_0:Find("CircleProgress/ScaleLine")
	arg_8_0.ptInfoPanel = var_8_0:Find("PT")
	arg_8_0.ptProgressRedRightNumText = arg_8_0.ptInfoPanel:Find("ProgressTextBG/PointRedText/RightNumText")
	arg_8_0.ptProgressRedLeftNumText = arg_8_0.ptInfoPanel:Find("ProgressTextBG/PointRedText/LeftNumText")
	arg_8_0.ptProgressWhiteRightNumText = arg_8_0.ptInfoPanel:Find("ProgressTextBG/PointText/RightNumText")
	arg_8_0.ptProgressWhiteLeftNumText = arg_8_0.ptInfoPanel:Find("ProgressTextBG/PointText/LeftNumText")
	arg_8_0.ptIcon = arg_8_0.ptInfoPanel:Find("PTProgressText/PTIcon")
	arg_8_0.ptProgressRedText = arg_8_0.ptInfoPanel:Find("PTProgressRedText")
	arg_8_0.ptProgressWhiteText = arg_8_0.ptInfoPanel:Find("PTProgressText")
	arg_8_0.storyInfoPanel = var_8_0:Find("Story")

	local var_8_1 = arg_8_0.storyInfoPanel:Find("TipText1")
	local var_8_2 = arg_8_0.storyInfoPanel:Find("TipText2")

	arg_8_0.storyNameText = arg_8_0.storyInfoPanel:Find("StroyNameText")
	arg_8_0.getShipBtn = var_8_0:Find("FinishBtn")
	arg_8_0.goGetPanel = arg_8_0.hidePanel:Find("GoGetPanel")
	arg_8_0.goGetBtn = arg_8_0.goGetPanel:Find("GoGetBtn")
	arg_8_0.blurPanel = arg_8_0._tf:Find("blur_panel")

	local var_8_3 = arg_8_0.blurPanel:Find("adapt")

	arg_8_0.backBtn = var_8_3:Find("top/back")
	arg_8_0.helpBtn = var_8_3:Find("top/help")
	arg_8_0.toggleBtnsTF = var_8_3:Find("left/Btns")
	arg_8_0.toggleGroupSC = GetComponent(arg_8_0.toggleBtnsTF, "ToggleGroup")
	arg_8_0.toggleGroupSC.allowSwitchOff = true
	arg_8_0.toggleList[1] = arg_8_0.toggleBtnsTF:Find("Energy")
	arg_8_0.toggleList[2] = arg_8_0.toggleBtnsTF:Find("Tactics")
	arg_8_0.toggleList[3] = arg_8_0.toggleBtnsTF:Find("Repair")
	arg_8_0.toggleList[4] = arg_8_0.toggleBtnsTF:Find("Syn")
	arg_8_0.synToggleLock = arg_8_0.toggleBtnsTF:Find("SynLock")
end

function var_0_0.addListener(arg_9_0)
	onButton(arg_9_0, arg_9_0.backBtn, function()
		local var_10_0 = arg_9_0.curPageIndex

		if var_10_0 then
			arg_9_0:enterMenuPage(false)
			arg_9_0:emit(var_0_0.PAGES_EVENTS[arg_9_0.curPageIndex], nil, false)

			if var_10_0 == var_0_0.PAGES.REPAIR then
				arg_9_0:backFromRepair()
			else
				arg_9_0:backFromNotRepair()
			end
		else
			arg_9_0:closeView()
		end
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.meta_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.indexBtn, function()
		arg_9_0:openIndexLayer()
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.goGetBtn, function()
		local var_13_0 = arg_9_0:getCurMetaProgressVO()
		local var_13_1 = var_13_0:isPassType()
		local var_13_2 = var_13_0:isBuildType()

		if var_13_1 then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
		elseif var_13_2 then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT, {
				page = BuildShipScene.PAGE_BUILD,
				projectName = BuildShipScene.PROJECTS.ACTIVITY
			})
		end
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.ptPreviewBtn, function()
		arg_9_0:emit(MetaCharacterMediator.OPEN_PT_PREVIEW_LAYER, arg_9_0:getCurMetaProgressVO())
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.ptGetBtn, function()
		local var_15_0 = arg_9_0:getCurMetaProgressVO()
		local var_15_1 = var_15_0:getMetaProgressPTState()

		if var_15_1 == MetaProgress.STATE_CAN_AWARD then
			local var_15_2, var_15_3 = arg_9_0:getOneStepPTAwardLevelAndCount()

			pg.m02:sendNotification(GAME.GET_META_PT_AWARD, {
				groupID = var_15_0.id,
				targetCount = var_15_3
			})
		elseif var_15_1 == MetaProgress.STATE_LESS_PT then
			local var_15_4 = false
			local var_15_5 = nowWorld()

			if var_15_5 then
				var_15_4 = var_15_5:IsSystemOpen(WorldConst.SystemWorldBoss)
			end

			local var_15_6 = var_15_4 and "meta_pt_notenough" or "meta_boss_unlock"

			pg.TipsMgr.GetInstance():ShowTips(i18n(var_15_6))
		elseif var_15_1 == MetaProgress.STATE_LESS_STORY then
			pg.TipsMgr.GetInstance():ShowTips(i18n("meta_story_lock"))
		end
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.ptShowWayBtn, function()
		local var_16_0 = false
		local var_16_1 = nowWorld()

		if var_16_1 then
			var_16_0 = var_16_1:IsSystemOpen(WorldConst.SystemWorldBoss)
		end

		local var_16_2 = var_16_0 and "meta_pt_notenough" or "meta_boss_unlock"

		pg.TipsMgr.GetInstance():ShowTips(i18n(var_16_2))
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.getShipBtn, function()
		local var_17_0 = arg_9_0:getCurMetaProgressVO()
		local var_17_1, var_17_2 = var_17_0.metaPtData:GetResProgress()

		pg.m02:sendNotification(GAME.GET_META_PT_AWARD, {
			groupID = var_17_0.id,
			targetCount = var_17_2
		})
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.synToggleLock, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.synBtnLock, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
	end)
	onButton(arg_9_0, arg_9_0.repairBtn:Find("RepairBtn"), function()
		arg_9_0:switchPage(var_0_0.PAGES.REPAIR)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.energyBtn, function()
		arg_9_0.isMainOpenLayerTag = true

		arg_9_0:switchPage(var_0_0.PAGES.ENERGY)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.tacticsBtn, function()
		arg_9_0.isMainOpenLayerTag = true

		arg_9_0:switchPage(var_0_0.PAGES.TACTICS)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.synBtn, function()
		if not isActive(arg_9_0.synBtnLock) then
			arg_9_0.isMainOpenLayerTag = true

			arg_9_0:switchPage(var_0_0.PAGES.SYN)
		end
	end, SFX_PANEL)

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.toggleList) do
		onToggle(arg_9_0, iter_9_1, function(arg_24_0)
			if arg_9_0.curPageIndex == iter_9_0 and arg_24_0 == true then
				return
			end

			local var_24_0 = arg_9_0:getCurMetaProgressVO():getShip()

			if arg_9_0.curPageIndex == iter_9_0 and arg_24_0 == false then
				arg_9_0:enterMenuPage(false)
				arg_9_0:emit(var_0_0.PAGES_EVENTS[iter_9_0], var_24_0.id, false)
			end

			if arg_9_0.curPageIndex ~= iter_9_0 and arg_24_0 == true then
				arg_9_0:enterMenuPage(true)

				arg_9_0.curPageIndex = iter_9_0

				arg_9_0:emit(var_0_0.PAGES_EVENTS[iter_9_0], var_24_0.id, true)
			end
		end)
	end
end

function var_0_0.resetToggleList(arg_25_0)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.toggleList) do
		setActive(iter_25_1:Find("On"), false)
		setActive(iter_25_1:Find("Off"), true)
	end
end

function var_0_0.initMetaProgressList(arg_26_0)
	arg_26_0.metaProgressVOList = arg_26_0:getMetaProgressListForShow()

	arg_26_0:fillMetaProgressList()
end

function var_0_0.fillMetaProgressList(arg_27_0)
	if #arg_27_0.metaProgressVOList < 5 then
		for iter_27_0 = #arg_27_0.metaProgressVOList + 1, 5 do
			table.insert(arg_27_0.metaProgressVOList, false)
		end
	end
end

function var_0_0.initBannerList(arg_28_0)
	arg_28_0.scrollUIItemList = UIItemList.New(arg_28_0.bannerContainer, arg_28_0.bannerTpl)

	arg_28_0.scrollUIItemList:make(function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == UIItemList.EventUpdate then
			table.insert(arg_28_0.bannerTFList, arg_29_2)

			local var_29_0 = arg_28_0.metaProgressVOList[arg_29_1 + 1]

			arg_28_0:updateBannerTF(var_29_0, arg_29_2, arg_29_1 + 1)
		end
	end)
end

function var_0_0.updateBannerTF(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = arg_30_2
	local var_30_1 = arg_30_2:Find("ForScale")
	local var_30_2 = var_30_1:Find("WillCome")
	local var_30_3 = var_30_1:Find("Empty")
	local var_30_4 = var_30_1:Find("Active")

	if arg_30_1 then
		local var_30_5 = arg_30_1:isInAct()
		local var_30_6 = var_30_3:Find("ActType/Tag")
		local var_30_7 = var_30_3:Find("BuildType/Tag")
		local var_30_8 = var_30_4:Find("ActType/Tag")
		local var_30_9 = var_30_4:Find("BuildType/Tag")

		setActive(var_30_6, var_30_5)
		setActive(var_30_7, var_30_5)
		setActive(var_30_8, var_30_5)
		setActive(var_30_9, var_30_5)
	end

	if arg_30_1 then
		local var_30_10 = Ship.New({
			configId = tonumber(arg_30_1.configId .. 1)
		}):getName()
		local var_30_11
		local var_30_12 = var_30_1:Find("Empty/ActType/ShipNameMask/ShipNameText")

		setText(var_30_12, var_30_10)
		setScrollText(var_30_12, var_30_10)
		setActive(var_30_12, true)

		local var_30_13 = var_30_1:Find("Empty/BuildType/ShipNameMask/ShipNameText")

		setText(var_30_13, var_30_10)
		setScrollText(var_30_13, var_30_10)
		setActive(var_30_13, true)

		local var_30_14 = var_30_1:Find("Empty/PassType/ShipNameMask/ShipNameText")

		setText(var_30_14, var_30_10)
		setScrollText(var_30_14, var_30_10)
		setActive(var_30_14, true)

		local var_30_15 = var_30_1:Find("Active/ActType/ShipNameMask/ShipNameText")

		setText(var_30_15, var_30_10)
		setScrollText(var_30_15, var_30_10)
		setActive(var_30_15, true)

		local var_30_16 = var_30_1:Find("Active/BuildType/ShipNameMask/ShipNameText")

		setText(var_30_16, var_30_10)
		setScrollText(var_30_16, var_30_10)
		setActive(var_30_16, true)

		local var_30_17 = var_30_1:Find("Active/PassType/ShipNameMask/ShipNameText")

		setText(var_30_17, var_30_10)
		setScrollText(var_30_17, var_30_10)
		setActive(var_30_17, true)
	end

	if arg_30_1 == false then
		setActive(var_30_2, true)
		setActive(var_30_3, false)
		setActive(var_30_4, false)
	else
		setActive(var_30_2, false)

		local var_30_18 = arg_30_1:isUnlocked()

		setActive(var_30_3, not var_30_18)
		setActive(var_30_4, var_30_18)

		local var_30_19 = arg_30_1:isPtType()
		local var_30_20 = arg_30_1:isPassType()
		local var_30_21 = arg_30_1:isBuildType()

		if not var_30_18 then
			local var_30_22 = var_30_1:Find("Empty/ActType")
			local var_30_23 = var_30_1:Find("Empty/BuildType")
			local var_30_24 = var_30_1:Find("Empty/PassType")

			setActive(var_30_22, var_30_19)
			setActive(var_30_23, var_30_21)
			setActive(var_30_24, var_30_20)

			local var_30_25, var_30_26 = arg_30_1:getBannerPathAndName()
			local var_30_27 = LoadSprite(var_30_25, var_30_26)

			setImageSprite(var_30_22, var_30_27)
			setImageSprite(var_30_23, var_30_27)
			setImageSprite(var_30_24, var_30_27)

			if var_30_19 then
				local var_30_28 = var_30_22:Find("NumText")
				local var_30_29 = string.format("%d", arg_30_1:getSynRate() * 100) .. "%"

				setText(var_30_28, var_30_29)

				local var_30_30 = var_30_22:Find("Slider")

				setSlider(var_30_30, 0, 1, arg_30_1:getSynRate())
				setActive(var_30_30, false)
			end

			local var_30_31 = pg.ship_strengthen_meta[arg_30_1.configId].ship_id
			local var_30_32 = Ship.New({
				configId = var_30_31
			})
			local var_30_33 = var_30_32:getMaxStar()
			local var_30_34 = var_30_32:getStar()
			local var_30_35 = var_30_1:Find("Empty/StarTpl")
			local var_30_36 = var_30_1:Find("Empty/Stars")
			local var_30_37 = UIItemList.New(var_30_36, var_30_35)

			var_30_37:make(function(arg_31_0, arg_31_1, arg_31_2)
				if arg_31_0 == UIItemList.EventUpdate then
					arg_31_1 = arg_31_1 + 1

					local var_31_0 = arg_31_2:Find("On")

					setActive(var_31_0, arg_31_1 <= var_30_34)
				end
			end)
			var_30_37:align(var_30_33)
		else
			local var_30_38 = var_30_1:Find("Active/ActType")
			local var_30_39 = var_30_1:Find("Active/BuildType")
			local var_30_40 = var_30_1:Find("Active/PassType")

			setActive(var_30_38, var_30_19)
			setActive(var_30_39, var_30_21)
			setActive(var_30_40, var_30_20)

			local var_30_41, var_30_42 = arg_30_1:getBannerPathAndName()
			local var_30_43 = LoadSprite(var_30_41, var_30_42)

			setImageSprite(var_30_1:Find("Active"), LoadSprite(var_30_41, var_30_42))

			local var_30_44 = arg_30_1:getShip()
			local var_30_45 = var_30_44:getMetaCharacter()

			if var_30_19 then
				local var_30_46 = var_30_38:Find("NumText")
				local var_30_47 = string.format("%d", var_30_45:getRepairRate() * 100) .. "%"

				setText(var_30_46, var_30_47)

				local var_30_48 = var_30_38:Find("Slider")

				setSlider(var_30_48, 0, 1, var_30_45:getRepairRate())
				setActive(var_30_48, false)
			end

			local var_30_49 = var_30_44:getMaxStar()
			local var_30_50 = var_30_44:getStar()
			local var_30_51 = var_30_1:Find("Active/StarTpl")
			local var_30_52 = var_30_1:Find("Active/Stars")
			local var_30_53 = UIItemList.New(var_30_52, var_30_51)

			var_30_53:make(function(arg_32_0, arg_32_1, arg_32_2)
				if arg_32_0 == UIItemList.EventUpdate then
					arg_32_1 = arg_32_1 + 1

					local var_32_0 = arg_32_2:Find("On")

					setActive(var_32_0, arg_32_1 <= var_30_50)
				end
			end)
			var_30_53:align(var_30_49)
		end
	end

	onButton(arg_30_0, var_30_0, function()
		if arg_30_0.curMetaIndex ~= arg_30_3 then
			if arg_30_0.curMetaIndex and arg_30_0.curMetaIndex > 0 then
				arg_30_0:changeBannerOnClick(arg_30_0.bannerTFList[arg_30_0.curMetaIndex], false)
			end

			arg_30_0.curMetaIndex = arg_30_3

			arg_30_0:changeBannerOnClick(var_30_0, true)
			arg_30_0:updateMain()
		end
	end, SFX_PANEL)

	if arg_30_1 == false then
		setButtonEnabled(var_30_0, false)
	else
		setButtonEnabled(var_30_0, true)
	end
end

function var_0_0.changeBannerOnClick(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_1:GetComponent("LayoutElement")
	local var_34_1 = arg_34_1:Find("ForScale")

	if arg_34_2 == true then
		setLocalScale(var_34_1, var_0_0.SCALE_ON_PITCH)

		var_34_0.preferredWidth = 338.3
		var_34_0.preferredHeight = 102
	else
		setLocalScale(var_34_1, Vector2.one)

		var_34_0.preferredWidth = 199
		var_34_0.preferredHeight = 60
	end

	local var_34_2 = var_34_1:Find("SelectedTag")

	setActive(var_34_2, arg_34_2)
end

function var_0_0.updateBannerShipName(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_1:Find("ForScale")
	local var_35_1 = var_35_0:Find("SelectedTag")
	local var_35_2 = isActive(var_35_1)
	local var_35_3
	local var_35_4 = var_35_0:Find("Empty/ActType/ShipNameText")

	setActive(var_35_4, var_35_2)

	local var_35_5 = var_35_0:Find("Empty/BuildType/ShipNameText")

	setActive(var_35_5, var_35_2)

	local var_35_6 = var_35_0:Find("Active/ActType/ShipNameText")

	setActive(var_35_6, var_35_2)

	local var_35_7 = var_35_0:Find("Active/BuildType/ShipNameText")

	setActive(var_35_7, var_35_2)

	local var_35_8
	local var_35_9 = var_35_0:Find("Empty/ActType/TipText")

	setActive(var_35_9, not var_35_2)

	local var_35_10 = var_35_0:Find("Empty/BuildType/TipText")

	setActive(var_35_10, not var_35_2)

	local var_35_11 = var_35_0:Find("Active/ActType/Text")

	setActive(var_35_11, not var_35_2)

	local var_35_12 = var_35_0:Find("Active/BuildType/Text")

	setActive(var_35_12, not var_35_2)
end

function var_0_0.updateBannerUIList(arg_36_0)
	arg_36_0.bannerTFList = {}

	arg_36_0.scrollUIItemList:align(#arg_36_0.metaProgressVOList)
end

function var_0_0.updateStart(arg_37_0)
	local var_37_0 = false

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.metaProgressVOList) do
		if iter_37_1 ~= false then
			var_37_0 = true

			break
		end
	end

	local var_37_1 = arg_37_0.indexBtn:Find("On")

	setActive(var_37_1, not arg_37_0:isDefaultStatus())
	setActive(arg_37_0.noCharTF, not var_37_0)
	setActive(arg_37_0.hidePanel, var_37_0)

	if not var_37_0 then
		return
	end

	arg_37_0:resetBannerListScale()
	arg_37_0:updateBannerUIList()

	arg_37_0.curMetaIndex = nil

	if var_37_0 then
		triggerButton(arg_37_0.bannerTFList[1])
	end
end

function var_0_0.resetBannerListScale(arg_38_0)
	for iter_38_0, iter_38_1 in ipairs(arg_38_0.bannerTFList) do
		local var_38_0 = iter_38_1:GetComponent("LayoutElement")
		local var_38_1 = iter_38_1:Find("ForScale")

		setLocalScale(var_38_1, Vector2.one)

		var_38_0.preferredWidth = 199
		var_38_0.preferredHeight = 60
	end
end

function var_0_0.updateMain(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:getCurMetaProgressVO()
	local var_39_1 = var_39_0:isUnlocked()

	setActive(arg_39_0.menuPanel, var_39_1)
	setActive(arg_39_0.ptPanel, not var_39_1)
	setActive(arg_39_0.goGetPanel, not var_39_1)
	arg_39_0:updateActTimePanel()

	if not var_39_1 then
		local var_39_2 = var_39_0:isPtType()
		local var_39_3 = var_39_0:isPassType()
		local var_39_4 = var_39_0:isBuildType()

		setActive(arg_39_0.ptPanel, var_39_2)
		setActive(arg_39_0.goGetPanel, var_39_3 or var_39_4)

		if var_39_2 then
			arg_39_0:updatePTPanel(arg_39_1)
		end
	else
		arg_39_0:TryPlayGuide()
	end

	arg_39_0:updateRedPoints()

	local var_39_5, var_39_6 = var_39_0:getPaintPathAndName()

	setImageSprite(arg_39_0.shipImg, LoadSprite(var_39_5, var_39_6), true)

	local var_39_7, var_39_8 = var_39_0:getBGNamePathAndName()

	setImageSprite(arg_39_0.shipNameImg, LoadSprite(var_39_7, var_39_8), true)

	local var_39_9 = var_39_0.id
	local var_39_10 = MetaCharacterConst.UIConfig[var_39_9]

	setLocalPosition(arg_39_0.shipImg, {
		x = var_39_10[1],
		y = var_39_10[2]
	})
	setLocalScale(arg_39_0.shipImg, {
		x = var_39_10[3],
		y = var_39_10[4]
	})
end

function var_0_0.TryPlayGuide(arg_40_0)
	pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0024")
end

function var_0_0.updateActTimePanel(arg_41_0)
	local var_41_0 = arg_41_0:getCurMetaProgressVO()
	local var_41_1 = var_41_0:isUnlocked()
	local var_41_2 = var_41_0:isInAct()

	setActive(arg_41_0.actTimePanel, not var_41_1 and var_41_2)
	setActive(arg_41_0.synBtnLimitTimeTF, var_41_2)

	if var_41_2 then
		local var_41_3 = var_41_0.timeConfig[1][1]
		local var_41_4 = var_41_0.timeConfig[2][1]
		local var_41_5 = "%d.%d.%d-%d.%d.%d"
		local var_41_6 = string.format(var_41_5, var_41_3[1], var_41_3[2], var_41_3[3], var_41_4[1], var_41_4[2], var_41_4[3])

		setText(arg_41_0.actTimeText, var_41_6)

		local var_41_7 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_41_0.timeConfig[2])
		local var_41_8 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_41_9 = pg.TimeMgr.GetInstance():DiffDay(var_41_8, var_41_7)
		local var_41_10 = arg_41_0.synBtnLimitTimeTF:Find("Text")

		setText(var_41_10, i18n("meta_pt_left", var_41_9))
	end
end

function var_0_0.updatePTPanel(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0:getCurMetaProgressVO()
	local var_42_1 = var_42_0:getSynRate()
	local var_42_2 = var_42_1 * 100
	local var_42_3 = tonumber(tostring(var_42_2))

	setImageSprite(arg_42_0.ptIcon, LoadSprite(var_42_0:getPtIconPath()))
	setFillAmount(arg_42_0.ptProgressImg, var_42_1)
	setActive(arg_42_0.ptProgressScaleLine, var_42_1 < 1)

	arg_42_0.ptProgressScaleLine.localEulerAngles = Vector3(0, 0, -360 * var_42_1)

	local var_42_4 = string.format("%d", var_42_3)
	local var_42_5 = (var_42_3 - math.floor(var_42_3)) * 100 == 0
	local var_42_6 = string.format("%2d", (var_42_3 - math.floor(var_42_3)) * 100)

	var_42_6 = var_42_5 and var_42_6 .. "0%" or var_42_6 .. "%"

	setText(arg_42_0.ptProgressRedLeftNumText, var_42_4)
	setText(arg_42_0.ptProgressWhiteLeftNumText, var_42_4)
	setText(arg_42_0.ptProgressRedRightNumText, var_42_6)
	setText(arg_42_0.ptProgressWhiteRightNumText, var_42_6)

	local var_42_7, var_42_8, var_42_9 = var_42_0.metaPtData:GetResProgress()

	setText(arg_42_0.ptProgressRedText, (var_42_9 >= 1 and setColorStr(var_42_7, COLOR_GREEN) or setColorStr(var_42_7, COLOR_RED)) .. "/" .. var_42_8)
	setText(arg_42_0.ptProgressWhiteText, (var_42_9 >= 1 and setColorStr(var_42_7, COLOR_GREEN) or setColorStr(var_42_7, COLOR_RED)) .. "/" .. var_42_8)

	local var_42_10 = var_42_0:getMetaProgressPTState()

	if var_42_10 == MetaProgress.STATE_CAN_FINISH then
		setActive(arg_42_0.ptRedBarImg, true)
		setActive(arg_42_0.ptPreviewBtn, false)
		setActive(arg_42_0.ptGetBtn, false)
		setActive(arg_42_0.ptShowWayBtn, false)
		setActive(arg_42_0.ptInfoPanel, false)
		setActive(arg_42_0.storyInfoPanel, false)
		setActive(arg_42_0.getShipBtn, true)
	elseif var_42_10 == MetaProgress.STATE_CAN_AWARD then
		setActive(arg_42_0.ptRedBarImg, false)
		setActive(arg_42_0.ptPreviewBtn, true)
		setActive(arg_42_0.ptGetBtn, true)
		setActive(arg_42_0.ptShowWayBtn, false)
		setActive(arg_42_0.ptGetBtnTag, true)
		setActive(arg_42_0.ptInfoPanel, true)
		setActive(arg_42_0.storyInfoPanel, false)
		setActive(arg_42_0.getShipBtn, false)
		setImageAlpha(arg_42_0.ptPreviewBtn, 0)
		setImageAlpha(arg_42_0.ptGetBtn, 0)
		setImageAlpha(arg_42_0.ptGetBtnTag, 0)
		setImageAlpha(arg_42_0.ptShowWayBtn, 0)
	elseif var_42_10 == MetaProgress.STATE_LESS_STORY then
		setActive(arg_42_0.ptRedBarImg, true)
		setActive(arg_42_0.ptPreviewBtn, true)
		setActive(arg_42_0.ptGetBtn, true)
		setActive(arg_42_0.ptShowWayBtn, false)
		setActive(arg_42_0.ptGetBtnTag, false)
		setActive(arg_42_0.ptInfoPanel, false)
		setActive(arg_42_0.storyInfoPanel, true)
		setActive(arg_42_0.getShipBtn, false)

		local var_42_11 = var_42_0:getCurLevelStoryName()

		setText(arg_42_0.storyNameText, var_42_11)
	elseif var_42_10 == MetaProgress.STATE_LESS_PT then
		setActive(arg_42_0.ptRedBarImg, false)
		setActive(arg_42_0.ptPreviewBtn, true)
		setActive(arg_42_0.ptGetBtn, false)
		setActive(arg_42_0.ptShowWayBtn, true)
		setActive(arg_42_0.ptGetBtnTag, false)
		setActive(arg_42_0.ptInfoPanel, true)
		setActive(arg_42_0.storyInfoPanel, false)
		setActive(arg_42_0.getShipBtn, false)
		setImageAlpha(arg_42_0.ptPreviewBtn, 0)
		setImageAlpha(arg_42_0.ptGetBtn, 0)
		setImageAlpha(arg_42_0.ptShowWayBtn, 0)
	end

	if var_42_1 > 0 and not arg_42_1 then
		if var_42_10 == MetaProgress.STATE_CAN_AWARD or var_42_10 == MetaProgress.STATE_LESS_PT then
			local var_42_12 = math.min(var_42_1, 1)

			arg_42_0:managedTween(LeanTween.value, nil, go(arg_42_0.ptPanel), 0, var_42_1, var_42_12):setOnUpdate(System.Action_float(function(arg_43_0)
				setFillAmount(arg_42_0.ptProgressImg, arg_43_0)
				setActive(arg_42_0.ptProgressScaleLine, arg_43_0 < 1)

				arg_42_0.ptProgressScaleLine.localEulerAngles = Vector3(0, 0, -360 * arg_43_0)

				local var_43_0 = arg_43_0 * 100
				local var_43_1 = string.format("%d", var_43_0)
				local var_43_2 = (var_43_0 - math.floor(var_43_0)) * 100 == 0
				local var_43_3 = string.format("%2d", (var_43_0 - math.floor(var_43_0)) * 100)

				var_43_3 = var_43_2 and var_43_3 .. "0%" or var_43_3 .. "%"

				setText(arg_42_0.ptProgressRedLeftNumText, var_43_1)
				setText(arg_42_0.ptProgressWhiteLeftNumText, var_43_1)
				setText(arg_42_0.ptProgressRedRightNumText, var_43_3)
				setText(arg_42_0.ptProgressWhiteRightNumText, var_43_3)
			end)):setOnComplete(System.Action(function()
				setFillAmount(arg_42_0.ptProgressImg, var_42_1)
				setActive(arg_42_0.ptProgressScaleLine, var_42_1 < 1)

				arg_42_0.ptProgressScaleLine.localEulerAngles = Vector3(0, 0, -360 * var_42_1)

				local var_44_0 = string.format("%d", var_42_3)
				local var_44_1 = (var_42_3 - math.floor(var_42_3)) * 100 == 0
				local var_44_2 = string.format("%2d", (var_42_3 - math.floor(var_42_3)) * 100)

				var_44_2 = var_44_1 and var_44_2 .. "0%" or var_44_2 .. "%"

				setText(arg_42_0.ptProgressRedLeftNumText, var_44_0)
				setText(arg_42_0.ptProgressWhiteLeftNumText, var_44_0)
				setText(arg_42_0.ptProgressRedRightNumText, var_44_2)
				setText(arg_42_0.ptProgressWhiteRightNumText, var_44_2)
				arg_42_0:managedTween(LeanTween.value, nil, go(arg_42_0.ptPanel), 0, 1, var_42_12 / 2):setOnUpdate(System.Action_float(function(arg_45_0)
					setImageAlpha(arg_42_0.ptPreviewBtn, arg_45_0)
					setImageAlpha(arg_42_0.ptGetBtn, arg_45_0)
					setImageAlpha(arg_42_0.ptGetBtnTag, arg_45_0)
					setImageAlpha(arg_42_0.ptShowWayBtn, arg_45_0)
				end)):setOnComplete(System.Action(function()
					setImageAlpha(arg_42_0.ptPreviewBtn, 1)
					setImageAlpha(arg_42_0.ptGetBtn, 1)
					setImageAlpha(arg_42_0.ptGetBtnTag, 1)
					setImageAlpha(arg_42_0.ptShowWayBtn, 1)
				end))
			end))
		end
	else
		setImageAlpha(arg_42_0.ptPreviewBtn, 1)
		setImageAlpha(arg_42_0.ptGetBtn, 1)
		setImageAlpha(arg_42_0.ptGetBtnTag, 1)
		setImageAlpha(arg_42_0.ptShowWayBtn, 1)
	end
end

function var_0_0.updateRedPoints(arg_47_0)
	local var_47_0 = arg_47_0:getCurMetaProgressVO()
	local var_47_1 = var_47_0.id
	local var_47_2 = MetaCharacterConst.isMetaRepairRedTag(var_47_1)

	setActive(arg_47_0.repairBtn:Find("RepairBtn/Tag"), var_47_2)

	local var_47_3 = not MetaCharacterConst.filteMetaRepairAble(var_47_0)

	setActive(arg_47_0.repairBtn:Find("Finish"), var_47_3)

	local var_47_4 = MetaCharacterConst.isMetaEnergyRedTag(var_47_1)

	setActive(arg_47_0.energyBtn:Find("Tag"), var_47_4)

	local var_47_5 = not MetaCharacterConst.filteMetaEnergyAble(var_47_0)

	setActive(arg_47_0.energyBtn:Find("Finish"), var_47_5)

	local var_47_6 = not MetaCharacterConst.filteMetaTacticsAble(var_47_0)

	setActive(arg_47_0.tacticsBtn:Find("Finish"), var_47_6)

	local var_47_7 = MetaCharacterConst.isMetaTacticsRedTag(var_47_1)
	local var_47_8 = var_47_0.metaShipVO

	if var_47_8 then
		local var_47_9 = arg_47_0.metaCharacterProxy:getMetaTacticsInfoByShipID(var_47_8.id):getTacticsStateForShow()

		setActive(arg_47_0.tacticsBtn:Find("Tag"), false)
		setActive(arg_47_0.tacticsBtn:Find("Learnable"), var_47_9 == MetaTacticsInfo.States.LearnAble)
		setActive(arg_47_0.tacticsBtn:Find("Learning"), var_47_9 == MetaTacticsInfo.States.Learning)
		setActive(arg_47_0.tacticsBtn:Find("LearnFinish"), var_47_9 == MetaTacticsInfo.States.LearnFinished and var_47_7)
	else
		setActive(arg_47_0.tacticsBtn:Find("Tag"), false)
		setActive(arg_47_0.tacticsBtn:Find("Learnable"), false)
		setActive(arg_47_0.tacticsBtn:Find("Learning"), false)
		setActive(arg_47_0.tacticsBtn:Find("LearnFinish"), false)
	end

	local var_47_10 = var_47_0:isPtType()
	local var_47_11 = var_47_0:isInAct()
	local var_47_12 = var_47_0:isInArchive()
	local var_47_13 = var_47_10

	setActive(arg_47_0.synDecorateTF, var_47_13)
	setActive(arg_47_0.synBtn, var_47_10)
	setActive(arg_47_0.synBtnLock, var_47_10 and not var_47_11 and not var_47_12)
	setActive(arg_47_0.toggleList[4], var_47_10)
	setActive(arg_47_0.synToggleLock, var_47_10 and not var_47_11 and not var_47_12)

	local var_47_14

	if var_47_13 then
		var_47_14 = MetaCharacterConst.isMetaSynRedTag(var_47_1)

		setActive(arg_47_0.synBtn:Find("Tag"), var_47_14)
	end

	local var_47_15 = not MetaCharacterConst.filteMetaSynAble(var_47_0)

	setActive(arg_47_0.synBtn:Find("Finish"), var_47_15)
	setActive(arg_47_0.toggleList[var_0_0.PAGES.REPAIR]:Find("Tip"), var_47_2)
	setActive(arg_47_0.toggleList[var_0_0.PAGES.ENERGY]:Find("Tip"), var_47_4)
	setActive(arg_47_0.toggleList[var_0_0.PAGES.TACTICS]:Find("Tip"), var_47_7)
	setActive(arg_47_0.toggleList[var_0_0.PAGES.SYN]:Find("Tip"), var_47_14)

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.metaProgressVOList) do
		local var_47_16 = arg_47_0.bannerTFList[iter_47_0]:Find("ForScale/RedPoint")

		if iter_47_1 then
			setActive(var_47_16, MetaCharacterConst.isMetaBannerRedPoint(iter_47_1.id))
		else
			setActive(var_47_16, false)
		end
	end
end

function var_0_0.getCurMetaProgressVO(arg_48_0)
	local var_48_0 = arg_48_0.curMetaIndex

	return arg_48_0.metaProgressVOList[var_48_0]
end

function var_0_0.refreshBannerTF(arg_49_0)
	local var_49_0 = arg_49_0:getCurMetaProgressVO()
	local var_49_1 = arg_49_0.bannerTFList[arg_49_0.curMetaIndex]

	arg_49_0:updateBannerTF(var_49_0, var_49_1, arg_49_0.curMetaIndex)
end

function var_0_0.enterMenuPage(arg_50_0, arg_50_1)
	setActive(arg_50_0.hidePanel, not arg_50_1)
	setActive(arg_50_0.indexBtn, not arg_50_1)
	setActive(arg_50_0.toggleBtnsTF, arg_50_1)

	arg_50_0.toggleGroupSC.allowSwitchOff = not arg_50_1
end

function var_0_0.switchPage(arg_51_0, arg_51_1)
	if not arg_51_0.curPageIndex then
		setActive(arg_51_0.toggleBtnsTF, true)
		triggerToggle(arg_51_0.toggleList[arg_51_1], true)
	end
end

function var_0_0.backFromRepair(arg_52_0)
	setActive(arg_52_0.menuPanel, false)
	arg_52_0:managedTween(LeanTween.alpha, nil, arg_52_0.shipImg, 1, 0.3):setFrom(0):setOnComplete(System.Action(function()
		setActive(arg_52_0.menuPanel, true)
		setActive(arg_52_0.hidePanel, true)
	end))
end

function var_0_0.backFromNotRepair(arg_54_0)
	local var_54_0 = arg_54_0:getCurMetaProgressVO().id
	local var_54_1 = MetaCharacterConst.UIConfig[var_54_0]

	setActive(arg_54_0.menuPanel, false)

	local var_54_2 = -250
	local var_54_3 = var_54_1[1]

	arg_54_0:managedTween(LeanTween.moveX, nil, rtf(arg_54_0.shipImg), var_54_3, 0.3):setFrom(var_54_2):setOnComplete(System.Action(function()
		setActive(arg_54_0.menuPanel, true)
		setActive(arg_54_0.hidePanel, true)
	end))
end

function var_0_0.autoOpenFunc(arg_56_0)
	if arg_56_0.contextData.autoOpenShipConfigID then
		local var_56_0 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(arg_56_0.contextData.autoOpenShipConfigID)
		local var_56_1 = arg_56_0:getMetaProgressListForShow()
		local var_56_2 = 0

		for iter_56_0, iter_56_1 in ipairs(var_56_1) do
			if iter_56_1 and iter_56_1.id == var_56_0 then
				triggerButton(arg_56_0.bannerTFList[iter_56_0])

				arg_56_0.contextData.autoOpenShipConfigID = nil
			end
		end
	end

	if arg_56_0.contextData.autoOpenTactics then
		triggerButton(arg_56_0.tacticsBtn)

		arg_56_0.contextData.autoOpenTactics = nil
	end

	if arg_56_0.contextData.autoOpenEnergy then
		triggerButton(arg_56_0.energyBtn)

		arg_56_0.contextData.autoOpenEnergy = nil
	end

	if arg_56_0.contextData.autoOpenSyn then
		if arg_56_0:getCurMetaProgressVO():isUnlocked() then
			triggerButton(arg_56_0.synBtn)
		end

		arg_56_0.contextData.autoOpenSyn = nil
	end

	if arg_56_0.contextData.lastPageIndex then
		triggerToggle(arg_56_0.toggleList[arg_56_0.contextData.lastPageIndex], true)

		arg_56_0.contextData.lastPageIndex = nil
	end
end

function var_0_0.openIndexLayer(arg_57_0)
	if not arg_57_0.indexDatas then
		arg_57_0.indexDatas = {}
	end

	local var_57_0 = {
		indexDatas = Clone(arg_57_0.indexDatas),
		customPanels = {
			minHeight = 650,
			typeIndex = {
				mode = CustomIndexLayer.Mode.AND,
				options = ShipIndexConst.TypeIndexs,
				names = ShipIndexConst.TypeNames
			},
			rarityIndex = {
				mode = CustomIndexLayer.Mode.AND,
				options = ShipIndexConst.MetaRarityIndexs,
				names = ShipIndexConst.MetaRarityNames
			},
			extraIndex = {
				mode = CustomIndexLayer.Mode.OR,
				options = ShipIndexConst.MetaExtraIndexs,
				names = ShipIndexConst.MetaExtraNames
			}
		},
		groupList = {
			{
				dropdown = false,
				titleTxt = "indexsort_type",
				titleENTxt = "indexsort_typeeng",
				tags = {
					"typeIndex"
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
		callback = function(arg_58_0)
			if not isActive(arg_57_0._tf) then
				return
			end

			arg_57_0.indexDatas.typeIndex = arg_58_0.typeIndex
			arg_57_0.indexDatas.rarityIndex = arg_58_0.rarityIndex
			arg_57_0.indexDatas.extraIndex = arg_58_0.extraIndex
			arg_57_0.metaProgressVOList = arg_57_0:getMetaProgressListForShow()

			arg_57_0:fillMetaProgressList()
			arg_57_0:updateStart()
		end
	}

	arg_57_0:emit(MetaCharacterMediator.OPEN_INDEX_LAYER, var_57_0)
end

function var_0_0.isDefaultStatus(arg_59_0)
	return (not arg_59_0.indexDatas.typeIndex or arg_59_0.indexDatas.typeIndex == ShipIndexConst.TypeAll) and (not arg_59_0.indexDatas.rarityIndex or arg_59_0.indexDatas.rarityIndex == ShipIndexConst.RarityAll) and (not arg_59_0.indexDatas.extraIndex or arg_59_0.indexDatas.extraIndex == ShipIndexConst.MetaExtraAll)
end

function var_0_0.overLayPanel(arg_60_0, arg_60_1)
	if arg_60_1 == true then
		arg_60_0:OverlayPanel(arg_60_0.blurPanel)
	elseif arg_60_1 == false then
		arg_60_0:UnOverlayPanel(arg_60_0.blurPanel, arg_60_0._tf)
	end
end

function var_0_0.getMetaProgressListForShow(arg_61_0)
	local var_61_0 = {}
	local var_61_1 = arg_61_0.metaCharacterProxy:getMetaProgressVOList()
	local var_61_2
	local var_61_3
	local var_61_4

	for iter_61_0, iter_61_1 in ipairs(var_61_1) do
		local var_61_5 = MetaCharacterConst.filteMetaByType(iter_61_1, arg_61_0.indexDatas.typeIndex)
		local var_61_6 = MetaCharacterConst.filteMetaByRarity(iter_61_1, arg_61_0.indexDatas.rarityIndex)
		local var_61_7 = MetaCharacterConst.filteMetaExtra(iter_61_1, arg_61_0.indexDatas.extraIndex)

		if var_61_5 and var_61_6 and var_61_7 and iter_61_1:isShow() then
			if iter_61_1:isPtType() and iter_61_1:isInAct() then
				var_61_2 = iter_61_1
			elseif iter_61_1:isPassType() and iter_61_1:isInAct() then
				var_61_3 = iter_61_1
			elseif iter_61_1:isBuildType() and iter_61_1:isInAct() then
				var_61_4 = iter_61_1
			else
				table.insert(var_61_0, iter_61_1)
			end
		end
	end

	if var_61_4 then
		table.insert(var_61_0, 1, var_61_4)
	end

	if var_61_3 then
		table.insert(var_61_0, 1, var_61_3)
	end

	if var_61_2 then
		table.insert(var_61_0, 1, var_61_2)
	end

	return var_61_0
end

function var_0_0.filteMetaProgressList(arg_62_0)
	local var_62_0 = arg_62_0:getMetaProgressListForShow()
	local var_62_1 = {}

	for iter_62_0, iter_62_1 in ipairs(var_62_0) do
		local var_62_2 = MetaCharacterConst.filteMetaByType(iter_62_1, arg_62_0.indexDatas.typeIndex)
		local var_62_3 = MetaCharacterConst.filteMetaByRarity(iter_62_1, arg_62_0.indexDatas.rarityIndex)
		local var_62_4 = MetaCharacterConst.filteMetaExtra(iter_62_1, arg_62_0.indexDatas.extraIndex)

		if var_62_2 and var_62_3 and var_62_4 then
			table.insert(var_62_1, iter_62_1)
		end
	end

	return var_62_1
end

function var_0_0.getOneStepPTAwardLevelAndCount(arg_63_0)
	local var_63_0 = arg_63_0:getCurMetaProgressVO()
	local var_63_1 = var_63_0.metaPtData:GetResProgress()
	local var_63_2 = var_63_0.metaPtData.targets
	local var_63_3 = var_63_0:getStoryIndexList()
	local var_63_4 = var_63_0.unlockPTLevel
	local var_63_5 = 0

	for iter_63_0 = 1, var_63_4 - 1 do
		local var_63_6 = false
		local var_63_7 = false

		if var_63_1 >= var_63_2[iter_63_0] then
			var_63_6 = true
		end

		local var_63_8 = var_63_3[iter_63_0]

		if var_63_8 == 0 then
			var_63_7 = true
		elseif pg.NewStoryMgr.GetInstance():IsPlayed(var_63_8) then
			var_63_7 = true
		end

		if var_63_6 and var_63_7 then
			var_63_5 = iter_63_0
		else
			break
		end
	end

	return var_63_5, var_63_2[var_63_5]
end

return var_0_0
