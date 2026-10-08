pg = pg or {}

local var_0_0 = pg

var_0_0.SplitPackDownloadMgr = singletonClass("SplitPackDownloadMgr")

local var_0_1 = var_0_0.SplitPackDownloadMgr

var_0_1.State = {
	None = 1,
	Fail = 3,
	Success = 2
}

function var_0_1.Init(arg_1_0)
	arg_1_0.isDownloading = false
	arg_1_0.state = var_0_1.State.None
	arg_1_0.hasShownTip = false
	arg_1_0.message = ""
	arg_1_0.progress = {
		curSize = 0,
		successCount = 0,
		failCount = 0,
		speed = "",
		totalSize = 0,
		totalCount = 0
	}
end

function var_0_1.StartMainDownload(arg_2_0)
	if not SplitPackHelper.Inst:IsSplitPackMode() then
		return
	end

	if arg_2_0.progress == nil then
		arg_2_0:Init()
	end

	if arg_2_0.isDownloading then
		return
	end

	arg_2_0.isDownloading = true
	arg_2_0.state = var_0_1.State.None
	arg_2_0.message = ""

	local var_2_0 = GroupMainHelper.DefaultGroupName
	local var_2_1 = {
		var_2_0
	}
	local var_2_2 = BundleWizardUpdater.Inst:GetFileList(var_2_1)

	arg_2_0.progress.successCount = 0
	arg_2_0.progress.failCount = 0
	arg_2_0.progress.totalCount = var_2_2.Count
	arg_2_0.progress.curSize = 0
	arg_2_0.progress.totalSize = GroupHelper.GetGroupSize(var_2_0)
	arg_2_0.progress.speed = ""

	local function var_2_3(arg_3_0, arg_3_1)
		arg_2_0.isDownloading = false
		arg_2_0.state = arg_3_0 and var_0_1.State.Success or var_0_1.State.Fail
		arg_2_0.message = arg_3_1 or ""
	end

	local function var_2_4(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
		arg_2_0.isDownloading = true
		arg_2_0.progress.successCount = arg_4_0
		arg_2_0.progress.failCount = arg_4_1
		arg_2_0.progress.totalCount = arg_4_2
		arg_2_0.progress.curSize = arg_4_3
		arg_2_0.progress.totalSize = arg_4_4
		arg_2_0.progress.speed = arg_4_5 or ""
	end

	local var_2_5 = BundleWizardUpdater.Inst:CreateListInfo(var_2_0, var_2_2, nil, var_2_3, var_2_4)

	BundleWizardUpdater.Inst:StartUpdate(var_2_5)
end

function var_0_1.IsDownloading(arg_5_0)
	return arg_5_0.isDownloading
end

function var_0_1.GetState(arg_6_0)
	return arg_6_0.state
end

function var_0_1.GetProgress(arg_7_0)
	return arg_7_0.progress
end

function var_0_1.GetTotalSize(arg_8_0)
	return arg_8_0.progress and arg_8_0.progress.totalSize or 0
end

function var_0_1.ShouldShowTip(arg_9_0)
	return arg_9_0.isDownloading and not arg_9_0.hasShownTip
end

function var_0_1.MarkTipShown(arg_10_0)
	arg_10_0.hasShownTip = true
end
