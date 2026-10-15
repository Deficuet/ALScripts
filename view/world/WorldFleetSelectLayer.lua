local var_0_0 = class("WorldFleetSelectLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "WorldFleetSelect"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"weaponframes",
		"shiptype"
	}

	table.insertto(var_2_0, arg_2_0:getFleetSelectResList(arg_2_0.contextData.fleets))

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.insertFleetSelectRes(arg_3_0, arg_3_1, arg_3_2)
	if noEmptyStr(arg_3_2) and not table.contains(arg_3_1, arg_3_2) then
		table.insert(arg_3_1, arg_3_2)
	end
end

function var_0_0.insertFleetSelectPrefixRes(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if noEmptyStr(arg_4_3) then
		arg_4_0:insertFleetSelectRes(arg_4_1, arg_4_2 .. arg_4_3)
	end
end

function var_0_0.getShipIconResList(arg_5_0, arg_5_1)
	local var_5_0 = {}
	local var_5_1 = getProxy(BayProxy)

	for iter_5_0, iter_5_1 in pairs(arg_5_1 or {}) do
		for iter_5_2, iter_5_3 in ipairs(iter_5_1) do
			for iter_5_4, iter_5_5 in ipairs({
				TeamType.Main,
				TeamType.Vanguard,
				TeamType.Submarine
			}) do
				for iter_5_6, iter_5_7 in pairs(iter_5_3[iter_5_5] or {}) do
					local var_5_2 = var_5_1:getShipById(iter_5_7)

					if var_5_2 then
						arg_5_0:insertFleetSelectPrefixRes(var_5_0, "SquareIcon/", var_5_2:getPainting())
					end
				end
			end
		end
	end

	return var_5_0
end

function var_0_0.getCommanderIconResList(arg_6_0, arg_6_1)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_1 or {}) do
		for iter_6_2, iter_6_3 in ipairs(iter_6_1) do
			local var_6_1 = Fleet.New({
				ship_list = {},
				commanders = iter_6_3.commanders
			})

			for iter_6_4, iter_6_5 in pairs(var_6_1:getCommanders()) do
				arg_6_0:insertFleetSelectPrefixRes(var_6_0, "CommanderHrz/", iter_6_5:getPainting())
			end
		end
	end

	return var_6_0
end

function var_0_0.getFleetSelectResList(arg_7_0, arg_7_1)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_0:getShipIconResList(arg_7_1)) do
		arg_7_0:insertFleetSelectRes(var_7_0, iter_7_1)
	end

	for iter_7_2, iter_7_3 in ipairs(arg_7_0:getCommanderIconResList(arg_7_1)) do
		arg_7_0:insertFleetSelectRes(var_7_0, iter_7_3)
	end

	return var_7_0
end

function var_0_0.downloadFleetSelectResList(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0:getFleetSelectResList(arg_8_1)

	SplitPackConst.DownloadByLuaArr(var_8_0, function()
		if arg_8_0.exited then
			return
		end

		return existCall(arg_8_2)
	end)
end

function var_0_0.init(arg_10_0)
	arg_10_0.rtBg = arg_10_0._tf:Find("bg")

	local var_10_0 = nowWorld():GetRealm()

	eachChild(arg_10_0.rtBg, function(arg_11_0)
		setActive(arg_11_0, arg_11_0.name == tostring(var_10_0))
	end)

	arg_10_0.rtPanel = arg_10_0._tf:Find("panel")
	arg_10_0.rtShipTpl = arg_10_0.rtPanel:Find("shiptpl")

	setActive(arg_10_0.rtShipTpl, false)

	arg_10_0.rtEmptyTpl = arg_10_0.rtPanel:Find("emptytpl")

	setActive(arg_10_0.rtEmptyTpl, false)

	arg_10_0.rtScroll = arg_10_0.rtPanel:Find("bg")
	arg_10_0.rtContent = arg_10_0.rtScroll:Find("content")
	arg_10_0.rtFleets = {
		[FleetType.Normal] = arg_10_0.rtContent:Find("fleet"),
		[FleetType.Submarine] = arg_10_0.rtContent:Find("sub")
	}
	arg_10_0.btnBack = arg_10_0.rtPanel:Find("btnBack")
	arg_10_0.btnGo = arg_10_0.rtPanel:Find("start_button")
	arg_10_0.commanderToggle = arg_10_0.rtPanel:Find("commander_btn")
	arg_10_0.formationToggle = arg_10_0.rtPanel:Find("formation_btn")
	arg_10_0.tfLimitTip = arg_10_0.rtPanel:Find("limit_tip")

	setText(arg_10_0.tfLimitTip:Find("Text"), i18n("world_fleet_choose"))

	arg_10_0.tfLimitSub = arg_10_0.rtPanel:Find("limit_world/limit_sub")

	setText(arg_10_0.tfLimitSub:Find("Text"), i18n("ship_limit_notice"))

	arg_10_0.tfLimitContainer = arg_10_0.rtPanel:Find("limit_world/limit_list")
	arg_10_0.tfLimitTpl = arg_10_0.tfLimitContainer:Find("condition")

	arg_10_0:buildCommanderPanel()
end

function var_0_0.didEnter(arg_12_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_12_0.rtPanel)
	onButton(arg_12_0, arg_12_0.btnGo, function()
		local var_13_0, var_13_1 = arg_12_0:CheckValid()

		if var_13_0 then
			arg_12_0:emit(WorldFleetSelectMediator.OnGO)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_13_1)
		end
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.btnBack, function()
		arg_12_0:closeView()
	end, SFX_CANCEL)

	local function var_12_0(arg_15_0)
		arg_12_0.contextData.showCommander = arg_15_0

		for iter_15_0, iter_15_1 in pairs(arg_12_0.rtFleets) do
			for iter_15_2 = 1, #arg_12_0.contextData.fleets[iter_15_0] do
				arg_12_0:updateCommanderBtn(iter_15_1:GetChild(iter_15_2 - 1))
			end
		end
	end

	onToggle(arg_12_0, arg_12_0.commanderToggle, function(arg_16_0)
		if arg_16_0 then
			var_12_0(arg_16_0)
		end
	end, SFX_PANEL)
	onToggle(arg_12_0, arg_12_0.formationToggle, function(arg_17_0)
		if arg_17_0 then
			var_12_0(not arg_17_0)
		end
	end, SFX_PANEL)
	arg_12_0:UpdateFleets()
	scrollTo(arg_12_0.rtContent, nil, arg_12_0.contextData.scrollY)

	arg_12_0.contextData.showCommander = defaultValue(arg_12_0.contextData.showCommander, true)

	triggerToggle(arg_12_0.contextData.showCommander and arg_12_0.commanderToggle or arg_12_0.formationToggle, true)
	seriesAsync({
		function(arg_18_0)
			arg_12_0:CheckWorldDelegateAward(arg_18_0)
		end,
		function(arg_19_0)
			arg_12_0:CheckWorldResetAward(arg_19_0)
		end
	}, function()
		return
	end)
end

function var_0_0.willExit(arg_21_0)
	arg_21_0.contextData.scrollY = GetComponent(arg_21_0.rtContent, typeof(ScrollRect)).normalizedPosition.y

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_21_0.rtPanel, arg_21_0._tf)
	arg_21_0:destroyCommanderPanel()
end

function var_0_0.onBackPressed(arg_22_0)
	if arg_22_0.levelCMDFormationView:isShowing() then
		arg_22_0.levelCMDFormationView:ActionInvoke("Hide")
	else
		arg_22_0:closeView()
	end
end

function var_0_0.UpdateFleets(arg_23_0, arg_23_1)
	arg_23_0:downloadFleetSelectResList(arg_23_0.contextData.fleets, function()
		arg_23_0:UpdateFleetsAfterResDownload()

		return existCall(arg_23_1)
	end)
end

function var_0_0.UpdateFleetsAfterResDownload(arg_25_0)
	local var_25_0 = arg_25_0.contextData.fleets

	for iter_25_0, iter_25_1 in pairs(var_25_0) do
		local var_25_1 = arg_25_0.rtFleets[iter_25_0]
		local var_25_2 = UIItemList.New(var_25_1, var_25_1:GetChild(0))

		var_25_2:make(function(arg_26_0, arg_26_1, arg_26_2)
			if arg_26_0 == UIItemList.EventUpdate then
				arg_25_0:UpdateFleet(arg_26_2, iter_25_0, arg_26_1 + 1)
			end
		end)
		var_25_2:align(#var_25_0[iter_25_0])
		setActive(var_25_1, #var_25_0[iter_25_0] > 0)
	end

	arg_25_0:updateEliteLimit()
end

function var_0_0.IsPropertyLimitationSatisfy(arg_27_0)
	local var_27_0 = getProxy(BayProxy):getRawData()
	local var_27_1 = pg.gameset.world_fleet_unlock_level.description
	local var_27_2 = {}

	for iter_27_0, iter_27_1 in ipairs(var_27_1) do
		var_27_2[iter_27_1[1]] = 0
	end

	local var_27_3 = 0

	for iter_27_2, iter_27_3 in ipairs(arg_27_0.contextData.fleets[FleetType.Normal]) do
		if arg_27_0:GetTeamShipCount(iter_27_3[TeamType.Main]) == 0 or arg_27_0:GetTeamShipCount(iter_27_3[TeamType.Vanguard]) == 0 then
			-- block empty
		else
			local var_27_4 = {}
			local var_27_5 = {}
			local var_27_6 = 0

			for iter_27_4, iter_27_5 in ipairs(var_27_1) do
				local var_27_7, var_27_8, var_27_9, var_27_10 = unpack(iter_27_5)

				if string.sub(var_27_7, 1, 5) == "fleet" then
					var_27_4[var_27_7] = 0
					var_27_5[var_27_7] = var_27_10
				end
			end

			for iter_27_6, iter_27_7 in pairs(iter_27_3) do
				for iter_27_8 = 1, 3 do
					local var_27_11 = iter_27_7[iter_27_8] and var_27_0[iter_27_7[iter_27_8]]

					if var_27_11 then
						var_27_3 = var_27_3 + 1
						var_27_6 = var_27_6 + 1

						local var_27_12 = intProperties(var_27_11:getProperties())

						for iter_27_9, iter_27_10 in pairs(var_27_2) do
							if string.sub(iter_27_9, 1, 5) == "fleet" then
								if iter_27_9 == "fleet_totle_level" then
									var_27_4[iter_27_9] = var_27_4[iter_27_9] + var_27_11.level
								end
							elseif iter_27_9 == "level" then
								var_27_2[iter_27_9] = iter_27_10 + var_27_11.level
							else
								var_27_2[iter_27_9] = iter_27_10 + var_27_12[iter_27_9]
							end
						end
					end
				end
			end

			for iter_27_11, iter_27_12 in pairs(var_27_4) do
				if iter_27_11 == "fleet_totle_level" and iter_27_12 > var_27_5[iter_27_11] then
					var_27_2[iter_27_11] = var_27_2[iter_27_11] + 1
				end
			end
		end
	end

	local var_27_13 = {}

	for iter_27_13, iter_27_14 in ipairs(var_27_1) do
		local var_27_14, var_27_15, var_27_16, var_27_17 = unpack(iter_27_14)

		if var_27_14 == "level" and var_27_3 > 0 then
			var_27_2[var_27_14] = math.ceil(var_27_2[var_27_14] / var_27_3)
		end

		var_27_13[iter_27_13] = AttributeType.EliteConditionCompare(var_27_15, var_27_2[var_27_14], var_27_16) and 1 or 0
	end

	return var_27_13, var_27_2
end

function var_0_0.updateEliteLimit(arg_28_0)
	local var_28_0 = pg.gameset.world_fleet_unlock_level.description

	if #var_28_0 == 0 then
		return
	end

	local var_28_1, var_28_2 = arg_28_0:IsPropertyLimitationSatisfy()
	local var_28_3 = UIItemList.New(arg_28_0.tfLimitContainer, arg_28_0.tfLimitTpl)

	var_28_3:make(function(arg_29_0, arg_29_1, arg_29_2)
		arg_29_1 = arg_29_1 + 1

		if arg_29_0 == UIItemList.EventUpdate then
			local var_29_0 = var_28_0[arg_29_1]
			local var_29_1, var_29_2, var_29_3, var_29_4 = unpack(var_29_0)

			if var_28_1[arg_29_1] == 1 then
				arg_29_2:Find("Text"):GetComponent(typeof(Text)).color = Color.New(1, 0.9607843137254902, 0.5019607843137255)
			else
				arg_29_2:Find("Text"):GetComponent(typeof(Text)).color = Color.New(0.9568627450980393, 0.30196078431372547, 0.30196078431372547)
			end

			local var_29_5 = (AttributeType.EliteCondition2Name(var_29_1, var_29_4) .. AttributeType.eliteConditionCompareTip(var_29_2) .. var_29_3) .. "（" .. var_28_2[var_29_1] .. "）"

			setText(arg_29_2:Find("Text"), var_29_5)
		end
	end)
	var_28_3:align(#var_28_0)
end

function var_0_0.updateCommanderBtn(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1:Find("btn_recom")
	local var_30_1 = arg_30_1:Find("btn_clear")
	local var_30_2 = arg_30_1:Find("commander")

	setActive(var_30_0, not arg_30_0.contextData.showCommander)
	setActive(var_30_1, not arg_30_0.contextData.showCommander)
	setActive(var_30_2, arg_30_0.contextData.showCommander)
end

function var_0_0.UpdateFleet(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = arg_31_1:Find("commander")

	arg_31_0:updateCommanders(var_31_0, arg_31_2, arg_31_3)

	local var_31_1 = arg_31_0.contextData.fleets[arg_31_2][arg_31_3]
	local var_31_2 = (arg_31_2 == FleetType.Submarine and 10 or 0) + arg_31_3

	setText(arg_31_1:Find("bg/name"), Fleet.DEFAULT_NAME[var_31_2])

	if arg_31_2 == FleetType.Normal then
		arg_31_0:UpdateShips(arg_31_1:Find(TeamType.Main), TeamType.Main, var_31_1)
		arg_31_0:UpdateShips(arg_31_1:Find(TeamType.Vanguard), TeamType.Vanguard, var_31_1)
		setActive(arg_31_1:Find("selected"), arg_31_0:GetTeamShipCount(var_31_1[TeamType.Main]) > 0 and arg_31_0:GetTeamShipCount(var_31_1[TeamType.Vanguard]) > 0)
	elseif arg_31_2 == FleetType.Submarine then
		arg_31_0:UpdateShips(arg_31_1:Find(TeamType.Submarine), TeamType.Submarine, var_31_1)
		setActive(arg_31_1:Find("selected"), arg_31_0:GetTeamShipCount(var_31_1[TeamType.Submarine]) > 0)
	end

	local var_31_3 = arg_31_1:Find("btn_recom")
	local var_31_4 = arg_31_1:Find("btn_clear")

	onButton(arg_31_0, var_31_3, function()
		arg_31_0:RecommendFormation(arg_31_2, arg_31_3)
		arg_31_0:downloadFleetSelectResList(arg_31_0.contextData.fleets, function()
			arg_31_0:UpdateFleet(arg_31_1, arg_31_2, arg_31_3)
			arg_31_0:updateEliteLimit()
		end)
	end, SFX_PANEL)
	onButton(arg_31_0, var_31_4, function()
		if arg_31_0:GetTeamShipCount(var_31_1[TeamType.Main]) > 0 or arg_31_0:GetTeamShipCount(var_31_1[TeamType.Vanguard]) > 0 or arg_31_0:GetTeamShipCount(var_31_1[TeamType.Submarine]) > 0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("battle_preCombatLayer_clear_confirm"),
				onYes = function()
					var_31_1[TeamType.Main] = {}
					var_31_1[TeamType.Vanguard] = {}
					var_31_1[TeamType.Submarine] = {}

					arg_31_0:UpdateFleet(arg_31_1, arg_31_2, arg_31_3)
					arg_31_0:updateEliteLimit()
				end
			})
		end
	end, SFX_CANCEL)
end

function var_0_0.updateCommanders(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	local var_36_0 = arg_36_0.contextData.fleets[arg_36_2][arg_36_3]
	local var_36_1 = Fleet.New({
		ship_list = {},
		commanders = var_36_0.commanders
	})

	for iter_36_0 = 1, 2 do
		local var_36_2 = var_36_1:getCommanderByPos(iter_36_0)
		local var_36_3 = arg_36_1:Find("pos" .. iter_36_0)
		local var_36_4 = var_36_3:Find("add")
		local var_36_5 = var_36_3:Find("info")

		setActive(var_36_4, not var_36_2)
		setActive(var_36_5, var_36_2)

		if var_36_2 then
			local var_36_6 = Commander.rarity2Frame(var_36_2:getRarity())

			setImageSprite(var_36_5:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. var_36_6))
			GetImageSpriteFromAtlasAsync("CommanderHrz/" .. var_36_2:getPainting(), "", var_36_5:Find("mask/icon"))
		else
			local var_36_7 = 1

			while var_36_0.commanders[var_36_7] and var_36_0.commanders[var_36_7].pos ~= iter_36_0 do
				var_36_7 = var_36_7 + 1
			end

			if var_36_0.commanders[var_36_7] then
				table.remove(var_36_0.commanders, var_36_7)
			end
		end

		onButton(arg_36_0, var_36_4, function()
			arg_36_0:openCommanderPanel(var_36_1, arg_36_2, arg_36_3)
		end, SFX_PANEL)
		onButton(arg_36_0, var_36_5, function()
			arg_36_0:openCommanderPanel(var_36_1, arg_36_2, arg_36_3)
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateShips(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0 = getProxy(BayProxy)
	local var_39_1 = arg_39_3[arg_39_2]
	local var_39_2 = {}

	for iter_39_0, iter_39_1 in ipairs({
		TeamType.Vanguard,
		TeamType.Main,
		TeamType.Submarine
	}) do
		for iter_39_2 = 1, 3 do
			local var_39_3 = arg_39_3[iter_39_1][iter_39_2] and var_39_0:getShipById(arg_39_3[iter_39_1][iter_39_2]) or nil

			table.insert(var_39_2, var_39_3)

			if not var_39_3 then
				arg_39_3[iter_39_1][iter_39_2] = nil
			end
		end
	end

	removeAllChildren(arg_39_1)

	for iter_39_3 = 1, 3 do
		local var_39_4
		local var_39_5

		if var_39_1[iter_39_3] then
			var_39_4 = cloneTplTo(arg_39_0.rtShipTpl, arg_39_1, "ship_" .. var_39_1[iter_39_3])
			var_39_5 = var_39_0:getShipById(var_39_1[iter_39_3])

			updateShip(var_39_4, var_39_5)
		else
			var_39_4 = cloneTplTo(arg_39_0.rtEmptyTpl, arg_39_1, "empty")

			setActive(var_39_4:Find("ship_type"), false)
		end

		onButton(arg_39_0, var_39_4:Find("icon_bg"), function()
			arg_39_0:emit(WorldFleetSelectMediator.OnSelectShip, arg_39_2, var_39_1, iter_39_3)
		end, SFX_PANEL)

		local var_39_6 = GetOrAddComponent(var_39_4:Find("icon_bg"), typeof(UILongPressTrigger))

		pg.DelegateInfo.Add(arg_39_0, var_39_6.onLongPressed)
		var_39_6.onLongPressed:RemoveAllListeners()
		var_39_6.onLongPressed:AddListener(function()
			if not var_39_5 then
				arg_39_0:emit(WorldFleetSelectMediator.OnSelectShip, arg_39_2, var_39_1, iter_39_3)
			else
				arg_39_0:emit(WorldFleetSelectMediator.OnShipDetail, {
					shipId = var_39_5.id,
					shipVOs = var_39_2
				})
			end
		end)
	end
end

function var_0_0.setCommanderPrefabs(arg_42_0, arg_42_1)
	arg_42_0.commanderPrefabs = arg_42_1
end

function var_0_0.openCommanderPanel(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	arg_43_0.levelCMDFormationView:setCallback(function(arg_44_0)
		if arg_44_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_43_0:emit(WorldFleetSelectMediator.OnCommanderSkill, arg_44_0.skill)
		elseif arg_44_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_43_0.contextData.eliteCommanderSelected = {
				fleetType = arg_43_2,
				fleetIndex = arg_43_3,
				pos = arg_44_0.pos
			}

			arg_43_0:emit(WorldFleetSelectMediator.OnSelectEliteCommander, arg_43_2, arg_43_3, arg_44_0.pos)
			arg_43_0:closeCommanderPanel()
		else
			arg_43_0:emit(WorldFleetSelectMediator.OnCommanderFormationOp, {
				FleetType = LevelUIConst.FLEET_TYPE_WORLD,
				data = arg_44_0,
				fleets = arg_43_0.contextData.fleets,
				fleetType = arg_43_2,
				fleetIndex = arg_43_3
			})
		end
	end)
	arg_43_0.levelCMDFormationView:Load()
	arg_43_0.levelCMDFormationView:ActionInvoke("update", arg_43_1, arg_43_0.commanderPrefabs)
	arg_43_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.closeCommanderPanel(arg_45_0)
	arg_45_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.updateCommanderFleet(arg_46_0, arg_46_1)
	if arg_46_0.levelCMDFormationView:isShowing() then
		arg_46_0.levelCMDFormationView:ActionInvoke("updateFleet", arg_46_1)
	end
end

function var_0_0.updateCommanderPrefab(arg_47_0)
	if arg_47_0.levelCMDFormationView:isShowing() then
		arg_47_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_47_0.commanderPrefabs)
	end
end

function var_0_0.buildCommanderPanel(arg_48_0)
	arg_48_0.levelCMDFormationView = LevelCMDFormationView.New(arg_48_0._tf, arg_48_0.event, arg_48_0.contextData)
end

function var_0_0.destroyCommanderPanel(arg_49_0)
	arg_49_0.levelCMDFormationView:Destroy()

	arg_49_0.levelCMDFormationView = nil
end

function var_0_0.CheckValid(arg_50_0)
	for iter_50_0, iter_50_1 in pairs(arg_50_0.contextData.fleets) do
		if iter_50_0 == FleetType.Normal then
			for iter_50_2, iter_50_3 in ipairs(iter_50_1) do
				if arg_50_0:GetTeamShipCount(iter_50_3[TeamType.Main]) == 0 or arg_50_0:GetTeamShipCount(iter_50_3[TeamType.Vanguard]) == 0 then
					return false, i18n("world_fleet_formation_not_valid", Fleet.DEFAULT_NAME[iter_50_2])
				end
			end
		end
	end

	local var_50_0, var_50_1 = arg_50_0:IsPropertyLimitationSatisfy()
	local var_50_2 = 1

	for iter_50_4, iter_50_5 in ipairs(var_50_0) do
		var_50_2 = var_50_2 * iter_50_5
	end

	if var_50_2 ~= 1 then
		return false, i18n("elite_disable_property_unsatisfied")
	end

	return true
end

function var_0_0.GetTeamShipCount(arg_51_0, arg_51_1)
	local var_51_0 = 0

	for iter_51_0 = 1, 3 do
		if arg_51_1[iter_51_0] then
			var_51_0 = var_51_0 + 1
		end
	end

	return var_51_0
end

function var_0_0.RecommendFormation(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = {
		[FleetType.Normal] = {
			TeamType.Main,
			TeamType.Vanguard
		},
		[FleetType.Submarine] = {
			TeamType.Submarine
		}
	}
	local var_52_1 = {}

	for iter_52_0, iter_52_1 in pairs(arg_52_0.contextData.fleets) do
		for iter_52_2, iter_52_3 in ipairs(iter_52_1) do
			for iter_52_4, iter_52_5 in ipairs(var_52_0[iter_52_0]) do
				for iter_52_6 = 1, 3 do
					local var_52_2 = iter_52_3[iter_52_5][iter_52_6]

					if var_52_2 then
						table.insert(var_52_1, var_52_2)
					end
				end
			end
		end
	end

	local var_52_3 = arg_52_0.contextData.fleets[arg_52_1][arg_52_2]
	local var_52_4 = getProxy(BayProxy)

	for iter_52_7, iter_52_8 in ipairs(var_52_0[arg_52_1]) do
		for iter_52_9 = 1, 3 do
			if not var_52_3[iter_52_8][iter_52_9] then
				local var_52_5 = var_52_4:getWorldRecommendShip(iter_52_8, var_52_1)

				if var_52_5 then
					var_52_3[iter_52_8][iter_52_9] = var_52_5.id

					table.insert(var_52_1, var_52_5.id)
				end
			end
		end
	end
end

function var_0_0.CheckWorldDelegateAward(arg_53_0, arg_53_1)
	if getProxy(WorldProxy):GetDelegateAward() then
		getProxy(WorldProxy):RemoveDelegateAward()
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_auto_plan_error_tip4"))
	end

	arg_53_1()
end

function var_0_0.CheckWorldResetAward(arg_54_0, arg_54_1)
	local var_54_0 = {}
	local var_54_1 = nowWorld()
	local var_54_2 = var_54_1.resetAward

	if var_54_2 and #var_54_2 > 0 then
		local var_54_3 = pg.gameset.world_resetting_story.description[1]

		if #var_54_3 > 0 then
			table.insert(var_54_0, function(arg_55_0)
				pg.NewStoryMgr.GetInstance():Play(var_54_3, arg_55_0, true)
			end)
		end

		table.insert(var_54_0, function(arg_56_0)
			local var_56_0

			var_56_0 = {
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_WORLD_RESET,
				itemFunc = function(arg_57_0)
					arg_54_0:emit(var_0_0.ON_DROP, arg_57_0, function()
						pg.MsgboxMgr.GetInstance():ShowMsgBox(var_56_0)
					end)
				end,
				drops = var_54_2,
				tipWord = i18n("world_recycle_item_transform"),
				onNo = arg_56_0
			}

			pg.MsgboxMgr.GetInstance():ShowMsgBox(var_56_0)
		end)
	end

	if var_54_1.resetLimitTip then
		table.insert(var_54_0, function(arg_59_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("world_resource_fill")
			})
		end)
	end

	seriesAsync(var_54_0, function()
		var_54_1:ClearResetAward()
		arg_54_1()
	end)
end

return var_0_0
