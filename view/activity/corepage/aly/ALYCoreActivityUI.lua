local var_0_0 = class("ALYCoreActivityUI", import("view.activity.CorePage.CoreActivityMainScene"))
local var_0_1 = 50055

function var_0_0.getUIName(arg_1_0)
	return "ALYCoreActivityUI"
end

local var_0_2 = 0

function var_0_0.init(arg_2_0, ...)
	var_0_0.super.init(arg_2_0, ...)

	local var_2_0, var_2_1 = pg.TimeMgr.GetInstance():inTime(pg.activity_template[var_0_1].time)
	local var_2_2

	if var_2_1 then
		local var_2_3 = pg.TimeMgr.GetInstance():Table2ServerTime(var_2_1)

		var_2_2 = var_0_0:skinCommdityTimeStamps(var_2_3)
	end

	setText(arg_2_0._tf:Find("adapt/top/btn_home/text_tip/Text (Legacy)"), i18n("yumia_main_tip_4", var_2_2))
	arg_2_0:Reset()
	arg_2_0.tabsList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = underscore.detect(arg_2_0.activities, function(arg_4_0)
				return tostring(arg_4_0:getConfig("is_show")) == arg_3_2.name
			end)

			if not var_3_0 then
				setActive(arg_3_2, false)
			elseif not arg_2_0.pageDic[var_3_0.id] then
				warning(string.format("without page in act:", var_3_0.id))
			else
				local var_3_1 = arg_2_0.pageDic[var_3_0.id]

				if var_3_0.id == 50063 or var_3_0.id == 50058 then
					local var_3_2 = arg_2_0:findTF("tip", arg_3_2)

					setActive(var_3_2, var_3_0:readyToAchieve())
				else
					setActive(arg_2_0:findTF("tip", arg_3_2), false)
				end

				onToggle(arg_2_0, arg_3_2, function(arg_5_0)
					if arg_5_0 then
						if arg_3_1 + 1 == 3 then
							setActive(arg_2_0._tf:Find("Image/VX"), false)
						else
							setActive(arg_2_0._tf:Find("Image/VX"), true)
						end

						arg_2_0:selectActivity(var_3_0)
						quickPlayAnimation(arg_2_0:findTF("on", arg_3_2), "Anim_ALYCoreActivityUI_tabs_selected")
					end
				end, SFX_PANEL)
			end
		end
	end)

	arg_2_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_6_0, arg_6_1)
		arg_2_0:UpdateAdapt()
	end)

	arg_2_0:UpdateAdapt()

	arg_2_0.anim_1 = arg_2_0._tf:Find("adapt/tabs/1/off"):GetComponent(typeof(Animation))
	arg_2_0.anim_2 = arg_2_0._tf:Find("adapt/tabs/2/off"):GetComponent(typeof(Animation))
	arg_2_0.anim_3 = arg_2_0._tf:Find("adapt/tabs/3/off"):GetComponent(typeof(Animation))
	arg_2_0.anim_4 = arg_2_0._tf:Find("adapt/tabs/4/off"):GetComponent(typeof(Animation))
	arg_2_0.anim_5 = arg_2_0._tf:Find("adapt/tabs/5/off"):GetComponent(typeof(Animation))
	arg_2_0.anim_tf_Event = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.anim_tf_Event:SetStartEvent(function()
		setCanvasGroupAlpha(arg_2_0._tf:Find("adapt/tabs/1"), 1)

		for iter_7_0 = 4, 5 do
			onDelayTick(function()
				if iter_7_0 == 4 then
					setCanvasGroupAlpha(arg_2_0._tf:Find("adapt/tabs/3"), 1)
					setCanvasGroupAlpha(arg_2_0._tf:Find("adapt/tabs/4"), 1)
				elseif iter_7_0 == 5 then
					setCanvasGroupAlpha(arg_2_0._tf:Find("adapt/tabs/2"), 1)
					setCanvasGroupAlpha(arg_2_0._tf:Find("adapt/tabs/5"), 1)
				end
			end, 0.08 * (iter_7_0 - 3))
		end
	end)

	arg_2_0.anim_1_Event = arg_2_0._tf:Find("adapt/tabs/1/off"):GetComponent(typeof(DftAniEvent))

	arg_2_0.anim_1_Event:SetStartEvent(function()
		setCanvasGroupAlpha(arg_2_0._tf:Find("adapt/tabs/3"), 1)
		setCanvasGroupAlpha(arg_2_0._tf:Find("adapt/tabs/4"), 1)
	end)
end

function var_0_0.didEnter(arg_10_0)
	var_0_0.super.didEnter(arg_10_0)
end

function var_0_0.UpdateAdapt(arg_11_0)
	local var_11_0 = 1.3333333333333333
	local var_11_1 = 2.1666666666666665
	local var_11_2 = pg.CameraFixMgr.GetInstance()
	local var_11_3 = var_11_2.currentWidth / var_11_2.currentHeight
	local var_11_4 = math.clamp(var_11_3, var_11_0, var_11_1)

	arg_11_0._tf:GetComponent(typeof(AspectRatioFitter)).aspectRatio = var_11_4

	setSizeDelta(arg_11_0._tf:Find("adapt"), {
		x = 0,
		y = 0
	})

	local var_11_5 = NotchAdapt.CheckNotchRatio == math.clamp(NotchAdapt.CheckNotchRatio, var_11_0, var_11_1)

	SetComponentEnabled(arg_11_0._tf:Find("adapt"), "NotchAdapt", var_11_5)
end

function var_0_0.updateActivity(arg_12_0, arg_12_1)
	if ActivityConst.PageIdLink[arg_12_1.id] then
		arg_12_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.PageIdLink[arg_12_1.id])
	end

	if arg_12_1:isShow() and arg_12_1:isCorePage(arg_12_0.contextData.coreName) and not arg_12_1:isEnd() then
		arg_12_0.activities[arg_12_0:getActivityIndex(arg_12_1.id) or #arg_12_0.activities + 1] = arg_12_1

		table.sort(arg_12_0.activities, CompareFuncs({
			function(arg_13_0)
				return -arg_13_0:getShowPriority()
			end,
			function(arg_14_0)
				return -arg_14_0.id
			end
		}))

		if not arg_12_0.pageDic[arg_12_1.id] then
			arg_12_0:instanceActivityPage(arg_12_1)
		end

		arg_12_0:flushTabs()

		if arg_12_0.activity and arg_12_0.activity.id == arg_12_1.id then
			arg_12_0.activity = arg_12_1

			arg_12_0:verifyTabs(arg_12_1.id)
		end
	end
end

function var_0_0.Reset(arg_15_0)
	for iter_15_0 = 1, 5 do
		setText(arg_15_0._tf:Find("adapt/tabs/" .. iter_15_0 .. "/off/Label/name_bg/name"), i18n("yumia_main_tip_" .. iter_15_0 + 4))
		setText(arg_15_0._tf:Find("adapt/tabs/" .. iter_15_0 .. "/on/Label/name_bg/name"), i18n("yumia_main_tip_" .. iter_15_0 + 4))
	end
end

function var_0_0.skinCommdityTimeStamps(arg_16_0, arg_16_1)
	local var_16_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_16_1 = math.max(arg_16_1 - var_16_0, 0)
	local var_16_2 = math.floor(var_16_1 / 86400)

	if var_16_2 > 0 then
		return var_16_2
	elseif var_16_2 <= 0 then
		return 0
	end
end

function var_0_0.willExit(arg_17_0)
	var_0_0.super.willExit(arg_17_0)

	if arg_17_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_17_0.camEventId)

		arg_17_0.camEventId = nil
	end
end

return var_0_0
