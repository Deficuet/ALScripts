local var_0_0 = class("GuildMissionFormationPage", import(".GuildEventBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "GuildMissionFormationPage"
end

function var_0_0.OnRefreshMission(arg_2_0, arg_2_1)
	if not arg_2_0.mission or arg_2_0.mission.id ~= arg_2_1.id then
		return
	end

	arg_2_0:Flush(arg_2_1)
end

function var_0_0.OnFormationDone(arg_3_0)
	local var_3_0 = {}

	arg_3_0.loading = true

	for iter_3_0, iter_3_1 in pairs(arg_3_0.shipGos) do
		table.insert(var_3_0, function(arg_4_0)
			local var_4_0 = iter_3_1:GetComponent(typeof(SpineAnimUI))

			var_4_0:SetAction("victory", 0)
			var_4_0:SetActionCallBack(function(arg_5_0)
				if arg_5_0 == "finish" then
					var_4_0:SetActionCallBack(nil)
					var_4_0:SetAction("stand", 0)
					arg_4_0()
				end
			end)
		end)
	end

	parallelAsync(var_3_0, function()
		arg_3_0:Hide()

		arg_3_0.loading = false
	end)

	local var_3_1 = arg_3_0.canFormationIndex or 1

	for iter_3_2, iter_3_3 in ipairs(arg_3_0.pageFooter) do
		setActive(iter_3_3, iter_3_2 <= var_3_1)
	end

	setActive(arg_3_0.pageFooterAdd, false)
end

function var_0_0.OnLoaded(arg_7_0)
	arg_7_0.closeBtn = arg_7_0._tf:Find("frame/close")
	arg_7_0.titleTxt = arg_7_0._tf:Find("frame/title"):GetComponent(typeof(Text))
	arg_7_0.recomBtn = arg_7_0._tf:Find("frame/recom")
	arg_7_0.clearBtn = arg_7_0._tf:Find("frame/clear")
	arg_7_0.goBtn = arg_7_0._tf:Find("frame/bottom/go")
	arg_7_0.inProgressBtn = arg_7_0._tf:Find("frame/bottom/doingBtn")
	arg_7_0.battleAreaTxt = arg_7_0._tf:Find("frame/bottom/desc/area/Text"):GetComponent(typeof(Text))
	arg_7_0.battleTypeTxt = arg_7_0._tf:Find("frame/bottom/desc/type/Text"):GetComponent(typeof(Text))
	arg_7_0.awardList = UIItemList.New(arg_7_0._tf:Find("frame/bottom/award/list"), arg_7_0._tf:Find("frame/bottom/award/list/item"))
	arg_7_0.target1Text = arg_7_0._tf:Find("frame/bottom/desc/target/content/Text"):GetComponent(typeof(Text))
	arg_7_0.target2Text = arg_7_0._tf:Find("frame/bottom/desc/target/content/Text2"):GetComponent(typeof(Text))
	arg_7_0.target1Text4Effect = arg_7_0._tf:Find("frame/bottom/desc/target/content1/Text"):GetComponent(typeof(Text))
	arg_7_0.target2Text4Effect = arg_7_0._tf:Find("frame/bottom/desc/target/content1/Text2"):GetComponent(typeof(Text))
	arg_7_0.scoreAdditionTxt = arg_7_0._tf:Find("frame/bottom/score_addition/Text"):GetComponent(typeof(Text))
	arg_7_0.effectAdditionTxt = arg_7_0._tf:Find("frame/bottom/effect_addition/Text"):GetComponent(typeof(Text))
	arg_7_0.effectTxt = arg_7_0._tf:Find("frame/bottom/effect/Text"):GetComponent(typeof(Text))
	arg_7_0.bg = arg_7_0._tf:Find("frame/bottom/bg"):GetComponent(typeof(Image))
	arg_7_0.pageFooter = {
		arg_7_0._tf:Find("frame/single/dot/1"),
		arg_7_0._tf:Find("frame/single/dot/2"),
		arg_7_0._tf:Find("frame/single/dot/3"),
		arg_7_0._tf:Find("frame/single/dot/4")
	}
	arg_7_0.pageFooterAdd = arg_7_0._tf:Find("frame/single/dot/add")
	arg_7_0.nextBtn = arg_7_0._tf:Find("frame/single/next")
	arg_7_0.prevBtn = arg_7_0._tf:Find("frame/single/prev")

	setText(arg_7_0._tf:Find("frame/bottom/desc/area"), i18n("guild_word_battle_area"))
	setText(arg_7_0._tf:Find("frame/bottom/desc/type"), i18n("guild_word_battle_type"))
end

function var_0_0.OnInit(arg_8_0)
	local function var_8_0()
		if arg_8_0.contextData.index > 1 then
			triggerToggle(arg_8_0.pageFooter[arg_8_0.contextData.index - 1], true)
		end
	end

	local function var_8_1()
		if arg_8_0.contextData.index < arg_8_0.mission:GetMaxFleet() then
			local var_10_0 = arg_8_0.contextData.index + 1

			if var_10_0 > arg_8_0.mission:GetFleetCnt() then
				triggerToggle(arg_8_0.pageFooterAdd, true)
			else
				triggerToggle(arg_8_0.pageFooter[var_10_0], true)
			end
		end
	end

	addSlip(SLIP_TYPE_HRZ, arg_8_0._tf:Find("frame"), var_8_0, var_8_1)
	onButton(arg_8_0, arg_8_0.nextBtn, var_8_1, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.prevBtn, var_8_0, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.closeBtn, function()
		arg_8_0.contextData.missionShips = nil

		arg_8_0:Hide()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.recomBtn, function()
		if not arg_8_0:CheckFormation() then
			return
		end

		arg_8_0:emit(GuildEventMediator.ON_GET_FORMATION, function()
			local var_13_0 = getProxy(GuildProxy):GetRecommendShipsForMission(arg_8_0.mission)

			if #var_13_0 == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_event_recomm_ship_failed"))

				return
			end

			arg_8_0.contextData.missionShips = var_13_0

			arg_8_0:UpdateFleet(arg_8_0.contextData.index)
		end)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.clearBtn, function()
		if not arg_8_0:CheckFormation() then
			return
		end

		arg_8_0.contextData.missionShips = {}

		arg_8_0:UpdateFleet(arg_8_0.contextData.index)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.goBtn, function()
		if arg_8_0.mission:IsFinish() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_event_is_finish"))

			return
		end

		if not arg_8_0:CheckFormation() then
			return
		end

		if not arg_8_0.contextData.missionShips or #arg_8_0.contextData.missionShips == 0 then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_event_start_event_tip"),
			onYes = function()
				arg_8_0:emit(GuildEventMediator.JOIN_MISSION, arg_8_0.mission.id, arg_8_0.contextData.missionShips)
			end
		})
	end, SFX_PANEL)

	arg_8_0.shipGos = {}
end

function var_0_0.OnShow(arg_17_0)
	arg_17_0.loading = nil
	arg_17_0.maxShipCnt = arg_17_0.extraData.shipCnt

	local var_17_0 = arg_17_0.extraData.mission

	arg_17_0:UpdateLayout()
	arg_17_0:Flush(var_17_0)
	arg_17_0:UpdatePageFooter()
	arg_17_0:AddNextFormationTimer()
end

function var_0_0.UpdatePageFooter(arg_18_0)
	local var_18_0 = arg_18_0.mission
	local var_18_1 = var_18_0:CanFormation()
	local var_18_2 = var_18_0:GetFleetCnt()

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.pageFooter) do
		setActive(iter_18_1, iter_18_0 <= var_18_2)
		onToggle(arg_18_0, iter_18_1, function(arg_19_0)
			if arg_19_0 then
				arg_18_0:UpdateFleet(iter_18_0)
				arg_18_0:UpdateSwitchBtns()
			end
		end, SFX_PANEL)
	end

	setActive(arg_18_0.pageFooterAdd, var_18_1)
	onToggle(arg_18_0, arg_18_0.pageFooterAdd, function(arg_20_0)
		if arg_20_0 then
			arg_18_0:UpdateFleet(var_18_2 + 1)
		end
	end, SFX_PANEL)

	local var_18_3 = arg_18_0.contextData.index or 1

	if var_18_2 < var_18_3 then
		triggerToggle(arg_18_0.pageFooterAdd, true)
	else
		triggerToggle(arg_18_0.pageFooter[var_18_3], true)
	end
end

function var_0_0.UpdateSwitchBtns(arg_21_0)
	local var_21_0 = arg_21_0.mission:GetMaxFleet()
	local var_21_1 = arg_21_0.contextData.index

	setActive(arg_21_0.prevBtn, var_21_1 ~= 1)
	setActive(arg_21_0.nextBtn, var_21_1 < var_21_0)
end

function var_0_0.AddNextFormationTimer(arg_22_0)
	local var_22_0 = arg_22_0.mission

	if var_22_0:IsMaxFleetCnt() then
		return
	end

	local function var_22_1(arg_23_0)
		arg_22_0.canFormationIndex = var_22_0:GetCanFormationIndex()

		setActive(arg_22_0.pageFooterAdd, true)

		if arg_23_0 then
			triggerToggle(arg_22_0.pageFooterAdd, false)
		end

		var_22_0:RecordFormationTip()
		setActive(arg_22_0.pageFooterAdd:Find("tip"), var_22_0:ShouldShowFormationTip())
		arg_22_0:UpdateSwitchBtns()
	end

	if not var_22_0:CanFormation() then
		local var_22_2 = var_22_0:GetNextFormationTime() - pg.TimeMgr.GetInstance():GetServerTime()

		arg_22_0.timer = Timer.New(function()
			arg_22_0.timer:Stop()

			arg_22_0.timer = nil

			var_22_1(true)
		end, var_22_2, 1)

		arg_22_0.timer:Start()
	else
		var_22_1()
	end
end

function var_0_0.Flush(arg_25_0, arg_25_1)
	arg_25_0.mission = arg_25_1
	arg_25_0.canFormationIndex = arg_25_1:GetCanFormationIndex()

	arg_25_0:InitView()
end

function var_0_0.UpdateLayout(arg_26_0)
	arg_26_0.bg.sprite = GetSpriteFromAtlas("ui/GuildFormationUI_atlas", "bg3")

	local var_26_0 = arg_26_0._tf:Find("frame/single")

	arg_26_0.shipContainer = var_26_0
	arg_26_0.bg.gameObject.transform.sizeDelta = Vector2(arg_26_0.bg.gameObject.transform.sizeDelta.x, 212)

	setActive(var_26_0, true)
end

function var_0_0.InitView(arg_27_0)
	local var_27_0 = arg_27_0.mission

	if arg_27_0.initId ~= var_27_0.id then
		local var_27_1 = var_27_0:GetAwards()

		arg_27_0.awardList:make(function(arg_28_0, arg_28_1, arg_28_2)
			if arg_28_0 == UIItemList.EventUpdate then
				local var_28_0 = var_27_1[arg_28_1 + 1]
				local var_28_1 = {
					type = var_28_0[1],
					id = var_28_0[2],
					count = var_28_0[3]
				}

				updateDrop(arg_28_2, var_28_1)
				onButton(arg_27_0, arg_28_2, function()
					arg_27_0:send(BaseUI.ON_DROP, var_28_1)
				end, SFX_PANEL)
			end
		end)
		arg_27_0.awardList:align(#var_27_1)

		arg_27_0.battleAreaTxt.text = var_27_0:getConfig("ship_camp_display")
		arg_27_0.battleTypeTxt.text = var_27_0:getConfig("ship_type_display")
		arg_27_0.titleTxt.text = var_27_0:GetName()
		arg_27_0.initId = var_27_0.id
	end
end

function var_0_0.UpdateFleet(arg_30_0, arg_30_1)
	arg_30_0:ClearSlots()

	local var_30_0 = arg_30_0.mission
	local var_30_1 = arg_30_0.maxShipCnt
	local var_30_2

	if arg_30_1 == arg_30_0.canFormationIndex then
		var_30_2 = arg_30_0.contextData.missionShips or var_30_0:GetFleetByIndex(arg_30_1)
	else
		var_30_2 = var_30_0:GetFleetByIndex(arg_30_1)
	end

	local var_30_3 = {}

	var_30_2 = var_30_2 or {}

	for iter_30_0 = 1, var_30_1 do
		local var_30_4 = arg_30_0.shipContainer:GetChild(iter_30_0 - 1)

		table.insert(var_30_3, function(arg_31_0)
			arg_30_0:UpdateShipSlot(iter_30_0, var_30_4, var_30_2, arg_31_0)
		end)
	end

	pg.UIMgr.GetInstance():LoadingOn(false)
	parallelAsync(var_30_3, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)

	if var_30_0:IsEliteType() then
		local var_30_5 = arg_30_0:GetTagShipCnt(var_30_2)
		local var_30_6 = var_30_0:GetSquadronTargetCnt()
		local var_30_7 = var_30_6 <= var_30_5 and COLOR_GREEN or COLOR_RED
		local var_30_8 = var_30_0:GetSquadronDisplay()
		local var_30_9 = string.format("%s : (<color=%s>%d/%d</color>)", var_30_8, var_30_7, var_30_5, var_30_6)

		arg_30_0.target2Text.text = HXSet.hxLan(var_30_9)
		arg_30_0.target2Text4Effect.text = HXSet.hxLan(var_30_9)
	else
		arg_30_0.target2Text.text = ""
		arg_30_0.target2Text4Effect.text = ""
	end

	local var_30_10 = GuildMission.CalcMyEffect(var_30_2)

	arg_30_0.effectTxt.text = var_30_10

	local var_30_11 = arg_30_0:CalcEffectAddition(var_30_2)
	local var_30_12, var_30_13, var_30_14 = arg_30_0:CalcScoreAddition(var_30_2)

	arg_30_0.scoreAdditionTxt.text = i18n("guild_word_score_addition") .. var_30_12
	arg_30_0.effectAdditionTxt.text = i18n("guild_word_effect_addition") .. var_30_11

	local var_30_15 = arg_30_0:GetBattleTarget(var_30_13, var_30_14)

	arg_30_0.target1Text.text = table.concat(var_30_15, " 、")
	arg_30_0.target1Text4Effect.text = arg_30_0.target1Text.text

	setButtonEnabled(arg_30_0.goBtn, #var_30_2 > 0)

	local var_30_16 = var_30_0:GetFleetCnt()
	local var_30_17 = not var_30_0:CanFormation() or arg_30_1 <= var_30_16

	setActive(arg_30_0.inProgressBtn, var_30_17)
	setActive(arg_30_0.goBtn, not var_30_17)

	arg_30_0.contextData.index = arg_30_1

	if arg_30_0.target2Text.text ~= "" and arg_30_0.target1Text.text ~= "" then
		setText(arg_30_0._tf:Find("frame/bottom/desc/target/content/title"), i18n("guild_wrod_battle_target"))
	else
		setText(arg_30_0._tf:Find("frame/bottom/desc/target/content/title"), "")
	end
end

function var_0_0.UpdateShipSlot(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
	local var_33_0 = arg_33_0.mission
	local var_33_1 = arg_33_3[arg_33_1]
	local var_33_2 = arg_33_2:Find("Image")
	local var_33_3 = arg_33_2:Find("effect")
	local var_33_4 = arg_33_2:Find("score")

	if var_33_1 then
		local var_33_5 = getProxy(BayProxy):getShipById(var_33_1)

		if var_33_5 then
			local var_33_6 = var_33_5:getPrefab()

			PoolMgr.GetInstance():GetSpineChar(var_33_6, true, function(arg_34_0)
				arg_34_0.name = var_33_6
				tf(arg_34_0).pivot = Vector2(0.5, 0)
				tf(arg_34_0).sizeDelta = Vector2(200, 300)

				SetParent(arg_34_0, arg_33_2)

				tf(arg_34_0).localPosition = Vector3(0, 0, 0)
				tf(arg_34_0).localScale = Vector3(0.6, 0.6, 0.6)

				SetAction(arg_34_0, "stand")
				GetOrAddComponent(arg_34_0, "EventTriggerListener"):AddPointClickFunc(function(arg_35_0, arg_35_1)
					arg_33_0:emit(GuildEventMediator.ON_SELECT_MISSION_SHIP, var_33_0.id, arg_33_1, arg_33_3)
				end)

				arg_33_0.shipGos[var_33_1] = arg_34_0

				if arg_33_4 then
					arg_33_4()
				end
			end)
			setActive(var_33_3, arg_33_0:HasEffectAddition(var_33_5))
			setActive(var_33_4, arg_33_0:HasScoreAddition(var_33_5))
		elseif arg_33_4 then
			arg_33_4()
		end
	else
		onButton(arg_33_0, var_33_2, function()
			arg_33_0:emit(GuildEventMediator.ON_SELECT_MISSION_SHIP, var_33_0.id, arg_33_1, arg_33_3)
		end, SFX_PANEL)
		setActive(var_33_3, false)
		setActive(var_33_4, false)

		if arg_33_4 then
			arg_33_4()
		end
	end

	setActive(var_33_2, not var_33_1)
end

function var_0_0.CheckFormation(arg_37_0)
	local var_37_0 = arg_37_0.mission

	if arg_37_0.contextData.index ~= arg_37_0.canFormationIndex then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_curr_fleet_can_not_edit"))

		return false
	end

	local var_37_1, var_37_2 = arg_37_0.mission:CanFormation()

	if not var_37_1 then
		if var_37_2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_next_edit_fleet_time", var_37_2))
		end

		return false
	end

	return true
end

function var_0_0.emit(arg_38_0, ...)
	if arg_38_0.loading then
		return
	end

	if not arg_38_0:CheckFormation() then
		return
	end

	var_0_0.super.emit(arg_38_0, ...)
end

function var_0_0.send(arg_39_0, ...)
	var_0_0.super.emit(arg_39_0, ...)
end

function var_0_0.GetBattleTarget(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_0.mission
	local var_40_1 = var_40_0:GetAttrCntAcc()
	local var_40_2 = var_40_0:GetAttrAcc()
	local var_40_3 = {}

	for iter_40_0, iter_40_1 in pairs(var_40_1) do
		local var_40_4 = arg_40_1[iter_40_0] or 0

		table.insert(var_40_3, GuildMissionInfoPage.AttrCnt2Desc(iter_40_0, {
			value = iter_40_1.value + var_40_4,
			total = iter_40_1.total,
			goal = iter_40_1.goal,
			score = iter_40_1.score
		}))
	end

	for iter_40_2, iter_40_3 in pairs(var_40_2) do
		local var_40_5 = arg_40_2[iter_40_2] or 0

		table.insert(var_40_3, GuildMissionInfoPage.AttrAcc2Desc(iter_40_2, {
			value = iter_40_3.value + var_40_5,
			op = iter_40_3.op,
			goal = iter_40_3.goal,
			score = iter_40_3.score
		}))
	end

	return var_40_3
end

function var_0_0.GetTagShipCnt(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0.mission:GetSquadron()
	local var_41_1 = 0
	local var_41_2 = getProxy(BayProxy)

	for iter_41_0, iter_41_1 in ipairs(arg_41_1) do
		local var_41_3 = var_41_2:getShipById(iter_41_1)

		if var_41_3 and var_41_3:IsTagShip(var_41_0) then
			var_41_1 = var_41_1 + 1
		end
	end

	return var_41_1
end

function var_0_0.CalcScoreAddition(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0.mission
	local var_42_1 = var_42_0:GetAttrCntAcc()
	local var_42_2 = var_42_0:GetAttrAcc()
	local var_42_3 = pg.attribute_info_by_type
	local var_42_4 = 0
	local var_42_5 = {}
	local var_42_6 = {}
	local var_42_7 = getProxy(BayProxy)

	for iter_42_0, iter_42_1 in ipairs(arg_42_1) do
		local var_42_8 = var_42_7:getShipById(iter_42_1)
		local var_42_9

		if var_42_8 then
			var_42_9 = _.detect(var_42_0:getConfig("ship_camp_effect"), function(arg_43_0)
				return arg_43_0[1] == var_42_8:getNation()
			end)
		end

		if var_42_9 then
			var_42_4 = var_42_4 + var_42_9[2]
		end

		local var_42_10 = var_42_8 and var_42_8:getProperties() or {}

		for iter_42_2, iter_42_3 in pairs(var_42_1) do
			if (var_42_10[var_42_3[iter_42_2].name] or 0) >= iter_42_3.total then
				var_42_5[iter_42_2] = (var_42_5[iter_42_2] or 0) + 1
			end
		end

		for iter_42_4, iter_42_5 in pairs(var_42_2) do
			local var_42_11 = var_42_3[iter_42_4].name

			var_42_6[iter_42_4] = (var_42_6[iter_42_4] or 0) + (var_42_10[var_42_11] or 0)
		end
	end

	for iter_42_6, iter_42_7 in pairs(var_42_1) do
		if (var_42_5[iter_42_6] or 0) + iter_42_7.value >= iter_42_7.goal then
			var_42_4 = var_42_4 + iter_42_7.score
		end
	end

	for iter_42_8, iter_42_9 in pairs(var_42_2) do
		local var_42_12 = iter_42_9.value + (var_42_6[iter_42_8] or 0)
		local var_42_13

		if iter_42_9.op == 1 then
			var_42_13 = var_42_12 >= iter_42_9.goal
		elseif iter_42_9.op == 2 then
			var_42_13 = var_42_12 <= iter_42_9.goal
		end

		if var_42_13 then
			var_42_4 = var_42_4 + iter_42_9.score
		end
	end

	return var_42_4, var_42_5, var_42_6
end

function var_0_0.CalcEffectAddition(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0.mission
	local var_44_1 = GuildMission.CalcMyEffect(arg_44_1)
	local var_44_2 = getProxy(BayProxy)

	for iter_44_0, iter_44_1 in ipairs(arg_44_1) do
		local var_44_3 = var_44_2:getShipById(iter_44_1)
		local var_44_4

		if var_44_3 then
			var_44_4 = _.detect(var_44_0:getConfig("ship_type_effect"), function(arg_45_0)
				return arg_45_0[1] == var_44_3:getShipType()
			end)
		end

		if var_44_4 then
			var_44_1 = var_44_1 + var_44_4[2]
		end
	end

	local var_44_5 = arg_44_0:GetTagShipCnt(arg_44_1)
	local var_44_6 = var_44_0:GetSquadronTargetCnt()
	local var_44_7 = 1

	if var_44_6 <= var_44_5 and var_44_0:IsEliteType() then
		var_44_7 = var_44_0:GetSquadronRatio()
	end

	return var_44_1 * var_44_7
end

function var_0_0.HasScoreAddition(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0.mission
	local var_46_1 = var_46_0:GetRecommendShipNation()
	local var_46_2 = var_46_0:GetAttrCntAcc()
	local var_46_3 = var_46_0:GetAttrAcc()

	local function var_46_4()
		local var_47_0 = arg_46_1:getProperties()
		local var_47_1 = pg.attribute_info_by_type

		for iter_47_0, iter_47_1 in pairs(var_46_2) do
			local var_47_2 = var_47_1[iter_47_0].name

			assert(var_47_0[var_47_2], var_47_2)

			if (var_47_0[var_47_2] or 0) >= iter_47_1.total then
				return true
			end
		end

		for iter_47_2, iter_47_3 in pairs(var_46_3) do
			local var_47_3 = var_47_1[iter_47_2].name

			assert(var_47_0[var_47_3], var_47_3)

			if iter_47_3.op == 1 then
				return (var_47_0[var_47_3] or 0) > 0
			elseif iter_47_3.op == 2 then
				return (var_47_0[var_47_3] or 0) == 0
			end
		end

		return false
	end

	return table.contains(var_46_1, arg_46_1:getNation()) or var_46_4()
end

function var_0_0.HasEffectAddition(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_0.mission
	local var_48_1 = var_48_0:GetRecommendShipTypes()
	local var_48_2 = var_48_0:GetSquadron()

	return table.contains(var_48_1, arg_48_1:getShipType()) or arg_48_1:IsTagShip(var_48_2)
end

function var_0_0.ClearSlots(arg_49_0)
	for iter_49_0, iter_49_1 in pairs(arg_49_0.shipGos) do
		tf(iter_49_1).pivot = Vector2(0.5, 0.5)

		GetOrAddComponent(iter_49_1, "EventTriggerListener"):RemovePointClickFunc()
		iter_49_1:GetComponent(typeof(SpineAnimUI)):SetActionCallBack(nil)
		PoolMgr.GetInstance():ReturnSpineChar(iter_49_1.name, iter_49_1)
	end

	arg_49_0.shipGos = {}
end

function var_0_0.Hide(arg_50_0)
	var_0_0.super.Hide(arg_50_0)
	arg_50_0:ClearSlots()

	if arg_50_0.timer then
		arg_50_0.timer:Stop()

		arg_50_0.timer = nil
	end
end

return var_0_0
