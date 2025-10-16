local var_0_0 = class("SecretsAbyssCoreActivityUI", import("view.activity.CorePage.CoreActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return "SecretsAbyssCoreActivityUI"
end

var_0_0.optionsPath = {
	"adapt/TopPage/top/btn_home"
}

function var_0_0.init(arg_2_0, ...)
	var_0_0.super.init(arg_2_0, ...)
	quickPlayAnimation(arg_2_0._tf:Find("adapt/TopPage/top"), "Anim_SecretsAbyssCoreActivityUI_top_In")
	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text"), i18n("masaina_main_title"))
	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text/Text_1"), i18n("masaina_main_title_en"))

	local var_2_0

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
				setText(arg_3_2:Find("off/name"), i18n("masaina_main_sheet" .. var_3_0:getConfig("is_show")))
				setText(arg_3_2:Find("on/name"), i18n("masaina_main_sheet" .. var_3_0:getConfig("is_show")))

				if arg_2_0.pageDic[var_3_0.id] ~= nil then
					setActive(arg_3_2:Find("tip"), var_3_0:readyToAchieve())
					onToggle(arg_2_0, arg_3_2, function(arg_5_0)
						if arg_5_0 then
							arg_2_0:selectActivity(var_3_0)

							if var_2_0 ~= var_3_0.id then
								quickPlayAnimation(arg_3_2, "Anim_SecretsAbyssCoreActivityUI_tabs_on_In")
							end

							var_2_0 = var_3_0.id
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
	onButton(arg_2_0, arg_2_0._tf:Find("adapt/TopPage/top/btn_back"), function()
		arg_2_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)
end

function var_0_0.UpdateAdapt(arg_8_0)
	local var_8_0 = 1.3333333333333333
	local var_8_1 = 2.1666666666666665
	local var_8_2 = pg.CameraFixMgr.GetInstance()
	local var_8_3 = var_8_2.currentWidth / var_8_2.currentHeight
	local var_8_4 = math.clamp(var_8_3, var_8_0, var_8_1)

	arg_8_0._tf:GetComponent(typeof(AspectRatioFitter)).aspectRatio = var_8_4

	setSizeDelta(arg_8_0._tf:Find("adapt"), {
		x = 0,
		y = 0
	})

	local var_8_5 = NotchAdapt.CheckNotchRatio == math.clamp(NotchAdapt.CheckNotchRatio, var_8_0, var_8_1)

	SetComponentEnabled(arg_8_0._tf:Find("adapt"), "NotchAdapt", var_8_5)
end

function var_0_0.willExit(arg_9_0)
	var_0_0.super.willExit(arg_9_0)

	if arg_9_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_9_0.camEventId)

		arg_9_0.camEventId = nil
	end
end

return var_0_0
