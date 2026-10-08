local var_0_0 = class("BossRushBattleResultLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BattleResultBossRushUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "BattleScene"
end

function var_0_0.Ctor(arg_3_0, ...)
	var_0_0.super.Ctor(arg_3_0, ...)

	arg_3_0.loader = AutoLoader.New()
end

function var_0_0.GetAtalsName(arg_4_0)
	return "ui/battleresult_atlas"
end

function var_0_0.getResource(arg_5_0)
	local var_5_0 = var_0_0.super.getResource(arg_5_0)

	table.insert(var_5_0, arg_5_0:GetAtalsName())

	return var_5_0
end

function var_0_0.preload(arg_6_0, arg_6_1)
	arg_6_0.loader:LoadBundle(arg_6_0:GetAtalsName())
	existCall(arg_6_1)
end

function var_0_0.init(arg_7_0)
	local var_7_0 = arg_7_0._tf:Find("main/Series")

	arg_7_0.resultScroll = var_7_0:Find("Scroll")
	arg_7_0.resultList = var_7_0:Find("Scroll/List")
	arg_7_0.playerExp = var_7_0:Find("playerExp")
	arg_7_0.rightBottomPanel = var_7_0:Find("rightBottomPanel")

	setText(arg_7_0.rightBottomPanel:Find("confirmBtn/Text"), i18n("text_confirm"))
	setText(arg_7_0.resultList:Find("Result/BG/Ships/resulttpl/result/Statistics/kill_count_label"), i18n("battle_result_kill_count"))
	setText(arg_7_0.resultList:Find("Result/BG/Ships/resulttpl/result/Statistics/dmg_count_label"), i18n("battle_result_dmg"))
	setText(arg_7_0.resultList:Find("Result/BG/commanderExp/commander_container"):GetChild(0):Find("empty/add/Text"), i18n("series_enemy_empty_commander_main"))
	setText(arg_7_0.resultList:Find("Result/BG/commanderExp/commander_container"):GetChild(1):Find("empty/add/Text"), i18n("series_enemy_empty_commander_assistant"))
end

local var_0_1 = {
	"sucess_title_bg",
	"fail_title_bg",
	"none_title_bg"
}
local var_0_2 = {
	"1216207f",
	"48160d7f",
	"3c3c3c7f"
}

function var_0_0.didEnter(arg_8_0)
	arg_8_0:BlurPanel(arg_8_0._tf, {
		staticBlur = true,
		lockGlobalBlur = true
	})

	local var_8_0 = arg_8_0.contextData.seriesData
	local var_8_1 = var_8_0:GetBattleStatistics()
	local var_8_2 = var_8_0:GetFinalResults()
	local var_8_3 = var_8_0:GetExpeditionIds()
	local var_8_4, var_8_5 = var_8_0:GetModeFleetIDs(var_8_0:GetMode())
	local var_8_6 = var_8_0:GetFleets(var_8_4)
	local var_8_7 = var_8_0:GetFleets(var_8_5)[1]
	local var_8_8 = var_8_7:getTeamByName(TeamType.Submarine)
	local var_8_9 = var_8_7:GetRawCommanderIds()
	local var_8_10 = {}
	local var_8_11 = {}

	for iter_8_0 = 1, #var_8_3 do
		local var_8_12 = var_8_6[iter_8_0] or var_8_6[1]
		local var_8_13 = var_8_2[iter_8_0]
		local var_8_14 = {
			index = iter_8_0,
			oldShips = {},
			ships = {},
			oldCmds = {},
			cmds = {},
			mvp = var_8_13 and var_8_13.mvp or 0
		}
		local var_8_15 = Clone(var_8_14)

		table.Foreach(var_8_12:getShipIds(), function(arg_9_0, arg_9_1)
			if iter_8_0 <= #var_8_2 then
				local var_9_0 = var_8_13.newShips[arg_9_1]

				if var_9_0 then
					table.insert(var_8_14.ships, var_9_0)

					var_8_14.oldShips[arg_9_1] = var_8_13.oldShips[arg_9_1]
				end
			else
				local var_9_1 = getProxy(BayProxy):getShipById(arg_9_1)

				table.insert(var_8_14.ships, var_9_1)

				var_8_14.oldShips[arg_9_1] = var_9_1
			end
		end)
		table.Foreach(var_8_8, function(arg_10_0, arg_10_1)
			if iter_8_0 <= #var_8_2 then
				local var_10_0 = var_8_13.newShips[arg_10_1]

				if var_10_0 then
					table.insert(var_8_15.ships, var_10_0)

					var_8_15.oldShips[arg_10_1] = var_8_13.oldShips[arg_10_1]
				end
			end
		end)

		local var_8_16 = var_8_12:GetRawCommanderIds()

		_.each({
			1,
			2
		}, function(arg_11_0)
			local var_11_0 = var_8_16[arg_11_0] or false

			if var_11_0 then
				if iter_8_0 <= #var_8_2 then
					local var_11_1 = var_8_13.newCmds[var_11_0]

					if var_11_1 then
						table.insert(var_8_14.cmds, var_11_1)

						var_8_14.oldCmds[var_11_0] = var_8_13.oldCmds[var_11_0]
					end
				else
					local var_11_2 = getProxy(CommanderProxy):getCommanderById(var_11_0)

					table.insert(var_8_14.cmds, var_11_2)

					var_8_14.oldCmds[var_11_0] = var_11_2
				end
			else
				table.insert(var_8_14.cmds, false)
			end
		end)
		_.each({
			1,
			2
		}, function(arg_12_0)
			local var_12_0 = var_8_9[arg_12_0] or false

			if iter_8_0 <= #var_8_2 then
				if var_12_0 then
					local var_12_1 = var_8_13.newCmds[var_12_0]

					if var_12_1 then
						table.insert(var_8_15.cmds, var_12_1)

						var_8_15.oldCmds[var_12_1.id] = var_8_13.oldCmds[var_12_0]
					else
						table.insert(var_8_15.cmds, false)
					end
				else
					table.insert(var_8_15.cmds, false)
				end
			end
		end)

		var_8_10[iter_8_0] = var_8_14

		if next(var_8_15.ships) then
			table.insert(var_8_11, var_8_15)
		end
	end

	local var_8_17 = 0
	local var_8_18 = 0

	local function var_8_19(arg_13_0, arg_13_1, arg_13_2)
		UIItemList.StaticAlign(arg_13_0, arg_13_0:GetChild(0), 2, function(arg_14_0, arg_14_1, arg_14_2)
			if arg_14_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_14_0 = arg_13_2[arg_14_1 + 1]
			local var_14_1 = not var_14_0

			setActive(arg_14_2:Find("empty"), var_14_1)
			setActive(arg_14_2:Find("exp"), not var_14_1)

			if var_14_1 then
				return
			end

			local var_14_2 = arg_13_1[var_14_0.id]
			local var_14_3 = var_14_0.exp

			GetImageSpriteFromAtlasAsync("commandericon/" .. var_14_0:getPainting(), "", arg_14_2:Find("exp/icon"))
			setText(arg_14_2:Find("exp/name_text"), var_14_0:getName())
			setText(arg_14_2:Find("exp/lv_text"), "Lv." .. var_14_0.level)

			local var_14_4 = math.max(0, var_14_2.expAdd or 0)

			setText(arg_14_2:Find("exp/exp_text"), "+" .. var_14_4)

			local var_14_5
			local var_14_6 = var_14_0:isMaxLevel() and 1 or var_14_3 / var_14_0:getNextLevelExp()

			arg_14_2:Find("exp/exp_progress"):GetComponent(typeof(Image)).fillAmount = var_14_6
		end)
	end

	local function var_8_20(arg_15_0, arg_15_1, arg_15_2)
		setActive(arg_15_0:Find("result/mvpBG"), arg_15_1 == arg_15_2)
	end

	local function var_8_21(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
		UIItemList.StaticAlign(arg_16_0, arg_16_0:GetChild(0), #arg_16_1, function(arg_17_0, arg_17_1, arg_17_2)
			if arg_17_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_17_0 = arg_16_1[arg_17_1 + 1]
			local var_17_1 = arg_16_2[var_17_0.id]

			setActive(arg_17_2:Find("result/Exp"), true)
			setActive(arg_17_2:Find("result/Statistics"), false)
			var_8_20(arg_17_2, var_17_0.id, arg_16_3)

			local var_17_2 = arg_17_2:Find("result/mask/icon")
			local var_17_3 = arg_17_2:Find("result/type")
			local var_17_4 = GetSpriteFromAtlas("shiptype", shipType2print(var_17_1:getShipType()))

			setImageSprite(var_17_3, var_17_4, true)
			setImageSprite(var_17_2, LoadSprite("herohrzicon/" .. var_17_1:getPainting()))

			local var_17_5 = findTF(arg_17_2, "result/stars")
			local var_17_6 = findTF(arg_17_2, "result/stars/star_tpl")
			local var_17_7 = var_17_1:getStar()
			local var_17_8 = var_17_1:getMaxStar()

			UIItemList.StaticAlign(var_17_5, var_17_6, var_17_8, function(arg_18_0, arg_18_1, arg_18_2)
				if arg_18_0 ~= UIItemList.EventUpdate then
					return
				end

				local var_18_0 = var_17_8 - arg_18_1

				SetActive(arg_18_2:Find("empty"), var_18_0 > var_17_7)
				SetActive(arg_18_2:Find("star"), var_18_0 <= var_17_7)
			end)
			setText(arg_17_2:Find("result/Exp/Level"), "Lv." .. var_17_0.level)
			setText(arg_17_2:Find("result/Exp/name"), var_17_0:getName())

			local var_17_9 = arg_17_2:Find("result/Exp/exp_text")
			local var_17_10 = var_17_1:getConfig("rarity")

			if var_17_1.level < var_17_0.level then
				local var_17_11 = 0

				for iter_17_0 = var_17_1.level, var_17_0.level - 1 do
					var_17_11 = var_17_11 + getExpByRarityFromLv1(var_17_10, iter_17_0)
				end

				setText(var_17_9, "+" .. var_17_11 + var_17_0:getExp() - var_17_1:getExp())
			elseif var_17_1.level == var_17_1:getMaxLevel() then
				setText(var_17_9, "+" .. 0)
			else
				setText(var_17_9, "+" .. (var_17_1.expAdd or 0))
			end

			local var_17_12 = arg_17_2:Find("result/Progress/progress_bar")
			local var_17_13 = var_17_0:getExp() / getExpByRarityFromLv1(var_17_10, var_17_0.level)

			var_17_12:GetComponent(typeof(Image)).fillAmount = var_17_13
		end)
	end

	local function var_8_22(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
		arg_19_4 = arg_19_4 and arg_19_4.statistics

		local var_19_0 = 0

		if not arg_19_4 then
			var_19_0 = 10000
		elseif arg_19_3 == 0 then
			var_19_0 = 0

			for iter_19_0, iter_19_1 in pairs(arg_19_2) do
				var_19_0 = math.max(arg_19_4[iter_19_1.id].output, var_19_0)
			end
		elseif arg_19_3 > 0 then
			var_19_0 = arg_19_4[arg_19_3].output
		end

		UIItemList.StaticAlign(arg_19_0, arg_19_0:GetChild(0), #arg_19_1, function(arg_20_0, arg_20_1, arg_20_2)
			if arg_20_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_20_0 = arg_19_1[arg_20_1 + 1]
			local var_20_1 = arg_19_2[var_20_0.id]

			setActive(arg_20_2:Find("result/Statistics"), true)
			setActive(arg_20_2:Find("result/Exp"), false)
			var_8_20(arg_20_2, var_20_0.id, arg_19_3)

			local var_20_2 = arg_20_2:Find("result/mask/icon")
			local var_20_3 = arg_20_2:Find("result/type")
			local var_20_4 = GetSpriteFromAtlas("shiptype", shipType2print(var_20_1:getShipType()))

			setImageSprite(var_20_3, var_20_4, true)
			setImageSprite(var_20_2, LoadSprite("herohrzicon/" .. var_20_1:getPainting()))

			local var_20_5 = findTF(arg_20_2, "result/stars")
			local var_20_6 = findTF(arg_20_2, "result/stars/star_tpl")
			local var_20_7 = var_20_1:getStar()
			local var_20_8 = var_20_1:getMaxStar()

			UIItemList.StaticAlign(var_20_5, var_20_6, var_20_8, function(arg_21_0, arg_21_1, arg_21_2)
				if arg_21_0 ~= UIItemList.EventUpdate then
					return
				end

				local var_21_0 = var_20_8 - arg_21_1

				SetActive(arg_21_2:Find("empty"), var_21_0 > var_20_7)
				SetActive(arg_21_2:Find("star"), var_21_0 <= var_20_7)
			end)

			local var_20_9 = arg_19_4 and arg_19_4[var_20_1.id].output or 0
			local var_20_10 = arg_19_4 and arg_19_4[var_20_1.id].kill_count or 0
			local var_20_11 = arg_20_2:Find("result/Statistics/atk")

			setText(var_20_11, 0)
			setText(var_20_11, var_20_9)

			local var_20_12 = arg_20_2:Find("result/Statistics/killCount")

			setText(var_20_12, 0)
			setText(var_20_12, var_20_10)

			local var_20_13 = arg_20_2:Find("result/Progress/progress_bar")

			var_20_13:GetComponent(typeof(Image)).fillAmount = 0

			local var_20_14 = var_20_9 / var_19_0

			var_20_13:GetComponent(typeof(Image)).fillAmount = var_20_14
		end)
	end

	local function var_8_23(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
		arg_22_2 = arg_22_2 and arg_22_2.statistics

		local var_22_0 = arg_22_0:Find("Title/Label")
		local var_22_1 = arg_22_0:Find("Title/Letter")
		local var_22_2 = {
			"d",
			"c",
			"b",
			"a",
			"s"
		}
		local var_22_3
		local var_22_4
		local var_22_5
		local var_22_6
		local var_22_7

		if arg_22_2 then
			local var_22_8 = var_22_2[arg_22_2._battleScore + 1]

			var_22_6 = "letter_" .. var_22_8
			var_22_4 = "battlescore/battle_score_" .. var_22_8 .. "/letter_" .. var_22_8
			var_22_7 = "label_" .. var_22_8
			var_22_5 = "battlescore/battle_score_" .. var_22_8 .. "/label_" .. var_22_8

			if arg_22_2._scoreMark == ys.Battle.BattleConst.DEAD_FLAG then
				var_22_7 = "label_flag_destroy"
				var_22_5 = "battlescore/battle_score_c/label_flag_destroy"
			end
		else
			var_22_6 = ""
			var_22_7 = "label_none"
			var_22_5 = "battlescore/grade_label_none"
		end

		eachChild(var_22_0, function(arg_23_0)
			setActive(arg_23_0, arg_23_0.name == var_22_7)

			if arg_23_0.name == var_22_7 then
				arg_8_0.loader:GetSprite(var_22_5, "", arg_23_0)
			end
		end)
		eachChild(var_22_1, function(arg_24_0)
			setActive(arg_24_0, arg_24_0.name == var_22_6)

			if arg_24_0.name == var_22_6 then
				arg_8_0.loader:GetSprite(var_22_4, "", arg_24_0)
			end
		end)

		local var_22_9 = 0
		local var_22_10 = not arg_22_2 and 3 or arg_22_2._battleScore > ys.Battle.BattleConst.BattleScore.C and 1 or 2
		local var_22_11 = var_0_1[var_22_10]

		arg_8_0.loader:GetSprite(arg_8_0:GetAtalsName(), var_22_11, arg_22_0:Find("Title"))

		local var_22_12 = var_0_2[var_22_10]

		setImageColor(arg_22_0:Find("BG"), SummerFeastScene.TransformColor(var_22_12))

		local var_22_13 = pg.expedition_data_template[var_8_3[arg_22_3]]

		setText(arg_22_0:Find("Title/Name"), var_22_13.name)
		setText(arg_22_0:Find("BG/FleetName/Text"), i18n("series_enemy_fleet_prefix", GetRomanDigit(arg_22_1.index)))
		var_8_19(arg_22_0:Find("BG/commanderExp/commander_container"), arg_22_1.oldCmds, arg_22_1.cmds)
	end

	local function var_8_24()
		local var_25_0 = var_8_18 == 1 and var_8_11 or var_8_10

		UIItemList.StaticAlign(arg_8_0.resultList, arg_8_0.resultList:GetChild(0), #var_25_0, function(arg_26_0, arg_26_1, arg_26_2)
			if arg_26_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_26_0 = var_25_0[arg_26_1 + 1]
			local var_26_1 = var_8_1[var_26_0.index]

			var_8_23(arg_26_2, var_26_0, var_26_1, var_26_0.index)
			warning("yzh----RefreshExps--")
			var_8_21(arg_26_2:Find("BG/Ships"), var_26_0.ships, var_26_0.oldShips, var_26_0.mvp)
		end)
	end

	local function var_8_25()
		local var_27_0 = var_8_18 == 1 and var_8_11 or var_8_10

		UIItemList.StaticAlign(arg_8_0.resultList, arg_8_0.resultList:GetChild(0), #var_27_0, function(arg_28_0, arg_28_1, arg_28_2)
			if arg_28_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_28_0 = var_27_0[arg_28_1 + 1]
			local var_28_1 = var_8_1[var_28_0.index]

			var_8_23(arg_28_2, var_28_0, var_28_1, var_28_0.index)
			var_8_22(arg_28_2:Find("BG/Ships"), var_28_0.ships, var_28_0.oldShips, var_28_0.mvp, var_28_1)
		end)
	end

	local var_8_26 = arg_8_0.rightBottomPanel:Find("submarine")
	local var_8_27 = arg_8_0.rightBottomPanel:Find("main")

	setActive(var_8_26, #var_8_11 > 0)

	local function var_8_28()
		setActive(var_8_27, var_8_18 == 1)
		setActive(var_8_26, var_8_18 == 0 and #var_8_11 > 0)

		if var_8_17 == 0 then
			var_8_24()
		elseif var_8_17 == 1 then
			var_8_25()
		end
	end

	var_8_28()
	;(function()
		local var_30_0 = getProxy(PlayerProxy):getRawData()
		local var_30_1 = _.reduce(var_8_2, 0, function(arg_31_0, arg_31_1)
			return arg_31_0 + arg_31_1.playerExp.addExp
		end)

		setText(arg_8_0._tf:Find("main/Series/playerExp/name_text"), var_30_0.name)
		setText(arg_8_0._tf:Find("main/Series/playerExp/lv_text"), "Lv." .. var_30_0.level)
		setText(arg_8_0._tf:Find("main/Series/playerExp/exp_text"), "+" .. var_30_1)

		local var_30_2 = arg_8_0._tf:Find("main/Series/playerExp/exp_progress")
		local var_30_3 = getConfigFromLevel1(pg.user_level, var_30_0.level)

		var_30_2:GetComponent(typeof(Image)).fillAmount = var_30_0.exp / var_30_3.exp_interval
	end)()
	onButton(arg_8_0, arg_8_0.rightBottomPanel:Find("statisticsBtn"), function()
		var_8_17 = 1 - var_8_17

		var_8_28()
	end, SFX_PANEL)
	onButton(arg_8_0, var_8_26, function()
		var_8_18 = 1

		var_8_28()
	end, SFX_PANEL)
	onButton(arg_8_0, var_8_27, function()
		var_8_18 = 0

		var_8_28()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.rightBottomPanel:Find("confirmBtn"), function()
		arg_8_0:emit(BossRushBattleResultMediator.ON_SETTLE)
	end, SFX_PANEL)

	local var_8_29 = arg_8_0._tf:Find("main/Series/ArrowLeft")
	local var_8_30 = arg_8_0._tf:Find("main/Series/ArrowRight")

	Canvas.ForceUpdateCanvases()

	if arg_8_0.resultScroll.rect.width >= arg_8_0.resultList.rect.width then
		setActive(var_8_29, false)
		setActive(var_8_30, false)
	else
		setActive(var_8_29, false)
		setActive(var_8_30, true)
		onScroll(arg_8_0, arg_8_0.resultScroll, function(arg_36_0)
			setActive(var_8_29, arg_36_0.x > 0.01)
			setActive(var_8_30, arg_36_0.x < 0.99)
		end)
	end
end

function var_0_0.HideConfirmPanel(arg_37_0)
	setActive(arg_37_0.rightBottomPanel:Find("confirmBtn"), false)
end

function var_0_0.onBackPressed(arg_38_0)
	triggerButton(arg_38_0.rightBottomPanel:Find("confirmBtn"))
end

function var_0_0.willExit(arg_39_0)
	arg_39_0:UnOverlayPanel(arg_39_0._tf)
	arg_39_0.loader:Clear()

	if arg_39_0.contextData.OnClose then
		arg_39_0.contextData.OnClose()
	end
end

return var_0_0
