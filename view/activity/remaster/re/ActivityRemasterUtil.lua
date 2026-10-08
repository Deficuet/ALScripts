local var_0_0 = class("ActivityRemasterUtil")

function var_0_0.AdapterCoreScene(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if isa(arg_1_0, BaseActivityPage) then
		local var_1_0 = CoreActivityPage.New(arg_1_1, arg_1_2, arg_1_3)

		setmetatable(arg_1_0, {
			__index = function(arg_2_0, arg_2_1)
				local var_2_0 = rawget(arg_2_0, "class")

				return var_2_0[arg_2_1] and var_2_0[arg_2_1] or var_1_0[arg_2_1]
			end
		})
	end
end

function var_0_0.UpdateTime(arg_3_0)
	local var_3_0 = pg.TimeMgr.GetInstance()
	local var_3_1, var_3_2 = getProxy(ActivityRemasterProxy):InActTime()

	if var_3_2 > 0 then
		local var_3_3 = pg.activity_re_timer[var_3_2]
		local var_3_4 = var_3_3.timer[2][1][1]
		local var_3_5 = var_3_3.timer[2][1][2]
		local var_3_6 = var_3_3.timer[2][1][3]
		local var_3_7 = var_3_3.timer[3][1][1]
		local var_3_8 = var_3_3.timer[3][1][2]
		local var_3_9 = var_3_3.timer[3][1][3]
		local var_3_10 = string.format("%s.%s-%s.%s", var_3_5, var_3_6, var_3_8, var_3_9)

		setText(arg_3_0.time.transform:Find("Text"), var_3_10)
		setText(arg_3_0.time.transform:Find("label"), i18n("act_remaster_tip_2", ""))

		local var_3_11 = arg_3_0.time.transform:Find("Text_1")

		if not IsNil(var_3_11) then
			setText(var_3_11, var_3_10)
		end
	end

	local var_3_12 = arg_3_0.time.transform:Find("label_1")

	if not IsNil(var_3_12) then
		setText(var_3_12, i18n("act_remaster_tip_2", ""))
	end

	local var_3_13 = arg_3_0.time.transform:Find("extend_time")

	if not IsNil(var_3_13) and arg_3_0.activity then
		local var_3_14 = arg_3_0.activity.stopTime
		local var_3_15 = var_3_0:STimeDescS(var_3_14, "*t")
		local var_3_16 = ""

		if var_3_15.hour == 0 then
			var_3_16 = string.format("%04d.%02d.%02d %02d:%02d:%02d", var_3_15.year, var_3_15.month, var_3_15.day - 1, 23, 59, 59)
		else
			var_3_16 = string.format("%04d.%02d.%02d %02d:%02d:%02d", var_3_15.year, var_3_15.month, var_3_15.day, var_3_15.hour, var_3_15.min, var_3_15.sec)
		end

		setText(var_3_13, i18n("act_remaster_extend_time", var_3_16))
	end
end

return var_0_0
