local var_0_0 = class("SettingsDebugPanel", import(".SettingsBasePanel"))

function var_0_0.GetUIName(arg_1_0)
	return "SettingsOther"
end

function var_0_0.GetTitle(arg_2_0)
	return "测试面板"
end

function var_0_0.GetTitleEn(arg_3_0)
	return ""
end

function var_0_0.OnInit(arg_4_0)
	local var_4_0 = arg_4_0._tf:Find("options/notify_tpl")

	setActive(var_4_0, false)

	arg_4_0.container = arg_4_0._tf:Find("options")
	arg_4_0.toggleTpl = cloneTplTo(var_4_0, arg_4_0._tf, "toggleTpl")
	arg_4_0.btnTpl = cloneTplTo(var_4_0, arg_4_0._tf, "btnTpl")

	GameObject.Destroy(findGO(arg_4_0.btnTpl, "off"))
	GameObject.Destroy(findGO(arg_4_0.btnTpl, "on"))
	RemoveComponent(arg_4_0.btnTpl, "ToggleGroup")
	removeAllChildren(arg_4_0.container)
	arg_4_0:btn_brightness_permission()
	arg_4_0:btn_brightness_setvalue()
	arg_4_0:btn_alarm_permission()
	arg_4_0:btn_notification_permission()
	arg_4_0:toggle_notification_tag()
	arg_4_0:btn_push_10s()
	arg_4_0:btn_cancel_notification()
	arg_4_0:btn_save_photo()
	arg_4_0:btn_record_start()
	arg_4_0:btn_record_stop()
	arg_4_0:btn_vulkan()
	arg_4_0:btn_gles()
	arg_4_0:btn_show_api()
end

function var_0_0.createBtn(arg_5_0, arg_5_1)
	local var_5_0 = cloneTplTo(arg_5_0.btnTpl, arg_5_0.container, arg_5_1.go)
	local var_5_1 = var_5_0:Find("mask/Text")

	setText(var_5_1, arg_5_1.text)
	onButton(arg_5_0, var_5_0, arg_5_1.func, SFX_PANEL)
end

function var_0_0.createToggle(arg_6_0, arg_6_1)
	local var_6_0 = cloneTplTo(arg_6_0.toggleTpl, arg_6_0.container, arg_6_1.go)
	local var_6_1 = var_6_0:Find("mask/Text")
	local var_6_2 = var_6_0:Find("on")

	setText(var_6_1, arg_6_1.text)
	onToggle(arg_6_0, var_6_2, arg_6_1.func, SFX_UI_TAG, SFX_UI_CANCEL)
end

function var_0_0.btn_brightness_permission(arg_7_0)
	local var_7_0 = {
		go = "btn_brightness_permission",
		text = "检查亮度权限",
		func = function()
			if YSNormalTool.BrightnessTool.CanWriteSetting() then
				pg.TipsMgr.GetInstance():ShowTips("拥有权限")
			else
				YSNormalTool.OtherTool.OpenAndroidWriteSettings()
			end
		end
	}

	arg_7_0:createBtn(var_7_0)
end

function var_0_0.btn_brightness_setvalue(arg_9_0)
	local var_9_0 = "循环设置亮度，当前亮度："
	local var_9_1 = {
		go = "btn_brightness_setvalue",
		text = var_9_0 .. YSNormalTool.BrightnessTool.GetBrightnessValue()
	}

	local function var_9_2()
		local var_10_0 = arg_9_0.container:Find(var_9_1.go .. "/mask/Text")

		setText(var_10_0, var_9_0 .. YSNormalTool.BrightnessTool.GetBrightnessValue())
	end

	function var_9_1.func()
		local var_11_0 = YSNormalTool.BrightnessTool.GetBrightnessValue() + 0.1

		if var_11_0 > 1 then
			var_11_0 = var_11_0 - 1
		end

		YSNormalTool.BrightnessTool.SetBrightnessValue(var_11_0)
		var_9_2()
	end

	arg_9_0:createBtn(var_9_1)
end

function var_0_0.btn_alarm_permission(arg_12_0)
	local var_12_0 = {
		go = "btn_alarm_permission",
		text = "检查安卓闹钟权限",
		func = function()
			if YSNormalTool.NotificationTool.CanScheduleExactAlarms() then
				pg.TipsMgr.GetInstance():ShowTips("拥有权限")
			else
				YSNormalTool.NotificationTool.RequestScheduleExactAlarmsPermission()
			end
		end
	}

	if PermissionHelper.IsAndroid() then
		arg_12_0:createBtn(var_12_0)
	end
end

function var_0_0.btn_notification_permission(arg_14_0)
	local var_14_0 = {
		go = "btn_notification_permission",
		text = "检查通知权限",
		func = function()
			local var_15_0 = {
				YSNormalTool.PermissionTool.Notification
			}

			YSNormalTool.PermissionTool.RequestMultiPermission(var_15_0, function(arg_16_0, arg_16_1)
				local var_16_0 = true
				local var_16_1 = arg_16_1.Length

				for iter_16_0 = 0, var_16_1 - 1 do
					if arg_16_1[iter_16_0] ~= 0 then
						var_16_0 = false

						break
					end
				end

				if var_16_0 then
					pg.TipsMgr.GetInstance():ShowTips("授权成功")
				else
					pg.TipsMgr.GetInstance():ShowTips("授权失败")
				end
			end)
		end
	}

	arg_14_0:createBtn(var_14_0)
end

function var_0_0.toggle_notification_tag(arg_17_0)
	local var_17_0 = {
		go = "btn_push_10s",
		text = "开启则可切到后台测试通知，测完需要关闭",
		func = function(arg_18_0)
			if arg_18_0 then
				PUSH_NOTIFICATION_TEST_TAG = true
			else
				PUSH_NOTIFICATION_TEST_TAG = false
			end
		end
	}

	arg_17_0:createToggle(var_17_0)
end

function var_0_0.btn_push_10s(arg_19_0)
	local var_19_0 = {
		go = "btn_push_10s",
		text = "10秒后推送通知",
		func = function()
			pg.TipsMgr.GetInstance():ShowTips("推送测试通知")

			local var_20_0 = pg.TimeMgr.GetInstance():STimeDescS(pg.TimeMgr.GetInstance():GetServerTime(), "*t")
			local var_20_1 = var_20_0.year .. var_20_0.month .. var_20_0.day .. var_20_0.hour .. var_20_0.min .. var_20_0.sec
			local var_20_2 = pg.TimeMgr.GetInstance():GetServerTime() + 10

			pg.PushNotificationMgr.GetInstance():Push("测试标题", var_20_1, var_20_2)
			pg.PushNotificationMgr.GetInstance():PushCache()
		end
	}

	arg_19_0:createBtn(var_19_0)
end

function var_0_0.btn_cancel_notification(arg_21_0)
	local var_21_0 = {
		go = "btn_cancel_notification",
		text = "取消所有通知",
		func = function()
			YSNormalTool.NotificationTool.CancelAllNotification()
		end
	}

	arg_21_0:createBtn(var_21_0)
end

function var_0_0.btn_save_photo(arg_23_0)
	local var_23_0 = {
		go = "btn_save_photo",
		text = "保存截图",
		func = function()
			local var_24_0 = YSTool.YSScreenShoter.TakeScreenShotDirectly()

			YSNormalTool.MediaTool.SaveImageWithBytes(var_24_0, function(arg_25_0, arg_25_1)
				if arg_25_0 then
					pg.TipsMgr.GetInstance():ShowTips("保存截图成功")
				else
					pg.TipsMgr.GetInstance():ShowTips("保存截图失败：" .. arg_25_1)
				end
			end)
		end
	}

	arg_23_0:createBtn(var_23_0)
end

function var_0_0.btn_record_start(arg_26_0)
	local var_26_0 = {
		go = "btn_record_start",
		text = "开始录屏"
	}

	local function var_26_1(arg_27_0)
		if not arg_27_0 then
			pg.TipsMgr.GetInstance():ShowTips("开始录屏失败")
		else
			pg.TipsMgr.GetInstance():ShowTips("开始录屏成功")
		end
	end

	function var_26_0.func()
		PermissionHelper.RequestCamera(function()
			arg_26_0.recordFilePath = YSNormalTool.RecordTool.GenRecordFilePath()

			YSNormalTool.RecordTool.StartRecording(var_26_1, arg_26_0.recordFilePath)
		end, function()
			pg.TipsMgr.GetInstance():ShowTips("请求录屏所需权限失败")
		end)
	end

	arg_26_0:createBtn(var_26_0)
end

function var_0_0.btn_record_stop(arg_31_0)
	local var_31_0 = {
		go = "btn_record_stop",
		text = "结束录屏"
	}

	local function var_31_1(arg_32_0)
		if arg_32_0 and PLATFORM == PLATFORM_ANDROID then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("word_save_video"),
				onNo = function()
					if System.IO.File.Exists(arg_31_0.recordFilePath) then
						System.IO.File.Delete(arg_31_0.recordFilePath)
					end
				end,
				onYes = function()
					YSNormalTool.MediaTool.SaveVideoToAlbum(arg_31_0.recordFilePath, function(arg_35_0, arg_35_1)
						if arg_35_0 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("word_save_ok"))

							if System.IO.File.Exists(arg_31_0.recordFilePath) then
								System.IO.File.Delete(arg_31_0.recordFilePath)
							end
						end
					end)
				end
			})
		end
	end

	function var_31_0.func()
		YSNormalTool.RecordTool.StopRecording(var_31_1)
	end

	arg_31_0:createBtn(var_31_0)
end

function var_0_0.btn_vulkan(arg_37_0)
	local var_37_0 = GraphApiHelper.GetGraphApiSaveValue()
	local var_37_1 = ""

	if var_37_0 == 0 then
		var_37_1 = " 当前未设置，Unity自己选择。"
	elseif var_37_0 == 1 then
		var_37_1 = " 当前强制设置Vulkan。"
	elseif var_37_0 == 2 then
		var_37_1 = " 当前强制设置GLES。"
	end

	local var_37_2 = {
		go = "btn_vulkan",
		text = "设置为Vulkan(需要重启)" .. var_37_1,
		func = function()
			GraphApiHelper.SetForceGraphApi(GraphApiHelper.Api.Force_Vulkan)
		end
	}

	arg_37_0:createBtn(var_37_2)
end

function var_0_0.btn_gles(arg_39_0)
	local var_39_0 = GraphApiHelper.GetGraphApiSaveValue()
	local var_39_1 = ""

	if var_39_0 == 0 then
		var_39_1 = " 当前未设置，Unity自己选择。"
	elseif var_39_0 == 1 then
		var_39_1 = " 当前强制设置Vulkan。"
	elseif var_39_0 == 2 then
		var_39_1 = " 当前强制设置GLES。"
	end

	local var_39_2 = {
		go = "btn_gles",
		text = "设置为OpenGLES(需要重启)" .. var_39_1,
		func = function()
			GraphApiHelper.SetForceGraphApi(GraphApiHelper.Api.Force_OpenGLES)
		end
	}

	arg_39_0:createBtn(var_39_2)
end

function var_0_0.btn_show_api(arg_41_0)
	local var_41_0 = {
		go = "btn_show_api",
		text = "点击显示当前Api",
		func = function()
			local var_42_0 = GraphApiHelper.GetCurGraphApi()

			pg.TipsMgr.GetInstance():ShowTips("当前Api:" .. var_42_0)
		end
	}

	arg_41_0:createBtn(var_41_0)
end

return var_0_0
