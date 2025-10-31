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

function var_0_0.init(arg_2_0)
	Input.multiTouchEnabled = false

	arg_2_0:initUITextTips()
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
	arg_2_0:initMetaProgressList()
	arg_2_0:initBannerList()
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:overLayPanel(true)
	arg_3_0:updateStart()
	arg_3_0:autoOpenFunc()
end

function var_0_0.willExit(arg_4_0)
	Input.multiTouchEnabled = true

	arg_4_0:overLayPanel(false)
end

function var_0_0.initUITextTips(arg_5_0)
	local var_5_0 = arg_5_0._tf:Find("HidePanel/ScrollPanel/ListPanel/BannerTpl/ForScale")
	local var_5_1 = var_5_0:Find("Empty/ActType/TipText")
	local var_5_2 = var_5_0:Find("Empty/BuildType/TipText")
	local var_5_3 = var_5_0:Find("Active/ActType/Text")
	local var_5_4 = var_5_0:Find("Active/BuildType/Text")

	setText(var_5_1, i18n("meta_syn_rate"))
	setText(var_5_2, i18n("meta_build"))
	setText(var_5_3, i18n("meta_repair_rate"))
	setText(var_5_4, i18n("meta_build"))

	local var_5_5 = arg_5_0._tf:Find("HidePanel/PTPanel/Progress/Story/TipText1")
	local var_5_6 = arg_5_0._tf:Find("HidePanel/PTPanel/Progress/Story/TipText2")

	setText(var_5_5, i18n("meta_story_tip_1"))
	setText(var_5_6, i18n("meta_story_tip_2"))

	local var_5_7 = arg_5_0._tf:Find("HidePanel/ActTimeTip/Tip")

	setText(var_5_7, i18n("meta_acttime_limit"))
end

function var_0_0.initData(arg_6_0)
	arg_6_0.metaProgressVOList = {}
	arg_6_0.curMetaGroupID = nil
	arg_6_0.curMetaProgress = nil
	arg_6_0.toggleList = {}
	arg_6_0.bannerTFList = {}
	arg_6_0.curPageIndex = nil
	arg_6_0.curMetaIndex = nil
	arg_6_0.metaCharacterProxy = getProxy(MetaCharacterProxy)
	arg_6_0.bayProxy = getProxy(BayProxy)
	arg_6_0.indexDatas = {}
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.shipImg = arg_7_0._tf:Find("HidePanel/ShipImg")
	arg_7_0.shipNameImg = arg_7_0._tf:Find("HidePanel/NameImg")
	arg_7_0.noCharTF = arg_7_0._tf:Find("BG/NoCharacter")
	arg_7_0.indexBtn = arg_7_0._tf:Find("blur_panel/adapt/top/index")
	arg_7_0.hidePanel = arg_7_0._tf:Find("HidePanel")
	arg_7_0.scrollPanel = arg_7_0.hidePanel:Find("ScrollPanel")
	arg_7_0.bannerListPanel = arg_7_0.scrollPanel:Find("ListPanel")
	arg_7_0.bannerContainer = arg_7_0.bannerListPanel:Find("Container")
	arg_7_0.bannerTpl = arg_7_0.bannerListPanel:Find("BannerTpl")
	arg_7_0.actTimePanel = arg_7_0.hidePanel:Find("ActTimeTip")
	arg_7_0.actTimeText = arg_7_0.actTimePanel:Find("Text")
	arg_7_0.menuPanel = arg_7_0.hidePanel:Find("MenuPanel")
	arg_7_0.energyBtn = arg_7_0.menuPanel:Find("EnergyBtn")
	arg_7_0.repairBtn = arg_7_0.menuPanel:Find("RepairBtn")
	arg_7_0.tacticsBtn = arg_7_0.menuPanel:Find("TacticsBtn")
	arg_7_0.synBtn = arg_7_0.menuPanel:Find("SynBtn")
	arg_7_0.synDecorateTF = arg_7_0.menuPanel:Find("SynDecorate")
	arg_7_0.synBtnLimitTimeTF = arg_7_0.synBtn:Find("Limit")
	arg_7_0.synBtnLock = arg_7_0.synBtn:Find("LockMask")
	arg_7_0.ptPanel = arg_7_0.hidePanel:Find("PTPanel")
	arg_7_0.ptRedBarImg = arg_7_0.ptPanel:Find("RedBar")
	arg_7_0.ptPreviewBtn = arg_7_0.ptPanel:Find("PreviewBtn")
	arg_7_0.ptGetBtn = arg_7_0.ptPanel:Find("SynBtn")
	arg_7_0.ptGetBtnTag = arg_7_0.ptGetBtn:Find("Tag")
	arg_7_0.ptShowWayBtn = arg_7_0.ptPanel:Find("ShowWayBtn")

	local var_7_0 = arg_7_0.ptPanel:Find("Progress")

	arg_7_0.ptProgressImg = var_7_0:Find("CircleProgress/ProgressImg")
	arg_7_0.ptProgressScaleLine = var_7_0:Find("CircleProgress/ScaleLine")
	arg_7_0.ptInfoPanel = var_7_0:Find("PT")
	arg_7_0.ptProgressRedRightNumText = arg_7_0.ptInfoPanel:Find("ProgressTextBG/PointRedText/RightNumText")
	arg_7_0.ptProgressRedLeftNumText = arg_7_0.ptInfoPanel:Find("ProgressTextBG/PointRedText/LeftNumText")
	arg_7_0.ptProgressWhiteRightNumText = arg_7_0.ptInfoPanel:Find("ProgressTextBG/PointText/RightNumText")
	arg_7_0.ptProgressWhiteLeftNumText = arg_7_0.ptInfoPanel:Find("ProgressTextBG/PointText/LeftNumText")
	arg_7_0.ptIcon = arg_7_0.ptInfoPanel:Find("PTProgressText/PTIcon")
	arg_7_0.ptProgressRedText = arg_7_0.ptInfoPanel:Find("PTProgressRedText")
	arg_7_0.ptProgressWhiteText = arg_7_0.ptInfoPanel:Find("PTProgressText")
	arg_7_0.storyInfoPanel = var_7_0:Find("Story")

	local var_7_1 = arg_7_0.storyInfoPanel:Find("TipText1")
	local var_7_2 = arg_7_0.storyInfoPanel:Find("TipText2")

	arg_7_0.storyNameText = arg_7_0.storyInfoPanel:Find("StroyNameText")
	arg_7_0.getShipBtn = var_7_0:Find("FinishBtn")
	arg_7_0.goGetPanel = arg_7_0.hidePanel:Find("GoGetPanel")
	arg_7_0.goGetBtn = arg_7_0.goGetPanel:Find("GoGetBtn")
	arg_7_0.blurPanel = arg_7_0._tf:Find("blur_panel")

	local var_7_3 = arg_7_0.blurPanel:Find("adapt")

	arg_7_0.backBtn = var_7_3:Find("top/back")
	arg_7_0.helpBtn = var_7_3:Find("top/help")
	arg_7_0.toggleBtnsTF = var_7_3:Find("left/Btns")
	arg_7_0.toggleGroupSC = GetComponent(arg_7_0.toggleBtnsTF, "ToggleGroup")
	arg_7_0.toggleGroupSC.allowSwitchOff = true
	arg_7_0.toggleList[1] = arg_7_0.toggleBtnsTF:Find("Energy")
	arg_7_0.toggleList[2] = arg_7_0.toggleBtnsTF:Find("Tactics")
	arg_7_0.toggleList[3] = arg_7_0.toggleBtnsTF:Find("Repair")
	arg_7_0.toggleList[4] = arg_7_0.toggleBtnsTF:Find("Syn")
	arg_7_0.synToggleLock = arg_7_0.toggleBtnsTF:Find("SynLock")
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.backBtn, function()
		local var_9_0 = arg_8_0.curPageIndex

		if var_9_0 then
			arg_8_0:enterMenuPage(false)
			arg_8_0:emit(var_0_0.PAGES_EVENTS[arg_8_0.curPageIndex], nil, false)

			if var_9_0 == var_0_0.PAGES.REPAIR then
				arg_8_0:backFromRepair()
			else
				arg_8_0:backFromNotRepair()
			end
		else
			arg_8_0:closeView()
		end
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.meta_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.indexBtn, function()
		arg_8_0:openIndexLayer()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.goGetBtn, function()
		local var_12_0 = arg_8_0:getCurMetaProgressVO()
		local var_12_1 = var_12_0:isPassType()
		local var_12_2 = var_12_0:isBuildType()

		if var_12_1 then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CRUSING)
		elseif var_12_2 then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT, {
				page = BuildShipScene.PAGE_BUILD,
				projectName = BuildShipScene.PROJECTS.ACTIVITY
			})
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.ptPreviewBtn, function()
		arg_8_0:emit(MetaCharacterMediator.OPEN_PT_PREVIEW_LAYER, arg_8_0:getCurMetaProgressVO())
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.ptGetBtn, function()
		local var_14_0 = arg_8_0:getCurMetaProgressVO()
		local var_14_1 = var_14_0:getMetaProgressPTState()

		if var_14_1 == MetaProgress.STATE_CAN_AWARD then
			local var_14_2, var_14_3 = arg_8_0:getOneStepPTAwardLevelAndCount()

			pg.m02:sendNotification(GAME.GET_META_PT_AWARD, {
				groupID = var_14_0.id,
				targetCount = var_14_3
			})
		elseif var_14_1 == MetaProgress.STATE_LESS_PT then
			local var_14_4 = false
			local var_14_5 = nowWorld()

			if var_14_5 then
				var_14_4 = var_14_5:IsSystemOpen(WorldConst.SystemWorldBoss)
			end

			local var_14_6 = var_14_4 and "meta_pt_notenough" or "meta_boss_unlock"

			pg.TipsMgr.GetInstance():ShowTips(i18n(var_14_6))
		elseif var_14_1 == MetaProgress.STATE_LESS_STORY then
			pg.TipsMgr.GetInstance():ShowTips(i18n("meta_story_lock"))
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.ptShowWayBtn, function()
		local var_15_0 = false
		local var_15_1 = nowWorld()

		if var_15_1 then
			var_15_0 = var_15_1:IsSystemOpen(WorldConst.SystemWorldBoss)
		end

		local var_15_2 = var_15_0 and "meta_pt_notenough" or "meta_boss_unlock"

		pg.TipsMgr.GetInstance():ShowTips(i18n(var_15_2))
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.getShipBtn, function()
		local var_16_0 = arg_8_0:getCurMetaProgressVO()
		local var_16_1, var_16_2 = var_16_0.metaPtData:GetResProgress()

		pg.m02:sendNotification(GAME.GET_META_PT_AWARD, {
			groupID = var_16_0.id,
			targetCount = var_16_2
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.synToggleLock, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.synBtnLock, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
	end)
	onButton(arg_8_0, arg_8_0.repairBtn:Find("RepairBtn"), function()
		arg_8_0:switchPage(var_0_0.PAGES.REPAIR)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.energyBtn, function()
		arg_8_0.isMainOpenLayerTag = true

		arg_8_0:switchPage(var_0_0.PAGES.ENERGY)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.tacticsBtn, function()
		arg_8_0.isMainOpenLayerTag = true

		arg_8_0:switchPage(var_0_0.PAGES.TACTICS)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.synBtn, function()
		if not isActive(arg_8_0.synBtnLock) then
			arg_8_0.isMainOpenLayerTag = true

			arg_8_0:switchPage(var_0_0.PAGES.SYN)
		end
	end, SFX_PANEL)

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.toggleList) do
		onToggle(arg_8_0, iter_8_1, function(arg_23_0)
			if arg_8_0.curPageIndex == iter_8_0 and arg_23_0 == true then
				return
			end

			local var_23_0 = arg_8_0:getCurMetaProgressVO():getShip()

			if arg_8_0.curPageIndex == iter_8_0 and arg_23_0 == false then
				arg_8_0:enterMenuPage(false)
				arg_8_0:emit(var_0_0.PAGES_EVENTS[iter_8_0], var_23_0.id, false)
			end

			if arg_8_0.curPageIndex ~= iter_8_0 and arg_23_0 == true then
				arg_8_0:enterMenuPage(true)

				arg_8_0.curPageIndex = iter_8_0

				arg_8_0:emit(var_0_0.PAGES_EVENTS[iter_8_0], var_23_0.id, true)
			end
		end)
	end
end

function var_0_0.resetToggleList(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.toggleList) do
		setActive(iter_24_1:Find("On"), false)
		setActive(iter_24_1:Find("Off"), true)
	end
end

function var_0_0.initMetaProgressList(arg_25_0)
	arg_25_0.metaProgressVOList = arg_25_0:getMetaProgressListForShow()

	arg_25_0:fillMetaProgressList()
end

function var_0_0.fillMetaProgressList(arg_26_0)
	if #arg_26_0.metaProgressVOList < 5 then
		for iter_26_0 = #arg_26_0.metaProgressVOList + 1, 5 do
			table.insert(arg_26_0.metaProgressVOList, false)
		end
	end
end

function var_0_0.initBannerList(arg_27_0)
	arg_27_0.scrollUIItemList = UIItemList.New(arg_27_0.bannerContainer, arg_27_0.bannerTpl)

	arg_27_0.scrollUIItemList:make(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == UIItemList.EventUpdate then
			table.insert(arg_27_0.bannerTFList, arg_28_2)

			local var_28_0 = arg_27_0.metaProgressVOList[arg_28_1 + 1]

			arg_27_0:updateBannerTF(var_28_0, arg_28_2, arg_28_1 + 1)
		end
	end)
end

function var_0_0.updateBannerTF(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = arg_29_2
	local var_29_1 = arg_29_2:Find("ForScale")
	local var_29_2 = var_29_1:Find("WillCome")
	local var_29_3 = var_29_1:Find("Empty")
	local var_29_4 = var_29_1:Find("Active")

	if arg_29_1 then
		local var_29_5 = arg_29_1:isInAct()
		local var_29_6 = var_29_3:Find("ActType/Tag")
		local var_29_7 = var_29_3:Find("BuildType/Tag")
		local var_29_8 = var_29_4:Find("ActType/Tag")
		local var_29_9 = var_29_4:Find("BuildType/Tag")

		setActive(var_29_6, var_29_5)
		setActive(var_29_7, var_29_5)
		setActive(var_29_8, var_29_5)
		setActive(var_29_9, var_29_5)
	end

	if arg_29_1 then
		local var_29_10 = Ship.New({
			configId = tonumber(arg_29_1.configId .. 1)
		}):getName()
		local var_29_11
		local var_29_12 = var_29_1:Find("Empty/ActType/ShipNameMask/ShipNameText")

		setText(var_29_12, var_29_10)
		setScrollText(var_29_12, var_29_10)
		setActive(var_29_12, true)

		local var_29_13 = var_29_1:Find("Empty/BuildType/ShipNameMask/ShipNameText")

		setText(var_29_13, var_29_10)
		setScrollText(var_29_13, var_29_10)
		setActive(var_29_13, true)

		local var_29_14 = var_29_1:Find("Empty/PassType/ShipNameMask/ShipNameText")

		setText(var_29_14, var_29_10)
		setScrollText(var_29_14, var_29_10)
		setActive(var_29_14, true)

		local var_29_15 = var_29_1:Find("Active/ActType/ShipNameMask/ShipNameText")

		setText(var_29_15, var_29_10)
		setScrollText(var_29_15, var_29_10)
		setActive(var_29_15, true)

		local var_29_16 = var_29_1:Find("Active/BuildType/ShipNameMask/ShipNameText")

		setText(var_29_16, var_29_10)
		setScrollText(var_29_16, var_29_10)
		setActive(var_29_16, true)

		local var_29_17 = var_29_1:Find("Active/PassType/ShipNameMask/ShipNameText")

		setText(var_29_17, var_29_10)
		setScrollText(var_29_17, var_29_10)
		setActive(var_29_17, true)
	end

	if arg_29_1 == false then
		setActive(var_29_2, true)
		setActive(var_29_3, false)
		setActive(var_29_4, false)
	else
		setActive(var_29_2, false)

		local var_29_18 = arg_29_1:isUnlocked()

		setActive(var_29_3, not var_29_18)
		setActive(var_29_4, var_29_18)

		local var_29_19 = arg_29_1:isPtType()
		local var_29_20 = arg_29_1:isPassType()
		local var_29_21 = arg_29_1:isBuildType()

		if not var_29_18 then
			local var_29_22 = var_29_1:Find("Empty/ActType")
			local var_29_23 = var_29_1:Find("Empty/BuildType")
			local var_29_24 = var_29_1:Find("Empty/PassType")

			setActive(var_29_22, var_29_19)
			setActive(var_29_23, var_29_21)
			setActive(var_29_24, var_29_20)

			local var_29_25, var_29_26 = arg_29_1:getBannerPathAndName()
			local var_29_27 = LoadSprite(var_29_25, var_29_26)

			setImageSprite(var_29_22, var_29_27)
			setImageSprite(var_29_23, var_29_27)
			setImageSprite(var_29_24, var_29_27)

			if var_29_19 then
				local var_29_28 = var_29_22:Find("NumText")
				local var_29_29 = string.format("%d", arg_29_1:getSynRate() * 100) .. "%"

				setText(var_29_28, var_29_29)

				local var_29_30 = var_29_22:Find("Slider")

				setSlider(var_29_30, 0, 1, arg_29_1:getSynRate())
				setActive(var_29_30, false)
			end

			local var_29_31 = pg.ship_strengthen_meta[arg_29_1.configId].ship_id
			local var_29_32 = Ship.New({
				configId = var_29_31
			})
			local var_29_33 = var_29_32:getMaxStar()
			local var_29_34 = var_29_32:getStar()
			local var_29_35 = var_29_1:Find("Empty/StarTpl")
			local var_29_36 = var_29_1:Find("Empty/Stars")
			local var_29_37 = UIItemList.New(var_29_36, var_29_35)

			var_29_37:make(function(arg_30_0, arg_30_1, arg_30_2)
				if arg_30_0 == UIItemList.EventUpdate then
					arg_30_1 = arg_30_1 + 1

					local var_30_0 = arg_30_2:Find("On")

					setActive(var_30_0, arg_30_1 <= var_29_34)
				end
			end)
			var_29_37:align(var_29_33)
		else
			local var_29_38 = var_29_1:Find("Active/ActType")
			local var_29_39 = var_29_1:Find("Active/BuildType")
			local var_29_40 = var_29_1:Find("Active/PassType")

			setActive(var_29_38, var_29_19)
			setActive(var_29_39, var_29_21)
			setActive(var_29_40, var_29_20)

			local var_29_41, var_29_42 = arg_29_1:getBannerPathAndName()
			local var_29_43 = LoadSprite(var_29_41, var_29_42)

			setImageSprite(var_29_1:Find("Active"), LoadSprite(var_29_41, var_29_42))

			local var_29_44 = arg_29_1:getShip()
			local var_29_45 = var_29_44:getMetaCharacter()

			if var_29_19 then
				local var_29_46 = var_29_38:Find("NumText")
				local var_29_47 = string.format("%d", var_29_45:getRepairRate() * 100) .. "%"

				setText(var_29_46, var_29_47)

				local var_29_48 = var_29_38:Find("Slider")

				setSlider(var_29_48, 0, 1, var_29_45:getRepairRate())
				setActive(var_29_48, false)
			end

			local var_29_49 = var_29_44:getMaxStar()
			local var_29_50 = var_29_44:getStar()
			local var_29_51 = var_29_1:Find("Active/StarTpl")
			local var_29_52 = var_29_1:Find("Active/Stars")
			local var_29_53 = UIItemList.New(var_29_52, var_29_51)

			var_29_53:make(function(arg_31_0, arg_31_1, arg_31_2)
				if arg_31_0 == UIItemList.EventUpdate then
					arg_31_1 = arg_31_1 + 1

					local var_31_0 = arg_31_2:Find("On")

					setActive(var_31_0, arg_31_1 <= var_29_50)
				end
			end)
			var_29_53:align(var_29_49)
		end
	end

	onButton(arg_29_0, var_29_0, function()
		if arg_29_0.curMetaIndex ~= arg_29_3 then
			if arg_29_0.curMetaIndex and arg_29_0.curMetaIndex > 0 then
				arg_29_0:changeBannerOnClick(arg_29_0.bannerTFList[arg_29_0.curMetaIndex], false)
			end

			arg_29_0.curMetaIndex = arg_29_3

			arg_29_0:changeBannerOnClick(var_29_0, true)
			arg_29_0:updateMain()
		end
	end, SFX_PANEL)

	if arg_29_1 == false then
		setButtonEnabled(var_29_0, false)
	else
		setButtonEnabled(var_29_0, true)
	end
end

function var_0_0.changeBannerOnClick(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_1:GetComponent("LayoutElement")
	local var_33_1 = arg_33_1:Find("ForScale")

	if arg_33_2 == true then
		setLocalScale(var_33_1, var_0_0.SCALE_ON_PITCH)

		var_33_0.preferredWidth = 338.3
		var_33_0.preferredHeight = 102
	else
		setLocalScale(var_33_1, Vector2.one)

		var_33_0.preferredWidth = 199
		var_33_0.preferredHeight = 60
	end

	local var_33_2 = var_33_1:Find("SelectedTag")

	setActive(var_33_2, arg_33_2)
end

function var_0_0.updateBannerShipName(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_1:Find("ForScale")
	local var_34_1 = var_34_0:Find("SelectedTag")
	local var_34_2 = isActive(var_34_1)
	local var_34_3
	local var_34_4 = var_34_0:Find("Empty/ActType/ShipNameText")

	setActive(var_34_4, var_34_2)

	local var_34_5 = var_34_0:Find("Empty/BuildType/ShipNameText")

	setActive(var_34_5, var_34_2)

	local var_34_6 = var_34_0:Find("Active/ActType/ShipNameText")

	setActive(var_34_6, var_34_2)

	local var_34_7 = var_34_0:Find("Active/BuildType/ShipNameText")

	setActive(var_34_7, var_34_2)

	local var_34_8
	local var_34_9 = var_34_0:Find("Empty/ActType/TipText")

	setActive(var_34_9, not var_34_2)

	local var_34_10 = var_34_0:Find("Empty/BuildType/TipText")

	setActive(var_34_10, not var_34_2)

	local var_34_11 = var_34_0:Find("Active/ActType/Text")

	setActive(var_34_11, not var_34_2)

	local var_34_12 = var_34_0:Find("Active/BuildType/Text")

	setActive(var_34_12, not var_34_2)
end

function var_0_0.updateBannerUIList(arg_35_0)
	arg_35_0.bannerTFList = {}

	arg_35_0.scrollUIItemList:align(#arg_35_0.metaProgressVOList)
end

function var_0_0.updateStart(arg_36_0)
	local var_36_0 = false

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.metaProgressVOList) do
		if iter_36_1 ~= false then
			var_36_0 = true

			break
		end
	end

	local var_36_1 = arg_36_0.indexBtn:Find("On")

	setActive(var_36_1, not arg_36_0:isDefaultStatus())
	setActive(arg_36_0.noCharTF, not var_36_0)
	setActive(arg_36_0.hidePanel, var_36_0)

	if not var_36_0 then
		return
	end

	arg_36_0:resetBannerListScale()
	arg_36_0:updateBannerUIList()

	arg_36_0.curMetaIndex = nil

	if var_36_0 then
		triggerButton(arg_36_0.bannerTFList[1])
	end
end

function var_0_0.resetBannerListScale(arg_37_0)
	for iter_37_0, iter_37_1 in ipairs(arg_37_0.bannerTFList) do
		local var_37_0 = iter_37_1:GetComponent("LayoutElement")
		local var_37_1 = iter_37_1:Find("ForScale")

		setLocalScale(var_37_1, Vector2.one)

		var_37_0.preferredWidth = 199
		var_37_0.preferredHeight = 60
	end
end

function var_0_0.updateMain(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0:getCurMetaProgressVO()
	local var_38_1 = var_38_0:isUnlocked()

	setActive(arg_38_0.menuPanel, var_38_1)
	setActive(arg_38_0.ptPanel, not var_38_1)
	setActive(arg_38_0.goGetPanel, not var_38_1)
	arg_38_0:updateActTimePanel()

	if not var_38_1 then
		local var_38_2 = var_38_0:isPtType()
		local var_38_3 = var_38_0:isPassType()
		local var_38_4 = var_38_0:isBuildType()

		setActive(arg_38_0.ptPanel, var_38_2)
		setActive(arg_38_0.goGetPanel, var_38_3 or var_38_4)

		if var_38_2 then
			arg_38_0:updatePTPanel(arg_38_1)
		end
	else
		arg_38_0:TryPlayGuide()
	end

	arg_38_0:updateRedPoints()

	local var_38_5, var_38_6 = var_38_0:getPaintPathAndName()

	setImageSprite(arg_38_0.shipImg, LoadSprite(var_38_5, var_38_6), true)

	local var_38_7, var_38_8 = var_38_0:getBGNamePathAndName()

	setImageSprite(arg_38_0.shipNameImg, LoadSprite(var_38_7, var_38_8), true)

	local var_38_9 = var_38_0.id
	local var_38_10 = MetaCharacterConst.UIConfig[var_38_9]

	setLocalPosition(arg_38_0.shipImg, {
		x = var_38_10[1],
		y = var_38_10[2]
	})
	setLocalScale(arg_38_0.shipImg, {
		x = var_38_10[3],
		y = var_38_10[4]
	})
end

function var_0_0.TryPlayGuide(arg_39_0)
	pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0024")
end

function var_0_0.updateActTimePanel(arg_40_0)
	local var_40_0 = arg_40_0:getCurMetaProgressVO()
	local var_40_1 = var_40_0:isUnlocked()
	local var_40_2 = var_40_0:isInAct()

	setActive(arg_40_0.actTimePanel, not var_40_1 and var_40_2)
	setActive(arg_40_0.synBtnLimitTimeTF, var_40_2)

	if var_40_2 then
		local var_40_3 = var_40_0.timeConfig[1][1]
		local var_40_4 = var_40_0.timeConfig[2][1]
		local var_40_5 = "%d.%d.%d-%d.%d.%d"
		local var_40_6 = string.format(var_40_5, var_40_3[1], var_40_3[2], var_40_3[3], var_40_4[1], var_40_4[2], var_40_4[3])

		setText(arg_40_0.actTimeText, var_40_6)

		local var_40_7 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_40_0.timeConfig[2])
		local var_40_8 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_40_9 = pg.TimeMgr.GetInstance():DiffDay(var_40_8, var_40_7)
		local var_40_10 = arg_40_0.synBtnLimitTimeTF:Find("Text")

		setText(var_40_10, i18n("meta_pt_left", var_40_9))
	end
end

function var_0_0.updatePTPanel(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0:getCurMetaProgressVO()
	local var_41_1 = var_41_0:getSynRate()
	local var_41_2 = var_41_1 * 100
	local var_41_3 = tonumber(tostring(var_41_2))

	setImageSprite(arg_41_0.ptIcon, LoadSprite(var_41_0:getPtIconPath()))
	setFillAmount(arg_41_0.ptProgressImg, var_41_1)
	setActive(arg_41_0.ptProgressScaleLine, var_41_1 < 1)

	arg_41_0.ptProgressScaleLine.localEulerAngles = Vector3(0, 0, -360 * var_41_1)

	local var_41_4 = string.format("%d", var_41_3)
	local var_41_5 = (var_41_3 - math.floor(var_41_3)) * 100 == 0
	local var_41_6 = string.format("%2d", (var_41_3 - math.floor(var_41_3)) * 100)

	var_41_6 = var_41_5 and var_41_6 .. "0%" or var_41_6 .. "%"

	setText(arg_41_0.ptProgressRedLeftNumText, var_41_4)
	setText(arg_41_0.ptProgressWhiteLeftNumText, var_41_4)
	setText(arg_41_0.ptProgressRedRightNumText, var_41_6)
	setText(arg_41_0.ptProgressWhiteRightNumText, var_41_6)

	local var_41_7, var_41_8, var_41_9 = var_41_0.metaPtData:GetResProgress()

	setText(arg_41_0.ptProgressRedText, (var_41_9 >= 1 and setColorStr(var_41_7, COLOR_GREEN) or setColorStr(var_41_7, COLOR_RED)) .. "/" .. var_41_8)
	setText(arg_41_0.ptProgressWhiteText, (var_41_9 >= 1 and setColorStr(var_41_7, COLOR_GREEN) or setColorStr(var_41_7, COLOR_RED)) .. "/" .. var_41_8)

	local var_41_10 = var_41_0:getMetaProgressPTState()

	if var_41_10 == MetaProgress.STATE_CAN_FINISH then
		setActive(arg_41_0.ptRedBarImg, true)
		setActive(arg_41_0.ptPreviewBtn, false)
		setActive(arg_41_0.ptGetBtn, false)
		setActive(arg_41_0.ptShowWayBtn, false)
		setActive(arg_41_0.ptInfoPanel, false)
		setActive(arg_41_0.storyInfoPanel, false)
		setActive(arg_41_0.getShipBtn, true)
	elseif var_41_10 == MetaProgress.STATE_CAN_AWARD then
		setActive(arg_41_0.ptRedBarImg, false)
		setActive(arg_41_0.ptPreviewBtn, true)
		setActive(arg_41_0.ptGetBtn, true)
		setActive(arg_41_0.ptShowWayBtn, false)
		setActive(arg_41_0.ptGetBtnTag, true)
		setActive(arg_41_0.ptInfoPanel, true)
		setActive(arg_41_0.storyInfoPanel, false)
		setActive(arg_41_0.getShipBtn, false)
		setImageAlpha(arg_41_0.ptPreviewBtn, 0)
		setImageAlpha(arg_41_0.ptGetBtn, 0)
		setImageAlpha(arg_41_0.ptGetBtnTag, 0)
		setImageAlpha(arg_41_0.ptShowWayBtn, 0)
	elseif var_41_10 == MetaProgress.STATE_LESS_STORY then
		setActive(arg_41_0.ptRedBarImg, true)
		setActive(arg_41_0.ptPreviewBtn, true)
		setActive(arg_41_0.ptGetBtn, true)
		setActive(arg_41_0.ptShowWayBtn, false)
		setActive(arg_41_0.ptGetBtnTag, false)
		setActive(arg_41_0.ptInfoPanel, false)
		setActive(arg_41_0.storyInfoPanel, true)
		setActive(arg_41_0.getShipBtn, false)

		local var_41_11 = var_41_0:getCurLevelStoryName()

		setText(arg_41_0.storyNameText, var_41_11)
	elseif var_41_10 == MetaProgress.STATE_LESS_PT then
		setActive(arg_41_0.ptRedBarImg, false)
		setActive(arg_41_0.ptPreviewBtn, true)
		setActive(arg_41_0.ptGetBtn, false)
		setActive(arg_41_0.ptShowWayBtn, true)
		setActive(arg_41_0.ptGetBtnTag, false)
		setActive(arg_41_0.ptInfoPanel, true)
		setActive(arg_41_0.storyInfoPanel, false)
		setActive(arg_41_0.getShipBtn, false)
		setImageAlpha(arg_41_0.ptPreviewBtn, 0)
		setImageAlpha(arg_41_0.ptGetBtn, 0)
		setImageAlpha(arg_41_0.ptShowWayBtn, 0)
	end

	if var_41_1 > 0 and not arg_41_1 then
		if var_41_10 == MetaProgress.STATE_CAN_AWARD or var_41_10 == MetaProgress.STATE_LESS_PT then
			local var_41_12 = math.min(var_41_1, 1)

			arg_41_0:managedTween(LeanTween.value, nil, go(arg_41_0.ptPanel), 0, var_41_1, var_41_12):setOnUpdate(System.Action_float(function(arg_42_0)
				setFillAmount(arg_41_0.ptProgressImg, arg_42_0)
				setActive(arg_41_0.ptProgressScaleLine, arg_42_0 < 1)

				arg_41_0.ptProgressScaleLine.localEulerAngles = Vector3(0, 0, -360 * arg_42_0)

				local var_42_0 = arg_42_0 * 100
				local var_42_1 = string.format("%d", var_42_0)
				local var_42_2 = (var_42_0 - math.floor(var_42_0)) * 100 == 0
				local var_42_3 = string.format("%2d", (var_42_0 - math.floor(var_42_0)) * 100)

				var_42_3 = var_42_2 and var_42_3 .. "0%" or var_42_3 .. "%"

				setText(arg_41_0.ptProgressRedLeftNumText, var_42_1)
				setText(arg_41_0.ptProgressWhiteLeftNumText, var_42_1)
				setText(arg_41_0.ptProgressRedRightNumText, var_42_3)
				setText(arg_41_0.ptProgressWhiteRightNumText, var_42_3)
			end)):setOnComplete(System.Action(function()
				setFillAmount(arg_41_0.ptProgressImg, var_41_1)
				setActive(arg_41_0.ptProgressScaleLine, var_41_1 < 1)

				arg_41_0.ptProgressScaleLine.localEulerAngles = Vector3(0, 0, -360 * var_41_1)

				local var_43_0 = string.format("%d", var_41_3)
				local var_43_1 = (var_41_3 - math.floor(var_41_3)) * 100 == 0
				local var_43_2 = string.format("%2d", (var_41_3 - math.floor(var_41_3)) * 100)

				var_43_2 = var_43_1 and var_43_2 .. "0%" or var_43_2 .. "%"

				setText(arg_41_0.ptProgressRedLeftNumText, var_43_0)
				setText(arg_41_0.ptProgressWhiteLeftNumText, var_43_0)
				setText(arg_41_0.ptProgressRedRightNumText, var_43_2)
				setText(arg_41_0.ptProgressWhiteRightNumText, var_43_2)
				arg_41_0:managedTween(LeanTween.value, nil, go(arg_41_0.ptPanel), 0, 1, var_41_12 / 2):setOnUpdate(System.Action_float(function(arg_44_0)
					setImageAlpha(arg_41_0.ptPreviewBtn, arg_44_0)
					setImageAlpha(arg_41_0.ptGetBtn, arg_44_0)
					setImageAlpha(arg_41_0.ptGetBtnTag, arg_44_0)
					setImageAlpha(arg_41_0.ptShowWayBtn, arg_44_0)
				end)):setOnComplete(System.Action(function()
					setImageAlpha(arg_41_0.ptPreviewBtn, 1)
					setImageAlpha(arg_41_0.ptGetBtn, 1)
					setImageAlpha(arg_41_0.ptGetBtnTag, 1)
					setImageAlpha(arg_41_0.ptShowWayBtn, 1)
				end))
			end))
		end
	else
		setImageAlpha(arg_41_0.ptPreviewBtn, 1)
		setImageAlpha(arg_41_0.ptGetBtn, 1)
		setImageAlpha(arg_41_0.ptGetBtnTag, 1)
		setImageAlpha(arg_41_0.ptShowWayBtn, 1)
	end
end

function var_0_0.updateRedPoints(arg_46_0)
	local var_46_0 = arg_46_0:getCurMetaProgressVO()
	local var_46_1 = var_46_0.id
	local var_46_2 = MetaCharacterConst.isMetaRepairRedTag(var_46_1)

	setActive(arg_46_0.repairBtn:Find("RepairBtn/Tag"), var_46_2)

	local var_46_3 = not MetaCharacterConst.filteMetaRepairAble(var_46_0)

	setActive(arg_46_0.repairBtn:Find("Finish"), var_46_3)

	local var_46_4 = MetaCharacterConst.isMetaEnergyRedTag(var_46_1)

	setActive(arg_46_0.energyBtn:Find("Tag"), var_46_4)

	local var_46_5 = not MetaCharacterConst.filteMetaEnergyAble(var_46_0)

	setActive(arg_46_0.energyBtn:Find("Finish"), var_46_5)

	local var_46_6 = not MetaCharacterConst.filteMetaTacticsAble(var_46_0)

	setActive(arg_46_0.tacticsBtn:Find("Finish"), var_46_6)

	local var_46_7 = MetaCharacterConst.isMetaTacticsRedTag(var_46_1)
	local var_46_8 = var_46_0.metaShipVO

	if var_46_8 then
		local var_46_9 = arg_46_0.metaCharacterProxy:getMetaTacticsInfoByShipID(var_46_8.id):getTacticsStateForShow()

		setActive(arg_46_0.tacticsBtn:Find("Tag"), false)
		setActive(arg_46_0.tacticsBtn:Find("Learnable"), var_46_9 == MetaTacticsInfo.States.LearnAble)
		setActive(arg_46_0.tacticsBtn:Find("Learning"), var_46_9 == MetaTacticsInfo.States.Learning)
		setActive(arg_46_0.tacticsBtn:Find("LearnFinish"), var_46_9 == MetaTacticsInfo.States.LearnFinished and var_46_7)
	else
		setActive(arg_46_0.tacticsBtn:Find("Tag"), false)
		setActive(arg_46_0.tacticsBtn:Find("Learnable"), false)
		setActive(arg_46_0.tacticsBtn:Find("Learning"), false)
		setActive(arg_46_0.tacticsBtn:Find("LearnFinish"), false)
	end

	local var_46_10 = var_46_0:isPtType()
	local var_46_11 = var_46_0:isInAct()
	local var_46_12 = var_46_0:isInArchive()
	local var_46_13 = var_46_10

	setActive(arg_46_0.synDecorateTF, var_46_13)
	setActive(arg_46_0.synBtn, var_46_10)
	setActive(arg_46_0.synBtnLock, var_46_10 and not var_46_11 and not var_46_12)
	setActive(arg_46_0.toggleList[4], var_46_10)
	setActive(arg_46_0.synToggleLock, var_46_10 and not var_46_11 and not var_46_12)

	local var_46_14

	if var_46_13 then
		var_46_14 = MetaCharacterConst.isMetaSynRedTag(var_46_1)

		setActive(arg_46_0.synBtn:Find("Tag"), var_46_14)
	end

	local var_46_15 = not MetaCharacterConst.filteMetaSynAble(var_46_0)

	setActive(arg_46_0.synBtn:Find("Finish"), var_46_15)
	setActive(arg_46_0.toggleList[var_0_0.PAGES.REPAIR]:Find("Tip"), var_46_2)
	setActive(arg_46_0.toggleList[var_0_0.PAGES.ENERGY]:Find("Tip"), var_46_4)
	setActive(arg_46_0.toggleList[var_0_0.PAGES.TACTICS]:Find("Tip"), var_46_7)
	setActive(arg_46_0.toggleList[var_0_0.PAGES.SYN]:Find("Tip"), var_46_14)

	for iter_46_0, iter_46_1 in ipairs(arg_46_0.metaProgressVOList) do
		local var_46_16 = arg_46_0.bannerTFList[iter_46_0]:Find("ForScale/RedPoint")

		if iter_46_1 then
			setActive(var_46_16, MetaCharacterConst.isMetaBannerRedPoint(iter_46_1.id))
		else
			setActive(var_46_16, false)
		end
	end
end

function var_0_0.getCurMetaProgressVO(arg_47_0)
	local var_47_0 = arg_47_0.curMetaIndex

	return arg_47_0.metaProgressVOList[var_47_0]
end

function var_0_0.refreshBannerTF(arg_48_0)
	local var_48_0 = arg_48_0:getCurMetaProgressVO()
	local var_48_1 = arg_48_0.bannerTFList[arg_48_0.curMetaIndex]

	arg_48_0:updateBannerTF(var_48_0, var_48_1, arg_48_0.curMetaIndex)
end

function var_0_0.enterMenuPage(arg_49_0, arg_49_1)
	setActive(arg_49_0.hidePanel, not arg_49_1)
	setActive(arg_49_0.indexBtn, not arg_49_1)
	setActive(arg_49_0.toggleBtnsTF, arg_49_1)

	arg_49_0.toggleGroupSC.allowSwitchOff = not arg_49_1
end

function var_0_0.switchPage(arg_50_0, arg_50_1)
	if not arg_50_0.curPageIndex then
		setActive(arg_50_0.toggleBtnsTF, true)
		triggerToggle(arg_50_0.toggleList[arg_50_1], true)
	end
end

function var_0_0.backFromRepair(arg_51_0)
	setActive(arg_51_0.menuPanel, false)
	arg_51_0:managedTween(LeanTween.alpha, nil, arg_51_0.shipImg, 1, 0.3):setFrom(0):setOnComplete(System.Action(function()
		setActive(arg_51_0.menuPanel, true)
		setActive(arg_51_0.hidePanel, true)
	end))
end

function var_0_0.backFromNotRepair(arg_53_0)
	local var_53_0 = arg_53_0:getCurMetaProgressVO().id
	local var_53_1 = MetaCharacterConst.UIConfig[var_53_0]

	setActive(arg_53_0.menuPanel, false)

	local var_53_2 = -250
	local var_53_3 = var_53_1[1]

	arg_53_0:managedTween(LeanTween.moveX, nil, rtf(arg_53_0.shipImg), var_53_3, 0.3):setFrom(var_53_2):setOnComplete(System.Action(function()
		setActive(arg_53_0.menuPanel, true)
		setActive(arg_53_0.hidePanel, true)
	end))
end

function var_0_0.autoOpenFunc(arg_55_0)
	if arg_55_0.contextData.autoOpenShipConfigID then
		local var_55_0 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(arg_55_0.contextData.autoOpenShipConfigID)
		local var_55_1 = arg_55_0:getMetaProgressListForShow()
		local var_55_2 = 0

		for iter_55_0, iter_55_1 in ipairs(var_55_1) do
			if iter_55_1 and iter_55_1.id == var_55_0 then
				triggerButton(arg_55_0.bannerTFList[iter_55_0])

				arg_55_0.contextData.autoOpenShipConfigID = nil
			end
		end
	end

	if arg_55_0.contextData.autoOpenTactics then
		triggerButton(arg_55_0.tacticsBtn)

		arg_55_0.contextData.autoOpenTactics = nil
	end

	if arg_55_0.contextData.autoOpenEnergy then
		triggerButton(arg_55_0.energyBtn)

		arg_55_0.contextData.autoOpenEnergy = nil
	end

	if arg_55_0.contextData.autoOpenSyn then
		if arg_55_0:getCurMetaProgressVO():isUnlocked() then
			triggerButton(arg_55_0.synBtn)
		end

		arg_55_0.contextData.autoOpenSyn = nil
	end

	if arg_55_0.contextData.lastPageIndex then
		triggerToggle(arg_55_0.toggleList[arg_55_0.contextData.lastPageIndex], true)

		arg_55_0.contextData.lastPageIndex = nil
	end
end

function var_0_0.openIndexLayer(arg_56_0)
	if not arg_56_0.indexDatas then
		arg_56_0.indexDatas = {}
	end

	local var_56_0 = {
		indexDatas = Clone(arg_56_0.indexDatas),
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
		callback = function(arg_57_0)
			if not isActive(arg_56_0._tf) then
				return
			end

			arg_56_0.indexDatas.typeIndex = arg_57_0.typeIndex
			arg_56_0.indexDatas.rarityIndex = arg_57_0.rarityIndex
			arg_56_0.indexDatas.extraIndex = arg_57_0.extraIndex
			arg_56_0.metaProgressVOList = arg_56_0:getMetaProgressListForShow()

			arg_56_0:fillMetaProgressList()
			arg_56_0:updateStart()
		end
	}

	arg_56_0:emit(MetaCharacterMediator.OPEN_INDEX_LAYER, var_56_0)
end

function var_0_0.isDefaultStatus(arg_58_0)
	return (not arg_58_0.indexDatas.typeIndex or arg_58_0.indexDatas.typeIndex == ShipIndexConst.TypeAll) and (not arg_58_0.indexDatas.rarityIndex or arg_58_0.indexDatas.rarityIndex == ShipIndexConst.RarityAll) and (not arg_58_0.indexDatas.extraIndex or arg_58_0.indexDatas.extraIndex == ShipIndexConst.MetaExtraAll)
end

function var_0_0.overLayPanel(arg_59_0, arg_59_1)
	if arg_59_1 == true then
		arg_59_0:OverlayPanel(arg_59_0.blurPanel)
	elseif arg_59_1 == false then
		arg_59_0:UnOverlayPanel(arg_59_0.blurPanel, arg_59_0._tf)
	end
end

function var_0_0.getMetaProgressListForShow(arg_60_0)
	local var_60_0 = {}
	local var_60_1 = arg_60_0.metaCharacterProxy:getMetaProgressVOList()
	local var_60_2
	local var_60_3
	local var_60_4

	for iter_60_0, iter_60_1 in ipairs(var_60_1) do
		local var_60_5 = MetaCharacterConst.filteMetaByType(iter_60_1, arg_60_0.indexDatas.typeIndex)
		local var_60_6 = MetaCharacterConst.filteMetaByRarity(iter_60_1, arg_60_0.indexDatas.rarityIndex)
		local var_60_7 = MetaCharacterConst.filteMetaExtra(iter_60_1, arg_60_0.indexDatas.extraIndex)

		if var_60_5 and var_60_6 and var_60_7 and iter_60_1:isShow() then
			if iter_60_1:isPtType() and iter_60_1:isInAct() then
				var_60_2 = iter_60_1
			elseif iter_60_1:isPassType() and iter_60_1:isInAct() then
				var_60_3 = iter_60_1
			elseif iter_60_1:isBuildType() and iter_60_1:isInAct() then
				var_60_4 = iter_60_1
			else
				table.insert(var_60_0, iter_60_1)
			end
		end
	end

	if var_60_4 then
		table.insert(var_60_0, 1, var_60_4)
	end

	if var_60_3 then
		table.insert(var_60_0, 1, var_60_3)
	end

	if var_60_2 then
		table.insert(var_60_0, 1, var_60_2)
	end

	return var_60_0
end

function var_0_0.filteMetaProgressList(arg_61_0)
	local var_61_0 = arg_61_0:getMetaProgressListForShow()
	local var_61_1 = {}

	for iter_61_0, iter_61_1 in ipairs(var_61_0) do
		local var_61_2 = MetaCharacterConst.filteMetaByType(iter_61_1, arg_61_0.indexDatas.typeIndex)
		local var_61_3 = MetaCharacterConst.filteMetaByRarity(iter_61_1, arg_61_0.indexDatas.rarityIndex)
		local var_61_4 = MetaCharacterConst.filteMetaExtra(iter_61_1, arg_61_0.indexDatas.extraIndex)

		if var_61_2 and var_61_3 and var_61_4 then
			table.insert(var_61_1, iter_61_1)
		end
	end

	return var_61_1
end

function var_0_0.getOneStepPTAwardLevelAndCount(arg_62_0)
	local var_62_0 = arg_62_0:getCurMetaProgressVO()
	local var_62_1 = var_62_0.metaPtData:GetResProgress()
	local var_62_2 = var_62_0.metaPtData.targets
	local var_62_3 = var_62_0:getStoryIndexList()
	local var_62_4 = var_62_0.unlockPTLevel
	local var_62_5 = 0

	for iter_62_0 = 1, var_62_4 - 1 do
		local var_62_6 = false
		local var_62_7 = false

		if var_62_1 >= var_62_2[iter_62_0] then
			var_62_6 = true
		end

		local var_62_8 = var_62_3[iter_62_0]

		if var_62_8 == 0 then
			var_62_7 = true
		elseif pg.NewStoryMgr.GetInstance():IsPlayed(var_62_8) then
			var_62_7 = true
		end

		if var_62_6 and var_62_7 then
			var_62_5 = iter_62_0
		else
			break
		end
	end

	return var_62_5, var_62_2[var_62_5]
end

return var_0_0
