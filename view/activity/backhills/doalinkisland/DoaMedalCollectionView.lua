local var_0_0 = class("DoaMedalCollectionView", import("view.base.BaseUI"))

var_0_0.FADE_OUT_TIME = 1
var_0_0.PAGE_NUM = 7
var_0_0.MEDAL_NUM_PER_PAGE = 2

function var_0_0.getUIName(arg_1_0)
	return "DoaMedalCollectionUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:checkAward()
	setText(arg_3_0.progressText, setColorStr(tostring(#arg_3_0.activeIDList), COLOR_WHITE) .. "/" .. #arg_3_0.allIDList)
	triggerToggle(arg_3_0.switchBtnList[1], true)
end

function var_0_0.willExit(arg_4_0)
	if LeanTween.isTweening(go(arg_4_0.picture)) then
		LeanTween.cancel(go(arg_4_0.picture), false)
	end
end

function var_0_0.getBGM(arg_5_0)
	return math.random() > 0.5 and "doa_main_day" or "doa_main_night"
end

function var_0_0.initData(arg_6_0)
	arg_6_0.activityProxy = getProxy(ActivityProxy)
	arg_6_0.activityData = arg_6_0.activityProxy:getActivityById(ActivityConst.DOA_MEDAL_ACT_ID)
	arg_6_0.allIDList = arg_6_0.activityData:GetPicturePuzzleIds()

	print(#arg_6_0.allIDList)

	arg_6_0.pageIDList = {}

	for iter_6_0 = 1, var_0_0.PAGE_NUM do
		arg_6_0.pageIDList[iter_6_0] = {}

		for iter_6_1 = 1, var_0_0.MEDAL_NUM_PER_PAGE do
			arg_6_0.pageIDList[iter_6_0][iter_6_1] = arg_6_0.allIDList[(iter_6_0 - 1) * var_0_0.MEDAL_NUM_PER_PAGE + iter_6_1]
		end
	end

	arg_6_0.activatableIDList = arg_6_0.activityData.data1_list
	arg_6_0.activeIDList = arg_6_0.activityData.data2_list
	arg_6_0.curPage = nil
	arg_6_0.newMedalID = nil
end

function var_0_0.findUI(arg_7_0)
	arg_7_0.bg = arg_7_0._tf:Find("BG")

	local var_7_0 = arg_7_0._tf:Find("NotchAdapt")

	arg_7_0.backBtn = var_7_0:Find("BackBtn")
	arg_7_0.progressText = var_7_0:Find("ProgressImg/ProgressText")
	arg_7_0.helpBtn = var_7_0:Find("HelpBtn")

	local var_7_1 = arg_7_0._tf:Find("SwitchBtnList")

	arg_7_0.tplButtom = findTF(var_7_1, "tplButtom")
	arg_7_0.imgGot = var_7_0:Find("ProgressImg/got")
	arg_7_0.switchBtnList = {}
	arg_7_0.medalTfList = {}

	for iter_7_0 = 1, var_0_0.PAGE_NUM do
		local var_7_2 = tf(instantiate(go(arg_7_0.tplButtom)))

		LoadSpriteAtlasAsync("ui/doamedalcollectionui_atlas", "ship" .. iter_7_0 .. "Icon", function(arg_8_0)
			if var_7_2 then
				setImageSprite(findTF(var_7_2, "icon"), arg_8_0, true)
			end
		end)
		LoadSpriteAtlasAsync("ui/doamedalcollectionui_atlas", "ship" .. iter_7_0 .. "Name", function(arg_9_0)
			if var_7_2 then
				setImageSprite(findTF(var_7_2, "name"), arg_9_0, true)
			end
		end)
		LoadSpriteAtlasAsync("ui/doamedalcollectionui_atlas", "ship" .. iter_7_0 .. "NameSelect", function(arg_10_0)
			if var_7_2 then
				setImageSprite(findTF(var_7_2, "nameSelect"), arg_10_0, true)
			end
		end)
		setParent(var_7_2, var_7_1)
		setActive(var_7_2, true)
		table.insert(arg_7_0.switchBtnList, var_7_2)

		for iter_7_1 = 1, var_0_0.MEDAL_NUM_PER_PAGE do
			local var_7_3 = (iter_7_0 - 1) * var_0_0.MEDAL_NUM_PER_PAGE + iter_7_1
			local var_7_4 = findTF(arg_7_0._tf, "MedalContainer/medal" .. var_7_3)

			setActive(var_7_4, false)
			GetComponent(findTF(var_7_4, "disAcive/lock"), typeof(Image)):SetNativeSize()
			GetComponent(findTF(var_7_4, "disAcive/unlock"), typeof(Image)):SetNativeSize()
			table.insert(arg_7_0.medalTfList, var_7_4)
		end
	end

	arg_7_0.picture = findTF(arg_7_0._tf, "picture")
	arg_7_0.pictureName = findTF(arg_7_0._tf, "picture/name")
	arg_7_0.leftPage = findTF(arg_7_0._tf, "book/leftPage")
	arg_7_0.rightPage = findTF(arg_7_0._tf, "book/rightPage")
end

function var_0_0.addListener(arg_11_0)
	onButton(arg_11_0, arg_11_0.backBtn, function()
		arg_11_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.doa_collection.tip
		})
	end, SFX_PANEL)

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.switchBtnList) do
		onToggle(arg_11_0, iter_11_1, function(arg_14_0)
			if arg_14_0 == true then
				local var_14_0 = arg_11_0.curPage ~= iter_11_0

				arg_11_0.curPage = iter_11_0

				arg_11_0:updateSwitchBtnTF()
				arg_11_0:updateMedalContainerView(iter_11_0, var_14_0)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateActivity(arg_15_0, arg_15_1)
	arg_15_0:checkAward()
end

function var_0_0.updateMedalContainerView(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.pageIDList[arg_16_1]

	if arg_16_2 then
		setActive(arg_16_0.picture, false)
		LoadSpriteAtlasAsync("ui/doamedalcollectionui_atlas", "pictureImage" .. arg_16_1, function(arg_17_0)
			setImageSprite(arg_16_0.picture, arg_17_0, true)

			if LeanTween.isTweening(go(arg_16_0.picture)) then
				LeanTween.cancel(go(arg_16_0.picture), false)
			end

			LeanTween.value(go(arg_16_0.picture), 0, 1, 0.3):setOnUpdate(System.Action_float(function(arg_18_0)
				GetComponent(arg_16_0.picture, typeof(CanvasGroup)).alpha = arg_18_0
			end))
			setActive(arg_16_0.picture, true)
		end)
	else
		setActive(arg_16_0.picture, true)
		LoadSpriteAtlasAsync("ui/doamedalcollectionui_atlas", "pictureImage" .. arg_16_1, function(arg_19_0)
			setImageSprite(arg_16_0.picture, arg_19_0, true)
		end)
	end

	LoadSpriteAtlasAsync("ui/doamedalcollectionui_atlas", "pictureName" .. arg_16_1, function(arg_20_0)
		setImageSprite(arg_16_0.pictureName, arg_20_0, true)
	end)

	for iter_16_0 = 1, #arg_16_0.medalTfList do
		local var_16_1 = (arg_16_1 - 1) * var_0_0.MEDAL_NUM_PER_PAGE
		local var_16_2 = (arg_16_1 - 1) * var_0_0.MEDAL_NUM_PER_PAGE + var_0_0.MEDAL_NUM_PER_PAGE

		if var_16_1 < iter_16_0 and iter_16_0 <= var_16_2 then
			setActive(arg_16_0.medalTfList[iter_16_0], true)
		else
			setActive(arg_16_0.medalTfList[iter_16_0], false)
		end
	end

	for iter_16_1, iter_16_2 in ipairs(var_16_0) do
		arg_16_0:updateMedalView(var_16_0, iter_16_2)
	end
end

function var_0_0.updateMedalView(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = table.contains(arg_21_0.activeIDList, arg_21_2)
	local var_21_1 = table.contains(arg_21_0.activatableIDList, arg_21_2) and not var_21_0
	local var_21_2

	var_21_2 = not var_21_0 and not var_21_1

	local var_21_3 = table.indexof(arg_21_1, arg_21_2, 1)
	local var_21_4 = (arg_21_0.curPage - 1) * var_0_0.MEDAL_NUM_PER_PAGE + var_21_3
	local var_21_5 = arg_21_0.medalTfList[var_21_4]

	if var_21_0 then
		setActive(findTF(var_21_5, "isActive"), true)
		setActive(findTF(var_21_5, "disAcive"), false)
	else
		setActive(findTF(var_21_5, "isActive"), false)
		setActive(findTF(var_21_5, "disAcive"), true)

		if var_21_1 then
			onButton(arg_21_0, findTF(var_21_5, "disAcive"), function()
				pg.m02:sendNotification(GAME.MEMORYBOOK_UNLOCK, {
					id = arg_21_2,
					actId = arg_21_0.activityData.id
				})
			end, SFX_PANEL)
			setActive(findTF(var_21_5, "disAcive/lock"), false)
			setActive(findTF(var_21_5, "disAcive/unlock"), true)
		else
			setActive(findTF(var_21_5, "disAcive/lock"), true)
			setActive(findTF(var_21_5, "disAcive/unlock"), false)
		end
	end
end

function var_0_0.updateSwitchBtnTF(arg_23_0)
	setText(arg_23_0.leftPage, (arg_23_0.curPage - 1) * var_0_0.MEDAL_NUM_PER_PAGE + 1)
	setText(arg_23_0.rightPage, (arg_23_0.curPage - 1) * var_0_0.MEDAL_NUM_PER_PAGE + 2)

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.switchBtnList) do
		local var_23_0 = iter_23_1:Find("Tip")
		local var_23_1 = arg_23_0:caculateActivatable(iter_23_0)

		if var_23_1 == 0 or iter_23_0 == arg_23_0.curPage then
			setActive(var_23_0, false)
		end

		if var_23_1 > 0 and iter_23_0 ~= arg_23_0.curPage then
			setActive(var_23_0, true)
		end
	end
end

function var_0_0.updateAfterSubmit(arg_24_0, arg_24_1)
	arg_24_0.activityProxy = getProxy(ActivityProxy)
	arg_24_0.activityData = arg_24_0.activityProxy:getActivityById(ActivityConst.DOA_MEDAL_ACT_ID)
	arg_24_0.activatableIDList = arg_24_0.activityData.data1_list
	arg_24_0.activeIDList = arg_24_0.activityData.data2_list
	arg_24_0.newMedalID = arg_24_1

	triggerToggle(arg_24_0.switchBtnList[arg_24_0.curPage], true)
	setText(arg_24_0.progressText, setColorStr(tostring(#arg_24_0.activeIDList), COLOR_WHITE) .. "/" .. #arg_24_0.allIDList)
	arg_24_0:checkAward()
end

function var_0_0.caculateActivatable(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.pageIDList[arg_25_1]
	local var_25_1 = 0

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		local var_25_2 = table.contains(arg_25_0.activeIDList, iter_25_1)
		local var_25_3 = table.contains(arg_25_0.activatableIDList, iter_25_1)

		if not var_25_2 and var_25_3 then
			var_25_1 = var_25_1 + 1
		end
	end

	return var_25_1
end

function var_0_0.checkAward(arg_26_0)
	setActive(arg_26_0.imgGot, #arg_26_0.activeIDList == #arg_26_0.allIDList and arg_26_0.activityData.data1 == 1)

	if #arg_26_0.activeIDList == #arg_26_0.allIDList and arg_26_0.activityData.data1 ~= 1 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = ActivityConst.DOA_MEDAL_ACT_ID
		})
		setActive(arg_26_0.imgGot, true)
	end
end

return var_0_0
