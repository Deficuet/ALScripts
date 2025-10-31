local var_0_0 = class("SummerFeastScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SummerFeastUI"
end

var_0_0.HUB_ID = 1
var_0_0.Elements = {
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
	local var_2_0 = pg.TimeMgr.GetInstance():GetServerTime()

	return pg.TimeMgr.GetInstance():STimeDescS(var_2_0, "*t").yday
end

function var_0_0.GetTheDay()
	local var_3_0 = os.time({
		year = 2019,
		month = 8,
		hour = 0,
		min = 0,
		sec = 0,
		day = 29,
		isdst = false
	})

	return os.date("*t", var_3_0).yday
end

function var_0_0.TransformColor(arg_4_0)
	local var_4_0 = tonumber(string.sub(arg_4_0, 1, 2), 16)
	local var_4_1 = tonumber(string.sub(arg_4_0, 3, 4), 16)
	local var_4_2 = tonumber(string.sub(arg_4_0, 5, 6), 16)
	local var_4_3 = 255

	if string.len(arg_4_0) > 6 and string.len(arg_4_0) <= 8 then
		var_4_3 = tonumber(string.sub(arg_4_0, 7, 8), 16)
	end

	return Color.New(var_4_0 / 255, var_4_1 / 255, var_4_2 / 255, var_4_3 / 255)
end

function var_0_0.GenerateRandomFanPosition(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5, arg_5_6)
	local var_5_0 = {}

	for iter_5_0 = 1, arg_5_6 do
		table.insert(var_5_0, math.lerp(arg_5_4, arg_5_5, math.random(1, 100) / 100))
	end

	local var_5_1 = arg_5_3 / (arg_5_6 - 1)
	local var_5_2 = math.sin(var_5_1)
	local var_5_3 = math.cos(var_5_1)
	local var_5_4 = Vector2.Normalize(arg_5_2 - arg_5_1)
	local var_5_5 = {}
	local var_5_6 = var_5_4.x
	local var_5_7 = var_5_4.y

	table.insert(var_5_5, Vector2.New(arg_5_1.x + var_5_0[1] * var_5_6, arg_5_1.y + var_5_0[1] * var_5_7))

	for iter_5_1 = 2, arg_5_6 do
		local var_5_8 = var_5_6 * var_5_3 + var_5_7 * var_5_2
		local var_5_9 = var_5_7 * var_5_3 - var_5_6 * var_5_2

		var_5_6, var_5_7 = var_5_8, var_5_9

		table.insert(var_5_5, Vector2.New(arg_5_1.x + var_5_0[iter_5_1] * var_5_6, arg_5_1.y + var_5_0[iter_5_1] * var_5_7))
	end

	return var_5_5
end

function var_0_0.init(arg_6_0)
	arg_6_0.top = arg_6_0._tf:Find("top")
	arg_6_0._closeBtn = arg_6_0._tf:Find("top/back")
	arg_6_0._homeBtn = arg_6_0._tf:Find("top/home")
	arg_6_0._helpBtn = arg_6_0._tf:Find("top/help")
	arg_6_0.ticketTimes = arg_6_0.top:Find("ticket/text")
	arg_6_0.yinhuace = arg_6_0.top:Find("yinhuace")
	arg_6_0.yinhuaceTimes = arg_6_0.yinhuace:Find("get")
	arg_6_0.yinhuaceTips = arg_6_0.yinhuace:Find("tip")
	arg_6_0.shouce = arg_6_0._tf:Find("yinhuashouceye")
	arg_6_0.shouce_bg = arg_6_0.shouce:Find("bg")
	arg_6_0.layout_shouce = arg_6_0.shouce:Find("yinhuace/go/layout")
	arg_6_0.group_get = CustomIndexLayer.Clone2Full(arg_6_0.layout_shouce, 14)
	arg_6_0.btn_receive = arg_6_0.shouce:Find("yinhuace/receive")
	arg_6_0.btn_shouce_help = arg_6_0.shouce:Find("yinhuace/help")
	arg_6_0.img_get = arg_6_0.shouce:Find("yinhuace/get")

	setActive(arg_6_0.shouce, false)

	arg_6_0.sakura = arg_6_0._tf:Find("effect")
	arg_6_0._map = arg_6_0._tf:Find("scrollRect/map")
	arg_6_0.wave = arg_6_0._map:Find("effect_wave")
	arg_6_0.shrine = arg_6_0._map:Find("shrine")
	arg_6_0.snack_street = arg_6_0._map:Find("snack_street")
	arg_6_0.entertainment_street = arg_6_0._map:Find("entertainment_street")
	arg_6_0.firework_factory = arg_6_0._map:Find("firework_factory")
	arg_6_0.btn_fire = arg_6_0.firework_factory:Find("fire")
	arg_6_0.bottom = arg_6_0._map:Find("bottom")
	arg_6_0.middle = arg_6_0._map:Find("middle")
	arg_6_0.front = arg_6_0._map:Find("front")
	arg_6_0._shipTpl = arg_6_0._map:Find("ship")
	arg_6_0.graphPath = GraphPath.New(import("GameCfg.BackHillGraphs.SummerFeastGraph"))

	pg.PoolMgr.GetInstance():GetPrefab("ui/firework", "", true, function(arg_7_0)
		pg.PoolMgr.GetInstance():ReturnPrefab("ui/firework", "", arg_7_0)
	end)

	arg_6_0.workingEffect = {}
end

function var_0_0.didEnter(arg_8_0)
	local var_8_0 = getProxy(MiniGameProxy)

	onButton(arg_8_0, arg_8_0._closeBtn, function()
		arg_8_0:emit(var_0_0.ON_BACK)
	end)
	onButton(arg_8_0, arg_8_0._homeBtn, function()
		arg_8_0:emit(var_0_0.ON_HOME)
	end)
	onButton(arg_8_0, arg_8_0._helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_summer_feast.tip
		})
	end)
	onButton(arg_8_0, arg_8_0.yinhuace, function()
		pg.UIMgr.GetInstance():OverlayPanel(arg_8_0.shouce)
		setActive(arg_8_0.shouce, true)
	end)
	onButton(arg_8_0, arg_8_0.shouce_bg, function()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_8_0.shoucem, arg_8_0._tf)
		setActive(arg_8_0.shouce, false)
	end)
	onButton(arg_8_0, arg_8_0.btn_shouce_help, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_summer_stamp.tip
		})
	end)
	onButton(arg_8_0, arg_8_0.btn_receive, function()
		local var_15_0 = var_8_0:GetHubByHubId(arg_8_0.HUB_ID)

		if var_15_0.ultimate ~= 0 or var_15_0.usedtime < var_15_0:getConfig("reward_need") then
			return
		end

		arg_8_0:emit(SummerFeastMediator.MINI_GAME_OPERATOR, {
			hubid = var_15_0.id,
			cmd = MiniGameOPCommand.CMD_ULTIMATE,
			args1 = {}
		})
	end)
	arg_8_0:InitFacility(arg_8_0.shrine, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 3)
	end)
	arg_8_0:InitFacility(arg_8_0.snack_street, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 2)
	end)
	arg_8_0:InitFacility(arg_8_0.entertainment_street, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 5)
	end)
	arg_8_0:InitFacility(arg_8_0.firework_factory, function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 4)
	end)
	onButton(arg_8_0, arg_8_0.btn_fire, function()
		local var_20_0 = var_8_0:GetMiniGameData(4):GetRuntimeData("elements")

		if not var_20_0 or not (#var_20_0 >= 4) or var_20_0[4] ~= arg_8_0.GetCurrentDay() then
			return
		end

		arg_8_0:PlayFirework(var_20_0)
		setActive(arg_8_0.btn_fire, false)
	end)
	pg.UIMgr.GetInstance():OverlayPanel(arg_8_0.top)

	arg_8_0.academyStudents = {}

	arg_8_0:InitAreaTransFunc()
	arg_8_0:updateStudents()
	arg_8_0:UpdateView()
end

function var_0_0.UpdateView(arg_21_0)
	local var_21_0 = getProxy(MiniGameProxy)
	local var_21_1 = var_21_0:GetHubByHubId(arg_21_0.HUB_ID)
	local var_21_2 = var_21_1.usedtime

	setText(arg_21_0.ticketTimes, var_21_1.count)
	setText(arg_21_0.yinhuaceTimes, var_21_2)

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.group_get) do
		setActive(iter_21_1, iter_21_0 <= var_21_2)
	end

	local var_21_3 = var_21_2 >= #arg_21_0.group_get and var_21_1.ultimate == 0

	setActive(arg_21_0.btn_receive, var_21_3)
	setActive(arg_21_0.yinhuaceTips, var_21_3)
	setActive(arg_21_0.img_get, var_21_1.ultimate ~= 0)

	if var_21_1.ultimate == 1 then
		arg_21_0:TryPlayStory()
	end

	local var_21_4 = var_21_0:GetMiniGameData(4):GetRuntimeData("elements")
	local var_21_5 = var_21_4 and #var_21_4 >= 4 and var_21_4[4] == arg_21_0.GetCurrentDay()

	setActive(arg_21_0.btn_fire, var_21_5)
end

function var_0_0.InitFacility(arg_22_0, arg_22_1, arg_22_2)
	onButton(arg_22_0, arg_22_1, arg_22_2)
	onButton(arg_22_0, arg_22_1:Find("button"), arg_22_2)
end

function var_0_0.PlayFirework(arg_23_0, arg_23_1)
	if #arg_23_0.workingEffect > 0 then
		return
	end

	arg_23_1 = arg_23_1 or {
		0,
		0,
		0
	}

	local var_23_0 = {
		Vector2(215, 150)
	}
	local var_23_1 = UnityEngine.ParticleSystem.MinMaxGradient.New

	for iter_23_0, iter_23_1 in pairs(var_23_0) do
		pg.PoolMgr.GetInstance():GetPrefab("ui/firework", "", false, function(arg_24_0)
			local var_24_0 = var_0_0.Elements

			tf(arg_24_0):Find("Fire"):GetComponent("ParticleSystem").main.startColor = var_23_1(arg_23_0.TransformColor(var_24_0[arg_23_1[1]].color))
			tf(arg_24_0):Find("Fire/par_small"):GetComponent("ParticleSystem").main.startColor = var_23_1(arg_23_0.TransformColor(var_24_0[arg_23_1[2]].color))
			tf(arg_24_0):Find("Fire/par_small/par_big"):GetComponent("ParticleSystem").main.startColor = var_23_1(arg_23_0.TransformColor(var_24_0[arg_23_1[3]].color))

			table.insert(arg_23_0.workingEffect, arg_24_0)
			setParent(arg_24_0, arg_23_0._map)

			arg_24_0.transform.localPosition = iter_23_1
		end)
	end

	arg_23_0:PlaySE()
end

function var_0_0.ClearEffectFirework(arg_25_0)
	arg_25_0:StopSE()

	local var_25_0 = pg.PoolMgr.GetInstance()

	for iter_25_0, iter_25_1 in pairs(arg_25_0.workingEffect) do
		var_25_0:ReturnPrefab("ui/firework", "", iter_25_1)
	end

	var_25_0:DestroyPrefab("ui/firework", "")

	arg_25_0.workingEffect = {}
end

function var_0_0.PlaySE(arg_26_0)
	if arg_26_0.SETimer then
		return
	end

	arg_26_0.SECount = 10
	arg_26_0.SETimer = Timer.New(function()
		arg_26_0.SECount = arg_26_0.SECount - 1

		if arg_26_0.SECount <= 0 then
			arg_26_0.SECount = math.random(5, 20)

			pg.CriMgr.GetInstance():PlaySE_V3("battle-firework")
		end
	end, 0.1, -1)

	arg_26_0.SETimer:Start()
end

function var_0_0.StopSE(arg_28_0)
	if arg_28_0.SETimer then
		pg.CriMgr.GetInstance():StopSEBattle_V3()
		arg_28_0.SETimer:Stop()

		arg_28_0.SETimer = nil
	end
end

function var_0_0.getStudents(arg_29_0)
	local var_29_0 = {}
	local var_29_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.SUMMER_FEAST_ID)

	if not var_29_1 then
		return var_29_0
	end

	local var_29_2 = var_29_1:getConfig("config_client")

	var_29_2 = var_29_2 and var_29_2.ships

	if var_29_2 then
		local var_29_3 = Clone(var_29_2)
		local var_29_4 = 0
		local var_29_5 = #var_29_3

		while var_29_4 < 15 and var_29_5 > 0 do
			local var_29_6 = math.random(1, var_29_5)

			table.insert(var_29_0, var_29_3[var_29_6])

			var_29_3[var_29_6] = var_29_3[var_29_5]
			var_29_5 = var_29_5 - 1
			var_29_4 = var_29_4 + math.random(3, 5)
		end
	end

	return var_29_0
end

function var_0_0.InitAreaTransFunc(arg_30_0)
	arg_30_0.edge2area = {
		["1_4"] = arg_30_0.bottom,
		["1_5"] = arg_30_0.bottom,
		["4_5"] = arg_30_0.bottom,
		["3_5"] = arg_30_0.middle
	}
	arg_30_0.graphPath.points[5].isBan = true
end

function var_0_0.updateStudents(arg_31_0)
	local var_31_0 = arg_31_0:getStudents()

	for iter_31_0, iter_31_1 in pairs(var_31_0) do
		if not arg_31_0.academyStudents[iter_31_0] then
			local var_31_1 = cloneTplTo(arg_31_0._shipTpl, arg_31_0._map)

			var_31_1.gameObject.name = iter_31_0

			local var_31_2 = SummerFeastNavigationAgent.New(var_31_1.gameObject)

			var_31_2:attach()
			var_31_2:setPathFinder(arg_31_0.graphPath)
			var_31_2:SetOnTransEdge(function(arg_32_0, arg_32_1, arg_32_2)
				arg_32_1, arg_32_2 = math.min(arg_32_1, arg_32_2), math.max(arg_32_1, arg_32_2)

				local var_32_0 = arg_31_0.edge2area[arg_32_1 .. "_" .. arg_32_2] or arg_31_0.front

				arg_32_0._tf:SetParent(var_32_0)
			end)
			var_31_2:updateStudent(iter_31_1)

			arg_31_0.academyStudents[iter_31_0] = var_31_2
		end
	end

	if #var_31_0 > 0 then
		arg_31_0.sortTimer = Timer.New(function()
			arg_31_0:sortStudents()
		end, 0.2, -1)

		arg_31_0.sortTimer:Start()
		arg_31_0.sortTimer.func()
	end
end

function var_0_0.sortStudents(arg_34_0)
	local var_34_0 = {
		arg_34_0.front,
		arg_34_0.middle,
		arg_34_0.bottom
	}

	for iter_34_0, iter_34_1 in pairs(var_34_0) do
		if iter_34_1.childCount > 1 then
			local var_34_1 = {}

			for iter_34_2 = 1, iter_34_1.childCount do
				local var_34_2 = iter_34_1:GetChild(iter_34_2 - 1)

				table.insert(var_34_1, {
					tf = var_34_2,
					index = iter_34_2
				})
			end

			table.sort(var_34_1, function(arg_35_0, arg_35_1)
				local var_35_0 = arg_35_0.tf.anchoredPosition.y - arg_35_1.tf.anchoredPosition.y

				if math.abs(var_35_0) < 1 then
					return arg_35_0.index < arg_35_1.index
				else
					return var_35_0 > 0
				end
			end)

			for iter_34_3, iter_34_4 in ipairs(var_34_1) do
				iter_34_4.tf:SetSiblingIndex(iter_34_3 - 1)
			end
		end
	end
end

function var_0_0.clearStudents(arg_36_0)
	if arg_36_0.sortTimer then
		arg_36_0.sortTimer:Stop()

		arg_36_0.sortTimer = nil
	end

	for iter_36_0, iter_36_1 in pairs(arg_36_0.academyStudents) do
		iter_36_1:detach()
		Destroy(iter_36_1._go)
	end

	arg_36_0.academyStudents = {}
end

function var_0_0.TryPlayStory(arg_37_0)
	local var_37_0 = "TIANHOUYUYI2"

	if var_37_0 then
		pg.NewStoryMgr.GetInstance():Play(var_37_0)
	end
end

function var_0_0.willExit(arg_38_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_38_0.top, arg_38_0._tf)

	if isActive(arg_38_0.shouce) then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_38_0.shoucem, arg_38_0._tf)
		setActive(arg_38_0.shouce, false)
	end

	arg_38_0:clearStudents()
	arg_38_0:ClearEffectFirework()
end

return var_0_0
