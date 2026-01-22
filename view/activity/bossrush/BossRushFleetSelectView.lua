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
		table.Foreach(arg_5_0.modeToggles, function(arg_11_0, arg_11_1)
			triggerToggle(arg_11_1, arg_11_0 == arg_5_0.contextData.mode)
		end)
		table.Foreach(arg_5_0.modeToggles, function(arg_12_0, arg_12_1)
			onToggle(arg_5_0, arg_12_1, function(arg_13_0)
				if not arg_13_0 then
					return
				end

				arg_5_0:emit(BossRushFleetSelectMediator.ON_SWITCH_MODE, arg_12_0)
				arg_5_0:updateToggles()
				triggerToggle(arg_5_0.fleetIndexToggles[arg_5_0.contextData.fleetIndex], true)
			end, SFX_PANEL)
		end)
	end

	local var_5_2 = arg_5_0._tf:Find("Panel/Fleet/Indexes")
	local var_5_3 = var_5_2.childCount

	UIItemList.StaticAlign(var_5_2, var_5_2:GetChild(0), var_5_3, function(arg_14_0, arg_14_1, arg_14_2)
		arg_14_1 = arg_14_1 + 1

		if arg_14_0 == UIItemList.EventUpdate then
			if arg_14_1 < var_5_3 then
				setText(arg_14_2:Find("Text"), i18n("series_enemy_fleet_prefix", GetRomanDigit(arg_14_1)))
			else
				setText(arg_14_2:Find("Text"), i18n("formationScene_use_oil_limit_submarine"))
			end

			onToggle(arg_5_0, arg_14_2, function(arg_15_0)
				setActive(arg_14_2:Find("Selected"), arg_15_0)

				local var_15_0, var_15_1 = arg_5_0:GetTextColor()

				setTextColor(arg_14_2:Find("Text"), arg_15_0 and var_15_0 or var_15_1)

				if arg_15_0 then
					local var_15_2 = arg_5_0.contextData.fleets

					arg_5_0.contextData.fleetIndex = var_15_2[arg_14_1] and arg_14_1 or #var_15_2

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

	UIItemList.StaticAlign(var_5_6, var_5_6:GetChild(0), #var_5_4, function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_16_0 = var_5_4[arg_16_1 + 1]
		local var_16_1 = var_5_5[arg_16_1 + 1][1]
		local var_16_2 = pg.expedition_data_template[var_16_0].level
		local var_16_3 = arg_16_2:Find("shiptpl")
		local var_16_4 = findTF(var_16_3, "icon_bg")
		local var_16_5 = findTF(var_16_3, "icon_bg/frame")

		SetCompomentEnabled(var_16_4, "Image", false)
		SetCompomentEnabled(var_16_5, "Image", false)
		setActive(arg_16_2:Find("shiptpl/icon_bg/lv"), false)

		local var_16_6 = arg_16_2:Find("shiptpl/icon_bg/icon")

		GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_16_1, "", var_16_6)

		local var_16_7 = findTF(var_16_3, "ship_type")

		if var_16_7 then
			setActive(var_16_7, true)
			setImageSprite(var_16_7, GetSpriteFromAtlas("shiptype", shipType2print(var_5_5[arg_16_1 + 1][2])))
		end
	end)

	local function var_5_7(arg_17_0)
		if type(arg_17_0) ~= "table" then
			return {}
		end

		return arg_17_0
	end

	local var_5_8 = var_5_0:GetType() == BossRushSeriesData.TYPE.EXTRA

	setActive(arg_5_0._tf:Find("Panel/Reward/Normal"), not var_5_8)
	setActive(arg_5_0._tf:Find("Panel/Reward/EX"), var_5_8)

	if not var_5_8 then
		local var_5_9 = arg_5_0._tf:Find("Panel/Reward/Normal/Base/Items")
		local var_5_10 = var_5_7(var_5_0:GetPassAwards())

		UIItemList.StaticAlign(var_5_9, var_5_9:GetChild(0), #var_5_10, function(arg_18_0, arg_18_1, arg_18_2)
			if arg_18_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_18_0 = var_5_10[arg_18_1 + 1]
			local var_18_1 = Drop.Create(var_18_0)

			updateDrop(arg_18_2, var_18_1)
			onButton(arg_5_0, arg_18_2, function()
				arg_5_0:ShowDropDetail(var_18_1)
			end, SFX_PANEL)
		end)

		local var_5_11 = arg_5_0.extraAwardTF:Find("Items")
		local var_5_12 = var_5_7(var_5_0:GetAdditionalAwards())

		UIItemList.StaticAlign(var_5_11, var_5_11:GetChild(0), #var_5_12, function(arg_20_0, arg_20_1, arg_20_2)
			if arg_20_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_20_0 = var_5_12[arg_20_1 + 1]
			local var_20_1 = Drop.Create(var_20_0)

			updateDrop(arg_20_2, var_20_1)
			onButton(arg_5_0, arg_20_2, function()
				arg_5_0:ShowDropDetail(var_20_1)
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

function var_0_0.ShowDropDetail(arg_22_0, arg_22_1)
	local var_22_0 = Item.getConfigData(arg_22_1.id)

	if var_22_0 and var_0_1[var_22_0.type] then
		local var_22_1 = var_22_0.display_icon
		local var_22_2 = {}

		for iter_22_0, iter_22_1 in ipairs(var_22_1) do
			local var_22_3 = iter_22_1[1]
			local var_22_4 = iter_22_1[2]

			var_22_2[#var_22_2 + 1] = {
				hideName = true,
				type = var_22_3,
				id = var_22_4
			}
		end

		arg_22_0:emit(var_0_0.ON_DROP_LIST, {
			item2Row = true,
			itemList = var_22_2,
			content = var_22_0.display
		})
	else
		arg_22_0:emit(var_0_0.ON_DROP, arg_22_1)
	end
end

function var_0_0.willExit(arg_23_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_23_0._tf)
end

function var_0_0.onCancelHard(arg_24_0)
	arg_24_0:emit(BossRushFleetSelectMediator.ON_UPDATE_CUSTOM_FLEET)
	arg_24_0:closeView()
end

function var_0_0.onBackPressed(arg_25_0)
	arg_25_0:onCancelHard()
	var_0_0.super.onBackPressed(arg_25_0)
end

function var_0_0.setHardShipVOs(arg_26_0, arg_26_1)
	arg_26_0.shipVOs = arg_26_1
end

function var_0_0.initAddButton(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = arg_27_0.contextData.fleets[arg_27_3]:getShipIds()
	local var_27_1 = {}
	local var_27_2 = {}

	for iter_27_0, iter_27_1 in ipairs(var_27_0) do
		var_27_1[arg_27_0.shipVOs[iter_27_1]] = true

		if arg_27_2 == arg_27_0.shipVOs[iter_27_1]:getTeamType() then
			table.insert(var_27_2, iter_27_1)
		end
	end

	local var_27_3 = _.map(var_27_0, function(arg_28_0)
		return arg_27_0.shipVOs[arg_28_0]
	end)

	table.sort(var_27_3, function(arg_29_0, arg_29_1)
		return var_0_0.fleetNames[arg_29_0:getTeamType()] < var_0_0.fleetNames[arg_29_1:getTeamType()] or var_0_0.fleetNames[arg_29_0:getTeamType()] == var_0_0.fleetNames[arg_29_1:getTeamType()] and table.indexof(var_27_0, arg_29_0.id) < table.indexof(var_27_0, arg_29_1.id)
	end)

	local var_27_4 = arg_27_1:GetComponent("ContentSizeFitter")
	local var_27_5 = arg_27_1:GetComponent("HorizontalLayoutGroup")

	var_27_4.enabled = true
	var_27_5.enabled = true
	arg_27_0.isDraging = false

	UIItemList.StaticAlign(arg_27_1, arg_27_1:GetChild(0), 3, function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_30_1 = arg_30_1 + 1

		local var_30_0 = var_27_2[arg_30_1] and arg_27_0.shipVOs[var_27_2[arg_30_1]] or nil

		setActive(arg_30_2:Find("Ship"), var_30_0)
		setActive(arg_30_2:Find("Empty"), not var_30_0)

		local var_30_1 = var_30_0 and arg_30_2:Find("Ship") or arg_30_2:Find("Empty")

		if var_30_0 then
			updateShip(var_30_1, var_30_0)
			setActive(var_30_1:Find("EnergyWarn"), arg_27_0.contextData.mode == BossRushSeriesData.MODE.SINGLE and var_30_0:getEnergy() <= pg.gameset.series_enemy_mood_limit.key_value)
			setActive(var_30_1:Find("event_block"), var_30_0:getFlag("inEvent"))
		end

		setActive(var_30_1:Find("ship_type"), false)

		local var_30_2 = GetOrAddComponent(var_30_1, typeof(UILongPressTrigger))

		var_30_2.onLongPressed:RemoveAllListeners()

		if var_30_0 then
			var_30_2.onLongPressed:AddListener(function()
				arg_27_0:emit(BossRushFleetSelectMediator.ON_FLEET_SHIPINFO, {
					shipId = var_30_0.id,
					shipVOs = var_27_3
				})
			end)
		end

		local var_30_3 = GetOrAddComponent(var_30_1, "EventTriggerListener")

		var_30_3:RemovePointClickFunc()
		var_30_3:AddPointClickFunc(function(arg_32_0, arg_32_1)
			if arg_27_0.isDraging then
				return
			end

			arg_27_0:emit(BossRushFleetSelectMediator.ON_OPEN_DECK, {
				fleet = var_27_1,
				chapter = arg_27_0.chapter,
				shipVO = var_30_0,
				fleetIndex = arg_27_3,
				teamType = arg_27_2
			})
		end)
		var_30_3:RemoveBeginDragFunc()
		var_30_3:RemoveDragFunc()
		var_30_3:RemoveDragEndFunc()
	end)
end

function var_0_0.updateToggles(arg_33_0)
	local var_33_0 = #arg_33_0.contextData.fleets
	local var_33_1 = arg_33_0._tf:Find("Panel/Fleet/Indexes")
	local var_33_2 = var_33_1.childCount

	arg_33_0.fleetIndexToggles = {}

	eachChild(var_33_1, function(arg_34_0, arg_34_1)
		arg_34_1 = arg_34_1 + 1

		setActive(arg_34_0, arg_34_1 == var_33_2 or arg_34_1 < var_33_0)

		if arg_34_1 == var_33_2 then
			arg_33_0.fleetIndexToggles[var_33_0] = arg_34_0
		elseif arg_34_1 < var_33_0 then
			arg_33_0.fleetIndexToggles[arg_34_1] = arg_34_0
		end
	end)
end

function var_0_0.updateEliteFleets(arg_35_0)
	local var_35_0 = arg_35_0.contextData.seriesData
	local var_35_1 = arg_35_0.contextData.fleetIndex
	local var_35_2 = arg_35_0.contextData.fleets[var_35_1]
	local var_35_3 = var_35_1 == #arg_35_0.contextData.fleets

	setActive(arg_35_0._tf:Find("Panel/Fleet/Normal"), not var_35_3)
	setActive(arg_35_0._tf:Find("Panel/Fleet/Submarine"), var_35_3)

	local var_35_4 = arg_35_0.btnClear
	local var_35_5 = arg_35_0.btnRecommend
	local var_35_6 = arg_35_0.commanderList

	if not var_35_3 then
		local var_35_7 = arg_35_0.tfFleets[FleetType.Normal]

		setText(var_35_7:Find("bg/name"), Fleet.DEFAULT_NAME[var_35_1])
		arg_35_0:initAddButton(var_35_7:Find(TeamType.Main), TeamType.Main, var_35_1)
		arg_35_0:initAddButton(var_35_7:Find(TeamType.Vanguard), TeamType.Vanguard, var_35_1)
	else
		local var_35_8 = arg_35_0.tfFleets[FleetType.Submarine]
		local var_35_9 = #arg_35_0.contextData.fleets

		setText(var_35_8:Find("bg/name"), Fleet.DEFAULT_NAME[Fleet.SUBMARINE_FLEET_ID])
		arg_35_0:initAddButton(var_35_8:Find(TeamType.Main), TeamType.Submarine, var_35_9)
	end

	arg_35_0:initCommander(var_35_2, var_35_6)
	setText(arg_35_0.sonarRangeTexts[1], math.floor(var_35_2:GetFleetSonarRange()))

	local var_35_10 = #var_35_2:GetRawShipIds()
	local var_35_11 = var_35_10 == (var_35_3 and 3 or 6)

	onButton(arg_35_0, var_35_4, function()
		if var_35_10 == 0 then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("battle_preCombatLayer_clear_confirm"),
			onYes = function()
				arg_35_0:emit(BossRushFleetSelectMediator.ON_ELITE_CLEAR, {
					index = var_35_1
				})
			end
		})
	end)
	onButton(arg_35_0, var_35_5, function()
		if var_35_11 then
			return
		end

		seriesAsync({
			function(arg_39_0)
				if var_35_10 == 0 then
					return arg_39_0()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("battle_preCombatLayer_auto_confirm"),
					onYes = arg_39_0
				})
			end,
			function(arg_40_0)
				arg_35_0:emit(BossRushFleetSelectMediator.ON_ELITE_RECOMMEND, {
					index = var_35_1
				})
			end
		})
	end)

	local var_35_12 = var_35_0:GetOilLimit()

	setActive(arg_35_0.rtCostLimit, _.any(var_35_12, function(arg_41_0)
		return arg_41_0 > 0
	end))

	if #var_35_12 > 0 then
		local var_35_13 = var_35_3 and "formationScene_use_oil_limit_submarine" or "formationScene_use_oil_limit_surface"
		local var_35_14 = var_35_3 and var_35_12[2] or var_35_12[1]

		setText(arg_35_0.rtCostLimit:Find("Text"), string.format("%s(%d)", i18n(var_35_13), var_35_14))
	end

	local var_35_15 = (function(arg_42_0)
		if type(arg_42_0) ~= "table" then
			return {}
		end

		return arg_42_0
	end)(var_35_0:GetAdditionalAwards())

	setActive(arg_35_0.extraAwardTF, arg_35_0.contextData.mode == BossRushSeriesData.MODE.MULTIPLE and #var_35_15 > 0)

	local var_35_16 = var_35_0:GetExpeditionIds()
	local var_35_17 = arg_35_0._tf:Find("Panel/Info/Boss")

	UIItemList.StaticAlign(var_35_17, var_35_17:GetChild(0), #var_35_16, function(arg_43_0, arg_43_1, arg_43_2)
		if arg_43_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_43_0 = arg_43_1 + 1 == var_35_1 or var_35_1 > #var_35_16 or arg_35_0.contextData.mode == BossRushSeriesData.MODE.SINGLE

		setActive(arg_43_2:Find("Select"), var_43_0)
		setActive(arg_43_2:Find("Image"), var_43_0)
	end)
end

function var_0_0.initCommander(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_1:GetRawCommanderIds()

	for iter_44_0 = 1, 2 do
		local var_44_1 = var_44_0[iter_44_0]
		local var_44_2

		if var_44_1 then
			var_44_2 = getProxy(CommanderProxy):getCommanderById(var_44_1)
		end

		local var_44_3 = arg_44_2:Find(iter_44_0)
		local var_44_4 = var_44_3:Find("add")
		local var_44_5 = var_44_3:Find("info")

		setActive(var_44_4, not var_44_2)
		setActive(var_44_5, var_44_2)

		if var_44_2 then
			local var_44_6 = Commander.rarity2Frame(var_44_2:getRarity())

			setImageSprite(var_44_5:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. var_44_6))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. var_44_2:getPainting(), "", var_44_5:Find("mask/icon"))
		end

		onButton(arg_44_0, var_44_4, function()
			arg_44_0:emit(BossRushFleetSelectMediator.OPEN_COMMANDER_PANEL, arg_44_1)
		end, SFX_PANEL)
		onButton(arg_44_0, var_44_5, function()
			arg_44_0:emit(BossRushFleetSelectMediator.OPEN_COMMANDER_PANEL, arg_44_1)
		end, SFX_PANEL)
	end
end

return var_0_0
