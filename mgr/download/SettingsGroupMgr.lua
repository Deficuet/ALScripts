pg = pg or {}

local var_0_0 = pg

var_0_0.SettingsGroupMgr = singletonClass("SettingsGroupMgr")

local var_0_1 = var_0_0.SettingsGroupMgr

var_0_1.State = {
	None = 1,
	Updating = 2,
	Fail = 4,
	Success = 3
}

function var_0_1.Init(arg_1_0, arg_1_1)
	arg_1_0.infoDict = {}
end

function var_0_1.StartDownload(arg_2_0, arg_2_1, arg_2_2)
	local function var_2_0(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
		arg_2_0:onProgress(arg_2_1, arg_3_0, arg_3_1, arg_3_2)
	end

	local function var_2_1(arg_4_0, arg_4_1)
		arg_2_0:onFinish(arg_2_1, arg_4_0, arg_4_1)
	end

	local var_2_2 = BundleWizardUpdater.Inst:GetFileList(arg_2_2)
	local var_2_3 = BundleWizardUpdater.Inst:CreateListInfo(arg_2_1, var_2_2, nil, var_2_1, var_2_0)

	BundleWizardUpdater.Inst:StartUpdate(var_2_3)
end

function var_0_1.GetState(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.infoDict[arg_5_1]

	if var_5_0 == nil then
		return var_0_1.State.None
	else
		return var_5_0.state
	end
end

function var_0_1.GetCountProgress(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.infoDict[arg_6_1]

	if var_6_0 == nil then
		return 0, 0
	else
		return var_6_0.curCount, var_6_0.totalCount
	end
end

function var_0_1.GetTotalSize(arg_7_0, arg_7_1)
	local var_7_0 = 0

	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		var_7_0 = var_7_0 + GroupHelper.GetGroupSize(iter_7_1)
	end

	return var_7_0
end

function var_0_1.beforeStart(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.infoDict[arg_8_1]

	if var_8_0 == nil then
		var_8_0 = {}
		arg_8_0.infoDict[arg_8_1] = var_8_0
	end

	var_8_0.state = var_0_1.State.Updating
end

function var_0_1.onProgress(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = arg_9_0.infoDict[arg_9_1]

	if var_9_0 == nil then
		var_9_0 = {}
		arg_9_0.infoDict[arg_9_1] = var_9_0
	end

	var_9_0.state = var_0_1.State.Updating
	var_9_0.successCount = arg_9_2
	var_9_0.failCount = arg_9_3
	var_9_0.totalCount = arg_9_4
	var_9_0.curCount = arg_9_2 + arg_9_3
end

function var_0_1.onFinish(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = arg_10_0.infoDict[arg_10_1]

	if var_10_0 == nil then
		var_10_0 = {}
		arg_10_0.infoDict[arg_10_1] = var_10_0
	end

	if arg_10_2 then
		var_10_0.state = var_0_1.State.Success
	else
		var_10_0.state = var_0_1.State.Fail
	end
end

function var_0_1.CheckGroupUpdateTip(arg_11_0)
	local var_11_0 = BundleWizard.Inst:GetGroupMgr(arg_11_0)

	var_11_0:CheckD()

	if var_11_0.state == DownloadState.CheckToUpdate then
		return false
	else
		return not GroupHelper.IsGroupVerLastest(arg_11_0)
	end
end
