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
	arg_4_0.fleetIndexToggles = _.map(_.range(var_4_0:Find("Fleet/Indexes").childCount), function(arg_5_0)
		return var_4_0:Find("Fleet/Indexes"):GetChild(arg_5_0 - 1)
	end)
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
	table.Foreach(arg_4_0.fleetIndexToggles, function(arg_6_0, arg_6_1)
		if arg_6_0 >= #arg_4_0.fleetIndexToggles then
			setText(arg_6_1:Find("Text"), i18n("formationScene_use_oil_limit_submarine"))
		else
			setText(arg_6_1:Find("Text"), i18n("series_enemy_fleet_prefix", GetRomanDigit(arg_6_0)))
		end
	end)
	setText(arg_4_0._tf:Find("Panel/Fleet/Normal/main/Item/Ship/EnergyWarn/Text"), i18n("series_enemy_mood"))
	setText(arg_4_0._tf:Find("Panel/Fleet/Normal/vanguard/Item/Ship/EnergyWarn/Text"), i18n("series_enemy_mood"))
	setText(arg_4_0._tf:Find("Panel/Fleet/Submarine/submarine/Item/Ship/EnergyWarn/Text"), i18n("series_enemy_mood"))
end

function var_0_0.didEnter(arg_7_0)
	local var_7_0 = arg_7_0.contextData.seriesData

	onButton(arg_7_0, arg_7_0.btnGo, function()
		for iter_8_0 = 1, #arg_7_0.contextData.fleets - 1 do
			if arg_7_0.contextData.fleets[iter_8_0]:isLegalToFight() ~= true then
				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_team_notenough"))

				return
			end
		end

		if _.any(arg_7_0.contextData.fleets, function(arg_9_0)
			local var_9_0, var_9_1 = arg_9_0:HaveShipsInEvent()

			if var_9_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_9_1)

				return true
			end
		end) then
			return
		end

		arg_7_0:emit(BossRushFleetSelectMediator.ON_PRECOMBAT)
	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(arg_7_0, arg_7_0.sonarRangeContainer, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.fleet_antisub_range_tip.tip
		})
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.btnBack, function()
		arg_7_0:onCancelHard()
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0._tf:Find("BG"), function()
		arg_7_0:onCancelHard()
	end, SFX_CANCEL)

	local var_7_1 = var_7_0:IsSingleFight()

	setActive(arg_7_0.modeToggles[1].parent, var_7_1)

	if var_7_1 then
		table.Foreach(arg_7_0.modeToggles, function(arg_13_0, arg_13_1)
			triggerToggle(arg_13_1, arg_13_0 == arg_7_0.contextData.mode)
		end)
		table.Foreach(arg_7_0.modeToggles, function(arg_14_0, arg_14_1)
			onToggle(arg_7_0, arg_14_1, function(arg_15_0)
				if not arg_15_0 then
					return
				end

				arg_7_0:emit(BossRushFleetSelectMediator.ON_SWITCH_MODE, arg_14_0)
				table.Foreach(arg_7_0.fleetIndexToggles, function(arg_16_0, arg_16_1)
					triggerToggle(arg_16_1, arg_16_0 == arg_7_0.contextData.fleetIndex)
				end)
			end, SFX_PANEL)
		end)
	end

	local var_7_2 = #arg_7_0.contextData.fullFleets

	table.Foreach(arg_7_0.fleetIndexToggles, function(arg_17_0, arg_17_1)
		setActive(arg_17_1, arg_17_0 <= var_7_2 - 1 or arg_17_0 == #arg_7_0.fleetIndexToggles)
	end)

	for iter_7_0 = #arg_7_0.fleetIndexToggles - 1, var_7_2, -1 do
		table.remove(arg_7_0.fleetIndexToggles, iter_7_0)
	end

	local function var_7_3(arg_18_0, arg_18_1)
		setActive(arg_18_0:Find("Selected"), arg_18_1)

		local var_18_0, var_18_1 = arg_7_0:GetTextColor()

		setTextColor(arg_18_0:Find("Text"), arg_18_1 and var_18_0 or var_18_1)
	end

	table.Foreach(arg_7_0.fleetIndexToggles, function(arg_19_0, arg_19_1)
		onToggle(arg_7_0, arg_19_1, function(arg_20_0)
			var_7_3(arg_19_1, arg_20_0)
		end)
	end)
	table.Foreach(arg_7_0.fleetIndexToggles, function(arg_21_0, arg_21_1)
		triggerToggle(arg_21_1, arg_21_0 == arg_7_0.contextData.fleetIndex)
	end)
	table.Foreach(arg_7_0.fleetIndexToggles, function(arg_22_0, arg_22_1)
		onToggle(arg_7_0, arg_22_1, function(arg_23_0)
			var_7_3(arg_22_1, arg_23_0)

			if not arg_23_0 then
				return
			end

			if arg_22_0 == #arg_7_0.fleetIndexToggles then
				arg_7_0.contextData.fleetIndex = #arg_7_0.contextData.fleets
			else
				arg_7_0.contextData.fleetIndex = arg_22_0
			end

			arg_7_0:updateEliteFleets()
		end, SFX_PANEL)
	end)
	setText(arg_7_0._tf:Find("Panel/Info/Title/Text"), var_7_0:GetName())
	setText(arg_7_0._tf:Find("Panel/Info/Title/Text/EN"), var_7_0:GetSeriesCode())
	setText(arg_7_0._tf:Find("Panel/Info/Description/Text"), var_7_0:GetDescription())

	local var_7_4 = var_7_0:GetExpeditionIds()
	local var_7_5 = var_7_0:GetBossIcons()
	local var_7_6 = arg_7_0._tf:Find("Panel/Info/Boss")

	UIItemList.StaticAlign(var_7_6, var_7_6:GetChild(0), #var_7_4, function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_24_0 = var_7_4[arg_24_1 + 1]
		local var_24_1 = var_7_5[arg_24_1 + 1][1]
		local var_24_2 = pg.expedition_data_template[var_24_0].level
		local var_24_3 = arg_24_2:Find("shiptpl")
		local var_24_4 = findTF(var_24_3, "icon_bg")
		local var_24_5 = findTF(var_24_3, "icon_bg/frame")

		SetCompomentEnabled(var_24_4, "Image", false)
		SetCompomentEnabled(var_24_5, "Image", false)
		setActive(arg_24_2:Find("shiptpl/icon_bg/lv"), false)

		local var_24_6 = arg_24_2:Find("shiptpl/icon_bg/icon")

		GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_24_1, "", var_24_6)

		local var_24_7 = findTF(var_24_3, "ship_type")

		if var_24_7 then
			setActive(var_24_7, true)
			setImageSprite(var_24_7, GetSpriteFromAtlas("shiptype", shipType2print(var_7_5[arg_24_1 + 1][2])))
		end
	end)

	local function var_7_7(arg_25_0)
		if type(arg_25_0) ~= "table" then
			return {}
		end

		return arg_25_0
	end

	local var_7_8 = var_7_0:GetType() == BossRushSeriesData.TYPE.EXTRA

	setActive(arg_7_0._tf:Find("Panel/Reward/Normal"), not var_7_8)
	setActive(arg_7_0._tf:Find("Panel/Reward/EX"), var_7_8)

	if not var_7_8 then
		local var_7_9 = arg_7_0._tf:Find("Panel/Reward/Normal/Base/Items")
		local var_7_10 = var_7_7(var_7_0:GetPassAwards())

		UIItemList.StaticAlign(var_7_9, var_7_9:GetChild(0), #var_7_10, function(arg_26_0, arg_26_1, arg_26_2)
			if arg_26_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_26_0 = var_7_10[arg_26_1 + 1]
			local var_26_1 = Drop.Create(var_26_0)

			updateDrop(arg_26_2, var_26_1)
			onButton(arg_7_0, arg_26_2, function()
				arg_7_0:ShowDropDetail(var_26_1)
			end, SFX_PANEL)
		end)

		local var_7_11 = arg_7_0.extraAwardTF:Find("Items")
		local var_7_12 = var_7_7(var_7_0:GetAdditionalAwards())

		UIItemList.StaticAlign(var_7_11, var_7_11:GetChild(0), #var_7_12, function(arg_28_0, arg_28_1, arg_28_2)
			if arg_28_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_28_0 = var_7_12[arg_28_1 + 1]
			local var_28_1 = Drop.Create(var_28_0)

			updateDrop(arg_28_2, var_28_1)
			onButton(arg_7_0, arg_28_2, function()
				arg_7_0:ShowDropDetail(var_28_1)
			end, SFX_PANEL)
		end)
	else
		local var_7_13 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_EXTRA_BOSSRUSH_RANK):GetScore()
		local var_7_14 = arg_7_0._tf:Find("Panel/Reward/EX/Title/Text")

		setText(var_7_14, math.floor(var_7_13))
	end

	arg_7_0:updateEliteFleets()
end

local var_0_1 = {
	[99] = true
}

function var_0_0.ShowDropDetail(arg_30_0, arg_30_1)
	local var_30_0 = Item.getConfigData(arg_30_1.id)

	if var_30_0 and var_0_1[var_30_0.type] then
		local var_30_1 = var_30_0.display_icon
		local var_30_2 = {}

		for iter_30_0, iter_30_1 in ipairs(var_30_1) do
			local var_30_3 = iter_30_1[1]
			local var_30_4 = iter_30_1[2]

			var_30_2[#var_30_2 + 1] = {
				hideName = true,
				type = var_30_3,
				id = var_30_4
			}
		end

		arg_30_0:emit(var_0_0.ON_DROP_LIST, {
			item2Row = true,
			itemList = var_30_2,
			content = var_30_0.display
		})
	else
		arg_30_0:emit(var_0_0.ON_DROP, arg_30_1)
	end
end

function var_0_0.willExit(arg_31_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_31_0._tf)
end

function var_0_0.onCancelHard(arg_32_0)
	arg_32_0:emit(BossRushFleetSelectMediator.ON_UPDATE_CUSTOM_FLEET)
	arg_32_0:closeView()
end

function var_0_0.onBackPressed(arg_33_0)
	arg_33_0:onCancelHard()
	var_0_0.super.onBackPressed(arg_33_0)
end

function var_0_0.setHardShipVOs(arg_34_0, arg_34_1)
	arg_34_0.shipVOs = arg_34_1
end

function var_0_0.initAddButton(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	local var_35_0 = arg_35_0.contextData.fleets[arg_35_3]:getShipIds()
	local var_35_1 = {}
	local var_35_2 = {}

	for iter_35_0, iter_35_1 in ipairs(var_35_0) do
		var_35_1[arg_35_0.shipVOs[iter_35_1]] = true

		if arg_35_2 == arg_35_0.shipVOs[iter_35_1]:getTeamType() then
			table.insert(var_35_2, iter_35_1)
		end
	end

	local var_35_3 = _.map(var_35_0, function(arg_36_0)
		return arg_35_0.shipVOs[arg_36_0]
	end)

	table.sort(var_35_3, function(arg_37_0, arg_37_1)
		return var_0_0.fleetNames[arg_37_0:getTeamType()] < var_0_0.fleetNames[arg_37_1:getTeamType()] or var_0_0.fleetNames[arg_37_0:getTeamType()] == var_0_0.fleetNames[arg_37_1:getTeamType()] and table.indexof(var_35_0, arg_37_0.id) < table.indexof(var_35_0, arg_37_1.id)
	end)

	local var_35_4 = findTF(arg_35_1, arg_35_2)
	local var_35_5 = var_35_4:GetComponent("ContentSizeFitter")
	local var_35_6 = var_35_4:GetComponent("HorizontalLayoutGroup")

	var_35_5.enabled = true
	var_35_6.enabled = true
	arg_35_0.isDraging = false

	UIItemList.StaticAlign(var_35_4, var_35_4:GetChild(0), 3, function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_38_1 = arg_38_1 + 1

		local var_38_0 = var_35_2[arg_38_1] and arg_35_0.shipVOs[var_35_2[arg_38_1]] or nil

		setActive(arg_38_2:Find("Ship"), var_38_0)
		setActive(arg_38_2:Find("Empty"), not var_38_0)

		local var_38_1 = var_38_0 and arg_38_2:Find("Ship") or arg_38_2:Find("Empty")

		if var_38_0 then
			updateShip(var_38_1, var_38_0)
			setActive(var_38_1:Find("EnergyWarn"), arg_35_0.contextData.mode == BossRushSeriesData.MODE.SINGLE and var_38_0:getEnergy() <= pg.gameset.series_enemy_mood_limit.key_value)
			setActive(var_38_1:Find("event_block"), var_38_0:getFlag("inEvent"))
		end

		setActive(var_38_1:Find("ship_type"), false)

		local var_38_2 = GetOrAddComponent(var_38_1, typeof(UILongPressTrigger))

		var_38_2.onLongPressed:RemoveAllListeners()

		if var_38_0 then
			var_38_2.onLongPressed:AddListener(function()
				arg_35_0:emit(BossRushFleetSelectMediator.ON_FLEET_SHIPINFO, {
					shipId = var_38_0.id,
					shipVOs = var_35_3
				})
			end)
		end

		local var_38_3 = GetOrAddComponent(var_38_1, "EventTriggerListener")

		var_38_3:RemovePointClickFunc()
		var_38_3:AddPointClickFunc(function(arg_40_0, arg_40_1)
			if arg_35_0.isDraging then
				return
			end

			arg_35_0:emit(BossRushFleetSelectMediator.ON_OPEN_DECK, {
				fleet = var_35_1,
				chapter = arg_35_0.chapter,
				shipVO = var_38_0,
				fleetIndex = arg_35_3,
				teamType = arg_35_2
			})
		end)
		var_38_3:RemoveBeginDragFunc()
		var_38_3:RemoveDragFunc()
		var_38_3:RemoveDragEndFunc()
	end)
end

function var_0_0.updateEliteFleets(arg_41_0)
	local var_41_0 = arg_41_0.contextData.seriesData
	local var_41_1 = arg_41_0.contextData.fleetIndex
	local var_41_2 = arg_41_0.contextData.fleets[var_41_1]
	local var_41_3 = var_41_1 == #arg_41_0.contextData.fleets

	setActive(arg_41_0._tf:Find("Panel/Fleet/Normal"), not var_41_3)
	setActive(arg_41_0._tf:Find("Panel/Fleet/Submarine"), var_41_3)

	local var_41_4 = #arg_41_0.contextData.fleets

	table.Foreach(arg_41_0.fleetIndexToggles, function(arg_42_0, arg_42_1)
		setActive(arg_42_1, arg_42_0 <= var_41_4 - 1 or arg_42_0 == #arg_41_0.fleetIndexToggles)
	end)

	local var_41_5 = arg_41_0.btnClear
	local var_41_6 = arg_41_0.btnRecommend
	local var_41_7 = arg_41_0.commanderList

	if not var_41_3 then
		local var_41_8 = arg_41_0.tfFleets[FleetType.Normal]

		setText(var_41_8:Find("bg/name"), Fleet.DEFAULT_NAME[var_41_1])
		arg_41_0:initAddButton(var_41_8, TeamType.Main, var_41_1)
		arg_41_0:initAddButton(var_41_8, TeamType.Vanguard, var_41_1)
	else
		local var_41_9 = arg_41_0.tfFleets[FleetType.Submarine]
		local var_41_10 = #arg_41_0.contextData.fleets

		setText(var_41_9:Find("bg/name"), Fleet.DEFAULT_NAME[Fleet.SUBMARINE_FLEET_ID])
		arg_41_0:initAddButton(var_41_9, TeamType.Submarine, var_41_10)
	end

	arg_41_0:initCommander(var_41_2, var_41_7)
	setText(arg_41_0.sonarRangeTexts[1], math.floor(var_41_2:GetFleetSonarRange()))

	local var_41_11 = #var_41_2:GetRawShipIds()
	local var_41_12 = var_41_11 == (var_41_3 and 3 or 6)

	onButton(arg_41_0, var_41_5, function()
		if var_41_11 == 0 then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("battle_preCombatLayer_clear_confirm"),
			onYes = function()
				arg_41_0:emit(BossRushFleetSelectMediator.ON_ELITE_CLEAR, {
					index = var_41_1
				})
			end
		})
	end)
	onButton(arg_41_0, var_41_6, function()
		if var_41_12 then
			return
		end

		seriesAsync({
			function(arg_46_0)
				if var_41_11 == 0 then
					return arg_46_0()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("battle_preCombatLayer_auto_confirm"),
					onYes = arg_46_0
				})
			end,
			function(arg_47_0)
				arg_41_0:emit(BossRushFleetSelectMediator.ON_ELITE_RECOMMEND, {
					index = var_41_1
				})
			end
		})
	end)

	local var_41_13 = var_41_0:GetOilLimit()

	setActive(arg_41_0.rtCostLimit, _.any(var_41_13, function(arg_48_0)
		return arg_48_0 > 0
	end))

	if #var_41_13 > 0 then
		local var_41_14 = var_41_3 and "formationScene_use_oil_limit_submarine" or "formationScene_use_oil_limit_surface"
		local var_41_15 = var_41_3 and var_41_13[2] or var_41_13[1]

		setText(arg_41_0.rtCostLimit:Find("Text"), string.format("%s(%d)", i18n(var_41_14), var_41_15))
	end

	local var_41_16 = (function(arg_49_0)
		if type(arg_49_0) ~= "table" then
			return {}
		end

		return arg_49_0
	end)(var_41_0:GetAdditionalAwards())

	setActive(arg_41_0.extraAwardTF, arg_41_0.contextData.mode == BossRushSeriesData.MODE.MULTIPLE and #var_41_16 > 0)

	local var_41_17 = var_41_0:GetExpeditionIds()
	local var_41_18 = arg_41_0._tf:Find("Panel/Info/Boss")

	UIItemList.StaticAlign(var_41_18, var_41_18:GetChild(0), #var_41_17, function(arg_50_0, arg_50_1, arg_50_2)
		if arg_50_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_50_0 = arg_50_1 + 1 == var_41_1 or var_41_1 > #var_41_17 or arg_41_0.contextData.mode == BossRushSeriesData.MODE.SINGLE

		setActive(arg_50_2:Find("Select"), var_50_0)
		setActive(arg_50_2:Find("Image"), var_50_0)
	end)
end

function var_0_0.initCommander(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_1:GetRawCommanderIds()

	for iter_51_0 = 1, 2 do
		local var_51_1 = var_51_0[iter_51_0]
		local var_51_2

		if var_51_1 then
			var_51_2 = getProxy(CommanderProxy):getCommanderById(var_51_1)
		end

		local var_51_3 = arg_51_2:Find(iter_51_0)
		local var_51_4 = var_51_3:Find("add")
		local var_51_5 = var_51_3:Find("info")

		setActive(var_51_4, not var_51_2)
		setActive(var_51_5, var_51_2)

		if var_51_2 then
			local var_51_6 = Commander.rarity2Frame(var_51_2:getRarity())

			setImageSprite(var_51_5:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. var_51_6))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. var_51_2:getPainting(), "", var_51_5:Find("mask/icon"))
		end

		onButton(arg_51_0, var_51_4, function()
			arg_51_0:emit(BossRushFleetSelectMediator.OPEN_COMMANDER_PANEL, arg_51_1)
		end, SFX_PANEL)
		onButton(arg_51_0, var_51_5, function()
			arg_51_0:emit(BossRushFleetSelectMediator.OPEN_COMMANDER_PANEL, arg_51_1)
		end, SFX_PANEL)
	end
end

return var_0_0
