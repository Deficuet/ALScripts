local var_0_0 = class("TwoPointFiveCoreActivityUI", import("view.activity.CorePage.CoreActivityMainScene"))

var_0_0.TIME_RES_BG = "time_bg"

function var_0_0.getUIName(arg_1_0)
	return "TwoPointFiveCoreActivityUI"
end

var_0_0.optionsPath = {
	"adapt/TopPage/top/btn_home"
}

function var_0_0.init(arg_2_0, ...)
	var_0_0.super.init(arg_2_0, ...)

	arg_2_0.topPage = arg_2_0._tf:Find("adapt/TopPage")
	arg_2_0.btnBack = arg_2_0.topPage:Find("top/btn_back")
	arg_2_0.resTime = arg_2_0._tf:Find("adapt/TopPage/top/resTime/Text")
	arg_2_0.resTimebg = arg_2_0._tf:Find("adapt/TopPage/top/resTime")

	setActive(arg_2_0.upper, true)
	onButton(arg_2_0, arg_2_0._tf:Find("adapt/shop_btn"), function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SKINSHOP)
	end, SFX_PANEL)
	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text"), i18n("HelenaCoreActivity_title"))
	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text/Text_1"), i18n("HelenaCoreActivity_title2"))

	local var_2_0

	arg_2_0.tabsList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = underscore.detect(arg_2_0.activities, function(arg_5_0)
				return tostring(arg_5_0:getConfig("is_show")) == arg_4_2.name
			end)

			if not var_4_0 or var_4_0:isEnd() then
				setActive(arg_4_2, false)
			elseif not arg_2_0.pageDic[var_4_0.id] then
				warning(string.format("without page in act:", var_4_0.id))
			else
				arg_2_0:OnToggleName(arg_4_2, var_4_0)

				if arg_2_0.pageDic[var_4_0.id] ~= nil then
					setActive(arg_4_2:Find("tip"), var_4_0:readyToAchieve())
					arg_2_0:UpdateTabTipPosition(arg_4_2, GetComponent(arg_4_2, typeof(Toggle)).isOn)
					onToggle(arg_2_0, arg_4_2, function(arg_6_0)
						if arg_6_0 then
							if var_2_0 ~= var_4_0.id then
								arg_2_0:refreshTime(var_4_0)
								arg_2_0:selectActivity(var_4_0)
							end

							var_2_0 = var_4_0.id
						end

						setActive(arg_4_2:Find("off"), not arg_6_0)
						setActive(arg_4_2:Find("on"), arg_6_0)
						arg_2_0:UpdateTabTipPosition(arg_4_2, arg_6_0)
						arg_2_0:ScheduleTabTipPositions()
					end, SFX_PANEL)
					arg_2_0:ScheduleTabTipPositions()
				end
			end
		end
	end)
end

function var_0_0.ScheduleTabTipPositions(arg_7_0)
	if arg_7_0.tabTipPositionsPending then
		return
	end

	arg_7_0.tabTipPositionsPending = true

	onNextTick(function()
		arg_7_0.tabTipPositionsPending = false

		if arg_7_0.exited or IsNil(arg_7_0.tabs) then
			return
		end

		Canvas.ForceUpdateCanvases()

		for iter_8_0 = 0, arg_7_0.tabs.childCount - 1 do
			local var_8_0 = arg_7_0.tabs:GetChild(iter_8_0)

			if var_8_0.gameObject.activeSelf then
				arg_7_0:UpdateTabTipPosition(var_8_0, GetComponent(var_8_0, typeof(Toggle)).isOn)
			end
		end
	end)
end

function var_0_0.UpdateTabTipPosition(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_1:Find(arg_9_2 and "on" or "off"):Find("imgName")
	local var_9_1 = arg_9_1:Find("tip")
	local var_9_2 = var_9_1.parent:InverseTransformPoint(var_9_0:TransformPoint(Vector3(var_9_0.rect.xMax, var_9_0.rect.yMax, 0)))

	setLocalPosition(var_9_1, {
		x = var_9_2.x,
		y = var_9_2.y
	})
end

function var_0_0.IsImageTgName(arg_10_0)
	return true
end

function var_0_0.ActiveScenarioLayer(arg_11_0, arg_11_1)
	arg_11_0.contextData.activeScenario = arg_11_1
end

function var_0_0.refreshTime(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime()
	local var_12_1 = string.lower(arg_12_1:getConfig("page_info").class_name)

	setText(arg_12_0.resTime, i18n("nier_core_countdown", math.floor(var_12_0 / 86400), math.floor(var_12_0 % 86400 / 3600)))
	GetImageSpriteFromAtlasAsync("ui/" .. var_12_1 .. "_atlas", var_0_0.TIME_RES_BG, arg_12_0.resTimebg)
end

return var_0_0
