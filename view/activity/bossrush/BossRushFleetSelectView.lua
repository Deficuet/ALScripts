local var_0_0 = class("BossRushFleetSelectView", import("view.base.BaseUI"))

var_0_0.fleetNames = {
	vanguard = 1,
	submarine = 3,
	main = 2
}

function var_0_0.GetTextColor(arg_1_0)
	return Color.white, Color.New(1, 1, 1, 0.5)
end

function var_0_0.getUIName(arg_2_0)
	return "BossRushFleetSelectUI"
end

function var_0_0.init(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
	arg_3_0:InitUI()
end

function var_0_0.InitUI(arg_4_0)
	local var_4_0 = arg_4_0._tf:Find("Panel")

	arg_4_0.tfFleets = {
		[FleetType.Normal] = arg_4_0._tf:Find("Panel/Fleet/Normal"),
		[FleetType.Submarine] = arg_4_0._tf:Find("Panel/Fleet/Submarine")
	}
	arg_4_0.btnRecommend = var_4_0:Find("Fleet/BtnRecommend")
	arg_4_0.btnClear = var_4_0:Find("Fleet/BtnClear")
	arg_4_0.rtCostLimit = var_4_0:Find("Fleet/CostLimit")
	arg_4_0.commanderList = var_4_0:Find("Fleet/Commander")
	arg_4_0.modeToggles = {
		var_4_0:Find("Info/Modes/Single"),
		var_4_0:Find("Info/Modes/Multiple")
	}
	arg_4_0.extraAwardTF = arg_4_0._tf:Find("Panel/Reward/Normal/Mode")
	arg_4_0.sonarRangeContainer = arg_4_0._tf:Find("Panel/Fleet/SonarRange")
	arg_4_0.sonarRangeTexts = {
		arg_4_0._tf:Find("Panel/Fleet/SonarRange/Values"):GetChild(0),
		arg_4_0._tf:Find("Panel/Fleet/SonarRange/Values"):GetChild(1)
	}

	setText(arg_4_0.sonarRangeTexts[2], "")

	arg_4_0.btnBack = var_4_0:Find("Info/Title/BtnClose")
	arg_4_0.btnGo = var_4_0:Find("Info/Start")

	setText(arg_4_0._tf:Find("Panel/Fleet/SonarRange/Text"), i18n("fleet_antisub_range") .. ":")
	setText(arg_4_0._tf:Find("Panel/Fleet/CostLimit/Title"), i18n("formationScene_use_oil_limit_tip_worldboss"))
	setText(arg_4_0._tf:Find("Panel/Reward/Normal/Base/Text"), i18n("series_enemy_reward_tip1"))
	setText(arg_4_0._tf:Find("Panel/Reward/Normal/Mode/Text"), i18n("series_enemy_reward_tip2"))
	setText(arg_4_0._tf:Find("Panel/Reward/EX/Title"), i18n("series_enemy_reward_tip4"))
	setText(arg_4_0._tf:Find("Panel/Reward/Tip"), i18n("limit_team_character_tips"))
	setText(arg_4_0._tf:Find("Panel/Info/Modes/Single/On/Text"), i18n("series_enemy_mode_1"))
	setText(arg_4_0._tf:Find("Panel/Info/Modes/Single/Off/Text"), i18n("series_enemy_mode_1"))
	setText(arg_4_0._tf:Find("Panel/Info/Modes/Multiple/On/Text"), i18n("series_enemy_mode_2"))
	setText(arg_4_0._tf:Find("Panel/Info/Modes/Multiple/Off/Text"), i18n("series_enemy_mode_2"))
	setText(arg_4_0._tf:Find("Panel/Fleet/Normal/main/Item/Ship/EnergyWarn/Text"), i18n("series_enemy_mood"))
	setText(arg_4_0._tf:Find("Panel/Fleet/Normal/vanguard/Item/Ship/EnergyWarn/Text"), i18n("series_enemy_mood"))
	setText(arg_4_0._tf:Find("Panel/Fleet/Submarine/main/Item/Ship/EnergyWarn/Text"), i18n("series_enemy_mood"))
end

function var_0_0.didEnter(arg_5_0)
	local var_5_0 = arg_5_0.contextData.seriesData

	onButton(arg_5_0, arg_5_0.btnGo, function()
		if StartChapterAutoCommand.CheckOccupied() then
			return
		end

		for iter_6_0 = 1, #arg_5_0.contextData.fleets - 1 do
			if arg_5_0.contextData.fleets[iter_6_0]:isLegalToFight() ~= true then
				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_team_notenough"))

				return
			end
		end

		if _.any(arg_5_0.contextData.fleets, function(arg_7_0)
			local var_7_0, var_7_1 = arg_7_0:HaveShipsInEvent()

			if var_7_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_7_1)

				return true
			end
		end) then
			return
		end

		local var_6_0 = var_5_0:GetType() == BossRushSeriesData.TYPE.SP
		local var_6_1 = true

		if var_6_0 then
			local var_6_2 = getProxy(ActivityProxy):getActivityById(var_5_0.actId)
			local var_6_3 = var_6_2:GetActiveSeriesIds()
			local var_6_4 = table.getIndex(var_6_3, function(arg_8_0)
				return arg_8_0 == var_5_0.id
			end)
			local var_6_5 = var_6_2:GetUsedBonus()[var_6_4] or 0

			if not (var_5_0:GetMaxBonusCount() - var_6_5 > 0) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_SP_error"))

				return
			end
		end

		arg_5_0:emit(BossRushFleetSelectMediator.ON_PRECOMBAT)
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_5_0, arg_5_0.sonarRangeContainer, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.fleet_antisub_range_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.btnBack, function()
		arg_5_0:onCancelHard()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0._tf:Find("BG"), function()
		arg_5_0:onCancelHard()
	end, SFX_CANCEL)

	local var_5_1 = var_5_0:IsSingleFight()

	setActive(arg_5_0.modeToggles[1].parent, var_5_1)

	if var_5_1 then
		table.Foreach(arg_5_0.modeToggles, function(arg_12_0, arg_12_1)
			triggerToggle(arg_12_1, arg_12_0 == arg_5_0.contextData.mode)
		end)
		table.Foreach(arg_5_0.modeToggles, function(arg_13_0, arg_13_1)
			onToggle(arg_5_0, arg_13_1, function(arg_14_0)
				if not arg_14_0 then
					return
				end

				arg_5_0:emit(BossRushFleetSelectMediator.ON_SWITCH_MODE, arg_13_0)
				arg_5_0:updateToggles()
				triggerToggle(arg_5_0.fleetIndexToggles[arg_5_0.contextData.fleetIndex], true)
			end, SFX_PANEL)
		end)
	end

	local var_5_2 = arg_5_0._tf:Find("Panel/Fleet/Indexes")
	local var_5_3 = var_5_2.childCount

	UIItemList.StaticAlign(var_5_2, var_5_2:GetChild(0), var_5_3, function(arg_15_0, arg_15_1, arg_15_2)
		arg_15_1 = arg_15_1 + 1

		if arg_15_0 == UIItemList.EventUpdate then
			if arg_15_1 < var_5_3 then
				setText(arg_15_2:Find("Text"), i18n("series_enemy_fleet_prefix", GetRomanDigit(arg_15_1)))
			else
				setText(arg_15_2:Find("Text"), i18n("formationScene_use_oil_limit_submarine"))
			end

			onToggle(arg_5_0, arg_15_2, function(arg_16_0)
				setActive(arg_15_2:Find("Selected"), arg_16_0)

				local var_16_0, var_16_1 = arg_5_0:GetTextColor()

				setTextColor(arg_15_2:Find("Text"), arg_16_0 and var_16_0 or var_16_1)

				if arg_16_0 then
					local var_16_2 = arg_5_0.contextData.fleets

					arg_5_0.contextData.fleetIndex = var_16_2[arg_15_1] and arg_15_1 or #var_16_2

					arg_5_0:updateEliteFleets()
				end
			end, SFX_PANEL)
		end
	end)
	setText(arg_5_0._tf:Find("Panel/Info/Title/Text"), var_5_0:GetName())
	setText(arg_5_0._tf:Find("Panel/Info/Title/Text/EN"), var_5_0:GetSeriesCode())
	setText(arg_5_0._tf:Find("Panel/Info/Description/Text"), var_5_0:GetDescription())

	local var_5_4 = var_5_0:GetExpeditionIds()
	local var_5_5 = var_5_0:GetBossIcons()
	local var_5_6 = arg_5_0._tf:Find("Panel/Info/Boss")

	UIItemList.StaticAlign(var_5_6, var_5_6:GetChild(0), #var_5_4, function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_17_0 = var_5_4[arg_17_1 + 1]
		local var_17_1 = var_5_5[arg_17_1 + 1][1]
		local var_17_2 = pg.expedition_data_template[var_17_0].level
		local var_17_3 = arg_17_2:Find("shiptpl")
		local var_17_4 = findTF(var_17_3, "icon_bg")
		local var_17_5 = findTF(var_17_3, "icon_bg/frame")

		SetCompomentEnabled(var_17_4, "Image", false)
		SetCompomentEnabled(var_17_5, "Image", false)
		setActive(arg_17_2:Find("shiptpl/icon_bg/lv"), false)

		local var_17_6 = arg_17_2:Find("shiptpl/icon_bg/icon")

		GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_17_1, "", var_17_6)

		local var_17_7 = findTF(var_17_3, "ship_type")

		if var_17_7 then
			setActive(var_17_7, true)
			setImageSprite(var_17_7, GetSpriteFromAtlas("shiptype", shipType2print(var_5_5[arg_17_1 + 1][2])))
		end
	end)

	local function var_5_7(arg_18_0)
		if type(arg_18_0) ~= "table" then
			return {}
		end

		return arg_18_0
	end

	local var_5_8 = var_5_0:GetType() == BossRushSeriesData.TYPE.EXTRA

	setActive(arg_5_0._tf:Find("Panel/Reward/Normal"), not var_5_8)
	setActive(arg_5_0._tf:Find("Panel/Reward/EX"), var_5_8)

	if not var_5_8 then
		local var_5_9 = arg_5_0._tf:Find("Panel/Reward/Normal/Base/Items")
		local var_5_10 = var_5_7(var_5_0:GetPassAwards())

		UIItemList.StaticAlign(var_5_9, var_5_9:GetChild(0), #var_5_10, function(arg_19_0, arg_19_1, arg_19_2)
			if arg_19_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_19_0 = var_5_10[arg_19_1 + 1]
			local var_19_1 = Drop.Create(var_19_0)

			updateDrop(arg_19_2, var_19_1)
			onButton(arg_5_0, arg_19_2, function()
				arg_5_0:ShowDropDetail(var_19_1)
			end, SFX_PANEL)
		end)

		local var_5_11 = arg_5_0.extraAwardTF:Find("Items")
		local var_5_12 = var_5_7(var_5_0:GetAdditionalAwards())

		UIItemList.StaticAlign(var_5_11, var_5_11:GetChild(0), #var_5_12, function(arg_21_0, arg_21_1, arg_21_2)
			if arg_21_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_21_0 = var_5_12[arg_21_1 + 1]
			local var_21_1 = Drop.Create(var_21_0)

			updateDrop(arg_21_2, var_21_1)
			onButton(arg_5_0, arg_21_2, function()
				arg_5_0:ShowDropDetail(var_21_1)
			end, SFX_PANEL)
		end)
	else
		local var_5_13 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_EXTRA_BOSSRUSH_RANK):GetScore()
		local var_5_14 = arg_5_0._tf:Find("Panel/Reward/EX/Title/Text")

		setText(var_5_14, math.floor(var_5_13))
	end

	arg_5_0:updateToggles()
	triggerToggle(arg_5_0.fleetIndexToggles[arg_5_0.contextData.fleetIndex], true)
end

local var_0_1 = {
	[99] = true
}

function var_0_0.ShowDropDetail(arg_23_0, arg_23_1)
	local var_23_0 = Item.getConfigData(arg_23_1.id)

	if var_23_0 and var_0_1[var_23_0.type] then
		local var_23_1 = var_23_0.display_icon
		local var_23_2 = {}

		for iter_23_0, iter_23_1 in ipairs(var_23_1) do
			local var_23_3 = iter_23_1[1]
			local var_23_4 = iter_23_1[2]

			var_23_2[#var_23_2 + 1] = {
				hideName = true,
				type = var_23_3,
				id = var_23_4
			}
		end

		arg_23_0:emit(var_0_0.ON_DROP_LIST, {
			item2Row = true,
			itemList = var_23_2,
			content = var_23_0.display
		})
	else
		arg_23_0:emit(var_0_0.ON_DROP, arg_23_1)
	end
end

function var_0_0.willExit(arg_24_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_24_0._tf)
end

function var_0_0.onCancelHard(arg_25_0)
	arg_25_0:emit(BossRushFleetSelectMediator.ON_UPDATE_CUSTOM_FLEET)
	arg_25_0:closeView()
end

function var_0_0.onBackPressed(arg_26_0)
	arg_26_0:onCancelHard()
	var_0_0.super.onBackPressed(arg_26_0)
end

function var_0_0.setHardShipVOs(arg_27_0, arg_27_1)
	arg_27_0.shipVOs = arg_27_1
end

function var_0_0.initAddButton(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = arg_28_0.contextData.fleets[arg_28_3]:getShipIds()
	local var_28_1 = {}
	local var_28_2 = {}

	for iter_28_0, iter_28_1 in ipairs(var_28_0) do
		var_28_1[arg_28_0.shipVOs[iter_28_1]] = true

		if arg_28_2 == arg_28_0.shipVOs[iter_28_1]:getTeamType() then
			table.insert(var_28_2, iter_28_1)
		end
	end

	local var_28_3 = _.map(var_28_0, function(arg_29_0)
		return arg_28_0.shipVOs[arg_29_0]
	end)

	table.sort(var_28_3, function(arg_30_0, arg_30_1)
		return var_0_0.fleetNames[arg_30_0:getTeamType()] < var_0_0.fleetNames[arg_30_1:getTeamType()] or var_0_0.fleetNames[arg_30_0:getTeamType()] == var_0_0.fleetNames[arg_30_1:getTeamType()] and table.indexof(var_28_0, arg_30_0.id) < table.indexof(var_28_0, arg_30_1.id)
	end)

	local var_28_4 = arg_28_1:GetComponent("ContentSizeFitter")
	local var_28_5 = arg_28_1:GetComponent("HorizontalLayoutGroup")

	var_28_4.enabled = true
	var_28_5.enabled = true
	arg_28_0.isDraging = false

	UIItemList.StaticAlign(arg_28_1, arg_28_1:GetChild(0), 3, function(arg_31_0, arg_31_1, arg_31_2)
		if arg_31_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_31_1 = arg_31_1 + 1

		local var_31_0 = var_28_2[arg_31_1] and arg_28_0.shipVOs[var_28_2[arg_31_1]] or nil

		setActive(arg_31_2:Find("Ship"), var_31_0)
		setActive(arg_31_2:Find("Empty"), not var_31_0)

		local var_31_1 = var_31_0 and arg_31_2:Find("Ship") or arg_31_2:Find("Empty")

		if var_31_0 then
			updateShip(var_31_1, var_31_0)
			setActive(var_31_1:Find("EnergyWarn"), arg_28_0.contextData.mode == BossRushSeriesData.MODE.SINGLE and var_31_0:getEnergy() <= pg.gameset.series_enemy_mood_limit.key_value)
			setActive(var_31_1:Find("event_block"), var_31_0:getFlag("inEvent"))
		end

		setActive(var_31_1:Find("ship_type"), false)

		local var_31_2 = GetOrAddComponent(var_31_1, typeof(UILongPressTrigger))

		var_31_2.onLongPressed:RemoveAllListeners()

		if var_31_0 then
			var_31_2.onLongPressed:AddListener(function()
				arg_28_0:emit(BossRushFleetSelectMediator.ON_FLEET_SHIPINFO, {
					shipId = var_31_0.id,
					shipVOs = var_28_3
				})
			end)
		end

		local var_31_3 = GetOrAddComponent(var_31_1, "EventTriggerListener")

		var_31_3:RemovePointClickFunc()
		var_31_3:AddPointClickFunc(function(arg_33_0, arg_33_1)
			if arg_28_0.isDraging then
				return
			end

			arg_28_0:emit(BossRushFleetSelectMediator.ON_OPEN_DECK, {
				fleet = var_28_1,
				chapter = arg_28_0.chapter,
				shipVO = var_31_0,
				fleetIndex = arg_28_3,
				teamType = arg_28_2
			})
		end)
		var_31_3:RemoveBeginDragFunc()
		var_31_3:RemoveDragFunc()
		var_31_3:RemoveDragEndFunc()
	end)
end

function var_0_0.updateToggles(arg_34_0)
	local var_34_0 = #arg_34_0.contextData.fleets
	local var_34_1 = arg_34_0._tf:Find("Panel/Fleet/Indexes")
	local var_34_2 = var_34_1.childCount

	arg_34_0.fleetIndexToggles = {}

	eachChild(var_34_1, function(arg_35_0, arg_35_1)
		arg_35_1 = arg_35_1 + 1

		setActive(arg_35_0, arg_35_1 == var_34_2 or arg_35_1 < var_34_0)

		if arg_35_1 == var_34_2 then
			arg_34_0.fleetIndexToggles[var_34_0] = arg_35_0
		elseif arg_35_1 < var_34_0 then
			arg_34_0.fleetIndexToggles[arg_35_1] = arg_35_0
		end
	end)
end

function var_0_0.updateEliteFleets(arg_36_0)
	local var_36_0 = arg_36_0.contextData.seriesData
	local var_36_1 = arg_36_0.contextData.fleetIndex
	local var_36_2 = arg_36_0.contextData.fleets[var_36_1]
	local var_36_3 = var_36_1 == #arg_36_0.contextData.fleets

	setActive(arg_36_0._tf:Find("Panel/Fleet/Normal"), not var_36_3)
	setActive(arg_36_0._tf:Find("Panel/Fleet/Submarine"), var_36_3)

	local var_36_4 = arg_36_0.btnClear
	local var_36_5 = arg_36_0.btnRecommend
	local var_36_6 = arg_36_0.commanderList

	if not var_36_3 then
		local var_36_7 = arg_36_0.tfFleets[FleetType.Normal]

		setText(var_36_7:Find("bg/name"), Fleet.DEFAULT_NAME[var_36_1])
		arg_36_0:initAddButton(var_36_7:Find(TeamType.Main), TeamType.Main, var_36_1)
		arg_36_0:initAddButton(var_36_7:Find(TeamType.Vanguard), TeamType.Vanguard, var_36_1)
	else
		local var_36_8 = arg_36_0.tfFleets[FleetType.Submarine]
		local var_36_9 = #arg_36_0.contextData.fleets

		setText(var_36_8:Find("bg/name"), Fleet.DEFAULT_NAME[Fleet.SUBMARINE_FLEET_ID])
		arg_36_0:initAddButton(var_36_8:Find(TeamType.Main), TeamType.Submarine, var_36_9)
	end

	arg_36_0:initCommander(var_36_2, var_36_6)
	setText(arg_36_0.sonarRangeTexts[1], math.floor(var_36_2:GetFleetSonarRange()))

	local var_36_10 = #var_36_2:GetRawShipIds()
	local var_36_11 = var_36_10 == (var_36_3 and 3 or 6)

	onButton(arg_36_0, var_36_4, function()
		if var_36_10 == 0 then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("battle_preCombatLayer_clear_confirm"),
			onYes = function()
				arg_36_0:emit(BossRushFleetSelectMediator.ON_ELITE_CLEAR, {
					index = var_36_1
				})
			end
		})
	end)
	onButton(arg_36_0, var_36_5, function()
		if var_36_11 then
			return
		end

		seriesAsync({
			function(arg_40_0)
				if var_36_10 == 0 then
					return arg_40_0()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("battle_preCombatLayer_auto_confirm"),
					onYes = arg_40_0
				})
			end,
			function(arg_41_0)
				arg_36_0:emit(BossRushFleetSelectMediator.ON_ELITE_RECOMMEND, {
					index = var_36_1
				})
			end
		})
	end)

	local var_36_12 = var_36_0:GetOilLimit()

	setActive(arg_36_0.rtCostLimit, _.any(var_36_12, function(arg_42_0)
		return arg_42_0 > 0
	end))

	if #var_36_12 > 0 then
		local var_36_13 = var_36_3 and "formationScene_use_oil_limit_submarine" or "formationScene_use_oil_limit_surface"
		local var_36_14 = var_36_3 and var_36_12[2] or var_36_12[1]

		setText(arg_36_0.rtCostLimit:Find("Text"), string.format("%s(%d)", i18n(var_36_13), var_36_14))
	end

	local var_36_15 = (function(arg_43_0)
		if type(arg_43_0) ~= "table" then
			return {}
		end

		return arg_43_0
	end)(var_36_0:GetAdditionalAwards())

	setActive(arg_36_0.extraAwardTF, arg_36_0.contextData.mode == BossRushSeriesData.MODE.MULTIPLE and #var_36_15 > 0)

	local var_36_16 = var_36_0:GetExpeditionIds()
	local var_36_17 = arg_36_0._tf:Find("Panel/Info/Boss")

	UIItemList.StaticAlign(var_36_17, var_36_17:GetChild(0), #var_36_16, function(arg_44_0, arg_44_1, arg_44_2)
		if arg_44_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_44_0 = arg_44_1 + 1 == var_36_1 or var_36_1 > #var_36_16 or arg_36_0.contextData.mode == BossRushSeriesData.MODE.SINGLE

		setActive(arg_44_2:Find("Select"), var_44_0)
		setActive(arg_44_2:Find("Image"), var_44_0)
	end)
end

function var_0_0.initCommander(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = arg_45_1:GetRawCommanderIds()

	for iter_45_0 = 1, 2 do
		local var_45_1 = var_45_0[iter_45_0]
		local var_45_2

		if var_45_1 then
			var_45_2 = getProxy(CommanderProxy):getCommanderById(var_45_1)
		end

		local var_45_3 = arg_45_2:Find(iter_45_0)
		local var_45_4 = var_45_3:Find("add")
		local var_45_5 = var_45_3:Find("info")

		setActive(var_45_4, not var_45_2)
		setActive(var_45_5, var_45_2)

		if var_45_2 then
			local var_45_6 = Commander.rarity2Frame(var_45_2:getRarity())

			setImageSprite(var_45_5:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. var_45_6))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. var_45_2:getPainting(), "", var_45_5:Find("mask/icon"))
		end

		onButton(arg_45_0, var_45_4, function()
			arg_45_0:emit(BossRushFleetSelectMediator.OPEN_COMMANDER_PANEL, arg_45_1)
		end, SFX_PANEL)
		onButton(arg_45_0, var_45_5, function()
			arg_45_0:emit(BossRushFleetSelectMediator.OPEN_COMMANDER_PANEL, arg_45_1)
		end, SFX_PANEL)
	end
end

return var_0_0
