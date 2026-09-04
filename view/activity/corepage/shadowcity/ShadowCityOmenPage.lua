local var_0_0 = class("ShadowCityOmenPage", import("view.activity.CorePage.OutPost.OutPostOmenPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("bg")
	arg_1_0.dayTF = arg_1_0.bg:Find("total_progress/day")
	arg_1_0.maxDayTF = arg_1_0.bg:Find("total_progress/max_day")
	arg_1_0.item = arg_1_0.bg:Find("item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.btnDetail = arg_1_0.bg:Find("btn_detail")
	arg_1_0.txtDetail = arg_1_0.btnDetail:Find("detail")
	arg_1_0.btnStory = arg_1_0.bg:Find("btn_story")
	arg_1_0.taskWindow = ShadowCityOmenTaskWindow.New(arg_1_0._tf, arg_1_0.event)

	setActive(arg_1_0.item, false)

	arg_1_0.progressLabel = arg_1_0.bg:Find("total_progress/label")

	setText(arg_1_0.progressLabel, i18n("Outpost_20250904_Progress"))
	setText(arg_1_0.txtDetail, i18n("Outpost_20260514_Detail"))
end

function var_0_0.GetProgressColor(arg_2_0)
	return "#25A1FF", "#393A3C"
end

function var_0_0.UpdateTask(arg_3_0, arg_3_1, arg_3_2)
	var_0_0.super.UpdateTask(arg_3_0, arg_3_1, arg_3_2)

	local var_3_0 = arg_3_1 + 1
	local var_3_1 = arg_3_0.taskGroup[arg_3_0.nday][var_3_0]
	local var_3_2 = arg_3_0.taskProxy:getTaskById(var_3_1) or arg_3_0.taskProxy:getFinishTaskById(var_3_1)

	changeToScrollText(arg_3_2:Find("description"), var_3_2:getConfig("desc"))
end

function var_0_0.PlayStory(arg_4_0)
	local var_4_0 = arg_4_0.activity:getConfig("config_client").story
	local var_4_1 = 1

	pg.NewStoryMgr.GetInstance():Play(var_4_0[arg_4_0.nday][var_4_1], function()
		var_4_1 = var_4_1 + 1

		if var_4_0[arg_4_0.nday][var_4_1] then
			pg.NewStoryMgr.GetInstance():Play(var_4_0[arg_4_0.nday][var_4_1])
		end
	end)
end

return var_0_0
