local var_0_0 = class("SettingsPaintingDownloadPanel", import(".SettingsBasePanel"))

function var_0_0.GetUIName(arg_1_0)
	return "SettingsPaintingDownload"
end

function var_0_0.GetTitle(arg_2_0)
	return i18n("painting_prefs_setting_label")
end

function var_0_0.GetTitleEn(arg_3_0)
	return "  / Painting Download"
end

var_0_0.None = 0
var_0_0.Min = 1
var_0_0.Max = 2

function var_0_0.OnInit(arg_4_0)
	local var_4_0 = {
		arg_4_0._tf:Find("prefs/1"),
		arg_4_0._tf:Find("prefs/2")
	}

	arg_4_0.btns = {}

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local function var_4_1(arg_5_0)
			if arg_5_0 then
				local var_5_0 = getProxy(SettingsProxy):GetPaintingDownloadPrefs()

				if iter_4_0 == var_5_0 then
					return
				else
					getProxy(SettingsProxy):SetPaintingDownloadPrefs(iter_4_0)
					pg.TipsMgr.GetInstance():ShowTips(i18n("painting_prefs_switch_succ"))
				end
			end
		end

		onToggle(arg_4_0, iter_4_1, var_4_1, SFX_PANEL)
		setText(iter_4_1:Find("Text"), i18n("painting_prefs_setting_" .. iter_4_0))

		arg_4_0.btns[iter_4_0] = iter_4_1
	end
end

function var_0_0.OnUpdate(arg_6_0)
	local var_6_0 = getProxy(SettingsProxy):GetPaintingDownloadPrefs()

	if IsUnityEditor and var_6_0 == var_0_0.None then
		var_6_0 = var_0_0.Max

		return
	end

	triggerToggle(arg_6_0.btns[var_6_0], true)
end

return var_0_0
