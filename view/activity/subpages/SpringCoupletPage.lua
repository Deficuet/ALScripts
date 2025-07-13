local var_0_0 = class("SpringCoupletPage", import("...base.BaseActivityPage"))
local var_0_1 = 7
local var_0_2 = 7
local var_0_3 = 7
local var_0_4 = 400
local var_0_5 = 72
local var_0_6 = 1
local var_0_7 = "ui/activityuipage/springcoupletpage_atlas"
local var_0_8 = "couplete_activty_desc"
local var_0_9 = "couplete_click_desc"
local var_0_10 = "couplet_index_desc"
local var_0_11 = "couplete_help"
local var_0_12 = "couplete_drag_tip"
local var_0_13 = "couplete_remind"
local var_0_14 = "couplete_complete"
local var_0_15 = "couplete_enter"
local var_0_16 = "couplete_stay"
local var_0_17 = "couplete_task"
local var_0_18 = {
	"couplete_pass_1",
	"couplete_pass_2"
}
local var_0_19 = {
	"couplete_fail_1",
	"couplete_fail_2"
}
local var_0_20 = 20

function var_0_0.OnInit(arg_1_0)
	arg_1_0.itemTpl = findTF(arg_1_0._tf, "AD/itemTpl")
	arg_1_0.iconTpl = findTF(arg_1_0._tf, "AD/iconTpl")
	arg_1_0.wordTpl = findTF(arg_1_0._tf, "AD/wordTpl")
	arg_1_0.itemContainer = findTF(arg_1_0._tf, "AD/itemContainer")
	arg_1_0.taskIcon = findTF(arg_1_0._tf, "AD/task/icon")
	arg_1_0.taskSlider = findTF(arg_1_0._tf, "AD/task/Slider")
	arg_1_0.taskBtnGet = findTF(arg_1_0._tf, "AD/task/btnGet")
	arg_1_0.taskBtnGot = findTF(arg_1_0._tf, "AD/task/btnGot")
	arg_1_0.taskBtnGo = findTF(arg_1_0._tf, "AD/task/btnGo")
	arg_1_0.taskDesc = findTF(arg_1_0._tf, "AD/task/desc")
	arg_1_0.taskCur = findTF(arg_1_0._tf, "AD/task/cur")
	arg_1_0.taskMax = findTF(arg_1_0._tf, "AD/task/max")
	arg_1_0.finalAward = findTF(arg_1_0._tf, "AD/finalAward")
	arg_1_0.charPos = findTF(arg_1_0._tf, "AD/charPos")
	arg_1_0.charClick = findTF(arg_1_0.charPos, "click")
	arg_1_0.btnConfirm = findTF(arg_1_0._tf, "AD/btnConfirm")
	arg_1_0.imgComplete = findTF(arg_1_0._tf, "AD/imgComplete")
	arg_1_0.charTip = findTF(arg_1_0._tf, "AD/charTip")

	setActive(arg_1_0.charTip, false)

	arg_1_0.btnHelp = findTF(arg_1_0._tf, "AD/btnHelp")
	arg_1_0.remindDesc = findTF(arg_1_0._tf, "AD/remindDesc")

	setText(arg_1_0.remindDesc, i18n(var_0_9))

	arg_1_0.dragTip = findTF(arg_1_0._tf, "AD/dragTip")

	setText(arg_1_0.dragTip, i18n(var_0_12))

	arg_1_0.btnPre = findTF(arg_1_0._tf, "AD/pre")
	arg_1_0.btnNext = findTF(arg_1_0._tf, "AD/next")
	arg_1_0.activityDesc = findTF(arg_1_0._tf, "AD/desc")

	setText(arg_1_0.activityDesc, i18n(var_0_8))

	arg_1_0.coupletUpImg = GetComponent(findTF(arg_1_0._tf, "AD/coupletUp/contents/img"), typeof(Image))
	arg_1_0.coupletUpContents = findTF(arg_1_0._tf, "AD/coupletUp/contents")
	arg_1_0.coupletBottomContents = findTF(arg_1_0._tf, "AD/coupletBottom/contents")
	arg_1_0.coupletUpLock = findTF(arg_1_0._tf, "AD/coupletUp/lock")
	arg_1_0.coupletBottomLock = findTF(arg_1_0._tf, "AD/coupletBottom/lock")
	arg_1_0.awardIcon = tf(instantiate(arg_1_0.iconTpl))
	arg_1_0.awardIcon.anchoredPosition = Vector2(0, 0)

	setActive(arg_1_0.awardIcon, true)
	setParent(arg_1_0.awardIcon, arg_1_0.taskIcon)

	arg_1_0.countDesc = findTF(arg_1_0._tf, "AD/countDesc")
	arg_1_0.items = {}

	for iter_1_0 = 1, var_0_2 do
		local var_1_0 = tf(instantiate(arg_1_0.itemTpl))

		setActive(var_1_0, true)
		setParent(var_1_0, arg_1_0.itemContainer)
		table.insert(arg_1_0.items, var_1_0)
	end

	arg_1_0.coupletBottomWords = {}

	for iter_1_1 = 1, var_0_3 do
		local var_1_1 = arg_1_0:createWord(iter_1_1, arg_1_0.coupletBottomContents)

		arg_1_0:addCoupletWordEvent(var_1_1)
		table.insert(arg_1_0.coupletBottomWords, var_1_1)
	end

	arg_1_0._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	arg_1_0.timer = Timer.New(function()
		arg_1_0:onTimer()
	end, 2, -1)

	arg_1_0.timer:Start()
	onButton(arg_1_0, arg_1_0.btnConfirm, function()
		arg_1_0:finishCouplete()
	end)
	onButton(arg_1_0, arg_1_0.btnPre, function()
		arg_1_0.coupletIndex = arg_1_0.coupletIndex - 1

		arg_1_0:selectCoupletChange()
	end)
	onButton(arg_1_0, arg_1_0.btnNext, function()
		arg_1_0.coupletIndex = arg_1_0.coupletIndex + 1

		arg_1_0:selectCoupletChange()
	end)
	onButton(arg_1_0, arg_1_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.couplete_help.tip
		})
	end)
	onButton(arg_1_0, arg_1_0.charClick, function()
		if not arg_1_0.charClickCount then
			arg_1_0.charClickCount = 0
		end

		arg_1_0.charClickCount = arg_1_0.charClickCount + 1

		if arg_1_0.charClickCount % 3 == 0 and not arg_1_0.coupletComplete and arg_1_0.coupletUnLock then
			arg_1_0:showTips(i18n(var_0_13, i18n("couplete_pair_" .. arg_1_0.coupletIndex)), true)
		end
	end)
	onButton(arg_1_0, arg_1_0.taskBtnGo, function()
		arg_1_0:emit(ActivityMediator.ON_TASK_GO, arg_1_0.taskVO)
	end, SFX_PANEL)
	onButton(arg_1_0, arg_1_0.taskBtnGet, function()
		pg.m02:sendNotification(GAME.SUBMIT_TASK, {
			virtual = false,
			normal_submit = true,
			taskId = arg_1_0.taskVO.id
		})
		arg_1_0:showTips(i18n(var_0_15), true)
	end, SFX_PANEL)

	local var_1_2 = Ship.New({
		configId = 502011,
		skin_id = 502010
	}):getPrefab()

	PoolMgr.GetInstance():GetSpineChar(var_1_2, true, function(arg_10_0)
		arg_1_0.model = arg_10_0
		arg_1_0.model.transform.localScale = Vector3(0.7, 0.7, 0.7)
		arg_1_0.model.transform.localPosition = Vector3.zero

		arg_1_0.model.transform:SetParent(findTF(arg_1_0.charPos, "pos"), false)

		arg_1_0.anim = arg_1_0.model:GetComponent(typeof(SpineAnimUI))

		arg_1_0.anim:SetAction("stand", 0)
	end)
end

function var_0_0.OnShowFlush(arg_11_0)
	arg_11_0.tipStayIndex = var_0_20

	if arg_11_0.data1List and arg_11_0.data2List and #arg_11_0.data1List ~= #arg_11_0.data2List then
		arg_11_0:showTips(i18n(var_0_15))
	elseif arg_11_0.data1List and arg_11_0.data2List and #arg_11_0.data1List == #arg_11_0.data2List and not arg_11_0.coupletFinishAll then
		arg_11_0:showTips(i18n(var_0_17))
	elseif arg_11_0.coupletFinishAll then
		arg_11_0:showTips(i18n(var_0_14))
	end
end

function var_0_0.OnHideFlush(arg_12_0)
	setActive(arg_12_0.charTip, false)
end

function var_0_0.OnDataSetting(arg_13_0)
	if not arg_13_0.coupletIds then
		arg_13_0.coupletIds = arg_13_0.activity:getConfig("config_client").couplet
		arg_13_0.coupletDatas = {}

		for iter_13_0 = 1, #arg_13_0.coupletIds do
			local var_13_0 = pg.activity_spring_couplets[arg_13_0.coupletIds[iter_13_0]]

			table.insert(arg_13_0.coupletDatas, var_13_0)
		end
	end

	arg_13_0.taskProxy = getProxy(TaskProxy)

	local var_13_1 = arg_13_0.activity:getConfig("config_client").linkActID

	arg_13_0.taskActivity = getProxy(ActivityProxy):getActivityById(var_13_1)
	arg_13_0.taskGroup = arg_13_0.taskActivity:getConfig("config_data")
	arg_13_0.tipStayIndex = var_0_20

	return updateActivityTaskStatus(arg_13_0.taskActivity)
end

function var_0_0.onTimer(arg_14_0)
	if arg_14_0.tipStayIndex and arg_14_0.tipStayIndex > 0 then
		arg_14_0.tipStayIndex = arg_14_0.tipStayIndex - 1
	elseif arg_14_0.tipStayIndex == 0 then
		arg_14_0.tipStayIndex = -1

		arg_14_0:showTips(i18n(var_0_16), true)
	end

	if arg_14_0.charClickCount and arg_14_0.charClickCount > 0 then
		arg_14_0.charClickCount = arg_14_0.charClickCount - 1
	end
end

function var_0_0.OnFirstFlush(arg_15_0)
	arg_15_0:updateUI()
	arg_15_0:finishAll()
end

function var_0_0.OnUpdateFlush(arg_16_0)
	arg_16_0:updateUI()
end

function var_0_0.updateUI(arg_17_0)
	arg_17_0.data1 = arg_17_0.activity.data1
	arg_17_0.data2 = arg_17_0.activity.data2
	arg_17_0.data3 = arg_17_0.activity.data3
	arg_17_0.data1List = arg_17_0.activity.data1_list
	arg_17_0.data2List = arg_17_0.activity.data2_list
	arg_17_0.data3List = arg_17_0.activity.data3_list
	arg_17_0.coupletFinishAll = false

	if arg_17_0.data2List and #arg_17_0.data2List == #arg_17_0.coupletIds then
		arg_17_0.coupletFinishAll = true
	end

	arg_17_0.coupletIndex = 1

	for iter_17_0 = #arg_17_0.coupletIds, 1, -1 do
		local var_17_0 = arg_17_0.coupletIds[iter_17_0]

		if table.contains(arg_17_0.data1List, var_17_0) and not table.contains(arg_17_0.data2List, var_17_0) then
			arg_17_0.coupletIndex = iter_17_0
		end

		local var_17_1 = table.contains(arg_17_0.data2List, var_17_0) or false
		local var_17_2 = table.contains(arg_17_0.data1List, var_17_0) or false
		local var_17_3 = arg_17_0.items[iter_17_0]

		setActive(findTF(var_17_3, "got"), var_17_1 or false)
		setActive(findTF(var_17_3, "bgMask"), not var_17_2 or var_17_1 or false)
		setActive(findTF(var_17_3, "red"), var_17_2)
		setActive(findTF(var_17_3, "lock"), not var_17_2 or false)

		if iter_17_0 == 7 then
			setActive(findTF(arg_17_0.finalAward, "lock"), not var_17_2 or false)
			setActive(findTF(arg_17_0.finalAward, "mask"), not var_17_2 or var_17_1 or false)
			setActive(findTF(arg_17_0.finalAward, "got"), arg_17_0.coupletFinishAll)
		end
	end

	arg_17_0:selectCoupletChange()
	arg_17_0:updateCoupletWord()
	arg_17_0:updateTask()
end

function var_0_0.finishAll(arg_18_0)
	if #arg_18_0.data2List == #arg_18_0.coupletIds and #arg_18_0.data2List == #arg_18_0.data1List and arg_18_0.activity.data1 == 0 then
		pg.m02:sendNotification(GAME.PUZZLE_PIECE_OP, {
			cmd = 1,
			actId = arg_18_0.activity.id
		})
	end
end

function var_0_0.updateTask(arg_19_0)
	arg_19_0.nday = arg_19_0.taskActivity.data3

	local var_19_0 = arg_19_0.taskGroup[arg_19_0.nday][1]
	local var_19_1 = arg_19_0.taskProxy:getTaskById(var_19_0) or arg_19_0.taskProxy:getFinishTaskById(var_19_0)

	arg_19_0.taskVO = var_19_1

	local var_19_2 = var_19_1:getConfig("award_display")[1]
	local var_19_3 = {
		type = var_19_2[1],
		id = var_19_2[2],
		count = var_19_2[3]
	}

	updateDrop(arg_19_0.awardIcon, var_19_3)
	onButton(arg_19_0, arg_19_0.taskIcon, function()
		arg_19_0:emit(BaseUI.ON_DROP, var_19_3)
	end, SFX_PANEL)

	local var_19_4 = var_19_1:getConfig("desc")

	setText(arg_19_0.taskDesc, var_19_4)

	local var_19_5 = var_19_1:getTaskStatus()

	setActive(arg_19_0.taskBtnGo, var_19_5 == 0)
	setActive(arg_19_0.taskBtnGet, var_19_5 == 1)
	setActive(arg_19_0.taskBtnGot, var_19_5 == 2)

	local var_19_6 = var_19_1:getProgress()
	local var_19_7 = var_19_1:getConfig("target_num")

	setSlider(arg_19_0.taskSlider, 0, var_19_7, var_19_6)
	setText(arg_19_0.taskCur, var_19_6)
	setText(arg_19_0.taskMax, "/" .. var_19_7)
end

function var_0_0.finishCouplete(arg_21_0)
	if arg_21_0.coupletUnLock and not arg_21_0.coupletComplete then
		local var_21_0 = arg_21_0.coupletIds[arg_21_0.coupletIndex]
		local var_21_1 = arg_21_0.coupletDatas[arg_21_0.coupletIndex].repeated_jp

		for iter_21_0 = 1, #arg_21_0.coupletBottomWords do
			local var_21_2 = arg_21_0.coupletBottomWords[iter_21_0]
			local var_21_3 = false

			if var_21_2.index == var_21_2.swapIndex then
				var_21_3 = true
			elseif PLATFORM_CODE == PLATFORM_JP and var_21_1 and #var_21_1 > 0 then
				for iter_21_1 = 1, #var_21_1 do
					local var_21_4 = var_21_1[iter_21_1]

					if table.contains(var_21_4, var_21_2.index) and table.contains(var_21_4, var_21_2.swapIndex) then
						var_21_3 = true
					end
				end
			end

			if not var_21_3 then
				arg_21_0:showTips(var_0_19, true)

				return
			end
		end

		if table.contains(arg_21_0.data1List, var_21_0) and not table.contains(arg_21_0.activity.data2_list, var_21_0) then
			local var_21_5

			if #arg_21_0.activity.data2_list == #arg_21_0.coupletIds - 1 then
				function var_21_5(arg_22_0)
					arg_21_0:emit(ActivityMediator.NEXT_DISPLAY_AWARD, arg_22_0)
					arg_21_0:finishAll()
				end

				arg_21_0:showTips(i18n(var_0_14), true)
			else
				arg_21_0:showTips(var_0_18, true)
			end

			pg.m02:sendNotification(GAME.MEMORYBOOK_UNLOCK, {
				id = var_21_0,
				actId = arg_21_0.activity.id,
				awardCallback = var_21_5
			})
		end
	elseif not arg_21_0.coupletUnLock then
		-- block empty
	elseif arg_21_0.coupletComplete then
		-- block empty
	end
end

function var_0_0.selectCoupletChange(arg_23_0)
	if arg_23_0.coupletIndex > var_0_1 then
		arg_23_0.coupletIndex = 1
	end

	if arg_23_0.coupletIndex <= 0 then
		arg_23_0.coupletIndex = var_0_1
	end

	local var_23_0 = arg_23_0.coupletIds[arg_23_0.coupletIndex]

	arg_23_0.coupletComplete = table.contains(arg_23_0.data2List, var_23_0) or false
	arg_23_0.coupletUnLock = table.contains(arg_23_0.data1List, var_23_0) or false

	if not arg_23_0.coupletUnLock then
		arg_23_0.btnConfirm:GetComponent("UIGrayScale").enabled = true
		arg_23_0.btnConfirm:GetComponent("Image").raycastTarget = false

		setActive(arg_23_0.imgComplete, false)
		setActive(arg_23_0.btnConfirm, true)
	elseif arg_23_0.coupletComplete then
		setActive(arg_23_0.imgComplete, true)
		setActive(arg_23_0.btnConfirm, false)
	else
		arg_23_0.btnConfirm:GetComponent("UIGrayScale").enabled = false
		arg_23_0.btnConfirm:GetComponent("Image").raycastTarget = true

		setActive(arg_23_0.imgComplete, false)
		setActive(arg_23_0.btnConfirm, true)
	end

	arg_23_0:updateCoupletWord()
end

function var_0_0.updateCoupletWord(arg_24_0)
	local var_24_0 = GetSpriteFromAtlas(var_0_7, "couplet_" .. arg_24_0.coupletIndex .. "_list")

	setImageSprite(arg_24_0.coupletUpImg, var_24_0)
	setActive(arg_24_0.coupletUpContents, arg_24_0.coupletUnLock)
	setActive(arg_24_0.coupletUpLock, not arg_24_0.coupletUnLock)

	local var_24_1 = {}

	if not arg_24_0.coupletComplete then
		for iter_24_0 = 1, var_0_3 do
			table.insert(var_24_1, iter_24_0)
		end
	end

	for iter_24_1 = 1, #arg_24_0.coupletBottomWords do
		local var_24_2 = arg_24_0.coupletBottomWords[iter_24_1]
		local var_24_3

		if #var_24_1 > 0 then
			var_24_3 = table.remove(var_24_1, math.random(1, #var_24_1))
		else
			var_24_3 = iter_24_1
		end

		var_24_2.swapIndex = var_24_3
		var_24_2.tf.anchoredPosition = arg_24_0:getWordPosition(var_24_3)

		setImageSprite(findTF(var_24_2.tf, "img"), GetSpriteFromAtlas(var_0_7, "couplet_" .. arg_24_0.coupletIndex .. "_" .. var_24_2.index), true)

		local var_24_4 = false
		local var_24_5 = arg_24_0.coupletDatas[arg_24_0.coupletIndex].repeated_jp

		if var_24_2.index == var_24_2.swapIndex then
			var_24_4 = var_24_2.index == var_24_2.swapIndex
		elseif PLATFORM_CODE == PLATFORM_JP and var_24_5 and #var_24_5 > 0 then
			for iter_24_2 = 1, #var_24_5 do
				local var_24_6 = var_24_5[iter_24_2]

				if table.contains(var_24_6, var_24_2.index) and table.contains(var_24_6, var_24_2.swapIndex) then
					var_24_4 = true
				end
			end
		end

		setActive(findTF(var_24_2.tf, "bgOn"), var_24_4)
		GetComponent(findTF(var_24_2.tf, "bgOn"), typeof(Image)):SetNativeSize()
		GetComponent(findTF(var_24_2.tf, "bgOff"), typeof(Image)):SetNativeSize()
	end

	setActive(arg_24_0.coupletBottomContents, arg_24_0.coupletUnLock)
	setActive(arg_24_0.coupletBottomLock, not arg_24_0.coupletUnLock)
	setText(arg_24_0.countDesc, i18n(var_0_10, arg_24_0.coupletIndex))
end

function var_0_0.addCoupletWordEvent(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1.event
	local var_25_1 = arg_25_1.tf
	local var_25_2 = arg_25_1.parent

	var_25_0:AddBeginDragFunc(function(arg_26_0, arg_26_1)
		if arg_25_0.coupletUnLock and not arg_25_0.coupletComplete and not arg_25_0.swapWord then
			arg_25_0.swapWord = arg_25_1
		end
	end)
	var_25_0:AddDragFunc(function(arg_27_0, arg_27_1)
		if arg_25_0.swapWord then
			local var_27_0 = arg_27_1.position

			var_27_0.y = var_27_0.y

			local var_27_1 = arg_25_0._uiCamera:ScreenToWorldPoint(var_27_0)
			local var_27_2 = arg_25_0:getWordByPosition(var_27_1)

			if var_27_2 and arg_25_0.swapWord ~= var_27_2 then
				local var_27_3 = var_27_2.swapIndex

				var_27_2.swapIndex = arg_25_0.swapWord.swapIndex
				arg_25_0.swapWord.swapIndex = var_27_3

				arg_25_0:tweenWord(arg_25_0.swapWord)
				arg_25_0:tweenWord(var_27_2)
			end
		end
	end)
	var_25_0:AddDragEndFunc(function(arg_28_0, arg_28_1)
		arg_25_0.swapWord = nil
	end)
end

function var_0_0.createWord(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = tf(instantiate(arg_29_0.wordTpl))

	setParent(var_29_0, arg_29_2)
	setActive(var_29_0, true)

	var_29_0.anchoredPosition = arg_29_0:getWordPosition(arg_29_1)

	local var_29_1 = GetComponent(var_29_0, typeof(EventTriggerListener))

	return {
		tf = var_29_0,
		index = arg_29_1,
		swapIndex = arg_29_1,
		event = var_29_1,
		parent = arg_29_2
	}
end

function var_0_0.getWordByPosition(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.coupletBottomContents:InverseTransformPoint(arg_30_1)

	if math.abs(var_30_0.x) < var_0_4 / 2 then
		local var_30_1 = math.floor(math.abs((var_30_0.y - var_0_5 / 2) / var_0_5)) + 1

		for iter_30_0 = 1, #arg_30_0.coupletBottomWords do
			if arg_30_0.coupletBottomWords[iter_30_0].swapIndex == var_30_1 then
				return arg_30_0.coupletBottomWords[iter_30_0]
			end
		end
	end
end

function var_0_0.getWordPosition(arg_31_0, arg_31_1)
	local var_31_0 = (arg_31_1 - 1) % var_0_6
	local var_31_1 = math.floor((arg_31_1 - 1) / var_0_6)

	return Vector2(var_31_0 * var_0_4, -var_31_1 * var_0_5)
end

function var_0_0.tweenWord(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_1.swapIndex
	local var_32_1 = arg_32_0:getWordPosition(var_32_0)

	if LeanTween.isTweening(go(arg_32_1.tf)) then
		LeanTween.cancel(go(arg_32_1.tf))
	end

	LeanTween.value(go(arg_32_1.tf), arg_32_1.tf.anchoredPosition.y, var_32_1.y, 0.1):setOnUpdate(System.Action_float(function(arg_33_0)
		arg_32_1.tf.anchoredPosition = Vector2(arg_32_1.tf.anchoredPosition.x, arg_33_0)
	end)):setOnComplete(System.Action(function()
		local var_34_0 = false
		local var_34_1 = arg_32_0.coupletDatas[arg_32_0.coupletIndex].repeated_jp

		if arg_32_1.index == arg_32_1.swapIndex then
			var_34_0 = arg_32_1.index == arg_32_1.swapIndex
		elseif PLATFORM_CODE == PLATFORM_JP and var_34_1 and #var_34_1 > 0 then
			for iter_34_0 = 1, #var_34_1 do
				local var_34_2 = var_34_1[iter_34_0]

				if table.contains(var_34_2, arg_32_1.index) and table.contains(var_34_2, arg_32_1.swapIndex) then
					var_34_0 = true
				end
			end
		end

		setActive(findTF(arg_32_1.tf, "bgOn"), var_34_0)
	end))
end

function var_0_0.clearTween(arg_35_0)
	for iter_35_0 = 1, #arg_35_0.coupletBottomWords do
		local var_35_0 = arg_35_0.coupletBottomWords[iter_35_0]

		if LeanTween.isTweening(go(var_35_0.tf)) then
			LeanTween.cancel(go(var_35_0.tf))
		end
	end
end

function var_0_0.showTips(arg_36_0, arg_36_1, arg_36_2)
	if type(arg_36_1) == "table" then
		if arg_36_1 and #arg_36_1 > 0 then
			arg_36_0.tipTime = Time.realtimeSinceStartup

			local var_36_0 = i18n(arg_36_1[math.random(1, #arg_36_1)])

			setText(findTF(arg_36_0.charTip, "text"), var_36_0)
			setActive(arg_36_0.charTip, false)
			setActive(arg_36_0.charTip, true)
		end
	else
		arg_36_0.tipTime = Time.realtimeSinceStartup

		setText(findTF(arg_36_0.charTip, "text"), arg_36_1)
		setActive(arg_36_0.charTip, false)
		setActive(arg_36_0.charTip, true)
	end
end

function var_0_0.OnDestroy(arg_37_0)
	if arg_37_0.timer then
		arg_37_0.timer:Stop()

		arg_37_0.timer = nil
	end

	if arg_37_0.model then
		PoolMgr.GetInstance():ReturnSpineChar(502011, arg_37_0.model)
	end

	arg_37_0:clearTween()
end

return var_0_0
