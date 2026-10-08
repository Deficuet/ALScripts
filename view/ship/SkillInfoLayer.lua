local var_0_0 = class("SkillInfoLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SkillInfoUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = arg_2_1.skillId
	local var_2_2 = getSkillConfig(var_2_1)
	local var_2_3 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.ShipSkillIcon, var_2_2.icon)

	table.insert(var_2_0, var_2_3)

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.init(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)

	arg_3_0.backBtn = arg_3_0._tf:Find("panel/top/btnBack")
	arg_3_0.skillInfoName = arg_3_0._tf:Find("panel/bg/skill_name")
	arg_3_0.skillInfoLv = arg_3_0._tf:Find("panel/bg/skill_lv")
	arg_3_0.skillInfoIntro = arg_3_0._tf:Find("panel/bg/help_panel/skill_intro")
	arg_3_0.skillInfoIcon = arg_3_0._tf:Find("panel/bg/skill_icon")
	arg_3_0.btnTypeNormal = arg_3_0._tf:Find("panel/bg/btn_type_normal")
	arg_3_0.btnTypeWorld = arg_3_0._tf:Find("panel/bg/btn_type_world")
	arg_3_0.buttonList = arg_3_0._tf:Find("panel/buttonList")
	arg_3_0.upgradeBtn = arg_3_0._tf:Find("panel/buttonList/level_button")
	arg_3_0.metaBtn = arg_3_0._tf:Find("panel/buttonList/meta_button")

	setText(arg_3_0.metaBtn:Find("Image"), i18n("meta_skillbtn_tactics"))
	setText(arg_3_0._tf:Find("panel/top/title_list/infomation/title"), i18n("words_information"))
	setText(arg_3_0.buttonList:Find("ok_button/Image"), i18n("text_confirm"))

	if PLATFORM_CODE == PLATFORM_JP then
		setText(arg_3_0.buttonList:Find("level_button/Image"), i18n("msgbox_text_noPos_intensify"))
	else
		setText(arg_3_0.buttonList:Find("level_button/Image"), i18n("msgbox_text_upgrade"))
	end
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf, function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0.backBtn, function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0._tf:Find("panel/buttonList/ok_button"), function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CONFIRM)
	onButton(arg_4_0, arg_4_0.upgradeBtn, function()
		arg_4_0:emit(SkillInfoMediator.WARP_TO_TACTIC)
	end, SFX_UI_CLICK)
	onButton(arg_4_0, arg_4_0.metaBtn, function()
		local var_9_0 = arg_4_0.contextData.shipId
		local var_9_1
		local var_9_2

		if var_9_0 then
			var_9_2 = getProxy(BayProxy):getShipById(arg_4_0.contextData.shipId)
			var_9_1 = var_9_2:isMetaShip()
		end

		if var_9_1 then
			arg_4_0:emit(SkillInfoMediator.WARP_TO_META_TACTICS, var_9_2.configId)
		end
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.btnTypeNormal, function()
		arg_4_0:showInfo(false)
		arg_4_0:flushTypeBtn()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.btnTypeWorld, function()
		arg_4_0:showInfo(true)
		arg_4_0:flushTypeBtn()
	end, SFX_PANEL)

	if tobool(pg.skill_world_display[arg_4_0.contextData.skillId]) then
		arg_4_0:flushTypeBtn()
	else
		setActive(arg_4_0.btnTypeNormal, false)
		setActive(arg_4_0.btnTypeWorld, false)
	end

	arg_4_0:showBase()
	arg_4_0:showInfo(false)
end

function var_0_0.flushTypeBtn(arg_12_0)
	setActive(arg_12_0.btnTypeNormal, arg_12_0.isWorld)
	setActive(arg_12_0.btnTypeWorld, not arg_12_0.isWorld)
end

function var_0_0.showBase(arg_13_0)
	local var_13_0 = arg_13_0.contextData.skillId
	local var_13_1 = arg_13_0.contextData.skillOnShip

	setText(arg_13_0.skillInfoName, getSkillName(var_13_0))

	local var_13_2 = getSkillConfig(var_13_0)

	LoadImageSpriteAsync("skillicon/" .. var_13_2.icon, arg_13_0.skillInfoIcon)

	local var_13_3 = not arg_13_0.contextData.fromNewShip and var_13_1 and var_13_1.level < #var_13_2 and var_13_1.id ~= 22262 and var_13_1.id ~= 22261

	setActive(arg_13_0.upgradeBtn, var_13_3)

	local var_13_4 = arg_13_0.contextData.shipId
	local var_13_5
	local var_13_6

	if var_13_4 then
		var_13_5 = getProxy(BayProxy):getShipById(arg_13_0.contextData.shipId):isMetaShip()
	end

	local var_13_7 = MetaCharacterConst.isMetaTaskSkillID(var_13_0)

	setActive(arg_13_0.metaBtn, var_13_5 and var_13_7)

	if var_13_5 then
		setActive(arg_13_0.upgradeBtn, false)
	end
end

function var_0_0.showInfo(arg_14_0, arg_14_1)
	arg_14_0.isWorld = arg_14_1

	local var_14_0 = arg_14_0.contextData.skillId
	local var_14_1 = arg_14_0.contextData.skillOnShip
	local var_14_2 = var_14_1 and var_14_1.level or 1

	setText(arg_14_0.skillInfoLv, "Lv." .. var_14_2)

	if arg_14_0.contextData.fromNewShip then
		setText(arg_14_0.skillInfoIntro, getSkillDescGet(var_14_0, arg_14_1))
	else
		setText(arg_14_0.skillInfoIntro, getSkillDesc(var_14_0, var_14_2, arg_14_1))
	end
end

function var_0_0.close(arg_15_0)
	arg_15_0:emit(var_0_0.ON_CLOSE)
end

function var_0_0.willExit(arg_16_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_16_0._tf)

	if arg_16_0.contextData.onExit then
		arg_16_0.contextData.onExit()
	end
end

function var_0_0.inOutAnim(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 then
		local var_17_0 = arg_17_0._tf:Find("panel/bg_decorations"):GetComponent(typeof(Animation))

		var_17_0:Stop()
		var_17_0:Play("anim_window_bg")

		local var_17_1 = arg_17_0._tf:Find("panel/top"):GetComponent(typeof(Animation))

		var_17_1:Stop()
		var_17_1:Play("anim_top")

		local var_17_2 = arg_17_0._tf:Find("panel/bg"):GetComponent(typeof(Animation))

		var_17_2:Stop()
		var_17_2:Play("anim_content")

		local var_17_3 = arg_17_0._tf:Find("bg"):GetComponent(typeof(Animation))

		var_17_3:Stop()
		var_17_3:Play("anim_bg_plus")

		local var_17_4 = arg_17_0._tf:Find("panel/buttonList"):GetComponent(typeof(Animation))

		var_17_4:Stop()
		var_17_4:Play("anim_button_container")
	end

	arg_17_2()
end

return var_0_0
