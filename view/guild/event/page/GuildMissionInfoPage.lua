local var_0_0 = class("GuildMissionInfoPage", import(".GuildEventBasePage"))
local var_0_1 = 10001

function var_0_0.AttrCnt2Desc(arg_1_0, arg_1_1)
	local var_1_0 = pg.attribute_info_by_type[arg_1_0]
	local var_1_1 = arg_1_1.value >= arg_1_1.goal and COLOR_GREEN or COLOR_RED

	return i18n("guild_event_info_desc1", var_1_0.condition, arg_1_1.total, var_1_1, arg_1_1.value, arg_1_1.goal)
end

function var_0_0.AttrAcc2Desc(arg_2_0, arg_2_1)
	local var_2_0 = pg.attribute_info_by_type[arg_2_0]

	assert(var_2_0, arg_2_0)

	local var_2_1

	if arg_2_1.op == 1 then
		var_2_1 = arg_2_1.value >= arg_2_1.goal and COLOR_GREEN or COLOR_RED
	elseif arg_2_1.op == 2 then
		var_2_1 = arg_2_1.value <= arg_2_1.goal and COLOR_GREEN or COLOR_RED
	end

	assert(var_2_1)

	return i18n("guild_event_info_desc2", var_2_0.condition, var_2_1, arg_2_1.value, arg_2_1.goal)
end

function var_0_0.getUIName(arg_3_0)
	return "GuildMissionInfoPage"
end

function var_0_0.OnLoaded(arg_4_0)
	arg_4_0.closeBtn = arg_4_0:findTF("top/close")
	arg_4_0.sea = arg_4_0:findTF("bg/sea"):GetComponent(typeof(RawImage))
	arg_4_0.titleTxt = arg_4_0:findTF("top/title/Text"):GetComponent(typeof(Text))
	arg_4_0.logBtn = arg_4_0:findTF("bottom/log_btn")
	arg_4_0.formationBtn = arg_4_0:findTF("bottom/formationBtn")
	arg_4_0.doingBtn = arg_4_0:findTF("bottom/doing_btn")
	arg_4_0.helpBtn = arg_4_0:findTF("bottom/help")
	arg_4_0.logPanel = arg_4_0:findTF("log_panel")
	arg_4_0.logList = UIItemList.New(arg_4_0.logPanel:Find("scrollrect/content"), arg_4_0.logPanel:Find("scrollrect/content/tpl"))
	arg_4_0.peopleCnt = arg_4_0:findTF("bottom/cnt/Text"):GetComponent(typeof(Text))
	arg_4_0.effectCnt = arg_4_0:findTF("bottom/effect/Text"):GetComponent(typeof(Text))

	setText(arg_4_0:findTF("bottom/cnt"), i18n("guild_join_member_cnt"))
	setText(arg_4_0:findTF("bottom/effect"), i18n("guild_total_effect"))

	arg_4_0.areaTxt = arg_4_0:findTF("top/title/Text/target/area"):GetComponent(typeof(Text))
	arg_4_0.goalTxt = arg_4_0:findTF("top/title/Text/target/goal"):GetComponent(typeof(Text))
	arg_4_0.timeTxt = arg_4_0:findTF("bottom/progress/time/Text"):GetComponent(typeof(Text))
	arg_4_0.nodesUIlist = UIItemList.New(arg_4_0:findTF("bottom/progress/nodes"), arg_4_0:findTF("bottom/progress/nodes/tpl"))
	arg_4_0.progress = arg_4_0:findTF("bottom/progress")
	arg_4_0.nodeLength = arg_4_0.progress.rect.width
	arg_4_0.healTF = arg_4_0:findTF("resources/heal")
	arg_4_0.nameTF = arg_4_0:findTF("resources/name")
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.closeBtn, function()
		arg_5_0.contextData.mission = nil

		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.guild_mission_info_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.logBtn, function()
		if arg_5_0.isShowLogPanel then
			arg_5_0:ShowOrHideLogPanel(false)
		else
			arg_5_0:ShowOrHideLogPanel(true)
		end
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.logPanel, function()
		arg_5_0:ShowOrHideLogPanel(false)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.formationBtn, function()
		if arg_5_0.mission:IsFinish() then
			pg.TipsMgr:GetInstance():ShowTips(i18n("guild_event_is_finish"))

			return
		end

		arg_5_0:emit(GuildEventLayer.OPEN_MISSION_FORAMTION, arg_5_0.mission)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.doingBtn, function()
		triggerButton(arg_5_0.formationBtn)
	end, SFX_PANEL)
end

function var_0_0.OnRefreshMission(arg_12_0, arg_12_1)
	arg_12_0:Flush(arg_12_1)
end

function var_0_0.OnShow(arg_13_0)
	local var_13_0 = arg_13_0.extraData.mission

	arg_13_0:Flush(var_13_0)
	arg_13_0:EnterFormation()
	arg_13_0:AddOtherShipMoveTimer()
end

function var_0_0.Flush(arg_14_0, arg_14_1)
	arg_14_0.mission = arg_14_1

	arg_14_0:InitBattleSea()
	arg_14_0:InitView()
	arg_14_0:AddRefreshProgressTimer()
end

function var_0_0.EnterFormation(arg_15_0)
	if arg_15_0.contextData.missionShips then
		triggerButton(arg_15_0.formationBtn)
	end
end

function var_0_0.InitView(arg_16_0)
	local var_16_0 = arg_16_0.mission
	local var_16_1 = arg_16_0.guild

	arg_16_0.titleTxt.text = var_16_0:GetName()
	arg_16_0.peopleCnt.text = var_16_0:GetJoinMemberCnt() .. "/" .. var_16_1.memberCount .. i18n("guild_word_people")
	arg_16_0.effectCnt.text = var_16_0:GetEfficiency() .. "(" .. var_16_0:GetMyEffect() .. ")"

	local var_16_2 = var_16_0:GetNations()
	local var_16_3 = _.map(var_16_2, function(arg_17_0)
		local var_17_0 = var_16_0:GetShipsByNation(arg_17_0)
		local var_17_1 = Nation.Nation2Name(arg_17_0)

		return i18n("guild_event_info_desc3", var_17_1, #var_17_0)
	end)

	arg_16_0.areaTxt.text = i18n("guild_word_battle_area") .. table.concat(var_16_3, " 、")

	local var_16_4 = var_0_0.GetBattleTarget(var_16_0)
	local var_16_5 = table.concat(var_16_4, " 、")

	if var_16_5 ~= "" then
		arg_16_0.goalTxt.text = i18n("guild_wrod_battle_target") .. var_16_5
	end

	setActive(arg_16_0.goalTxt.gameObject, var_16_5 ~= "")
	arg_16_0:UpdateNodes()
	arg_16_0:UpdateFormationBtn()
end

function var_0_0.UpdateFormationBtn(arg_18_0)
	local var_18_0 = arg_18_0.mission:CanFormation()

	setActive(arg_18_0.formationBtn, var_18_0)
	setActive(arg_18_0.doingBtn, not var_18_0)
end

function var_0_0.GetBattleTarget(arg_19_0)
	local var_19_0 = arg_19_0:GetAttrCntAcc()
	local var_19_1 = arg_19_0:GetAttrAcc()
	local var_19_2 = {}

	for iter_19_0, iter_19_1 in pairs(var_19_0) do
		table.insert(var_19_2, var_0_0.AttrCnt2Desc(iter_19_0, iter_19_1))
	end

	for iter_19_2, iter_19_3 in pairs(var_19_1) do
		table.insert(var_19_2, var_0_0.AttrAcc2Desc(iter_19_2, iter_19_3))
	end

	return var_19_2
end

function var_0_0.UpdateNodes(arg_20_0)
	arg_20_0.nodes = {}

	local var_20_0 = arg_20_0.mission
	local var_20_1 = var_20_0:GetNodes()
	local var_20_2 = 1

	if not var_20_0:IsFinish() then
		arg_20_0.nodesUIlist:make(function(arg_21_0, arg_21_1, arg_21_2)
			if arg_21_0 == UIItemList.EventUpdate then
				local var_21_0 = var_20_1[arg_21_1 + 1]
				local var_21_1 = var_21_0:GetPosition()
				local var_21_2 = arg_20_0.nodeLength * (var_21_1 / 100)

				arg_21_2:GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/GuildMissionInfoUI_atlas", var_21_1)

				setAnchoredPosition(arg_21_2, {
					x = var_21_2
				})

				local var_21_3 = var_21_0:GetIcon()

				arg_21_2:Find("item"):GetComponent(typeof(Image)).sprite = LoadSprite("GuildNode/" .. var_21_3)

				table.insert(arg_20_0.nodes, arg_21_2)
			end
		end)
		arg_20_0.nodesUIlist:align(#var_20_1)

		var_20_2 = var_20_0:GetProgress()
	end

	setSlider(arg_20_0.progress, 0, 100, var_20_2 * 100)
end

function var_0_0.InitBattleSea(arg_22_0)
	if arg_22_0.loading then
		return
	end

	arg_22_0.loading = true

	local var_22_0 = {}

	if not arg_22_0.battleView then
		arg_22_0.battleView = GuildMissionBattleView.New(arg_22_0.sea)

		arg_22_0.battleView:configUI(arg_22_0.healTF, arg_22_0.nameTF)
		table.insert(var_22_0, function(arg_23_0)
			arg_22_0.battleView:load(var_0_1, arg_23_0)
		end)
	end

	local var_22_1 = arg_22_0.mission:GetMyFlagShip()
	local var_22_2
	local var_22_3 = {}
	local var_22_4 = ""

	if var_22_1 then
		var_22_2 = getProxy(BayProxy):getShipById(var_22_1) or Ship.New({
			id = 9999,
			configId = 101171
		})

		local var_22_5 = math.floor(var_22_2.configId / 10)

		for iter_22_0 = 1, 4 do
			local var_22_6 = pg.ship_data_breakout[tonumber(var_22_5 .. iter_22_0)]
			local var_22_7 = var_22_6 and var_22_6.weapon_ids or {}

			for iter_22_1, iter_22_2 in ipairs(var_22_7) do
				if not table.contains(var_22_3, iter_22_2) then
					table.insert(var_22_3, iter_22_2)
				end
			end
		end

		var_22_4 = getProxy(PlayerProxy):getRawData().name
	end

	table.insert(var_22_0, function(arg_24_0)
		arg_22_0.battleView:LoadShip(var_22_2, var_22_3, var_22_4, function()
			if var_22_2 then
				arg_22_0:CheckNodesState()
			end

			arg_24_0()
		end)
	end)
	seriesAsync(var_22_0, function()
		arg_22_0.loading = false
	end)
end

function var_0_0.AddOtherShipMoveTimer(arg_27_0)
	local function var_27_0(arg_28_0)
		local var_28_0 = {}
		local var_28_1 = arg_27_0.mission:GetOtherShips()

		if #var_28_1 == 0 then
			return var_28_0
		end

		if arg_28_0 >= #var_28_1 then
			return var_28_1
		end

		shuffle(var_28_1)

		for iter_28_0 = 1, arg_28_0 do
			table.insert(var_28_0, var_28_1[iter_28_0])
		end

		return var_28_0
	end

	local var_27_1

	local function var_27_2()
		if arg_27_0.timer then
			arg_27_0.timer:Stop()

			arg_27_0.timer = nil
		end

		local var_29_0 = math.random(30, 150)

		arg_27_0.timer = Timer.New(function()
			local var_30_0 = math.random(1, 2)
			local var_30_1 = var_27_0(var_30_0)

			arg_27_0.battleView:PlayOtherShipAnim(var_30_1, var_27_2)
		end, var_29_0, 1)

		arg_27_0.timer:Start()
	end

	var_27_2()
end

function var_0_0.CheckNodesState(arg_31_0)
	local function var_31_0(arg_32_0)
		if arg_32_0:IsItemType() then
			arg_31_0.battleView:PlayItemAnim()
		elseif arg_32_0:IsBattleType() then
			arg_31_0.battleView:PlayAttackAnim()
		end
	end

	local var_31_1 = arg_31_0.mission
	local var_31_2 = var_31_1:GetNewestSuccessNode()

	if var_31_2 then
		local var_31_3 = var_31_1:GetNodeAnimPosistion()
		local var_31_4 = var_31_2:GetPosition()

		if var_31_3 < var_31_4 then
			var_31_0(var_31_2)
			arg_31_0:emit(GuildEventMediator.ON_UPDATE_NODE_ANIM_FLAG, var_31_1.id, var_31_4)
		end
	end
end

function var_0_0.AddRefreshProgressTimer(arg_33_0)
	arg_33_0:RemoveCdTimer()
	arg_33_0:RemoveRefreshTimer()

	local var_33_0 = arg_33_0.mission
	local var_33_1 = var_33_0:GetTotalTimeCost()
	local var_33_2 = not var_33_0:IsFinish() and var_33_1 > 0

	if var_33_2 then
		assert(var_33_1 > 900, var_33_1)

		local var_33_3 = var_33_1 * 0.01

		arg_33_0.refreshTimer = Timer.New(function()
			arg_33_0:RemoveRefreshTimer()
			arg_33_0:emit(GuildEventMediator.FORCE_REFRESH_MISSION, var_33_0.id)
		end, var_33_3, 1)

		arg_33_0.refreshTimer:Start()

		local var_33_4 = var_33_0:GetRemainingTime()

		if var_33_4 > 0 then
			arg_33_0.cdTimer = Timer.New(function()
				var_33_4 = var_33_4 - 1

				if var_33_4 <= 0 then
					arg_33_0:RemoveCdTimer()
					setActive(arg_33_0.timeTxt.gameObject.transform.parent, false)
				else
					arg_33_0.timeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_33_4)
				end
			end, 1, -1)

			arg_33_0.cdTimer:Start()
			arg_33_0.cdTimer.func()
		else
			setActive(arg_33_0.timeTxt.gameObject.transform.parent, false)
		end
	end

	setActive(arg_33_0.timeTxt.gameObject.transform.parent, var_33_2)
end

function var_0_0.RemoveCdTimer(arg_36_0)
	if arg_36_0.cdTimer then
		arg_36_0.cdTimer:Stop()

		arg_36_0.cdTimer = nil
	end
end

function var_0_0.ShowOrHideLogPanel(arg_37_0, arg_37_1, arg_37_2)
	arg_37_2 = arg_37_2 or 0.3

	if LeanTween.isTweening(arg_37_0.logPanel) then
		return
	end

	local var_37_0 = arg_37_0.logPanel.rect.width + 300
	local var_37_1 = arg_37_1 and var_37_0 or 0
	local var_37_2 = arg_37_1 and 0 or var_37_0

	LeanTween.value(arg_37_0.logPanel.gameObject, var_37_1, var_37_2, arg_37_2):setOnUpdate(System.Action_float(function(arg_38_0)
		setAnchoredPosition(arg_37_0.logPanel, {
			x = arg_38_0
		})
	end)):setOnComplete(System.Action(function()
		if not arg_37_1 then
			setActive(arg_37_0.logPanel, false)
		end
	end))

	arg_37_0.isShowLogPanel = arg_37_1

	if arg_37_1 then
		setActive(arg_37_0.logPanel, true)
		arg_37_0:InitLogs()
	end
end

function var_0_0.InitLogs(arg_40_0)
	local var_40_0 = arg_40_0.mission:GetLogs()

	arg_40_0.logList:make(function(arg_41_0, arg_41_1, arg_41_2)
		if arg_41_0 == UIItemList.EventUpdate then
			setText(arg_41_2, var_40_0[arg_41_1 + 1])
		end
	end)
	arg_40_0.logList:align(#var_40_0)
end

function var_0_0.RemoveRefreshTimer(arg_42_0)
	if arg_42_0.refreshTimer then
		arg_42_0.refreshTimer:Stop()

		refreshTimer = nil
	end
end

function var_0_0.Hide(arg_43_0)
	arg_43_0:ShowOrHideLogPanel(false, 0)
	var_0_0.super.Hide(arg_43_0)

	if arg_43_0.battleView then
		arg_43_0.battleView:clear()

		arg_43_0.battleView = nil
	end

	if arg_43_0.timer then
		arg_43_0.timer:Stop()

		arg_43_0.timer = nil
	end

	arg_43_0:RemoveRefreshTimer()
	arg_43_0:RemoveCdTimer()
end

return var_0_0
