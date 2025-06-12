local var_0_0 = class("PlayerVitaeLive2dBtn", import(".PlayerVitaeBaseBtn"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:Load(arg_1_0.tf)
	setActive(arg_1_0.tf, true)
end

function var_0_0.InitBtn(arg_2_0)
	return
end

function var_0_0.GetBgName(arg_3_0)
	local var_3_0
	local var_3_1
	local var_3_2 = arg_3_0:IsHrzType() and "share/btn_l2d_atlas" or "admiralui_atlas"

	if arg_3_0.ship and arg_3_0.ship:GetSkinConfig().spine_use_live2d == 1 then
		var_3_1 = arg_3_0:IsHrzType() and "spine_painting_bg" or "sp"
	else
		var_3_1 = arg_3_0:IsHrzType() and "live2d_bg" or "l2d"
	end

	return var_3_2, var_3_1
end

function var_0_0.IsActive(arg_4_0)
	return true
end

function var_0_0.Update(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	var_0_0.super.Update(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_0:NewGo()
	arg_5_0:RequesetLive2dRes()
end

function var_0_0.RequesetLive2dRes(arg_6_0)
	local var_6_0 = arg_6_0.ship
	local var_6_1 = "live2d/" .. string.lower(var_6_0:getPainting())
	local var_6_2 = HXSet.autoHxShiftPath(var_6_1, nil, true)

	arg_6_0:StartCheckUpdate(var_6_2)
end

function var_0_0.StartCheckUpdate(arg_7_0, arg_7_1)
	local var_7_0 = BundleWizard.Inst:GetGroupMgr("L2D")
	local var_7_1 = var_7_0.state

	if var_7_1 == DownloadState.None or var_7_1 == DownloadState.CheckFailure then
		var_7_0:CheckD()
	end

	local var_7_2 = var_7_0:CheckF(arg_7_1)

	if var_7_2 == DownloadState.CheckToUpdate or var_7_2 == DownloadState.UpdateFailure then
		arg_7_0:ShowOrHide(true)
		arg_7_0:UpdateBtnState(false, false)
		onButton(arg_7_0, arg_7_0.tf, function()
			VersionMgr.Inst:RequestUIForUpdateF("L2D", arg_7_1, true)
		end, SFX_PANEL)
	elseif var_7_2 == DownloadState.Updating then
		arg_7_0:ShowOrHide(true)
		arg_7_0:UpdateBtnState(true, false)
		removeOnButton(arg_7_0.tf)
	else
		local var_7_3 = checkABExist(arg_7_1)

		arg_7_0:ShowOrHide(var_7_3)

		if var_7_3 then
			arg_7_0:UpdateBtnState(false, false)
			var_0_0.super.InitBtn(arg_7_0)
		end
	end

	if arg_7_0.live2dTimer then
		arg_7_0.live2dTimer:Stop()

		arg_7_0.live2dTimer = nil
	end

	if var_7_2 == DownloadState.CheckToUpdate or var_7_2 == DownloadState.UpdateFailure or var_7_2 == DownloadState.Updating then
		arg_7_0.live2dTimer = Timer.New(function()
			arg_7_0:StartCheckUpdate(arg_7_1)
		end, 0.5, 1)

		arg_7_0.live2dTimer:Start()
	end
end

function var_0_0.GetDefaultValue(arg_10_0)
	local var_10_0 = getProxy(SettingsProxy):getCharacterSetting(arg_10_0.ship.id, SHIP_FLAG_L2D)

	if Live2dConst.GetLive2DArm32MatchAble() then
		if var_10_0 then
			arg_10_0:OnSwitch(false)
		end

		return false
	end

	return getProxy(SettingsProxy):getCharacterSetting(arg_10_0.ship.id, SHIP_FLAG_L2D)
end

function var_0_0.OnSwitch(arg_11_0, arg_11_1)
	if Live2dConst.GetLive2DArm32MatchAble() and arg_11_1 then
		Live2dConst.ShowLive2DArm32Tips()

		return false
	end

	if ShipSkin.GetChangeSkinData(arg_11_0.ship:getSkinId()) and true or false then
		getProxy(SettingsProxy):setCharacterSetting(arg_11_0.ship.id, SHIP_FLAG_SP, arg_11_1)
	end

	getProxy(SettingsProxy):setCharacterSetting(arg_11_0.ship.id, SHIP_FLAG_L2D, arg_11_1)

	return true
end

function var_0_0.OnDispose(arg_12_0)
	if arg_12_0.live2dTimer then
		arg_12_0.live2dTimer:Stop()

		arg_12_0.live2dTimer = nil
	end
end

function var_0_0.Load(arg_13_0, arg_13_1)
	var_0_0.super.Load(arg_13_0, arg_13_1)

	if arg_13_0:IsHrzType() then
		arg_13_1.gameObject.name = "live2d"
	end

	arg_13_0.tf:GetComponent(typeof(Image)):SetNativeSize()
end

return var_0_0
