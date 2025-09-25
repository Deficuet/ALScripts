local var_0_0 = class("MetaSkillDetailBoxLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "MetaSkillDetailBoxUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initUITextTips()
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
	arg_3_0:updateShipDetail()
	arg_3_0:updateSkillList()
end

function var_0_0.willExit(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf)
end

function var_0_0.initUITextTips(arg_5_0)
	local var_5_0 = arg_5_0:findTF("Window/top/bg/infomation/title")
	local var_5_1 = arg_5_0:findTF("Window/MetaSkillDetailBox/ExpDetail/ExpTipText")
	local var_5_2 = arg_5_0:findTF("Window/MetaSkillDetailBox/TipText")

	setText(var_5_0, i18n("battle_end_subtitle2"))
	setText(var_5_1, i18n("meta_skill_dailyexp"))
	setText(var_5_2, i18n("meta_skill_learn"))
end

function var_0_0.initData(arg_6_0)
	arg_6_0.metaProxy = getProxy(MetaCharacterProxy)
	arg_6_0.metaShipID = arg_6_0.contextData.metaShipID
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.bg = arg_7_0:findTF("BG")
	arg_7_0.window = arg_7_0:findTF("Window")
	arg_7_0.closeBtn = arg_7_0:findTF("top/btnBack", arg_7_0.window)
	arg_7_0.panel = arg_7_0:findTF("MetaSkillDetailBox", arg_7_0.window)
	arg_7_0.skillTpl = arg_7_0:findTF("SkillTpl", arg_7_0.panel)
	arg_7_0.expDetailTF = arg_7_0:findTF("ExpDetail", arg_7_0.panel)
	arg_7_0.shipIcon = arg_7_0:findTF("IconTpl/Icon", arg_7_0.expDetailTF)
	arg_7_0.shipNameText = arg_7_0:findTF("NameMask/Name", arg_7_0.expDetailTF)
	arg_7_0.expProgressText = arg_7_0:findTF("ExpProgressText", arg_7_0.expDetailTF)
	arg_7_0.skillContainer = arg_7_0:findTF("ScrollView/Content", arg_7_0.panel)
	arg_7_0.skillUIItemList = UIItemList.New(arg_7_0.skillContainer, arg_7_0.skillTpl)
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.bg, function()
		arg_8_0:closeView()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.closeBtn, function()
		arg_8_0:closeView()
	end, SFX_PANEL)
end

function var_0_0.updateSkillTF(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0:findTF("frame", arg_11_1)
	local var_11_1 = arg_11_0:findTF("check_mark", arg_11_1)
	local var_11_2 = arg_11_0:findTF("skillInfo", var_11_0)
	local var_11_3 = arg_11_0:findTF("mask", var_11_0)
	local var_11_4 = arg_11_0:findTF("Slider", var_11_0)
	local var_11_5 = arg_11_0:findTF("icon", var_11_2)
	local var_11_6 = arg_11_0:findTF("ExpProgressText", var_11_2)
	local var_11_7 = arg_11_0:findTF("name_contain/name", var_11_2)
	local var_11_8 = arg_11_0:findTF("name_contain/level_contain/Text", var_11_2)
	local var_11_9 = arg_11_0:findTF("Tag/learing", var_11_0)
	local var_11_10 = arg_11_0:findTF("Tag/unlockable", var_11_0)
	local var_11_11 = getProxy(BayProxy):getShipById(arg_11_0.metaShipID)
	local var_11_12 = var_11_11:getMetaSkillLevelBySkillID(arg_11_2)
	local var_11_13 = getSkillConfig(arg_11_2)

	setImageSprite(var_11_5, LoadSprite("skillicon/" .. var_11_13.icon))
	setText(var_11_7, shortenString(getSkillName(var_11_13.id), 8))
	setText(var_11_8, var_11_12)

	local var_11_14 = arg_11_0.metaProxy:getMetaTacticsInfoByShipID(arg_11_0.metaShipID)
	local var_11_15 = arg_11_2 == var_11_14.curSkillID
	local var_11_16 = var_11_12 > 0
	local var_11_17 = var_11_11:isSkillLevelMax(arg_11_2)
	local var_11_18 = var_11_14:getSkillExp(arg_11_2)

	if not (var_11_12 >= pg.skill_data_template[arg_11_2].max_level) then
		if var_11_16 then
			local var_11_19 = MetaCharacterConst.getMetaSkillTacticsConfig(arg_11_2, var_11_12).need_exp

			setText(var_11_6, var_11_18 .. "/" .. var_11_19)
			setSlider(var_11_4, 0, var_11_19, var_11_18)
			setActive(var_11_6, true)
			setActive(var_11_4, true)
		else
			setActive(var_11_6, false)
			setActive(var_11_4, false)
		end
	else
		setText(var_11_6, var_11_18 .. "/Max")
		setSlider(var_11_4, 0, 1, 1)
		setActive(var_11_6, true)
		setActive(var_11_4, true)
	end

	setActive(var_11_1, var_11_15 and not var_11_17)
	setActive(var_11_9, var_11_15 and not var_11_17)
	setActive(var_11_10, not var_11_16)
	setActive(var_11_3, not var_11_16)
	onToggle(arg_11_0, arg_11_1, function(arg_12_0)
		if arg_12_0 then
			if not var_11_16 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideYes = true,
					hideNo = true,
					type = MSGBOX_TYPE_META_SKILL_UNLOCK,
					metaShipVO = var_11_11,
					skillID = arg_11_2
				})
			elseif not var_11_15 and not var_11_17 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("meta_switch_skill_box_title", getSkillName(arg_11_2)),
					onYes = function()
						pg.m02:sendNotification(GAME.TACTICS_META_SWITCH_SKILL, {
							shipID = arg_11_0.metaShipID,
							skillID = arg_11_2
						})
					end
				})
			elseif var_11_17 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("meta_skill_maxtip2"))
			end
		end
	end, SFX_PANEL)
end

function var_0_0.updateSkillList(arg_14_0)
	local var_14_0 = getProxy(BayProxy):getShipById(arg_14_0.metaShipID)
	local var_14_1 = MetaCharacterConst.getTacticsSkillIDListByShipConfigID(var_14_0.configId)

	arg_14_0.skillUIItemList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			arg_15_1 = arg_15_1 + 1

			local var_15_0 = var_14_1[arg_15_1]

			arg_14_0:updateSkillTF(arg_15_2, var_15_0)
		end
	end)
	arg_14_0.skillUIItemList:align(#var_14_1)
end

function var_0_0.updateShipDetail(arg_16_0)
	local var_16_0 = getProxy(BayProxy):getShipById(arg_16_0.metaShipID)
	local var_16_1 = var_16_0:getPainting()
	local var_16_2 = "SquareIcon/" .. var_16_1

	setImageSprite(arg_16_0.shipIcon, LoadSprite(var_16_2, var_16_1))
	setScrollText(arg_16_0.shipNameText, var_16_0:getName())

	local var_16_3 = arg_16_0.metaProxy:getMetaTacticsInfoByShipID(arg_16_0.metaShipID).curDayExp
	local var_16_4 = setColorStr(var_16_3, "#FFF152FF") .. "/" .. pg.gameset.meta_skill_exp_max.key_value

	setText(arg_16_0.expProgressText, var_16_4)
end

return var_0_0
