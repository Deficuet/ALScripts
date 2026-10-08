local var_0_0 = class("GuildEventLayer", import("...base.BaseUI"))

var_0_0.OPEN_EVENT_INFO = "GuildEventLayer:OPEN_EVENT_INFO"
var_0_0.ON_OPEN_FORMATION = "GuildEventLayer:ON_OPEN_FORMATION"
var_0_0.ON_OPEN_MISSION = "GuildEventLayer:ON_OPEN_MISSION"
var_0_0.OPEN_MISSION_FORAMTION = "GuildEventLayer:OPEN_MISSION_FORAMTION"
var_0_0.ON_OPEN_BOSS = "GuildEventLayer:ON_OPEN_BOSS"
var_0_0.ON_OPEN_BOSS_FORMATION = "GuildEventLayer:ON_OPEN_BOSS_FORMATION"
var_0_0.OPEN_BOSS_ASSULT = "GuildEventLayer:OPEN_BOSS_ASSULT"
var_0_0.SHOW_SHIP_EQUIPMENTS = "GuildEventLayer:SHOW_SHIP_EQUIPMENTS"

function var_0_0.getUIName(arg_1_0)
	return "GuildEmptyUI"
end

function var_0_0.SetPlayer(arg_2_0, arg_2_1)
	arg_2_0.player = arg_2_1
end

function var_0_0.SetGuild(arg_3_0, arg_3_1)
	arg_3_0.guildVO = arg_3_1
	arg_3_0.events = {}
	arg_3_0.activeEvent = nil

	arg_3_0:SetEvents(arg_3_1:GetEvents())

	arg_3_0.myAssaultFleet = arg_3_1:getMemberById(arg_3_0.player.id):GetExternalAssaultFleet()
end

function var_0_0.SetEvents(arg_4_0, arg_4_1)
	arg_4_0.events = arg_4_1
	arg_4_0.activeEvent = _.detect(arg_4_0.events, function(arg_5_0)
		return arg_5_0:IsActive()
	end)
end

function var_0_0.UpdateFleet(arg_6_0)
	if arg_6_0.formationPage:GetLoaded() then
		arg_6_0.formationPage:ExecuteAction("OnFleetUpdated", arg_6_0.myAssaultFleet)
	end
end

function var_0_0.preload(arg_7_0, arg_7_1)
	seriesAsync({
		function(arg_8_0)
			pg.m02:sendNotification(GAME.GET_GUILD_REPORT, {
				callback = arg_8_0
			})
		end,
		function(arg_9_0)
			local var_9_0 = getProxy(GuildProxy):getRawData():GetActiveEvent()

			if not var_9_0 then
				pg.m02:sendNotification(GAME.GUILD_GET_ACTIVATION_EVENT, {
					force = false,
					callback = arg_9_0
				})
			elseif var_9_0 and var_9_0:IsExpired() then
				pg.m02:sendNotification(GAME.GUILD_GET_ACTIVATION_EVENT, {
					force = true,
					callback = arg_9_0
				})
			else
				arg_9_0()
			end
		end
	}, arg_7_1)
end

function var_0_0.getResource(arg_10_0)
	local var_10_0 = var_0_0.super.getResource(arg_10_0)
	local var_10_1 = {
		"ui/GuildEventPage",
		"ui/GuildMissionBossPage",
		"ui/GuildEventUI_atlas",
		"ui/GuildMissionUI_atlas",
		"ui/guildmissionui_atlas",
		"commonbg/guild_event_bg",
		"guildevent/0",
		"guildevent/0_0"
	}

	local function var_10_2(arg_11_0)
		if noEmptyStr(arg_11_0) and not table.contains(var_10_1, arg_11_0) then
			table.insert(var_10_1, arg_11_0)
		end
	end

	local var_10_3 = getProxy(GuildProxy):getRawData()
	local var_10_4 = var_10_3 and var_10_3:GetEvents() or {}

	for iter_10_0, iter_10_1 in ipairs(var_10_4) do
		var_10_2("guildevent/" .. iter_10_1.id)

		if iter_10_1:IsActive() then
			var_10_2("GuildMission/" .. iter_10_1:GetTheme())

			local var_10_5 = iter_10_1:GetMissions() or {}

			for iter_10_2, iter_10_3 in pairs(var_10_5) do
				for iter_10_4, iter_10_5 in ipairs(iter_10_3) do
					var_10_2("GuildMission/" .. iter_10_5:GetIcon())
				end
			end

			local var_10_6 = iter_10_1:GetBossMission()

			if var_10_6 then
				var_10_2("GuildMission/boss_" .. var_10_6:GetIcon())

				if var_10_6:IsActive() then
					local var_10_7 = var_10_6:GetPainting()

					if noEmptyStr(var_10_7) then
						var_10_2("guildpainting/" .. var_10_7)
					else
						local var_10_8 = var_10_6:GetEmenyId()

						var_10_2("guildboss/" .. var_10_8)
						var_10_2("guildboss/name_" .. var_10_8)
					end
				end
			end
		end
	end

	for iter_10_6, iter_10_7 in ipairs(var_10_1) do
		if not table.contains(var_10_0, iter_10_7) then
			table.insert(var_10_0, iter_10_7)
		end
	end

	return var_10_0
end

function var_0_0.getResource(arg_12_0)
	local var_12_0 = var_0_0.super.getResource(arg_12_0)
	local var_12_1 = {}

	return var_12_0
end

function var_0_0.UpdateGuild(arg_13_0, arg_13_1)
	arg_13_0:SetGuild(arg_13_1)

	if arg_13_0.formationPage and arg_13_0.formationPage:GetLoaded() then
		arg_13_0.formationPage:UpdateData(arg_13_0.guildVO, arg_13_0.player, {
			fleet = arg_13_0.myAssaultFleet
		})
	end

	if arg_13_0.eventPage and arg_13_0.eventPage:GetLoaded() then
		arg_13_0.eventPage:UpdateData(arg_13_0.guildVO, arg_13_0.player, arg_13_0.events)
	end

	if arg_13_0.eventInfoPage and arg_13_0.eventInfoPage:GetLoaded() and arg_13_0.eventInfoPage:isShowing() then
		arg_13_0.eventInfoPage:Refresh(arg_13_1, arg_13_0.player)
	end

	if arg_13_0.showAssultShipPage and arg_13_0.showAssultShipPage:GetLoaded() and arg_13_0.showAssultShipPage:isShowing() then
		arg_13_0:OnMemberAssultFleetUpdate()
	end
end

function var_0_0.RefreshMission(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.activeEvent:GetMissionById(arg_14_1)

	if arg_14_0.eventPage and arg_14_0.eventPage:GetLoaded() then
		arg_14_0.eventPage:OnRefreshNode(arg_14_0.activeEvent, var_14_0)
	end

	if arg_14_0.missionInfoPage and arg_14_0.missionInfoPage:GetLoaded() then
		arg_14_0.missionInfoPage:OnRefreshMission(var_14_0)
	end

	if arg_14_0.missionFormationPage and arg_14_0.missionFormationPage:GetLoaded() then
		arg_14_0.missionFormationPage:OnRefreshMission(var_14_0)
	end
end

function var_0_0.RefreshBossMission(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.activeEvent:GetBossMission()

	if arg_15_0.eventPage and arg_15_0.eventPage:GetLoaded() then
		arg_15_0.eventPage:OnRefreshNode(arg_15_0.activeEvent, var_15_0)
	end

	if arg_15_0.missionBossPage and arg_15_0.missionBossPage:GetLoaded() then
		arg_15_0.missionBossPage:UpdateMission(var_15_0)
		arg_15_0.missionBossPage:UpdateView()
	end
end

function var_0_0.OnBossRankUpdate(arg_16_0)
	local var_16_0 = arg_16_0.activeEvent:GetBossMission()

	if arg_16_0.missionBossPage and arg_16_0.missionBossPage:GetLoaded() then
		arg_16_0.missionBossPage:UpdateMission(var_16_0)
		arg_16_0.missionBossPage:UpdateRank()
	end
end

function var_0_0.OnBossMissionFormationChanged(arg_17_0)
	local var_17_0 = arg_17_0.activeEvent:GetBossMission()

	if arg_17_0.missionBossPage and arg_17_0.missionBossPage:GetLoaded() then
		arg_17_0.missionBossPage:UpdateMission(var_17_0)
	end

	if arg_17_0.missBossForamtionPage and arg_17_0.missBossForamtionPage:GetLoaded() then
		arg_17_0.missBossForamtionPage:UpdateMission(var_17_0, false)
	end
end

function var_0_0.OnMemberAssultFleetUpdate(arg_18_0)
	if arg_18_0.showAssultShipPage and arg_18_0.showAssultShipPage:GetLoaded() then
		arg_18_0.showAssultShipPage:UpdateData(arg_18_0.guildVO, arg_18_0.player)
	end
end

function var_0_0.OnMyAssultFleetUpdate(arg_19_0)
	if arg_19_0.formationPage and arg_19_0.formationPage:GetLoaded() then
		arg_19_0.formationPage:OnFleetUpdated(arg_19_0.myAssaultFleet)
	end
end

function var_0_0.OnMyAssultFleetFormationDone(arg_20_0)
	if arg_20_0.formationPage and arg_20_0.formationPage:GetLoaded() then
		arg_20_0.formationPage:OnFleetFormationDone()
	end
end

function var_0_0.OnReportUpdated(arg_21_0)
	if arg_21_0.eventPage and arg_21_0.eventPage:GetLoaded() then
		arg_21_0.eventPage:OnReportUpdated()
	end

	if arg_21_0.missionBossPage and arg_21_0.missionBossPage:GetLoaded() then
		arg_21_0.missionBossPage:OnReportUpdated()
	end
end

function var_0_0.OnMissionFormationDone(arg_22_0)
	if arg_22_0.missionFormationPage and arg_22_0.missionFormationPage:GetLoaded() and arg_22_0.missionFormationPage:isShowing() then
		arg_22_0.missionFormationPage:OnFormationDone()
	end
end

function var_0_0.OnMemberDeleted(arg_23_0)
	if arg_23_0.missionBossPage and arg_23_0.missionBossPage:GetLoaded() then
		arg_23_0.missionBossPage:CheckFleetShipState()
	end
end

function var_0_0.OnAssultShipBeRecommanded(arg_24_0, arg_24_1)
	if arg_24_0.showAssultShipPage and arg_24_0.showAssultShipPage:GetLoaded() then
		arg_24_0.showAssultShipPage:OnAssultShipBeRecommanded(arg_24_1)
	end
end

function var_0_0.OnRefreshAllAssultShipRecommandState(arg_25_0)
	if arg_25_0.showAssultShipPage and arg_25_0.showAssultShipPage:GetLoaded() then
		arg_25_0.showAssultShipPage:OnRefreshAll()
	end
end

function var_0_0.OnBossCommanderFormationChange(arg_26_0)
	if arg_26_0.missBossForamtionPage and arg_26_0.missBossForamtionPage:GetLoaded() then
		arg_26_0.missBossForamtionPage:OnBossCommanderFormationChange()
	end
end

function var_0_0.OnBossCommanderPrefabFormationChange(arg_27_0)
	if arg_27_0.missBossForamtionPage and arg_27_0.missBossForamtionPage:GetLoaded() then
		arg_27_0.missBossForamtionPage:OnBossCommanderPrefabFormationChange()
	end
end

function var_0_0.init(arg_28_0)
	arg_28_0:bind(var_0_0.OPEN_EVENT_INFO, function(arg_29_0, arg_29_1)
		arg_28_0.eventInfoPage:ExecuteAction("Show", arg_28_0.guildVO, arg_28_0.player, {
			gevent = arg_29_1
		})
	end)
	arg_28_0:bind(var_0_0.ON_OPEN_FORMATION, function(arg_30_0)
		arg_28_0.formationPage:ExecuteAction("Show", arg_28_0.guildVO, arg_28_0.player, {
			fleet = arg_28_0.myAssaultFleet
		})
	end)
	arg_28_0:bind(var_0_0.ON_OPEN_MISSION, function(arg_31_0, arg_31_1)
		arg_28_0.missionInfoPage:ExecuteAction("Show", arg_28_0.guildVO, arg_28_0.player, {
			mission = arg_31_1
		})
	end)
	arg_28_0:bind(var_0_0.OPEN_MISSION_FORAMTION, function(arg_32_0, arg_32_1)
		arg_28_0.missionFormationPage:ExecuteAction("Show", arg_28_0.guildVO, arg_28_0.player, {
			mission = arg_32_1,
			shipCnt = GuildConst.MISSION_MAX_SHIP_CNT
		})
	end)
	arg_28_0:bind(var_0_0.ON_OPEN_BOSS, function(arg_33_0, arg_33_1)
		arg_28_0.missionBossPage:ExecuteAction("Show", arg_33_1)
	end)
	arg_28_0:bind(var_0_0.ON_OPEN_BOSS_FORMATION, function(arg_34_0, arg_34_1)
		arg_28_0.missBossForamtionPage:ExecuteAction("Show", arg_28_0.guildVO, arg_28_0.player, {
			mission = arg_34_1
		})
	end)
	arg_28_0:bind(var_0_0.OPEN_BOSS_ASSULT, function()
		arg_28_0.showAssultShipPage:ExecuteAction("Show", arg_28_0.guildVO, arg_28_0.player)
	end)
	arg_28_0:bind(var_0_0.SHOW_SHIP_EQUIPMENTS, function(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
		arg_28_0.shipEquipmentsPage:ExecuteAction("Show", arg_36_1, arg_36_2, arg_36_3)
	end)

	arg_28_0.eventPage = GuildEventPage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.eventInfoPage = GuildEventInfoPage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.formationPage = GuildEventFormationPage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.missionInfoPage = GuildMissionInfoPage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.missionFormationPage = GuildMissionFormationPage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.missionBossPage = GuildMissionBossPage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.missBossForamtionPage = GuildMissionBossFormationPage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.showAssultShipPage = GuildShowAssultShipPage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.shipEquipmentsPage = GuildShipEquipmentsPage.New(arg_28_0._tf, arg_28_0.event, arg_28_0.contextData)
	arg_28_0.helpBtn = arg_28_0._tf:Find("frame/help")
end

function var_0_0.didEnter(arg_37_0)
	getProxy(GuildProxy):SetBattleBtnRecord()
	onButton(arg_37_0, arg_37_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.guild_event_help_tip.tip
		})
	end, SFX_PANEL)
	arg_37_0:EnterEvent()
	arg_37_0:TryPlayGuide()
end

function var_0_0.TryPlayGuide(arg_39_0)
	pg.SystemGuideMgr.GetInstance():PlayGuildAssaultFleet()
end

function var_0_0.EnterEvent(arg_40_0)
	if not arg_40_0:isLoaded() then
		return
	end

	local var_40_0 = arg_40_0.activeEvent and arg_40_0.activeEvent:GetBossMission()

	if arg_40_0.activeEvent and var_40_0 and var_40_0:IsActive() and not var_40_0:IsDeath() and arg_40_0.activeEvent:IsParticipant() then
		arg_40_0.missionBossPage:ExecuteAction("Show", var_40_0)
	else
		arg_40_0.eventPage:ExecuteAction("Show", arg_40_0.guildVO, arg_40_0.player, arg_40_0.events)
	end

	if arg_40_0.missionBossPage and arg_40_0.missionBossPage:GetLoaded() and not arg_40_0.activeEvent then
		arg_40_0.missionBossPage:Destroy()

		arg_40_0.missionBossPage = nil
	end

	if arg_40_0.activeEvent and arg_40_0.eventInfoPage and arg_40_0.eventInfoPage:GetLoaded() and arg_40_0.activeEvent:IsParticipant() then
		arg_40_0.eventInfoPage:Destroy()

		arg_40_0.eventInfoPage = nil
	end
end

function var_0_0.OnEventEnd(arg_41_0)
	arg_41_0:EnterEvent()
end

function var_0_0.onBackPressed(arg_42_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	arg_42_0:emit(var_0_0.ON_BACK)
end

function var_0_0.willExit(arg_43_0)
	if arg_43_0.eventInfoPage then
		arg_43_0.eventInfoPage:Destroy()
	end

	arg_43_0.missBossForamtionPage:Destroy()
	arg_43_0.formationPage:Destroy()
	arg_43_0.missionFormationPage:Destroy()
	arg_43_0.missionInfoPage:Destroy()
	arg_43_0.showAssultShipPage:Destroy()
	arg_43_0.eventPage:Destroy()
	arg_43_0.shipEquipmentsPage:Destroy()

	if arg_43_0.missionBossPage then
		arg_43_0.missionBossPage:Destroy()
	end

	if isActive(pg.MsgboxMgr.GetInstance()._go) then
		triggerButton(pg.MsgboxMgr.GetInstance()._closeBtn)
	end
end

return var_0_0
