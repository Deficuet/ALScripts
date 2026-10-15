local var_0_0 = class("MetaSkillDetailBoxLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "MetaSkillDetailBoxUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = getProxy(BayProxy):getShipById(arg_2_0.contextData.metaShipID)
	local var_2_2 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(var_2_1.configId)

	for iter_2_0 = 1, #var_2_2 do
		local var_2_3 = var_2_2[iter_2_0]
		local var_2_4 = getSkillConfig(var_2_3)

		table.insert(var_2_0, "skillicon/" .. var_2_4.icon)
	end

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))

	return var_2_0
end

function var_0_0.init(arg_3_0)
	arg_3_0:initUITextTips()
	arg_3_0:initData()
	arg_3_0:findUI()
	arg_3_0:addListener()
end

function var_0_0.didEnter(arg_4_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
	arg_4_0:updateShipDetail()
	arg_4_0:updateSkillList()
end

function var_0_0.willExit(arg_5_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_5_0._tf)
end

function var_0_0.initUITextTips(arg_6_0)
	local var_6_0 = arg_6_0._tf:Find("Window/top/bg/infomation/title")
	local var_6_1 = arg_6_0._tf:Find("Window/MetaSkillDetailBox/ExpDetail/ExpTipText")
	local var_6_2 = arg_6_0._tf:Find("Window/MetaSkillDetailBox/TipText")

	setText(var_6_0, i18n("battle_end_subtitle2"))
	setText(var_6_1, i18n("meta_skill_dailyexp"))
	setText(var_6_2, i18n("meta_skill_learn"))
end

function var_0_0.initData(arg_7_0)
	arg_7_0.metaProxy = getProxy(MetaCharacterProxy)
	arg_7_0.metaShipID = arg_7_0.contextData.metaShipID
end

function var_0_0.findUI(arg_8_0)
	arg_8_0.bg = arg_8_0._tf:Find("BG")
	arg_8_0.window = arg_8_0._tf:Find("Window")
	arg_8_0.closeBtn = arg_8_0.window:Find("top/btnBack")
	arg_8_0.panel = arg_8_0.window:Find("MetaSkillDetailBox")
	arg_8_0.skillTpl = arg_8_0.panel:Find("SkillTpl")
	arg_8_0.expDetailTF = arg_8_0.panel:Find("ExpDetail")
	arg_8_0.shipIcon = arg_8_0.expDetailTF:Find("IconTpl/Icon")
	arg_8_0.shipNameText = arg_8_0.expDetailTF:Find("NameMask/Name")
	arg_8_0.expProgressText = arg_8_0.expDetailTF:Find("ExpProgressText")
	arg_8_0.skillContainer = arg_8_0.panel:Find("ScrollView/Content")
	arg_8_0.skillUIItemList = UIItemList.New(arg_8_0.skillContainer, arg_8_0.skillTpl)
end

function var_0_0.addListener(arg_9_0)
	onButton(arg_9_0, arg_9_0.bg, function()
		arg_9_0:closeView()
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.closeBtn, function()
		arg_9_0:closeView()
	end, SFX_PANEL)
end

function var_0_0.updateSkillTF(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_1:Find("frame")
	local var_12_1 = arg_12_1:Find("check_mark")
	local var_12_2 = var_12_0:Find("skillInfo")
	local var_12_3 = var_12_0:Find("mask")
	local var_12_4 = var_12_0:Find("Slider")
	local var_12_5 = var_12_2:Find("icon")
	local var_12_6 = var_12_2:Find("ExpProgressText")
	local var_12_7 = var_12_2:Find("name_contain/name")
	local var_12_8 = var_12_2:Find("name_contain/level_contain/Text")
	local var_12_9 = var_12_0:Find("Tag/learing")
	local var_12_10 = var_12_0:Find("Tag/unlockable")
	local var_12_11 = getProxy(BayProxy):getShipById(arg_12_0.metaShipID)
	local var_12_12 = var_12_11:getMetaSkillLevelBySkillID(arg_12_2)
	local var_12_13 = getSkillConfig(arg_12_2)

	setImageSprite(var_12_5, LoadSprite("skillicon/" .. var_12_13.icon))
	setText(var_12_7, shortenString(getSkillName(var_12_13.id), 8))
	setText(var_12_8, var_12_12)

	local var_12_14 = arg_12_0.metaProxy:getMetaTacticsInfoByShipID(arg_12_0.metaShipID)
	local var_12_15 = arg_12_2 == var_12_14.curSkillID
	local var_12_16 = var_12_12 > 0
	local var_12_17 = var_12_11:isSkillLevelMax(arg_12_2)
	local var_12_18 = var_12_14:getSkillExp(arg_12_2)

	if not (var_12_12 >= pg.skill_data_template[arg_12_2].max_level) then
		if var_12_16 then
			local var_12_19 = MetaCharacterConst.getMetaSkillTacticsConfig(arg_12_2, var_12_12).need_exp

			setText(var_12_6, var_12_18 .. "/" .. var_12_19)
			setSlider(var_12_4, 0, var_12_19, var_12_18)
			setActive(var_12_6, true)
			setActive(var_12_4, true)
		else
			setActive(var_12_6, false)
			setActive(var_12_4, false)
		end
	else
		setText(var_12_6, var_12_18 .. "/Max")
		setSlider(var_12_4, 0, 1, 1)
		setActive(var_12_6, true)
		setActive(var_12_4, true)
	end

	setActive(var_12_1, var_12_15 and not var_12_17)
	setActive(var_12_9, var_12_15 and not var_12_17)
	setActive(var_12_10, not var_12_16)
	setActive(var_12_3, not var_12_16)
	onToggle(arg_12_0, arg_12_1, function(arg_13_0)
		if arg_13_0 then
			if not var_12_16 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideYes = true,
					hideNo = true,
					type = MSGBOX_TYPE_META_SKILL_UNLOCK,
					metaShipVO = var_12_11,
					skillID = arg_12_2
				})
			elseif not var_12_15 and not var_12_17 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("meta_switch_skill_box_title", getSkillName(arg_12_2)),
					onYes = function()
						pg.m02:sendNotification(GAME.TACTICS_META_SWITCH_SKILL, {
							shipID = arg_12_0.metaShipID,
							skillID = arg_12_2
						})
					end
				})
			elseif var_12_17 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("meta_skill_maxtip2"))
			end
		end
	end, SFX_PANEL)
end

function var_0_0.updateSkillList(arg_15_0)
	local var_15_0 = getProxy(BayProxy):getShipById(arg_15_0.metaShipID)
	local var_15_1 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(var_15_0.configId)

	arg_15_0.skillUIItemList:make(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == UIItemList.EventUpdate then
			arg_16_1 = arg_16_1 + 1

			local var_16_0 = var_15_1[arg_16_1]

			arg_15_0:updateSkillTF(arg_16_2, var_16_0)
		end
	end)
	arg_15_0.skillUIItemList:align(#var_15_1)
end

function var_0_0.updateShipDetail(arg_17_0)
	local var_17_0 = getProxy(BayProxy):getShipById(arg_17_0.metaShipID)
	local var_17_1 = var_17_0:getPainting()
	local var_17_2 = "SquareIcon/" .. var_17_1

	setImageSprite(arg_17_0.shipIcon, LoadSprite(var_17_2, var_17_1))
	setScrollText(arg_17_0.shipNameText, var_17_0:getName())

	local var_17_3 = arg_17_0.metaProxy:getMetaTacticsInfoByShipID(arg_17_0.metaShipID).curDayExp
	local var_17_4 = setColorStr(var_17_3, "#FFF152FF") .. "/" .. pg.gameset.meta_skill_exp_max.key_value

	setText(arg_17_0.expProgressText, var_17_4)
end

return var_0_0
