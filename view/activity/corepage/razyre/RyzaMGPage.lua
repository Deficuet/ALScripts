local var_0_0 = class("RyzaMGPage", import("view.activity.CorePage.CoreActivityPage"))
local var_0_1 = 43
local var_0_2 = "temp"

function var_0_0.OnInit(arg_1_0)
	arg_1_0.mgHubData = getProxy(MiniGameProxy):GetHubByGameId(var_0_1)
	arg_1_0.drops = pg.mini_game[var_0_1].simple_config_data.drop_ids
	arg_1_0.totalTimes = #arg_1_0.drops
	arg_1_0.useTimes = arg_1_0.mgHubData.usedtime
	arg_1_0.gameTimes = arg_1_0.mgHubData.count
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0.btnStart = findTF(arg_2_0._tf, "ad/start")
	arg_2_0.btnRule = findTF(arg_2_0._tf, "ad/rule")
	arg_2_0.moveLeft = findTF(arg_2_0._tf, "ad/moveLeft")
	arg_2_0.moveRight = findTF(arg_2_0._tf, "ad/moveRight")
	arg_2_0.awardsTf = findTF(arg_2_0._tf, "ad/awards")
	arg_2_0.awardContent = findTF(arg_2_0._tf, "ad/awards/content")
	arg_2_0.awardsRect = GetComponent(arg_2_0.awardsTf, typeof(ScrollRect))
	arg_2_0.itemTpl = findTF(arg_2_0._tf, "ad/awards/content/itemTpl")

	setActive(arg_2_0.itemTpl, false)

	for iter_2_0 = 1, #arg_2_0.drops do
		local var_2_0 = tf(Instantiate(arg_2_0.itemTpl))

		setParent(var_2_0, arg_2_0.awardContent)
		setActive(var_2_0, true)

		local var_2_1 = arg_2_0.drops[iter_2_0]
		local var_2_2 = {
			type = var_2_1[1],
			id = var_2_1[2],
			count = var_2_1[3]
		}
		local var_2_3 = findTF(var_2_0, "ad/IconTpl")

		updateDrop(var_2_3, var_2_2)
		onButton(arg_2_0, var_2_0, function()
			arg_2_0:emit(BaseUI.ON_DROP, var_2_2)
		end, SFX_PANEL)
		GetSpriteFromAtlasAsync("ui/ryzamgpage_atlas", "day_" .. iter_2_0, function(arg_4_0)
			setImageSprite(findTF(var_2_0, "ad/complete"), arg_4_0, true)
		end)
		GetSpriteFromAtlasAsync("ui/ryzamgpage_atlas", "day_c_" .. iter_2_0, function(arg_5_0)
			setImageSprite(findTF(var_2_0, "ad/open"), arg_5_0, true)
		end)
		setActive(findTF(var_2_0, "ad/open"), iter_2_0 > arg_2_0.useTimes)
		setActive(findTF(var_2_0, "ad/complete"), iter_2_0 <= arg_2_0.useTimes)
		setActive(findTF(var_2_0, "ad/got"), iter_2_0 <= arg_2_0.useTimes)
	end

	onButton(arg_2_0, arg_2_0.btnStart, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, var_0_1)
	end, SFX_CONFIRM)
	onButton(arg_2_0, arg_2_0.btnRule, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.ryza_mini_game.tip
		})
	end, SFX_CONFIRM)
	onButton(arg_2_0, arg_2_0.moveRight, function()
		local var_8_0 = arg_2_0.awardsRect.normalizedPosition.x + 1 / (arg_2_0.totalTimes - 4)

		if var_8_0 <= 0 then
			var_8_0 = 0
		end

		scrollTo(arg_2_0.awardsRect, var_8_0, 0)
	end, SFX_CONFIRM)
	onButton(arg_2_0, arg_2_0.moveLeft, function()
		local var_9_0 = arg_2_0.awardsRect.normalizedPosition.x - 1 / (arg_2_0.totalTimes - 4)

		if var_9_0 > 1 then
			var_9_0 = 1
		end

		scrollTo(arg_2_0.awardsRect, var_9_0, 0)
	end, SFX_CONFIRM)

	local var_2_4 = arg_2_0.totalTimes - 4 < 0 and 0 or arg_2_0.totalTimes - 4

	scrollTo(arg_2_0.awardsRect, 1 - var_2_4 / (arg_2_0.totalTimes - 4), 0)
end

function var_0_0.willExit(arg_10_0)
	return
end

return var_0_0
