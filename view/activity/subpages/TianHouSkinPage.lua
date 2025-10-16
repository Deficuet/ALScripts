local var_0_0 = class("TianHouSkinPage", import("...base.BaseActivityPage"))
local var_0_1 = {
	[0] = {
		color = "ffffff",
		name = "none"
	},
	{
		color = "ffed95",
		name = "na"
	},
	{
		color = "feb8ff",
		name = "k"
	},
	{
		color = "ad92ff",
		name = "rb"
	},
	{
		color = "affff4",
		name = "zn"
	},
	{
		color = "ffa685",
		name = "ca"
	},
	{
		color = "c1ffa7",
		name = "cu"
	}
}

function var_0_0.GetCurrentDay()
	local var_1_0 = pg.TimeMgr.GetInstance():GetServerTime()

	return pg.TimeMgr.GetInstance():STimeDescS(var_1_0, "*t").yday
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.bg = arg_2_0._tf:Find("AD")
	arg_2_0.helpBtn = arg_2_0.bg:Find("help")
	arg_2_0.gotTag = arg_2_0.bg:Find("got")
	arg_2_0.medalText = arg_2_0.bg:Find("medal")
	arg_2_0.ticketText = arg_2_0.bg:Find("ticket")
	arg_2_0.fireworkBtn = arg_2_0.bg:Find("game_list/firework")
	arg_2_0.shootBtn = arg_2_0.bg:Find("game_list/shoot")
	arg_2_0.foodBtn = arg_2_0.bg:Find("game_list/food")
	arg_2_0.effectNode = arg_2_0.bg:Find("effectNode")
	arg_2_0.playEffectBtn = arg_2_0.bg:Find("fire")
end

function var_0_0.OnFirstFlush(arg_3_0)
	arg_3_0.hubID = arg_3_0.activity:getConfig("config_id")

	onButton(arg_3_0, arg_3_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_summer_feast")
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.fireworkBtn, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 26)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.shootBtn, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 27)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.foodBtn, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 25)
	end, SFX_PANEL)

	local var_3_0 = getProxy(MiniGameProxy):GetMiniGameData(26):GetRuntimeData("elements")

	arg_3_0.ishow = var_3_0 and #var_3_0 >= 4 and var_3_0[4] == arg_3_0.GetCurrentDay()

	onButton(arg_3_0, arg_3_0.playEffectBtn, function()
		if not arg_3_0.ishow then
			return
		end

		arg_3_0:PlayFirework(var_3_0)
		setActive(arg_3_0.playEffectBtn, false)
	end, SFX_PANEL)
	blinkAni(arg_3_0.playEffectBtn:Find("light"), 0.5)
end

function var_0_0.OnUpdateFlush(arg_9_0)
	local var_9_0 = getProxy(MiniGameProxy):GetHubByHubId(arg_9_0.hubID)
	local var_9_1 = var_9_0:getConfig("reward_need")

	setText(arg_9_0.ticketText, var_9_0.count)
	setText(arg_9_0.medalText, var_9_0.usedtime .. "/" .. var_9_1)
	setActive(arg_9_0.gotTag, var_9_0.ultimate ~= 0)

	if var_9_0.ultimate == 0 and var_9_1 <= var_9_0.usedtime then
		pg.m02:sendNotification(GAME.SEND_MINI_GAME_OP, {
			hubid = arg_9_0.hubID,
			cmd = MiniGameOPCommand.CMD_ULTIMATE,
			args1 = {}
		})
	end

	setActive(arg_9_0.playEffectBtn, arg_9_0.ishow)
	pg.NewStoryMgr.GetInstance():Play("TIANHOUYUYI1")
end

function var_0_0.TransformColor(arg_10_0)
	local var_10_0 = tonumber(string.sub(arg_10_0, 1, 2), 16)
	local var_10_1 = tonumber(string.sub(arg_10_0, 3, 4), 16)
	local var_10_2 = tonumber(string.sub(arg_10_0, 5, 6), 16)

	return Color.New(var_10_0 / 255, var_10_1 / 255, var_10_2 / 255)
end

function var_0_0.PlayFirework(arg_11_0, arg_11_1)
	arg_11_1 = arg_11_1 or {
		0,
		0,
		0
	}

	local var_11_0 = UnityEngine.ParticleSystem.MinMaxGradient.New

	pg.PoolMgr.GetInstance():GetPrefab("ui/firework", "", false, function(arg_12_0)
		local var_12_0 = tf(arg_12_0):Find("Fire"):GetComponent("ParticleSystem").main.startColor

		tf(arg_12_0):Find("Fire"):GetComponent("ParticleSystem").main.startColor = var_11_0(arg_11_0.TransformColor(var_0_1[arg_11_1[1]].color))
		tf(arg_12_0):Find("Fire/par_small"):GetComponent("ParticleSystem").main.startColor = var_11_0(arg_11_0.TransformColor(var_0_1[arg_11_1[2]].color))
		tf(arg_12_0):Find("Fire/par_small/par_big"):GetComponent("ParticleSystem").main.startColor = var_11_0(arg_11_0.TransformColor(var_0_1[arg_11_1[3]].color))

		setParent(arg_12_0, arg_11_0.effectNode)

		arg_12_0.transform.localPosition = Vector2(0, 0)
		arg_11_0.fireEffect = arg_12_0
	end)
	arg_11_0:PlaySE()
end

function var_0_0.ClearEffectFirework(arg_13_0)
	arg_13_0:StopSE()

	if arg_13_0.fireEffect then
		pg.PoolMgr.GetInstance():ReturnPrefab("ui/firework", "", arg_13_0.fireEffect)
	end
end

function var_0_0.PlaySE(arg_14_0)
	if arg_14_0.SETimer then
		return
	end

	arg_14_0.SECount = 10
	arg_14_0.SETimer = Timer.New(function()
		arg_14_0.SECount = arg_14_0.SECount - 1

		if arg_14_0.SECount <= 0 then
			arg_14_0.SECount = math.random(5, 20)

			pg.CriMgr.GetInstance():PlaySE_V3("battle-firework")
		end
	end, 0.1, -1)

	arg_14_0.SETimer:Start()
end

function var_0_0.StopSE(arg_16_0)
	if arg_16_0.SETimer then
		pg.CriMgr.GetInstance():StopSEBattle_V3()
		arg_16_0.SETimer:Stop()

		arg_16_0.SETimer = nil
	end
end

function var_0_0.OnHideFlush(arg_17_0)
	arg_17_0:ClearEffectFirework()
end

function var_0_0.OnDestroy(arg_18_0)
	arg_18_0:ClearEffectFirework()
end

return var_0_0
