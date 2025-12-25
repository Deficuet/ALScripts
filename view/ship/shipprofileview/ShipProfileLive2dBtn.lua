local var_0_0 = class("ShipProfileLive2dBtn")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._tf = arg_1_1
	arg_1_0.live2dBtn = arg_1_1
	arg_1_0.live2dToggle = arg_1_0.live2dBtn:Find("toggle")
	arg_1_0.live2dState = arg_1_0.live2dBtn:Find("state")
	arg_1_0.live2dOn = arg_1_0.live2dToggle:Find("on")
	arg_1_0.live2dOff = arg_1_0.live2dToggle:Find("off")
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2)
	if Live2dConst.GetLive2DArm32MatchAble() then
		arg_2_2 = false
	end

	arg_2_0.paintingName = arg_2_1
	arg_2_0.isOn = arg_2_2

	local var_2_0 = BundleWizard.Inst:GetGroupMgr("L2D")
	local var_2_1 = "live2d/" .. string.lower(arg_2_1)
	local var_2_2 = HXSet.autoHxShiftPath(var_2_1, nil, true)
	local var_2_3 = var_2_0:CheckF(var_2_2)

	warning("OnCheckToUpdate state = " .. tostring(var_2_3))

	if var_2_3 == DownloadState.CheckToUpdate or var_2_3 == DownloadState.UpdateFailure then
		arg_2_0:OnCheckToUpdate(var_2_2)
	else
		arg_2_0:OnUpdated(var_2_2, arg_2_2)
	end
end

function var_0_0.OnCheckToUpdate(arg_3_0, arg_3_1)
	setActive(arg_3_0.live2dBtn, true)
	setActive(arg_3_0.live2dState, false)
	setActive(arg_3_0.live2dToggle, true)
	setActive(arg_3_0.live2dOn, false)
	setActive(arg_3_0.live2dOff, true)
	onButton(arg_3_0, arg_3_0.live2dBtn, function()
		local var_4_0 = "L2D"
		local var_4_1 = {
			arg_3_1
		}
		local var_4_2 = var_4_0 .. arg_3_1
		local var_4_3 = GroupHelper.CalcSizeWithFileArr(var_4_0, var_4_1)
		local var_4_4 = HashUtil.BytesToString(var_4_3)

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_NORMAL,
			content = string.format(i18n("group_download_tip", var_4_4)),
			onYes = function()
				local function var_5_0(arg_6_0, arg_6_1)
					if not arg_3_0.isDisposed then
						arg_3_0.isOn = arg_6_0

						arg_3_0:OnUpdated(arg_3_1, arg_3_0.isOn)
					end
				end

				local var_5_1 = BundleWizardUpdater.Inst:GetFileList(var_4_0, var_4_1)
				local var_5_2 = BundleWizardUpdater.Inst:CreateListInfo(var_4_2, var_5_1, nil, var_5_0, nil)

				BundleWizardUpdater.Inst:StartUpdate(var_5_2)
			end
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdated(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = checkABExist(arg_7_1)

	warning("fileExist = " .. tostring(var_7_0))
	setActive(arg_7_0.live2dBtn, var_7_0)
	setActive(arg_7_0.live2dState, false)
	setActive(arg_7_0.live2dToggle, true)
	setActive(arg_7_0.live2dOn, arg_7_2)
	setActive(arg_7_0.live2dOff, not arg_7_2)
	onButton(arg_7_0, arg_7_0.live2dBtn, function()
		if Live2dConst.GetLive2DArm32MatchAble() then
			Live2dConst.ShowLive2DArm32Tips()
		end

		arg_7_0:Update(arg_7_0.paintingName, not arg_7_0.isOn)
	end, SFX_PANEL)

	if arg_7_0.callback then
		arg_7_0.callback(arg_7_0.isOn)
	end
end

function var_0_0.Disable(arg_9_0)
	if arg_9_0.isOn then
		triggerButton(arg_9_0.live2dBtn)
	end
end

function var_0_0.SetEnable(arg_10_0, arg_10_1)
	setButtonEnabled(arg_10_0.live2dBtn, arg_10_1)
end

function var_0_0.AddListener(arg_11_0, arg_11_1)
	arg_11_0.callback = arg_11_1
end

function var_0_0.Dispose(arg_12_0)
	arg_12_0.callback = nil
	arg_12_0.isDisposed = true

	pg.DelegateInfo.Dispose(arg_12_0)
end

return var_0_0
