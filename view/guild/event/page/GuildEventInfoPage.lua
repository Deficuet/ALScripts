local var_0_0 = class("GuildEventInfoPage", import(".GuildEventBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "GuildEventInfoPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0._tf:Find("frame/close")
	arg_2_0.icon = arg_2_0._tf:Find("frame/icon"):GetComponent(typeof(Image))
	arg_2_0.goBtn = arg_2_0._tf:Find("frame/go_btn")
	arg_2_0.joinBtn = arg_2_0._tf:Find("frame/join_btn")
	arg_2_0.descTxt = arg_2_0._tf:Find("frame/desc"):GetComponent(typeof(Text))
	arg_2_0.consumeTF = arg_2_0._tf:Find("frame/consume")
	arg_2_0.consumeTxt = arg_2_0._tf:Find("frame/consume/Text"):GetComponent(typeof(Text))
	arg_2_0.cntTF = arg_2_0._tf:Find("frame/cnt")
	arg_2_0.cntTxt = arg_2_0._tf:Find("frame/cnt/Text"):GetComponent(typeof(Text))
	arg_2_0.nameTxt = arg_2_0._tf:Find("frame/title/Text"):GetComponent(typeof(Text))
	arg_2_0.scaleTxt = arg_2_0._tf:Find("frame/title/scale"):GetComponent(typeof(Text))
	arg_2_0.scaleCntTxt = arg_2_0._tf:Find("frame/title/scale/Text"):GetComponent(typeof(Text))
	arg_2_0.progressTF = arg_2_0._tf:Find("frame/cnt/progress")
	arg_2_0.progressTxt = arg_2_0._tf:Find("frame/cnt/progress/Text"):GetComponent(typeof(Text))
	arg_2_0.missionList = UIItemList.New(arg_2_0._tf:Find("frame/events/icons"), arg_2_0._tf:Find("frame/events/icons/tpl"))
	arg_2_0.awardList = UIItemList.New(arg_2_0._tf:Find("frame/award/displays"), arg_2_0._tf:Find("frame/award/displays/item"))

	setText(arg_2_0._tf:Find("frame/events/Text"), i18n("guild_word_may_happen_event"))
	setText(arg_2_0._tf:Find("frame/award/Text"), i18n("guild_battle_award"))
	setText(arg_2_0._tf:Find("frame/consume/label"), i18n("guild_word_consume"))
	setText(arg_2_0._tf:Find("frame/cnt/label"), i18n("guild_join_event_cnt_label"))
	setText(arg_2_0._tf:Find("frame/cnt/progress/label"), i18n("guild_join_event_progress_label"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.goBtn, function()
		if not GuildMember.IsAdministrator(arg_3_0.guild:getSelfDuty()) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_commander_and_sub_op"))

			return
		end

		local var_6_0 = arg_3_0.gevent:GetName()
		local var_6_1 = arg_3_0.gevent:GetConsume()
		local var_6_2 = arg_3_0.guild:ShouldTipActiveEvent() and i18n("guild_start_event_consume_tip", var_6_1, var_6_0) or i18n("guild_start_event_consume_tip_extra", var_6_1, var_6_0, arg_3_0.guild:GetActiveEventCnt())

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = var_6_2,
			onYes = function()
				arg_3_0:emit(GuildEventMediator.ON_ACTIVE_EVENT, arg_3_0.gevent.id)
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.joinBtn, function()
		if not arg_3_0.activeEvent then
			return
		end

		if arg_3_0.activeEvent:IsLimitedJoin() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_join_event_max_cnt_tip"))

			return
		end

		arg_3_0:JoinEvent()
	end, SFX_PANEL)
end

function var_0_0.JoinEvent(arg_9_0)
	local function var_9_0()
		local var_10_0, var_10_1 = arg_9_0.activeEvent:GetMainMissionCntAndFinishCnt()

		if var_10_1 ~= 0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("guild_join_event_exist_finished_mission_tip"),
				onYes = function()
					arg_9_0:emit(GuildEventMediator.ON_JOIN_EVENT)
				end
			})
		else
			arg_9_0:emit(GuildEventMediator.ON_JOIN_EVENT)
		end
	end

	if arg_9_0.activeEvent:GetLeftTime() <= 604800 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_tip_operation_time_is_not_ample"),
			onYes = var_9_0
		})
	else
		var_9_0()
	end
end

function var_0_0.Refresh(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0:UpdateData(arg_12_1, arg_12_2, arg_12_0.extraData)
	arg_12_0:UpdateBtnState()
end

function var_0_0.OnShow(arg_13_0)
	arg_13_0.gevent = arg_13_0.extraData.gevent

	local var_13_0 = arg_13_0.gevent

	arg_13_0.icon.sprite = GetSpriteFromAtlas("guildevent/i_" .. var_13_0.id, "")

	setActive(arg_13_0.icon.gameObject, true)

	arg_13_0.descTxt.text = var_13_0:GetDesc()

	local var_13_1 = arg_13_0.guild:getCapital()
	local var_13_2 = var_13_0:GetConsume()
	local var_13_3 = var_13_1 < var_13_2 and COLOR_RED or COLOR_GREEN

	arg_13_0.consumeTxt.text = "<color=" .. var_13_3 .. ">" .. var_13_1 .. "</color>/" .. var_13_2
	arg_13_0.nameTxt.text = var_13_0:GetName()
	arg_13_0.scaleTxt.text = var_13_0:GetScaleDesc()
	arg_13_0.scaleCntTxt.text = ""

	arg_13_0:UpdateMissions(var_13_0)
	arg_13_0:UpdateAwards(var_13_0)
	arg_13_0:UpdateBtnState()
end

function var_0_0.UpdateBtnState(arg_14_0)
	arg_14_0.activeEvent = arg_14_0.guild:GetActiveEvent()

	setActive(arg_14_0.goBtn, not arg_14_0.activeEvent)
	setActive(arg_14_0.consumeTF, not arg_14_0.activeEvent)
	setActive(arg_14_0.joinBtn, arg_14_0.activeEvent)
	setActive(arg_14_0.cntTF, arg_14_0.activeEvent)
	setActive(arg_14_0.progressTF, arg_14_0.activeEvent)

	if arg_14_0.activeEvent then
		local var_14_0 = arg_14_0.activeEvent:GetJoinCnt()
		local var_14_1 = arg_14_0.activeEvent:GetMaxJoinCnt()
		local var_14_2 = var_14_1 - var_14_0 + arg_14_0.activeEvent:GetExtraJoinCnt()
		local var_14_3 = var_14_2 <= 0 and COLOR_RED or COLOR_WHITE
		local var_14_4 = string.format("<color=%s>%d</color>/%d", var_14_3, var_14_2, var_14_1)

		arg_14_0.cntTxt.text = var_14_4

		local var_14_5, var_14_6 = arg_14_0.activeEvent:GetMainMissionCntAndFinishCnt()

		arg_14_0.progressTxt.text = var_14_6 .. "/" .. var_14_5 + 1
	end
end

function var_0_0.UpdateAwards(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1:GetDisplayAward()

	arg_15_0.awardList:make(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == UIItemList.EventUpdate then
			local var_16_0 = var_15_0[arg_16_1 + 1]
			local var_16_1 = {
				id = var_16_0[2],
				type = var_16_0[1],
				count = var_16_0[3]
			}

			updateDrop(arg_16_2, var_16_1)
			onButton(arg_15_0, arg_16_2, function()
				arg_15_0:emit(BaseUI.ON_DROP, var_16_1)
			end, SFX_PANEL)
		end
	end)
	arg_15_0.awardList:align(#var_15_0)
end

function var_0_0.UpdateMissions(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1:GetDisplayMission()

	arg_18_0.missionList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			local var_19_0 = var_18_0[arg_19_1 + 1]

			arg_19_2:GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("GuildEventIcon", var_19_0)
		end
	end)
	arg_18_0.missionList:align(#var_18_0)
end

return var_0_0
