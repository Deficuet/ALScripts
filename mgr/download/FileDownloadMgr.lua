pg = pg or {}

local var_0_0 = pg

var_0_0.FileDownloadMgr = singletonClass("FileDownloadMgr")

local var_0_1 = var_0_0.FileDownloadMgr
local var_0_2 = FileDownloadConst

function var_0_1.Init(arg_1_0, arg_1_1)
	print("initializing filedownloadmgr manager...")
	LoadAndInstantiateAsync("ui", "FileDownloadUI", function(arg_2_0)
		arg_1_0._go = arg_2_0

		arg_1_0._go:SetActive(false)

		arg_1_0._tf = arg_1_0._go.transform

		arg_1_0._tf:SetParent(var_0_0.UIMgr.GetInstance().OverlayMain, false)
		arg_1_0:initUI()
		arg_1_0:initUITextTips()
		arg_1_1()
	end, true, true)
end

function var_0_1.Main(arg_3_0, arg_3_1)
	arg_3_0:initData()
	arg_3_0:setData(arg_3_1)
	arg_3_0:startDownload()
end

function var_0_1.IsRunning(arg_4_0)
	return isActive(arg_4_0._go)
end

var_0_1.KEY_STOP_REMIND = "File_Download_Remind_Time"

function var_0_1.SetRemind(arg_5_0, arg_5_1)
	arg_5_0.isStopRemind = arg_5_1
end

function var_0_1.IsNeedRemind(arg_6_0)
	if arg_6_0.isStopRemind == true then
		return false
	else
		return true
	end
end

function var_0_1.show(arg_7_0)
	arg_7_0._go:SetActive(true)
end

function var_0_1.hide(arg_8_0)
	arg_8_0._go:SetActive(false)
end

function var_0_1.initUI(arg_9_0)
	arg_9_0.mainTF = arg_9_0._tf:Find("Main")
	arg_9_0.titleText = arg_9_0.mainTF:Find("Title")
	arg_9_0.progressText = arg_9_0.mainTF:Find("ProgressText")
	arg_9_0.progressBar = arg_9_0.mainTF:Find("ProgressBar")
end

function var_0_1.initUITextTips(arg_10_0)
	setText(arg_10_0.titleText, i18n("file_down_mgr_title"))
end

function var_0_1.initData(arg_11_0)
	arg_11_0.curGroupIndex = 0
	arg_11_0.curGroupMgr = nil
	arg_11_0.dataList = nil
	arg_11_0.onFinish = nil
end

function var_0_1.setData(arg_12_0, arg_12_1)
	arg_12_0.dataList = arg_12_1.dataList
	arg_12_0.onFinish = arg_12_1.onFinish
end

function var_0_1.fileProgress(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = HashUtil.BytesToString(arg_13_1)
	local var_13_1 = HashUtil.BytesToString(arg_13_2)

	setText(arg_13_0.progressText, i18n("file_down_mgr_progress", var_13_0, var_13_1))
	setSlider(arg_13_0.progressBar, 0, tonumber(tostring(arg_13_2)), tonumber(tostring(arg_13_1)))
end

function var_0_1.allComplete(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_0.onFinish then
		arg_14_0.onFinish()
	end

	arg_14_0:initData()
	arg_14_0:hide()
end

function var_0_1.error(arg_15_0, arg_15_1, arg_15_2)
	local function var_15_0()
		arg_15_0:startDownload()
	end

	local function var_15_1()
		Application.Quit()
	end

	arg_15_0:hide()
	var_0_0.MsgboxMgr.GetInstance():ShowMsgBox({
		modal = true,
		locked = true,
		content = i18n("file_down_mgr_error", arg_15_1, arg_15_2),
		onYes = var_15_0,
		onNo = var_15_1,
		onClose = var_15_1
	})
end

function var_0_1.download(arg_18_0)
	local function var_18_0(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
		arg_18_0:fileProgress(arg_19_3, arg_19_4)
	end

	local function var_18_1(arg_20_0, arg_20_1)
		if arg_20_0 then
			arg_18_0:allComplete()
		else
			arg_18_0:error("", "")
		end
	end

	BundleWizardUpdater.Inst:StartUpdate(arg_18_0.info, nil, var_18_1, var_18_0)
end

function var_0_1.startDownload(arg_21_0)
	if arg_21_0:verifyValidData() then
		arg_21_0:show()
		arg_21_0:download()
	else
		arg_21_0:allComplete()
	end
end

function var_0_1.verifyValidData(arg_22_0)
	arg_22_0.info = var_0_1.createDownloadFileInfo(arg_22_0.dataList)

	return BundleWizardUpdater.Inst:GetFileList(arg_22_0.info).Count > 0
end

function var_0_1.createDownloadFileInfo(arg_23_0)
	local var_23_0 = BundleWizardUpdateInfo.New()
	local var_23_1 = {}

	for iter_23_0, iter_23_1 in ipairs(arg_23_0) do
		var_23_0:AddGroup(iter_23_1.groupName, iter_23_1.fileNameList)
		table.insert(var_23_1, iter_23_1.groupName)
	end

	var_23_0.infoName = table.concat(var_23_1, "_")

	return var_23_0
end
