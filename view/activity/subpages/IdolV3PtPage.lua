local var_0_0 = class("IdolV3PtPage", import(".TemplatePage.PtTemplatePage"))
local var_0_1 = {
	"kewei_idol",
	"ougen_idol",
	"nengdai_idol",
	"jingang_idol",
	"lumang_idol",
	"boyixi_idol"
}

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.trainEntranceBtn = arg_1_0.bg:Find("train_btn")
	arg_1_0.skills = arg_1_0.bg:Find("skill")
	arg_1_0.skillBtns = {}

	for iter_1_0 = 0, arg_1_0.skills.childCount - 1 do
		table.insert(arg_1_0.skillBtns, arg_1_0.skills:GetChild(iter_1_0))
	end

	arg_1_0.helpBtn = arg_1_0.bg:Find("help_btn")
	arg_1_0.idol1 = arg_1_0.bg:Find("idol1")
	arg_1_0.buffInfoBox = arg_1_0._tf:Find("BuffInfoBox")
	arg_1_0.mask = arg_1_0.buffInfoBox:Find("mengban")
	arg_1_0.buffWindow = arg_1_0.buffInfoBox:Find("panel")
	arg_1_0.buffName = arg_1_0.buffWindow:Find("title/name")
	arg_1_0.titleLv = arg_1_0.buffWindow:Find("title/lv")
	arg_1_0.titleIcon = arg_1_0.buffWindow:Find("title/icon")
	arg_1_0.buffTip = arg_1_0.buffWindow:Find("content/tip")
	arg_1_0.desc = arg_1_0.buffWindow:Find("content/desc")
	arg_1_0.buffAwardTF = arg_1_0.buffWindow:Find("award_bg/award")
	arg_1_0.trainWindow = arg_1_0._tf:Find("IdolTrainWindow")
	arg_1_0.trainTitle = arg_1_0.trainWindow:Find("panel/title/Text")
	arg_1_0.trainBtn = arg_1_0.trainWindow:Find("panel/train_btn")
	arg_1_0.trainSkills = arg_1_0.trainWindow:Find("panel/skills")
	arg_1_0.trainSkillBtns = {}

	for iter_1_1 = 0, arg_1_0.trainSkills.childCount - 1 do
		table.insert(arg_1_0.trainSkillBtns, arg_1_0.trainSkills:GetChild(iter_1_1))
	end

	arg_1_0.info = arg_1_0.trainWindow:Find("panel/info")
	arg_1_0.curBuff = arg_1_0.info:Find("preview/current")
	arg_1_0.nextBuff = arg_1_0.info:Find("preview/next")
	arg_1_0.msgBox = arg_1_0._tf:Find("MsgBox")
	arg_1_0.msgIcon = arg_1_0.msgBox:Find("panel/title/icon")

	setText(arg_1_0.msgBox:Find("panel/title/Text"), i18n("title_info"))

	arg_1_0.msgContent = arg_1_0.msgBox:Find("panel/content")
	arg_1_0.msgBoxMask = arg_1_0.msgBox:Find("mengban")
	arg_1_0.cancelBtn = arg_1_0.msgBox:Find("panel/cancel_btn")
	arg_1_0.confirmBtn = arg_1_0.msgBox:Find("panel/confirm_btn")
	arg_1_0.tipPanel = arg_1_0._tf:Find("Tip")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	removeOnButton(arg_2_0.getBtn)
	onButton(arg_2_0, arg_2_0.getBtn, function()
		local var_3_0 = {}
		local var_3_1 = arg_2_0.ptData:GetAward()
		local var_3_2 = getProxy(PlayerProxy):getData()

		if var_3_1.type == DROP_TYPE_RESOURCE and var_3_1.id == PlayerConst.ResGold and var_3_2:GoldMax(var_3_1.count) then
			table.insert(var_3_0, function(arg_4_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("gold_max_tip_title") .. i18n("award_max_warning"),
					onYes = arg_4_0
				})
			end)
		end

		seriesAsync(var_3_0, function()
			local var_5_0, var_5_1 = arg_2_0.ptData:GetResProgress()

			arg_2_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 1,
				activity_id = arg_2_0.ptData:GetId(),
				arg1 = var_5_1
			})
			arg_2_0:playIdolAni()
		end)
	end, SFX_PANEL)
	removeOnButton(arg_2_0.battleBtn)
	onButton(arg_2_0, arg_2_0.battleBtn, function()
		local var_6_0
		local var_6_1

		if arg_2_0.activity:getConfig("config_client") ~= "" then
			var_6_0 = arg_2_0.activity:getConfig("config_client").linkActID

			if var_6_0 then
				var_6_1 = getProxy(ActivityProxy):getActivityById(var_6_0)
			end
		end

		if not var_6_0 then
			arg_2_0:emit(ActivityMediator.BATTLE_OPERA)
		elseif var_6_1 and not var_6_1:isEnd() then
			arg_2_0:emit(ActivityMediator.BATTLE_OPERA)
		else
			arg_2_0:showTip(i18n("common_activity_end"))
		end
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.trainEntranceBtn, function()
		arg_2_0:showTrianPanel()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("idol3rd_practice")
		})
	end, SFX_PANEL)
	arg_2_0:hideBuffInfoBox()
	onButton(arg_2_0, arg_2_0.mask, function()
		arg_2_0:hideBuffInfoBox()
	end, SFX_PANEL)

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.skillBtns) do
		onButton(arg_2_0, iter_2_1, function()
			for iter_10_0, iter_10_1 in ipairs(arg_2_0.ptData:GetCurBuffInfos()) do
				if iter_2_0 == iter_10_1.group then
					arg_2_0:showBuffInfoBox(iter_10_1)
				end
			end
		end, SFX_PANEL)
	end

	local var_2_0 = var_0_1[math.random(#var_0_1)]

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetSpineChar(var_2_0, true, function(arg_11_0)
		pg.UIMgr.GetInstance():LoadingOff()

		arg_2_0.prefab1 = var_2_0
		arg_2_0.model1 = arg_11_0
		tf(arg_11_0).localScale = Vector3(1, 1, 1)

		arg_11_0:GetComponent("SpineAnimUI"):SetAction("stand2", 0)
		setParent(arg_11_0, arg_2_0.idol1)
	end)
	setActive(arg_2_0.skills, arg_2_0.ptData:isInBuffTime())
end

function var_0_0.OnUpdateFlush(arg_12_0)
	local var_12_0 = false
	local var_12_1 = arg_12_0.ptData:CanTrain()

	if var_12_1 and var_12_1 <= arg_12_0.ptData.level then
		var_12_0 = true
	end

	local var_12_2, var_12_3, var_12_4 = arg_12_0.ptData:GetLevelProgress()
	local var_12_5, var_12_6, var_12_7 = arg_12_0.ptData:GetResProgress()

	setText(arg_12_0.step, var_12_2 .. "/" .. var_12_3)
	setText(arg_12_0.progress, var_12_5 .. "/" .. var_12_6)
	setSlider(arg_12_0.slider, 0, 1, var_12_7)

	local var_12_8 = arg_12_0.ptData:CanGetAward()
	local var_12_9 = arg_12_0.ptData:CanGetNextAward()
	local var_12_10 = arg_12_0.ptData:CanGetMorePt()
	local var_12_11 = arg_12_0.ptData:CanTrain()

	setActive(arg_12_0.battleBtn, true)
	setActive(arg_12_0.getBtn, var_12_8 and not var_12_0)
	setActive(arg_12_0.trainEntranceBtn, var_12_0)
	setActive(arg_12_0.gotBtn, not var_12_9 and not var_12_11)

	local var_12_12 = arg_12_0.ptData:GetAward()

	updateDrop(arg_12_0.awardTF, var_12_12)
	onButton(arg_12_0, arg_12_0.awardTF, function()
		arg_12_0:emit(BaseUI.ON_DROP, var_12_12)
	end, SFX_PANEL)

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.ptData:GetCurBuffInfos()) do
		setActive(arg_12_0.skillBtns[iter_12_1.group]:Find("lv1"), false)
		setActive(arg_12_0.skillBtns[iter_12_1.group]:Find("lv2"), false)
		setActive(arg_12_0.skillBtns[iter_12_1.group]:Find("lv3"), false)

		if iter_12_1.next then
			setActive(arg_12_0.skillBtns[iter_12_1.group]:Find("lv" .. iter_12_1.lv), true)
		else
			setActive(arg_12_0.skillBtns[iter_12_1.group]:Find("lv3"), true)
		end

		local var_12_13 = pg.benefit_buff_template[iter_12_1.id].icon

		setImageSprite(arg_12_0.skillBtns[iter_12_1.group]:Find("icon"), LoadSprite(var_12_13))
	end
end

function var_0_0.showTrianPanel(arg_14_0)
	setActive(arg_14_0.trainWindow, true)
	setText(arg_14_0.trainTitle, i18n("upgrade_idol_tip"))

	local var_14_0 = arg_14_0.ptData:GetCurBuffInfos()

	arg_14_0.selectIndex = nil
	arg_14_0.selectBuffId = nil
	arg_14_0.selectBuffLv = nil
	arg_14_0.selectNewBuffId = nil

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.trainSkillBtns) do
		onButton(arg_14_0, iter_14_1, function()
			for iter_15_0, iter_15_1 in ipairs(var_14_0) do
				if iter_14_0 == iter_15_1.group and iter_15_1.next then
					arg_14_0.selectIndex = iter_14_0
					arg_14_0.selectBuffId = iter_15_1.id
					arg_14_0.selectNewBuffId = iter_15_1.next
					arg_14_0.selectBuffLv = iter_15_1.lv
				end
			end

			arg_14_0:flushTrainPanel()
		end, SFX_PANEL)
	end

	onButton(arg_14_0, arg_14_0.trainBtn, function()
		arg_14_0:showMsgBox()
	end, SFX_PANEL)

	local var_14_1 = underscore.detect(var_14_0, function(arg_17_0)
		return arg_17_0.next
	end)

	if var_14_1 then
		triggerButton(arg_14_0.trainSkillBtns[var_14_1.group])
	end
end

function var_0_0.hideTrianPanel(arg_18_0)
	setActive(arg_18_0.trainWindow, false)
end

function var_0_0.flushTrainPanel(arg_19_0)
	local var_19_0 = arg_19_0.ptData:GetCurBuffInfos()

	if var_19_0 then
		for iter_19_0, iter_19_1 in ipairs(var_19_0) do
			setActive(arg_19_0.trainSkillBtns[iter_19_1.group]:Find("lv1"), false)
			setActive(arg_19_0.trainSkillBtns[iter_19_1.group]:Find("lv2"), false)
			setActive(arg_19_0.trainSkillBtns[iter_19_1.group]:Find("lv3"), false)

			if iter_19_1.next then
				setActive(arg_19_0.trainSkillBtns[iter_19_1.group]:Find("lv" .. iter_19_1.lv), true)
			else
				setActive(arg_19_0.trainSkillBtns[iter_19_1.group]:Find("lv3"), true)
			end

			local var_19_1 = pg.benefit_buff_template[iter_19_1.id].icon

			setImageSprite(arg_19_0.trainSkillBtns[iter_19_1.group]:Find("icon"), LoadSprite(var_19_1))
			setText(arg_19_0.trainSkillBtns[iter_19_1.group]:Find("name"), shortenString(pg.benefit_buff_template[iter_19_1.id].name, 7))
		end
	end

	for iter_19_2, iter_19_3 in ipairs(arg_19_0.trainSkillBtns) do
		if iter_19_2 == arg_19_0.selectIndex then
			setActive(iter_19_3:Find("selected"), true)
			setActive(iter_19_3:Find("name"), true)
		else
			setActive(iter_19_3:Find("selected"), false)
			setActive(iter_19_3:Find("name"), false)
		end
	end

	if arg_19_0.selectIndex then
		setActive(arg_19_0.info, true)
		setActive(arg_19_0.trainBtn, true)
		setText(arg_19_0.curBuff, "Lv." .. arg_19_0.selectBuffLv .. pg.benefit_buff_template[arg_19_0.selectBuffId].desc)
		setText(arg_19_0.nextBuff, "Lv." .. arg_19_0.selectBuffLv + 1 .. pg.benefit_buff_template[arg_19_0.selectNewBuffId].desc)
	else
		setActive(arg_19_0.info, false)
		setActive(arg_19_0.trainBtn, false)
	end
end

function var_0_0.showBuffInfoBox(arg_20_0, arg_20_1)
	local var_20_0 = pg.benefit_buff_template[arg_20_1.id].name

	setText(arg_20_0.buffName, var_20_0)
	setText(arg_20_0.desc, pg.benefit_buff_template[arg_20_1.id].desc)
	setText(arg_20_0.buffTip, i18n("upgrade_introduce_tip", var_20_0))

	local var_20_1 = pg.benefit_buff_template[arg_20_1.id].icon

	setImageSprite(arg_20_0.titleIcon, LoadSprite(var_20_1))

	local var_20_2 = arg_20_1.award

	updateDrop(arg_20_0.buffAwardTF, var_20_2)
	onButton(arg_20_0, arg_20_0.buffAwardTF, function()
		arg_20_0:emit(BaseUI.ON_DROP, var_20_2)
	end, SFX_PANEL)

	if arg_20_1.next then
		setText(arg_20_0.titleLv, "Lv." .. arg_20_1.lv)
		setActive(arg_20_0.buffAwardTF:Find("icon_bg/got_mask"), false)
	else
		setText(arg_20_0.titleLv, "MAX")
		setActive(arg_20_0.buffAwardTF:Find("icon_bg/got_mask"), true)
		removeOnButton(arg_20_0.buffAwardTF)
	end

	setActive(arg_20_0.buffInfoBox, true)
end

function var_0_0.hideBuffInfoBox(arg_22_0)
	setActive(arg_22_0.buffInfoBox, false)
end

function var_0_0.OnDestroy(arg_23_0)
	if arg_23_0.prefab1 and arg_23_0.model1 then
		PoolMgr.GetInstance():ReturnSpineChar(arg_23_0.prefab1, arg_23_0.model1)

		arg_23_0.prefab1 = nil
		arg_23_0.model1 = nil
	end
end

function var_0_0.playIdolAni(arg_24_0)
	if arg_24_0.model1 then
		arg_24_0.model1:GetComponent("SpineAnimUI"):SetAction("idol", 0)
	end
end

function var_0_0.showMsgBox(arg_25_0)
	if arg_25_0.selectBuffId then
		setActive(arg_25_0.msgBox, true)

		local var_25_0 = pg.benefit_buff_template[arg_25_0.selectBuffId].icon

		setImageSprite(arg_25_0.msgIcon, LoadSprite(var_25_0))

		local var_25_1 = pg.benefit_buff_template[arg_25_0.selectBuffId].name

		setText(arg_25_0.msgContent, i18n("practise_idol_tip", var_25_1))
		onButton(arg_25_0, arg_25_0.msgBoxMask, function()
			arg_25_0:hideMsgBox()
		end, SFX_PANEL)
		onButton(arg_25_0, arg_25_0.cancelBtn, function()
			arg_25_0:hideMsgBox()
		end, SFX_PANEL)
		onButton(arg_25_0, arg_25_0.confirmBtn, function()
			arg_25_0:hideMsgBox()
			arg_25_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 3,
				activity_id = arg_25_0.ptData:GetId(),
				arg1 = arg_25_0.ptData:CanTrain(),
				arg2 = arg_25_0.selectNewBuffId,
				oldBuffId = arg_25_0.selectBuffId,
				callback = function()
					arg_25_0:hideTrianPanel()
					arg_25_0:showTip(i18n("upgrade_complete_tip"))
				end
			})
		end, SFX_PANEL)
	end
end

function var_0_0.hideMsgBox(arg_30_0)
	setActive(arg_30_0.msgBox, false)
end

function var_0_0.showTip(arg_31_0, arg_31_1)
	local var_31_0 = cloneTplTo(arg_31_0.tipPanel, arg_31_0._tf)

	setActive(var_31_0, true)
	setText(var_31_0:Find("Text"), arg_31_1)

	var_31_0.transform.localScale = Vector3(0, 0.1, 1)

	LeanTween.scale(var_31_0, Vector3(1.8, 0.1, 1), 0.1):setUseEstimatedTime(true)
	LeanTween.scale(var_31_0, Vector3(1.1, 1.1, 1), 0.1):setDelay(0.1):setUseEstimatedTime(true)

	local var_31_1 = GetOrAddComponent(var_31_0, "CanvasGroup")

	Timer.New(function()
		if IsNil(var_31_0) then
			return
		end

		LeanTween.scale(var_31_0, Vector3(0.1, 1.5, 1), 0.1):setUseEstimatedTime(true):setOnComplete(System.Action(function()
			LeanTween.scale(var_31_0, Vector3.zero, 0.1):setUseEstimatedTime(true):setOnComplete(System.Action(function()
				Destroy(var_31_0)
			end))
		end))
	end, 3):Start()
end

return var_0_0
