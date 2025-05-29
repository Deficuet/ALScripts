local var_0_0 = class("MainSilentView", import("view.base.BaseSubView"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5 = 1
local var_0_6 = 2

function var_0_0.getUIName(arg_1_0)
	return "MainSilentViewUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.cg = arg_2_0._tf:GetComponent(typeof(CanvasGroup))
	arg_2_0.animationPlayer = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
	arg_2_0.timeTxt = arg_2_0:findTF("adapt/en/time"):GetComponent(typeof(Text))
	arg_2_0.timeEnTxt = arg_2_0:findTF("adapt/en"):GetComponent(typeof(Text))
	arg_2_0.batteryTxt = arg_2_0:findTF("adapt/battery/Text"):GetComponent(typeof(Text))
	arg_2_0.electric = {
		arg_2_0:findTF("adapt/battery/kwh/1"),
		arg_2_0:findTF("adapt/battery/kwh/2"),
		arg_2_0:findTF("adapt/battery/kwh/3")
	}
	arg_2_0.dateTxt = arg_2_0:findTF("adapt/date"):GetComponent(typeof(Text))
	arg_2_0.changeBtn = arg_2_0:findTF("change")
	arg_2_0.tips = UIItemList.New(arg_2_0:findTF("tips"), arg_2_0:findTF("tips/tpl"))
	arg_2_0.chatTr = arg_2_0:findTF("chat")
	arg_2_0.chatTxt = arg_2_0.chatTr:GetComponent(typeof(Text))
	arg_2_0.changeSkinBtn = MainChangeSkinBtn.New(arg_2_0.changeBtn, arg_2_0.event)
	arg_2_0.systemTimeUtil = LocalSystemTimeUtil.New()
	arg_2_0.musicPlayerView = MainMusicPlayerView.New(arg_2_0._tf:Find("adapt"), arg_2_0.event)

	arg_2_0.musicPlayerView:SetExtra(arg_2_0._tf:Find("adapt/MusicPlayer"))

	arg_2_0.playedList = {}
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.changeBtn, function()
		arg_3_0:TrackingSwitchShip()

		arg_3_0.changeSkinCount = arg_3_0.changeSkinCount + 1

		arg_3_0.changeSkinBtn:OnClick()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Tracking(var_0_5)
		arg_3_0:Exit()
	end, SFX_PANEL)
	arg_3_0:bind(GAME.ZERO_HOUR_OP_DONE, function()
		arg_3_0:FlushDate()
	end)
	arg_3_0:bind(GAME.REMOVE_LAYERS, function(arg_7_0, arg_7_1)
		arg_3_0:OnRemoveLayer(arg_7_1.context)
	end)
	arg_3_0:bind(MainWordView.SET_CONTENT, function(arg_8_0, arg_8_1, arg_8_2)
		arg_3_0:SetChatTxt(arg_8_2)
	end)
	arg_3_0:bind(MainWordView.START_ANIMATION, function(arg_9_0, arg_9_1, arg_9_2)
		arg_3_0:RemoveChatTimer()
		arg_3_0:AddChatTimer(arg_9_1 + arg_9_2)
	end)
	arg_3_0:bind(MainWordView.STOP_ANIMATION, function(arg_10_0, arg_10_1, arg_10_2)
		arg_3_0:RemoveChatTimer()
		arg_3_0:SetChatTxt("")
	end)
	arg_3_0.changeSkinBtn:Flush()
end

function var_0_0.RemoveChatTimer(arg_11_0)
	if arg_11_0.chatTimer then
		arg_11_0.chatTimer:Stop()

		arg_11_0.chatTimer = nil
	end
end

function var_0_0.AddChatTimer(arg_12_0, arg_12_1)
	arg_12_0.chatTimer = Timer.New(function()
		arg_12_0:SetChatTxt("")
	end, arg_12_1, 1)

	arg_12_0.chatTimer:Start()
end

function var_0_0.SetChatTxt(arg_14_0, arg_14_1)
	setActive(arg_14_0.chatTr, arg_14_1 and arg_14_1 ~= "")

	arg_14_0.chatTxt.text = arg_14_1 or ""
end

function var_0_0.OnRemoveLayer(arg_15_0, arg_15_1)
	if arg_15_1.mediator == CommissionInfoMediator or arg_15_1.mediator == NotificationMediator then
		arg_15_0:Exit()
	end
end

function var_0_0.Exit(arg_16_0, arg_16_1)
	arg_16_0:RemoveChatTimer()
	arg_16_0:TrackingSwitchShip()
	arg_16_0.dftAniEvent:SetEndEvent(nil)
	arg_16_0.dftAniEvent:SetEndEvent(function()
		arg_16_0:emit(NewMainScene.EXIT_SILENT_VIEW)

		if arg_16_1 then
			arg_16_1()
		end
	end)
	arg_16_0.animationPlayer:Play("anim_silentview_out")
end

function var_0_0.Tracking(arg_18_0, arg_18_1)
	local var_18_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_18_1 = arg_18_0.enterTime
	local var_18_2 = arg_18_0.changeSkinCount
	local var_18_3 = arg_18_1

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildExitSilentView(var_18_1, var_18_0, var_18_3))
end

function var_0_0.TrackingSwitchShip(arg_19_0)
	if not getProxy(PlayerProxy) then
		return
	end

	local var_19_0 = getProxy(PlayerProxy):getRawData()

	if not var_19_0 then
		return
	end

	local var_19_1 = var_19_0:GetFlagShip()
	local var_19_2 = var_19_1:getSkinId()

	if isa(var_19_1, VirtualEducateCharShip) then
		var_19_2 = 0
	end

	local var_19_3 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_19_4 = var_19_3 - arg_19_0.paintingTime

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildSwitchPainting(var_19_2, var_19_4))

	arg_19_0.paintingTime = var_19_3
end

function var_0_0.Show(arg_20_0)
	var_0_0.super.Show(arg_20_0)
	arg_20_0:FlushTips()
	arg_20_0:FlushBattery()
	arg_20_0:FlushTime()
	arg_20_0:FlushDate()
	arg_20_0:FlushMusicPlayer()
	arg_20_0:AddTimer()
	arg_20_0:SetChatTxt("")

	arg_20_0.changeSkinCount = 0
	arg_20_0.enterTime = pg.TimeMgr.GetInstance():GetServerTime()
	arg_20_0.paintingTime = arg_20_0.enterTime
end

function var_0_0.Reset(arg_21_0)
	var_0_0.super.Reset(arg_21_0)

	arg_21_0.exited = false
end

function var_0_0.AddTimer(arg_22_0)
	arg_22_0:RemoveTimer()

	arg_22_0.timer = Timer.New(function()
		arg_22_0:FlushTips()
		arg_22_0:FlushBattery()
	end, 30, -1)

	arg_22_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_24_0)
	if arg_24_0.timer then
		arg_24_0.timer:Stop()

		arg_24_0.timer = nil
	end
end

function var_0_0.FlushTips(arg_25_0)
	local var_25_0 = {}

	arg_25_0:CollectTips(var_25_0)

	local var_25_1 = {}

	arg_25_0.tips:make(function(arg_26_0, arg_26_1, arg_26_2)
		if UIItemList.EventUpdate == arg_26_0 then
			local var_26_0 = var_25_0[arg_26_1 + 1]
			local var_26_1 = GetSpriteFromAtlas("ui/MainUI_atlas", "noti_" .. var_26_0.type)

			arg_26_2:Find("icon"):GetComponent(typeof(Image)).sprite = var_26_1

			setText(arg_26_2:Find("num"), var_26_0.count)
			setText(arg_26_2:Find("Text"), i18n("main_silent_tip_" .. var_26_0.type))
			onButton(arg_25_0, arg_26_2, function()
				arg_25_0:PlayTipOutAnimation(arg_26_2, function()
					arg_25_0:Skip(var_26_0.type)
				end)
			end, SFX_PANEL)
			arg_25_0:InsertAnimation(var_25_1, arg_26_2)
		end
	end)
	arg_25_0.tips:align(#var_25_0)
	seriesAsync(var_25_1, function()
		return
	end)
end

function var_0_0.PlayTipOutAnimation(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0.cg.blocksRaycasts = false

	local var_30_0 = arg_30_1:GetComponent(typeof(Animation))
	local var_30_1 = arg_30_1:GetComponent(typeof(DftAniEvent))

	var_30_1:SetEndEvent(nil)
	var_30_1:SetEndEvent(function()
		arg_30_0.cg.blocksRaycasts = true

		var_30_1:SetEndEvent(nil)
		arg_30_2()
	end)
	var_30_0:Play("anim_silentview_tip_out")
end

function var_0_0.InsertAnimation(arg_32_0, arg_32_1, arg_32_2)
	if table.contains(arg_32_0.playedList, arg_32_2) then
		return
	end

	local var_32_0 = GetOrAddComponent(arg_32_2, typeof(CanvasGroup))

	var_32_0.alpha = 0

	table.insert(arg_32_1, function(arg_33_0)
		if arg_32_0.exited then
			return
		end

		var_32_0.alpha = 1

		arg_32_2:GetComponent(typeof(Animation)):Play("anim_silentview_tip_in")
		onDelayTick(arg_33_0, 0.066)
	end)
	table.insert(arg_32_0.playedList, arg_32_2)
end

function var_0_0.Skip(arg_34_0, arg_34_1)
	arg_34_0:Tracking(var_0_6)
	arg_34_0:Exit(function()
		if arg_34_1 == var_0_1 then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
		elseif arg_34_1 == var_0_2 then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT)
		elseif arg_34_1 == var_0_3 then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TECHNOLOGY)
		elseif arg_34_1 == var_0_4 then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.NAVALACADEMYSCENE, {
				warp = NavalAcademyScene.WARP_TO_TACTIC
			})
		end
	end)
end

function var_0_0.CollectTips(arg_36_0, arg_36_1)
	arg_36_0:CollectEventTips(arg_36_1)
	arg_36_0:CollectBuildTips(arg_36_1)
	arg_36_0:CollectTechTips(arg_36_1)
	arg_36_0:CollectStudentTips(arg_36_1)
end

function var_0_0.CollectEventTips(arg_37_0, arg_37_1)
	local var_37_0 = getProxy(EventProxy):countByState(EventInfo.StateFinish)

	if var_37_0 > 0 then
		table.insert(arg_37_1, {
			count = var_37_0,
			type = var_0_1
		})
	end
end

function var_0_0.CollectBuildTips(arg_38_0, arg_38_1)
	local var_38_0 = getProxy(BuildShipProxy):getFinishCount()

	if var_38_0 > 0 then
		table.insert(arg_38_1, {
			count = var_38_0,
			type = var_0_2
		})
	end
end

function var_0_0.CollectTechTips(arg_39_0, arg_39_1)
	local var_39_0 = getProxy(TechnologyProxy):getPlanningTechnologys()
	local var_39_1 = 0

	for iter_39_0, iter_39_1 in pairs(var_39_0) do
		if iter_39_1:isCompleted() then
			var_39_1 = var_39_1 + 1
		end
	end

	if var_39_1 > 0 then
		table.insert(arg_39_1, {
			count = var_39_1,
			type = var_0_3
		})
	end
end

function var_0_0.CollectStudentTips(arg_40_0, arg_40_1)
	local var_40_0 = getProxy(NavalAcademyProxy):RawGetStudentList()
	local var_40_1 = 0

	for iter_40_0, iter_40_1 in pairs(var_40_0) do
		if iter_40_1:IsFinish() then
			var_40_1 = var_40_1 + 1
		end
	end

	if var_40_1 > 0 then
		table.insert(arg_40_1, {
			count = var_40_1,
			type = var_0_4
		})
	end
end

function var_0_0.FlushBattery(arg_41_0)
	local var_41_0 = SystemInfo.batteryLevel

	if var_41_0 < 0 then
		var_41_0 = 1
	end

	local var_41_1 = math.floor(var_41_0 * 100)

	arg_41_0.batteryTxt.text = var_41_1 .. "%"

	local var_41_2 = 1 / #arg_41_0.electric

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.electric) do
		local var_41_3 = var_41_1 < (iter_41_0 - 1) * var_41_2

		setActive(iter_41_1, not var_41_3)
	end
end

function var_0_0.FlushTime(arg_42_0)
	arg_42_0.systemTimeUtil:SetUp(function(arg_43_0, arg_43_1, arg_43_2)
		if SettingsMainScenePanel.IsEnable24HourSystem() then
			arg_42_0.timeEnTxt.color = Color.New(1, 1, 1, 0)
		else
			arg_42_0.timeEnTxt.color = Color.New(1, 1, 1, 1)
			arg_43_0 = arg_43_0 > 12 and arg_43_0 - 12 or arg_43_0
		end

		if arg_43_0 < 10 then
			arg_43_0 = "0" .. arg_43_0
		end

		arg_42_0.timeTxt.text = arg_43_0 .. ":" .. arg_43_1
		arg_42_0.timeEnTxt.text = arg_43_2
	end)
end

local var_0_7 = {
	"MONDAY",
	"TUESDAY",
	"WEDNESDAY",
	"THURSDAY",
	"FRIDAY",
	"SATURDAY",
	"SUNDAY"
}
local var_0_8 = {
	"JAN",
	"FEB",
	"MAR",
	"APR",
	"MAY",
	"JUN",
	"JUL",
	"AUG",
	"SEP",
	"OCT",
	"NOV",
	"DEC"
}

function var_0_0.FlushDate(arg_44_0)
	local var_44_0 = os.date("%Y/%m/%d")
	local var_44_1 = string.split(var_44_0, "/")
	local var_44_2 = var_44_1[1]
	local var_44_3 = tonumber(var_44_1[2])
	local var_44_4 = var_44_1[3]
	local var_44_5 = pg.TimeMgr.GetInstance():GetServerWeek()
	local var_44_6 = {
		var_0_7[var_44_5],
		var_0_8[var_44_3],
		var_44_4,
		var_44_2
	}

	arg_44_0.dateTxt.text = table.concat(var_44_6, " / ")
end

function var_0_0.FlushMusicPlayer(arg_45_0)
	local var_45_0 = pg.BgmMgr.GetInstance():GetNow() == "MainMusicPlayer"

	if tobool(arg_45_0.musicPlayerView:isShowing()) ~= var_45_0 then
		if var_45_0 then
			arg_45_0.musicPlayerView:ExecuteAction("Show", true)
		else
			arg_45_0.musicPlayerView:ExecuteAction("Hide")
		end
	end
end

function var_0_0.OnDestroy(arg_46_0)
	arg_46_0:RemoveChatTimer()

	arg_46_0.exited = true

	arg_46_0.dftAniEvent:SetEndEvent(nil)
	arg_46_0:RemoveTimer()
	arg_46_0.changeSkinBtn:Dispose()

	arg_46_0.changeSkinBtn = nil

	arg_46_0.systemTimeUtil:Dispose()

	arg_46_0.systemTimeUtil = nil

	arg_46_0.musicPlayerView:Destroy()

	arg_46_0.musicPlayerView = nil
end

return var_0_0
