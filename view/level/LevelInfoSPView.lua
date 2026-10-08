local var_0_0 = class("LevelInfoSPView", import(".LevelInfoView"))

function var_0_0.getUIName(arg_1_0)
	return "LevelInfoSPUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"ui/levelmainscene_atlas"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))
end

function var_0_0.InitUI(arg_3_0)
	var_0_0.super.InitUI(arg_3_0)

	arg_3_0.levelBanner = arg_3_0._tf:Find("panel/Level")
	arg_3_0.btnSwitchNormal = arg_3_0._tf:Find("panel/Difficulty/Normal")
	arg_3_0.btnSwitchHard = arg_3_0._tf:Find("panel/Difficulty/Hard")
	arg_3_0.tfAnim = arg_3_0._tf:GetComponent(typeof(Animation))
	arg_3_0.tfAniEvent = arg_3_0._tf:GetComponent(typeof(DftAniEvent))

	arg_3_0.tfAniEvent:SetEndEvent(function()
		arg_3_0:playSelectFX()
	end)

	arg_3_0.diffBtn = arg_3_0._tf:Find("panel/Difficulty")
	arg_3_0.btnAnim = arg_3_0._tf:Find("panel/Difficulty"):GetComponent(typeof(Animation))
	arg_3_0.btnAniEvent = arg_3_0._tf:Find("panel/Difficulty"):GetComponent(typeof(DftAniEvent))

	arg_3_0.btnAniEvent:SetEndEvent(function()
		arg_3_0:playButtonLoopFX()
	end)

	arg_3_0.btnAnimNormal = arg_3_0._tf:Find("panel/Difficulty/Mask_Normal")
	arg_3_0.btnAnimHard = arg_3_0._tf:Find("panel/Difficulty/Mask_Difficlty")
	arg_3_0.btnAnimLoopNormal = arg_3_0._tf:Find("panel/Difficulty/Normal/Mask_Normal_Loop/Image")
	arg_3_0.btnAnimLoopHard = arg_3_0._tf:Find("panel/Difficulty/Hard/Mask_Difficulty_Loop")
	arg_3_0.doEaseIn = false
end

function var_0_0.playSelectFX(arg_6_0)
	local var_6_0 = 1

	if #arg_6_0.groupInfo > 1 then
		var_6_0 = table.indexof(arg_6_0.groupInfo, arg_6_0.chapter.id)
	elseif arg_6_0.chapter:IsSpChapter() or arg_6_0.chapter:IsEXChapter() then
		var_6_0 = 2
	end

	if #arg_6_0.groupInfo > 1 then
		if var_6_0 == 2 then
			setActive(arg_6_0.btnAnimNormal, false)
			setActive(arg_6_0.btnAnimLoopNormal, false)
			quickPlayAnimation(arg_6_0.diffBtn, "Anim_LevelInfoSPUI_DifficultySelected")
		else
			setActive(arg_6_0.btnAnimHard, false)
			setActive(arg_6_0.btnAnimLoopHard, false)
			quickPlayAnimation(arg_6_0.diffBtn, "Anim_LevelInfoSPUI_NormalSelected")
		end
	end
end

function var_0_0.playButtonLoopFX(arg_7_0)
	if arg_7_0.btnAnim:IsPlaying("Anim_LevelInfoSPUI_DifficultySelected") then
		quickPlayAnimation(arg_7_0.diffBtn, "Anim_LevelInfoSPUI_DifficultyInLoop")
	elseif arg_7_0.btnAnim:IsPlaying("Anim_LevelInfoSPUI_NormalSelected") then
		quickPlayAnimation(arg_7_0.diffBtn, "Anim_LevelInfoSPUI_NormalInLoop")
	end
end

function var_0_0.SetChapterGroupInfo(arg_8_0, arg_8_1)
	arg_8_0.groupInfo = arg_8_1
end

function var_0_0.Show(arg_9_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_9_0._tf, {
		force = true
	})
	setActive(arg_9_0._tf, true)
	quickPlayAnimation(arg_9_0._tf, "Anim_LevelInfoSPUI_in")
end

function var_0_0.setAfterResDownload(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	var_0_0.super.setAfterResDownload(arg_10_0, arg_10_1, arg_10_2, arg_10_3)

	local var_10_0 = arg_10_0.groupInfo

	assert(var_10_0)

	local var_10_1 = {
		"Normal",
		"Hard"
	}
	local var_10_2 = 1
	local var_10_3

	if #var_10_0 > 1 then
		local var_10_4 = table.indexof(var_10_0, arg_10_1)

		var_10_2 = var_10_4
		var_10_3 = var_10_0[#var_10_0 - var_10_4 + 1]
	elseif arg_10_3:IsSpChapter() or arg_10_3:IsEXChapter() then
		var_10_2 = 2
	end

	for iter_10_0, iter_10_1 in ipairs(var_10_1) do
		setActive(arg_10_0.titleBG:Find(iter_10_1), iter_10_0 == var_10_2)
	end

	for iter_10_2, iter_10_3 in ipairs(var_10_1) do
		setActive(arg_10_0.levelBanner:Find(iter_10_3), iter_10_2 == var_10_2)
	end

	setActive(arg_10_0.btnSwitchNormal, #var_10_0 > 1 and var_10_2 == 1)
	setActive(arg_10_0.btnSwitchHard, #var_10_0 > 1 and var_10_2 == 2)

	if #var_10_0 > 1 then
		local var_10_5 = var_10_2 == 1 and arg_10_0.btnSwitchNormal or arg_10_0.btnSwitchHard

		for iter_10_4 = 1, 2 do
			local var_10_6 = var_10_5:Find("Bonus" .. iter_10_4)
			local var_10_7 = getProxy(ChapterProxy):getChapterById(var_10_0[iter_10_4], true)
			local var_10_8 = var_10_7:GetDailyBonusQuota()

			setActive(var_10_6, var_10_8)

			if var_10_8 then
				GetImageSpriteFromAtlasAsync("ui/levelmainscene_atlas", "bonusX" .. var_10_7:GetDailyBonusRate(), var_10_6:Find("Image"), true)

				local var_10_9 = getProxy(ChapterProxy):getMapById(var_10_7:getConfig("map"))
				local var_10_10 = getProxy(ActivityProxy):getActivityById(var_10_9:getConfig("on_activity")):GetConfigClientPTActivity()
				local var_10_11 = var_10_10 and var_10_10:GetPTDrop()

				GetImageSpriteFromAtlasAsync(var_10_11:getIcon(), "", var_10_6:Find("Image/icon"), true)
			end
		end
	end

	local var_10_12 = var_10_2 == 1 and Color.NewHex("FFDE38") or Color.white

	setTextColor(arg_10_0.txTitle:Find("title_index"), var_10_12)
	setTextColor(arg_10_0.txTitle:Find("title"), var_10_12)
	setTextColor(arg_10_0.txTitle:Find("title_en"), var_10_12)

	local var_10_13 = arg_10_3:getConfig("boss_expedition_id")

	if arg_10_3:getPlayType() == ChapterConst.TypeMultiStageBoss then
		var_10_13 = pg.chapter_model_multistageboss[arg_10_3.id].boss_expedition_id
	end

	local var_10_14 = pg.expedition_data_template[var_10_13[#var_10_13]].level

	setText(arg_10_0.levelBanner:Find("Text"), "LV " .. var_10_14)
	onButton(arg_10_0, arg_10_0.btnSwitchNormal:Find("Switch"), function()
		setActive(arg_10_0.btnAnimNormal, false)
		setActive(arg_10_0.btnAnimLoopNormal, false)
		quickPlayAnimation(arg_10_0.diffBtn, "Anim_LevelInfoSPUI_DifficultySelected")
		arg_10_0:emit(LevelUIConst.SWITCH_SPCHAPTER_DIFFICULTY, var_10_3)
		arg_10_0:set(var_10_3)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.btnSwitchHard:Find("Switch"), function()
		setActive(arg_10_0.btnAnimHard, false)
		setActive(arg_10_0.btnAnimLoopHard, false)
		quickPlayAnimation(arg_10_0.diffBtn, "Anim_LevelInfoSPUI_NormalSelected")
		arg_10_0:emit(LevelUIConst.SWITCH_SPCHAPTER_DIFFICULTY, var_10_3)
		arg_10_0:set(var_10_3)
	end, SFX_PANEL)
	;(function()
		if IsUnityEditor and not ENABLE_GUIDE then
			return
		end

		if var_10_2 ~= 1 or #var_10_0 == 1 then
			return
		end

		local var_13_0 = "NG0045"

		if pg.NewStoryMgr.GetInstance():IsPlayed(var_13_0) then
			return
		end

		pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_13_0)
	end)()
end

return var_0_0
