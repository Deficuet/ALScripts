local var_0_0 = class("MedalDetailPanel")

function var_0_0.SetIconScale(arg_1_0, arg_1_1)
	arg_1_0._iconScale = Vector2.New(arg_1_1, arg_1_1)
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._go = arg_2_1
	arg_2_0._tf = arg_2_1.transform
	arg_2_0._parent = arg_2_2
	arg_2_0.UIMgr = pg.UIMgr.GetInstance()

	pg.DelegateInfo.New(arg_2_0)

	arg_2_0._mask = findTF(arg_2_0._tf, "mask")
	arg_2_0._medalIcon = findTF(arg_2_0._tf, "icon")
	arg_2_0._medalLock = findTF(arg_2_0._tf, "lock")
	arg_2_0._nameText = findTF(arg_2_0._tf, "name")
	arg_2_0._descText = findTF(arg_2_0._tf, "desc")
	arg_2_0._progressBG = findTF(arg_2_0._tf, "progress")
	arg_2_0._progressText = findTF(arg_2_0._tf, "progress/label")
	arg_2_0._conditionText = findTF(arg_2_0._tf, "condition")
	arg_2_0._stateText = findTF(arg_2_0._tf, "state")
	arg_2_0._prevBtn = findTF(arg_2_0._tf, "prevBtn")
	arg_2_0._nextBtn = findTF(arg_2_0._tf, "nextBtn")
	arg_2_0._closeBtn = findTF(arg_2_0._tf, "backbtn")

	onButton(arg_2_0, arg_2_0._mask, function()
		arg_2_0:SetActive(false)
	end, SFX_CANCEL)

	if arg_2_0._closeBtn then
		onButton(arg_2_0, arg_2_0._closeBtn, function()
			arg_2_0:SetActive(false)
		end, SFX_CANCEL)
	end

	onButton(arg_2_0, arg_2_0._prevBtn, function()
		arg_2_0._currentIndex = math.max(arg_2_0._currentIndex - 1, 1)

		arg_2_0:UpdateMedal()
	end)
	onButton(arg_2_0, arg_2_0._nextBtn, function()
		arg_2_0._currentIndex = math.min(arg_2_0._currentIndex + 1, #arg_2_0._medalGroup:getConfig("activity_medal_ids"))

		arg_2_0:UpdateMedal()
	end)
end

function var_0_0.SetMedalGroup(arg_7_0, arg_7_1)
	arg_7_0._medalGroup = arg_7_1
end

function var_0_0.SetCurrentIndex(arg_8_0, arg_8_1)
	arg_8_0._currentIndex = arg_8_1
end

function var_0_0.UpdateMedal(arg_9_0)
	local var_9_0 = arg_9_0._medalGroup:getConfig("activity_medal_ids")[arg_9_0._currentIndex]

	arg_9_0._medal = arg_9_0._medalGroup:GetMedalList()[var_9_0]

	local var_9_1 = pg.activity_medal_template[var_9_0]

	setText(arg_9_0._nameText, var_9_1.activity_medal_name)
	setText(arg_9_0._descText, var_9_1.activity_medal_desc)

	if arg_9_0._medal.timeStamp then
		LoadImageSpriteAsync("activitymedal/" .. var_9_0, arg_9_0._medalIcon, true)
	else
		LoadImageSpriteAsync("activitymedal/" .. var_9_0 .. "_l", arg_9_0._medalIcon, true)
	end

	arg_9_0._medalIcon.transform.localScale = arg_9_0._iconScale

	SetActive(arg_9_0._medalLock, not arg_9_0._medal.timeStamp)

	if arg_9_0._medal.timeStamp then
		setText(arg_9_0._conditionText, i18n("word_gain_date") .. pg.TimeMgr.GetInstance():CTimeDescC(arg_9_0._medal.timeStamp, "%Y/%m/%d"))
		setText(arg_9_0._progressText, i18n("word_unlock"))
	else
		setText(arg_9_0._conditionText, pg.task_data_template[var_9_1.task_id].desc)
		setText(arg_9_0._progressText, i18n("word_lock"))
	end

	local var_9_2 = findTF(arg_9_0._tf, "progress/lock")

	if var_9_2 then
		SetActive(var_9_2, not arg_9_0._medal.timeStamp)
	end

	local var_9_3 = arg_9_0._medalGroup:GetMedalGroupState()

	if var_9_3 == ActivityMedalGroup.STATE_EXPIRE then
		setText(arg_9_0._stateText, setColorStr(i18n("word_cant_gain_anymore"), "#73757f"))
	elseif var_9_3 == ActivityMedalGroup.STATE_CLOSE then
		setText(arg_9_0._stateText, setColorStr(i18n("word_activity_not_open"), "#ed4646"))
	end

	SetActive(arg_9_0._stateText, var_9_3 ~= ActivityMedalGroup.STATE_ACTIVE)
	SetActive(arg_9_0._prevBtn, arg_9_0._currentIndex ~= 1)
	SetActive(arg_9_0._nextBtn, arg_9_0._currentIndex ~= #arg_9_0._medalGroup:getConfig("activity_medal_ids"))
end

function var_0_0.SetActive(arg_10_0, arg_10_1)
	SetActive(arg_10_0._go, arg_10_1)

	arg_10_0._active = arg_10_1

	if arg_10_1 then
		pg.UIMgr.GetInstance():BlurPanel(arg_10_0._go, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})
	else
		pg.UIMgr.GetInstance():UnblurPanel(arg_10_0._go, arg_10_0._parent._tf)
	end
end

function var_0_0.IsActive(arg_11_0)
	return arg_11_0._active
end

function var_0_0.Dispose(arg_12_0)
	pg.DelegateInfo.Dispose(arg_12_0)
end

return var_0_0
