local var_0_0 = class("MonthSignPage", import("...base.BaseActivityPage"))

var_0_0.SHOW_RE_MONTH_SIGN = "show re month sign award"
var_0_0.MILESTONE_SPECIAL_DATA = "month_sign_milestone_day"
var_0_0.MONTH_SIGN_SHOW = {}
var_0_0.MONTH_SIGN_SP_DAYS = {
	30,
	60,
	120,
	240,
	300
}

function var_0_0.getResource(arg_1_0, arg_1_1)
	local var_1_0 = {
		"ui/MonthSignReSignUI",
		"weaponframes",
		"shiptype",
		"ui/iconcolorful"
	}

	table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0, arg_1_1))

	return var_1_0
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.bg = arg_2_0._tf:Find("bg")
	arg_2_0.items = arg_2_0._tf:Find("items")
	arg_2_0.item = arg_2_0.items:Find("item")
	arg_2_0.spDay = arg_2_0._tf:Find("sp_day")
	arg_2_0.spDayEffects = {}
	arg_2_0.monthSignReSignUI = MonthSignReSignUI.New(arg_2_0._tf, arg_2_0.event, nil)

	arg_2_0:bind(var_0_0.SHOW_RE_MONTH_SIGN, function(arg_3_0, arg_3_1, arg_3_2)
		if not arg_2_0.monthSignReSignUI:GetLoaded() then
			arg_2_0.monthSignReSignUI:Load()
		end

		arg_2_0.monthSignReSignUI:ActionInvoke("setAwardShow", arg_3_1, arg_3_2)
	end)

	for iter_2_0, iter_2_1 in ipairs(MonthSignPage.MONTH_SIGN_SP_DAYS) do
		local var_2_0 = arg_2_0.spDay:Find(iter_2_1 .. "days")

		arg_2_0.spDayEffects[iter_2_1] = var_2_0

		setActive(var_2_0, false)
	end

	setActive(arg_2_0.spDay, false)
	setText(arg_2_0._tf:Find("login/Text"), i18n("yearly_sign_in"))
	setText(arg_2_0._tf:Find("login/count/Text"), i18n("word_date"))
end

function var_0_0.OnDataSetting(arg_4_0)
	arg_4_0.config = pg.activity_month_sign[arg_4_0.activity.data2]

	if not arg_4_0.config then
		return true
	end

	arg_4_0.monthDays = pg.TimeMgr.GetInstance():CalcMonthDays(arg_4_0.activity.data1, arg_4_0.activity.data2)

	local var_4_0 = pg.TimeMgr.GetInstance():GetServerTime()

	if tonumber(pg.TimeMgr.GetInstance():STimeDescS(var_4_0, "%m")) == pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[1] then
		arg_4_0.specialTag = true
		arg_4_0.specialDay = pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[2]
		arg_4_0.isShowFrame = pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[3]
	end
end

function var_0_0.OnFirstFlush(arg_5_0)
	arg_5_0.list = UIItemList.New(arg_5_0.items, arg_5_0.item)

	arg_5_0.list:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = arg_6_1 + 1
			local var_6_1 = _.map(arg_5_0.config["day" .. var_6_0], function(arg_7_0)
				return Drop.Create(arg_7_0)
			end)

			updateDrop(arg_6_2, var_6_1[1])
			onButton(arg_5_0, arg_6_2, function()
				if #var_6_1 == 1 then
					arg_5_0:emit(BaseUI.ON_DROP, var_6_1[1])
				else
					arg_5_0:emit(BaseUI.ON_DROP_LIST, {
						content = "",
						item2Row = true,
						itemList = var_6_1
					})
				end
			end, SFX_PANEL)
			setText(arg_6_2:Find("day/Text"), "Day " .. var_6_0)
			setActive(arg_6_2:Find("got"), var_6_0 <= #arg_5_0.activity.data1_list)
			setActive(arg_6_2:Find("today"), var_6_0 == #arg_5_0.activity.data1_list)

			if arg_5_0.specialTag and var_6_0 == arg_5_0.specialDay then
				local var_6_2 = arg_6_2:Find("icon_bg/SpecialFrame")

				if arg_5_0.isShowFrame == 1 then
					setActive(var_6_2, false)
				else
					setActive(var_6_2, true)
				end
			end
		end
	end)
	arg_5_0:UpdateLoginInfo()
end

function var_0_0.OnUpdateFlush(arg_9_0)
	if arg_9_0:isDirtyRes() then
		return
	end

	arg_9_0:UpdateLoginInfo()
	arg_9_0.list:align(arg_9_0.monthDays)

	if arg_9_0.specialTag then
		local var_9_0 = arg_9_0._tf:Find("DayNumText")
		local var_9_1 = arg_9_0.specialDay - #arg_9_0.activity.data1_list

		if var_9_1 < 0 then
			var_9_1 = 0
		end

		setText(var_9_0, var_9_1)

		local var_9_2 = arg_9_0._tf:Find("ProgressBar")

		GetComponent(var_9_2, "Slider").value = #arg_9_0.activity.data1_list
	end

	local var_9_3 = arg_9_0.activity:getSpecialData("month_sign_awards")

	if var_9_3 and #var_9_3 > 0 then
		local var_9_4 = getProxy(PlayerProxy):getPlayerId()

		if not table.contains(MonthSignPage.MONTH_SIGN_SHOW, arg_9_0.activity.id .. ":" .. var_9_4) then
			table.insert(MonthSignPage.MONTH_SIGN_SHOW, arg_9_0.activity.id .. ":" .. var_9_4)

			if not arg_9_0.monthSignReSignUI:GetLoaded() then
				arg_9_0.monthSignReSignUI:Load()
			end

			arg_9_0.monthSignReSignUI:ActionInvoke("setAwardShow", var_9_3)
		elseif arg_9_0.monthSignReSignUI then
			arg_9_0.monthSignReSignUI:ActionInvoke("setAwardShow", var_9_3)
		end
	end
end

function var_0_0.showReMonthSign(arg_10_0)
	return
end

function var_0_0.OnDestroy(arg_11_0)
	if arg_11_0.spEffectLT then
		LeanTween.cancel(arg_11_0.spEffectLT)

		arg_11_0.spEffectLT = nil
	end

	removeAllChildren(arg_11_0.items)

	arg_11_0.monthSignPageTool = nil

	arg_11_0.monthSignReSignUI:Destroy()

	arg_11_0.monthSignReSignUI = nil
end

function var_0_0.UseSecondPage(arg_12_0, arg_12_1)
	return tonumber(pg.TimeMgr.GetInstance():CurrentSTimeDesc("%m", true)) == pg.activity_template[arg_12_1.id].config_client[1]
end

function var_0_0.isDirtyRes(arg_13_0)
	if arg_13_0.specialTag and arg_13_0:getUIName() ~= arg_13_0.activity:getConfig("page_info").ui_name2 then
		return true
	end
end

function var_0_0.UpdateLoginInfo(arg_14_0)
	local var_14_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOGIN_RECORD)
	local var_14_1 = arg_14_0._tf:Find("login")

	setActive(var_14_1, var_14_0 and not var_14_0:isEnd())

	if var_14_0 and not var_14_0:isEnd() then
		local var_14_2, var_14_3, var_14_4 = unpack(var_14_0:getConfig("time"))

		setText(var_14_1:Find("month"), string.format("%02d/%02d/%02d-%02d/%02d/%02d", var_14_3[1][1] % 100, var_14_3[1][2], var_14_3[1][3], var_14_4[1][1] % 100, var_14_4[1][2], var_14_4[1][3]))
		setText(var_14_1:Find("count/day"), var_14_0:getData1())
	end
end

function var_0_0.TryShowSpEffect(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.activity:getSpecialData(var_0_0.MILESTONE_SPECIAL_DATA)
	local var_15_1 = arg_15_0.spDayEffects[var_15_0]
	local var_15_2 = var_15_1:Find("heidi"):GetComponent(typeof("UnityEngine.ParticleSystem"))
	local var_15_3 = arg_15_0:GetEffectLeftTime(var_15_2)

	arg_15_0.activity:setSpecialData(var_0_0.MILESTONE_SPECIAL_DATA, nil)
	setActive(arg_15_0.spDay, true)

	if arg_15_0.spEffectLT then
		LeanTween.cancel(arg_15_0.spEffectLT)

		arg_15_0.spEffectLT = nil
	end

	setActive(var_15_1, true)

	arg_15_0.spEffectLT = LeanTween.value(go(var_15_1), 0, 1, var_15_3):setOnComplete(System.Action(function()
		arg_15_0.spEffectLT = nil

		arg_15_0:HideSPEffect(arg_15_1)
	end)).uniqueId
end

function var_0_0.GetEffectLeftTime(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1.main
	local var_17_1 = var_17_0.duration
	local var_17_2 = var_17_0.startLifetime.constantMax

	return var_17_0.startDelay.constantMax + var_17_1 + var_17_2
end

function var_0_0.HideSPEffect(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.spDayEffects) do
		if iter_18_1 then
			setActive(iter_18_1, false)
		end
	end

	setActive(arg_18_0.spDay, false)
	existCall(arg_18_1)
end

function var_0_0.ShouldPlaySpEffect(arg_19_0)
	if not arg_19_0 then
		return false
	end

	if arg_19_0:getConfig("type") ~= ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
		return false
	end

	local var_19_0 = arg_19_0:getSpecialData(var_0_0.MILESTONE_SPECIAL_DATA)

	return var_19_0 and table.contains(var_0_0.MONTH_SIGN_SP_DAYS, var_19_0)
end

return var_0_0
