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

	arg_7_0.mapDftEvt:SetEndEvent(function()
		for iter_11_0, iter_11_1 in pairs(arg_7_0.shiftMapList) do
			local var_11_0

			var_11_0.sprite, var_11_0 = iter_11_1:GetComponent(typeof(Image)).sprite, arg_7_0.maps[iter_11_0]:GetComponent(typeof(Image))

			var_11_0:SetNativeSize()
		end
	end)

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
		local var_26_0 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_26_0 .. arg_26_1)

		setImageSprite(iter_26_1, var_26_0, true)
	end

	for iter_26_2, iter_26_3 in pairs(arg_26_0.shiftMapList) do
		local var_26_1 = GetSpriteFromAtlas("ui/dalcollabbossrushsceneui_atlas", "map_" .. iter_26_2 .. arg_26_2)

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
		setActive(arg_28_0.mapFX:Find("state_4/7"), true)

		for iter_28_0, iter_28_1 in pairs(arg_28_0.maps) do
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

					setActive(arg_28_0.mapFX:Find("state_4/5"), true)
				else
					setActive(arg_28_0.mapFX:Find("state_4/6"), true)

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

	table.sort(list, function(arg_30_0, arg_30_1)
		return arg_30_0:GetTrafficPerH() > arg_30_1:GetTrafficPerH()
	end)
	table.Foreach(arg_29_0.seriesNodes, function(arg_31_0, arg_31_1)
		local var_31_0 = var_29_1[arg_31_0]
		local var_31_1 = var_29_0:GetCollabSeriesData(var_31_0)
		local var_31_2 = var_31_1:IsPlayerUnlock(var_29_0)
		local var_31_3 = var_31_1:IsPass()
		local var_31_4 = var_31_1:GetDefeated(arg_29_0.activity)

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

			local var_31_7 = arg_31_1:Find("active/common/bullets")

			if var_31_5 > 3 then
				setActive(var_31_7, false)
			else
				setActive(var_31_7, true)

				local var_31_8 = _.map(_.range(var_31_7.childCount), function(arg_32_0)
					return var_31_7:GetChild(arg_32_0 - 1)
				end)

				table.Foreach(var_31_8, function(arg_33_0, arg_33_1)
					setActive(arg_33_1, arg_33_0 <= 4 - var_31_5)
				end)
			end
		end

		onButton(arg_29_0, arg_31_1, function()
			if not var_31_2 then
				local var_34_0 = var_31_1:GetPreSeriesId()
				local var_34_1 = ""
				local var_34_2 = 1
				local var_34_3 = var_31_1:GetPreSeriesId()
				local var_34_4 = CollabrateBossRushSeriesData.New({
					id = var_34_3[var_34_2]
				}):GetSeriesCode()

				while var_34_2 < #var_34_3 do
					var_34_2 = var_34_2 + 1

					local var_34_5 = CollabrateBossRushSeriesData.New({
						id = var_34_3[var_34_2]
					})

					var_34_4 = var_34_4 .. "、" .. var_34_5:GetSeriesCode()
				end

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_34_4))

				return
			end

			local function var_34_6()
				arg_29_0._openSeriesData = var_31_1

				PlayerPrefs.SetInt("DAL_ship_position", arg_31_0)

				if not arg_29_0:updateShipPosition() then
					arg_29_0.stageView:ExecuteAction("SetData", var_31_1)
					arg_29_0.stageView:ExecuteAction("Show")
				end
			end

			local var_34_7 = var_31_1:GetInitStory()

			if var_34_7 then
				arg_29_0:PlayStory(var_34_7, var_34_6)
			else
				var_34_6()
			end
		end, SFX_PANEL)
	end)
	arg_29_0:updateShipPosition()
	arg_29_0:addbubbleMsgBoxList({
		function(arg_36_0)
			arg_29_0:checkAllStory()
			arg_36_0()
		end,
		function(arg_37_0)
			local var_37_0 = arg_29_0.activity:getConfig("config_client").first_story
			local var_37_1 = arg_29_0.activity:getConfig("config_client").first_guide

			if first_guide then
				local function var_37_2()
					pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_37_1, nil, arg_37_0)
				end

				arg_29_0:PlayStory(var_37_0, var_37_2)
			else
				arg_29_0:PlayStory(var_37_0, arg_37_0)
			end
		end
	})
end

function var_0_0.updateCurrent(arg_39_0, arg_39_1)
	table.Foreach(arg_39_0.seriesNodes, function(arg_40_0, arg_40_1)
		setActive(arg_40_1:Find("clear/common"), arg_39_1 ~= arg_40_1)
		setActive(arg_40_1:Find("clear/current"), arg_39_1 == arg_40_1)
		setActive(arg_40_1:Find("active/common"), arg_39_1 ~= arg_40_1)
		setActive(arg_40_1:Find("active/current"), arg_39_1 == arg_40_1)

		if arg_39_1 == arg_40_1 then
			arg_39_0:playAnima(arg_39_1, "anim_BossRushDALCollabUI_battle_in")
		end
	end)
end

function var_0_0.updateShipPosition(arg_41_0)
	local var_41_0 = PlayerPrefs.GetInt("DAL_ship_position", 1)
	local var_41_1 = arg_41_0.activity:GetActiveSeriesIds()

	table.Foreach(arg_41_0.seriesNodes, function(arg_42_0, arg_42_1)
		local var_42_0 = var_41_1[arg_42_0]
		local var_42_1 = arg_42_1:Find("ship")

		var_42_1:GetComponent(typeof(Animation)):Stop()

		if var_41_0 == var_42_0 then
			arg_41_0:updateCurrent(arg_42_1)

			arg_41_0._currentShip = var_42_1
		elseif var_42_1 ~= arg_41_0._lastShip then
			setActive(arg_42_1:Find("ship"), false)
		end
	end)

	if arg_41_0._lastShip then
		if arg_41_0._lastShip ~= arg_41_0._currentShip then
			arg_41_0:playAnima(arg_41_0._lastShip, "anim_BossRushDALCollabUI_ship_out")
			setActive(arg_41_0._lastShip:Find("vx_teleport_2"), true)
		end
	else
		setActive(arg_41_0._currentShip, true)
		setActive(arg_41_0._currentShip:Find("vx_teleport_1"), true)
		arg_41_0:playAnima(arg_41_0._currentShip, "anim_BossRushDALCollabUI_ship_in")
	end

	return arg_41_0._lastShip ~= arg_41_0._currentShip
end

function var_0_0.checkAllStory(arg_43_0)
	local var_43_0 = arg_43_0.activity:GetCollabSeriesDataList()
	local var_43_1 = {}

	for iter_43_0, iter_43_1 in pairs(var_43_0) do
		if table.contains(arg_43_0.activity:GetPassCounts(), iter_43_0) then
			local var_43_2 = iter_43_1:GetStorys()

			for iter_43_2, iter_43_3 in ipairs(var_43_2) do
				table.insert(var_43_1, iter_43_3)
			end
		end
	end

	local var_43_3 = 1

	local function var_43_4()
		var_43_3 = var_43_3 + 1

		local var_44_0 = var_43_1[var_43_3]
		local var_44_1
		local var_44_2 = arg_43_0.activity:getConfig("config_client").storys_unlock_story

		if var_44_0 == nil and var_44_2 then
			local var_44_3 = pg.NewStoryMgr.GetInstance()

			var_44_1 = true

			for iter_44_0, iter_44_1 in ipairs(var_44_2[2]) do
				var_44_1 = var_44_1 and var_44_3:IsPlayed(iter_44_1)
			end

			var_44_1 = var_44_1 and not var_44_3:IsPlayed(var_44_2[1])
		end

		if var_44_1 then
			local function var_44_4()
				arg_43_0:PlayMapShiftAnima("", "_3")
			end

			arg_43_0:PlayStory(var_44_2[1], var_44_4)
		else
			arg_43_0:PlayStory(var_44_0, var_43_4)
		end
	end

	arg_43_0:PlayStory(var_43_1[var_43_3], var_43_4)
end

function var_0_0.GetFinalStoryName(arg_46_0)
	local var_46_0 = arg_46_0.activity:GetCollabSeriesDataList()[6]
	local var_46_1 = Clone(var_46_0:getConfig("story_worldboss"))

	table.sort(var_46_1, function(arg_47_0, arg_47_1)
		return arg_47_0[2] < arg_47_1[2]
	end)

	return var_46_1[1][1]
end

function var_0_0.PlayStory(arg_48_0, arg_48_1, arg_48_2)
	if not arg_48_1 then
		return
	end

	local var_48_0 = pg.NewStoryMgr.GetInstance()

	if var_48_0:IsPlayed(arg_48_1) then
		return existCall(arg_48_2)
	end

	if arg_48_1 == arg_48_0:GetFinalStoryName() then
		local function var_48_1()
			arg_48_0:PlayMapShiftAnima("_3", "")
		end

		var_48_0:Play(arg_48_1, var_48_1)
	else
		var_48_0:Play(arg_48_1, arg_48_2)
	end
end

function var_0_0.UpdateTasks(arg_50_0, arg_50_1)
	if _.any(arg_50_1, function(arg_51_0)
		return arg_50_0.storyTask and arg_50_0.storyTask.id == arg_51_0
	end) then
		arg_50_0.storyTask.submitTime = 1

		arg_50_0:UpdateView()
	end
end

function var_0_0.addbubbleMsgBoxList(arg_52_0, arg_52_1)
	local var_52_0 = #arg_52_0.ActionSequence == 0

	table.insertto(arg_52_0.ActionSequence, arg_52_1)

	if not var_52_0 then
		return
	end

	arg_52_0:resumeBubble()
end

function var_0_0.addbubbleMsgBox(arg_53_0, arg_53_1)
	local var_53_0 = #arg_53_0.ActionSequence == 0

	table.insert(arg_53_0.ActionSequence, arg_53_1)

	if not var_53_0 then
		return
	end

	arg_53_0:resumeBubble()
end

function var_0_0.resumeBubble(arg_54_0)
	if #arg_54_0.ActionSequence == 0 then
		return
	end

	local var_54_0

	local function var_54_1()
		local var_55_0 = arg_54_0.ActionSequence[1]

		if var_55_0 then
			var_55_0(function()
				table.remove(arg_54_0.ActionSequence, 1)
				var_54_1()
			end)
		end
	end

	var_54_1()
end

function var_0_0.CleanBubbleMsgbox(arg_57_0)
	table.clean(arg_57_0.ActionSequence)
end

function var_0_0.willExit(arg_58_0)
	arg_58_0:OverlayComponent(false)
	arg_58_0.stageView:Destroy()
	arg_58_0.upgradeView:Destroy()
	arg_58_0.loader:Clear()
	var_0_0.super.willExit(arg_58_0)
end

return var_0_0
