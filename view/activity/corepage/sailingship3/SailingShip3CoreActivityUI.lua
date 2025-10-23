local var_0_0 = class("SailingShip3CoreActivityUI", import("view.activity.CorePage.CoreActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return "SailingShip3CoreActivityUI"
end

function var_0_0.loadingQueue(arg_2_0)
	local var_2_0 = "play_jjufengyuziyouqundao_fullscreen_" .. getProxy(PlayerProxy):getPlayerId()

	if PlayerPrefs.GetInt(var_2_0, 0) == 1 then
		return nil
	else
		return function(arg_3_0)
			pg.SceneAnimMgr.GetInstance():CommonSceneChange("jufengyuziyouqundao_fullscreen", function(arg_4_0)
				return arg_3_0(function()
					PlayerPrefs.SetInt(var_2_0, 1)
					existCall(arg_4_0)
				end)
			end)
		end
	end
end

function var_0_0.init(arg_6_0, ...)
	var_0_0.super.init(arg_6_0, ...)

	local var_6_0

	setText(arg_6_0._tf:Find("adapt/top/btn_back/back"), i18n("word_back"))
	arg_6_0.tabsList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = underscore.detect(arg_6_0.activities, function(arg_8_0)
				return tostring(arg_8_0:getConfig("is_show")) == arg_7_2.name
			end)

			if not var_7_0 or var_7_0:isEnd() then
				setActive(arg_7_2, false)
			elseif not arg_6_0.pageDic[var_7_0.id] then
				warning(string.format("without page in act:", var_7_0.id))
			else
				arg_6_0:ONToggleName(arg_7_2, var_7_0)

				local var_7_1 = arg_6_0.pageDic[var_7_0.id]

				if var_7_1 ~= nil then
					local var_7_2 = arg_7_2:Find("tip")
					local var_7_3 = var_7_1:IsShowReminder()

					if var_7_3 == nil then
						setActive(var_7_2, var_7_0:readyToAchieve())
					else
						setActive(var_7_2, var_7_3)
					end

					onToggle(arg_6_0, arg_7_2, function(arg_9_0)
						if arg_9_0 then
							if var_6_0 ~= var_7_0.id then
								arg_6_0:selectActivity(var_7_0)
								arg_6_0:OnplayAnimation(arg_7_2)
							end

							var_6_0 = var_7_0.id
						end
					end, SFX_PANEL)
				end
			end
		end
	end)

	arg_6_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_10_0, arg_10_1)
		arg_6_0:UpdateAdapt()
	end)

	arg_6_0:UpdateAdapt()
end

function var_0_0.UpdateAdapt(arg_11_0)
	local var_11_0 = 1.3333333333333333
	local var_11_1 = 2.3333333333333335
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

function var_0_0.ONToggleName(arg_12_0, arg_12_1, arg_12_2)
	setText(arg_12_1:Find("off/name"), i18n("fengfanV3_20251023_Sidebar" .. arg_12_2:getConfig("is_show")))
	setText(arg_12_1:Find("on/name"), i18n("fengfanV3_20251023_Sidebar" .. arg_12_2:getConfig("is_show")))
end

function var_0_0.OnplayAnimation(arg_13_0, arg_13_1)
	quickPlayAnimation(arg_13_1, "Anim_SailingShip3SkinActUI_tabs_on_click")
end

function var_0_0.didEnter(arg_14_0)
	var_0_0.super.didEnter(arg_14_0)

	if not arg_14_0.contextData.activeScenario then
		arg_14_0._tf:GetComponent(typeof(Animation)).enabled = true
	end

	onButton(arg_14_0, arg_14_0.btnBack, function()
		local var_15_0 = arg_14_0.pageDic[arg_14_0.activity.id]

		if var_15_0:IsShowingPopWindow() then
			var_15_0:ClosePopWindow()
		else
			arg_14_0:emit(var_0_0.ON_BACK)
		end
	end, SOUND_BACK)
end

function var_0_0.willExit(arg_16_0)
	var_0_0.super.willExit(arg_16_0)

	if arg_16_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_16_0.camEventId)

		arg_16_0.camEventId = nil
	end
end

return var_0_0
