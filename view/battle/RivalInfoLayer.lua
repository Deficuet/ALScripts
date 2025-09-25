local var_0_0 = class("RivalInfoLayer", import("..base.BaseUI"))

var_0_0.TYPE_DISPLAY = 1
var_0_0.TYPE_BATTLE = 2

function var_0_0.getUIName(arg_1_0)
	return "RivalInfoUI"
end

function var_0_0.setRival(arg_2_0, arg_2_1)
	arg_2_0.rivalVO = arg_2_1
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():LoadingOn()
	onButton(arg_3_0, findTF(arg_3_0._tf, "bg"), function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end)

	arg_3_0.shipCardTpl = arg_3_0._tf:GetComponent("ItemList").prefabItem[0]
	arg_3_0.startBtn = findTF(arg_3_0._tf, "ships_container/start_btn")

	setActive(arg_3_0.startBtn, false)
	setActive(findTF(arg_3_0._tf, "info/title_miex"), arg_3_0.contextData.type == arg_3_0.TYPE_BATTLE)
	onButton(arg_3_0, arg_3_0.startBtn, function()
		arg_3_0:emit(RivalInfoMediator.START_BATTLE)
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
	arg_3_0:initRivalInfo()

	arg_3_0.isRealName = false
	arg_3_0.realNameToggle = arg_3_0:findTF("info/real_name")

	onToggle(arg_3_0, arg_3_0.realNameToggle, function(arg_6_0)
		arg_3_0.isRealName = arg_6_0

		arg_3_0:UpdateNames()
	end, SFX_PANEL)
	setActive(arg_3_0.realNameToggle, pg.PushNotificationMgr.GetInstance():isEnableShipName())
end

function var_0_0.UpdateNames(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.names) do
		local var_7_0 = iter_7_1[1]
		local var_7_1 = iter_7_1[2]
		local var_7_2 = arg_7_0.isRealName and var_7_1:GetDefaultName() or var_7_1:getName()

		setText(findTF(var_7_0, "content/info/name_mask/name"), var_7_2)
	end
end

function var_0_0.initRivalInfo(arg_8_0)
	setText(findTF(arg_8_0._tf, "info/name/container/name"), arg_8_0.rivalVO.name)
	setText(findTF(arg_8_0._tf, "info/name/container/lv"), "Lv." .. arg_8_0.rivalVO.level)
	setActive(findTF(arg_8_0._tf, "info/rank"), arg_8_0.rivalVO.rank ~= nil)
	setActive(findTF(arg_8_0._tf, "info/medal"), arg_8_0.rivalVO.rank ~= nil)
	setActive(findTF(arg_8_0._tf, "info/medal/Text"), arg_8_0.rivalVO.rank ~= nil)

	if arg_8_0.rivalVO.rank then
		setText(findTF(arg_8_0._tf, "info/rank/container/value"), arg_8_0.rivalVO.rank)

		local var_8_0 = SeasonInfo.getMilitaryRank(arg_8_0.rivalVO.score, arg_8_0.rivalVO.rank)
		local var_8_1 = findTF(arg_8_0._tf, "info/medal"):GetComponent(typeof(Image))
		local var_8_2 = findTF(arg_8_0._tf, "info/medal/Text"):GetComponent(typeof(Image))
		local var_8_3 = SeasonInfo.getEmblem(arg_8_0.rivalVO.score, arg_8_0.rivalVO.rank)

		LoadSpriteAsync("emblem/" .. var_8_3, function(arg_9_0)
			var_8_1.sprite = arg_9_0

			var_8_2:SetNativeSize()
		end)
		LoadSpriteAsync("emblem/n_" .. var_8_3, function(arg_10_0)
			var_8_2.sprite = arg_10_0

			var_8_2:SetNativeSize()
		end)
	end

	arg_8_0.names = {}

	local function var_8_4(arg_11_0, arg_11_1)
		flushShipCard(arg_11_0, arg_11_1)

		local var_11_0 = getProxy(PlayerProxy):getRawData():ShouldCheckCustomName() and arg_11_1:GetDefaultName() or arg_11_1:getName()

		setScrollText(findTF(arg_11_0, "content/info/name_mask/name"), arg_11_1:GetColorName(var_11_0))
	end

	local function var_8_5(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
		local var_12_0 = cloneTplTo(arg_8_0.shipCardTpl, arg_12_2)

		var_12_0.localScale = Vector3(1.1, 1.1, 1)

		setActive(arg_8_0:findTF("content", var_12_0), arg_12_3 ~= nil)
		setActive(arg_8_0:findTF("empty", var_12_0), arg_12_3 == nil)

		if arg_12_3 then
			var_8_4(var_12_0, arg_12_3)
			table.insert(arg_8_0.names, {
				var_12_0,
				arg_12_3
			})
		end
	end

	local var_8_6 = arg_8_0:findTF("ships_container/ships/main", arg_8_0._tf)
	local var_8_7 = #arg_8_0.rivalVO.mainShips

	for iter_8_0 = 1, 3 do
		var_8_5(var_8_7, iter_8_0, var_8_6, arg_8_0.rivalVO.mainShips[iter_8_0])
	end

	local var_8_8 = arg_8_0:findTF("ships_container/ships/vanguard", arg_8_0._tf)
	local var_8_9 = #arg_8_0.rivalVO.vanguardShips

	for iter_8_1 = 1, 3 do
		var_8_5(var_8_9, iter_8_1, var_8_8, arg_8_0.rivalVO.vanguardShips[iter_8_1])
	end

	local var_8_10 = arg_8_0:findTF("ships_container/main_comprehensive", arg_8_0._tf)
	local var_8_11 = arg_8_0:findTF("ships_container/vanguard_comprehensive", arg_8_0._tf)
	local var_8_12 = arg_8_0:findTF("ships_container/main_comprehensive/Text", arg_8_0._tf)
	local var_8_13 = arg_8_0:findTF("ships_container/vanguard_comprehensive/Text", arg_8_0._tf)
	local var_8_14 = arg_8_0.rivalVO:GetGearScoreSum(TeamType.Main)
	local var_8_15 = arg_8_0.rivalVO:GetGearScoreSum(TeamType.Vanguard)

	LeanTween.value(go(var_8_12), 0, var_8_14, 0.5):setOnUpdate(System.Action_float(function(arg_13_0)
		setText(var_8_12, math.floor(arg_13_0))
	end))
	LeanTween.value(go(var_8_13), 0, var_8_15, 0.5):setOnUpdate(System.Action_float(function(arg_14_0)
		setText(var_8_13, math.floor(arg_14_0))
	end)):setOnComplete(System.Action(function()
		setActive(arg_8_0.startBtn, arg_8_0.contextData.type == arg_8_0.TYPE_BATTLE)
		pg.UIMgr.GetInstance():LoadingOff()
	end))
end

function var_0_0.willExit(arg_16_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_16_0._tf, pg.UIMgr.GetInstance().UIMain)
end

return var_0_0
