local var_0_0 = class("BossRushAlvitReScene", import("view.activity.BossRush.Alvit.BossRushAlvitScene"))
local var_0_1 = {
	buff_time = "stop",
	unlock_story = "",
	drop_display = "",
	type = 1,
	end_time = "",
	pic_list = "",
	pt_list = "",
	id_2 = 0,
	link_id = 0,
	convert_pay = "",
	drop_client = {
		{
			1,
			1,
			0
		}
	},
	target = {
		999999999
	},
	day_unlock = {
		0
	},
	allplayer = {},
	target_buff = {},
	buff_group = {}
}

function var_0_0.getUIName(arg_1_0)
	return "BossRushAlvitReUI"
end

function var_0_0.init(arg_2_0)
	var_0_0.super.init(arg_2_0)

	arg_2_0.ticketText = arg_2_0._tf:Find("tickets/Text")
end

function var_0_0.SetActivity(arg_3_0, arg_3_1)
	var_0_0.super.SetActivity(arg_3_0, arg_3_1)
	arg_3_0:SetPtActivity(arg_3_0:CreateVirtualPtActivity(arg_3_1))
end

function var_0_0.UpdateBattle(arg_4_0)
	var_0_0.super.UpdateBattle(arg_4_0)

	if arg_4_0.ticketText then
		setText(arg_4_0.ticketText, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	end
end

function var_0_0.UpdateStoryTask(arg_5_0)
	return
end

function var_0_0.UpdateTpTip(arg_6_0)
	setActive(arg_6_0.ptTip, false)
end

function var_0_0.onBackPressed(arg_7_0)
	arg_7_0:emit(BaseUI.ON_BACK)
end

function var_0_0.CreateVirtualPtActivity(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:getConfig("config_client")

	var_8_0 = type(var_8_0) == "table" and var_8_0 or {}

	local var_8_1 = var_8_0.chapter_progress or {}
	local var_8_2 = 0

	for iter_8_0, iter_8_1 in ipairs(arg_8_1:GetActiveSeriesIds()) do
		if arg_8_1:HasPassSeries(iter_8_1) then
			var_8_2 = math.max(var_8_2, var_8_1[iter_8_0] or 0)
		end
	end

	return {
		data3 = 0,
		id = arg_8_1.id,
		data1 = var_8_2,
		data2 = pg.TimeMgr.GetInstance():GetServerTime(),
		data1_list = {},
		data2_list = {},
		data3_list = {},
		getDataConfig = function(arg_9_0, arg_9_1)
			return var_0_1[arg_9_1]
		end,
		isEnd = function()
			return false
		end
	}
end

return var_0_0
