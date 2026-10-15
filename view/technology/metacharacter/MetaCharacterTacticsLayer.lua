local var_0_0 = class("MetaCharacterTacticsLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "MetaCharacterTacticsUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/metacharactertacticsui",
		"ui/iconcolorful"
	}
	local var_2_1 = {}
	local var_2_2 = {}
	local var_2_3 = arg_2_0.contextData.shipID
	local var_2_4 = var_2_3 and getProxy(BayProxy):getShipById(var_2_3)

	if var_2_4 then
		local var_2_5 = var_2_4:getMetaCharacter()

		if var_2_5 then
			local var_2_6, var_2_7 = MetaCharacterConst.GetMetaCharacterPaintPath(var_2_5.id, true)

			table.insert(var_2_1, var_2_6)
		end

		local var_2_8 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(var_2_4.configId)

		for iter_2_0, iter_2_1 in ipairs(var_2_8) do
			local var_2_9 = getSkillConfig(iter_2_1)

			if var_2_9 and var_2_9.icon then
				table.insert(var_2_2, ResPathSupport.CombinePath("skillicon", var_2_9.icon))
			end
		end
	end

	return ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_2_0), var_2_0, var_2_1, var_2_2)
end

function var_0_0.init(arg_3_0)
	arg_3_0:initUITextTips()
	arg_3_0:initData()
	arg_3_0:initUI()
	arg_3_0:addListener()
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:updateRedTag()
	arg_4_0:updateShipImg()
	arg_4_0:updateNamePanel()
	arg_4_0:updateChar()
	arg_4_0:updateSkillListPanel()
	arg_4_0:enablePartialBlur()

	if arg_4_0.contextData.isMainOpen then
		arg_4_0.contextData.isMainOpen = nil

		arg_4_0:moveShipImg(true)
	end

	arg_4_0:moveRightPanel()
end

function var_0_0.willExit(arg_5_0)
	arg_5_0:moveShipImg(false)
	arg_5_0:recycleChar()
	arg_5_0:disablePartialBlur()
end

function var_0_0.onBackPressed(arg_6_0)
	if isActive(arg_6_0.skillUnlockPanel) then
		arg_6_0:closeUnlockSkillPanel()

		return
	else
		arg_6_0:emit(var_0_0.ON_BACK_PRESSED)
	end
end

function var_0_0.initUITextTips(arg_7_0)
	local var_7_0 = arg_7_0._tf:Find("ExpPanel"):Find("ExpEveryDay")

	setText(var_7_0, i18n("meta_exp_per_day"))

	local var_7_1 = arg_7_0._tf:Find("TaskPanel/StudySkillTip/TipText")

	setText(var_7_1, i18n("meta_skill_unlock"))
end

function var_0_0.initData(arg_8_0)
	arg_8_0.metaCharacterProxy = getProxy(MetaCharacterProxy)
	arg_8_0.bayProxy = getProxy(BayProxy)
	arg_8_0.shipPrefab = nil
	arg_8_0.shipModel = nil
	arg_8_0.curMetaShipID = arg_8_0.contextData.shipID
	arg_8_0.curShipVO = nil
	arg_8_0.curMetaCharacterVO = nil

	arg_8_0:updateData()

	arg_8_0.skillBtnList = {}
	arg_8_0.curUnlockSkillID = nil
	arg_8_0.curUnlockMaterialID = nil
	arg_8_0.curUnlockMaterialNeedCount = nil
end

function var_0_0.updateData(arg_9_0)
	arg_9_0.curShipVO = arg_9_0.bayProxy:getShipById(arg_9_0.curMetaShipID)
	arg_9_0.curMetaCharacterVO = arg_9_0.curShipVO:getMetaCharacter()
end

function var_0_0.setTacticsData(arg_10_0, arg_10_1)
	arg_10_0.doubleExpValue = arg_10_1.doubleExp
	arg_10_0.normalExpValue = arg_10_1.normalExp
	arg_10_0.curSkillID = arg_10_1.curSkillID
	arg_10_0.switchCountLeft = arg_10_1.switchCount
	arg_10_0.taskInfoTable = arg_10_1.taskInfoTable
	arg_10_0.skillExpTable = arg_10_1.skillExpTable
	arg_10_1 = nil
end

function var_0_0.switchTacticsSkillData(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.curSkillID = arg_11_1
	arg_11_0.switchCountLeft = arg_11_2
end

function var_0_0.levelupTacticsSkillData(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.skillExpTable[arg_12_1] = 0
	arg_12_0.switchCountLeft = arg_12_2

	arg_12_0:clearTaskInfo()
end

function var_0_0.updateSkillExp(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.skillExpTable[arg_13_1] = arg_13_2
end

function var_0_0.clearTaskInfo(arg_14_0, arg_14_1)
	arg_14_0.taskInfoTable[arg_14_1] = {}
end

function var_0_0.initUI(arg_15_0)
	arg_15_0.shipImg = arg_15_0._tf:Find("ShipImg")
	arg_15_0.nameTF = arg_15_0._tf:Find("NamePanel")
	arg_15_0.nameScrollText = arg_15_0.nameTF:Find("NameMask/NameText")
	arg_15_0.shipTypeImg = arg_15_0.nameTF:Find("TypeImg")
	arg_15_0.enNameText = arg_15_0.nameTF:Find("NameENText")

	local var_15_0 = arg_15_0.nameTF:Find("StarTpl")
	local var_15_1 = arg_15_0.nameTF:Find("StarContainer")

	arg_15_0.nameTFStarUIList = UIItemList.New(var_15_1, var_15_0)
	arg_15_0.expPanel = arg_15_0._tf:Find("ExpPanel")
	arg_15_0.expText = arg_15_0.expPanel:Find("ExpText")
	arg_15_0.expDoubleTag = arg_15_0.expText:Find("DoubleTag")
	arg_15_0.taskPanel = arg_15_0._tf:Find("TaskPanel")
	arg_15_0.qCharContainer = arg_15_0.taskPanel:Find("QChar")
	arg_15_0.taskTpl = arg_15_0.taskPanel:Find("TaskTpl")
	arg_15_0.taskScrollTF = arg_15_0.taskPanel:Find("ScrollView")
	arg_15_0.taskTplContainer = arg_15_0.taskPanel:Find("ScrollView/Viewport/Content")
	arg_15_0.taskScrollBar = arg_15_0.taskPanel:Find("ScrollView/Scrollbar Vertical")
	arg_15_0.taskUIItemList = UIItemList.New(arg_15_0.taskTplContainer, arg_15_0.taskTpl)
	arg_15_0.skillInfoPanel = arg_15_0.taskPanel:Find("SkillInfo")
	arg_15_0.curSkillIcon = arg_15_0.skillInfoPanel:Find("Skill/Icon")
	arg_15_0.curSkillNameScrollText = arg_15_0.skillInfoPanel:Find("NameMask/Name")
	arg_15_0.curSkillLevelText = arg_15_0.skillInfoPanel:Find("LevelInfo/CurLevel")
	arg_15_0.nextSkillLevelText = arg_15_0.skillInfoPanel:Find("LevelInfo/NextLevel")
	arg_15_0.curSkillDescText = arg_15_0.skillInfoPanel:Find("DescView/Viewport/SkillDesc")
	arg_15_0.curSkillProgressText = arg_15_0.skillInfoPanel:Find("ExpProgress/Text")
	arg_15_0.curSkillProgressSlider = arg_15_0.skillInfoPanel:Find("ExpSlider")
	arg_15_0.curSkillQuickBtn = arg_15_0.skillInfoPanel:Find("QuickBtn")
	arg_15_0.studySkillTip = arg_15_0.taskPanel:Find("StudySkillTip")
	arg_15_0.startSkillTip = arg_15_0.taskPanel:Find("StartLearn")
	arg_15_0.maxSkillTip = arg_15_0.taskPanel:Find("SkillMax")
	arg_15_0.studySkillBtn = arg_15_0.startSkillTip:Find("StartLearnBtn")
	arg_15_0.skillPanel = arg_15_0._tf:Find("SkillPanel")
	arg_15_0.skillTpl = arg_15_0.skillPanel:Find("SkillTpl")
	arg_15_0.skillContainer = arg_15_0.skillPanel:Find("Skills/Content")
	arg_15_0.skillUIItemList = UIItemList.New(arg_15_0.skillContainer, arg_15_0.skillTpl)
	arg_15_0.skillUnlockPanel = arg_15_0._tf:Find("SkillLearnBox")
	arg_15_0.skillUnlockPanelBG = arg_15_0.skillUnlockPanel:Find("BG")
	arg_15_0.skillUnlockPanelTipText = arg_15_0.skillUnlockPanel:Find("Box/TipText")
	arg_15_0.skillUnlockPanelCancelBtn = arg_15_0.skillUnlockPanel:Find("Box/Btns/CancenBtn")
	arg_15_0.skillUnlockPanelConfirmBtn = arg_15_0.skillUnlockPanel:Find("Box/Btns/ConfirmBtn")
	arg_15_0.materialTpl = arg_15_0.skillUnlockPanel:Find("Box/Material")
	arg_15_0.materialTplContainer = arg_15_0.skillUnlockPanel:Find("Box/MaterialContainer")
	arg_15_0.materialUIItemList = UIItemList.New(arg_15_0.materialTplContainer, arg_15_0.materialTpl)
end

function var_0_0.addListener(arg_16_0)
	onButton(arg_16_0, arg_16_0.skillUnlockPanelBG, function()
		arg_16_0:closeUnlockSkillPanel()
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.skillUnlockPanelCancelBtn, function()
		arg_16_0:closeUnlockSkillPanel()
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.skillUnlockPanelConfirmBtn, function()
		if not arg_16_0.curUnlockMaterialID then
			pg.TipsMgr.GetInstance():ShowTips(i18n("meta_unlock_skill_select"))

			return
		elseif getProxy(BagProxy):getItemCountById(arg_16_0.curUnlockMaterialID) < arg_16_0.curUnlockMaterialNeedCount then
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_materal_no_enough"))
		else
			local var_19_0 = 0
			local var_19_1 = 0
			local var_19_2 = arg_16_0:getMetaSkillTacticsConfigBySkillID(arg_16_0.curUnlockSkillID, 1).skill_unlock

			for iter_19_0, iter_19_1 in ipairs(var_19_2) do
				if arg_16_0.curUnlockMaterialID == iter_19_1[2] then
					var_19_0 = iter_19_0
					var_19_1 = iter_19_1[3]

					break
				end
			end

			pg.m02:sendNotification(GAME.TACTICS_META_UNLOCK_SKILL, {
				shipID = arg_16_0.curMetaShipID,
				skillID = arg_16_0.curUnlockSkillID,
				materialIndex = var_19_0,
				materialInfo = {
					id = arg_16_0.curUnlockMaterialID,
					count = var_19_1
				}
			})
		end
	end, SFX_PANEL)
end

function var_0_0.updateRedTag(arg_20_0)
	arg_20_0.metaCharacterProxy:updateRedTag(arg_20_0.curMetaCharacterVO.id)
end

function var_0_0.updateShipImg(arg_21_0)
	local var_21_0, var_21_1 = MetaCharacterConst.GetMetaCharacterPaintPath(arg_21_0.curMetaCharacterVO.id, true)

	setImageSprite(arg_21_0.shipImg, LoadSprite(var_21_0, var_21_1), true)

	local var_21_2 = arg_21_0.curMetaCharacterVO.id
	local var_21_3 = MetaCharacterConst.UIConfig[var_21_2]

	setLocalPosition(arg_21_0.shipImg, {
		x = var_21_3[7],
		y = var_21_3[8]
	})
	setLocalScale(arg_21_0.shipImg, {
		x = var_21_3[3],
		y = var_21_3[4]
	})
end

function var_0_0.updateNamePanel(arg_22_0)
	local var_22_0 = arg_22_0.curShipVO
	local var_22_1 = arg_22_0.curMetaCharacterVO
	local var_22_2 = var_22_0:getName()

	setScrollText(arg_22_0.nameScrollText, var_22_2)

	local var_22_3 = var_22_0:getShipType()

	setImageSprite(arg_22_0.shipTypeImg, LoadSprite("shiptype", var_22_3))

	local var_22_4 = var_22_0:getConfig("english_name")

	setText(arg_22_0.enNameText, var_22_4)

	local var_22_5 = var_22_0:getMaxStar()
	local var_22_6 = var_22_0:getStar()

	arg_22_0.nameTFStarUIList:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			local var_23_0 = arg_23_2:Find("empty")
			local var_23_1 = arg_23_2:Find("on")

			arg_23_1 = arg_23_1 + 1

			setActive(var_23_1, arg_23_1 <= var_22_6)
		end
	end)
	arg_22_0.nameTFStarUIList:align(var_22_5)
end

function var_0_0.updateChar(arg_24_0)
	return
end

function var_0_0.recycleChar(arg_25_0)
	if arg_25_0.shipPrefab and arg_25_0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(arg_25_0.shipPrefab, arg_25_0.shipModel)

		arg_25_0.shipPrefab = nil
		arg_25_0.shipModel = nil
	end
end

function var_0_0.updateSkillListPanel(arg_26_0)
	local var_26_0 = arg_26_0.curShipVO
	local var_26_1 = arg_26_0.curMetaCharacterVO
	local var_26_2 = arg_26_0:getSkillIDListForShow(var_26_0.configId)

	arg_26_0.skillUIItemList:make(function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == UIItemList.EventUpdate then
			local var_27_0 = var_26_2[arg_27_1 + 1]

			if var_27_0 then
				arg_26_0.skillBtnList[var_27_0] = arg_27_2

				arg_26_0:updateSkillTF(arg_27_2, var_27_0)
			end
		end
	end)
	arg_26_0.skillUIItemList:align(#var_26_2)
end

function var_0_0.updateSkillTF(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0.curShipVO
	local var_28_1 = arg_28_0.curMetaCharacterVO
	local var_28_2 = arg_28_1:Find("Skill/Icon")
	local var_28_3 = arg_28_1:Find("Skill/Level")
	local var_28_4 = arg_28_1:Find("Skill/Mask/Name")
	local var_28_5 = arg_28_1:Find("Skill/Arrow")
	local var_28_6 = arg_28_1:Find("Lock")
	local var_28_7 = arg_28_1:Find("Learning")
	local var_28_8 = getSkillConfig(arg_28_2)
	local var_28_9 = var_28_0:getMetaSkillLevelBySkillID(arg_28_2)

	setImageSprite(var_28_2, LoadSprite("skillicon/" .. var_28_8.icon))
	setScrollText(var_28_4, getSkillName(var_28_8.id))

	if var_28_9 > 0 then
		setText(var_28_3, "LEVEL: " .. var_28_9)
		setActive(var_28_6, false)
		onButton(arg_28_0, arg_28_1, function()
			if not isActive(var_28_5) then
				eachChild(arg_28_0.skillContainer, function(arg_30_0)
					local var_30_0 = arg_30_0:Find("Skill/Arrow")

					setActive(var_30_0, false)
				end)
				setActive(var_28_5, true)
				arg_28_0:updateTaskPanel(arg_28_2)
			end
		end, SFX_PANEL)
	else
		setText(var_28_3, "LEVEL: ??")
		setActive(var_28_6, true)
		onButton(arg_28_0, arg_28_1, function()
			arg_28_0:openUnlockSkillPanel(arg_28_2)
		end, SFX_PANEL)
	end
end

function var_0_0.updateSkillTFLearning(arg_32_0)
	local var_32_0 = arg_32_0.curShipVO

	for iter_32_0, iter_32_1 in pairs(arg_32_0.skillBtnList) do
		local var_32_1 = iter_32_1:Find("Learning")
		local var_32_2 = var_32_0:isSkillLevelMax(iter_32_0)
		local var_32_3 = iter_32_0 == arg_32_0.curSkillID

		setActive(var_32_1, var_32_3 and not var_32_2)
	end
end

function var_0_0.TryPlayGuide(arg_33_0)
	pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0025")
end

function var_0_0.updateExpPanel(arg_34_0)
	local var_34_0 = arg_34_0:isAllSkillLock()
	local var_34_1 = arg_34_0:isAllSkillMaxLevel()

	if var_34_0 or var_34_1 then
		setActive(arg_34_0.expPanel, false)
	elseif arg_34_0.curSkillID > 0 then
		setActive(arg_34_0.expPanel, true)

		local var_34_2 = pg.gameset.meta_skill_exp_double.key_value
		local var_34_3 = pg.gameset.meta_skill_exp_max.key_value

		setText(arg_34_0.expText, arg_34_0.normalExpValue .. "/" .. var_34_3)
		setActive(arg_34_0.expDoubleTag, var_34_2 > arg_34_0.doubleExpValue)
	else
		setActive(arg_34_0.expPanel, false)
	end
end

function var_0_0.updateSkillInfoPanel(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0.curShipVO
	local var_35_1 = getSkillConfig(arg_35_1)

	setImageSprite(arg_35_0.curSkillIcon, LoadSprite("skillicon/" .. var_35_1.icon))
	setScrollText(arg_35_0.curSkillNameScrollText, getSkillName(var_35_1.id))

	local var_35_2 = pg.skill_data_template[arg_35_1].max_level
	local var_35_3 = var_35_0:getMetaSkillLevelBySkillID(arg_35_1)
	local var_35_4 = var_35_2 <= var_35_3

	setText(arg_35_0.curSkillLevelText, var_35_3)

	local var_35_5 = math.min(var_35_3 + 1, var_35_2)

	setText(arg_35_0.nextSkillLevelText, var_35_5)
	setText(arg_35_0.curSkillDescText, getSkillDesc(arg_35_1, var_35_0:getMetaSkillLevelBySkillID(arg_35_1)))
	setActive(arg_35_0.curSkillQuickBtn, not var_35_4 and not LOCK_META_SKILL_QUICK)
	onButton(arg_35_0, arg_35_0.curSkillQuickBtn, function()
		arg_35_0:emit(MetaCharacterTacticsMediator.ON_QUICK, arg_35_0.curShipVO.id, arg_35_1)
	end, SFX_PANEL)

	local var_35_6 = arg_35_0.skillExpTable[arg_35_1] or 0

	if not var_35_4 then
		local var_35_7 = arg_35_0:getMetaSkillTacticsConfigBySkillID(arg_35_1, var_35_3).need_exp

		setText(arg_35_0.curSkillProgressText, var_35_6 .. "/" .. var_35_7)
		setSlider(arg_35_0.curSkillProgressSlider, 0, var_35_7, var_35_6)

		if var_35_6 < var_35_7 then
			-- block empty
		end
	else
		setText(arg_35_0.curSkillProgressText, var_35_6 .. "/Max")
		setSlider(arg_35_0.curSkillProgressSlider, 0, 1, 1)
	end
end

function var_0_0.updateTaskListPanel(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0.curShipVO:getMetaSkillLevelBySkillID(arg_37_1)
	local var_37_1 = arg_37_0:getMetaSkillTacticsConfigBySkillID(arg_37_1, var_37_0).skill_levelup_task
	local var_37_2 = arg_37_0:sortTaskConfig(arg_37_1, var_37_1)

	arg_37_0.taskUIItemList:make(function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0 == UIItemList.EventUpdate then
			local var_38_0 = arg_38_2:Find("Desc")
			local var_38_1 = arg_38_2:Find("AddExp")
			local var_38_2 = arg_38_2:Find("Text")

			arg_38_1 = arg_38_1 + 1

			local var_38_3 = var_37_2[arg_38_1]
			local var_38_4 = var_38_3[1]
			local var_38_5 = arg_37_0:getTaskInfoBySkillAndTaskID(arg_37_1, var_38_4)
			local var_38_6 = var_38_5 and var_38_5.finishCount or 0
			local var_38_7 = var_38_3[3]

			setText(var_38_1, "+" .. var_38_7)

			local var_38_8 = var_38_3[2]

			if var_38_8 == 0 then
				setText(var_38_2, var_38_6 .. "/∞")
			else
				setText(var_38_2, var_38_6 .. "/" .. var_38_8)
			end

			setText(var_38_0, pg.task_meta_data_template[var_38_4].desc)
		end
	end)
	arg_37_0.taskUIItemList:align(#var_37_2)
end

function var_0_0.updateTaskPanel(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0.curShipVO
	local var_39_1 = arg_39_0.curMetaCharacterVO

	if var_39_0:isSkillLevelMax(arg_39_1) == true then
		setActive(arg_39_0.studySkillTip, false)
		setActive(arg_39_0.startSkillTip, false)
		setActive(arg_39_0.maxSkillTip, true)
		setActive(arg_39_0.skillInfoPanel, true)
		setActive(arg_39_0.taskTplContainer, false)
		setActive(arg_39_0.taskScrollBar, false)
		arg_39_0:updateSkillInfoPanel(arg_39_1)
	elseif arg_39_1 ~= arg_39_0.curSkillID then
		setActive(arg_39_0.studySkillTip, false)
		setActive(arg_39_0.startSkillTip, true)
		setActive(arg_39_0.maxSkillTip, false)
		setActive(arg_39_0.skillInfoPanel, true)
		setActive(arg_39_0.taskTplContainer, true)
		setActive(arg_39_0.taskScrollBar, true)
		arg_39_0:updateSkillInfoPanel(arg_39_1)
		arg_39_0:updateTaskListPanel(arg_39_1)
		onButton(arg_39_0, arg_39_0.studySkillBtn, function()
			if arg_39_0.switchCountLeft == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("meta_switch_skill_disable"))
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("meta_switch_skill_box_title", getSkillName(arg_39_1)),
					onYes = function()
						pg.m02:sendNotification(GAME.TACTICS_META_SWITCH_SKILL, {
							shipID = var_39_0.id,
							skillID = arg_39_1
						})
					end
				})
			end
		end, SFX_PANEL)
	else
		setActive(arg_39_0.studySkillTip, false)
		setActive(arg_39_0.startSkillTip, false)
		setActive(arg_39_0.maxSkillTip, false)
		setActive(arg_39_0.skillInfoPanel, true)
		setActive(arg_39_0.taskTplContainer, true)
		setActive(arg_39_0.taskScrollBar, true)
		arg_39_0:updateSkillInfoPanel(arg_39_1)
		arg_39_0:updateTaskListPanel(arg_39_1)
	end
end

function var_0_0.updateMain(arg_42_0)
	local var_42_0 = arg_42_0.curShipVO
	local var_42_1 = arg_42_0:getSkillIDListForShow(var_42_0.configId)
	local var_42_2 = true
	local var_42_3 = 0
	local var_42_4, var_42_5 = arg_42_0:isAllSkillLock()

	setActive(arg_42_0.taskScrollTF, not var_42_4)

	if var_42_4 then
		setActive(arg_42_0.expPanel, false)
		setActive(arg_42_0.skillInfoPanel, false)
		setActive(arg_42_0.taskTplContainer, false)
		setActive(arg_42_0.taskScrollBar, false)
		setActive(arg_42_0.studySkillTip, true)
		setActive(arg_42_0.startSkillTip, false)
		setActive(arg_42_0.maxSkillTip, false)
	elseif arg_42_0.curUnlockSkillID then
		triggerButton(arg_42_0.skillBtnList[arg_42_0.curUnlockSkillID])
	elseif arg_42_0.curSkillID > 0 then
		triggerButton(arg_42_0.skillBtnList[arg_42_0.curSkillID])
	else
		triggerButton(arg_42_0.skillBtnList[var_42_5])
	end
end

function var_0_0.tryLearnSkillAfterFirstUnlock(arg_43_0)
	local var_43_0 = arg_43_0.curUnlockSkillID
	local var_43_1 = 1

	arg_43_0:switchTacticsSkillData(var_43_0, var_43_1)
	arg_43_0:updateExpPanel()
	arg_43_0:updateTaskPanel(var_43_0)
	arg_43_0:updateSkillTFLearning()
	arg_43_0:TryPlayGuide()
end

function var_0_0.moveShipImg(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0.curMetaCharacterVO.id
	local var_44_1 = MetaCharacterConst.UIConfig[var_44_0]
	local var_44_2 = arg_44_1 and -2000 or var_44_1[7]
	local var_44_3 = arg_44_1 and var_44_1[7] or -2000

	arg_44_0:managedTween(LeanTween.moveX, nil, rtf(arg_44_0.shipImg), var_44_3, 0.2):setFrom(var_44_2)
end

function var_0_0.moveRightPanel(arg_45_0)
	local var_45_0 = 2000
	local var_45_1 = 500

	arg_45_0:managedTween(LeanTween.moveX, nil, rtf(arg_45_0.skillPanel), var_45_1, 0.2):setFrom(var_45_0)
	arg_45_0:managedTween(LeanTween.moveX, nil, rtf(arg_45_0.taskPanel), var_45_1, 0.2):setFrom(var_45_0)
end

function var_0_0.openUnlockSkillPanel(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0.curShipVO
	local var_46_1 = arg_46_0.curMetaCharacterVO

	arg_46_0.curUnlockSkillID = arg_46_1

	local var_46_2 = ShipGroup.getDefaultShipNameByGroupID(var_46_1.id)
	local var_46_3 = getSkillName(arg_46_1)

	setText(arg_46_0.skillUnlockPanelTipText, i18n("meta_unlock_skill_tip", var_46_2, var_46_3))

	local var_46_4 = arg_46_0:getMetaSkillTacticsConfigBySkillID(arg_46_1, 1)
	local var_46_5 = var_46_4.skill_unlock
	local var_46_6 = {
		var_46_4.skill_unlock[1]
	}

	arg_46_0.materialUIItemList:make(function(arg_47_0, arg_47_1, arg_47_2)
		if arg_47_0 == UIItemList.EventUpdate then
			arg_47_1 = arg_47_1 + 1

			local var_47_0 = var_46_6[arg_47_1]
			local var_47_1 = arg_47_2:Find("Item")
			local var_47_2 = arg_47_2:Find("SelectedTag")
			local var_47_3 = arg_47_2:Find("Count/Text")
			local var_47_4 = {
				type = DROP_TYPE_ITEM,
				id = var_47_0[2],
				count = var_47_0[3]
			}

			updateDrop(var_47_1, var_47_4)
			setActive(var_47_2, false)

			local var_47_5 = var_47_0[2]
			local var_47_6 = var_47_0[3]
			local var_47_7 = getProxy(BagProxy):getItemCountById(var_47_5)
			local var_47_8 = var_47_7 < var_47_6 and setColorStr(var_47_7, COLOR_RED) or setColorStr(var_47_7, COLOR_GREEN)

			setText(var_47_3, var_47_8 .. "/" .. var_47_6)

			arg_46_0.curUnlockMaterialID = var_47_5
			arg_46_0.curUnlockMaterialNeedCount = var_47_6
		end
	end)
	arg_46_0.materialUIItemList:align(#var_46_6)
	setActive(arg_46_0.skillUnlockPanel, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_46_0.skillUnlockPanel)
end

function var_0_0.closeUnlockSkillPanel(arg_48_0)
	arg_48_0.curUnlockSkillID = nil
	arg_48_0.curUnlockMaterialID = nil
	arg_48_0.curUnlockMaterialNeedCount = nil

	setActive(arg_48_0.skillUnlockPanel, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_48_0.skillUnlockPanel, arg_48_0._tf)
end

function var_0_0.enablePartialBlur(arg_49_0)
	if arg_49_0._tf then
		local var_49_0 = {}

		table.insert(var_49_0, arg_49_0.taskPanel)
		table.insert(var_49_0, arg_49_0.skillPanel)
		arg_49_0:OverlayPanel(arg_49_0._tf, {
			groupDelta = -1,
			pbList = var_49_0
		})
	end
end

function var_0_0.disablePartialBlur(arg_50_0)
	if arg_50_0._tf then
		arg_50_0:UnOverlayPanel(arg_50_0._tf)
	end
end

function var_0_0.getMetaSkillTacticsConfigBySkillID(arg_51_0, arg_51_1, arg_51_2)
	return MetaCharacterConst.getMetaSkillTacticsConfig(arg_51_1, arg_51_2)
end

function var_0_0.getTaskInfoBySkillAndTaskID(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = arg_52_0.taskInfoTable[arg_52_1] or {}

	for iter_52_0, iter_52_1 in ipairs(var_52_0) do
		if iter_52_1.taskID == arg_52_2 then
			return iter_52_1
		end
	end
end

function var_0_0.isAllSkillLock(arg_53_0)
	local var_53_0 = arg_53_0.curShipVO
	local var_53_1 = arg_53_0:getSkillIDListForShow(var_53_0.configId)
	local var_53_2 = true
	local var_53_3 = 0

	for iter_53_0, iter_53_1 in ipairs(var_53_1) do
		if var_53_0:getMetaSkillLevelBySkillID(iter_53_1) > 0 then
			var_53_2 = false
			var_53_3 = iter_53_1

			break
		end
	end

	return var_53_2, var_53_3
end

function var_0_0.isAllSkillMaxLevel(arg_54_0)
	local var_54_0 = arg_54_0.curShipVO
	local var_54_1 = arg_54_0:getSkillIDListForShow(var_54_0.configId)
	local var_54_2 = true

	for iter_54_0, iter_54_1 in ipairs(var_54_1) do
		if not var_54_0:isSkillLevelMax(iter_54_1) then
			return false
		end
	end
end

function var_0_0.updateTacticsRedTag(arg_55_0)
	local var_55_0 = arg_55_0.curShipVO
	local var_55_1 = var_55_0:getMetaCharacter()
	local var_55_2 = arg_55_0:getSkillIDListForShow(var_55_0.configId)
	local var_55_3 = false

	for iter_55_0, iter_55_1 in ipairs(var_55_2) do
		local var_55_4 = var_55_0:getMetaSkillLevelBySkillID(iter_55_1)
		local var_55_5 = var_55_0:isSkillLevelMax(iter_55_1)

		if var_55_4 > 0 and not var_55_5 and arg_55_0:getMetaSkillTacticsConfigBySkillID(iter_55_1, var_55_4).need_exp <= (arg_55_0.skillExpTable and arg_55_0.skillExpTable[iter_55_1] or 0) then
			local var_55_6 = true

			break
		end
	end
end

function var_0_0.sortTaskConfig(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = Clone(arg_56_2)

	table.sort(var_56_0, function(arg_57_0, arg_57_1)
		local var_57_0 = arg_57_0[1]
		local var_57_1 = arg_57_1[1]
		local var_57_2 = arg_57_0[2]
		local var_57_3 = arg_57_1[2]
		local var_57_4 = arg_56_0:getTaskInfoBySkillAndTaskID(arg_56_1, var_57_0)
		local var_57_5 = arg_56_0:getTaskInfoBySkillAndTaskID(arg_56_1, var_57_1)
		local var_57_6 = var_57_4 and var_57_4.finishCount or 0
		local var_57_7 = var_57_5 and var_57_5.finishCount or 0
		local var_57_8 = var_57_2 > 0 and var_57_6 <= var_57_2
		local var_57_9 = var_57_3 > 0 and var_57_7 <= var_57_3

		if var_57_2 == 0 and var_57_3 == 0 then
			return var_57_0 < var_57_1
		elseif var_57_2 == 0 then
			return true
		elseif var_57_3 == 0 then
			return false
		elseif var_57_8 == true and var_57_9 == true then
			return var_57_0 < var_57_1
		elseif var_57_8 == true then
			return false
		elseif var_57_9 == true then
			return true
		else
			return var_57_0 < var_57_1
		end
	end)

	return var_56_0
end

function var_0_0.getSkillIDListForShow(arg_58_0, arg_58_1)
	return MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_58_1)
end

return var_0_0
