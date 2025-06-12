local var_0_0 = class("ShipProfileLive2dBtn")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._tf = arg_1_1
	arg_1_0.live2dBtn = arg_1_1
	arg_1_0.live2dToggle = arg_1_0.live2dBtn:Find("toggle")
	arg_1_0.live2dState = arg_1_0.live2dBtn:Find("state")
	arg_1_0.live2dOn = arg_1_0.live2dToggle:Find("on")
	arg_1_0.live2dOff = arg_1_0.live2dToggle:Find("off")
	arg_1_0.manager = BundleWizard.Inst:GetGroupMgr("L2D")
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2)
	if Live2dConst.GetLive2DArm32MatchAble() then
		arg_2_2 = false
	end

	arg_2_0.paintingName = arg_2_1
	arg_2_0.isOn = arg_2_2

	local var_2_0 = arg_2_0.manager
	local var_2_1 = "live2d/" .. arg_2_1
	local var_2_2 = HXSet.autoHxShiftPath(var_2_1, nil, true)
	local var_2_3 = var_2_0.state

	if var_2_3 == DownloadState.None or var_2_3 == DownloadState.CheckFailure then
		var_2_0:CheckD()
	end

	local var_2_4 = var_2_0:CheckF(var_2_2)

	if var_2_4 == DownloadState.CheckToUpdate or var_2_4 == DownloadState.UpdateFailure then
		arg_2_0:OnCheckToUpdate(var_2_2)
	elseif var_2_4 == DownloadState.Updating then
		arg_2_0:OnUpdating()
	else
		arg_2_0:OnUpdated(var_2_2, arg_2_2)
	end

	arg_2_0:AddTimer(var_2_2, var_2_4, arg_2_1, arg_2_2)
end

function var_0_0.RemoveTimer(arg_3_0)
	if arg_3_0.live2dTimer then
		arg_3_0.live2dTimer:Stop()

		arg_3_0.live2dTimer = nil
	end
end

function var_0_0.AddTimer(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	arg_4_0:RemoveTimer()

	if arg_4_2 == DownloadState.CheckToUpdate or arg_4_2 == DownloadState.UpdateFailure or arg_4_2 == DownloadState.Updating then
		arg_4_0.live2dTimer = Timer.New(function()
			local var_5_0 = arg_4_0.manager:CheckF(arg_4_1)

			arg_4_0:Update(arg_4_3, var_5_0 == DownloadState.UpdateSuccess and true or arg_4_4)
		end, 0.5, 1)

		arg_4_0.live2dTimer:Start()
	end
end

function var_0_0.OnCheckToUpdate(arg_6_0, arg_6_1)
	setActive(arg_6_0.live2dBtn, true)
	setActive(arg_6_0.live2dState, false)
	setActive(arg_6_0.live2dToggle, true)
	setActive(arg_6_0.live2dOn, false)
	setActive(arg_6_0.live2dOff, true)
	onButton(arg_6_0, arg_6_0.live2dBtn, function()
		VersionMgr.Inst:RequestUIForUpdateF("L2D", arg_6_1, true)
	end, SFX_PANEL)
end

function var_0_0.OnUpdating(arg_8_0)
	setActive(arg_8_0.live2dBtn, true)
	setActive(arg_8_0.live2dToggle, false)
	setActive(arg_8_0.live2dState, true)
	removeOnButton(arg_8_0.live2dBtn)
end

function var_0_0.OnUpdated(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = checkABExist(arg_9_1)

	setActive(arg_9_0.live2dBtn, var_9_0)
	setActive(arg_9_0.live2dState, false)
	setActive(arg_9_0.live2dToggle, true)
	setActive(arg_9_0.live2dOn, arg_9_2)
	setActive(arg_9_0.live2dOff, not arg_9_2)
	onButton(arg_9_0, arg_9_0.live2dBtn, function()
		if Live2dConst.GetLive2DArm32MatchAble() then
			Live2dConst.ShowLive2DArm32Tips()
		end

		arg_9_0:Update(arg_9_0.paintingName, not arg_9_0.isOn)
	end, SFX_PANEL)

	if arg_9_0.callback then
		arg_9_0.callback(arg_9_0.isOn)
	end
end

function var_0_0.Disable(arg_11_0)
	if arg_11_0.isOn then
		triggerButton(arg_11_0.live2dBtn)
	end
end

function var_0_0.SetEnable(arg_12_0, arg_12_1)
	setButtonEnabled(arg_12_0.live2dBtn, arg_12_1)
end

function var_0_0.AddListener(arg_13_0, arg_13_1)
	arg_13_0.callback = arg_13_1
end

function var_0_0.Dispose(arg_14_0)
	arg_14_0.callback = nil

	arg_14_0:RemoveTimer()
	pg.DelegateInfo.Dispose(arg_14_0)
end

return var_0_0
