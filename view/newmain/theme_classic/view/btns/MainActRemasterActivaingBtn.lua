local var_0_0 = class("MainActRemasterActivaingBtn", import(".MainActRemasterBtn"))

function var_0_0.GetLinkConfig(arg_1_0)
	local var_1_0 = getProxy(ActivityRemasterProxy).activeActID
	local var_1_1 = pg.activity_re[var_1_0]
	local var_1_2 = "event_actremaster"
	local var_1_3 = "text_event_all"

	if var_1_1 then
		var_1_2 = var_1_1.link_button_pic
		var_1_3 = var_1_1.link_button_text
	end

	return {
		param = "0",
		name = "event_actremaster",
		type = 3,
		id = 1,
		group_id = 1,
		order = 1,
		pic = var_1_2,
		text_pic = var_1_3,
		time = {
			"default",
			51033
		}
	}
end

function var_0_0.InShowTime(arg_2_0)
	arg_2_0.config = arg_2_0:GetLinkConfig()

	return getProxy(ActivityRemasterProxy):IsShowTime()
end

function var_0_0.Register(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		local var_4_0 = getProxy(ActivityRemasterProxy):GetActivaingReamsterData()

		if not var_4_0 then
			arg_3_0:emit(NewMainMediator.SKIP_ACTIVITY)
		else
			local var_4_1 = var_4_0:GetFirstOpenActId()

			arg_3_0:emit(NewMainMediator.SKIP_ACTIVITY, var_4_1)
		end
	end, SFX_MAIN)
end

function var_0_0.OnInit(arg_5_0)
	local var_5_0 = getProxy(ActivityRemasterProxy).activeActID

	if not var_5_0 then
		setActive(arg_5_0.tipTr.gameObject, false)

		return
	end

	local var_5_1 = pg.activity_re[var_5_0]

	if not var_5_1 then
		setActive(arg_5_0.tipTr.gameObject, false)

		return
	end

	local var_5_2 = _.map(var_5_1.act_time, function(arg_6_0)
		return arg_6_0[1]
	end)
	local var_5_3 = ""

	for iter_5_0, iter_5_1 in ipairs(var_5_2) do
		local var_5_4 = pg.activity_template[iter_5_1]

		if var_5_4 and var_5_4.page_core and var_5_4.page_core ~= "" then
			var_5_3 = var_5_4.page_core

			break
		end
	end

	if var_5_3 == "" then
		setActive(arg_5_0.tipTr.gameObject, false)

		return
	end

	local var_5_5 = getProxy(ActivityProxy):getCorePanelActivities(var_5_3)

	setActive(arg_5_0.tipTr.gameObject, _.any(var_5_5, function(arg_7_0)
		return arg_7_0:readyToAchieve()
	end))
end

return var_0_0
