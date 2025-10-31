local var_0_0 = class("MonthSignPage", import("...base.BaseActivityPage"))

var_0_0.SHOW_RE_MONTH_SIGN = "show re month sign award"
var_0_0.MONTH_SIGN_SHOW = {}

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("bg")
	arg_1_0.items = arg_1_0._tf:Find("items")
	arg_1_0.item = arg_1_0.items:Find("item")
	arg_1_0.monthSignReSignUI = MonthSignReSignUI.New(arg_1_0._tf, arg_1_0.event, nil)

	arg_1_0:bind(var_0_0.SHOW_RE_MONTH_SIGN, function(arg_2_0, arg_2_1, arg_2_2)
		if not arg_1_0.monthSignReSignUI:GetLoaded() then
			arg_1_0.monthSignReSignUI:Load()
		end

		arg_1_0.monthSignReSignUI:ActionInvoke("setAwardShow", arg_2_1, arg_2_2)
	end)
end

function var_0_0.OnDataSetting(arg_3_0)
	arg_3_0.config = pg.activity_month_sign[arg_3_0.activity.data2]

	if not arg_3_0.config then
		return true
	end

	arg_3_0.monthDays = pg.TimeMgr.GetInstance():CalcMonthDays(arg_3_0.activity.data1, arg_3_0.activity.data2)

	local var_3_0 = pg.TimeMgr.GetInstance():GetServerTime()

	if tonumber(pg.TimeMgr.GetInstance():STimeDescS(var_3_0, "%m")) == pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[1] then
		arg_3_0.specialTag = true
		arg_3_0.specialDay = pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[2]
		arg_3_0.isShowFrame = pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[3]
	end
end

function var_0_0.OnFirstFlush(arg_4_0)
	local var_4_0 = pg.TimeMgr.GetInstance():GetServerTime()

	arg_4_0.list = UIItemList.New(arg_4_0.items, arg_4_0.item)

	arg_4_0.list:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_5_1 + 1
			local var_5_1 = _.map(arg_4_0.config["day" .. var_5_0], function(arg_6_0)
				return Drop.Create(arg_6_0)
			end)

			updateDrop(arg_5_2, var_5_1[1])
			onButton(arg_4_0, arg_5_2, function()
				if #var_5_1 == 1 then
					arg_4_0:emit(BaseUI.ON_DROP, var_5_1[1])
				else
					arg_4_0:emit(BaseUI.ON_DROP_LIST, {
						content = "",
						item2Row = true,
						itemList = var_5_1
					})
				end
			end, SFX_PANEL)
			setText(arg_5_2:Find("day/Text"), "Day " .. var_5_0)
			setActive(arg_5_2:Find("got"), var_5_0 <= #arg_4_0.activity.data1_list)
			setActive(arg_5_2:Find("today"), var_5_0 == #arg_4_0.activity.data1_list)

			if arg_4_0.specialTag and var_5_0 == arg_4_0.specialDay then
				local var_5_2 = arg_5_2:Find("icon_bg/SpecialFrame")

				if arg_4_0.isShowFrame == 1 then
					setActive(var_5_2, false)
				else
					setActive(var_5_2, true)
				end
			end
		end
	end)
end

function var_0_0.OnUpdateFlush(arg_8_0)
	if arg_8_0:isDirtyRes() then
		return
	end

	arg_8_0.list:align(arg_8_0.monthDays)

	if arg_8_0.specialTag then
		local var_8_0 = arg_8_0._tf:Find("DayNumText")
		local var_8_1 = arg_8_0.specialDay - #arg_8_0.activity.data1_list

		if var_8_1 < 0 then
			var_8_1 = 0
		end

		setText(var_8_0, var_8_1)

		local var_8_2 = arg_8_0._tf:Find("ProgressBar")

		GetComponent(var_8_2, "Slider").value = #arg_8_0.activity.data1_list
	end

	local var_8_3 = arg_8_0.activity:getSpecialData("month_sign_awards")

	if var_8_3 and #var_8_3 > 0 then
		local var_8_4 = getProxy(PlayerProxy):getPlayerId()

		if not table.contains(MonthSignPage.MONTH_SIGN_SHOW, arg_8_0.activity.id .. ":" .. var_8_4) then
			table.insert(MonthSignPage.MONTH_SIGN_SHOW, arg_8_0.activity.id .. ":" .. var_8_4)

			if not arg_8_0.monthSignReSignUI:GetLoaded() then
				arg_8_0.monthSignReSignUI:Load()
			end

			arg_8_0.monthSignReSignUI:ActionInvoke("setAwardShow", var_8_3)
		elseif arg_8_0.monthSignReSignUI then
			arg_8_0.monthSignReSignUI:ActionInvoke("setAwardShow", var_8_3)
		end
	end
end

function var_0_0.showReMonthSign(arg_9_0)
	return
end

function var_0_0.OnDestroy(arg_10_0)
	removeAllChildren(arg_10_0.items)

	arg_10_0.monthSignPageTool = nil

	arg_10_0.monthSignReSignUI:Destroy()

	arg_10_0.monthSignReSignUI = nil
end

function var_0_0.UseSecondPage(arg_11_0, arg_11_1)
	return tonumber(pg.TimeMgr.GetInstance():CurrentSTimeDesc("%m", true)) == pg.activity_template[arg_11_1.id].config_client[1]
end

function var_0_0.isDirtyRes(arg_12_0)
	if arg_12_0.specialTag and arg_12_0:getUIName() ~= arg_12_0.activity:getConfig("page_info").ui_name2 then
		return true
	end
end

return var_0_0
