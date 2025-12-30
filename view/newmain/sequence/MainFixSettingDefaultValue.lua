local var_0_0 = class("MainFixSettingDefaultValue")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.isExecute = false
end

function var_0_0.Execute(arg_2_0, arg_2_1)
	if arg_2_0.isExecute then
		arg_2_1()

		return
	end

	arg_2_0.isExecute = true

	local var_2_0 = pg.settings_other_template

	for iter_2_0, iter_2_1 in ipairs(var_2_0.all) do
		local var_2_1 = _G[var_2_0[iter_2_1].name]
		local var_2_2 = var_2_0[iter_2_1].default

		if not noEmptyStr(var_2_1) then
			print("settings_other_template without register this key:", var_2_0[iter_2_1].name)
		elseif not PlayerPrefs.HasKey(var_2_1) then
			PlayerPrefs.SetInt(var_2_1, var_2_2)
		end
	end

	arg_2_0:FixMainSceneSettings()
	PlayerPrefs.Save()
	arg_2_0:FixPlayerPrefsKey()
	arg_2_1()
end

function var_0_0.FixMainSceneSettings(arg_3_0)
	local var_3_0 = {
		SettingsMainScenePanel.STANDBY_MODE_KEY,
		SettingsMainScenePanel.FLAGSHIP_INTERACTION_KEY
	}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_1 = iter_3_1 .. "_" .. getProxy(PlayerProxy):getRawData().id

		if not PlayerPrefs.HasKey(var_3_1) then
			PlayerPrefs.SetInt(var_3_1, 1)
		end
	end
end

function var_0_0.FixPlayerPrefsKey(arg_4_0)
	local var_4_0 = getProxy(PlayerProxy):getRawData()

	USAGE_NEW_MAINUI = "USAGE_NEW_MAINUI" .. var_4_0.id

	if not PlayerPrefs.HasKey(USAGE_NEW_MAINUI) then
		PlayerPrefs.GetInt(USAGE_NEW_MAINUI, 2)
		PlayerPrefs.Save()
	end

	local var_4_1 = PlayerPrefs.GetInt(USAGE_NEW_MAINUI, 1)

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildNewMainUI({
		isLogin = 1,
		isNewMainUI = var_4_1
	}))
end

function var_0_0.Dispose(arg_5_0)
	arg_5_0.isExecute = false
end

return var_0_0
