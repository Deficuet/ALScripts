local var_0_0 = class("SettingsOtherPage", import(".SettingsOptionPage"))

function var_0_0.OnClearExchangeCode(arg_1_0)
	local var_1_0 = arg_1_0:GetPanel(SettingsRedeemPanel)

	if var_1_0 then
		var_1_0:ClearExchangeCode()
	end
end

function var_0_0.OnSecondPwdStateChange(arg_2_0)
	local var_2_0 = arg_2_0:GetPanel(SettingsSecondPwLimitedOpPanle)

	if var_2_0 then
		var_2_0:UpdateBtnsState()
	end
end

function var_0_0.GetPanels(arg_3_0)
	local var_3_0 = {
		SettingsSecondPasswordPanle,
		SettingsSecondPwLimitedOpPanle
	}

	if arg_3_0:NeedRedeem() then
		table.insert(var_3_0, 1, SettingsRedeemPanel)
	end

	if PLATFORM_CODE == PLATFORM_JP then
		table.insert(var_3_0, 1, SettingsAccountJPPanle)
	end

	if PLATFORM_CODE == PLATFORM_US then
		table.insert(var_3_0, 1, SettingsAccountUSPanle)
	end

	if PLATFORM_CODE == PLATFORM_CHT then
		table.insert(var_3_0, 1, SettingsAccountTwPanle)

		if CSharpVersion >= 50 then
			table.insert(var_3_0, SettingsAccountCHTPanle)
		end

		table.insert(var_3_0, SettingsAgreementCHTPanle)
	end

	if PLATFORM_CODE == PLATFORM_CH then
		table.insert(var_3_0, SettingsAgreementPanle)

		local var_3_1 = LuaHelper.GetCHPackageType()

		if var_3_1 == 1 and CSharpVersion >= 50 and not LOCK_SDK_SERVIVE then
			table.insert(var_3_0, SettingsServicePanle)
		end

		if var_3_1 == 1 or var_3_1 == 3 and pg.SdkMgr.GetInstance():IsHuaweiPackage() then
			table.insert(var_3_0, SettingsAccountCHPanle)
		end

		if var_3_1 == 1 and OPEN_EXCEPTION_TEST then
			table.insert(var_3_0, SettingsTestUploadExceptionPanle)
		end
	end

	return var_3_0
end

function var_0_0.NeedRedeem(arg_4_0)
	if PLATFORM == PLATFORM_IPHONEPLAYER then
		return SettingsProxy.IsExchangeCodeActive()
	else
		return true
	end
end

function var_0_0.OnInitPanle(arg_5_0)
	if PlayerPrefs.GetInt("firstIntoOtherPanel", 0) == 0 then
		local var_5_0 = arg_5_0:GetPanel(SettingsSecondPasswordPanle)

		arg_5_0:ScrollToPanel(var_5_0)
		PlayerPrefs.DeleteKey("firstIntoOtherPanel")
		PlayerPrefs.SetInt("firstIntoOtherPanel", 1)
		PlayerPrefs.Save()
		pg.EasyRedDotMgr.GetInstance():TriggerMarks("SETTING")
	end
end

return var_0_0
