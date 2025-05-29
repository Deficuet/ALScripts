local var_0_0 = class("SkinShopDownloadRequest")

var_0_0.Live2DGroupName = "L2D"

function var_0_0.CalcListSize(arg_1_0)
	local var_1_0 = GroupHelper.CreateArrByLuaFileList(var_0_0.Live2DGroupName, arg_1_0)
	local var_1_1 = GroupHelper.CalcSizeWithFileArr(var_0_0.Live2DGroupName, var_1_0)
	local var_1_2 = HashUtil.BytesToString(var_1_1)

	return var_1_1, var_1_2
end

function var_0_0.Ctor(arg_2_0)
	return
end

function var_0_0.Start(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.filePath = arg_3_1
	arg_3_0.fileList = {
		arg_3_1
	}
	arg_3_0.onSuccess = arg_3_2

	local var_3_0, var_3_1 = var_0_0.CalcListSize({
		arg_3_1
	})

	if var_3_0 > 0 then
		local function var_3_2()
			arg_3_0:Download()
		end

		local function var_3_3()
			arg_3_0:success()
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			locked = true,
			type = MSGBOX_TYPE_NORMAL,
			content = string.format(i18n("group_download_tip", var_3_1)),
			onYes = var_3_2,
			onNo = var_3_3,
			onClose = var_3_3
		})
	else
		arg_3_0:success()
	end
end

function var_0_0.Download(arg_6_0)
	local var_6_0 = BundleWizardUpdateInfo.New()

	var_6_0:AddGroup(var_0_0.Live2DGroupName, arg_6_0.fileList)

	var_6_0.infoName = arg_6_0.filePath

	if BundleWizardUpdater.Inst:GetFileList(var_6_0).Count > 0 then
		local function var_6_1(arg_7_0, arg_7_1)
			if arg_7_0 then
				arg_6_0:success()
			else
				arg_6_0:error(arg_6_0.filePath, "")
			end
		end

		BundleWizardUpdater.Inst:StartUpdate(var_6_0, nil, var_6_1, nil)
	else
		arg_6_0:success()
	end
end

function var_0_0.success(arg_8_0)
	if arg_8_0.onSuccess then
		arg_8_0.onSuccess(checkABExist(arg_8_0.filePath))
	end
end

function var_0_0.error(arg_9_0, arg_9_1, arg_9_2)
	local function var_9_0()
		arg_9_0:Download()
	end

	local function var_9_1()
		arg_9_0:success()
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		modal = true,
		locked = true,
		content = i18n("file_down_mgr_error", arg_9_1, arg_9_2),
		onYes = var_9_0,
		onNo = var_9_1,
		onClose = var_9_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function var_0_0.Refresh(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0 = BundleWizard.Inst:GetGroupMgr("L2D")
	local var_12_1 = var_12_0.state

	if var_12_1 == DownloadState.None or var_12_1 == DownloadState.CheckFailure then
		var_12_0:CheckD()
	end

	local var_12_2 = false
	local var_12_3 = false
	local var_12_4 = var_12_0:CheckF(arg_12_2)

	if var_12_4 == DownloadState.None then
		-- block empty
	elseif var_12_4 == DownloadState.Checking then
		-- block empty
	elseif var_12_4 == DownloadState.CheckToUpdate and arg_12_1 then
		VersionMgr.Inst:RequestUIForUpdateF("L2D", arg_12_2, true)
	elseif var_12_4 == DownloadState.CheckToUpdate and not isActive(arg_12_0.downloadui) then
		var_12_3 = true
	elseif var_12_4 == DownloadState.CheckOver then
		-- block empty
	elseif var_12_4 == DownloadState.CheckFailure then
		var_12_3 = true
	elseif var_12_4 == DownloadState.Updating then
		-- block empty
	elseif var_12_4 == DownloadState.UpdateFailure then
		var_12_3 = true
	elseif var_12_4 == DownloadState.UpdateSuccess then
		var_12_3 = true
		var_12_2 = checkABExist(arg_12_2)
	end

	if arg_12_0.live2dTimer then
		arg_12_0.live2dTimer:Stop()

		arg_12_0.live2dTimer = nil
	end

	if var_12_4 == DownloadState.CheckToUpdate or var_12_4 == DownloadState.UpdateFailure or var_12_4 == DownloadState.Updating then
		arg_12_0.live2dTimer = Timer.New(function()
			arg_12_0:Refresh(false, arg_12_2, arg_12_3)
		end, 0.5, 1)

		arg_12_0.live2dTimer:Start()
	end

	if var_12_3 then
		arg_12_3(var_12_2)
	end
end

function var_0_0.Dispose(arg_14_0)
	if arg_14_0.live2dTimer then
		arg_14_0.live2dTimer:Stop()

		arg_14_0.live2dTimer = nil
	end
end

return var_0_0
