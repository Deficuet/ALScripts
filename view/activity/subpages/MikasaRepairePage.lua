local var_0_0 = class("MikasaRepairePage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.layer = arg_1_0._tf:Find("layer")
end

function var_0_0.OnFirstFlush(arg_2_0)
	return
end

function var_0_0.OnUpdateFlush(arg_3_0)
	arg_3_0:update_task_list_mikasa_museum(arg_3_0.activity, arg_3_0.layer, 1)
end

function var_0_0.update_task_list_mikasa_museum(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = getProxy(TaskProxy)
	local var_4_1 = arg_4_1:getConfig("config_data")
	local var_4_2 = getProxy(ActivityProxy)
	local var_4_3 = arg_4_2:Find("AD")
	local var_4_4 = arg_4_2:Find("item")
	local var_4_5 = var_4_4:Find("helpBtn")

	onButton(arg_4_0, var_4_5, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.word_museum_help.tip
		})
	end, SFX_PANEL)

	local var_4_6
	local var_4_7
	local var_4_8
	local var_4_9 = {}
	local var_4_10
	local var_4_11

	for iter_4_0 = 1, 4 do
		local var_4_12 = var_4_4:Find("Panel/layout_layer/repair_panel" .. iter_4_0 .. "/Panel")
		local var_4_13 = var_4_12:Find("btn_repair")

		var_4_9[iter_4_0] = nil

		for iter_4_1 = 1, 4 do
			local var_4_14 = var_4_12:Find("repair" .. iter_4_1)
			local var_4_15 = var_4_1[(iter_4_0 - 1) * 4 + iter_4_1]

			arg_4_0:set_mikasa_btn(var_4_15, var_4_14, iter_4_1 == 1 and 0 or var_4_1[(iter_4_0 - 1) * 4 + iter_4_1 - 1], iter_4_1 >= 4)

			if not var_4_9[iter_4_0] then
				var_4_9[iter_4_0] = var_4_0:getTaskById(var_4_15) and var_4_15 or nil
			end
		end

		local var_4_16 = var_4_1[(iter_4_0 - 1) * 4 + 1]
		local var_4_17 = var_4_0:getTaskById(var_4_16) or var_4_0:getFinishTaskById(var_4_16)

		setActive(var_4_12:Find("line1/unselected"), not var_4_17:isReceive())
		setActive(var_4_12:Find("line1/selected"), var_4_17:isReceive())

		local var_4_18 = var_4_1[(iter_4_0 - 1) * 4 + 2]
		local var_4_19 = var_4_0:getTaskById(var_4_18) or var_4_0:getFinishTaskById(var_4_18)

		setActive(var_4_12:Find("line2/unselected"), not var_4_19:isReceive())
		setActive(var_4_12:Find("line2/selected"), var_4_19:isReceive())

		local var_4_20 = var_4_1[(iter_4_0 - 1) * 4 + 3]
		local var_4_21 = var_4_0:getTaskById(var_4_20) or var_4_0:getFinishTaskById(var_4_20)

		setActive(var_4_12:Find("to_award/unselected"), not var_4_21:isReceive())
		setActive(var_4_12:Find("to_award/selected"), var_4_21:isReceive())

		local var_4_22 = var_4_1[iter_4_0 * 4]
		local var_4_23 = var_4_0:getTaskById(var_4_22) or var_4_0:getFinishTaskById(var_4_22)

		var_4_13:GetComponent(typeof(Image)).enabled = not var_4_23:isFinish()

		setActive(var_4_13:Find("get"), var_4_23:isFinish() and not var_4_23:isReceive())
		setActive(var_4_13:Find("got"), var_4_23:isReceive())
		onButton(arg_4_0, var_4_13, function()
			arg_4_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_4_0:getTaskById(var_4_9[iter_4_0]))
		end, SFX_PANEL)
		setActive(var_4_12:Find("gear"), not var_4_23:isFinish())

		if not var_4_23:isFinish() then
			local var_4_24 = var_4_0:getTaskById(var_4_9[iter_4_0])
			local var_4_25 = var_4_2:getVirtualItemNumber(tonumber(var_4_24:getConfig("target_id")))

			setText(var_4_12:Find("gear/test_bg/Text"), var_4_25 .. "/" .. var_4_24:getConfig("target_num"))
		end

		local var_4_26 = var_4_9[iter_4_0]
		local var_4_27 = var_4_26 and (var_4_0:getTaskById(var_4_26) or var_4_0:getFinishTaskById(var_4_26)) or nil

		setButtonEnabled(var_4_13, var_4_27 and var_4_27:isFinish())
		setActive(var_4_13:Find("mask"), var_4_27 and var_4_27:isFinish())
	end

	local var_4_28 = var_4_4:Find("btn_main")
	local var_4_29 = var_4_1[#var_4_1]
	local var_4_30 = var_4_0:getTaskById(var_4_29) or var_4_0:getFinishTaskById(var_4_29)

	var_4_28:GetComponent(typeof(Image)).enabled = not var_4_30:isFinish()

	setActive(var_4_28:Find("get"), var_4_30:isFinish() and not var_4_30:isReceive())
	setActive(var_4_28:Find("got"), var_4_30:isReceive())
	onButton(arg_4_0, var_4_28, function()
		if not var_4_30:isFinish() then
			local var_7_0 = var_4_2:getActivityById(ActivityConst.MIKASA_DAILY_TASK_ACTIVITY)
			local var_7_1 = pg.TimeMgr.GetInstance()
			local var_7_2 = var_7_1:DiffDay(var_7_0.data1, var_7_1:GetServerTime()) + 1
			local var_7_3 = math.clamp(var_7_2, 1, #var_7_0:getConfig("config_data"))

			if _.all(_.flatten({
				var_7_0:getConfig("config_data")[var_7_3]
			}), function(arg_8_0)
				return var_4_0:getFinishTaskById(arg_8_0) ~= nil
			end) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_museum_1"))
			else
				arg_4_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
					page = "activity"
				})
			end
		else
			arg_4_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_4_30)
		end
	end, SFX_PANEL)
	setButtonEnabled(var_4_28, not var_4_30:isReceive())

	local var_4_31 = var_4_4:Find("repair_main")

	arg_4_0:set_mikasa_btn(var_4_29, var_4_31, 0, true, arg_4_1:getConfig("config_client").story)

	for iter_4_2 = 1, 4 do
		setActive(var_4_4:Find("repair_phase/point" .. iter_4_2), iter_4_2 <= var_4_30:getProgress())

		if iter_4_2 > 1 then
			setActive(var_4_4:Find("repair_phase/line" .. iter_4_2 - 1), iter_4_2 <= var_4_30:getProgress())
		end
	end

	setText(var_4_4:Find("repair_phase/Text"), var_4_30:getProgress() .. "/4")
end

function var_0_0.set_mikasa_btn(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5)
	local var_9_0 = getProxy(TaskProxy)
	local var_9_1 = var_9_0:getTaskById(arg_9_1) or var_9_0:getFinishTaskById(arg_9_1)
	local var_9_2 = arg_9_2:Find("award")
	local var_9_3 = arg_9_2:Find("face")

	if arg_9_4 then
		setActive(var_9_2, true)
		setActive(var_9_3, false)

		local var_9_4 = pg.task_data_template[arg_9_1].award_display[1]
		local var_9_5 = {
			type = var_9_4[1],
			id = var_9_4[2],
			count = var_9_4[3]
		}

		setActive(var_9_2, var_9_4)
		updateDrop(var_9_2, var_9_5)
		onButton(arg_9_0, var_9_2, function()
			arg_9_0:emit(BaseUI.ON_DROP, var_9_5)
		end, SFX_PANEL)
		setActive(var_9_2:Find("mask"), var_9_1:isReceive())
		setActive(var_9_2:Find("black_block"), var_9_1:isReceive())
		setActive(arg_9_2:Find("Text"), false)
	else
		setActive(var_9_2, false)
		setActive(var_9_3, true)
		setActive(var_9_3:Find("bg_select"), arg_9_3 == 0 or var_9_0:getFinishTaskById(arg_9_3))
		setActive(var_9_3:Find("mask"), var_9_0:getFinishTaskById(arg_9_1))
		setActive(var_9_3:Find("black_block"), var_9_0:getFinishTaskById(arg_9_1))
	end

	if var_9_1:getConfig("sub_type") == 90 and arg_9_5 then
		for iter_9_0, iter_9_1 in ipairs(arg_9_5) do
			if iter_9_1[1] == arg_9_1 and iter_9_1[2] == var_9_1:getProgress() and not pg.NewStoryMgr.GetInstance():IsPlayed(iter_9_1[3]) then
				pg.NewStoryMgr.GetInstance():Play(iter_9_1[3])

				break
			end
		end
	end
end

return var_0_0
