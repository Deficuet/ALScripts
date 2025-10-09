local var_0_0 = class("AEBCSCoreActivityUI", import("view.activity.CorePage.CoreActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return "AEBCSCoreActivityUI"
end

local var_0_1 = 50152

function var_0_0.init(arg_2_0, ...)
	var_0_0.super.init(arg_2_0, ...)

	local var_2_0, var_2_1 = pg.TimeMgr.GetInstance():inTime(pg.activity_template[var_0_1].time)
	local var_2_2

	if var_2_1 then
		local var_2_3 = pg.TimeMgr.GetInstance():Table2ServerTime(var_2_1)

		var_2_2 = arg_2_0:skinCommdityTimeStamp(var_2_3)
	end

	if var_2_2 ~= nil then
		setText(arg_2_0._tf:Find("adapt/top/btn_home/text_tip/Text (Legacy)"), var_2_2)
	end

	local var_2_4

	arg_2_0.tabsList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = underscore.detect(arg_2_0.activities, function(arg_4_0)
				return tostring(arg_4_0:getConfig("is_show")) == arg_3_2.name
			end)

			if not var_3_0 or var_3_0:isEnd() then
				setActive(arg_3_2, false)
			elseif not arg_2_0.pageDic[var_3_0.id] then
				warning(string.format("without page in act:", var_3_0.id))
			else
				arg_2_0:ONToggleName(arg_3_2, var_3_0)

				local var_3_1 = arg_2_0.pageDic[var_3_0.id]

				if var_3_1 ~= nil then
					local var_3_2 = arg_2_0:findTF("tip", arg_3_2)
					local var_3_3 = var_3_1:IsShowReminder()

					if var_3_3 == nil then
						setActive(var_3_2, var_3_0:readyToAchieve())
					else
						setActive(var_3_2, var_3_3)
					end

					onToggle(arg_2_0, arg_3_2, function(arg_5_0)
						if arg_5_0 then
							arg_2_0:selectActivity(var_3_0)

							if var_2_4 ~= var_3_0.id then
								-- block empty
							end

							var_2_4 = var_3_0.id
						end
					end, SFX_PANEL)
				end
			end
		end
	end)

	arg_2_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_6_0, arg_6_1)
		arg_2_0:UpdateAdapt()
	end)

	arg_2_0:UpdateAdapt()
end

function var_0_0.UpdateAdapt(arg_7_0)
	local var_7_0 = 1.3333333333333333
	local var_7_1 = 2.3333333333333335
	local var_7_2 = pg.CameraFixMgr.GetInstance()
	local var_7_3 = var_7_2.currentWidth / var_7_2.currentHeight
	local var_7_4 = math.clamp(var_7_3, var_7_0, var_7_1)

	arg_7_0._tf:GetComponent(typeof(AspectRatioFitter)).aspectRatio = var_7_4

	setSizeDelta(arg_7_0._tf:Find("adapt"), {
		x = 0,
		y = 0
	})

	local var_7_5 = NotchAdapt.CheckNotchRatio == math.clamp(NotchAdapt.CheckNotchRatio, var_7_0, var_7_1)

	SetComponentEnabled(arg_7_0._tf:Find("adapt"), "NotchAdapt", var_7_5)
end

function var_0_0.ONToggleName(arg_8_0, arg_8_1, arg_8_2)
	setText(arg_8_0:findTF("off/name", arg_8_1), i18n("danmachi_main_sheet" .. arg_8_2:getConfig("is_show")))
	setText(arg_8_0:findTF("on/name", arg_8_1), i18n("danmachi_main_sheet" .. arg_8_2:getConfig("is_show")))
end

function var_0_0.didEnter(arg_9_0)
	var_0_0.super.didEnter(arg_9_0)

	if not arg_9_0.contextData.activeScenario then
		arg_9_0._tf:GetComponent(typeof(Animation)).enabled = true
	end

	onButton(arg_9_0, arg_9_0.btnBack, function()
		local var_10_0 = arg_9_0.pageDic[arg_9_0.activity.id]

		if var_10_0:IsShowingPopWindow() then
			var_10_0:ClosePopWindow()
		else
			arg_9_0:emit(var_0_0.ON_BACK)
		end
	end, SOUND_BACK)
end

function var_0_0.skinCommdityTimeStamp(arg_11_0, arg_11_1)
	local var_11_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_11_1 = math.max(arg_11_1 - var_11_0, 0)
	local var_11_2 = math.floor(var_11_1 / 86400)

	if var_11_2 > 0 then
		return i18n("limit_skin_time_day", var_11_2)
	else
		local var_11_3 = math.floor(var_11_1 / 3600)

		if var_11_3 > 0 then
			local var_11_4 = math.floor(var_11_1 / 60)

			return i18n("limit_skin_time_day_min", var_11_3, var_11_4 - var_11_3 * 60)
		else
			local var_11_5 = math.floor(var_11_1 / 60)

			if var_11_5 > 0 then
				return i18n("limit_skin_time_min", var_11_5)
			else
				return i18n("limit_skin_time_overtime")
			end
		end
	end
end

function var_0_0.ActiveScenarioLayer(arg_12_0, arg_12_1)
	setActive(arg_12_0._tf:Find("left_mask"), not arg_12_1)
	setActive(arg_12_0._tf:Find("adapt/tabs"), not arg_12_1)
	setActive(arg_12_0._tf:Find("adapt/decorate"), not arg_12_1)
	setActive(arg_12_0._tf:Find("adapt/btn_skin"), not arg_12_1)

	arg_12_0.contextData.activeScenario = arg_12_1
end

function var_0_0.willExit(arg_13_0)
	var_0_0.super.willExit(arg_13_0)

	if arg_13_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_13_0.camEventId)

		arg_13_0.camEventId = nil
	end

	for iter_13_0, iter_13_1 in pairs(arg_13_0.pageDic) do
		if iter_13_1.loader then
			iter_13_1.loader:Clear()
		end
	end
end

return var_0_0
