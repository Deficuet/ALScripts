local var_0_0 = class("LinkLinkScene", import("..base.BaseUI"))

var_0_0.MAX_ROW = 6
var_0_0.MAX_COLUMN = 11
var_0_0.COUNT_DOWN = 3
var_0_0.RESET_CD = 5
var_0_0.GAME_STATE_BEGIN = 0
var_0_0.GAME_STATE_GAMING = 1
var_0_0.GAME_STATE_END = 2
var_0_0.CARD_STATE_NORMAL = 0
var_0_0.CARD_STATE_LINKED = 1
var_0_0.CARD_STATE_BLANK = 2

function var_0_0.getUIName(arg_1_0)
	return "LinkLinkUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.backBtn = arg_2_0._tf:Find("BackBtn")
	arg_2_0.helpBtn = arg_2_0._tf:Find("top/help_btn")
	arg_2_0.resetBtn = arg_2_0._tf:Find("info/reset_button")
	arg_2_0.awardTxt = arg_2_0._tf:Find("info/award_txt")
	arg_2_0.timeTxt = arg_2_0._tf:Find("info/time_txt")
	arg_2_0.bestTxt = arg_2_0._tf:Find("info/best_txt")
	arg_2_0.layout = arg_2_0._tf:Find("card_con/layout")
	arg_2_0.item = arg_2_0.layout:Find("card")
	arg_2_0.bottom = arg_2_0._tf:Find("card_con/bottom")
	arg_2_0.line = arg_2_0.bottom:Find("card")
	arg_2_0.result = arg_2_0._tf:Find("result")
	arg_2_0.countDown = arg_2_0._tf:Find("count_down")
	arg_2_0.resource = arg_2_0._tf:Find("resource")
	arg_2_0.bestTitleText = arg_2_0._tf:Find("info/BestTitle")
	arg_2_0.curTitleText = arg_2_0._tf:Find("info/CurTitle")

	setText(arg_2_0.bestTitleText, i18n("LinkLinkGame_BestTime"))
	setText(arg_2_0.curTitleText, i18n("LinkLinkGame_CurTime"))
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)
	arg_3_0:SetState(var_0_0.GAME_STATE_BEGIN)
end

function var_0_0.willExit(arg_5_0)
	arg_5_0:HideResult()
	LeanTween.cancel(go(arg_5_0.countDown))

	for iter_5_0 = 0, arg_5_0.layout.childCount - 1 do
		LeanTween.cancel(go(arg_5_0.layout:GetChild(iter_5_0)))
	end

	if arg_5_0.countTimer then
		arg_5_0.countTimer:Stop()

		arg_5_0.countTimer = nil
	end
end

function var_0_0.SetPlayer(arg_6_0, arg_6_1)
	arg_6_0.player = arg_6_1
end

function var_0_0.SetActivity(arg_7_0, arg_7_1)
	arg_7_0.activity = arg_7_1
	arg_7_0.activityAchieved = arg_7_1.data1
	arg_7_0.activityProgress = arg_7_1.data2
	arg_7_0.activityStartTime = arg_7_1.data3
	arg_7_0.activityBestRecord = arg_7_1.data4

	local var_7_0 = arg_7_0.activity:getConfig("config_client")[3]
	local var_7_1 = pg.TimeMgr.GetInstance()

	arg_7_0.activityRestTimes = var_7_1:DiffDay(arg_7_0.activityStartTime, var_7_1:GetServerTime()) + 1 - arg_7_0.activityProgress
	arg_7_0.activityRestTimes = math.clamp(arg_7_0.activityRestTimes, 0, #var_7_0 - arg_7_0.activityProgress)

	setText(arg_7_0.awardTxt, arg_7_0.activityRestTimes > 0 and var_7_0[arg_7_0.activityProgress + 1] or 0)
	setText(arg_7_0.bestTxt, arg_7_0:FormatRecordTime(arg_7_0.activityBestRecord))
end

function var_0_0.SetState(arg_8_0, arg_8_1)
	if arg_8_0.state ~= arg_8_1 then
		arg_8_0.state = arg_8_1

		if arg_8_1 == var_0_0.GAME_STATE_BEGIN then
			arg_8_0:GameBegin()
		elseif arg_8_1 == var_0_0.GAME_STATE_GAMING then
			arg_8_0:GameLoop()
		elseif arg_8_1 == var_0_0.GAME_STATE_END then
			arg_8_0:GameEnd()
		end
	end
end

function var_0_0.GameBegin(arg_9_0)
	arg_9_0.cards = {}

	local var_9_0 = {}

	for iter_9_0 = 0, 17 do
		table.insert(var_9_0, iter_9_0)
		table.insert(var_9_0, iter_9_0)
	end

	local var_9_1 = 0

	while #var_9_0 > 0 do
		local var_9_2 = math.clamp(math.floor(math.random() * #var_9_0 + 1), 1, #var_9_0)
		local var_9_3 = math.floor(var_9_1 / (var_0_0.MAX_COLUMN - 2)) + 1
		local var_9_4 = var_9_1 % (var_0_0.MAX_COLUMN - 2) + 1

		arg_9_0.cards[var_9_3] = arg_9_0.cards[var_9_3] or {}
		arg_9_0.cards[var_9_3][var_9_4] = {
			row = var_9_3,
			column = var_9_4,
			id = var_9_0[var_9_2],
			state = var_0_0.CARD_STATE_NORMAL
		}

		table.remove(var_9_0, var_9_2)

		var_9_1 = var_9_1 + 1
	end

	for iter_9_1 = 0, var_0_0.MAX_ROW - 1 do
		for iter_9_2 = 0, var_0_0.MAX_COLUMN - 1 do
			arg_9_0.cards[iter_9_1] = arg_9_0.cards[iter_9_1] or {}
			arg_9_0.cards[iter_9_1][iter_9_2] = arg_9_0.cards[iter_9_1][iter_9_2] or {
				row = iter_9_1,
				column = iter_9_2,
				state = var_0_0.CARD_STATE_BLANK
			}
		end
	end

	arg_9_0.list = UIItemList.New(arg_9_0.layout, arg_9_0.item)

	arg_9_0.list:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = math.floor(arg_10_1 / var_0_0.MAX_COLUMN)
			local var_10_1 = arg_10_1 % var_0_0.MAX_COLUMN
			local var_10_2 = arg_9_0.cards[var_10_0][var_10_1]

			arg_10_2.name = var_10_0 .. "_" .. var_10_1
			arg_10_2.localScale = Vector3.one

			setActive(arg_10_2:Find("display"), var_10_2.state == var_0_0.CARD_STATE_NORMAL)

			if var_10_2.state == var_0_0.CARD_STATE_NORMAL then
				local var_10_3 = getImageSprite(arg_9_0.resource:GetChild(var_10_2.id))

				setImageSprite(arg_10_2:Find("display/icon"), var_10_3)
				setActive(arg_10_2:Find("display/selected"), false)
			end
		end
	end)
	arg_9_0.list:align(var_0_0.MAX_ROW * var_0_0.MAX_COLUMN)

	arg_9_0.llist = UIItemList.New(arg_9_0.bottom, arg_9_0.line)

	arg_9_0.llist:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = arg_11_2:Find("lines")

			for iter_11_0 = 0, var_11_0.childCount - 1 do
				setActive(var_11_0:GetChild(iter_11_0), false)
			end
		end
	end)
	arg_9_0.llist:align(var_0_0.MAX_ROW * var_0_0.MAX_COLUMN)
	setActive(arg_9_0.countDown, true)

	for iter_9_3 = 0, arg_9_0.countDown.childCount - 1 do
		setActive(arg_9_0.countDown:GetChild(iter_9_3), false)
	end

	local var_9_5 = 0
	local var_9_6 = arg_9_0.countDown:GetChild(var_9_5)

	setActive(var_9_6, true)
	setImageAlpha(var_9_6, 0)
	LeanTween.value(go(arg_9_0.countDown), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_12_0)
		arg_12_0 = math.min(arg_12_0 / 0.3, 1)

		setImageAlpha(var_9_6, arg_12_0)
		setLocalScale(var_9_6, {
			x = (1 - arg_12_0) * 2 + 1,
			y = (1 - arg_12_0) * 2 + 1
		})
	end)):setOnComplete(System.Action(function()
		setActive(var_9_6, false)

		var_9_5 = var_9_5 + 1

		if var_9_5 < arg_9_0.countDown.childCount then
			var_9_6 = arg_9_0.countDown:GetChild(var_9_5)

			setActive(var_9_6, true)
			setImageAlpha(var_9_6, 0)
		else
			setActive(arg_9_0.countDown, false)
			arg_9_0:SetState(var_0_0.GAME_STATE_GAMING)
		end
	end)):setRepeat(4):setLoopType(LeanTweenType.punch):setOnCompleteOnRepeat(true):setEase(LeanTweenType.easeOutSine)
end

function var_0_0.GameLoop(arg_14_0)
	local function var_14_0(arg_15_0)
		local var_15_0 = 0
		local var_15_1 = 0

		for iter_15_0 = 1, #arg_15_0 - 1 do
			local var_15_2 = arg_15_0[iter_15_0]
			local var_15_3 = arg_15_0[iter_15_0 + 1]
			local var_15_4 = var_15_3.row - var_15_2.row
			local var_15_5 = var_15_3.column - var_15_2.column
			local var_15_6 = arg_14_0.bottom:GetChild(var_15_2.row * var_0_0.MAX_COLUMN + var_15_2.column):Find("lines")

			for iter_15_1 = 0, var_15_6.childCount - 1 do
				setActive(var_15_6:GetChild(iter_15_1), false)
			end

			if var_15_4 ~= 0 then
				setActive(var_15_6:Find("y" .. var_15_4), true)
			elseif var_15_5 ~= 0 then
				setActive(var_15_6:Find("x" .. var_15_5), true)
			end

			if var_15_4 ~= var_15_0 and var_15_5 ~= var_15_1 then
				local var_15_7 = 0
				local var_15_8 = (var_15_4 == -1 and var_15_1 == 1 or var_15_0 == 1 and var_15_5 == -1) and 0 or (var_15_5 == -1 and var_15_0 == -1 or var_15_4 == 1 and var_15_1 == 1) and 90 or (var_15_4 == 1 and var_15_1 == -1 or var_15_0 == -1 and var_15_5 == 1) and 180 or 270
				local var_15_9 = var_15_6:Find("joint")

				setActive(var_15_9, true)

				var_15_9.localEulerAngles = Vector3(0, 0, var_15_8)
			elseif var_15_0 == 0 and var_15_4 ~= 0 or var_15_0 ~= 0 and var_15_4 == var_15_0 then
				local var_15_10 = var_15_6:Find("cross")

				setActive(var_15_10, true)

				var_15_10.localEulerAngles = Vector3(0, 0, 90)
			elseif var_15_1 == 0 and var_15_5 ~= 0 or var_15_1 ~= 0 and var_15_5 == var_15_1 then
				local var_15_11 = var_15_6:Find("cross")

				setActive(var_15_11, true)

				var_15_11.localEulerAngles = Vector3(0, 0, 0)
			end

			var_15_0, var_15_1 = var_15_4, var_15_5
		end
	end

	local function var_14_1(arg_16_0)
		for iter_16_0 = 1, #arg_16_0 - 1 do
			local var_16_0 = arg_16_0[iter_16_0]
			local var_16_1 = var_16_0.row * var_0_0.MAX_COLUMN + var_16_0.column
			local var_16_2 = arg_14_0.bottom:GetChild(var_16_1):Find("lines")

			for iter_16_1 = 0, var_16_2.childCount - 1 do
				setActive(var_16_2:GetChild(iter_16_1), false)
			end
		end
	end

	local var_14_2
	local var_14_3
	local var_14_4

	arg_14_0.list:each(function(arg_17_0, arg_17_1)
		onButton(arg_14_0, arg_17_1:Find("display/icon"), function()
			local var_18_0 = math.floor(arg_17_0 / var_0_0.MAX_COLUMN)
			local var_18_1 = arg_17_0 % var_0_0.MAX_COLUMN
			local var_18_2 = arg_14_0.cards[var_18_0][var_18_1]

			if var_18_2.state ~= var_0_0.CARD_STATE_NORMAL then
				return
			elseif not var_14_2 then
				var_14_2 = var_18_2
				var_14_3 = arg_17_1

				setActive(arg_17_1:Find("display/selected"), true)
			elseif var_14_4 then
				return
			elseif var_14_2 == var_18_2 then
				setActive(arg_17_1:Find("display/selected"), false)

				var_14_3 = nil
				var_14_2 = nil
			elseif var_14_2.id ~= var_18_2.id then
				setActive(var_14_3:Find("display/selected"), false)

				var_14_3 = nil
				var_14_2 = nil
			else
				local var_18_3 = arg_14_0:LinkLink(var_14_2, var_18_2)

				if not var_18_3 then
					setActive(var_14_3:Find("display/selected"), false)

					var_14_3 = nil
					var_14_2 = nil
				else
					var_18_2.state = var_0_0.CARD_STATE_LINKED
					var_14_2.state = var_0_0.CARD_STATE_LINKED

					setActive(arg_17_1:Find("display/selected"), true)
					var_14_0(var_18_3)

					var_14_4 = true

					local var_18_4 = arg_17_1
					local var_18_5 = var_14_3

					LeanTween.value(go(var_18_4), 1, 0.15, 0.3):setEase(LeanTweenType.easeInBack):setOnUpdate(System.Action_float(function(arg_19_0)
						var_18_4.localScale = Vector3(arg_19_0, arg_19_0, 1)
						var_18_5.localScale = Vector3(arg_19_0, arg_19_0, 1)
					end)):setOnComplete(System.Action(function()
						var_14_1(var_18_3)
						setActive(var_18_4:Find("display"), false)
						setActive(var_18_5:Find("display"), false)

						var_14_4 = false
					end))

					var_14_3 = nil
					var_14_2 = nil

					local var_18_6 = true

					for iter_18_0 = 0, var_0_0.MAX_ROW - 1 do
						for iter_18_1 = 0, var_0_0.MAX_COLUMN - 1 do
							if arg_14_0.cards[iter_18_0][iter_18_1].state == var_0_0.CARD_STATE_NORMAL then
								var_18_6 = false

								break
							end
						end
					end

					if var_18_6 then
						arg_14_0:SetState(var_0_0.GAME_STATE_END)
					end
				end
			end
		end, SFX_PANEL)
	end)

	if IsUnityEditor and AUTO_LINKLINK then
		setActive(arg_14_0.helpBtn, true)
		onButton(arg_14_0, arg_14_0.helpBtn, function()
			var_14_2 = nil
			var_14_3 = nil

			for iter_21_0 = 0, var_0_0.MAX_ROW - 1 do
				for iter_21_1 = 0, var_0_0.MAX_COLUMN - 1 do
					local var_21_0 = arg_14_0.cards[iter_21_0][iter_21_1]
					local var_21_1 = var_21_0.row * var_0_0.MAX_COLUMN + var_21_0.column
					local var_21_2 = arg_14_0.layout:GetChild(var_21_1)

					if var_21_0.state == var_0_0.CARD_STATE_NORMAL then
						for iter_21_2 = 0, var_0_0.MAX_ROW - 1 do
							for iter_21_3 = 0, var_0_0.MAX_COLUMN - 1 do
								if iter_21_0 ~= iter_21_2 or iter_21_1 ~= iter_21_3 then
									local var_21_3 = arg_14_0.cards[iter_21_2][iter_21_3]
									local var_21_4 = var_21_3.row * var_0_0.MAX_COLUMN + var_21_3.column
									local var_21_5 = arg_14_0.layout:GetChild(var_21_4)

									if var_21_0.id == var_21_3.id then
										triggerButton(var_21_2:Find("display/icon"))
										triggerButton(var_21_5:Find("display/icon"))

										if var_14_4 then
											Timer.New(function()
												triggerButton(arg_14_0.helpBtn)
											end, 0.4, 1):Start()

											return
										end
									end
								end
							end
						end
					end
				end
			end
		end)
	end

	local var_14_5 = 0

	onButton(arg_14_0, arg_14_0.resetBtn, function()
		if arg_14_0.state ~= var_0_0.GAME_STATE_GAMING then
			return
		elseif Time.realtimeSinceStartup - var_14_5 < var_0_0.RESET_CD then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_wait"))
		else
			if var_14_2 then
				setActive(var_14_3:Find("display/selected"), false)

				var_14_3 = nil
				var_14_2 = nil
			end

			local var_23_0 = {}
			local var_23_1 = {}

			for iter_23_0 = 0, var_0_0.MAX_ROW - 1 do
				for iter_23_1 = 0, var_0_0.MAX_COLUMN - 1 do
					local var_23_2 = arg_14_0.cards[iter_23_0][iter_23_1]

					if var_23_2.state == var_0_0.CARD_STATE_NORMAL then
						table.insert(var_23_0, {
							row = iter_23_0,
							column = iter_23_1
						})
						table.insert(var_23_1, var_23_2.id)
					end
				end
			end

			local var_23_3 = 1

			while #var_23_1 > 0 do
				local var_23_4 = math.clamp(math.floor(math.random() * #var_23_1 + 1), 1, #var_23_1)

				arg_14_0.cards[var_23_0[var_23_3].row][var_23_0[var_23_3].column].id = var_23_1[var_23_4]

				table.remove(var_23_1, var_23_4)

				var_23_3 = var_23_3 + 1
			end

			arg_14_0.list:each(function(arg_24_0, arg_24_1)
				local var_24_0 = math.floor(arg_24_0 / var_0_0.MAX_COLUMN)
				local var_24_1 = arg_24_0 % var_0_0.MAX_COLUMN
				local var_24_2 = arg_14_0.cards[var_24_0][var_24_1]

				if var_24_2.state == var_0_0.CARD_STATE_NORMAL then
					local var_24_3 = getImageSprite(arg_14_0.resource:GetChild(var_24_2.id))

					setImageSprite(arg_24_1:Find("display/icon"), var_24_3)
				end
			end)

			var_14_5 = Time.realtimeSinceStartup
		end
	end, SFX_PANEL)

	arg_14_0.startTime = Time.realtimeSinceStartup
	arg_14_0.countTimer = Timer.New(function()
		local var_25_0 = math.floor((Time.realtimeSinceStartup - arg_14_0.startTime) * 1000)

		setText(arg_14_0.timeTxt, arg_14_0:FormatRecordTime(var_25_0))
	end, 0.033, -1)

	arg_14_0.countTimer:Start()
	arg_14_0.countTimer.func()
end

function var_0_0.GameEnd(arg_26_0)
	arg_26_0.countTimer:Stop()

	arg_26_0.countTimer = nil
	arg_26_0.lastRecord = math.floor((Time.realtimeSinceStartup - arg_26_0.startTime) * 1000)

	if arg_26_0.activityRestTimes > 0 or arg_26_0.lastRecord < arg_26_0.activityBestRecord then
		local var_26_0 = arg_26_0.activityProgress + (arg_26_0.activityRestTimes > 0 and 1 or 0)

		arg_26_0:emit(LinkLinkMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = arg_26_0.activity.id,
			arg1 = var_26_0,
			arg2 = arg_26_0.lastRecord
		})
	else
		arg_26_0:DisplayResult(arg_26_0.activity)
	end
end

function var_0_0.DisplayResult(arg_27_0, arg_27_1)
	setActive(arg_27_0.result, true)

	local var_27_0 = arg_27_0.result:Find("bg")

	setActive(var_27_0:Find("pic_new_record"), arg_27_1.data4 < arg_27_0.activityBestRecord)
	setActive(var_27_0:Find("pic_win"), arg_27_1.data4 >= arg_27_0.activityBestRecord)
	setText(var_27_0:Find("time_txt"), arg_27_0:FormatRecordTime(arg_27_0.lastRecord))

	local var_27_1 = arg_27_1:getConfig("config_client")[3]

	setText(var_27_0:Find("award_txt"), arg_27_1.data2 > arg_27_0.activityProgress and var_27_1[arg_27_1.data2] or 0)
	onButton(arg_27_0, var_27_0:Find("button"), function()
		arg_27_0:HideResult()
		arg_27_0:SetActivity(arg_27_1)
		arg_27_0:SetState(var_0_0.GAME_STATE_BEGIN)
	end, SFX_PANEL)
	onButton(arg_27_0, arg_27_0.result, function()
		triggerButton(arg_27_0.backBtn)
	end, SFX_CANCEL)
	pg.UIMgr.GetInstance():BlurPanel(arg_27_0.result)
end

function var_0_0.HideResult(arg_30_0)
	if isActive(arg_30_0.result) then
		setActive(arg_30_0.result, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_30_0.result, arg_30_0._tf)
	end
end

function var_0_0.FormatRecordTime(arg_31_0, arg_31_1)
	local var_31_0 = math.floor(arg_31_1 / 60000)

	var_31_0 = var_31_0 >= 10 and var_31_0 or "0" .. var_31_0

	local var_31_1 = math.floor(arg_31_1 % 60000 / 1000)

	var_31_1 = var_31_1 >= 10 and var_31_1 or "0" .. var_31_1

	local var_31_2 = math.floor(arg_31_1 % 1000 / 10)

	var_31_2 = var_31_2 >= 10 and var_31_2 or "0" .. var_31_2

	return var_31_0 .. "'" .. var_31_1 .. "'" .. var_31_2
end

function var_0_0.LinkLink(arg_32_0, arg_32_1, arg_32_2)
	assert(arg_32_1.row ~= arg_32_2.row or arg_32_1.column ~= arg_32_2.column)
	assert(arg_32_1.id == arg_32_2.id)

	local var_32_0 = {
		row = arg_32_1.row,
		column = arg_32_1.column
	}
	local var_32_1 = {
		row = arg_32_2.row,
		column = arg_32_2.column
	}
	local var_32_2 = {}
	local var_32_3 = {}

	table.insert(var_32_2, var_32_0)
	table.insert(var_32_3, var_32_0)

	for iter_32_0 = 1, 3 do
		local var_32_4 = arg_32_0:IterateByOneSnap(var_32_1, arg_32_1.id, var_32_2, var_32_3)

		if var_32_4 then
			local var_32_5 = {
				var_32_4
			}

			while var_32_4 and var_32_4.from do
				if var_32_4.row ~= var_32_4.from.row then
					local var_32_6 = var_32_4.row > var_32_4.from.row and -1 or 1

					for iter_32_1 = var_32_4.row + var_32_6, var_32_4.from.row, var_32_6 do
						table.insert(var_32_5, {
							row = iter_32_1,
							column = var_32_4.column
						})
					end
				elseif var_32_4.from.column ~= var_32_4.column then
					local var_32_7 = var_32_4.column > var_32_4.from.column and -1 or 1

					for iter_32_2 = var_32_4.column + var_32_7, var_32_4.from.column, var_32_7 do
						table.insert(var_32_5, {
							row = var_32_4.row,
							column = iter_32_2
						})
					end
				else
					assert(false)
				end

				var_32_4 = var_32_4.from
			end

			return var_32_5
		end
	end
end

function var_0_0.IterateByOneSnap(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
	for iter_33_0 = 1, #arg_33_3 do
		local var_33_0 = arg_33_0:FindDirectLinkPoint(arg_33_2, arg_33_3[iter_33_0], arg_33_4)

		for iter_33_1, iter_33_2 in ipairs(var_33_0) do
			if iter_33_2.row == arg_33_1.row and iter_33_2.column == arg_33_1.column then
				return iter_33_2
			end

			table.insert(arg_33_3, iter_33_2)
		end
	end

	_.each(arg_33_3, function(arg_34_0)
		arg_33_4[arg_34_0.row .. "_" .. arg_34_0.column] = true
	end)
end

function var_0_0.FindDirectLinkPoint(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	local var_35_0 = {}

	for iter_35_0 = arg_35_2.row - 1, 0, -1 do
		local var_35_1 = iter_35_0 .. "_" .. arg_35_2.column
		local var_35_2 = arg_35_0.cards[iter_35_0][arg_35_2.column]

		if var_35_2.state == var_0_0.CARD_STATE_NORMAL and var_35_2.id ~= arg_35_1 or arg_35_3[var_35_1] then
			break
		end

		table.insert(var_35_0, {
			row = iter_35_0,
			column = arg_35_2.column,
			from = arg_35_2
		})
	end

	for iter_35_1 = arg_35_2.row + 1, var_0_0.MAX_ROW - 1 do
		local var_35_3 = iter_35_1 .. "_" .. arg_35_2.column
		local var_35_4 = arg_35_0.cards[iter_35_1][arg_35_2.column]

		if var_35_4.state == var_0_0.CARD_STATE_NORMAL and var_35_4.id ~= arg_35_1 or arg_35_3[var_35_3] then
			break
		end

		table.insert(var_35_0, {
			row = iter_35_1,
			column = arg_35_2.column,
			from = arg_35_2
		})
	end

	for iter_35_2 = arg_35_2.column - 1, 0, -1 do
		local var_35_5 = arg_35_2.row .. "_" .. iter_35_2
		local var_35_6 = arg_35_0.cards[arg_35_2.row][iter_35_2]

		if var_35_6.state == var_0_0.CARD_STATE_NORMAL and var_35_6.id ~= arg_35_1 or arg_35_3[var_35_5] then
			break
		end

		table.insert(var_35_0, {
			row = arg_35_2.row,
			column = iter_35_2,
			from = arg_35_2
		})
	end

	for iter_35_3 = arg_35_2.column + 1, var_0_0.MAX_COLUMN - 1 do
		local var_35_7 = arg_35_2.row .. "_" .. iter_35_3
		local var_35_8 = arg_35_0.cards[arg_35_2.row][iter_35_3]

		if var_35_8.state == var_0_0.CARD_STATE_NORMAL and var_35_8.id ~= arg_35_1 or arg_35_3[var_35_7] then
			break
		end

		table.insert(var_35_0, {
			row = arg_35_2.row,
			column = iter_35_3,
			from = arg_35_2
		})
	end

	return var_35_0
end

function var_0_0.LinkLink1(arg_36_0, arg_36_1, arg_36_2)
	assert(arg_36_1.row ~= arg_36_2.row or arg_36_1.column ~= arg_36_2.column)
	assert(arg_36_1.id == arg_36_2.id)

	local var_36_0
	local var_36_1 = {
		[arg_36_1.row .. "_" .. arg_36_1.column] = {
			rdir = 0,
			cdir = 0,
			snap = 0,
			row = arg_36_1.row,
			column = arg_36_1.column,
			path = {}
		}
	}
	local var_36_2 = {
		row = arg_36_1.row,
		column = arg_36_1.column
	}
	local var_36_3 = {
		row = arg_36_2.row,
		column = arg_36_2.column
	}
	local var_36_4 = {
		var_36_2
	}
	local var_36_5 = {}

	while #var_36_4 > 0 do
		local var_36_6 = table.remove(var_36_4, 1)

		if var_36_6.row == var_36_3.row and var_36_6.column == var_36_3.column then
			var_36_0 = var_36_1[var_36_6.row .. "_" .. var_36_6.column].path

			break
		end

		table.insert(var_36_5, var_36_6)

		local var_36_7 = {
			{
				row = 1,
				column = 0
			},
			{
				row = -1,
				column = 0
			},
			{
				row = 0,
				column = 1
			},
			{
				row = 0,
				column = -1
			}
		}

		_.each(var_36_7, function(arg_37_0)
			arg_37_0.row = var_36_6.row + arg_37_0.row
			arg_37_0.column = var_36_6.column + arg_37_0.column

			local var_37_0 = _.any(var_36_4, function(arg_38_0)
				return arg_38_0.row == arg_37_0.row and arg_38_0.column == arg_37_0.column
			end) or _.any(var_36_5, function(arg_39_0)
				return arg_39_0.row == arg_37_0.row and arg_39_0.column == arg_37_0.column
			end)
			local var_37_1 = arg_36_0.cards[arg_37_0.row] and arg_36_0.cards[arg_37_0.row][arg_37_0.column] or nil

			if not var_37_0 and (not var_37_1 or var_37_1.state == var_0_0.CARD_STATE_LINKED or var_37_1.state == var_0_0.CARD_STATE_BLANK or var_37_1.id == arg_36_1.id) and arg_37_0.row >= 0 and arg_37_0.row < var_0_0.MAX_ROW and arg_37_0.column >= 0 and arg_37_0.column < var_0_0.MAX_COLUMN then
				local var_37_2 = var_36_1[var_36_6.row .. "_" .. var_36_6.column]
				local var_37_3 = var_37_2.snap
				local var_37_4 = arg_37_0.row - var_36_6.row
				local var_37_5 = arg_37_0.column - var_36_6.column

				if var_37_2.rdir ~= 0 and var_37_2.rdir ~= var_37_4 or var_37_2.cdir ~= 0 and var_37_2.cdir ~= var_37_5 then
					var_37_3 = var_37_3 + 1
				end

				if var_37_3 <= 2 then
					local var_37_6 = Clone(var_37_2.path)

					table.insert(var_37_6, arg_37_0)

					var_36_1[arg_37_0.row .. "_" .. arg_37_0.column] = {
						row = arg_37_0.row,
						column = arg_37_0.column,
						snap = var_37_3,
						rdir = var_37_4,
						cdir = var_37_5,
						path = var_37_6
					}

					local var_37_7 = 0

					for iter_37_0 = #var_36_4, 1, -1 do
						local var_37_8 = var_36_4[iter_37_0]
						local var_37_9 = var_36_1[var_37_8.row .. "_" .. var_37_8.column]

						if var_37_3 > var_37_9.snap or var_37_3 == var_37_9.snap and #var_37_6 > #var_37_9.path then
							var_37_7 = iter_37_0

							break
						end
					end

					table.insert(var_36_4, var_37_7 + 1, arg_37_0)
				end
			end
		end)
	end

	return var_36_0
end

return var_0_0
