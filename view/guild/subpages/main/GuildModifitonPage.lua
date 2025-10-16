local var_0_0 = class("GuildModiftionPage", import("...base.GuildBasePage"))

function var_0_0.getTargetUI(arg_1_0)
	return "GuildModiftionBluePage", "GuildModiftionRedPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.nameInput = findTF(arg_2_0._tf, "frame/name_bg/input"):GetComponent(typeof(InputField))
	arg_2_0.factionBLHXToggle = findTF(arg_2_0._tf, "frame/policy_container/faction/blhx")
	arg_2_0.factionCSZZToggle = findTF(arg_2_0._tf, "frame/policy_container/faction/cszz")
	arg_2_0.policyRELAXToggle = findTF(arg_2_0._tf, "frame/policy_container/policy/relax")
	arg_2_0.policyPOWERToggle = findTF(arg_2_0._tf, "frame/policy_container/policy/power")
	arg_2_0.manifestoInput = findTF(arg_2_0._tf, "frame/policy_container/input_frame/input"):GetComponent(typeof(InputField))
	arg_2_0.confirmBtn = findTF(arg_2_0._tf, "frame/confirm_btn")
	arg_2_0.cancelBtn = findTF(arg_2_0._tf, "frame/cancel_btn")
	arg_2_0.quitBtn = findTF(arg_2_0._tf, "frame/quit_btn")
	arg_2_0.dissolveBtn = findTF(arg_2_0._tf, "frame/dissolve_btn")
	arg_2_0.factionMask = findTF(arg_2_0._tf, "frame/policy_container/faction/mask")
	arg_2_0.costTF = findTF(arg_2_0._tf, "frame/confirm_btn/print_container/Text"):GetComponent(typeof(Text))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.costTF.text = 0
	arg_3_0.modifyBackBG = arg_3_0._tf:Find("bg_decorations")

	setActive(arg_3_0._tf, false)
	onButton(arg_3_0, arg_3_0.cancelBtn, function()
		arg_3_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.dissolveBtn, function()
		if arg_3_0.guildVO then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("guild_tip_dissolve"),
				onYes = function()
					arg_3_0:emit(GuildMainMediator.DISSOLVE, arg_3_0.guildVO.id)
				end
			})
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.quitBtn, function()
		seriesAsync({
			function(arg_8_0)
				arg_3_0:DealQuit(arg_8_0)
			end
		}, function()
			arg_3_0:emit(GuildMainMediator.QUIT, arg_3_0.guildVO.id)
		end)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.modifyBackBG, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		local var_11_0 = Clone(arg_3_0.guildVO)
		local var_11_1 = arg_3_0.nameInput.text
		local var_11_2 = arg_3_0.manifestoInput.text

		if not var_11_1 or var_11_1 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_noname"))

			return
		end

		if not nameValidityCheck(var_11_1, 0, 20, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"err_name_existOtherChar"
		}) then
			return
		end

		if var_11_1 ~= arg_3_0.guildVO:getName() and pg.gameset.modify_guild_cost.key_value > getProxy(PlayerProxy):getData():getTotalGem() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		if not var_11_2 or var_11_2 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("guild_create_error_nomanifesto"))

			return
		end

		var_11_0:setName(var_11_1)
		var_11_0:setPolicy(arg_3_0.policy)
		var_11_0:setFaction(arg_3_0.faction)
		var_11_0:setManifesto(var_11_2)

		local function var_11_3()
			if var_11_0:getPolicy() ~= arg_3_0.guildVO:getPolicy() then
				arg_3_0:emit(GuildMainMediator.MODIFY, 3, var_11_0:getPolicy(), "")
			end

			if var_11_0:getManifesto() ~= arg_3_0.guildVO:getManifesto() then
				arg_3_0:emit(GuildMainMediator.MODIFY, 4, 0, var_11_0:getManifesto())
			end

			if var_11_0:getName() ~= arg_3_0.guildVO:getName() then
				arg_3_0:emit(GuildMainMediator.MODIFY, 1, 0, var_11_0:getName())
			end

			arg_3_0:Hide()
		end

		if var_11_0:getFaction() ~= arg_3_0.guildVO:getFaction() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("guild_faction_change_tip"),
				onYes = function()
					var_11_3()
					arg_3_0:emit(GuildMainMediator.MODIFY, 2, var_11_0:getFaction(), "")
				end
			})
		else
			var_11_3()
		end
	end, SFX_CONFIRM)

	local function var_3_0(arg_14_0)
		onInputChanged(arg_3_0, arg_14_0, function()
			local var_15_0 = getInputText(arg_14_0)
			local var_15_1, var_15_2 = wordVer(var_15_0, {
				isReplace = true
			})

			if var_15_1 > 0 then
				setInputText(arg_14_0, var_15_2)
			end

			if getInputText(arg_3_0.nameInput) ~= arg_3_0.guildVO:getName() then
				local var_15_3 = pg.gameset.modify_guild_cost.key_value

				setText(arg_3_0.costTF, var_15_3)
			else
				setText(arg_3_0.costTF, 0)
			end
		end)
	end

	var_3_0(arg_3_0.nameInput)
	var_3_0(arg_3_0.manifestoInput)
end

function var_0_0.DealQuit(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.guildVO:GetActiveEvent()

	if not var_16_0 or var_16_0 and not var_16_0:IsParticipant() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_tip_quit"),
			onYes = arg_16_1
		})
	else
		local var_16_1 = var_16_0:GetJoinCnt()
		local var_16_2 = var_16_0:GetMaxJoinCnt()
		local var_16_3 = var_16_2 - var_16_1 + var_16_0:GetExtraJoinCnt()
		local var_16_4 = var_16_3 <= 0 and COLOR_RED or COLOR_WHITE
		local var_16_5 = string.format("<color=%s>%d</color>/%d", var_16_4, var_16_3, var_16_2)

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_tip_quit_operation", var_16_5),
			onYes = arg_16_1
		})
	end
end

function var_0_0.DealBattleReportAward(arg_17_0, arg_17_1)
	local var_17_0 = getProxy(GuildProxy):GetCanGetReports()

	if #var_17_0 == 0 then
		arg_17_1()

		return
	end

	local function var_17_1()
		pg.m02:sendNotification(GAME.SUBMIT_GUILD_REPORT, {
			ids = var_17_0,
			callback = arg_17_1
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("guild_exist_report_award_when_exit"),
		onYes = var_17_1,
		onNo = function()
			arg_17_0:emit(GuildMainMediator.QUIT, arg_17_0.guildVO.id)
		end
	})
end

function var_0_0.Show(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.guildVO = arg_20_1
	arg_20_0.playerVO = arg_20_2

	setActive(arg_20_0._tf, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_20_0._tf)
	arg_20_0._tf:SetAsLastSibling()

	arg_20_0.isShowModify = true
	arg_20_0.nameInput.text = arg_20_0.guildVO:getName()
	arg_20_0.manifestoInput.text = arg_20_0.guildVO.manifesto

	local var_20_0 = arg_20_0.guildVO:getDutyByMemberId(arg_20_0.playerVO.id) == GuildConst.DUTY_COMMANDER

	arg_20_0.nameInput.interactable = var_20_0
	arg_20_0.manifestoInput.interactable = var_20_0

	setActive(arg_20_0.confirmBtn, var_20_0)
	setActive(arg_20_0.cancelBtn, var_20_0)

	local var_20_1 = arg_20_0.guildVO:inChangefactionTime()

	setActive(arg_20_0.factionMask, arg_20_0.guildVO:inChangefactionTime())

	if var_20_1 then
		local var_20_2 = arg_20_0.guildVO:changeFactionLeftTime()

		setText(arg_20_0.factionMask:Find("timer_container/Text"), var_20_2)
	end

	arg_20_0.faction = arg_20_0.guildVO:getFaction()

	onToggle(arg_20_0, arg_20_0.factionBLHXToggle, function(arg_21_0)
		if arg_21_0 then
			arg_20_0.faction = GuildConst.FACTION_TYPE_BLHX
		end
	end, SFX_PANEL)
	onToggle(arg_20_0, arg_20_0.factionCSZZToggle, function(arg_22_0)
		if arg_22_0 then
			arg_20_0.faction = GuildConst.FACTION_TYPE_CSZZ
		end
	end, SFX_PANEL)

	arg_20_0.policy = arg_20_0.guildVO:getPolicy()

	onToggle(arg_20_0, arg_20_0.policyRELAXToggle, function(arg_23_0)
		if arg_23_0 then
			arg_20_0.policy = GuildConst.POLICY_TYPE_RELAXATION
		end
	end, SFX_PANEL)
	onToggle(arg_20_0, arg_20_0.policyPOWERToggle, function(arg_24_0)
		if arg_24_0 then
			arg_20_0.policy = GuildConst.POLICY_TYPE_POWER
		end
	end, SFX_PANEL)

	if arg_20_0.faction == GuildConst.FACTION_TYPE_BLHX then
		triggerToggle(arg_20_0.factionBLHXToggle, true)
	elseif arg_20_0.faction == GuildConst.FACTION_TYPE_CSZZ then
		triggerToggle(arg_20_0.factionCSZZToggle, true)
	end

	if arg_20_0.policy == GuildConst.POLICY_TYPE_RELAXATION then
		triggerToggle(arg_20_0.policyRELAXToggle, true)
	elseif arg_20_0.policy == GuildConst.POLICY_TYPE_POWER then
		triggerToggle(arg_20_0.policyPOWERToggle, true)
	end

	arg_20_0.policyPOWERToggle:GetComponent(typeof(Toggle)).interactable = var_20_0
	arg_20_0.policyRELAXToggle:GetComponent(typeof(Toggle)).interactable = var_20_0
	arg_20_0.factionCSZZToggle:GetComponent(typeof(Toggle)).interactable = var_20_0
	arg_20_0.factionBLHXToggle:GetComponent(typeof(Toggle)).interactable = var_20_0

	local var_20_3 = arg_20_0.guildVO:getDutyByMemberId(arg_20_0.playerVO.id)

	setActive(arg_20_0.quitBtn, var_20_3 ~= GuildConst.DUTY_COMMANDER)
	setActive(arg_20_0.dissolveBtn, var_20_3 == GuildConst.DUTY_COMMANDER)
end

function var_0_0.Hide(arg_25_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_25_0._tf, arg_25_0._parentTf)
	setActive(arg_25_0._tf, false)
end

function var_0_0.OnDestroy(arg_26_0)
	arg_26_0:Hide()
end

return var_0_0
