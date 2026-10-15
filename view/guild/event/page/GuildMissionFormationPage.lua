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
			iter_3_1:SetAction("victory", 0)
			iter_3_1:SetActionCallBack(function(arg_5_0)
				if arg_5_0 == "finish" then
					iter_3_1:SetActionCallBack(nil)
					iter_3_1:SetAction("stand", 0)
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

			local var_13_1 = {}

			for iter_13_0, iter_13_1 in ipairs(var_13_0) do
				local var_13_2 = getProxy(BayProxy):getShipById(iter_13_1)

				if var_13_2 then
					local var_13_3 = var_13_2:getPrefab()

					table.insert(var_13_1, "char/" .. var_13_3)
				end
			end

			SplitPackConst.DownloadByLuaArr(var_13_1, function()
				arg_8_0:UpdateFleet(arg_8_0.contextData.index)
			end)
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

function var_0_0.OnShow(arg_18_0)
	arg_18_0.loading = nil
	arg_18_0.maxShipCnt = arg_18_0.extraData.shipCnt

	local var_18_0 = arg_18_0.extraData.mission

	arg_18_0:UpdateLayout()
	arg_18_0:Flush(var_18_0)
	arg_18_0:UpdatePageFooter()
	arg_18_0:AddNextFormationTimer()
end

function var_0_0.UpdatePageFooter(arg_19_0)
	local var_19_0 = arg_19_0.mission
	local var_19_1 = var_19_0:CanFormation()
	local var_19_2 = var_19_0:GetFleetCnt()

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.pageFooter) do
		setActive(iter_19_1, iter_19_0 <= var_19_2)
		onToggle(arg_19_0, iter_19_1, function(arg_20_0)
			if arg_20_0 then
				arg_19_0:UpdateFleet(iter_19_0)
				arg_19_0:UpdateSwitchBtns()
			end
		end, SFX_PANEL)
	end

	setActive(arg_19_0.pageFooterAdd, var_19_1)
	onToggle(arg_19_0, arg_19_0.pageFooterAdd, function(arg_21_0)
		if arg_21_0 then
			arg_19_0:UpdateFleet(var_19_2 + 1)
		end
	end, SFX_PANEL)

	local var_19_3 = arg_19_0.contextData.index or 1

	if var_19_2 < var_19_3 then
		triggerToggle(arg_19_0.pageFooterAdd, true)
	else
		triggerToggle(arg_19_0.pageFooter[var_19_3], true)
	end
end

function var_0_0.UpdateSwitchBtns(arg_22_0)
	local var_22_0 = arg_22_0.mission:GetMaxFleet()
	local var_22_1 = arg_22_0.contextData.index

	setActive(arg_22_0.prevBtn, var_22_1 ~= 1)
	setActive(arg_22_0.nextBtn, var_22_1 < var_22_0)
end

function var_0_0.AddNextFormationTimer(arg_23_0)
	local var_23_0 = arg_23_0.mission

	if var_23_0:IsMaxFleetCnt() then
		return
	end

	local function var_23_1(arg_24_0)
		arg_23_0.canFormationIndex = var_23_0:GetCanFormationIndex()

		setActive(arg_23_0.pageFooterAdd, true)

		if arg_24_0 then
			triggerToggle(arg_23_0.pageFooterAdd, false)
		end

		var_23_0:RecordFormationTip()
		setActive(arg_23_0.pageFooterAdd:Find("tip"), var_23_0:ShouldShowFormationTip())
		arg_23_0:UpdateSwitchBtns()
	end

	if not var_23_0:CanFormation() then
		local var_23_2 = var_23_0:GetNextFormationTime() - pg.TimeMgr.GetInstance():GetServerTime()

		arg_23_0.timer = Timer.New(function()
			arg_23_0.timer:Stop()

			arg_23_0.timer = nil

			var_23_1(true)
		end, var_23_2, 1)

		arg_23_0.timer:Start()
	else
		var_23_1()
	end
end

function var_0_0.Flush(arg_26_0, arg_26_1)
	arg_26_0.mission = arg_26_1
	arg_26_0.canFormationIndex = arg_26_1:GetCanFormationIndex()

	arg_26_0:InitView()
end

function var_0_0.UpdateLayout(arg_27_0)
	arg_27_0.bg.sprite = GetSpriteFromAtlas("ui/GuildFormationUI_atlas", "bg3")

	local var_27_0 = arg_27_0._tf:Find("frame/single")

	arg_27_0.shipContainer = var_27_0
	arg_27_0.bg.gameObject.transform.sizeDelta = Vector2(arg_27_0.bg.gameObject.transform.sizeDelta.x, 212)

	setActive(var_27_0, true)
end

function var_0_0.InitView(arg_28_0)
	local var_28_0 = arg_28_0.mission

	if arg_28_0.initId ~= var_28_0.id then
		local var_28_1 = var_28_0:GetAwards()

		arg_28_0.awardList:make(function(arg_29_0, arg_29_1, arg_29_2)
			if arg_29_0 == UIItemList.EventUpdate then
				local var_29_0 = var_28_1[arg_29_1 + 1]
				local var_29_1 = {
					type = var_29_0[1],
					id = var_29_0[2],
					count = var_29_0[3]
				}

				updateDrop(arg_29_2, var_29_1)
				onButton(arg_28_0, arg_29_2, function()
					arg_28_0:send(BaseUI.ON_DROP, var_29_1)
				end, SFX_PANEL)
			end
		end)
		arg_28_0.awardList:align(#var_28_1)

		arg_28_0.battleAreaTxt.text = var_28_0:getConfig("ship_camp_display")
		arg_28_0.battleTypeTxt.text = var_28_0:getConfig("ship_type_display")
		arg_28_0.titleTxt.text = var_28_0:GetName()
		arg_28_0.initId = var_28_0.id
	end
end

function var_0_0.UpdateFleet(arg_31_0, arg_31_1)
	arg_31_0:ClearSlots()

	local var_31_0 = arg_31_0.mission
	local var_31_1 = arg_31_0.maxShipCnt
	local var_31_2

	if arg_31_1 == arg_31_0.canFormationIndex then
		var_31_2 = arg_31_0.contextData.missionShips or var_31_0:GetFleetByIndex(arg_31_1)
	else
		var_31_2 = var_31_0:GetFleetByIndex(arg_31_1)
	end

	local var_31_3 = {}

	var_31_2 = var_31_2 or {}

	for iter_31_0 = 1, var_31_1 do
		local var_31_4 = arg_31_0.shipContainer:GetChild(iter_31_0 - 1)

		table.insert(var_31_3, function(arg_32_0)
			arg_31_0:UpdateShipSlot(iter_31_0, var_31_4, var_31_2, arg_32_0)
		end)
	end

	pg.UIMgr.GetInstance():LoadingOn(false)
	parallelAsync(var_31_3, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)

	if var_31_0:IsEliteType() then
		local var_31_5 = arg_31_0:GetTagShipCnt(var_31_2)
		local var_31_6 = var_31_0:GetSquadronTargetCnt()
		local var_31_7 = var_31_6 <= var_31_5 and COLOR_GREEN or COLOR_RED
		local var_31_8 = var_31_0:GetSquadronDisplay()
		local var_31_9 = string.format("%s : (<color=%s>%d/%d</color>)", var_31_8, var_31_7, var_31_5, var_31_6)

		arg_31_0.target2Text.text = HXSet.hxLan(var_31_9)
		arg_31_0.target2Text4Effect.text = HXSet.hxLan(var_31_9)
	else
		arg_31_0.target2Text.text = ""
		arg_31_0.target2Text4Effect.text = ""
	end

	local var_31_10 = GuildMission.CalcMyEffect(var_31_2)

	arg_31_0.effectTxt.text = var_31_10

	local var_31_11 = arg_31_0:CalcEffectAddition(var_31_2)
	local var_31_12, var_31_13, var_31_14 = arg_31_0:CalcScoreAddition(var_31_2)

	arg_31_0.scoreAdditionTxt.text = i18n("guild_word_score_addition") .. var_31_12
	arg_31_0.effectAdditionTxt.text = i18n("guild_word_effect_addition") .. var_31_11

	local var_31_15 = arg_31_0:GetBattleTarget(var_31_13, var_31_14)

	arg_31_0.target1Text.text = table.concat(var_31_15, " 、")
	arg_31_0.target1Text4Effect.text = arg_31_0.target1Text.text

	setButtonEnabled(arg_31_0.goBtn, #var_31_2 > 0)

	local var_31_16 = var_31_0:GetFleetCnt()
	local var_31_17 = not var_31_0:CanFormation() or arg_31_1 <= var_31_16

	setActive(arg_31_0.inProgressBtn, var_31_17)
	setActive(arg_31_0.goBtn, not var_31_17)

	arg_31_0.contextData.index = arg_31_1

	if arg_31_0.target2Text.text ~= "" and arg_31_0.target1Text.text ~= "" then
		setText(arg_31_0._tf:Find("frame/bottom/desc/target/content/title"), i18n("guild_wrod_battle_target"))
	else
		setText(arg_31_0._tf:Find("frame/bottom/desc/target/content/title"), "")
	end
end

function var_0_0.UpdateShipSlot(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	local var_34_0 = arg_34_0.mission
	local var_34_1 = arg_34_3[arg_34_1]
	local var_34_2 = arg_34_2:Find("Image")
	local var_34_3 = arg_34_2:Find("effect")
	local var_34_4 = arg_34_2:Find("score")

	if var_34_1 then
		local var_34_5 = getProxy(BayProxy):getShipById(var_34_1)

		if var_34_5 then
			local var_34_6 = var_34_5:getPrefab()

			arg_34_0.spineChar = SpineAnimChar.New()

			arg_34_0.spineChar:SetPaint(var_34_6)
			arg_34_0.spineChar:Load(true, function(arg_35_0)
				arg_35_0:SetName(var_34_6)
				arg_35_0:SetPivot(Vector2(0.5, 0))
				arg_35_0:SetSizeDelta(Vector2(200, 300))
				arg_35_0:SetParent(arg_34_2)
				arg_35_0:SetLocalPosition(Vector3(0, 0, 0))
				arg_35_0:SetLocalScale(Vector3(0.6, 0.6, 0.6))
				arg_35_0:SetAction("stand")
				GetOrAddComponent(arg_35_0:GetModel(), "EventTriggerListener"):AddPointClickFunc(function(arg_36_0, arg_36_1)
					arg_34_0:emit(GuildEventMediator.ON_SELECT_MISSION_SHIP, var_34_0.id, arg_34_1, arg_34_3)
				end)

				arg_34_0.shipGos[var_34_1] = arg_35_0

				if arg_34_4 then
					arg_34_4()
				end
			end)
			setActive(var_34_3, arg_34_0:HasEffectAddition(var_34_5))
			setActive(var_34_4, arg_34_0:HasScoreAddition(var_34_5))
		elseif arg_34_4 then
			arg_34_4()
		end
	else
		onButton(arg_34_0, var_34_2, function()
			arg_34_0:emit(GuildEventMediator.ON_SELECT_MISSION_SHIP, var_34_0.id, arg_34_1, arg_34_3)
		end, SFX_PANEL)
		setActive(var_34_3, false)
		setActive(var_34_4, false)

		if arg_34_4 then
			arg_34_4()
		end
	end

	setActive(var_34_2, not var_34_1)
end

function var_0_0.CheckFormation(arg_38_0)
	local var_38_0 = arg_38_0.mission

	if arg_38_0.contextData.index ~= arg_38_0.canFormationIndex then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_curr_fleet_can_not_edit"))

		return false
	end

	local var_38_1, var_38_2 = arg_38_0.mission:CanFormation()

	if not var_38_1 then
		if var_38_2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_next_edit_fleet_time", var_38_2))
		end

		return false
	end

	return true
end

function var_0_0.emit(arg_39_0, ...)
	if arg_39_0.loading then
		return
	end

	if not arg_39_0:CheckFormation() then
		return
	end

	var_0_0.super.emit(arg_39_0, ...)
end

function var_0_0.send(arg_40_0, ...)
	var_0_0.super.emit(arg_40_0, ...)
end

function var_0_0.GetBattleTarget(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = arg_41_0.mission
	local var_41_1 = var_41_0:GetAttrCntAcc()
	local var_41_2 = var_41_0:GetAttrAcc()
	local var_41_3 = {}

	for iter_41_0, iter_41_1 in pairs(var_41_1) do
		local var_41_4 = arg_41_1[iter_41_0] or 0

		table.insert(var_41_3, GuildMissionInfoPage.AttrCnt2Desc(iter_41_0, {
			value = iter_41_1.value + var_41_4,
			total = iter_41_1.total,
			goal = iter_41_1.goal,
			score = iter_41_1.score
		}))
	end

	for iter_41_2, iter_41_3 in pairs(var_41_2) do
		local var_41_5 = arg_41_2[iter_41_2] or 0

		table.insert(var_41_3, GuildMissionInfoPage.AttrAcc2Desc(iter_41_2, {
			value = iter_41_3.value + var_41_5,
			op = iter_41_3.op,
			goal = iter_41_3.goal,
			score = iter_41_3.score
		}))
	end

	return var_41_3
end

function var_0_0.GetTagShipCnt(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0.mission:GetSquadron()
	local var_42_1 = 0
	local var_42_2 = getProxy(BayProxy)

	for iter_42_0, iter_42_1 in ipairs(arg_42_1) do
		local var_42_3 = var_42_2:getShipById(iter_42_1)

		if var_42_3 and var_42_3:IsTagShip(var_42_0) then
			var_42_1 = var_42_1 + 1
		end
	end

	return var_42_1
end

function var_0_0.CalcScoreAddition(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0.mission
	local var_43_1 = var_43_0:GetAttrCntAcc()
	local var_43_2 = var_43_0:GetAttrAcc()
	local var_43_3 = pg.attribute_info_by_type
	local var_43_4 = 0
	local var_43_5 = {}
	local var_43_6 = {}
	local var_43_7 = getProxy(BayProxy)

	for iter_43_0, iter_43_1 in ipairs(arg_43_1) do
		local var_43_8 = var_43_7:getShipById(iter_43_1)
		local var_43_9

		if var_43_8 then
			var_43_9 = _.detect(var_43_0:getConfig("ship_camp_effect"), function(arg_44_0)
				return arg_44_0[1] == var_43_8:getNation()
			end)
		end

		if var_43_9 then
			var_43_4 = var_43_4 + var_43_9[2]
		end

		local var_43_10 = var_43_8 and var_43_8:getProperties() or {}

		for iter_43_2, iter_43_3 in pairs(var_43_1) do
			if (var_43_10[var_43_3[iter_43_2].name] or 0) >= iter_43_3.total then
				var_43_5[iter_43_2] = (var_43_5[iter_43_2] or 0) + 1
			end
		end

		for iter_43_4, iter_43_5 in pairs(var_43_2) do
			local var_43_11 = var_43_3[iter_43_4].name

			var_43_6[iter_43_4] = (var_43_6[iter_43_4] or 0) + (var_43_10[var_43_11] or 0)
		end
	end

	for iter_43_6, iter_43_7 in pairs(var_43_1) do
		if (var_43_5[iter_43_6] or 0) + iter_43_7.value >= iter_43_7.goal then
			var_43_4 = var_43_4 + iter_43_7.score
		end
	end

	for iter_43_8, iter_43_9 in pairs(var_43_2) do
		local var_43_12 = iter_43_9.value + (var_43_6[iter_43_8] or 0)
		local var_43_13

		if iter_43_9.op == 1 then
			var_43_13 = var_43_12 >= iter_43_9.goal
		elseif iter_43_9.op == 2 then
			var_43_13 = var_43_12 <= iter_43_9.goal
		end

		if var_43_13 then
			var_43_4 = var_43_4 + iter_43_9.score
		end
	end

	return var_43_4, var_43_5, var_43_6
end

function var_0_0.getResource(arg_45_0)
	local var_45_0 = var_0_0.super.getResource(arg_45_0)
	local var_45_1 = getProxy(GuildProxy):getData():GetActiveEvent():GetMissions()

	for iter_45_0, iter_45_1 in ipairs(var_45_1) do
		for iter_45_2, iter_45_3 in ipairs(iter_45_1) do
			local var_45_2 = iter_45_3:GetMyShips()

			for iter_45_4, iter_45_5 in ipairs(var_45_2) do
				local var_45_3 = getProxy(BayProxy):getShipById(iter_45_5)

				if var_45_3 then
					local var_45_4 = var_45_3:getPrefab()

					table.insert(var_45_0, "char/" .. var_45_4)
					table.insert(var_45_0, "herohrzicon/" .. var_45_4)
				end
			end
		end
	end

	return var_45_0
end

function var_0_0.CalcEffectAddition(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0.mission
	local var_46_1 = GuildMission.CalcMyEffect(arg_46_1)
	local var_46_2 = getProxy(BayProxy)

	for iter_46_0, iter_46_1 in ipairs(arg_46_1) do
		local var_46_3 = var_46_2:getShipById(iter_46_1)
		local var_46_4

		if var_46_3 then
			var_46_4 = _.detect(var_46_0:getConfig("ship_type_effect"), function(arg_47_0)
				return arg_47_0[1] == var_46_3:getShipType()
			end)
		end

		if var_46_4 then
			var_46_1 = var_46_1 + var_46_4[2]
		end
	end

	local var_46_5 = arg_46_0:GetTagShipCnt(arg_46_1)
	local var_46_6 = var_46_0:GetSquadronTargetCnt()
	local var_46_7 = 1

	if var_46_6 <= var_46_5 and var_46_0:IsEliteType() then
		var_46_7 = var_46_0:GetSquadronRatio()
	end

	return var_46_1 * var_46_7
end

function var_0_0.HasScoreAddition(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_0.mission
	local var_48_1 = var_48_0:GetRecommendShipNation()
	local var_48_2 = var_48_0:GetAttrCntAcc()
	local var_48_3 = var_48_0:GetAttrAcc()

	local function var_48_4()
		local var_49_0 = arg_48_1:getProperties()
		local var_49_1 = pg.attribute_info_by_type

		for iter_49_0, iter_49_1 in pairs(var_48_2) do
			local var_49_2 = var_49_1[iter_49_0].name

			assert(var_49_0[var_49_2], var_49_2)

			if (var_49_0[var_49_2] or 0) >= iter_49_1.total then
				return true
			end
		end

		for iter_49_2, iter_49_3 in pairs(var_48_3) do
			local var_49_3 = var_49_1[iter_49_2].name

			assert(var_49_0[var_49_3], var_49_3)

			if iter_49_3.op == 1 then
				return (var_49_0[var_49_3] or 0) > 0
			elseif iter_49_3.op == 2 then
				return (var_49_0[var_49_3] or 0) == 0
			end
		end

		return false
	end

	return table.contains(var_48_1, arg_48_1:getNation()) or var_48_4()
end

function var_0_0.HasEffectAddition(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0.mission
	local var_50_1 = var_50_0:GetRecommendShipTypes()
	local var_50_2 = var_50_0:GetSquadron()

	return table.contains(var_50_1, arg_50_1:getShipType()) or arg_50_1:IsTagShip(var_50_2)
end

function var_0_0.ClearSlots(arg_51_0)
	for iter_51_0, iter_51_1 in pairs(arg_51_0.shipGos) do
		iter_51_1:SetPivot(Vector2(0.5, 0.5))
		GetOrAddComponent(iter_51_1:GetModel(), "EventTriggerListener"):RemovePointClickFunc()
		iter_51_1:SetActionCallBack(nil)
		iter_51_1:Dispose()
	end

	arg_51_0.shipGos = {}
end

function var_0_0.Hide(arg_52_0)
	var_0_0.super.Hide(arg_52_0)
	arg_52_0:ClearSlots()

	if arg_52_0.timer then
		arg_52_0.timer:Stop()

		arg_52_0.timer = nil
	end
end

return var_0_0
