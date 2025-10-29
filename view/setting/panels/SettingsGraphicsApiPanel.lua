local var_0_0 = class("SettingsFpsPanle", import(".SettingsBasePanel"))

function var_0_0.GetUIName(arg_1_0)
	return "SettingsFPS"
end

function var_0_0.GetTitle(arg_2_0)
	return "グラフィックスAPI設定"
end

function var_0_0.GetTitleEn(arg_3_0)
	return ""
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.glesToggle = arg_4_0._tf:Find("options/30fps")
	arg_4_0.vulkanToggle = arg_4_0._tf:Find("options/60fps")

	setText(arg_4_0.glesToggle:Find("Text"), "OpenGLES3")
	setText(arg_4_0.vulkanToggle:Find("Text"), "Vulkan")
	onToggle(arg_4_0, arg_4_0.glesToggle, function(arg_5_0)
		if arg_5_0 then
			if not GraphApiHelper.IsUsingVulkan() then
				return
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = "グラフィックスAPIをOpenGLES3に切り替えると、アプリが一度終了します。グラフィックスAPIを切り替えますか？",
				onYes = function()
					GraphApiHelper.SetForceGraphApi(GraphApiHelper.Api.Force_OpenGLES)
					Application.Quit()
				end
			})
		end
	end, SFX_UI_TAG, SFX_UI_TAG)
	onToggle(arg_4_0, arg_4_0.vulkanToggle, function(arg_7_0)
		if arg_7_0 then
			if GraphApiHelper.IsUsingVulkan() then
				return
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = "グラフィックスAPIをVulkanに切り替えると、アプリが一度終了します。グラフィックスAPIを切り替えますか？",
				onYes = function()
					GraphApiHelper.SetForceGraphApi(GraphApiHelper.Api.Force_Vulkan)
					Application.Quit()
				end
			})
		end
	end, SFX_UI_TAG, SFX_UI_TAG)
end

function var_0_0.OnUpdate(arg_9_0)
	if GraphApiHelper.IsUsingVulkan() then
		triggerToggle(arg_9_0.vulkanToggle, true)
		triggerToggle(arg_9_0.glesToggle, false)
	else
		triggerToggle(arg_9_0.vulkanToggle, false)
		triggerToggle(arg_9_0.glesToggle, true)
	end
end

return var_0_0
