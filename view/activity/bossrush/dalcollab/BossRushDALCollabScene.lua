local var_0_0 = class("BossRushDALCollabScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BossRushDALCollabUI"
end

function var_0_0.getAtalsName(arg_2_0)
	return "ui/BossRushDALCollabUI_atlas"
end

function var_0_0.getResource(arg_3_0)
	local var_3_0 = var_0_0.super.getResource(arg_3_0)

	table.insert(var_3_0, arg_3_0:getAtalsName())

	return var_3_0
end

function var_0_0.ResUISettings(arg_4_0)
	return true
end

function var_0_0.Ctor(arg_5_0)
	var_0_0.super.Ctor(arg_5_0)

	arg_5_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_6_0, arg_6_1)
	existCall(arg_6_1)
	arg_6_0.loader:LoadBundle(arg_6_0:getAtalsName())
end

function var_0_0.OverlayComponent(arg_7_0, arg_7_1)
	if arg_7_1 then
		arg_7_0:OverlayPanel(arg_7_0.top)
		arg_7_0:OverlayPanel(arg_7_0.right)
		arg_7_0:OverlayPanel(arg_7_0.pt)
		arg_7_0:OverlayPanel(arg_7_0.battleNodes)
	else
		arg_7_0:UnOverlayPanel(arg_7_0.top, arg_7_0._tf)
		arg_7_0:UnOverlayPanel(arg_7_0.right, arg_7_0._tf)
		arg_7_0:UnOverlayPanel(arg_7_0.pt, arg_7_0._tf)
		arg_7_0:UnOverlayPanel(arg_7_0.battleNodes, arg_7_0._tf)
	end
end

function var_0_0.init(arg_8_0)
	arg_8_0.top = arg_8_0._tf:Find("Top")
	arg_8_0.map = arg_8_0._tf:Find("Map")
	arg_8_0.right = arg_8_0._tf:Find("Right")
	arg_8_0.pt = arg_8_0._tf:Find("PT")
	arg_8_0.battleNodes = arg_8_0._tf:Find("Battle")
	arg_8_0.seriesNodes = _.map(_.range(arg_8_0._tf:Find("Battle/Nodes").childCount), function(arg_9_0)
		return arg_8_0._tf:Find("Battle/Nodes"):GetChild(arg_9_0 - 1)
	end)

	table.Foreach(arg_8_0.seriesNodes, function(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_1:Find("ship")
		local var_10_1 = var_10_0:GetComponent(typeof(Animation))

		var_10_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
			if var_10_1:IsPlaying("anim_BossRushDALCollabUI_ship_out") then
				setActive(arg_8_0._currentShip, true)
				setActive(arg_8_0._currentShip:Find("vx_teleport_1"), true)
				setActive(var_10_0:Find("vx_teleport_2"), false)
				arg_8_0:playAnima(arg_8_0._currentShip, "anim_BossRushDALCollabUI_ship_in")
				setActive(var_10_0, false)
			elseif var_10_1:IsPlaying("anim_BossRushDALCollabUI_ship_in") then
				if arg_8_0._openSeriesData then
					arg_8_0.stageView:ExecuteAction("SetData", arg_8_0._openSeriesData)
					arg_8_0.stageView:ExecuteAction("Show")

					arg_8_0.battleNodes:GetComponent(typeof(CanvasGroup)).interactable = true
					arg_8_0._openSeriesData = nil
				end

				setActive(var_10_0:Find("vx_teleport_1"), false)

				arg_8_0._lastShip = var_10_0
			end
		end)
	end)

	arg_8_0.maps = {}

	for iter_8_0 = 1, 6 do
		arg_8_0.maps[iter_8_0] = arg_8_0._tf:Find("Map/map_" .. iter_8_0)
	end

	arg_8_0.shiftMap = arg_8_0._tf:Find("Map/Map_1")
	arg_8_0.shiftMapList = {}

	for iter_8_1 = 1, 6 do
		arg_8_0.shiftMapList[iter_8_1] = arg_8_0.shiftMap:Find("map_" .. iter_8_1)
	end

	arg_8_0.mapAnima = arg_8_0._tf:Find("Map"):GetComponent(typeof(Animation))
	arg_8_0.mapDftEvt = arg_8_0._tf:Find("Map"):GetComponent(typeof(DftAniEvent))
	arg_8_0.mapFX = arg_8_0._tf:Find("Map/state_fx")
	arg_8_0.upgradeBtn = arg_8_0._tf:Find("Right/Upgrade")
	arg_8_0.shopBtn = arg_8_0._tf:Find("Right/Store")
	arg_8_0.ptLabel = arg_8_0._tf:Find("PT/pt_text/icon")
	arg_8_0.ptIcon = arg_8_0._tf:Find("PT/pt_text/icon/Image")
	arg_8_0.ptCount = arg_8_0._tf:Find("PT/pt_text/Text")

	setText(arg_8_0.ptLabel, i18n("pt_count_tip"))

	arg_8_0.ActionSequence = {}
	arg_8_0.upgradeView = BossRushDALUpgradeView.New(arg_8_0._tf, arg_8_0.event, arg_8_0.contextData)

	arg_8_0.upgradeView:RegisterView(arg_8_0)

	arg_8_0.stageView = BossRushDALCollabStageView.New(arg_8_0._tf, arg_8_0.event, arg_8_0.contextData)
end

function var_0_0.SetUpgradeActvity(arg_12_0, arg_12_1)
	arg_12_0.upgradeView:SetData(arg_12_1)
end

function var_0_0.SetActivity(arg_13_0, arg_13_1)
	arg_13_0.activity = arg_13_1
end

function var_0_0.SetPTActivity(arg_14_0, arg_14_1)
	arg_14_0.ptActivity = arg_14_1
end

function var_0_0.onBackPressed(arg_15_0)
	if arg_15_0.upgradeView:isShowing() then
		arg_15_0.upgradeView:Hide()
	elseif arg_15_0.stageView:isShowing() then
		arg_15_0.stageView:Hide()
	else
		var_0_0.super.onBackPressed(arg_15_0)
	end
end

function var_0_0.didEnter(arg_16_0)
	onButton(arg_16_0, arg_16_0.top:Find("back_btn"), function()
		arg_16_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_16_0, arg_16_0.top:Find("option"), function()
		arg_16_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.upgradeBtn, function()
		arg_16_0.upgradeView:ExecuteAction("Show")
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.top:Find("help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = {
				{
					info = i18n("dal_chapter_tip")
				}
			}
		})
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.shopBtn, function()
		local var_21_0 = arg_16_0.activity:getConfig("config_client").shopID
		local var_21_1 = getProxy(ActivityProxy):getActivityById(var_21_0)

		if not var_21_1 or var_21_1:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_16_0:emit(BossRushDALCollabMediator.GO_SHOPS_LAYER, {
			warp = NewShopsScene.TYPE_ACTIVITY,
			actId = var_21_1 and var_21_1.id
		})
	end, SFX_PANEL)
	arg_16_0:PlayBGM()
	arg_16_0:playAnima(arg_16_0._tf, "anim_BossRushDALCollabUI_in")
	arg_16_0:OverlayComponent(true)
end

function var_0_0.getBGM(arg_22_0)
	local var_22_0 = pg.voice_bgm[arg_22_0.__cname]

	if not var_22_0 then
		return nil
	end

	return var_22_0.bgm
end

function var_0_0.UpdateView(arg_23_0)
	setActive(arg_23_0.battleNodes, true)
	arg_23_0:UpdateBattle()
	arg_23_0:UpdateMap()
	arg_23_0:updateActivityRes()
end

function var_0_0.playAnima(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	arg_24_1:GetComponent(typeof(Animation)):Play(arg_24_2)

	if arg_24_3 then
		arg_24_1:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
			arg_24_3()
		end)
	end
end

function var_0_0.PlayMapShiftAnima(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.maps) do
		local var_26_0 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_26_0 .. arg_26_2)

		setImageSprite(iter_26_1, var_26_0, true)
	end

	for iter_26_2, iter_26_3 in pairs(arg_26_0.shiftMapList) do
		local var_26_1 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_26_2 .. arg_26_1)

		setImageSprite(iter_26_3, var_26_1, true)
	end

	setActive(arg_26_0.shiftMap, true)
	arg_26_0.mapAnima:Play("anim_BossRushDALCollabUI_Map")
end

function var_0_0.updateActivityRes(arg_27_0)
	setText(arg_27_0.ptCount, "x" .. arg_27_0.ptActivity.data1)
	GetImageSpriteFromAtlasAsync(Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = tonumber(arg_27_0.ptActivity:getConfig("config_id"))
	}):getIcon(), "", arg_27_0.ptIcon, true)
end

function var_0_0.UpdateMap(arg_28_0)
	local var_28_0 = arg_28_0.activity
	local var_28_1 = var_28_0:GetCollabSeriesDataList()
	local var_28_2 = var_28_1[6]

	if var_28_2:IsPass() and var_28_2:GetDefeated(arg_28_0.activity) then
		setActive(arg_28_0.mapFX:Find("state_3"), true)
		setActive(arg_28_0.mapFX:Find("state_4"), true)
		setActive(arg_28_0.mapFX:Find("state_4/6_3"), true)

		for iter_28_0, iter_28_1 in pairs(arg_28_0.maps) do
			if iter_28_0 ~= 1 and iter_28_0 ~= 6 then
				setActive(arg_28_0.mapFX:Find("state_4/" .. iter_28_0), false)
			end

			setActive(iter_28_1, true)

			local var_28_3 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_28_0)

			setImageSprite(iter_28_1, var_28_3, true)
		end
	elseif var_28_2:IsPlayerUnlock(var_28_0) and (not var_28_2:IsPass() or not var_28_2:GetDefeated(arg_28_0.activity)) then
		setActive(arg_28_0.mapFX:Find("state_4"), true)

		for iter_28_2, iter_28_3 in pairs(arg_28_0.maps) do
			setActive(iter_28_3, true)

			if iter_28_2 == 6 then
				local var_28_4

				if var_28_2:GetBossHpRate() > 0.5 then
					var_28_4 = "_1"

					setActive(arg_28_0.mapFX:Find("state_4/6_1"), true)
				else
					setActive(arg_28_0.mapFX:Find("state_4/6_2"), true)

					var_28_4 = "_2"
				end

				local var_28_5 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_28_2 .. var_28_4)

				setImageSprite(iter_28_3, var_28_5, true)
			else
				local var_28_6 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_28_2 .. "_3")

				setImageSprite(iter_28_3, var_28_6, true)
			end
		end
	else
		setActive(arg_28_0.mapFX:Find("state_2"), true)
		setActive(arg_28_0.mapFX:Find("state_1"), true)
		setActive(arg_28_0.mapFX:Find("state_3"), true)

		for iter_28_4, iter_28_5 in pairs(arg_28_0.maps) do
			if iter_28_4 == 6 then
				setActive(iter_28_5, false)
			else
				setActive(iter_28_5, true)

				local var_28_7 = var_28_1[iter_28_4]
				local var_28_8 = var_28_7:GetDefeated(arg_28_0.activity)
				local var_28_9
				local var_28_10 = not var_28_8 and "_1" or var_28_7:GetBossTimeStamp() ~= 0 and "" or var_28_7:GetBossHpRate() > 0.5 and "_1" or "_2"
				local var_28_11 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_28_4 .. var_28_10)

				setImageSprite(iter_28_5, var_28_11, true)

				if iter_28_4 ~= 1 then
					if var_28_10 == "" then
						setActive(arg_28_0.mapFX:Find("state_3/" .. iter_28_4), true)
					elseif var_28_10 == "_1" then
						setActive(arg_28_0.mapFX:Find("state_1/" .. iter_28_4), true)
					elseif var_28_10 == "_2" then
						setActive(arg_28_0.mapFX:Find("state_2/" .. iter_28_4), true)
					end
				end
			end
		end
	end
end

function var_0_0.UpdateBattle(arg_29_0)
	local var_29_0 = arg_29_0.activity
	local var_29_1 = var_29_0:GetActiveSeriesIds()
	local var_29_2 = arg_29_0.activity:GetCollabSeriesDataList()
	local var_29_3 = {}

	for iter_29_0, iter_29_1 in pairs(var_29_2) do
		table.insert(var_29_3, iter_29_1)
	end

	table.sort(var_29_3, function(arg_30_0, arg_30_1)
		return arg_30_0:GetTrafficPerH() > arg_30_1:GetTrafficPerH()
	end)
	table.Foreach(arg_29_0.seriesNodes, function(arg_31_0, arg_31_1)
		local var_31_0 = var_29_1[arg_31_0]
		local var_31_1 = var_29_0:GetCollabSeriesData(var_31_0)
		local var_31_2 = var_31_1:IsPlayerUnlock(var_29_0)
		local var_31_3 = var_31_1:IsPass()
		local var_31_4 = var_31_1:GetDefeated(arg_29_0.activity)

		if var_31_0 == 6 and not var_31_2 then
			setActive(arg_31_1, false)
		end

		setActive(arg_31_1:Find("lock"), not var_31_2)
		setActive(arg_31_1:Find("clear"), var_31_2 and var_31_3 and var_31_4)
		setActive(arg_31_1:Find("active"), var_31_2 and (not var_31_3 or not var_31_4))

		local var_31_5 = table.indexof(var_29_3, var_31_1)

		if not var_31_2 then
			setText(arg_31_1:Find("lock/name"), var_31_1:GetSeriesCode())
		elseif var_31_1:IsPass() and var_31_4 then
			setText(arg_31_1:Find("clear/current/name/text"), var_31_1:GetSeriesCode())
			setText(arg_31_1:Find("clear/common/name"), var_31_1:GetSeriesCode())
			setActive(arg_31_1:Find("clear/common"), true)
			setActive(arg_31_1:Find("clear/current"), false)
		else
			setText(arg_31_1:Find("active/current/name/text"), var_31_1:GetSeriesCode())
			setText(arg_31_1:Find("active/common/name"), var_31_1:GetSeriesCode())

			local var_31_6 = var_31_1:GetBossHpRate() * 100 .. "%"

			setText(arg_31_1:Find("active/common/value"), var_31_1:IsPass() and "HOLD" or var_31_6)
			setText(arg_31_1:Find("active/current/value"), var_31_1:IsPass() and "HOLD" or var_31_6)
			setActive(arg_31_1:Find("active/common"), true)
			setActive(arg_31_1:Find("active/current"), false)

			arg_31_1:Find("active/current/progress"):GetComponent(typeof(Image)).fillAmount = var_31_1:IsPass() and 1 or var_31_1:GetBossHpRate()
		end

		local function var_31_7(arg_32_0)
			if var_31_5 > 3 then
				setActive(arg_32_0, false)
			else
				setActive(arg_32_0, true)

				local var_32_0 = _.map(_.range(arg_32_0.childCount), function(arg_33_0)
					return arg_32_0:GetChild(arg_33_0 - 1)
				end)

				table.Foreach(var_32_0, function(arg_34_0, arg_34_1)
					setActive(arg_34_1, arg_34_0 <= 4 - var_31_5)
				end)
			end
		end

		var_31_7(arg_31_1:Find("active/common/bullets"))
		var_31_7(arg_31_1:Find("clear/common/bullets"))
		onButton(arg_29_0, arg_31_1, function()
			if not var_31_2 then
				local var_35_0 = var_31_1:GetPreSeriesId()
				local var_35_1 = ""
				local var_35_2 = 1
				local var_35_3 = var_31_1:GetPreSeriesId()
				local var_35_4 = CollabrateBossRushSeriesData.New({
					id = var_35_3[var_35_2]
				}):GetSeriesCode()

				while var_35_2 < #var_35_3 do
					var_35_2 = var_35_2 + 1

					local var_35_5 = CollabrateBossRushSeriesData.New({
						id = var_35_3[var_35_2]
					})

					var_35_4 = var_35_4 .. "、" .. var_35_5:GetSeriesCode()
				end

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_35_4))

				return
			end

			local function var_35_6()
				arg_29_0._openSeriesData = var_31_1

				PlayerPrefs.SetInt("DAL_ship_position", arg_31_0)

				if not arg_29_0:updateShipPosition() then
					arg_29_0.stageView:ExecuteAction("SetData", var_31_1)
					arg_29_0.stageView:ExecuteAction("Show")

					arg_29_0.battleNodes:GetComponent(typeof(CanvasGroup)).interactable = true
				end
			end

			local var_35_7 = var_31_1:GetInitStory()

			if var_35_7 then
				arg_29_0:PlayStory(var_35_7, var_35_6)
			else
				var_35_6()
			end
		end, SFX_PANEL)
	end)
	arg_29_0:updateShipPosition()
	arg_29_0:addbubbleMsgBoxList({
		function(arg_37_0)
			arg_29_0:checkAllStory()
			arg_37_0()
		end,
		function(arg_38_0)
			local var_38_0 = arg_29_0.activity:getConfig("config_client").first_story
			local var_38_1 = arg_29_0.activity:getConfig("config_client").first_guide

			if first_guide then
				local function var_38_2()
					pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_38_1, nil, arg_38_0)
				end

				arg_29_0:PlayStory(var_38_0, var_38_2)
			else
				arg_29_0:PlayStory(var_38_0, arg_38_0)
			end
		end
	})
end

function var_0_0.updateCurrent(arg_40_0, arg_40_1)
	table.Foreach(arg_40_0.seriesNodes, function(arg_41_0, arg_41_1)
		setActive(arg_41_1:Find("clear/common"), arg_40_1 ~= arg_41_1)
		setActive(arg_41_1:Find("clear/current"), arg_40_1 == arg_41_1)
		setActive(arg_41_1:Find("active/common"), arg_40_1 ~= arg_41_1)
		setActive(arg_41_1:Find("active/current"), arg_40_1 == arg_41_1)

		if arg_40_1 == arg_41_1 then
			arg_40_0:playAnima(arg_40_1, "anim_BossRushDALCollabUI_battle_in")
		end
	end)
end

function var_0_0.updateShipPosition(arg_42_0)
	local var_42_0 = PlayerPrefs.GetInt("DAL_ship_position", 1)
	local var_42_1 = arg_42_0.activity:GetActiveSeriesIds()

	table.Foreach(arg_42_0.seriesNodes, function(arg_43_0, arg_43_1)
		local var_43_0 = var_42_1[arg_43_0]
		local var_43_1 = arg_43_1:Find("ship")

		var_43_1:GetComponent(typeof(Animation)):Stop()

		if var_42_0 == var_43_0 then
			arg_42_0:updateCurrent(arg_43_1)

			arg_42_0._currentShip = var_43_1
		elseif var_43_1 ~= arg_42_0._lastShip then
			setActive(arg_43_1:Find("ship"), false)
		end
	end)

	if arg_42_0._lastShip then
		if arg_42_0._lastShip ~= arg_42_0._currentShip then
			arg_42_0:playAnima(arg_42_0._lastShip, "anim_BossRushDALCollabUI_ship_out")
			setActive(arg_42_0._lastShip:Find("vx_teleport_2"), true)

			arg_42_0.battleNodes:GetComponent(typeof(CanvasGroup)).interactable = false
		end
	else
		setActive(arg_42_0._currentShip, true)
		setActive(arg_42_0._currentShip:Find("vx_teleport_1"), true)
		arg_42_0:playAnima(arg_42_0._currentShip, "anim_BossRushDALCollabUI_ship_in")
	end

	return arg_42_0._lastShip ~= arg_42_0._currentShip
end

function var_0_0.checkAllStory(arg_44_0)
	local var_44_0 = arg_44_0.activity:GetCollabSeriesDataList()
	local var_44_1 = {}

	for iter_44_0, iter_44_1 in pairs(var_44_0) do
		if table.contains(arg_44_0.activity:GetPassCounts(), iter_44_0) then
			local var_44_2 = iter_44_1:GetStorys()

			for iter_44_2, iter_44_3 in ipairs(var_44_2) do
				table.insert(var_44_1, iter_44_3)
			end
		end
	end

	local var_44_3 = 1

	local function var_44_4()
		var_44_3 = var_44_3 + 1

		local var_45_0 = var_44_1[var_44_3]
		local var_45_1
		local var_45_2 = arg_44_0.activity:getConfig("config_client").storys_unlock_story

		if var_45_0 == nil and var_45_2 then
			local var_45_3 = pg.NewStoryMgr.GetInstance()

			var_45_1 = true

			for iter_45_0, iter_45_1 in ipairs(var_45_2[2]) do
				var_45_1 = var_45_1 and var_45_3:IsPlayed(iter_45_1)
			end

			var_45_1 = var_45_1 and not var_45_3:IsPlayed(var_45_2[1])
		end

		if var_45_1 then
			local function var_45_4()
				setActive(arg_44_0.shiftMap:Find("map_6"), false)
				arg_44_0:PlayMapShiftAnima("", "_3")
			end

			arg_44_0:PlayStory(var_45_2[1], var_45_4)
		else
			arg_44_0:PlayStory(var_45_0, var_44_4)
		end
	end

	arg_44_0:PlayStory(var_44_1[var_44_3], var_44_4)
end

function var_0_0.GetFinalStoryName(arg_47_0)
	local var_47_0 = arg_47_0.activity:GetCollabSeriesDataList()[6]
	local var_47_1 = Clone(var_47_0:getConfig("story_worldboss"))

	table.sort(var_47_1, function(arg_48_0, arg_48_1)
		return arg_48_0[2] < arg_48_1[2]
	end)

	return var_47_1[1][1]
end

function var_0_0.PlayStory(arg_49_0, arg_49_1, arg_49_2)
	if not arg_49_1 then
		return
	end

	local var_49_0 = pg.NewStoryMgr.GetInstance()

	if var_49_0:IsPlayed(arg_49_1) then
		return existCall(arg_49_2)
	end

	if arg_49_1 == arg_49_0:GetFinalStoryName() then
		local function var_49_1()
			arg_49_0:PlayMapShiftAnima("_3", "")
		end

		var_49_0:Play(arg_49_1, var_49_1)
	else
		var_49_0:Play(arg_49_1, arg_49_2)
	end
end

function var_0_0.UpdateTasks(arg_51_0, arg_51_1)
	if _.any(arg_51_1, function(arg_52_0)
		return arg_51_0.storyTask and arg_51_0.storyTask.id == arg_52_0
	end) then
		arg_51_0.storyTask.submitTime = 1

		arg_51_0:UpdateView()
	end
end

function var_0_0.addbubbleMsgBoxList(arg_53_0, arg_53_1)
	local var_53_0 = #arg_53_0.ActionSequence == 0

	table.insertto(arg_53_0.ActionSequence, arg_53_1)

	if not var_53_0 then
		return
	end

	arg_53_0:resumeBubble()
end

function var_0_0.addbubbleMsgBox(arg_54_0, arg_54_1)
	local var_54_0 = #arg_54_0.ActionSequence == 0

	table.insert(arg_54_0.ActionSequence, arg_54_1)

	if not var_54_0 then
		return
	end

	arg_54_0:resumeBubble()
end

function var_0_0.resumeBubble(arg_55_0)
	if #arg_55_0.ActionSequence == 0 then
		return
	end

	local var_55_0

	local function var_55_1()
		local var_56_0 = arg_55_0.ActionSequence[1]

		if var_56_0 then
			var_56_0(function()
				table.remove(arg_55_0.ActionSequence, 1)
				var_55_1()
			end)
		end
	end

	var_55_1()
end

function var_0_0.CleanBubbleMsgbox(arg_58_0)
	table.clean(arg_58_0.ActionSequence)
end

function var_0_0.willExit(arg_59_0)
	arg_59_0:OverlayComponent(false)
	arg_59_0.stageView:Destroy()
	arg_59_0.upgradeView:Destroy()
	arg_59_0.loader:Clear()
	var_0_0.super.willExit(arg_59_0)
end

return var_0_0
