local var_0_0 = class("ReversePacmanSelectScene", import("view.base.BaseUI"))

var_0_0.LEVEL_TYPES = {
	EASY = 1,
	HARD = 2
}
var_0_0.SHIP_TYPES = {
	ALL = 0,
	FOLLOW = 1,
	FLEXIBLE = 3,
	PREJUDGE = 2
}

local var_0_1 = pg.activity_chasing_level
local var_0_2 = pg.activity_chasing_character

function var_0_0.getUIName(arg_1_0)
	return "ReversePacmanSelectUI"
end

function var_0_0.init(arg_2_0)
	setText(arg_2_0.uiDeployTipText, i18n("reverse_pacman_deploy_tip"))
	setText(arg_2_0.uiLevelPanelTF:Find("left/title/Text"), i18n("reverse_pacman_select_level_title"))
	setText(arg_2_0.uiShipPanelTF:Find("left/title/Text"), i18n("reverse_pacman_select_ship_title"))
	onButton(arg_2_0, arg_2_0.uiTopTF:Find("back"), function()
		arg_2_0:onBackPressed()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiTopTF:Find("home"), function()
		arg_2_0:quickExitFunc()
	end, SOUND_BACK)
	setActive(arg_2_0.uiLevelPanelTF, true)
	eachChild(arg_2_0.uiLevelTogglesTF, function(arg_5_0)
		local var_5_0 = tonumber(arg_5_0.name)

		setText(arg_5_0:Find("Text"), i18n("reverse_pacman_level_type_" .. var_5_0))
		onToggle(arg_2_0, arg_5_0, function(arg_6_0)
			if arg_6_0 then
				arg_2_0:UpdateLevelList(var_5_0)
			end
		end)
	end)

	arg_2_0.levelUIList = UIItemList.New(arg_2_0.uiLevelContentTF, arg_2_0.uiLevelContentTF:Find("tpl"))

	arg_2_0.levelUIList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateLevelTpl(arg_7_1, arg_7_2)
		end
	end)
	onButton(arg_2_0, arg_2_0.uiDeployBtn, function()
		arg_2_0:SwitchShipView()
	end, SFX_PANEL)

	arg_2_0.awardUIList = UIItemList.New(arg_2_0.uiMapAwardTF, arg_2_0.uiMapAwardTF:Find("tpl"))

	arg_2_0.awardUIList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_2_0.awards[arg_9_1 + 1]

			updateDrop(arg_9_2, var_9_0)
			onButton(arg_2_0, arg_9_2, function()
				arg_2_0:emit(BaseUI.ON_DROP, var_9_0)
			end, SFX_PANEL)

			local var_9_1 = arg_2_0.levelGradeRecords[arg_2_0.selLevelId]

			setActive(arg_9_2:Find("got"), var_9_1)
		end
	end)
	setActive(arg_2_0.uiShipPanelTF, false)
	eachChild(arg_2_0.uiShipTogglesTF, function(arg_11_0)
		local var_11_0 = tonumber(arg_11_0.name)

		setText(arg_11_0:Find("Text"), var_11_0)
		setText(arg_11_0:Find("Text"), i18n("reverse_pacman_ship_type_" .. var_11_0))
		onToggle(arg_2_0, arg_11_0, function(arg_12_0)
			if arg_12_0 then
				arg_2_0:UpdateShipList(var_11_0)
			end
		end)
	end)

	arg_2_0.shipUIList = UIItemList.New(arg_2_0.uiShipContentTF, arg_2_0.uiShipContentTF:Find("tpl"))

	arg_2_0.shipUIList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateShipTpl(arg_13_1, arg_13_2)
		end
	end)
	onButton(arg_2_0, arg_2_0.uiAutoBtn, function()
		arg_2_0:ApplyAutoDeploy()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiStartBtn, function()
		if not underscore.any(arg_2_0.slotShipIds, function(arg_16_0)
			return arg_16_0 ~= 0
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("reverse_pacman_deploy_empty"))

			return
		end

		local var_15_0 = {}

		for iter_15_0, iter_15_1 in ipairs(arg_2_0.buffIds) do
			if iter_15_1 ~= 0 then
				local var_15_1 = pg.activity_chasing_skill[iter_15_1].item_id

				var_15_0[iter_15_0] = arg_2_0.activity:GetVitemNumber(var_15_1)
			else
				var_15_0[iter_15_0] = 0
			end
		end

		local var_15_2 = pg.activity_chasing_skill[ReversePacmanConst.BUFF_EDU].item_id
		local var_15_3 = arg_2_0.activity:GetVitemNumber(var_15_2)

		arg_2_0:emit(ReversePacmanSelectMediator.GO_SCENE, SCENE.REVERSE_PACMAN_GAME, {
			levelId = arg_2_0.selLevelId,
			slotShipIds = arg_2_0.slotShipIds,
			buffIds = arg_2_0.buffIds,
			buffCnts = var_15_0,
			eduBuffCnt = var_15_3
		})
	end, SFX_PANEL)

	arg_2_0.buffSlotUIList = UIItemList.New(arg_2_0.uiBuffSlotsTF, arg_2_0.uiBuffSlotsTF:Find("tpl"))

	arg_2_0.buffSlotUIList:make(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 == UIItemList.EventUpdate then
			local var_17_0 = arg_2_0.buffIds[arg_17_1 + 1]
			local var_17_1 = var_17_0 == 0

			setActive(arg_17_2:Find("empty"), var_17_1)
			setActive(arg_17_2:Find("icon"), not var_17_1)

			if not var_17_1 then
				LoadImageSpriteAsync(pg.activity_chasing_skill[var_17_0].icon, arg_17_2:Find("icon"))
			end

			setActive(arg_17_2:Find("Text"), false)
			onButton(arg_2_0, arg_17_2, function()
				arg_2_0.buffSubView:ExecuteAction("Show", arg_2_0.mapData.skillSlotCount, function()
					arg_2_0:UpdateShipViewWithBuff()
				end)
			end, SFX_PANEL)
		end
	end)

	arg_2_0.buffSubView = ReversePacmanBuffSubView.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
end

function var_0_0.SetData(arg_20_0)
	arg_20_0.activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN)

	assert(arg_20_0.activity and not arg_20_0.activity:isEnd(), "not exist act, type: " .. ActivityConst.ACTIVITY_TYPE_REVERSE_PACMAN)

	arg_20_0.mapDataDic = {}

	for iter_20_0, iter_20_1 in ipairs(var_0_1.all) do
		local var_20_0 = var_0_1[iter_20_1].map_json

		arg_20_0.mapDataDic[iter_20_1] = require("view.activity.ReversePacman.Maps." .. var_20_0)
	end

	arg_20_0.gridType2tpl = {
		[ReversePacmanConst.GRID.BLOCK] = arg_20_0.uiMapTpls:Find("block"),
		[ReversePacmanConst.GRID.ROAD] = arg_20_0.uiMapTpls:Find("road"),
		[ReversePacmanConst.GRID.SPAWN] = arg_20_0.uiMapTpls:Find("spawn"),
		[ReversePacmanConst.GRID.DEPLOY] = arg_20_0.uiMapTpls:Find("deploy")
	}
	arg_20_0.levelTimeRecords = arg_20_0.activity:GetStageDataList()

	local var_20_1 = underscore.keys(arg_20_0.levelTimeRecords)

	arg_20_0.unlockHard = #var_20_1 > 0
	arg_20_0.levelGradeRecords = {}

	for iter_20_2, iter_20_3 in ipairs(var_20_1) do
		local var_20_2 = arg_20_0.levelTimeRecords[iter_20_3]
		local var_20_3 = arg_20_0.mapDataDic[iter_20_3].duration
		local var_20_4 = arg_20_0.mapDataDic[iter_20_3].ratingThresholds
		local var_20_5 = ReversePacmanConst.GetGrade(var_20_3 - var_20_2, var_20_3, var_20_4)

		arg_20_0.levelGradeRecords[iter_20_3] = var_20_5
	end

	arg_20_0.allSortShipIds = arg_20_0.activity:GetRoleIds()

	table.sort(arg_20_0.allSortShipIds, CompareFuncs({
		function(arg_21_0)
			return -var_0_2[arg_21_0].base_speed
		end,
		function(arg_22_0)
			return arg_22_0
		end
	}))
end

function var_0_0.didEnter(arg_23_0)
	arg_23_0:SetData()

	local var_23_0 = arg_23_0.uiLevelTogglesTF:Find(tostring(var_0_0.LEVEL_TYPES.HARD))

	setActive(var_23_0:Find("lock"), not arg_23_0.unlockHard)
	onButton(arg_23_0, var_23_0:Find("lock"), function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("reverse_pacman_select_level_lock_tip"))
	end, SFX_PANEL)
	arg_23_0:UpdateLevelToggleTips()
	setToggleEnabled(var_23_0, arg_23_0.unlockHard)

	local var_23_1 = arg_23_0.contextData.levelType or var_0_0.LEVEL_TYPES.EASY

	triggerToggle(arg_23_0.uiLevelTogglesTF:Find(tostring(var_23_1)), true)
end

function var_0_0.UpdateLevelToggleTips(arg_25_0)
	local var_25_0 = underscore.any(var_0_1.all, function(arg_26_0)
		local var_26_0 = arg_25_0.activity:IsUnlockStage(arg_26_0)
		local var_26_1 = arg_25_0.levelGradeRecords[arg_26_0]

		return var_0_1[arg_26_0].difficulty == var_0_0.LEVEL_TYPES.EASY and var_26_0 and not var_26_1 and arg_25_0.activity:IsLevelTip(arg_26_0)
	end)

	setActive(arg_25_0.uiLevelTogglesTF:Find(tostring(var_0_0.LEVEL_TYPES.EASY) .. "/tip"), var_25_0)

	local var_25_1 = underscore.any(var_0_1.all, function(arg_27_0)
		local var_27_0 = arg_25_0.activity:IsUnlockStage(arg_27_0)
		local var_27_1 = arg_25_0.levelGradeRecords[arg_27_0]

		return var_0_1[arg_27_0].difficulty == var_0_0.LEVEL_TYPES.HARD and var_27_0 and not var_27_1 and arg_25_0.activity:IsLevelTip(arg_27_0)
	end)

	setActive(arg_25_0.uiLevelTogglesTF:Find(tostring(var_0_0.LEVEL_TYPES.HARD) .. "/tip"), var_25_1)
end

function var_0_0.SwitchLevelView(arg_28_0)
	setActive(arg_28_0.uiLevelPanelTF, true)
	setActive(arg_28_0.uiDeployBtn, true)
	setActive(arg_28_0._tf:Find("right/awards"), true)
	setActive(arg_28_0.uiShipPanelTF, false)
	arg_28_0:SetDeployVisibility(false)
end

function var_0_0.UpdateLevelList(arg_29_0, arg_29_1)
	arg_29_0.levelType = arg_29_1
	arg_29_0.contextData.levelType = arg_29_1
	arg_29_0.showLevelIds = {}

	for iter_29_0, iter_29_1 in ipairs(var_0_1.all) do
		if var_0_1[iter_29_1].difficulty == arg_29_1 then
			table.insert(arg_29_0.showLevelIds, iter_29_1)
		end
	end

	arg_29_0.levelUIList:align(#arg_29_0.showLevelIds)

	local var_29_0 = (function()
		for iter_30_0, iter_30_1 in ipairs(arg_29_0.showLevelIds) do
			if not arg_29_0.levelGradeRecords[iter_30_1] and arg_29_0.activity:IsUnlockStage(iter_30_1) then
				return iter_30_1
			end
		end

		return arg_29_0.showLevelIds[1]
	end)()

	triggerButton(arg_29_0.uiLevelContentTF:Find(tostring(var_29_0)))

	local var_29_1 = table.indexof(arg_29_0.showLevelIds, var_29_0)

	scrollToIndex(arg_29_0.levelUIList.container, var_29_1)
end

function var_0_0.UpdateLevelTpl(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_0.showLevelIds[arg_31_1 + 1]

	arg_31_2.name = tostring(var_31_0)

	local var_31_1 = var_0_1[var_31_0]

	setText(arg_31_2:Find("unsel/Text"), var_31_1.name)
	setText(arg_31_2:Find("sel/Text"), var_31_1.name)

	local var_31_2 = arg_31_0.levelGradeRecords[var_31_0]

	setActive(arg_31_2:Find("sel/grade"), var_31_2)
	setActive(arg_31_2:Find("unsel/grade"), var_31_2)

	if var_31_2 then
		LoadImageSpriteAtlasAsync("ui/reversepacmanui_atlas", "level_" .. var_31_2, arg_31_2:Find("sel/grade/Image"))
		LoadImageSpriteAtlasAsync("ui/reversepacmanui_atlas", "level_" .. var_31_2 .. "_1", arg_31_2:Find("unsel/grade/Image"))
	end

	local var_31_3 = arg_31_0.activity:IsUnlockStage(var_31_0)
	local var_31_4 = arg_31_0.selLevelId == var_31_0

	setActive(arg_31_2:Find("lock"), not var_31_3)
	setActive(arg_31_2:Find("sel"), var_31_3 and var_31_4)
	setActive(arg_31_2:Find("unsel"), var_31_3 and not var_31_4)
	setActive(arg_31_2:Find("tip"), var_31_3 and not var_31_2 and arg_31_0.activity:IsLevelTip(var_31_0))

	if not var_31_3 then
		local var_31_5 = var_31_1.unlock_date

		setText(arg_31_2:Find("lock/Text"), var_31_1.unlock_date)

		local var_31_6 = pg.TimeMgr.GetInstance()
		local var_31_7 = var_31_6:parseTimeFromConfig(var_31_5[1])
		local var_31_8 = var_31_6:STimeDescS(var_31_7, "%m")
		local var_31_9 = var_31_6:STimeDescS(var_31_7, "%d")

		setText(arg_31_2:Find("lock/Text"), i18n("reverse_pacman_unlock_date_tip", var_31_8, var_31_9))
	end

	onButton(arg_31_0, arg_31_2, function()
		if not var_31_3 then
			return
		end

		if arg_31_0.selLevelId and var_31_0 == arg_31_0.selLevelId then
			return
		end

		if not var_31_2 then
			arg_31_0.activity:SetLevelTip(var_31_0)
			setActive(arg_31_2:Find("tip"), false)
			arg_31_0:UpdateLevelToggleTips()
		end

		arg_31_0.selLevelId = var_31_0

		arg_31_0.levelUIList:align(#arg_31_0.showLevelIds)
		arg_31_0:UpdateLevelView()
	end, SFX_PANEL)
end

function var_0_0.UpdateLevelView(arg_33_0)
	local var_33_0 = var_0_1[arg_33_0.selLevelId]

	arg_33_0.mapData = arg_33_0.mapDataDic[arg_33_0.selLevelId]

	setText(arg_33_0.uiMapInfosTF:Find("terrain"), var_33_0.terrain_tags)
	setText(arg_33_0.uiMapInfosTF:Find("time"), arg_33_0.mapData.duration .. "s")
	setText(arg_33_0.uiMapInfosTF:Find("monster_cnt"), #arg_33_0.mapData.spawnPoints)
	setText(arg_33_0.uiMapInfosTF:Find("monster_speed"), var_33_0.monster_speed_rating)

	local var_33_1 = arg_33_0.levelGradeRecords[arg_33_0.selLevelId]

	setActive(arg_33_0.uiMapGradeExistTF, var_33_1)
	setActive(arg_33_0.uiMapGradeNoTF, not var_33_1)

	if var_33_1 then
		LoadImageSpriteAtlasAsync("ui/reversepacmanui_atlas", "level_" .. var_33_1, arg_33_0.uiMapGradeExistTF:Find("Image"), true)
	end

	local var_33_2 = var_33_0.first_clear_reward

	arg_33_0.awards = {}

	if var_33_2 and type(var_33_2) == "table" then
		arg_33_0.awards = underscore.map(var_33_2, function(arg_34_0)
			return Drop.Create(arg_34_0)
		end)
	end

	arg_33_0.awardUIList:align(#arg_33_0.awards)
	arg_33_0:UpdateMap()
	arg_33_0:SetDeployVisibility(false)
end

function var_0_0.UpdateMap(arg_35_0)
	removeAllChildren(arg_35_0.uiMapGridsTF)
	removeAllChildren(arg_35_0.uiMapRolesTF)

	local var_35_0 = ReversePacmanConst.GRID_SIZE_2
	local var_35_1 = {
		x = arg_35_0.mapData.width * var_35_0.x,
		y = arg_35_0.mapData.height * var_35_0.y
	}

	setSizeDelta(arg_35_0.uiMapGridsTF, var_35_1)
	setSizeDelta(arg_35_0.uiMapRolesTF, var_35_1)

	arg_35_0.deployTFs = {}
	arg_35_0.deployPosList = {}
	arg_35_0.monsterPosList = {}

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.mapData.grid) do
		for iter_35_2, iter_35_3 in ipairs(iter_35_1) do
			local var_35_2 = iter_35_3 ~= ReversePacmanConst.GRID.BLOCK and ReversePacmanConst.GRID.ROAD or ReversePacmanConst.GRID.BLOCK
			local var_35_3 = cloneTplTo(arg_35_0.gridType2tpl[var_35_2], arg_35_0.uiMapGridsTF)

			var_35_3.name = iter_35_2 .. "_" .. iter_35_0

			setActive(var_35_3, true)

			local var_35_4 = (iter_35_2 - 1) * var_35_0.x - var_35_1.x / 2 + var_35_0.x / 2
			local var_35_5 = var_35_1.y / 2 - (iter_35_0 - 1) * var_35_0.y - var_35_0.y / 2

			setLocalPosition(var_35_3, Vector2(var_35_4, var_35_5))

			if iter_35_3 == ReversePacmanConst.GRID.DEPLOY then
				local var_35_6 = cloneTplTo(arg_35_0.gridType2tpl[iter_35_3], arg_35_0.uiMapRolesTF)

				table.insert(arg_35_0.deployTFs, var_35_6)
				table.insert(arg_35_0.deployPosList, {
					x = iter_35_2,
					y = iter_35_0
				})
				setLocalPosition(var_35_6, Vector2(var_35_4, var_35_5))
			elseif iter_35_3 == ReversePacmanConst.GRID.SPAWN then
				local var_35_7 = cloneTplTo(arg_35_0.gridType2tpl[iter_35_3], arg_35_0.uiMapRolesTF)

				table.insert(arg_35_0.monsterPosList, {
					x = iter_35_2,
					y = iter_35_0
				})
				setLocalPosition(var_35_7, Vector2(var_35_4, var_35_5))
			end
		end
	end

	for iter_35_4, iter_35_5 in ipairs(arg_35_0.deployTFs) do
		onButton(arg_35_0, iter_35_5, function()
			if arg_35_0.selSlot and arg_35_0.selSlot == iter_35_4 then
				return
			end

			arg_35_0.selSlot = iter_35_4

			arg_35_0:UpdateShipViewWithShipOrSlot()
		end, SFX_PANEL)
	end
end

function var_0_0.SetDeployVisibility(arg_37_0, arg_37_1)
	for iter_37_0, iter_37_1 in ipairs(arg_37_0.deployTFs) do
		setActive(iter_37_1, arg_37_1)
	end
end

function var_0_0.SwitchShipView(arg_38_0)
	setActive(arg_38_0.uiLevelPanelTF, false)
	setActive(arg_38_0.uiDeployBtn, false)
	setActive(arg_38_0._tf:Find("right/awards"), false)
	setActive(arg_38_0.uiShipPanelTF, true)
	arg_38_0:SetDeployVisibility(true)

	arg_38_0.slotShipIds = {}

	for iter_38_0 = 1, #arg_38_0.deployTFs do
		table.insert(arg_38_0.slotShipIds, 0)
	end

	arg_38_0.selSlot = 1

	if not arg_38_0.shipType then
		triggerToggle(arg_38_0.uiShipTogglesTF:Find(tostring(var_0_0.SHIP_TYPES.ALL)), true)
	end

	arg_38_0:UpdateShipView()
end

function var_0_0.UpdateShipView(arg_39_0)
	arg_39_0:UpdateShipViewWithShipOrSlot()
	arg_39_0:UpdateShipViewWithBuff()
end

function var_0_0.UpdateShipList(arg_40_0, arg_40_1)
	arg_40_0.shipType = arg_40_1
	arg_40_0.showShipIds = {}

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.allSortShipIds) do
		if arg_40_1 == var_0_0.SHIP_TYPES.ALL or var_0_2[iter_40_1].ai_type == arg_40_1 then
			table.insert(arg_40_0.showShipIds, iter_40_1)
		end
	end

	arg_40_0.shipUIList:align(#arg_40_0.showShipIds)
end

function var_0_0.UpdateShipTpl(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = arg_41_0.showShipIds[arg_41_1 + 1]

	arg_41_2.name = tostring(var_41_0)

	local var_41_1 = var_0_2[var_41_0]

	setText(arg_41_2:Find("name"), HXSet.hxLan(var_41_1.name))
	setActive(arg_41_2:Find("recommend"), table.contains(arg_41_0.recommendIds, var_41_0))
	setActive(arg_41_2:Find("sel"), var_41_0 == arg_41_0.slotShipIds[arg_41_0.selSlot])
	setActive(arg_41_2:Find("occupy"), table.contains(arg_41_0.slotShipIds, var_41_0))
	LoadImageSpriteAsync(var_41_1.sd_avatar, arg_41_2:Find("icon"))

	local var_41_2 = ReversePacmanHomeConst.GetSpeedLevel(var_41_1.base_speed)
	local var_41_3 = arg_41_2:Find("speed/Text")

	setTextColor(var_41_3, Color.white)
	setScrollText(var_41_3, i18n("reverse_pacman_select_ship_speed", var_41_2.value))
	setScrollText(arg_41_2:Find("tags/resume/Text"), var_41_1.resume_text)
	setScrollText(arg_41_2:Find("tags/trait/Text"), var_41_1.trait_text)
	onButton(arg_41_0, arg_41_2, function()
		local var_42_0 = var_41_0

		if arg_41_0.slotShipIds[arg_41_0.selSlot] == var_41_0 then
			var_42_0 = 0
		end

		for iter_42_0, iter_42_1 in ipairs(arg_41_0.slotShipIds) do
			if iter_42_1 == var_41_0 then
				arg_41_0.slotShipIds[iter_42_0] = 0
			end
		end

		arg_41_0.slotShipIds[arg_41_0.selSlot] = var_42_0

		arg_41_0:UpdateShipViewWithShipOrSlot()
		arg_41_0:AutoSelEmotySlot()
	end, SOUND_BACK)
end

function var_0_0.AutoSelEmotySlot(arg_43_0)
	local var_43_0 = (function()
		for iter_44_0, iter_44_1 in ipairs(arg_43_0.slotShipIds) do
			if iter_44_1 == 0 then
				return iter_44_0
			end
		end
	end)()

	if var_43_0 and var_43_0 ~= arg_43_0.selSlot then
		arg_43_0.selSlot = var_43_0

		arg_43_0:UpdateShipViewWithShipOrSlot()
	end
end

function var_0_0.UpdateShipViewWithShipOrSlot(arg_45_0)
	arg_45_0.recommendIds = arg_45_0.mapData.deployPoints[arg_45_0.selSlot].recommendedRoleIds

	table.sort(arg_45_0.showShipIds, CompareFuncs({
		function(arg_46_0)
			return table.contains(arg_45_0.recommendIds, arg_46_0) and 0 or 1
		end,
		function(arg_47_0)
			return arg_47_0
		end
	}))
	arg_45_0.shipUIList:align(#arg_45_0.showShipIds)

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.deployTFs) do
		setActive(iter_45_1:Find("selected"), arg_45_0.selSlot == iter_45_0)
		setActive(iter_45_1:Find("ship"), arg_45_0.slotShipIds[iter_45_0] ~= 0)

		if arg_45_0.slotShipIds[iter_45_0] ~= 0 then
			local var_45_0 = arg_45_0.slotShipIds[iter_45_0]

			LoadImageSpriteAsync(var_0_2[var_45_0].sd_avatar, iter_45_1:Find("ship/Image"))
		end
	end
end

function var_0_0.UpdateShipViewWithBuff(arg_48_0)
	local var_48_0 = arg_48_0.mapData.skillSlotCount

	arg_48_0.buffIds = ReversePacmanBuffSubView.GetSelBuffIds(var_48_0)

	arg_48_0.buffSlotUIList:align(var_48_0)
end

function var_0_0.ApplyAutoDeploy(arg_49_0)
	local var_49_0 = {}
	local var_49_1 = {}
	local var_49_2 = {}

	for iter_49_0, iter_49_1 in ipairs(arg_49_0.allSortShipIds) do
		var_49_0[iter_49_1] = true
	end

	for iter_49_2 = 1, #arg_49_0.deployTFs do
		local var_49_3 = 0
		local var_49_4 = arg_49_0.mapData.deployPoints[iter_49_2]
		local var_49_5 = var_49_4 and var_49_4.recommendedRoleIds or {}

		for iter_49_3, iter_49_4 in ipairs(var_49_5) do
			if var_49_0[iter_49_4] and not var_49_1[iter_49_4] then
				var_49_3 = iter_49_4
				var_49_1[iter_49_4] = true

				break
			end
		end

		arg_49_0.slotShipIds[iter_49_2] = var_49_3

		if var_49_3 == 0 then
			table.insert(var_49_2, iter_49_2)
		end
	end

	table.sort(var_49_2, CompareFuncs({
		function(arg_50_0)
			return arg_49_0:_GetNeaestDis(arg_50_0)
		end,
		function(arg_51_0)
			return arg_51_0
		end
	}))

	local var_49_6 = 1

	for iter_49_5, iter_49_6 in ipairs(var_49_2) do
		while var_49_6 <= #arg_49_0.allSortShipIds and var_49_1[arg_49_0.allSortShipIds[var_49_6]] do
			var_49_6 = var_49_6 + 1
		end

		local var_49_7 = arg_49_0.allSortShipIds[var_49_6]

		if not var_49_7 then
			break
		end

		arg_49_0.slotShipIds[iter_49_6] = var_49_7
		var_49_1[var_49_7] = true
		var_49_6 = var_49_6 + 1
	end

	arg_49_0:UpdateShipViewWithShipOrSlot()
end

function var_0_0._GetNeaestDis(arg_52_0, arg_52_1)
	local var_52_0 = 0
	local var_52_1 = arg_52_0.deployPosList[arg_52_1]

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.monsterPosList) do
		local var_52_2 = math.abs(iter_52_1.x - var_52_1.x) + math.abs(iter_52_1.y - var_52_1.y)

		var_52_0 = var_52_0 == 0 and var_52_2 or math.min(var_52_0, var_52_2)
	end

	return var_52_0
end

function var_0_0.onBackPressed(arg_53_0)
	if arg_53_0.buffSubView and arg_53_0.buffSubView:isShowing() then
		arg_53_0.buffSubView:ExecuteAction("Hide")

		return
	end

	if isActive(arg_53_0.uiShipPanelTF) then
		arg_53_0:SwitchLevelView()

		return
	end

	var_0_0.super.onBackPressed(arg_53_0)
end

function var_0_0.willExit(arg_54_0)
	if arg_54_0.buffSubView then
		arg_54_0.buffSubView:Destroy()

		arg_54_0.buffSubView = nil
	end
end

return var_0_0
