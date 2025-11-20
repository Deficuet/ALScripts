local var_0_0 = class("BossRushDALCollabScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BossRushDALCollabUI"
end

function var_0_0.GetAtalsName(arg_2_0)
	return "ui/BossRushDALCollabUI_atlas"
end

function var_0_0.ResUISettings(arg_3_0)
	return true
end

function var_0_0.Ctor(arg_4_0)
	var_0_0.super.Ctor(arg_4_0)

	arg_4_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_5_0, arg_5_1)
	existCall(arg_5_1)
	arg_5_0.loader:LoadBundle(arg_5_0:GetAtalsName())
end

function var_0_0.OverlayComponent(arg_6_0, arg_6_1)
	if arg_6_1 then
		arg_6_0:OverlayPanel(arg_6_0.top)
		arg_6_0:OverlayPanel(arg_6_0.right)
		arg_6_0:OverlayPanel(arg_6_0.pt)
		arg_6_0:OverlayPanel(arg_6_0.battleNodes)
	else
		arg_6_0:UnOverlayPanel(arg_6_0.top, arg_6_0._tf)
		arg_6_0:UnOverlayPanel(arg_6_0.right, arg_6_0._tf)
		arg_6_0:UnOverlayPanel(arg_6_0.pt, arg_6_0._tf)
		arg_6_0:UnOverlayPanel(arg_6_0.battleNodes, arg_6_0._tf)
	end
end

function var_0_0.init(arg_7_0)
	arg_7_0.top = arg_7_0._tf:Find("Top")
	arg_7_0.map = arg_7_0._tf:Find("Map")
	arg_7_0.right = arg_7_0._tf:Find("Right")
	arg_7_0.pt = arg_7_0._tf:Find("PT")
	arg_7_0.battleNodes = arg_7_0._tf:Find("Battle")
	arg_7_0.seriesNodes = _.map(_.range(arg_7_0._tf:Find("Battle/Nodes").childCount), function(arg_8_0)
		return arg_7_0._tf:Find("Battle/Nodes"):GetChild(arg_8_0 - 1)
	end)

	table.Foreach(arg_7_0.seriesNodes, function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1:Find("ship")
		local var_9_1 = var_9_0:GetComponent(typeof(Animation))

		var_9_0:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
			if var_9_1:IsPlaying("anim_BossRushDALCollabUI_ship_out") then
				setActive(arg_7_0._currentShip, true)
				setActive(arg_7_0._currentShip:Find("vx_teleport_1"), true)
				setActive(var_9_0:Find("vx_teleport_2"), false)
				arg_7_0:playAnima(arg_7_0._currentShip, "anim_BossRushDALCollabUI_ship_in")
				setActive(var_9_0, false)
			elseif var_9_1:IsPlaying("anim_BossRushDALCollabUI_ship_in") then
				if arg_7_0._openSeriesData then
					arg_7_0.stageView:ExecuteAction("SetData", arg_7_0._openSeriesData)
					arg_7_0.stageView:ExecuteAction("Show")

					arg_7_0.battleNodes:GetComponent(typeof(CanvasGroup)).interactable = true
					arg_7_0._openSeriesData = nil
				end

				setActive(var_9_0:Find("vx_teleport_1"), false)

				arg_7_0._lastShip = var_9_0
			end
		end)
	end)

	arg_7_0.maps = {}

	for iter_7_0 = 1, 6 do
		arg_7_0.maps[iter_7_0] = arg_7_0._tf:Find("Map/map_" .. iter_7_0)
	end

	arg_7_0.shiftMap = arg_7_0._tf:Find("Map/Map_1")
	arg_7_0.shiftMapList = {}

	for iter_7_1 = 1, 6 do
		arg_7_0.shiftMapList[iter_7_1] = arg_7_0.shiftMap:Find("map_" .. iter_7_1)
	end

	arg_7_0.mapAnima = arg_7_0._tf:Find("Map"):GetComponent(typeof(Animation))
	arg_7_0.mapDftEvt = arg_7_0._tf:Find("Map"):GetComponent(typeof(DftAniEvent))
	arg_7_0.mapFX = arg_7_0._tf:Find("Map/state_fx")
	arg_7_0.upgradeBtn = arg_7_0._tf:Find("Right/Upgrade")
	arg_7_0.shopBtn = arg_7_0._tf:Find("Right/Store")
	arg_7_0.ptLabel = arg_7_0._tf:Find("PT/pt_text/icon")
	arg_7_0.ptIcon = arg_7_0._tf:Find("PT/pt_text/icon/Image")
	arg_7_0.ptCount = arg_7_0._tf:Find("PT/pt_text/Text")

	setText(arg_7_0.ptLabel, i18n("pt_count_tip"))

	arg_7_0.ActionSequence = {}
	arg_7_0.upgradeView = BossRushDALUpgradeView.New(arg_7_0._tf, arg_7_0.event, arg_7_0.contextData)

	arg_7_0.upgradeView:RegisterView(arg_7_0)

	arg_7_0.stageView = BossRushDALCollabStageView.New(arg_7_0._tf, arg_7_0.event, arg_7_0.contextData)
end

function var_0_0.SetUpgradeActvity(arg_11_0, arg_11_1)
	arg_11_0.upgradeView:SetData(arg_11_1)
end

function var_0_0.SetActivity(arg_12_0, arg_12_1)
	arg_12_0.activity = arg_12_1
end

function var_0_0.SetPTActivity(arg_13_0, arg_13_1)
	arg_13_0.ptActivity = arg_13_1
end

function var_0_0.onBackPressed(arg_14_0)
	if arg_14_0.upgradeView:isShowing() then
		arg_14_0.upgradeView:Hide()
	elseif arg_14_0.stageView:isShowing() then
		arg_14_0.stageView:Hide()
	else
		var_0_0.super.onBackPressed(arg_14_0)
	end
end

function var_0_0.didEnter(arg_15_0)
	onButton(arg_15_0, arg_15_0.top:Find("back_btn"), function()
		arg_15_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_15_0, arg_15_0.top:Find("option"), function()
		arg_15_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_15_0, arg_15_0.upgradeBtn, function()
		arg_15_0.upgradeView:ExecuteAction("Show")
	end, SFX_PANEL)
	onButton(arg_15_0, arg_15_0.top:Find("help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = {
				{
					info = i18n("dal_chapter_tip")
				}
			}
		})
	end, SFX_PANEL)
	onButton(arg_15_0, arg_15_0.shopBtn, function()
		local var_20_0 = arg_15_0.activity:getConfig("config_client").shopID
		local var_20_1 = getProxy(ActivityProxy):getActivityById(var_20_0)

		if not var_20_1 or var_20_1:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_15_0:emit(BossRushDALCollabMediator.GO_SHOPS_LAYER, {
			warp = NewShopsScene.TYPE_ACTIVITY,
			actId = var_20_1 and var_20_1.id
		})
	end, SFX_PANEL)
	arg_15_0:PlayBGM()
	arg_15_0:playAnima(arg_15_0._tf, "anim_BossRushDALCollabUI_in")
	arg_15_0:OverlayComponent(true)
end

function var_0_0.getBGM(arg_21_0)
	local var_21_0 = pg.voice_bgm[arg_21_0.__cname]

	if not var_21_0 then
		return nil
	end

	return var_21_0.bgm
end

function var_0_0.UpdateView(arg_22_0)
	setActive(arg_22_0.battleNodes, true)
	arg_22_0:UpdateBattle()
	arg_22_0:UpdateMap()
	arg_22_0:updateActivityRes()
end

function var_0_0.playAnima(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	arg_23_1:GetComponent(typeof(Animation)):Play(arg_23_2)

	if arg_23_3 then
		arg_23_1:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
			arg_23_3()
		end)
	end
end

function var_0_0.PlayMapShiftAnima(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.maps) do
		local var_25_0 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_25_0 .. arg_25_2)

		setImageSprite(iter_25_1, var_25_0, true)
	end

	for iter_25_2, iter_25_3 in pairs(arg_25_0.shiftMapList) do
		local var_25_1 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_25_2 .. arg_25_1)

		setImageSprite(iter_25_3, var_25_1, true)
	end

	setActive(arg_25_0.shiftMap, true)
	arg_25_0.mapAnima:Play("anim_BossRushDALCollabUI_Map")
end

function var_0_0.updateActivityRes(arg_26_0)
	setText(arg_26_0.ptCount, "x" .. arg_26_0.ptActivity.data1)
	GetImageSpriteFromAtlasAsync(Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = tonumber(arg_26_0.ptActivity:getConfig("config_id"))
	}):getIcon(), "", arg_26_0.ptIcon, true)
end

function var_0_0.UpdateMap(arg_27_0)
	local var_27_0 = arg_27_0.activity
	local var_27_1 = var_27_0:GetCollabSeriesDataList()
	local var_27_2 = var_27_1[6]

	if var_27_2:IsPass() and var_27_2:GetDefeated(arg_27_0.activity) then
		setActive(arg_27_0.mapFX:Find("state_3"), true)
		setActive(arg_27_0.mapFX:Find("state_4"), true)
		setActive(arg_27_0.mapFX:Find("state_4/6_3"), true)

		for iter_27_0, iter_27_1 in pairs(arg_27_0.maps) do
			if iter_27_0 ~= 1 and iter_27_0 ~= 6 then
				setActive(arg_27_0.mapFX:Find("state_4/k"), false)
			end

			setActive(iter_27_1, true)

			local var_27_3 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_27_0)

			setImageSprite(iter_27_1, var_27_3, true)
		end
	elseif var_27_2:IsPlayerUnlock(var_27_0) and (not var_27_2:IsPass() or not var_27_2:GetDefeated(arg_27_0.activity)) then
		setActive(arg_27_0.mapFX:Find("state_4"), true)

		for iter_27_2, iter_27_3 in pairs(arg_27_0.maps) do
			setActive(iter_27_3, true)

			if iter_27_2 == 6 then
				local var_27_4

				if var_27_2:GetBossHpRate() > 0.5 then
					var_27_4 = "_1"

					setActive(arg_27_0.mapFX:Find("state_4/6_1"), true)
				else
					setActive(arg_27_0.mapFX:Find("state_4/6_2"), true)

					var_27_4 = "_2"
				end

				local var_27_5 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_27_2 .. var_27_4)

				setImageSprite(iter_27_3, var_27_5, true)
			else
				local var_27_6 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_27_2 .. "_3")

				setImageSprite(iter_27_3, var_27_6, true)
			end
		end
	else
		setActive(arg_27_0.mapFX:Find("state_2"), true)
		setActive(arg_27_0.mapFX:Find("state_1"), true)
		setActive(arg_27_0.mapFX:Find("state_3"), true)

		for iter_27_4, iter_27_5 in pairs(arg_27_0.maps) do
			if iter_27_4 == 6 then
				setActive(iter_27_5, false)
			else
				setActive(iter_27_5, true)

				local var_27_7 = var_27_1[iter_27_4]
				local var_27_8 = var_27_7:GetDefeated(arg_27_0.activity)
				local var_27_9
				local var_27_10 = not var_27_8 and "_1" or var_27_7:GetBossTimeStamp() ~= 0 and "" or var_27_7:GetBossHpRate() > 0.5 and "_1" or "_2"
				local var_27_11 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_27_4 .. var_27_10)

				setImageSprite(iter_27_5, var_27_11, true)

				if iter_27_4 ~= 1 then
					if var_27_10 == "" then
						setActive(arg_27_0.mapFX:Find("state_3/" .. iter_27_4), true)
					elseif var_27_10 == "_1" then
						setActive(arg_27_0.mapFX:Find("state_1/" .. iter_27_4), true)
					elseif var_27_10 == "_2" then
						setActive(arg_27_0.mapFX:Find("state_2/" .. iter_27_4), true)
					end
				end
			end
		end
	end
end

function var_0_0.UpdateBattle(arg_28_0)
	local var_28_0 = arg_28_0.activity
	local var_28_1 = var_28_0:GetActiveSeriesIds()
	local var_28_2 = arg_28_0.activity:GetCollabSeriesDataList()
	local var_28_3 = {}

	for iter_28_0, iter_28_1 in pairs(var_28_2) do
		table.insert(var_28_3, iter_28_1)
	end

	table.sort(var_28_3, function(arg_29_0, arg_29_1)
		return arg_29_0:GetTrafficPerH() > arg_29_1:GetTrafficPerH()
	end)
	table.Foreach(arg_28_0.seriesNodes, function(arg_30_0, arg_30_1)
		local var_30_0 = var_28_1[arg_30_0]
		local var_30_1 = var_28_0:GetCollabSeriesData(var_30_0)
		local var_30_2 = var_30_1:IsPlayerUnlock(var_28_0)
		local var_30_3 = var_30_1:IsPass()
		local var_30_4 = var_30_1:GetDefeated(arg_28_0.activity)

		if var_30_0 == 6 and not var_30_2 then
			setActive(arg_30_1, false)
		end

		setActive(arg_30_1:Find("lock"), not var_30_2)
		setActive(arg_30_1:Find("clear"), var_30_2 and var_30_3 and var_30_4)
		setActive(arg_30_1:Find("active"), var_30_2 and (not var_30_3 or not var_30_4))

		local var_30_5 = table.indexof(var_28_3, var_30_1)

		if not var_30_2 then
			setText(arg_30_1:Find("lock/name"), var_30_1:GetSeriesCode())
		elseif var_30_1:IsPass() and var_30_4 then
			setText(arg_30_1:Find("clear/current/name/text"), var_30_1:GetSeriesCode())
			setText(arg_30_1:Find("clear/common/name"), var_30_1:GetSeriesCode())
			setActive(arg_30_1:Find("clear/common"), true)
			setActive(arg_30_1:Find("clear/current"), false)
		else
			setText(arg_30_1:Find("active/current/name/text"), var_30_1:GetSeriesCode())
			setText(arg_30_1:Find("active/common/name"), var_30_1:GetSeriesCode())

			local var_30_6 = var_30_1:GetBossHpRate() * 100 .. "%"

			setText(arg_30_1:Find("active/common/value"), var_30_1:IsPass() and "HOLD" or var_30_6)
			setText(arg_30_1:Find("active/current/value"), var_30_1:IsPass() and "HOLD" or var_30_6)
			setActive(arg_30_1:Find("active/common"), true)
			setActive(arg_30_1:Find("active/current"), false)

			arg_30_1:Find("active/current/progress"):GetComponent(typeof(Image)).fillAmount = var_30_1:IsPass() and 1 or var_30_1:GetBossHpRate()

			local var_30_7 = arg_30_1:Find("active/common/bullets")

			if var_30_5 > 3 then
				setActive(var_30_7, false)
			else
				setActive(var_30_7, true)

				local var_30_8 = _.map(_.range(var_30_7.childCount), function(arg_31_0)
					return var_30_7:GetChild(arg_31_0 - 1)
				end)

				table.Foreach(var_30_8, function(arg_32_0, arg_32_1)
					setActive(arg_32_1, arg_32_0 <= 4 - var_30_5)
				end)
			end
		end

		onButton(arg_28_0, arg_30_1, function()
			if not var_30_2 then
				local var_33_0 = var_30_1:GetPreSeriesId()
				local var_33_1 = ""
				local var_33_2 = 1
				local var_33_3 = var_30_1:GetPreSeriesId()
				local var_33_4 = CollabrateBossRushSeriesData.New({
					id = var_33_3[var_33_2]
				}):GetSeriesCode()

				while var_33_2 < #var_33_3 do
					var_33_2 = var_33_2 + 1

					local var_33_5 = CollabrateBossRushSeriesData.New({
						id = var_33_3[var_33_2]
					})

					var_33_4 = var_33_4 .. "、" .. var_33_5:GetSeriesCode()
				end

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_33_4))

				return
			end

			local function var_33_6()
				arg_28_0._openSeriesData = var_30_1

				PlayerPrefs.SetInt("DAL_ship_position", arg_30_0)

				if not arg_28_0:updateShipPosition() then
					arg_28_0.stageView:ExecuteAction("SetData", var_30_1)
					arg_28_0.stageView:ExecuteAction("Show")

					arg_28_0.battleNodes:GetComponent(typeof(CanvasGroup)).interactable = true
				end
			end

			local var_33_7 = var_30_1:GetInitStory()

			if var_33_7 then
				arg_28_0:PlayStory(var_33_7, var_33_6)
			else
				var_33_6()
			end
		end, SFX_PANEL)
	end)
	arg_28_0:updateShipPosition()
	arg_28_0:addbubbleMsgBoxList({
		function(arg_35_0)
			arg_28_0:checkAllStory()
			arg_35_0()
		end,
		function(arg_36_0)
			local var_36_0 = arg_28_0.activity:getConfig("config_client").first_story
			local var_36_1 = arg_28_0.activity:getConfig("config_client").first_guide

			if first_guide then
				local function var_36_2()
					pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_36_1, nil, arg_36_0)
				end

				arg_28_0:PlayStory(var_36_0, var_36_2)
			else
				arg_28_0:PlayStory(var_36_0, arg_36_0)
			end
		end
	})
end

function var_0_0.updateCurrent(arg_38_0, arg_38_1)
	table.Foreach(arg_38_0.seriesNodes, function(arg_39_0, arg_39_1)
		setActive(arg_39_1:Find("clear/common"), arg_38_1 ~= arg_39_1)
		setActive(arg_39_1:Find("clear/current"), arg_38_1 == arg_39_1)
		setActive(arg_39_1:Find("active/common"), arg_38_1 ~= arg_39_1)
		setActive(arg_39_1:Find("active/current"), arg_38_1 == arg_39_1)

		if arg_38_1 == arg_39_1 then
			arg_38_0:playAnima(arg_38_1, "anim_BossRushDALCollabUI_battle_in")
		end
	end)
end

function var_0_0.updateShipPosition(arg_40_0)
	local var_40_0 = PlayerPrefs.GetInt("DAL_ship_position", 1)
	local var_40_1 = arg_40_0.activity:GetActiveSeriesIds()

	table.Foreach(arg_40_0.seriesNodes, function(arg_41_0, arg_41_1)
		local var_41_0 = var_40_1[arg_41_0]
		local var_41_1 = arg_41_1:Find("ship")

		var_41_1:GetComponent(typeof(Animation)):Stop()

		if var_40_0 == var_41_0 then
			arg_40_0:updateCurrent(arg_41_1)

			arg_40_0._currentShip = var_41_1
		elseif var_41_1 ~= arg_40_0._lastShip then
			setActive(arg_41_1:Find("ship"), false)
		end
	end)

	if arg_40_0._lastShip then
		if arg_40_0._lastShip ~= arg_40_0._currentShip then
			arg_40_0:playAnima(arg_40_0._lastShip, "anim_BossRushDALCollabUI_ship_out")
			setActive(arg_40_0._lastShip:Find("vx_teleport_2"), true)

			arg_40_0.battleNodes:GetComponent(typeof(CanvasGroup)).interactable = false
		end
	else
		setActive(arg_40_0._currentShip, true)
		setActive(arg_40_0._currentShip:Find("vx_teleport_1"), true)
		arg_40_0:playAnima(arg_40_0._currentShip, "anim_BossRushDALCollabUI_ship_in")
	end

	return arg_40_0._lastShip ~= arg_40_0._currentShip
end

function var_0_0.checkAllStory(arg_42_0)
	local var_42_0 = arg_42_0.activity:GetCollabSeriesDataList()
	local var_42_1 = {}

	for iter_42_0, iter_42_1 in pairs(var_42_0) do
		if table.contains(arg_42_0.activity:GetPassCounts(), iter_42_0) then
			local var_42_2 = iter_42_1:GetStorys()

			for iter_42_2, iter_42_3 in ipairs(var_42_2) do
				table.insert(var_42_1, iter_42_3)
			end
		end
	end

	local var_42_3 = 1

	local function var_42_4()
		var_42_3 = var_42_3 + 1

		local var_43_0 = var_42_1[var_42_3]
		local var_43_1
		local var_43_2 = arg_42_0.activity:getConfig("config_client").storys_unlock_story

		if var_43_0 == nil and var_43_2 then
			local var_43_3 = pg.NewStoryMgr.GetInstance()

			var_43_1 = true

			for iter_43_0, iter_43_1 in ipairs(var_43_2[2]) do
				var_43_1 = var_43_1 and var_43_3:IsPlayed(iter_43_1)
			end

			var_43_1 = var_43_1 and not var_43_3:IsPlayed(var_43_2[1])
		end

		if var_43_1 then
			local function var_43_4()
				setActive(arg_42_0.shiftMap:Find("map_6"), false)
				arg_42_0:PlayMapShiftAnima("", "_3")
			end

			arg_42_0:PlayStory(var_43_2[1], var_43_4)
		else
			arg_42_0:PlayStory(var_43_0, var_42_4)
		end
	end

	arg_42_0:PlayStory(var_42_1[var_42_3], var_42_4)
end

function var_0_0.GetFinalStoryName(arg_45_0)
	local var_45_0 = arg_45_0.activity:GetCollabSeriesDataList()[6]
	local var_45_1 = Clone(var_45_0:getConfig("story_worldboss"))

	table.sort(var_45_1, function(arg_46_0, arg_46_1)
		return arg_46_0[2] < arg_46_1[2]
	end)

	return var_45_1[1][1]
end

function var_0_0.PlayStory(arg_47_0, arg_47_1, arg_47_2)
	if not arg_47_1 then
		return
	end

	local var_47_0 = pg.NewStoryMgr.GetInstance()

	if var_47_0:IsPlayed(arg_47_1) then
		return existCall(arg_47_2)
	end

	if arg_47_1 == arg_47_0:GetFinalStoryName() then
		local function var_47_1()
			arg_47_0:PlayMapShiftAnima("_3", "")
		end

		var_47_0:Play(arg_47_1, var_47_1)
	else
		var_47_0:Play(arg_47_1, arg_47_2)
	end
end

function var_0_0.UpdateTasks(arg_49_0, arg_49_1)
	if _.any(arg_49_1, function(arg_50_0)
		return arg_49_0.storyTask and arg_49_0.storyTask.id == arg_50_0
	end) then
		arg_49_0.storyTask.submitTime = 1

		arg_49_0:UpdateView()
	end
end

function var_0_0.addbubbleMsgBoxList(arg_51_0, arg_51_1)
	local var_51_0 = #arg_51_0.ActionSequence == 0

	table.insertto(arg_51_0.ActionSequence, arg_51_1)

	if not var_51_0 then
		return
	end

	arg_51_0:resumeBubble()
end

function var_0_0.addbubbleMsgBox(arg_52_0, arg_52_1)
	local var_52_0 = #arg_52_0.ActionSequence == 0

	table.insert(arg_52_0.ActionSequence, arg_52_1)

	if not var_52_0 then
		return
	end

	arg_52_0:resumeBubble()
end

function var_0_0.resumeBubble(arg_53_0)
	if #arg_53_0.ActionSequence == 0 then
		return
	end

	local var_53_0

	local function var_53_1()
		local var_54_0 = arg_53_0.ActionSequence[1]

		if var_54_0 then
			var_54_0(function()
				table.remove(arg_53_0.ActionSequence, 1)
				var_53_1()
			end)
		end
	end

	var_53_1()
end

function var_0_0.CleanBubbleMsgbox(arg_56_0)
	table.clean(arg_56_0.ActionSequence)
end

function var_0_0.willExit(arg_57_0)
	arg_57_0:OverlayComponent(false)
	arg_57_0.stageView:Destroy()
	arg_57_0.upgradeView:Destroy()
	arg_57_0.loader:Clear()
	var_0_0.super.willExit(arg_57_0)
end

return var_0_0
