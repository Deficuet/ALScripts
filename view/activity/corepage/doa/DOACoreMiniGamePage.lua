local var_0_0 = class("DOACoreMiniGamePage", import("view.activity.CorePage.CoreActivityPage"))
local var_0_1 = 89

function var_0_0.OnInit(arg_1_0)
	arg_1_0.mgHubData = getProxy(MiniGameProxy):GetHubByGameId(var_0_1)
	arg_1_0.drops = pg.mini_game[var_0_1].simple_config_data.drop_ids
	arg_1_0.totalTimes = #arg_1_0.drops
	arg_1_0.useTimes = arg_1_0.mgHubData.usedtime
	arg_1_0.gameTimes = arg_1_0.mgHubData.count
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0.highScore = findTF(arg_2_0._tf, "ad/title/text")
	arg_2_0.btnRule = findTF(arg_2_0._tf, "ad/rule")

	onButton(arg_2_0, arg_2_0.btnRule, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.cut_fruit_minigame_help.tip
		})
	end, SFX_CANCEL)

	arg_2_0.btnStart = findTF(arg_2_0._tf, "ad/start")

	onButton(arg_2_0, arg_2_0.btnStart, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, var_0_1)
	end, SFX_CANCEL)

	arg_2_0.battleItems = {}
	arg_2_0._tplBattleItem = findTF(arg_2_0._tf, "ad/awards/Viewport/Content/item_tpl")

	setActive(arg_2_0._tplBattleItem, false)

	local var_2_0 = arg_2_0.drops

	for iter_2_0 = 1, 7 do
		local var_2_1 = iter_2_0
		local var_2_2 = tf(instantiate(arg_2_0._tplBattleItem))

		var_2_2.name = "award_" .. iter_2_0

		setParent(var_2_2, findTF(arg_2_0._tf, "ad/awards/Viewport/Content"))

		local var_2_3 = iter_2_0
		local var_2_4 = findTF(var_2_2, "ad/iconMask/icon")
		local var_2_5 = {
			type = var_2_0[iter_2_0][1],
			id = var_2_0[iter_2_0][2],
			count = var_2_0[iter_2_0][3]
		}

		updateDrop(var_2_4, var_2_5)
		onButton(arg_2_0, var_2_4, function()
			arg_2_0:emit(BaseUI.ON_DROP, var_2_5)
		end, SFX_PANEL)
		setActive(var_2_2, true)
		table.insert(arg_2_0.battleItems, var_2_2)
	end
end

function var_0_0.OnUpdateFlush(arg_6_0)
	for iter_6_0 = 1, 7 do
		local var_6_0 = findTF(arg_6_0.battleItems[iter_6_0], "ad/lock")
		local var_6_1 = findTF(arg_6_0.battleItems[iter_6_0], "ad/got")

		setActive(var_6_0, false)
		setActive(var_6_1, false)

		if iter_6_0 <= arg_6_0.useTimes then
			setActive(var_6_1, true)
		elseif iter_6_0 == arg_6_0.useTimes + 1 and arg_6_0.gameTimes >= 1 then
			-- block empty
		elseif iter_6_0 > arg_6_0.useTimes and iter_6_0 <= arg_6_0.useTimes + arg_6_0.gameTimes then
			-- block empty
		else
			setActive(var_6_0, true)
		end
	end

	local var_6_2 = getProxy(MiniGameProxy):GetHighScore(var_0_1)

	if not var_6_2 or not (#var_6_2 > 0) or not var_6_2[1] then
		local var_6_3 = 0
	end
end

function var_0_0.willExit(arg_7_0)
	return
end

return var_0_0
