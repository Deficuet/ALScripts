local var_0_0 = class("MainMaliVulkanWarningSequence")

local function var_0_1()
	local var_1_0 = SystemInfo.graphicsDeviceName or ""

	return string.find(string.lower(var_1_0), "mali", 1, true) ~= nil
end

function var_0_0.Execute(arg_2_0, arg_2_1)
	if not var_0_1() or GraphApiHelper.IsUsingVulkan() then
		arg_2_1()

		return
	end

	local var_2_0 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d", true)

	if PlayerPrefs.GetString(VULKAN_WARNING_TIP_WINDOW, "") == var_2_0 then
		arg_2_1()

		return
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideClose = true,
		showStopRemind = true,
		type = MSGBOX_TYPE_NORMAL,
		title = pg.MsgboxMgr.TITLE_INFORMATION,
		content = i18n("openGLerror_warning"),
		yesText = i18n("island_word_go"),
		noText = i18n("word_cancel"),
		onYes = function()
			local var_3_0 = pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn

			if dayRemindFlag then
				PlayerPrefs.SetString(VULKAN_WARNING_TIP_WINDOW, var_2_0)
			end

			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SETTINGS, {
				extraOffset = 2000,
				page = NewSettingsScene.PAGE_OPTION,
				scroll = SettingsOtherPanel
			})
		end,
		onNo = function()
			local var_4_0 = pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn

			if dayRemindFlag then
				PlayerPrefs.SetString(VULKAN_WARNING_TIP_WINDOW, var_2_0)
			end

			arg_2_1()
		end
	})
end

return var_0_0
