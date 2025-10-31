local var_0_0 = class("VoteFameHallLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	if PLATFORM_CODE == PLATFORM_CHT then
		return "VoteFameHallUIForCht"
	else
		return "VoteFameHallUI"
	end
end

function var_0_0.SetPastVoteData(arg_2_0, arg_2_1)
	arg_2_0.voteData = arg_2_1
end

function var_0_0.init(arg_3_0)
	arg_3_0.tip = arg_3_0._tf:Find("Text"):GetComponent(typeof(Text))
	arg_3_0.backBtn = arg_3_0._tf:Find("adapt/back")
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0.backBtn, function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end, SFX_PANEL)
	arg_4_0:InitData()
end

function var_0_0.InitData(arg_6_0)
	arg_6_0.displays = {}
	arg_6_0.btns = {}

	local var_6_0 = false

	for iter_6_0, iter_6_1 in pairs(arg_6_0.voteData) do
		local var_6_1 = arg_6_0._tf:Find("adapt/btns/btn_" .. iter_6_0)

		arg_6_0.displays[iter_6_0] = iter_6_1

		onToggle(arg_6_0, var_6_1, function(arg_7_0)
			if arg_7_0 then
				arg_6_0:Flush(iter_6_0)
			end
		end, SFX_PANEL)

		arg_6_0.btns[iter_6_0] = var_6_1

		if not var_6_0 then
			triggerToggle(var_6_1, true)

			var_6_0 = true
		end
	end

	arg_6_0:UpdateBtnsTip()
end

function var_0_0.Flush(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.displays[arg_8_1]

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		local var_8_1 = pg.vote_champion[iter_8_1]
		local var_8_2 = arg_8_0._tf:Find(arg_8_1 .. "/" .. var_8_1.rank)
		local var_8_3 = var_8_1.story
		local var_8_4 = var_8_1.task

		onButton(arg_8_0, var_8_2, function()
			arg_8_0:GetAward(var_8_3, var_8_4)
		end, SFX_PANEL)
	end

	arg_8_0:UpdateTips(arg_8_1)

	arg_8_0.year = arg_8_1
end

function var_0_0.UpdateTips(arg_10_0, arg_10_1)
	if not arg_10_1 then
		return
	end

	local var_10_0 = arg_10_0.displays[arg_10_1]
	local var_10_1 = getProxy(AttireProxy)
	local var_10_2 = {
		{
			"",
			false
		},
		{
			"",
			false
		},
		{
			"",
			false
		}
	}

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		local var_10_3 = pg.vote_champion[iter_10_1]
		local var_10_4 = var_10_3.story
		local var_10_5 = var_10_3.task
		local var_10_6 = getProxy(TaskProxy)
		local var_10_7 = var_10_6:getTaskById(var_10_5) or var_10_6:getFinishTaskById(var_10_5)
		local var_10_8 = arg_10_0._tf:Find(arg_10_1 .. "/" .. var_10_3.rank .. "/title/tip")
		local var_10_9 = pg.task_data_template[var_10_5].award_display[1]
		local var_10_10 = var_10_1:getAttireFrame(AttireConst.TYPE_ICON_FRAME, var_10_9[2])

		var_10_2[iter_10_0][2] = var_10_10 ~= nil and var_10_10:isOwned()
		var_10_2[iter_10_0][1] = ShipGroup.getDefaultShipConfig(var_10_3.ship_group).name

		setActive(var_10_8, var_10_7 and var_10_7:isFinish() and not var_10_7:isReceive() and (var_10_10 == nil or not var_10_10:isOwned()))
	end

	local var_10_11 = _.map(var_10_2, function(arg_11_0)
		return arg_11_0[2] and arg_11_0[1] .. "(<color=#92fc63>" .. i18n("word_got") .. "</color>)" or arg_11_0[1]
	end)

	arg_10_0.tip.text = i18n("vote_fame_tip", var_10_11[1], var_10_11[2], var_10_11[3])
end

function var_0_0.UpdateBtnsTip(arg_12_0)
	local var_12_0 = getProxy(TaskProxy)
	local var_12_1 = getProxy(AttireProxy)

	for iter_12_0, iter_12_1 in pairs(arg_12_0.displays) do
		local var_12_2 = _.any(iter_12_1, function(arg_13_0)
			local var_13_0 = pg.vote_champion[arg_13_0].task
			local var_13_1 = var_12_0:getTaskById(var_13_0) or var_12_0:getFinishTaskById(var_13_0)
			local var_13_2 = pg.task_data_template[var_13_0].award_display[1]
			local var_13_3 = var_12_1:getAttireFrame(AttireConst.TYPE_ICON_FRAME, var_13_2[2])

			return var_13_1 and var_13_1:isFinish() and not var_13_1:isReceive() and (var_13_3 == nil or not var_13_3:isOwned())
		end)

		setActive(arg_12_0.btns[iter_12_0]:Find("tip"), var_12_2)
	end
end

function var_0_0.GetAward(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = {
		function(arg_15_0)
			pg.NewStoryMgr.GetInstance():Play(arg_14_1, arg_15_0, true)
		end,
		function(arg_16_0)
			local var_16_0 = getProxy(TaskProxy)
			local var_16_1 = var_16_0:getTaskById(arg_14_2) or var_16_0:getFinishTaskById(arg_14_2)

			if var_16_1 and var_16_1:isFinish() and not var_16_1:isReceive() then
				arg_14_0:emit(VoteFameHallMediator.ON_SUBMIT_TASK, var_16_1.id)
			end

			arg_16_0()
		end
	}

	seriesAsync(var_14_0)
end

function var_0_0.willExit(arg_17_0)
	return
end

return var_0_0
