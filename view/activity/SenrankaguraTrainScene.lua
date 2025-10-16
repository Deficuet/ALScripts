local var_0_0 = class("SenrankaguraTrainScene", import("..base.BaseUI"))

var_0_0.optionsPath = {
	"top/btn_home"
}
var_0_0.ACT_ID = ActivityConst.SENRANKAGURA_TRAIN_ACT_ID
var_0_0.SCROLL_OFFSET = 4.13
var_0_0.DIALOG_TIME = 0.5
var_0_0.DEFAULT_DIALOG_TIME = 4

function var_0_0.getUIName(arg_1_0)
	return "SenrankaguraTrainUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:InitData()
	arg_2_0:InitTF()
end

function var_0_0.InitTF(arg_3_0)
	arg_3_0.top = arg_3_0._tf:Find("top")
	arg_3_0.buttonAward = arg_3_0.top:Find("btn_award")
	arg_3_0.buttonBack = arg_3_0.top:Find("btn_back")
	arg_3_0.buttonHelp = arg_3_0.top:Find("btn_help")
	arg_3_0.ptText = arg_3_0.top:Find("pt/Text")
	arg_3_0.main = arg_3_0._tf:Find("main")
	arg_3_0.tachie = arg_3_0.main:Find("group_left/group/tachie")
	arg_3_0.dialog = arg_3_0.main:Find("group_left/group/dialog")
	arg_3_0.attrGroup = arg_3_0.main:Find("attr")
	arg_3_0.scroll = arg_3_0.main:Find("scroll")
	arg_3_0.window = arg_3_0._tf:Find("window")
	arg_3_0.levelWindow = arg_3_0.window:Find("level_window")
	arg_3_0.levelPtText = arg_3_0.levelWindow:Find("pt/Text")
	arg_3_0.levelBg = arg_3_0.levelWindow:Find("bg")
	arg_3_0.levelWindowConfirmButton = arg_3_0.levelBg:Find("btn_confirm")
	arg_3_0.levelWindowCancelButton = arg_3_0.levelBg:Find("btn_cancel")
	arg_3_0.levelTip = arg_3_0.levelBg:Find("tip")
	arg_3_0.levelAttrGroup = arg_3_0.levelBg:Find("attr")
	arg_3_0.awardWindow = arg_3_0.window:Find("award_window")
	arg_3_0.awardContent = arg_3_0.awardWindow:Find("bg/mask/content")
	arg_3_0.awardItem = arg_3_0.awardWindow:Find("bg/mask/item")
	arg_3_0.showWindow = arg_3_0.window:Find("show_window")
	arg_3_0.showSkipButton = arg_3_0.showWindow:Find("bg/btn_skip")
	arg_3_0.spine = arg_3_0.showWindow:Find("bg/spine")
	arg_3_0.testLevel = arg_3_0.top:Find("testlevel")
	arg_3_0.testAward = arg_3_0.top:Find("testaward")
end

function var_0_0.InitData(arg_4_0)
	arg_4_0.activity = getProxy(ActivityProxy):getActivityById(var_0_0.ACT_ID)
	arg_4_0.ptCount = arg_4_0.activity.data1
	arg_4_0.attrLevel = arg_4_0.activity.data1_list
	arg_4_0.awardGotList = arg_4_0.activity.data2_list
	arg_4_0.ptDemand = pg.activity_event_pt_consume[1].target
	arg_4_0.rewardList = pg.activity_event_pt_consume[1].reward_display
	arg_4_0.showList = arg_4_0.activity:getConfig("config_client").show_list
	arg_4_0.wordsKey = arg_4_0.activity:getConfig("config_client").words_key
	arg_4_0.standAnim = arg_4_0.activity:getConfig("config_client").stand_anim
end

function var_0_0.InitButton(arg_5_0)
	for iter_5_0 = 1, arg_5_0.attrGroup.childCount do
		onButton(arg_5_0, arg_5_0.attrGroup:GetChild(iter_5_0 - 1), function()
			if arg_5_0.attrLevel[iter_5_0] > 1 then
				return
			end

			arg_5_0.currentAttr = iter_5_0

			setActive(arg_5_0.levelWindow, true)
			eachChild(arg_5_0.levelAttrGroup, function(arg_7_0)
				setActive(arg_7_0, false)
			end)
			setActive(arg_5_0.levelAttrGroup:GetChild(iter_5_0 - 1), true)

			local var_6_0 = arg_5_0.attrLevel[iter_5_0] + 1
			local var_6_1 = arg_5_0.ptDemand[iter_5_0][var_6_0]

			setText(arg_5_0.levelTip, i18n("senran_pt_consume_tip", var_6_1, var_6_0))
		end, SFX_PANEL)
	end

	onButton(arg_5_0, arg_5_0.levelWindowConfirmButton, function()
		local var_8_0 = arg_5_0.currentAttr
		local var_8_1 = arg_5_0.attrLevel[var_8_0]
		local var_8_2 = arg_5_0.ptDemand[var_8_0][var_8_1 + 1]

		if var_8_2 > arg_5_0.ptCount then
			pg.TipsMgr.GetInstance():ShowTips(i18n("senran_pt_not_enough"))
		else
			arg_5_0:emit(SenrankaguraTrainMediator.LEVEL_UP, {
				cmd = 2,
				id = var_0_0.ACT_ID,
				arg1 = var_8_0,
				cost = var_8_2,
				arg_list = {
					arg_5_0.lvTotal + 1
				}
			})
		end
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.levelWindowCancelButton, function()
		setActive(arg_5_0.levelWindow, false)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.buttonBack, function()
		arg_5_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.buttonHelp, function()
		local var_11_0 = i18n("senran_pt_help")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = var_11_0
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.buttonAward, function()
		local var_12_0 = 0

		for iter_12_0 = 1, #arg_5_0.rewardList do
			if not table.contains(arg_5_0.awardGotList, iter_12_0) then
				var_12_0 = iter_12_0 - 1

				break
			end
		end

		if var_12_0 ~= 0 then
			scrollTo(arg_5_0.awardContent, nil, 1 - var_12_0 / (#arg_5_0.rewardList - var_0_0.SCROLL_OFFSET))
		end

		setActive(arg_5_0.awardWindow, true)
	end, SFX_PANEL)
	onButton(arg_5_0, findTF(arg_5_0.awardWindow, "black"), function()
		setActive(arg_5_0.awardWindow, false)
	end, SFX_CANCEL)
	onButton(arg_5_0, findTF(arg_5_0.levelWindow, "black"), function()
		setActive(arg_5_0.levelWindow, false)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.showSkipButton, function()
		setActive(arg_5_0.showWindow, false)
		arg_5_0:GetAward(arg_5_0.awardList)
	end, SFX_CANCEL)

	for iter_5_1 = 1, arg_5_0.tachie.childCount do
		local var_5_0 = arg_5_0.tachie:GetChild(iter_5_1 - 1)

		onButton(arg_5_0, var_5_0, function()
			if not arg_5_0.tachieClickable then
				return
			end

			local var_16_0 = math.random(2, 4)

			arg_5_0:ShowDialog(var_16_0, function()
				arg_5_0.tachieClickable = false
			end)
		end, SFX_PANEL)
		setActive(var_5_0, false)

		if PLATFORM_CODE ~= PLATFORM_CH then
			local var_5_1 = findTF(var_5_0, "Image")

			if var_5_1 then
				setActive(var_5_1, false)
			end
		end
	end
end

function var_0_0.didEnter(arg_18_0)
	arg_18_0:InitButton()

	arg_18_0.taskList = UIItemList.New(arg_18_0.awardContent, arg_18_0.awardItem)

	arg_18_0.taskList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			arg_18_0:UpdateTask(arg_19_1, arg_19_2)
		end
	end)

	local var_18_0 = math.random(arg_18_0.tachie.childCount)

	setActive(arg_18_0.tachie:GetChild(var_18_0 - 1), true)

	arg_18_0.wordsGroup = pg.gametip[arg_18_0.wordsKey[var_18_0]].tip

	local var_18_1 = {}

	for iter_18_0 = 1, #arg_18_0.standAnim do
		table.insert(var_18_1, iter_18_0)
	end

	shuffle(var_18_1)

	for iter_18_1 = 1, arg_18_0.scroll.childCount do
		PoolMgr.GetInstance():GetSpineChar(arg_18_0.standAnim[var_18_1[iter_18_1]], false, function(arg_20_0)
			arg_20_0.transform.localScale = Vector3.one

			arg_20_0.transform:SetParent(arg_18_0.scroll:GetChild(iter_18_1 - 1), false)
			arg_20_0:GetComponent(typeof(SpineAnimUI)):SetAction("stand2", 0)
		end)
	end

	arg_18_0:ShowDialog(1, function()
		arg_18_0.tachieClickable = false
	end)
	arg_18_0:UpdateFlush()
end

function var_0_0.UpdateTask(arg_22_0, arg_22_1, arg_22_2)
	arg_22_1 = arg_22_1 + 1

	local var_22_0 = arg_22_2:Find("IconTpl")

	setText(findTF(arg_22_2, "title"), "PHASE" .. arg_22_1)

	local var_22_1 = arg_22_0.rewardList[arg_22_1]
	local var_22_2 = {
		type = var_22_1[1],
		id = var_22_1[2],
		count = var_22_1[3]
	}

	updateDrop(var_22_0, var_22_2)
	onButton(arg_22_0, var_22_0, function()
		arg_22_0:emit(BaseUI.ON_DROP, var_22_2)
	end, SFX_PANEL)
	setText(arg_22_2:Find("progress"), i18n("senran_pt_rank", arg_22_1))

	local var_22_3 = table.contains(arg_22_0.awardGotList, arg_22_1)

	setActive(arg_22_2:Find("mask"), var_22_3)
end

function var_0_0.ShowDialog(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.LTList = {}

	if arg_24_2 then
		arg_24_2()
	end

	local var_24_0 = "event:/cv/" .. arg_24_0.wordsGroup[arg_24_1][1]
	local var_24_1 = arg_24_0.wordsGroup[arg_24_1][2]

	setText(findTF(arg_24_0.dialog, "Text"), var_24_1)
	setLocalScale(arg_24_0.dialog, {
		z = 0,
		x = 0,
		y = 0
	})
	table.insert(arg_24_0.LTList, LeanTween.scale(arg_24_0.dialog, Vector3.New(1, 1, 1), var_0_0.DIALOG_TIME):setEase(LeanTweenType.easeOutSine).uniqueId)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_24_0, function(arg_25_0)
		arg_24_0.playSoundInfo = arg_25_0

		local var_25_0 = var_0_0.DEFAULT_DIALOG_TIME

		if arg_25_0 then
			var_25_0 = arg_25_0:GetLength() * 0.001 - var_0_0.DIALOG_TIME
		end

		table.insert(arg_24_0.LTList, LeanTween.delayedCall(go(arg_24_0.dialog), var_25_0, System.Action(function()
			arg_24_0:HideDialog()
		end)).uniqueId)
	end)
end

function var_0_0.HideDialog(arg_27_0)
	table.insert(arg_27_0.LTList, LeanTween.scale(arg_27_0.dialog, Vector3.New(0, 0, 0), var_0_0.DIALOG_TIME):setEase(LeanTweenType.easeOutSine):setOnComplete(System.Action(function()
		arg_27_0.tachieClickable = true
	end)).uniqueId)
end

function var_0_0.LevelUp(arg_29_0, arg_29_1)
	arg_29_0.awardList = arg_29_1

	setActive(arg_29_0.levelWindow, false)
	setActive(arg_29_0.showWindow, true)
	arg_29_0:UpdateFlush()

	local var_29_0 = arg_29_0.showList[arg_29_0.currentAttr][arg_29_0.attrLevel[arg_29_0.currentAttr]]

	arg_29_0:SetAnim(arg_29_0.spine, var_29_0, function()
		setActive(arg_29_0.showWindow, false)
		arg_29_0:GetAward(arg_29_1)
	end)
end

function var_0_0.GetAward(arg_31_0, arg_31_1)
	arg_31_0:emit(BaseUI.ON_ACHIEVE, arg_31_1, function()
		arg_31_0.awardList = nil

		arg_31_0:ShowDialog(5, function()
			arg_31_0.tachieClickable = false

			if arg_31_0.playSoundInfo and arg_31_0.playSoundInfo.channelPlayer ~= nil then
				pg.CriMgr.GetInstance():StopPlaybackInfoForce(arg_31_0.playSoundInfo)
			end

			for iter_33_0, iter_33_1 in pairs(arg_31_0.LTList) do
				LeanTween.cancel(iter_33_1)
			end
		end)
	end)
	arg_31_0:UpdateFlush()
end

function var_0_0.UpdateFlush(arg_34_0)
	arg_34_0.activity = getProxy(ActivityProxy):getActivityById(var_0_0.ACT_ID)
	arg_34_0.ptCount = arg_34_0.activity.data1
	arg_34_0.attrLevel = arg_34_0.activity.data1_list
	arg_34_0.awardGotList = arg_34_0.activity.data2_list
	arg_34_0.lvTotal = 0

	for iter_34_0, iter_34_1 in pairs(arg_34_0.attrLevel) do
		arg_34_0.lvTotal = arg_34_0.lvTotal + iter_34_1
	end

	setText(arg_34_0.ptText, arg_34_0.ptCount)
	setText(arg_34_0.levelPtText, arg_34_0.ptCount)

	local function var_34_0(arg_35_0, arg_35_1)
		for iter_35_0 = 1, arg_35_0.childCount do
			local var_35_0 = arg_35_0:GetChild(iter_35_0 - 1)

			eachChild(var_35_0, function(arg_36_0)
				setActive(arg_36_0, false)
			end)

			local var_35_1 = arg_34_0.attrLevel[iter_35_0]

			setActive(var_35_0:GetChild(var_35_1), true)

			if arg_35_1 and var_35_1 < 2 and arg_34_0.ptDemand[iter_35_0][var_35_1 + 1] <= arg_34_0.ptCount then
				setActive(findTF(var_35_0, "red"), true)
			end
		end
	end

	var_34_0(arg_34_0.attrGroup, true)
	var_34_0(arg_34_0.levelAttrGroup, false)
	arg_34_0.taskList:align(#arg_34_0.rewardList)
end

function var_0_0.SetAnim(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	local var_37_0 = arg_37_1:GetComponent(typeof(SpineAnimUI))

	var_37_0:SetActionCallBack(nil)
	var_37_0:SetAction(arg_37_2, 0)
	var_37_0:SetActionCallBack(function(arg_38_0)
		if arg_38_0 == "finish" then
			var_37_0:SetActionCallBack(nil)

			if arg_37_3 then
				arg_37_3()
			end
		end
	end)
end

function var_0_0.willExit(arg_39_0)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.LTList) do
		LeanTween.cancel(iter_39_1)
	end
end

function var_0_0.IsShowRed()
	local var_40_0 = getProxy(ActivityProxy):getActivityById(var_0_0.ACT_ID)
	local var_40_1 = var_40_0.data1_list
	local var_40_2 = pg.activity_event_pt_consume[1].target
	local var_40_3 = var_40_0.data1

	for iter_40_0, iter_40_1 in pairs(var_40_1) do
		if iter_40_1 < 2 and var_40_3 >= var_40_2[iter_40_0][iter_40_1 + 1] then
			return true
		end
	end

	return false
end

return var_0_0
