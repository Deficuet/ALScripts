local var_0_0 = class("HMSHunterPTPage", import(".TemplatePage.PtTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.helpBtn = arg_1_0.bg:Find("help")

	onButton(arg_1_0, arg_1_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("hunter_npc")
		})
	end, SFX_PANEL)
end

function var_0_0.flush_task_list_pt(arg_3_0)
	local var_3_0 = arg_3_0.activity
	local var_3_1 = _.flatten(var_3_0:getConfig("config_data"))
	local var_3_2, var_3_3, var_3_4 = arg_3_0:getDoingTask(var_3_0)
	local var_3_5 = getProxy(ActivityProxy):getActivityById(var_3_0:getConfig("config_client").rank_act_id).data1

	setText(arg_3_0.phaseTxt, var_3_2 .. "/" .. #var_3_1)

	if var_3_4 then
		local var_3_6 = var_3_4:getConfig("target_num")
		local var_3_7 = var_3_5 .. "/" .. setColorStr(var_3_6, "#FFE7B3")

		setText(arg_3_0.progressTxt, var_3_7)
		setSlider(arg_3_0.progress, 0, var_3_6, math.min(var_3_5, var_3_6))

		local var_3_8 = var_3_4:getConfig("award_display")[1]
		local var_3_9 = {
			type = var_3_8[1],
			id = var_3_8[2],
			count = var_3_8[3]
		}

		updateDrop(arg_3_0.award, var_3_9)
		onButton(arg_3_0, arg_3_0.award, function()
			arg_3_0:emit(BaseUI.ON_DROP, var_3_9)
		end, SFX_PANEL)

		arg_3_0.btn:GetComponent(typeof(Image)).enabled = not var_3_4:isFinish()

		setActive(arg_3_0.btn:Find("get"), var_3_4:isFinish() and not var_3_4:isReceive())
		setActive(arg_3_0.btn:Find("achieved"), var_3_4:isReceive())
		onButton(arg_3_0, arg_3_0.btn, function()
			if not var_3_4:isFinish() then
				arg_3_0:emit(ActivityMediator.ON_TASK_GO, var_3_4)
			end
		end, SFX_PANEL)
		onButton(arg_3_0, arg_3_0.btn:Find("get"), function()
			if var_3_4:isFinish() and not var_3_4:isReceive() then
				arg_3_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_3_4)
			end
		end)
		setButtonEnabled(arg_3_0.btn, not var_3_4:isReceive())
	end
end

return var_0_0
