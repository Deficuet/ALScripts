local var_0_0 = class("PlantNaximofuPage", import(".TemplatePage.SkinTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.clickTime = nil
end

function var_0_0.initSkin(arg_2_0)
	arg_2_0.showItemNum = arg_2_0.activity.data3 < arg_2_0.itmeNum and arg_2_0.activity.data3 or arg_2_0.itmeNum
	arg_2_0.skinTf = findTF(arg_2_0._tf, "AD/skinPage")

	setActive(arg_2_0.skinTf, false)

	arg_2_0.descClose = findTF(arg_2_0._tf, "AD/skinPage/descClose")

	setText(arg_2_0.descClose, i18n("island_act_tips1"))

	arg_2_0.skinIndex = 1

	arg_2_0:pageUpdate()

	arg_2_0.bottom = findTF(arg_2_0.skinTf, "bottom")

	onButton(arg_2_0, arg_2_0.bottom, function()
		if arg_2_0.clickTime and Time.realtimeSinceStartup - arg_2_0.clickTime < 0.5 then
			return
		end

		arg_2_0.clickTime = Time.realtimeSinceStartup

		arg_2_0:displayWindow(false)

		if arg_2_0.playHandle then
			arg_2_0.playHandle()

			arg_2_0.playHandle = nil
		end
	end)
	onButton(arg_2_0, findTF(arg_2_0.skinTf, "leftGo/left"), function()
		if arg_2_0.clickTime and Time.realtimeSinceStartup - arg_2_0.clickTime < 0.5 then
			return
		end

		arg_2_0.clickTime = Time.realtimeSinceStartup

		if arg_2_0.skinIndex > 1 then
			local var_4_0 = arg_2_0.displayDayList[arg_2_0.skinIndex]

			arg_2_0.skinIndex = arg_2_0.skinIndex - 1

			arg_2_0:updateSkinUI()
			setActive(findTF(arg_2_0.skinTf, "skins/skin" .. var_4_0), true)
			arg_2_0:StartTimer(function()
				setActive(findTF(arg_2_0.skinTf, "skins/skin" .. var_4_0), false)
			end)
			findTF(arg_2_0.skinTf, "skins/skin" .. var_4_0):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_left")
		end
	end)
	onButton(arg_2_0, findTF(arg_2_0.skinTf, "rightGo/right"), function()
		if arg_2_0.clickTime and Time.realtimeSinceStartup - arg_2_0.clickTime < 0.5 then
			return
		end

		arg_2_0.clickTime = Time.realtimeSinceStartup

		if arg_2_0.displayDayList[arg_2_0.skinIndex] < arg_2_0.showItemNum then
			local var_6_0 = arg_2_0.displayDayList[arg_2_0.skinIndex]

			arg_2_0.skinIndex = arg_2_0.skinIndex + 1

			arg_2_0:updateSkinUI()
			setActive(findTF(arg_2_0.skinTf, "skins/skin" .. var_6_0), true)
			arg_2_0:StartTimer(function()
				setActive(findTF(arg_2_0.skinTf, "skins/skin" .. var_6_0), false)
			end)
			findTF(arg_2_0.skinTf, "skins/skin" .. arg_2_0.displayDayList[arg_2_0.skinIndex]):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_right")
		end
	end)

	for iter_2_0 = 1, #arg_2_0.displayDayList do
		local var_2_0 = arg_2_0.displayDayList[iter_2_0]

		onButton(arg_2_0, findTF(arg_2_0.skinTf, "page/" .. var_2_0), function()
			if arg_2_0.clickTime and Time.realtimeSinceStartup - arg_2_0.clickTime < 0.5 then
				return
			end

			arg_2_0.clickTime = Time.realtimeSinceStartup

			if arg_2_0.skinIndex ~= iter_2_0 then
				local var_8_0 = arg_2_0.displayDayList[arg_2_0.skinIndex]

				if arg_2_0.skinIndex < iter_2_0 then
					arg_2_0.skinIndex = arg_2_0.skinIndex + 1

					arg_2_0:updateSkinUI()
					setActive(findTF(arg_2_0.skinTf, "skins/skin" .. var_8_0), true)
					arg_2_0:StartTimer(function()
						setActive(findTF(arg_2_0.skinTf, "skins/skin" .. var_8_0), false)
					end)
					findTF(arg_2_0.skinTf, "skins/skin" .. arg_2_0.displayDayList[arg_2_0.skinIndex]):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_right")
				elseif arg_2_0.skinIndex > 1 then
					arg_2_0.skinIndex = arg_2_0.skinIndex - 1

					arg_2_0:updateSkinUI()
					setActive(findTF(arg_2_0.skinTf, "skins/skin" .. var_8_0), true)
					arg_2_0:StartTimer(function()
						setActive(findTF(arg_2_0.skinTf, "skins/skin" .. var_8_0), false)
					end)
					findTF(arg_2_0.skinTf, "skins/skin" .. var_8_0):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_left")
				end
			end
		end)
		setActive(findTF(arg_2_0.skinTf, "page/" .. var_2_0), var_2_0 <= arg_2_0.showItemNum)
	end
end

function var_0_0.UpdateTask(arg_11_0, arg_11_1, arg_11_2)
	var_0_0.super.UpdateTask(arg_11_0, arg_11_1, arg_11_2)

	local var_11_0 = arg_11_1 + 1
	local var_11_1 = arg_11_0.taskGroup[arg_11_0.nday][var_11_0]
	local var_11_2 = arg_11_0.taskProxy:getTaskById(var_11_1) or arg_11_0.taskProxy:getFinishTaskById(var_11_1)
	local var_11_3 = arg_11_0:findTF("get_btn", arg_11_2)

	onButton(arg_11_0, var_11_3, function()
		if arg_11_0.nday <= arg_11_0.itmeNum then
			function arg_11_0.playHandle()
				arg_11_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_11_2)
			end

			if arg_11_0:GetDayIndex(arg_11_0.displayDayList, arg_11_0.nday) then
				arg_11_0.skinIndex = arg_11_0:GetNextDayIndex(arg_11_0.displayDayList, arg_11_0.nday)

				arg_11_0:displayWindow(true)
			else
				arg_11_0.playHandle()

				arg_11_0.playHandle = nil
			end
		else
			arg_11_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_11_2)
		end
	end, SFX_PANEL)

	local var_11_4 = arg_11_0:findTF("got_btn", arg_11_2)

	onButton(arg_11_0, var_11_4, function()
		arg_11_0:displayWindow(true)
	end, SFX_PANEL)

	local var_11_5 = arg_11_0:findTF("review_btn", arg_11_0.bg)

	onButton(arg_11_0, var_11_5, function()
		arg_11_0:displayWindow(true)
	end, SFX_PANEL)
end

function var_0_0.GetDayIndex(arg_16_0, arg_16_1, arg_16_2)
	for iter_16_0, iter_16_1 in ipairs(arg_16_1) do
		if iter_16_1 == arg_16_2 then
			return iter_16_0
		end
	end
end

function var_0_0.GetNextDayIndex(arg_17_0, arg_17_1, arg_17_2)
	for iter_17_0, iter_17_1 in ipairs(arg_17_1) do
		if arg_17_2 <= iter_17_1 then
			return iter_17_0
		end
	end

	return 1
end

function var_0_0.GetLastDay(arg_18_0, arg_18_1, arg_18_2)
	for iter_18_0, iter_18_1 in ipairs(arg_18_1) do
		if iter_18_1 == arg_18_2 then
			return arg_18_0.displayDayList[iter_18_0 - 1]
		end
	end

	return 0
end

function var_0_0.pageUpdate(arg_19_0)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.displayDayList) do
		setActive(findTF(arg_19_0.skinTf, "page/" .. iter_19_1), iter_19_1 <= arg_19_0.showItemNum)
		setActive(findTF(arg_19_0.skinTf, "page/" .. iter_19_1 .. "/selected"), arg_19_0.skinIndex == iter_19_0)
		setActive(findTF(arg_19_0.skinTf, "skins/skin" .. iter_19_1), arg_19_0.skinIndex == iter_19_0)

		findTF(arg_19_0.skinTf, "skins/skin" .. iter_19_1):GetComponent(typeof(Image)).fillAmount = 1
	end
end

function var_0_0.OnFirstFlush(arg_20_0)
	arg_20_0.displayDayList = arg_20_0.activity:getConfig("config_client").displayDay or {
		0,
		1,
		2,
		3,
		4,
		5,
		6,
		7
	}
	arg_20_0.itmeNum = #arg_20_0.activity:getConfig("config_data")

	var_0_0.super.OnFirstFlush(arg_20_0)

	arg_20_0.skinIndex = arg_20_0:GetNextDayIndex(arg_20_0.displayDayList, arg_20_0.activity.data3 > arg_20_0.itmeNum and 0 or arg_20_0.activity.data3)

	arg_20_0:initSkin()
end

function var_0_0.OnUpdateFlush(arg_21_0)
	arg_21_0.nday = arg_21_0.activity.data3

	local var_21_0 = arg_21_0.activity:getConfig("config_client").story

	if checkExist(var_21_0, {
		1
	}, {
		1
	}) then
		pg.NewStoryMgr.GetInstance():Play(var_21_0[1][1])
	end

	arg_21_0.uilist:align(#arg_21_0.taskGroup[arg_21_0.nday])
end

function var_0_0.updateSkinUI(arg_22_0)
	if arg_22_0.playHandle then
		setActive(findTF(arg_22_0.skinTf, "leftGo"), false)
		setActive(findTF(arg_22_0.skinTf, "rightGo"), false)
		setActive(findTF(arg_22_0.skinTf, "page"), false)
	else
		if arg_22_0.skinIndex > 1 then
			findTF(arg_22_0.skinTf, "leftGo/left"):GetComponent(typeof(CanvasGroup)).alpha = 1
		else
			findTF(arg_22_0.skinTf, "leftGo/left"):GetComponent(typeof(CanvasGroup)).alpha = 0.2
		end

		if arg_22_0.displayDayList[arg_22_0.skinIndex] < arg_22_0.showItemNum then
			findTF(arg_22_0.skinTf, "rightGo/right"):GetComponent(typeof(CanvasGroup)).alpha = 1
		else
			findTF(arg_22_0.skinTf, "rightGo/right"):GetComponent(typeof(CanvasGroup)).alpha = 0.2
		end

		setActive(findTF(arg_22_0.skinTf, "page"), true)
	end

	arg_22_0:pageUpdate()
end

function var_0_0.displayWindow(arg_23_0, arg_23_1)
	if arg_23_0.blurFlag == arg_23_1 then
		return
	end

	if arg_23_1 then
		setActive(arg_23_0.skinTf, true)
		arg_23_0.skinTf:GetComponent(typeof(Animation)):Play("anim_plantNaximofu_in")
		pg.UIMgr.GetInstance():BlurPanel(arg_23_0.skinTf, true)

		local var_23_0 = arg_23_0.taskGroup[arg_23_0.nday][1]
		local var_23_1 = (arg_23_0.taskProxy:getTaskById(var_23_0) or arg_23_0.taskProxy:getFinishTaskById(var_23_0)):getTaskStatus()

		arg_23_0.showItemNum = arg_23_0.activity.data3 < arg_23_0.itmeNum and arg_23_0.activity.data3 or arg_23_0.itmeNum

		if var_23_1 ~= 2 then
			arg_23_0.showItemNum = arg_23_0.showItemNum - 1
		end

		arg_23_0:updateSkinUI()

		if arg_23_0.playHandle then
			local var_23_2 = arg_23_0:GetLastDay(arg_23_0.displayDayList, arg_23_0.nday)

			setActive(findTF(arg_23_0.skinTf, "skins/skin" .. var_23_2), true)
			arg_23_0:StartTimer(function()
				setActive(findTF(arg_23_0.skinTf, "skins/skin" .. var_23_2), false)
			end)
			findTF(arg_23_0.skinTf, "skins/skin" .. arg_23_0.displayDayList[arg_23_0.skinIndex]):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_right")
		end
	else
		pg.UIMgr.GetInstance():UnblurPanel(arg_23_0.skinTf)
		arg_23_0.skinTf:GetComponent(typeof(Animation)):Play("anim_plantNaximofu_out")
		arg_23_0:StartTimer(function()
			setActive(arg_23_0.skinTf, false)
			SetParent(arg_23_0.skinTf, arg_23_0._tf)
		end)
	end

	arg_23_0.blurFlag = arg_23_1
end

function var_0_0.StartTimer(arg_26_0, arg_26_1)
	arg_26_0:RemoveTimer()

	arg_26_0.timer = Timer.New(arg_26_1, 0.5, 1)

	arg_26_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_27_0)
	if arg_27_0.timer then
		arg_27_0.timer:Stop()

		arg_27_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_28_0)
	var_0_0.super.OnDestroy(arg_28_0)
	arg_28_0:displayWindow(false)
	arg_28_0:RemoveTimer()
end

function var_0_0.GetProgressColor(arg_29_0)
	return "#34480CFF", "#34480C66"
end

return var_0_0
