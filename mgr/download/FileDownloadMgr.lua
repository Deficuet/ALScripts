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
	arg_3_0.requestQueue = arg_3_0.requestQueue or {}

	table.insert(arg_3_0.requestQueue, arg_3_1)
	arg_3_0:processNext()
end

function var_0_1.processNext(arg_4_0)
	if arg_4_0.currentRequest then
		return
	end

	arg_4_0.requestQueue = arg_4_0.requestQueue or {}

	local var_4_0 = table.remove(arg_4_0.requestQueue, 1)

	if not var_4_0 then
		arg_4_0:hide()

		return
	end

	arg_4_0.currentRequest = var_4_0

	arg_4_0:setData(var_4_0)
	arg_4_0:startDownload()
end

function var_0_1.IsRunning(arg_5_0)
	return arg_5_0.currentRequest ~= nil or #(arg_5_0.requestQueue or {}) > 0 or isActive(arg_5_0._go)
end

var_0_1.KEY_STOP_REMIND = "File_Download_Remind_Time"

function var_0_1.SetRemind(arg_6_0, arg_6_1)
	arg_6_0.isStopRemind = arg_6_1
end

function var_0_1.IsNeedRemind(arg_7_0)
	if arg_7_0.isStopRemind == true then
		return false
	else
		return true
	end
end

function var_0_1.show(arg_8_0)
	setActive(arg_8_0.maskTF, arg_8_0.showMask)
	arg_8_0._go:SetActive(true)
end

function var_0_1.hide(arg_9_0)
	arg_9_0._go:SetActive(false)
end

function var_0_1.initUI(arg_10_0)
	arg_10_0.mainTF = arg_10_0._tf:Find("Main")
	arg_10_0.maskTF = arg_10_0._tf:Find("Mask")
	arg_10_0.titleText = arg_10_0.mainTF:Find("Title")
	arg_10_0.progressText = arg_10_0.mainTF:Find("ProgressText")
	arg_10_0.progressBar = arg_10_0.mainTF:Find("ProgressBar")

	setActive(arg_10_0.maskTF, false)
end

function var_0_1.initUITextTips(arg_11_0)
	setText(arg_11_0.titleText, i18n("file_down_mgr_title"))
end

function var_0_1.initData(arg_12_0)
	arg_12_0.curGroupIndex = 0
	arg_12_0.curGroupMgr = nil
	arg_12_0.dataList = nil
	arg_12_0.onFinish = nil
	arg_12_0.showMask = false
end

function var_0_1.setData(arg_13_0, arg_13_1)
	arg_13_0.dataList = arg_13_1.dataList
	arg_13_0.onFinish = arg_13_1.onFinish
	arg_13_0.showMask = arg_13_1.showMask == true
end

function var_0_1.fileProgress(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = HashUtil.BytesToString(arg_14_1)
	local var_14_1 = HashUtil.BytesToString(arg_14_2)

	setText(arg_14_0.progressText, i18n("file_down_mgr_progress", var_14_0, var_14_1))
	setSlider(arg_14_0.progressBar, 0, tonumber(tostring(arg_14_2)), tonumber(tostring(arg_14_1)))
end

function var_0_1.allComplete(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1 or arg_15_0.onFinish

	arg_15_0:initData()

	arg_15_0.currentRequest = nil

	arg_15_0:hide()

	if var_15_0 then
		var_15_0()
	end

	arg_15_0:processNext()
end

function var_0_1.error(arg_16_0, arg_16_1, arg_16_2)
	local function var_16_0()
		arg_16_0:startDownload()
	end

	local function var_16_1()
		Application.Quit()
	end

	arg_16_0:hide()
	var_0_0.MsgboxMgr.GetInstance():ShowMsgBox({
		modal = true,
		locked = true,
		content = i18n("file_down_mgr_error", arg_16_1, arg_16_2),
		onYes = var_16_0,
		onNo = var_16_1,
		onClose = var_16_1
	})
end

function var_0_1.download(arg_19_0)
	local function var_19_0(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5)
		arg_19_0:fileProgress(arg_20_3, arg_20_4)
	end

	local var_19_1 = arg_19_0.onFinish

	local function var_19_2(arg_21_0, arg_21_1)
		if arg_21_0 then
			arg_19_0:allComplete(var_19_1)
		else
			arg_19_0:error("", "")
		end
	end

	BundleWizardUpdater.Inst:StartUpdate(arg_19_0.info, nil, var_19_2, var_19_0)
end

function var_0_1.startDownload(arg_22_0)
	if arg_22_0:verifyValidData() then
		arg_22_0:show()
		arg_22_0:download()
	else
		arg_22_0:allComplete()
	end
end

function var_0_1.verifyValidData(arg_23_0)
	arg_23_0.info = var_0_1.createDownloadFileInfo(arg_23_0.dataList)

	return BundleWizardUpdater.Inst:GetFileList(arg_23_0.info).Count > 0
end

function var_0_1.createDownloadFileInfo(arg_24_0)
	local var_24_0 = BundleWizardUpdateInfo.New()
	local var_24_1 = {}

	for iter_24_0, iter_24_1 in ipairs(arg_24_0) do
		var_24_0:AddGroup(iter_24_1.groupName, iter_24_1.fileNameList)
		table.insert(var_24_1, iter_24_1.groupName)
	end

	var_24_0.infoName = table.concat(var_24_1, "_")

	return var_24_0
end
