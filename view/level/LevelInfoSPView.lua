local var_0_0 = class("LevelInfoSPView", import(".LevelInfoView"))

function var_0_0.getUIName(arg_1_0)
	return "LevelInfoSPUI"
end

function var_0_0.InitUI(arg_2_0)
	var_0_0.super.InitUI(arg_2_0)

	arg_2_0.levelBanner = arg_2_0._tf:Find("panel/Level")
	arg_2_0.btnSwitchNormal = arg_2_0._tf:Find("panel/Difficulty/Normal")
	arg_2_0.btnSwitchHard = arg_2_0._tf:Find("panel/Difficulty/Hard")
	arg_2_0.btnAnim = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.btnAniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.btnAniEvent:SetEndEvent(function()
		arg_2_0:playButtonLoopFX()
	end)
end

function var_0_0.playButtonLoopFX(arg_4_0)
	if arg_4_0.btnAnim:IsPlaying("Anim_LevelInfoSPUI_NormalSelected") then
		arg_4_0.btnAnim:Play("Anim_LevelInfoSPUI_NormalInLoop")
	else
		arg_4_0.btnAnim:Play("Anim_LevelInfoSPUI_DifficultyInLoop")
	end
end

function var_0_0.SetChapterGroupInfo(arg_5_0, arg_5_1)
	arg_5_0.groupInfo = arg_5_1
end

function var_0_0.set(arg_6_0, arg_6_1, arg_6_2)
	var_0_0.super.set(arg_6_0, arg_6_1, arg_6_2)

	local var_6_0 = getProxy(ChapterProxy):getChapterById(arg_6_1, true)
	local var_6_1 = arg_6_0.groupInfo

	assert(var_6_1)

	local var_6_2 = {
		"Normal",
		"Hard"
	}
	local var_6_3 = 1
	local var_6_4

	if #var_6_1 > 1 then
		local var_6_5 = table.indexof(var_6_1, arg_6_1)

		var_6_3 = var_6_5
		var_6_4 = var_6_1[#var_6_1 - var_6_5 + 1]
	elseif var_6_0:IsSpChapter() or var_6_0:IsEXChapter() then
		var_6_3 = 2
	end

	for iter_6_0, iter_6_1 in ipairs(var_6_2) do
		setActive(arg_6_0.titleBG:Find(iter_6_1), iter_6_0 == var_6_3)
	end

	for iter_6_2, iter_6_3 in ipairs(var_6_2) do
		setActive(arg_6_0.levelBanner:Find(iter_6_3), iter_6_2 == var_6_3)
	end

	if #var_6_1 > 1 then
		setActive(arg_6_0.btnSwitchNormal, var_6_3 == 1)
		setActive(arg_6_0.btnSwitchHard, var_6_3 == 2)

		local var_6_6 = var_6_3 == 1 and "Normal" or "Difficulty"
		local var_6_7 = "Anim_LevelInfoSPUI_" .. var_6_6 .. "Selected"

		arg_6_0.btnAnim:Play(var_6_7)
	else
		setActive(arg_6_0.btnSwitchNormal, false)
		setActive(arg_6_0.btnSwitchNormal, false)
	end

	if #var_6_1 > 1 then
		local var_6_8 = var_6_3 == 1 and arg_6_0.btnSwitchNormal or arg_6_0.btnSwitchHard

		for iter_6_4 = 1, 2 do
			local var_6_9 = var_6_8:Find("Bonus" .. iter_6_4)
			local var_6_10 = getProxy(ChapterProxy):getChapterById(var_6_1[iter_6_4], true)
			local var_6_11 = var_6_10:GetDailyBonusQuota()

			setActive(var_6_9, var_6_11)

			if var_6_11 then
				local var_6_12 = getProxy(ChapterProxy):getMapById(var_6_10:getConfig("map")):getConfig("type") == Map.ACTIVITY_HARD and "bonus_us_hard" or "bonus_us"

				arg_6_0.loader:GetSprite("ui/levelmainscene_atlas", var_6_12, var_6_9:Find("Image"))
			end
		end
	end

	local var_6_13 = var_6_3 == 1 and Color.NewHex("FFDE38") or Color.white

	setTextColor(arg_6_0:findTF("title_index", arg_6_0.txTitle), var_6_13)
	setTextColor(arg_6_0:findTF("title", arg_6_0.txTitle), var_6_13)
	setTextColor(arg_6_0:findTF("title_en", arg_6_0.txTitle), var_6_13)

	local var_6_14 = var_6_0:getConfig("boss_expedition_id")

	if var_6_0:getPlayType() == ChapterConst.TypeMultiStageBoss then
		var_6_14 = pg.chapter_model_multistageboss[var_6_0.id].boss_expedition_id
	end

	local var_6_15 = pg.expedition_data_template[var_6_14[#var_6_14]].level

	setText(arg_6_0.levelBanner:Find("Text"), "LV " .. var_6_15)
	onButton(arg_6_0, arg_6_0.btnSwitchNormal:Find("Switch"), function()
		arg_6_0:emit(LevelUIConst.SWITCH_SPCHAPTER_DIFFICULTY, var_6_4)
		arg_6_0:set(var_6_4)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.btnSwitchHard:Find("Switch"), function()
		arg_6_0:emit(LevelUIConst.SWITCH_SPCHAPTER_DIFFICULTY, var_6_4)
		arg_6_0:set(var_6_4)
	end, SFX_PANEL)
	;(function()
		if IsUnityEditor and not ENABLE_GUIDE then
			return
		end

		if var_6_3 ~= 1 or #var_6_1 == 1 then
			return
		end

		local var_9_0 = "NG0045"

		if pg.NewStoryMgr.GetInstance():IsPlayed(var_9_0) then
			return
		end

		pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_9_0)
	end)()
end

return var_0_0
