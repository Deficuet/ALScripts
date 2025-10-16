local var_0_0 = class("ZhenhaiMuseumPage", import(".TemplatePage.SkinTemplatePage"))
local var_0_1 = 7
local var_0_2

function var_0_0.initSkin(arg_1_0)
	arg_1_0.showItemNum = arg_1_0.activity.data3 < var_0_1 and arg_1_0.activity.data3 or var_0_1
	arg_1_0.skinTf = findTF(arg_1_0._tf, "AD/skinPage")

	setActive(arg_1_0.skinTf, false)

	arg_1_0.descClose = findTF(arg_1_0._tf, "AD/skinPage/descClose")

	setText(arg_1_0.descClose, i18n("island_act_tips1"))

	arg_1_0.skinIndex = 0

	arg_1_0:pageUpdate()

	arg_1_0.bottom = findTF(arg_1_0.skinTf, "bottom")

	onButton(arg_1_0, arg_1_0.bottom, function()
		if var_0_2 and Time.realtimeSinceStartup - var_0_2 < 0.5 then
			return
		end

		var_0_2 = Time.realtimeSinceStartup

		if arg_1_0.playHandle then
			arg_1_0.playHandle()

			arg_1_0.playHandle = nil
		end

		arg_1_0:displayWindow(false)
	end)
	onButton(arg_1_0, findTF(arg_1_0.skinTf, "left"), function()
		if var_0_2 and Time.realtimeSinceStartup - var_0_2 < 0.5 then
			return
		end

		var_0_2 = Time.realtimeSinceStartup

		if arg_1_0.skinIndex > 0 then
			local var_3_0 = arg_1_0.skinIndex

			arg_1_0.skinIndex = arg_1_0.skinIndex - 1

			arg_1_0:updateSkinUI()
			setActive(findTF(arg_1_0.skinTf, "skins/skin" .. var_3_0), true)
			arg_1_0:StartTimer(function()
				setActive(findTF(arg_1_0.skinTf, "skins/skin" .. var_3_0), false)
			end)
			findTF(arg_1_0.skinTf, "skins/skin" .. var_3_0):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_left")
		end
	end)
	onButton(arg_1_0, findTF(arg_1_0.skinTf, "right"), function()
		if var_0_2 and Time.realtimeSinceStartup - var_0_2 < 0.5 then
			return
		end

		var_0_2 = Time.realtimeSinceStartup

		if arg_1_0.skinIndex < arg_1_0.showItemNum then
			local var_5_0 = arg_1_0.skinIndex

			arg_1_0.skinIndex = arg_1_0.skinIndex + 1

			arg_1_0:updateSkinUI()
			setActive(findTF(arg_1_0.skinTf, "skins/skin" .. var_5_0), true)
			arg_1_0:StartTimer(function()
				setActive(findTF(arg_1_0.skinTf, "skins/skin" .. var_5_0), false)
			end)
			findTF(arg_1_0.skinTf, "skins/skin" .. arg_1_0.skinIndex):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_right")
		end
	end)

	for iter_1_0 = 0, var_0_1 do
		onButton(arg_1_0, findTF(arg_1_0.skinTf, "page/" .. iter_1_0), function()
			if var_0_2 and Time.realtimeSinceStartup - var_0_2 < 0.5 then
				return
			end

			var_0_2 = Time.realtimeSinceStartup

			if arg_1_0.skinIndex ~= iter_1_0 then
				local var_7_0 = arg_1_0.skinIndex

				if arg_1_0.skinIndex < iter_1_0 then
					arg_1_0.skinIndex = arg_1_0.skinIndex + 1

					arg_1_0:updateSkinUI()
					setActive(findTF(arg_1_0.skinTf, "skins/skin" .. var_7_0), true)
					arg_1_0:StartTimer(function()
						setActive(findTF(arg_1_0.skinTf, "skins/skin" .. var_7_0), false)
					end)
					findTF(arg_1_0.skinTf, "skins/skin" .. arg_1_0.skinIndex):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_right")
				else
					arg_1_0.skinIndex = arg_1_0.skinIndex - 1

					arg_1_0:updateSkinUI()
					setActive(findTF(arg_1_0.skinTf, "skins/skin" .. var_7_0), true)
					arg_1_0:StartTimer(function()
						setActive(findTF(arg_1_0.skinTf, "skins/skin" .. var_7_0), false)
					end)
					findTF(arg_1_0.skinTf, "skins/skin" .. var_7_0):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_left")
				end
			end
		end)
		setActive(findTF(arg_1_0.skinTf, "page/" .. iter_1_0), iter_1_0 <= arg_1_0.showItemNum)
	end

	setActive(arg_1_0.skinTf, false)
end

function var_0_0.UpdateTask(arg_10_0, arg_10_1, arg_10_2)
	var_0_0.super.UpdateTask(arg_10_0, arg_10_1, arg_10_2)

	local var_10_0 = arg_10_1 + 1
	local var_10_1 = arg_10_0.taskGroup[arg_10_0.nday][var_10_0]
	local var_10_2 = arg_10_0.taskProxy:getTaskById(var_10_1) or arg_10_0.taskProxy:getFinishTaskById(var_10_1)
	local var_10_3 = arg_10_2:Find("get_btn")

	onButton(arg_10_0, var_10_3, function()
		if arg_10_0.nday <= var_0_1 then
			arg_10_0.skinIndex = arg_10_0.nday

			function arg_10_0.playHandle()
				arg_10_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_10_2)
			end

			arg_10_0:displayWindow(true)
		else
			arg_10_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_10_2)
		end
	end, SFX_PANEL)

	local var_10_4 = arg_10_2:Find("got_btn")

	onButton(arg_10_0, var_10_4, function()
		arg_10_0:displayWindow(true)
	end, SFX_PANEL)

	local var_10_5 = arg_10_0.bg:Find("review_btn")

	onButton(arg_10_0, var_10_5, function()
		arg_10_0:displayWindow(true)
	end, SFX_PANEL)
end

function var_0_0.pageUpdate(arg_15_0)
	for iter_15_0 = 0, var_0_1 do
		setActive(findTF(arg_15_0.skinTf, "page/" .. iter_15_0), iter_15_0 <= arg_15_0.showItemNum)
		setActive(findTF(arg_15_0.skinTf, "page/" .. iter_15_0 .. "/selected"), arg_15_0.skinIndex == iter_15_0)
		setActive(findTF(arg_15_0.skinTf, "skins/skin" .. iter_15_0), arg_15_0.skinIndex == iter_15_0)

		findTF(arg_15_0.skinTf, "skins/skin" .. iter_15_0):GetComponent(typeof(Image)).fillAmount = 1
	end
end

function var_0_0.OnFirstFlush(arg_16_0)
	var_0_0.super.OnFirstFlush(arg_16_0)

	arg_16_0.skinIndex = arg_16_0.activity.data3 > var_0_1 and 0 or arg_16_0.activity.data3

	arg_16_0:initSkin()
end

function var_0_0.OnUpdateFlush(arg_17_0)
	arg_17_0.nday = arg_17_0.activity.data3

	local var_17_0 = arg_17_0.activity:getConfig("config_client").story

	if checkExist(var_17_0, {
		1
	}, {
		1
	}) then
		pg.NewStoryMgr.GetInstance():Play(var_17_0[1][1])
	end

	arg_17_0.uilist:align(#arg_17_0.taskGroup[arg_17_0.nday])
end

function var_0_0.updateSkinUI(arg_18_0)
	if arg_18_0.playHandle then
		setActive(findTF(arg_18_0.skinTf, "left"), false)
		setActive(findTF(arg_18_0.skinTf, "right"), false)
		setActive(findTF(arg_18_0.skinTf, "page"), false)
	else
		setActive(findTF(arg_18_0.skinTf, "left"), arg_18_0.skinIndex > 0)
		setActive(findTF(arg_18_0.skinTf, "right"), arg_18_0.skinIndex < arg_18_0.showItemNum)
		setActive(findTF(arg_18_0.skinTf, "page"), true)
	end

	arg_18_0:pageUpdate()
end

function var_0_0.displayWindow(arg_19_0, arg_19_1)
	if arg_19_0.blurFlag == arg_19_1 then
		return
	end

	if arg_19_1 then
		setActive(arg_19_0.skinTf, true)
		arg_19_0.skinTf:GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_in")
		pg.UIMgr.GetInstance():BlurPanel(arg_19_0.skinTf, {
			staticBlur = true
		})

		local var_19_0 = arg_19_0.taskGroup[arg_19_0.nday][1]
		local var_19_1 = (arg_19_0.taskProxy:getTaskById(var_19_0) or arg_19_0.taskProxy:getFinishTaskById(var_19_0)):getTaskStatus()

		arg_19_0.showItemNum = arg_19_0.activity.data3 < var_0_1 and arg_19_0.activity.data3 or var_0_1

		if var_19_1 ~= 2 then
			arg_19_0.showItemNum = arg_19_0.showItemNum - 1
		end

		arg_19_0:updateSkinUI()

		if arg_19_0.playHandle then
			local var_19_2 = arg_19_0.nday - 1

			setActive(findTF(arg_19_0.skinTf, "skins/skin" .. var_19_2), true)
			arg_19_0:StartTimer(function()
				setActive(findTF(arg_19_0.skinTf, "skins/skin" .. var_19_2), false)
			end)
			findTF(arg_19_0.skinTf, "skins/skin" .. arg_19_0.skinIndex):GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_skin_right")
		end
	else
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_19_0.skinTf)
		arg_19_0.skinTf:GetComponent(typeof(Animation)):Play("anim_zhenhaimuseum_out")
		arg_19_0:StartTimer(function()
			setActive(arg_19_0.skinTf, false)
		end)
	end

	arg_19_0.blurFlag = arg_19_1
end

function var_0_0.StartTimer(arg_22_0, arg_22_1)
	arg_22_0:RemoveTimer()

	arg_22_0.timer = Timer.New(arg_22_1, 0.5, 1)

	arg_22_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_23_0)
	if arg_23_0.timer then
		arg_23_0.timer:Stop()

		arg_23_0.timer = nil
	end
end

function var_0_0.OnDestroy(arg_24_0)
	var_0_0.super.OnDestroy(arg_24_0)
	arg_24_0:displayWindow(false)
	arg_24_0:RemoveTimer()
end

function var_0_0.GetProgressColor(arg_25_0)
	return "#435271", "#5D7B97"
end

return var_0_0
