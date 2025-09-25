local var_0_0 = class("NavalTacticsMetaSkillsView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "NavalTacticsMetaSkillsPanel"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initUITip()
	arg_2_0:initUI()
	arg_2_0:addListener()
	arg_2_0:updateSkillList()
	triggerToggle(arg_2_0.skillToggleList[1], true)
	arg_2_0:Show()
end

function var_0_0.Show(arg_3_0)
	var_0_0.super.Show(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.Hide(arg_4_0)
	var_0_0.super.Hide(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf, pg.UIMgr.GetInstance().UIMain)
end

function var_0_0.OnDestroy(arg_5_0)
	arg_5_0:Hide()
end

function var_0_0.setData(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.metaShipID = arg_6_1 or arg_6_0.metaShipID
	arg_6_0.metaShipVO = getProxy(BayProxy):getShipById(arg_6_0.metaShipID)
	arg_6_0.closeCB = arg_6_2 or arg_6_0.closeCB
	arg_6_0.metaProxy = getProxy(MetaCharacterProxy)
	arg_6_0.metaTacticsInfo = arg_6_0.metaProxy:getMetaTacticsInfoByShipID(arg_6_0.metaShipVO.id)
	arg_6_0.selectSkillID = arg_6_0.selectSkillID or nil
end

function var_0_0.initUITip(arg_7_0)
	local var_7_0 = arg_7_0:findTF("frame/bg/title_bg/title")
	local var_7_1 = arg_7_0:findTF("frame/buttons/detail_btn/Image")
	local var_7_2 = arg_7_0:findTF("frame/buttons/unlock_btn/Image")
	local var_7_3 = arg_7_0:findTF("frame/buttons/switch_btn/Image")

	setText(var_7_1, i18n("meta_tactics_detail"))
	setText(var_7_2, i18n("meta_tactics_unlock"))
	setText(var_7_3, i18n("meta_tactics_switch"))
end

function var_0_0.initUI(arg_8_0)
	arg_8_0.bg = arg_8_0:findTF("print")

	local var_8_0 = arg_8_0:findTF("frame")

	arg_8_0.skillTpl = arg_8_0:findTF("skilltpl", var_8_0)
	arg_8_0.skillContainer = arg_8_0:findTF("skill_contain/content", var_8_0)

	local var_8_1 = arg_8_0:findTF("buttons", var_8_0)

	arg_8_0.detailBtn = arg_8_0:findTF("detail_btn", var_8_1)
	arg_8_0.unlockBtn = arg_8_0:findTF("unlock_btn", var_8_1)
	arg_8_0.switchBtn = arg_8_0:findTF("switch_btn", var_8_1)
	arg_8_0.skillUIItemList = UIItemList.New(arg_8_0.skillContainer, arg_8_0.skillTpl)
end

function var_0_0.addListener(arg_9_0)
	onButton(arg_9_0, arg_9_0.bg, function()
		arg_9_0:Hide()

		if arg_9_0.closeCB then
			arg_9_0.closeCB()
		else
			arg_9_0:Destroy()
		end
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0.detailBtn, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.METACHARACTER, {
			autoOpenTactics = true,
			autoOpenShipConfigID = arg_9_0.metaShipVO.configId
		})
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.unlockBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideYes = true,
			hideNo = true,
			type = MSGBOX_TYPE_META_SKILL_UNLOCK,
			metaShipVO = arg_9_0.metaShipVO,
			skillID = arg_9_0.selectSkillID
		})
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.switchBtn, function()
		pg.m02:sendNotification(GAME.TACTICS_META_SWITCH_SKILL, {
			shipID = arg_9_0.metaShipVO.id,
			skillID = arg_9_0.selectSkillID
		})
	end, SFX_PANEL)
end

function var_0_0.updateSkillTF(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0:findTF("frame", arg_14_1)
	local var_14_1 = arg_14_0:findTF("skillInfo", var_14_0)
	local var_14_2 = arg_14_0:findTF("empty", var_14_0)
	local var_14_3 = arg_14_0:findTF("mask", var_14_0)
	local var_14_4 = arg_14_0:findTF("icon", var_14_1)
	local var_14_5 = arg_14_0:findTF("descView/Viewport/desc", var_14_1)
	local var_14_6 = arg_14_0:findTF("next_contain/label", var_14_1)
	local var_14_7 = arg_14_0:findTF("next_contain/Text", var_14_1)
	local var_14_8 = arg_14_0:findTF("name_contain/name", var_14_1)
	local var_14_9 = arg_14_0:findTF("name_contain/level_contain/Text", var_14_1)
	local var_14_10 = arg_14_0:findTF("Tag/learing", var_14_0)
	local var_14_11 = arg_14_0:findTF("Tag/unlockable", var_14_0)
	local var_14_12 = arg_14_0.metaShipVO:getMetaSkillLevelBySkillID(arg_14_2)
	local var_14_13 = getSkillConfig(arg_14_2)
	local var_14_14 = arg_14_2 == arg_14_0.metaTacticsInfo.curSkillID
	local var_14_15 = var_14_12 > 0

	setImageSprite(var_14_4, LoadSprite("skillicon/" .. var_14_13.icon))
	setText(var_14_5, getSkillDesc(arg_14_2, var_14_15 and var_14_12 or 1))
	setText(var_14_8, getSkillName(var_14_13.id))
	setText(var_14_9, var_14_12)

	local var_14_16 = arg_14_0.metaTacticsInfo:getSkillExp(arg_14_2)
	local var_14_17 = var_14_12 >= pg.skill_data_template[arg_14_2].max_level

	if not var_14_17 then
		if var_14_15 then
			local var_14_18 = MetaCharacterConst.getMetaSkillTacticsConfig(arg_14_2, var_14_12).need_exp

			setText(var_14_7, setColorStr(var_14_16, COLOR_GREEN) .. "/" .. var_14_18)
			setActive(var_14_6, true)
			setActive(var_14_7, true)
		else
			setActive(var_14_6, false)
			setActive(var_14_7, false)
		end
	else
		setText(var_14_7, "Max")
	end

	setActive(var_14_10, var_14_14 and not var_14_17)
	setActive(var_14_11, not var_14_15)
	setActive(var_14_3, not var_14_15)
	onToggle(arg_14_0, arg_14_1, function(arg_15_0)
		if arg_15_0 then
			arg_14_0.selectSkillID = arg_14_2

			arg_14_0:updateButtons(arg_14_0.selectSkillID)
		end
	end, SFX_PANEL)
end

function var_0_0.updateSkillList(arg_16_0)
	local var_16_0 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(arg_16_0.metaShipVO.configId)

	arg_16_0.skillUIItemList:make(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == UIItemList.EventUpdate then
			arg_17_1 = arg_17_1 + 1
			arg_16_0.skillToggleList = arg_16_0.skillToggleList or {}
			arg_16_0.skillToggleList[arg_17_1] = arg_17_2

			local var_17_0 = var_16_0[arg_17_1]

			arg_16_0:updateSkillTF(arg_17_2, var_17_0)
		end
	end)
	arg_16_0.skillUIItemList:align(#var_16_0)
end

function var_0_0.updateButtons(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1 or arg_18_0.selectSkillID
	local var_18_1 = var_18_0 == arg_18_0.metaTacticsInfo.curSkillID
	local var_18_2 = arg_18_0.metaShipVO:getMetaSkillLevelBySkillID(var_18_0) > 0
	local var_18_3 = arg_18_0.metaShipVO:isSkillLevelMax(var_18_0)

	if var_18_1 or var_18_3 then
		setActive(arg_18_0.detailBtn, true)
		setActive(arg_18_0.unlockBtn, false)
		setActive(arg_18_0.switchBtn, false)
	elseif not var_18_2 then
		setActive(arg_18_0.detailBtn, true)
		setActive(arg_18_0.unlockBtn, true)
		setActive(arg_18_0.switchBtn, false)
	elseif var_18_2 and not var_18_1 then
		setActive(arg_18_0.detailBtn, true)
		setActive(arg_18_0.unlockBtn, false)
		setActive(arg_18_0.switchBtn, true)
	end
end

function var_0_0.reUpdate(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0:setData(arg_19_1, arg_19_2)
	arg_19_0:updateSkillList()
	arg_19_0:updateButtons()
end

return var_0_0
