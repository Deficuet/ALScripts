pg = pg or {}
pg.RepairResMgr = singletonClass("RepairResMgr")

local var_0_0 = pg.RepairResMgr

var_0_0.OPTION_LIST = {
	{
		textKey = "resource_repair_op1",
		name = "default",
		group = "DEFAULT_RES",
		hashFile = "hashes.csv"
	},
	{
		textKey = "resource_repair_op2",
		name = "live2d",
		group = "L2D",
		hashFile = "hashes-live2d.csv"
	},
	{
		textKey = "resource_repair_op3",
		name = "painting",
		group = "PAINTING",
		hashFile = "hashes-painting.csv"
	},
	{
		textKey = "resource_repair_op4",
		name = "cipher",
		group = "CIPHER",
		hashFile = "hashes-cipher.csv"
	},
	{
		textKey = "resource_repair_op5",
		name = "cv",
		group = "CV",
		hashFile = "hashes-cv.csv"
	}
}

function var_0_0.Init(arg_1_0, arg_1_1)
	LoadAndInstantiateAsync("ui", "RepairNewUI", function(arg_2_0)
		arg_1_0:InitUI(arg_2_0)
		arg_1_1()
	end, true, true)
end

function var_0_0.InitRes(arg_3_0)
	arg_3_0.iconSpriteMap = {}

	local var_3_0 = arg_3_0._tf:Find("Res")

	for iter_3_0, iter_3_1 in ipairs(var_0_0.OPTION_LIST) do
		local var_3_1 = string.format("icon_res_type_%s_normal", iter_3_1.name)
		local var_3_2 = string.format("icon_res_type_%s_selected", iter_3_1.name)

		print(var_3_1, var_3_2)

		local var_3_3 = var_3_0:Find(var_3_1):GetComponent(typeof(Image)).sprite
		local var_3_4 = var_3_0:Find(var_3_2):GetComponent(typeof(Image)).sprite

		arg_3_0.iconSpriteMap[iter_3_1.name] = {
			var_3_3,
			var_3_4
		}
	end
end

function var_0_0.InitUIText(arg_4_0)
	local var_4_0 = arg_4_0._tf:Find("window/top/title")
	local var_4_1 = arg_4_0._tf:Find("window/top/title/title_en")
	local var_4_2 = arg_4_0._tf:Find("window/content/TextPanel/Text_1")
	local var_4_3 = arg_4_0._tf:Find("window/content/TextPanel/Text_2")

	setText(var_4_0, i18n("msgbox_repair_title"))
	setText(var_4_1, "REPAIR")
	setText(var_4_2, i18n("resource_repair_tips1"))
	setText(var_4_3, i18n("resource_repair_tips2"))

	local var_4_4 = arg_4_0.repairTF:Find("top/title")
	local var_4_5 = arg_4_0.repairTF:Find("top/title/title_en")

	setText(var_4_4, i18n("msgbox_repair_title"))
	setText(var_4_5, "REPAIR")
end

function var_0_0.InitBtnList(arg_5_0)
	arg_5_0.uiItemList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_5_0:InitBtn(arg_6_1 + 1, arg_6_2)
		end
	end)
	arg_5_0.uiItemList:align(#var_0_0.OPTION_LIST)
end

function var_0_0.InitBtn(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = var_0_0.OPTION_LIST[arg_7_1]
	local var_7_1 = arg_7_2:Find("Normal")
	local var_7_2 = arg_7_2:Find("Selected")
	local var_7_3 = var_7_1:Find("Icon")
	local var_7_4 = var_7_2:Find("Icon")

	setImageSprite(var_7_3, arg_7_0.iconSpriteMap[var_7_0.name][1])
	setImageSprite(var_7_4, arg_7_0.iconSpriteMap[var_7_0.name][2])

	local var_7_5 = arg_7_2:Find("Text")

	setText(var_7_5, i18n(var_7_0.textKey))
end

function var_0_0.InitToggles(arg_8_0)
	arg_8_0.toggleList = {}

	for iter_8_0 = 1, #var_0_0.OPTION_LIST do
		arg_8_0.toggleList[iter_8_0] = arg_8_0.containerTF:GetChild(iter_8_0 - 1):GetComponent(typeof(Toggle))
	end
end

function var_0_0.InitUI(arg_9_0, arg_9_1)
	arg_9_0._go = arg_9_1
	arg_9_0._tf = arg_9_0._go.transform

	arg_9_0._go:SetActive(false)

	arg_9_0.parentTr = pg.UIMgr.GetInstance().OverlayToast

	arg_9_0._go.transform:SetParent(arg_9_0.parentTr, false)

	arg_9_0.tpl = arg_9_0._tf:Find("Tpl")
	arg_9_0.containerTF = arg_9_0._tf:Find("window/content/SelectPanel")
	arg_9_0.uiItemList = UIItemList.New(arg_9_0.containerTF, arg_9_0.tpl)
	arg_9_0.windowTF = arg_9_0._tf:Find("window")
	arg_9_0.repairTF = arg_9_0._tf:Find("Repair")

	arg_9_0:InitUIText()
	arg_9_0:InitRes()
	arg_9_0:InitBtnList()

	arg_9_0.closeBtn = arg_9_0._tf:Find("window/top/btnBack")
	arg_9_0.cancelBtn = arg_9_0._tf:Find("window/buttons/custom_button_1")
	arg_9_0.confirmBtn = arg_9_0._tf:Find("window/buttons/custom_button_2")
	arg_9_0.repairText = arg_9_0.repairTF:Find("content/Text")

	arg_9_0:InitToggles()
end

function var_0_0.SetToggleValue(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.toggleList[arg_10_1]

	var_10_0.isOn = arg_10_2

	setActive(var_10_0.transform:Find("Selected"), arg_10_2)
end

function var_0_0.GetSelectedOptions(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in ipairs(var_0_0.OPTION_LIST) do
		if arg_11_0.toggleList[iter_11_0].isOn then
			table.insert(var_11_0, iter_11_1)
		end
	end

	return var_11_0
end

function var_0_0.GetCurLabel(arg_12_0)
	return i18n(arg_12_0.curOption.textKey)
end

function var_0_0.GetQueueProgress(arg_13_0)
	return tostring(arg_13_0.queueIndex) .. "/" .. tostring(#arg_13_0.queue)
end

function var_0_0.GetOptionNames(arg_14_0, arg_14_1)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_1) do
		table.insert(var_14_0, i18n(iter_14_1.textKey))
	end

	return table.concat(var_14_0, "、")
end

function var_0_0.SetStatus(arg_15_0, arg_15_1)
	setText(arg_15_0.repairText, arg_15_1)
end

function var_0_0.ShowRepairPanel(arg_16_0, arg_16_1)
	setActive(arg_16_0.windowTF, not arg_16_1)
	setActive(arg_16_0.repairTF, arg_16_1)
end

function var_0_0.Repair(arg_17_0)
	if arg_17_0.busy then
		return
	end

	arg_17_0:ShowRepairPanel(false)
	pg.DelegateInfo.New(arg_17_0)
	arg_17_0._go:SetActive(true)
	pg.UIMgr.GetInstance():BlurPanel(arg_17_0._tf)
	onButton(arg_17_0, arg_17_0._tf, function()
		arg_17_0:Hide()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.closeBtn, function()
		arg_17_0:Hide()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.cancelBtn, function()
		arg_17_0:Hide()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.confirmBtn, function()
		arg_17_0:OnConfirm()
	end, SFX_PANEL)
end

function var_0_0.OnConfirm(arg_22_0)
	if arg_22_0.busy then
		return
	end

	local var_22_0 = arg_22_0:GetSelectedOptions()

	if #var_22_0 == 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("resource_repair_tips3"))

		return
	end

	arg_22_0:StartRepairQueue(var_22_0)
end

function var_0_0.StartRepairQueue(arg_23_0, arg_23_1)
	arg_23_0.busy = true
	arg_23_0.queue = arg_23_1
	arg_23_0.queueIndex = 0
	arg_23_0.repairedList = {}
	arg_23_0.failedList = {}
	arg_23_0.noBrokenList = {}

	arg_23_0:SetStatus("")
	arg_23_0:ShowRepairPanel(true)
	arg_23_0:RepairNext()
end

function var_0_0.RepairNext(arg_24_0)
	arg_24_0.queueIndex = arg_24_0.queueIndex + 1

	local var_24_0 = arg_24_0.queue[arg_24_0.queueIndex]

	if var_24_0 == nil then
		arg_24_0:OnQueueFinished()

		return
	end

	local var_24_1 = BundleWizard.Inst:GetGroupMgr(var_24_0.group)
	local var_24_2 = Application.persistentDataPath .. "/" .. var_24_0.hashFile

	if var_24_1 == nil or not PathMgr.FileExists(var_24_2) then
		arg_24_0:RepairNext()

		return
	end

	arg_24_0.curOption = var_24_0
	arg_24_0.curGroup = var_24_1

	var_24_1:StartVerify(function(arg_25_0)
		arg_24_0:OnCheckProgress(arg_25_0)
	end, function()
		arg_24_0:OnGroupUnbroken()
	end, function(arg_27_0)
		arg_24_0:OnGroupBroken(arg_27_0)
	end, function()
		arg_24_0:OnFixProgress()
	end, function()
		arg_24_0:OnGroupFixComplete()
	end)
end

function var_0_0.OnCheckProgress(arg_30_0, arg_30_1)
	arg_30_0:SetStatus(i18n("resource_repair_check", arg_30_0:GetCurLabel(), arg_30_0:GetQueueProgress(), tostring(math.floor(arg_30_1))))
end

function var_0_0.OnGroupUnbroken(arg_31_0)
	table.insert(arg_31_0.noBrokenList, arg_31_0.curOption)
	arg_31_0:RepairNext()
end

function var_0_0.OnGroupBroken(arg_32_0, arg_32_1)
	arg_32_1:DynamicInvoke(true)
end

function var_0_0.OnFixProgress(arg_33_0)
	local var_33_0 = arg_33_0.curGroup
	local var_33_1 = 0

	if var_33_0.downloadTotal > 0 then
		var_33_1 = math.floor(var_33_0.downloadCount * 100 / var_33_0.downloadTotal)
	end

	arg_33_0:SetStatus(i18n("resource_repairing", arg_33_0:GetCurLabel(), arg_33_0:GetQueueProgress(), tostring(var_33_1)))
end

function var_0_0.OnGroupFixComplete(arg_34_0)
	if arg_34_0.curGroup.state == DownloadState.UpdateSuccess then
		table.insert(arg_34_0.repairedList, arg_34_0.curOption)
	else
		table.insert(arg_34_0.failedList, arg_34_0.curOption)
	end

	arg_34_0:RepairNext()
end

function var_0_0.BuildResultText(arg_35_0)
	local var_35_0 = {}

	if #arg_35_0.noBrokenList > 0 then
		table.insert(var_35_0, i18n("resource_repair_report1", arg_35_0:GetOptionNames(arg_35_0.noBrokenList)))
	end

	if #arg_35_0.repairedList > 0 then
		table.insert(var_35_0, i18n("resource_repair_report2", arg_35_0:GetOptionNames(arg_35_0.repairedList)))
	end

	if #arg_35_0.failedList > 0 then
		table.insert(var_35_0, i18n("resource_repair_report3", arg_35_0:GetOptionNames(arg_35_0.failedList)))
	end

	return table.concat(var_35_0, "\n")
end

function var_0_0.OnQueueFinished(arg_36_0)
	arg_36_0.busy = false

	arg_36_0:ShowRepairPanel(false)

	local var_36_0 = arg_36_0:BuildResultText()

	if var_36_0 == "" then
		pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
	else
		local function var_36_1()
			if #arg_36_0.repairedList > 0 then
				local function var_37_0()
					Application.Quit()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true,
					content = i18n("resource_repair_finish_tips"),
					onYes = var_37_0,
					onNo = var_37_0
				})
			end
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = var_36_0,
			onYes = var_36_1,
			onNo = var_36_1
		})
	end

	arg_36_0:Hide()
end

function var_0_0.Hide(arg_39_0)
	if arg_39_0.busy then
		return
	end

	pg.DelegateInfo.Dispose(arg_39_0)
	arg_39_0._go:SetActive(false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_39_0._tf, arg_39_0.parentTr)
end
