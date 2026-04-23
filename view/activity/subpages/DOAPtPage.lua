local var_0_0 = class("DOAPtPage", import(".TemplatePage.PtTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.buffModule = arg_1_0.bg:Find("buff_module")
	arg_1_0.buffPanel = arg_1_0.buffModule:Find("skill")
	arg_1_0.buffLvs = {}

	eachChild(arg_1_0.buffPanel, function(arg_2_0)
		table.insert(arg_1_0.buffLvs, arg_2_0)
	end)

	arg_1_0.getGreyBtn = arg_1_0.bg:Find("get_grey_btn")
	arg_1_0.helpBtn = arg_1_0.bg:Find("help_btn")
	arg_1_0.levelPanel = arg_1_0.buffModule:Find("level")
	arg_1_0.f2aPanel = arg_1_0.levelPanel:Find("f_to_a")
	arg_1_0.sPanel = arg_1_0.levelPanel:Find("s_ss")
	arg_1_0.sssPanel = arg_1_0.levelPanel:Find("sss")
	arg_1_0.lvBarImages = arg_1_0.bg:Find("lv_bars")
	arg_1_0.lvTagImages = arg_1_0.bg:Find("lv_tags")
	arg_1_0.shieldEffect = arg_1_0.buffModule:Find("level/shield_effect")
	arg_1_0.starEffect = arg_1_0.buffModule:Find("level/star_effect")
	arg_1_0.mask = arg_1_0.bg:Find("mask")
	arg_1_0.trainWindow = arg_1_0._tf:Find("TrainWindow")
	arg_1_0.trainBtn = arg_1_0.trainWindow:Find("panel/train_btn")
	arg_1_0.trainSkills = arg_1_0.trainWindow:Find("panel/skills")
	arg_1_0.trainSkillBtns = {
		arg_1_0.trainSkills:Find("pow_btn"),
		arg_1_0.trainSkills:Find("tec_btn"),
		arg_1_0.trainSkills:Find("stm_btn"),
		arg_1_0.trainSkills:Find("apl_btn")
	}
	arg_1_0.curInfoPanel = arg_1_0.trainWindow:Find("panel/info_bg")
	arg_1_0.curInfo = arg_1_0.trainWindow:Find("panel/info_bg/cur")
	arg_1_0.nextInfo = arg_1_0.trainWindow:Find("panel/info_bg/next")
	arg_1_0.msgBox = arg_1_0._tf:Find("MsgBox")
	arg_1_0.msgContent = arg_1_0.msgBox:Find("panel/content")
	arg_1_0.msgBoxMask = arg_1_0.msgBox:Find("mengban")
	arg_1_0.cancelBtn = arg_1_0.msgBox:Find("panel/cancel_btn")
	arg_1_0.confirmBtn = arg_1_0.msgBox:Find("panel/confirm_btn")
	arg_1_0.tipPanel = arg_1_0._tf:Find("Tip")
	arg_1_0.buffBox = arg_1_0._tf:Find("BuffBox")
	arg_1_0.buffMask = arg_1_0.buffBox:Find("mask")
	arg_1_0.buffIconParent = arg_1_0.buffBox:Find("window/panel/icon")
	arg_1_0.buffDescContent = arg_1_0.buffBox:Find("window/panel/intro_view/Viewport/Content")
	arg_1_0.buffDescTpl = arg_1_0.buffBox:Find("window/panel/intro_view/buff_desc_tpl")
	arg_1_0.singleBuffBox = arg_1_0._tf:Find("SingleBuffBox")
	arg_1_0.singleBuffMask = arg_1_0.singleBuffBox:Find("bg")
	arg_1_0.singleSureBtn = arg_1_0.singleBuffBox:Find("window/top/btnBack")
	arg_1_0.singleCloseBtn = arg_1_0.singleBuffBox:Find("window/sure_btn")
	arg_1_0.singleIconParent = arg_1_0.singleBuffBox:Find("window/panel/icon")
	arg_1_0.singleDescContent = arg_1_0.singleBuffBox:Find("window/panel/intro_view/Viewport/Content")
	arg_1_0.singleDescTpl = arg_1_0.singleBuffBox:Find("window/panel/intro_view/buff_desc_tpl")

	setText(arg_1_0.singleBuffBox:Find("window/top/bg/infomation/title"), i18n("words_information"))
	setText(arg_1_0.singleBuffBox:Find("window/sure_btn/pic"), i18n("text_confirm"))
end

function var_0_0.OnFirstFlush(arg_3_0)
	var_0_0.super.OnFirstFlush(arg_3_0)
	setActive(arg_3_0.bg, true)
	removeOnButton(arg_3_0.getBtn)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		local var_4_0 = {}
		local var_4_1 = arg_3_0.ptData:GetAward()
		local var_4_2 = getProxy(PlayerProxy):getData()

		if var_4_1.type == DROP_TYPE_RESOURCE and var_4_1.id == PlayerConst.ResGold and var_4_2:GoldMax(var_4_1.count) then
			table.insert(var_4_0, function(arg_5_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("gold_max_tip_title") .. i18n("award_max_warning"),
					onYes = arg_5_0
				})
			end)
		end

		seriesAsync(var_4_0, function()
			arg_3_0.isShowEffect = true

			local var_6_0 = arg_3_0.ptData:CanTrain() and arg_3_0.ptData:isInBuffTime()

			local function var_6_1()
				if var_6_0 then
					arg_3_0:showUpEffect()
				else
					arg_3_0:updateLevelPanel()
				end
			end

			local var_6_2, var_6_3 = arg_3_0.ptData:GetResProgress()

			arg_3_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 1,
				activity_id = arg_3_0.ptData:GetId(),
				arg1 = var_6_3,
				callback = var_6_1
			})
		end)
	end, SFX_PANEL)
	removeOnButton(arg_3_0.battleBtn)
	onButton(arg_3_0, arg_3_0.battleBtn, function()
		local var_8_0
		local var_8_1
		local var_8_2 = arg_3_0.activity:getConfig("config_client")

		if var_8_2 ~= "" then
			var_8_0 = arg_3_0.activity:getConfig("config_client").linkActID

			if var_8_0 then
				var_8_1 = getProxy(ActivityProxy):getActivityById(var_8_0)
			end
		end

		local var_8_3 = var_8_2.fightLinkActID

		if var_8_3 then
			arg_3_0:emit(ActivityMediator.SKIP_ACTIVITY_MAP, var_8_3)

			return
		end

		if not var_8_0 then
			arg_3_0:emit(ActivityMediator.BATTLE_OPERA)
		elseif var_8_1 and not var_8_1:isEnd() then
			arg_3_0:emit(ActivityMediator.BATTLE_OPERA)
		else
			arg_3_0:showTip(i18n("common_activity_end"))
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("doa_pt_help")
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.buffModule, function()
		arg_3_0:showBuffBox()
	end, SFX_PANEL)

	if arg_3_0.contextData.singleActivity then
		setActive(arg_3_0.bg, false)
		arg_3_0:showSingleBuffBox()
	end

	arg_3_0.starEffect:GetComponent("DftAniEvent"):SetEndEvent(function()
		arg_3_0:updateLevelPanel()
		arg_3_0:managedTween(LeanTween.delayedCall, function()
			arg_3_0:showTrianPanel()
			setActive(arg_3_0.starEffect, false)
			setActive(arg_3_0.mask, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_3_0.mask, arg_3_0.bg)
		end, 0.2, nil)
	end)
	arg_3_0.shieldEffect:GetComponent("DftAniEvent"):SetEndEvent(function()
		arg_3_0:updateLevelPanel()
		arg_3_0:managedTween(LeanTween.delayedCall, function()
			arg_3_0:showTrianPanel()
			setActive(arg_3_0.starEffect, false)
			setActive(arg_3_0.mask, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_3_0.mask, arg_3_0.bg)
		end, 0.2, nil)
	end)

	arg_3_0.isShowEffect = false
end

function var_0_0.showUpEffect(arg_15_0, arg_15_1)
	setSlider(arg_15_0.curPanel, 0, 1, 1)

	local var_15_0 = arg_15_0.ptData:GetBuffLevelProgress()

	if var_15_0 == 8 or var_15_0 == 9 then
		setActive(arg_15_0.starEffect, true)
		arg_15_0.starEffect:GetComponent("Animator"):Play("saoguang_anim", -1, 0)
	else
		setActive(arg_15_0.shieldEffect, true)
		arg_15_0.shieldEffect:GetComponent("Animator"):Play("saoguang_anim", -1, 0)
	end

	setActive(arg_15_0.mask, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_15_0.mask)
end

function var_0_0.updateLevelPanel(arg_16_0)
	local var_16_0, var_16_1 = arg_16_0.ptData:GetBuffLevelProgress()

	setActive(arg_16_0.f2aPanel, false)
	setActive(arg_16_0.sPanel, false)
	setActive(arg_16_0.sssPanel, false)

	arg_16_0.curPanel = nil

	if var_16_0 == 9 then
		arg_16_0.curPanel = arg_16_0.sssPanel
	elseif var_16_0 > 6 then
		arg_16_0.curPanel = arg_16_0.sPanel
	else
		arg_16_0.curPanel = arg_16_0.f2aPanel
	end

	setActive(arg_16_0.curPanel, true)
	setImageSprite(arg_16_0.curPanel:Find("bar"), arg_16_0.lvBarImages:Find(var_16_0):GetComponent(typeof(Image)).sprite)
	setImageSprite(arg_16_0.curPanel:Find("lv_tag"), arg_16_0.lvTagImages:Find(var_16_0):GetComponent(typeof(Image)).sprite, true)
	setSlider(arg_16_0.curPanel, 0, 1, var_16_1)

	return arg_16_0.curPanel
end

function var_0_0.OnUpdateFlush(arg_17_0)
	setActive(arg_17_0.starEffect, false)
	setActive(arg_17_0.shieldEffect, false)

	local var_17_0 = arg_17_0.ptData:CanTrain()

	if var_17_0 and var_17_0 <= arg_17_0.ptData.level and arg_17_0.ptData:isInBuffTime() and not arg_17_0.contextData.singleActivity and not arg_17_0.isShowEffect then
		arg_17_0:showTrianPanel()
	end

	local var_17_1, var_17_2, var_17_3 = arg_17_0.ptData:GetLevelProgress()
	local var_17_4, var_17_5, var_17_6 = arg_17_0.ptData:GetResProgress()

	setText(arg_17_0.step, var_17_1 .. "/" .. var_17_2)
	setText(arg_17_0.progress, (var_17_6 >= 1 and setColorStr(var_17_4, COLOR_GREEN) or var_17_4) .. "/" .. var_17_5)
	setSlider(arg_17_0.slider, 0, 1, var_17_6)

	if not arg_17_0.isShowEffect then
		arg_17_0:updateLevelPanel()
	end

	local var_17_7 = arg_17_0.ptData:CanGetAward()
	local var_17_8 = arg_17_0.ptData:CanGetNextAward()
	local var_17_9 = arg_17_0.ptData:CanGetMorePt()
	local var_17_10 = arg_17_0.ptData:CanTrain()

	setActive(arg_17_0.battleBtn, var_17_9 and not var_17_7 and var_17_8)
	setActive(arg_17_0.getBtn, var_17_7)
	setActive(arg_17_0.getGreyBtn, not var_17_7)
	setActive(arg_17_0.gotBtn, not var_17_8 and not var_17_10)
	setActive(arg_17_0.buffModule, arg_17_0.ptData:isInBuffTime())

	local var_17_11 = arg_17_0.ptData:GetAward()

	updateDrop(arg_17_0.awardTF, var_17_11)
	onButton(arg_17_0, arg_17_0.awardTF, function()
		arg_17_0:emit(BaseUI.ON_DROP, var_17_11)
	end, SFX_PANEL)

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.ptData:GetCurBuffInfos()) do
		setText(arg_17_0.buffLvs[iter_17_1.group], iter_17_1.next and "LV." .. iter_17_1.lv or "MAX")
	end
end

function var_0_0.showTrianPanel(arg_19_0)
	setActive(arg_19_0.trainWindow, true)

	local var_19_0 = arg_19_0.ptData:GetCurBuffInfos()

	arg_19_0.selectIndex = nil
	arg_19_0.selectBuffId = nil
	arg_19_0.selectBuffLv = nil
	arg_19_0.selectNewBuffId = nil

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.trainSkillBtns) do
		onButton(arg_19_0, iter_19_1, function()
			for iter_20_0, iter_20_1 in ipairs(var_19_0) do
				if iter_19_0 == iter_20_1.group then
					if iter_20_1.next then
						arg_19_0.selectIndex = iter_19_0
						arg_19_0.selectBuffId = iter_20_1.id
						arg_19_0.selectNewBuffId = iter_20_1.next
						arg_19_0.selectBuffLv = iter_20_1.lv
					else
						arg_19_0.selectIndex = nil
						arg_19_0.selectBuffId = nil
						arg_19_0.selectNewBuffId = nil
						arg_19_0.selectBuffLv = nil
					end
				end
			end

			arg_19_0:flushTrainPanel()
		end, SFX_PANEL)
	end

	onButton(arg_19_0, arg_19_0.trainBtn, function()
		arg_19_0:showMsgBox()
	end, SFX_PANEL)
	;(function()
		for iter_22_0, iter_22_1 in ipairs(var_19_0) do
			if iter_22_1.next then
				arg_19_0.selectIndex = iter_22_1.group
				arg_19_0.selectBuffId = iter_22_1.id
				arg_19_0.selectNewBuffId = iter_22_1.next
				arg_19_0.selectBuffLv = iter_22_1.lv

				return
			end
		end
	end)()
	arg_19_0:flushTrainPanel()
end

function var_0_0.hideTrianPanel(arg_23_0)
	setActive(arg_23_0.trainWindow, false)
end

function var_0_0.flushTrainPanel(arg_24_0)
	local var_24_0 = arg_24_0.ptData:GetCurBuffInfos()

	if var_24_0 then
		for iter_24_0, iter_24_1 in ipairs(var_24_0) do
			setText(arg_24_0.trainSkillBtns[iter_24_1.group]:Find("lv_bg/lv"), iter_24_1.next and "LV." .. iter_24_1.lv or "MAX")
		end
	end

	for iter_24_2, iter_24_3 in ipairs(arg_24_0.trainSkillBtns) do
		if iter_24_2 == arg_24_0.selectIndex then
			setActive(iter_24_3:Find("selected"), true)
		else
			setActive(iter_24_3:Find("selected"), false)
		end
	end

	if arg_24_0.selectIndex then
		setActive(arg_24_0.curInfoPanel, true)
		setActive(arg_24_0.trainBtn, true)
		setText(arg_24_0.curInfo, pg.benefit_buff_template[arg_24_0.selectBuffId].desc)
		setText(arg_24_0.nextInfo, pg.benefit_buff_template[arg_24_0.selectNewBuffId].desc)
	else
		setActive(arg_24_0.curInfoPanel, false)
		setActive(arg_24_0.trainBtn, false)
	end
end

function var_0_0.getBuffNameIndex(arg_25_0, arg_25_1)
	if arg_25_1 == 35 or arg_25_1 == 36 or arg_25_1 == 37 then
		return 1
	elseif arg_25_1 == 38 or arg_25_1 == 39 or arg_25_1 == 40 then
		return 2
	elseif arg_25_1 == 41 or arg_25_1 == 42 or arg_25_1 == 43 then
		return 3
	elseif arg_25_1 == 44 or arg_25_1 == 45 or arg_25_1 == 46 then
		return 4
	end

	return 1
end

function var_0_0.getTip(arg_26_0, arg_26_1)
	if arg_26_1 == 35 or arg_26_1 == 36 or arg_26_1 == 37 then
		return i18n("doa_liliang")
	elseif arg_26_1 == 38 or arg_26_1 == 39 or arg_26_1 == 40 then
		return i18n("doa_jiqiao")
	elseif arg_26_1 == 41 or arg_26_1 == 42 or arg_26_1 == 43 then
		return i18n("doa_tili")
	elseif arg_26_1 == 44 or arg_26_1 == 45 or arg_26_1 == 46 then
		return i18n("doa_meili")
	end

	return ""
end

function var_0_0.showMsgBox(arg_27_0)
	if arg_27_0.selectBuffId then
		setActive(arg_27_0.msgBox, true)
		setText(arg_27_0.msgContent, i18n("doa_pt_up", arg_27_0:getTip(pg.benefit_buff_template[arg_27_0.selectBuffId].id)))
		onButton(arg_27_0, arg_27_0.msgBoxMask, function()
			arg_27_0:hideMsgBox()
		end, SFX_PANEL)
		onButton(arg_27_0, arg_27_0.cancelBtn, function()
			arg_27_0:hideMsgBox()
		end, SFX_PANEL)
		onButton(arg_27_0, arg_27_0.confirmBtn, function()
			arg_27_0:hideMsgBox()
			arg_27_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 3,
				activity_id = arg_27_0.ptData:GetId(),
				arg1 = arg_27_0.ptData:CanTrain(),
				arg2 = arg_27_0.selectNewBuffId,
				oldBuffId = arg_27_0.selectBuffId
			})
			arg_27_0:hideTrianPanel()
			arg_27_0:showTip(i18n("doa_pt_complete"))
		end, SFX_PANEL)
	end
end

function var_0_0.hideMsgBox(arg_31_0)
	setActive(arg_31_0.msgBox, false)
end

function var_0_0.showTip(arg_32_0, arg_32_1)
	local var_32_0 = cloneTplTo(arg_32_0.tipPanel, arg_32_0._tf)

	setActive(var_32_0, true)
	setText(var_32_0:Find("Text"), arg_32_1)

	var_32_0.transform.localScale = Vector3(0, 0.1, 1)

	LeanTween.scale(var_32_0, Vector3(1.8, 0.1, 1), 0.1):setUseEstimatedTime(true)
	LeanTween.scale(var_32_0, Vector3(1.1, 1.1, 1), 0.1):setDelay(0.1):setUseEstimatedTime(true)

	local var_32_1 = GetOrAddComponent(var_32_0, "CanvasGroup")

	Timer.New(function()
		if IsNil(var_32_0) then
			return
		end

		LeanTween.scale(var_32_0, Vector3(0.1, 1.5, 1), 0.1):setUseEstimatedTime(true):setOnComplete(System.Action(function()
			LeanTween.scale(var_32_0, Vector3.zero, 0.1):setUseEstimatedTime(true):setOnComplete(System.Action(function()
				Destroy(var_32_0)
			end))
		end))
	end, 3):Start()
end

function var_0_0.showBuffBox(arg_36_0)
	setActive(arg_36_0.buffBox, true)
	removeAllChildren(arg_36_0.buffIconParent)

	local var_36_0 = cloneTplTo(arg_36_0:updateLevelPanel(), arg_36_0.buffIconParent)

	setLocalPosition(var_36_0, Vector3(0, 0, 0))
	setLocalScale(var_36_0, Vector3(1.3, 1.3, 1))

	local var_36_1 = arg_36_0.ptData:GetCurBuffInfos()

	if var_36_1 then
		for iter_36_0, iter_36_1 in ipairs(var_36_1) do
			local var_36_2

			if iter_36_0 <= arg_36_0.buffDescContent.childCount then
				var_36_2 = arg_36_0.buffDescContent:GetChild(iter_36_0 - 1)
			else
				var_36_2 = cloneTplTo(arg_36_0.buffDescTpl, arg_36_0.buffDescContent)
			end

			setText(var_36_2, pg.benefit_buff_template[iter_36_1.id].name .. pg.benefit_buff_template[iter_36_1.id].desc)
		end
	end

	onButton(arg_36_0, arg_36_0.buffMask, function()
		setActive(arg_36_0.buffBox, false)
	end, SFX_PANEL)
end

function var_0_0.showSingleBuffBox(arg_38_0)
	setActive(arg_38_0.singleBuffBox, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_38_0.singleBuffBox)
	removeAllChildren(arg_38_0.singleIconParent)

	local var_38_0 = cloneTplTo(arg_38_0:updateLevelPanel(), arg_38_0.singleIconParent)

	setLocalPosition(var_38_0, Vector3(0, 0, 0))
	setLocalScale(var_38_0, Vector3(1.3, 1.3, 1))

	local var_38_1 = arg_38_0.ptData:GetCurBuffInfos()

	if var_38_1 then
		for iter_38_0, iter_38_1 in ipairs(var_38_1) do
			local var_38_2

			if iter_38_0 <= arg_38_0.singleDescContent.childCount then
				var_38_2 = arg_38_0.singleDescContent:GetChild(iter_38_0 - 1)
			else
				var_38_2 = cloneTplTo(arg_38_0.singleDescTpl, arg_38_0.singleDescContent)
			end

			setText(var_38_2, pg.benefit_buff_template[iter_38_1.id].name .. pg.benefit_buff_template[iter_38_1.id].desc)
		end
	end

	local function var_38_3()
		setActive(arg_38_0.singleBuffBox, false)
		arg_38_0:emit(ActivitySingleScene.EXIT)
		arg_38_0:emit(ActivitySingleScene.ON_CLOSE)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_38_0.singleBuffBox, arg_38_0._tf)
	end

	onButton(arg_38_0, arg_38_0.singleBuffMask, function()
		var_38_3()
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.singleCloseBtn, function()
		var_38_3()
	end, SFX_PANEL)
	onButton(arg_38_0, arg_38_0.singleSureBtn, function()
		var_38_3()
	end, SFX_PANEL)
end

function var_0_0.onBackPressed(arg_43_0)
	if arg_43_0.contextData.singleActivity then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_43_0.singleBuffBox, arg_43_0._tf)
	end
end

function var_0_0.willExit(arg_44_0)
	if arg_44_0.contextData.singleActivity then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_44_0.singleBuffBox, arg_44_0._tf)
	end
end

return var_0_0
