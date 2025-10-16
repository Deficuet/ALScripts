local var_0_0 = class("RyzaPtPage", import(".TemplatePage.PtTemplatePage"))
local var_0_1 = 9

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.kalaSpine = arg_1_0.bg:Find("shadow/kala")
	arg_1_0.kalaAnim = arg_1_0.kalaSpine:GetComponent("SpineAnimUI")
	arg_1_0.puniSpine = arg_1_0.bg:Find("puni")
	arg_1_0.puniAnim = arg_1_0.puniSpine:GetComponent("SpineAnimUI")
	arg_1_0.feedBtn = arg_1_0.bg:Find("feed_btn")
	arg_1_0.clickMask = arg_1_0.bg:Find("click_mask")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	arg_2_0:InitAnimData()
	onButton(arg_2_0, arg_2_0.feedBtn, function()
		local var_3_0 = {}

		table.insert(var_3_0, function(arg_4_0)
			arg_2_0:PlayFeedAnim(arg_4_0)
		end)

		local var_3_1 = arg_2_0.ptData:GetAward()
		local var_3_2 = getProxy(PlayerProxy):getRawData()
		local var_3_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_3_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_3_3)
		local var_3_5, var_3_6 = Task.StaticJudgeOverflow(var_3_2.gold, var_3_2.oil, var_3_4, true, true, {
			{
				var_3_1.type,
				var_3_1.id,
				var_3_1.count
			}
		})

		if var_3_5 then
			table.insert(var_3_0, function(arg_5_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_3_6,
					onYes = arg_5_0
				})
			end)
		end

		seriesAsync(var_3_0, function()
			local var_6_0, var_6_1 = arg_2_0.ptData:GetResProgress()

			arg_2_0:emit(ActivityMediator.EVENT_PT_OPERATION, {
				cmd = 1,
				activity_id = arg_2_0.ptData:GetId(),
				arg1 = var_6_1
			})
		end)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_7_0)
	var_0_0.super.OnUpdateFlush(arg_7_0)

	local var_7_0 = arg_7_0.ptData:GetLevelProgress()

	if isActive(arg_7_0.getBtn) and arg_7_0.specialPhase[var_7_0] then
		setActive(arg_7_0.getBtn, false)
		setActive(arg_7_0.feedBtn, true)
	else
		setActive(arg_7_0.feedBtn, false)
	end
end

function var_0_0.UpdateSpineIdle(arg_8_0, arg_8_1)
	arg_8_0.kalaAnim:SetAction("pt_ui", 0)

	if arg_8_1 > arg_8_0.puniPhaseCfg[#arg_8_0.puniPhaseCfg] then
		local var_8_0 = arg_8_0.puniPhaseCfg[math.random(#arg_8_0.puniPhaseCfg)]
		local var_8_1, var_8_2, var_8_3 = arg_8_0:GetAnimName(var_8_0)

		arg_8_0.puniAnim:SetAction(var_8_1, 0)
		arg_8_0:PlayIdleFeedAnim(var_8_2, var_8_3)
	else
		local var_8_4 = arg_8_0:GetAnimName()

		arg_8_0.puniAnim:SetAction(var_8_4, 0)
	end
end

function var_0_0.PlayIdleFeedAnim(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0:PlayKalaAnim()
	arg_9_0.puniAnim:SetActionCallBack(function(arg_10_0)
		if arg_10_0 == "finish" then
			arg_9_0.puniAnim:SetActionCallBack(nil)
			arg_9_0.puniAnim:SetAction(arg_9_2, 0)
		end
	end)
	arg_9_0.puniAnim:SetAction(arg_9_1, 0)
end

function var_0_0.PlayFeedAnim(arg_11_0, arg_11_1)
	setActive(arg_11_0.clickMask, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_11_0.clickMask)
	arg_11_0:PlayKalaAnim()
	arg_11_0:PlayPuniChangeAnim(function()
		setActive(arg_11_0.clickMask, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0.clickMask, arg_11_0.bg)

		if arg_11_1 then
			arg_11_1()
		end
	end)
end

function var_0_0.PlayKalaAnim(arg_13_0, arg_13_1)
	arg_13_0.kalaAnim:SetActionCallBack(function(arg_14_0)
		if arg_14_0 == "finish" then
			arg_13_0.kalaAnim:SetActionCallBack(nil)
			arg_13_0.kalaAnim:SetAction("pt_ui", 0)

			if arg_13_1 then
				arg_13_1()
			end
		end
	end)
	arg_13_0.kalaAnim:SetAction("event_weishi", 0)
end

function var_0_0.PlayPuniChangeAnim(arg_15_0, arg_15_1)
	local var_15_0, var_15_1, var_15_2 = arg_15_0:GetAnimName()

	arg_15_0.puniAnim:SetActionCallBack(function(arg_16_0)
		if arg_16_0 == "finish" then
			arg_15_0.puniAnim:SetActionCallBack(nil)
			arg_15_0.puniAnim:SetAction(var_15_2, 0)

			if arg_15_1 then
				arg_15_1()
			end
		end
	end)
	arg_15_0.puniAnim:SetAction(var_15_1, 0)
end

function var_0_0.InitAnimData(arg_17_0)
	arg_17_0.puniPhaseCfg = arg_17_0.activity:getConfig("config_client").puni_phase
	arg_17_0.specialPhase = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.puniPhaseCfg) do
		arg_17_0.specialPhase[iter_17_1] = true
	end

	arg_17_0.phase2anims = {}

	local var_17_0, var_17_1 = arg_17_0.ptData:GetLevelProgress()
	local var_17_2 = 1

	for iter_17_2 = 1, arg_17_0.puniPhaseCfg[#arg_17_0.puniPhaseCfg] do
		local var_17_3 = {}

		table.insert(var_17_3, "normal_" .. var_17_2)

		if arg_17_0.specialPhase[iter_17_2] then
			table.insert(var_17_3, "action" .. var_17_2)
			table.insert(var_17_3, "normal_" .. var_17_2 + 1)

			var_17_2 = var_17_2 + 1
		end

		table.insert(arg_17_0.phase2anims, var_17_3)
	end
end

function var_0_0.GetAnimName(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1 and arg_18_1 or arg_18_0.ptData:GetLevelProgress()

	if var_18_0 > arg_18_0.puniPhaseCfg[#arg_18_0.puniPhaseCfg] then
		return "normal_" .. math.random(var_0_1)
	else
		local var_18_1 = arg_18_0.phase2anims[var_18_0]

		return var_18_1[1], var_18_1[2], var_18_1[3]
	end
end

function var_0_0.OnShowFlush(arg_19_0)
	arg_19_0:UpdateSpineIdle(arg_19_0.ptData:GetLevelProgress())
end

return var_0_0
