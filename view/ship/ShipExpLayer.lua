local var_0_0 = class("ShipExpLayer", import("..base.BaseUI"))

var_0_0.TypeDefault = 0
var_0_0.TypeClass = 1

function var_0_0.getUIName(arg_1_0)
	return "ShipExpUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0._grade = arg_2_0._tf:Find("grade")
	arg_2_0._gradeLabel = arg_2_0._grade:Find("label")
	arg_2_0._levelText = arg_2_0._grade:Find("Text")
	arg_2_0._main = arg_2_0._tf:Find("main")
	arg_2_0._leftPanel = arg_2_0._main:Find("leftPanel")
	arg_2_0._topBar = arg_2_0._leftPanel:Find("topBar")
	arg_2_0._expResult = arg_2_0._leftPanel:Find("expResult")
	arg_2_0._expContainer = arg_2_0._expResult:Find("expContainer")
	arg_2_0._extpl = arg_2_0:getTpl("ShipCardTpl", arg_2_0._expContainer)
	arg_2_0._skipBtn = arg_2_0._tf:Find("skipLayer")

	setActive(arg_2_0._topBar, false)
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0.tweenTFs = {}
	arg_3_0.timerId = {}

	onButton(arg_3_0, arg_3_0._skipBtn, function()
		arg_3_0:skip()
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
	arg_3_0:display()
end

function var_0_0.display(arg_5_0)
	setActive(arg_5_0._grade, true)
	setText(arg_5_0._levelText, arg_5_0.contextData.title)

	if arg_5_0.contextData.type == var_0_0.TypeClass then
		setActive(arg_5_0._gradeLabel, false)
	else
		setActive(arg_5_0._gradeLabel, true)

		local var_5_0 = arg_5_0.contextData.isCri and "grade_label_task_perfect" or "grade_label_task_complete"

		LoadImageSpriteAsync("battlescore/" .. var_5_0, arg_5_0._gradeLabel, true)
	end

	local var_5_1 = arg_5_0.contextData.top

	setActive(arg_5_0._topBar, var_5_1)

	if var_5_1 then
		setText(arg_5_0._topBar:Find("text_1"), var_5_1.text1)
		setText(arg_5_0._topBar:Find("text_2"), var_5_1.text2)
		setText(arg_5_0._topBar:Find("text_3"), var_5_1.text3)

		arg_5_0._topBar:Find("progress"):GetComponent(typeof(Image)).fillAmount = var_5_1.progress
	end

	arg_5_0._expTFs = {}
	arg_5_0._skipExp = {}
	arg_5_0._maxRightDelay = 0

	local var_5_2 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.contextData.newShips) do
		var_5_2[iter_5_1.id] = iter_5_1
	end

	local var_5_3 = arg_5_0.contextData.oldShips
	local var_5_4 = 0.5

	for iter_5_2, iter_5_3 in ipairs(var_5_3) do
		local var_5_5 = var_5_2[iter_5_3.id]
		local var_5_6 = cloneTplTo(arg_5_0._extpl, arg_5_0._expContainer)
		local var_5_7 = var_5_6.transform.anchoredPosition
		local var_5_8 = rtf(var_5_6).rect.width
		local var_5_9 = findTF(var_5_6, "content")

		var_5_6.transform.anchoredPosition = Vector3(var_5_7.x + (16.2 + var_5_8) * (iter_5_2 - 1), var_5_7.y, var_5_7.z)
		arg_5_0._expTFs[#arg_5_0._expTFs + 1] = var_5_6

		flushShipCard(var_5_6, iter_5_3)
		setScrollText(findTF(var_5_9, "info/name_mask/name"), iter_5_3:GetColorName())

		local var_5_10 = findTF(var_5_9, "dockyard/lv/Text")
		local var_5_11 = findTF(var_5_9, "dockyard/lv_bg/levelUpLabel")
		local var_5_12 = findTF(var_5_9, "dockyard/lv_bg/levelup")

		setText(var_5_10, iter_5_3.level)

		local var_5_13 = findTF(var_5_9, "exp")
		local var_5_14 = findTF(var_5_13, "exp_text")
		local var_5_15 = findTF(var_5_13, "exp_progress")

		arg_5_0._maxRightDelay = math.max(arg_5_0._maxRightDelay, var_5_5.level - iter_5_3.level + iter_5_2 * 0.5)

		local function var_5_16()
			SetActive(var_5_13, true)

			local var_6_0 = iter_5_3:getLevelExpConfig().exp
			local var_6_1 = var_5_5:getLevelExpConfig().exp

			var_5_15:GetComponent(typeof(Image)).fillAmount = iter_5_3.exp / var_6_0

			if iter_5_3.level < var_5_5.level then
				local var_6_2 = 0

				for iter_6_0 = iter_5_3.level, var_5_5.level - 1 do
					var_6_2 = var_6_2 + iter_5_3:getLevelExpConfig(iter_6_0).exp
				end

				arg_5_0:PlayAnimation(var_5_6, 0, var_6_2 + var_5_5.exp - iter_5_3.exp, 1, 0, function(arg_7_0)
					setText(var_5_14, "+" .. math.ceil(arg_7_0))
				end)

				local function var_6_3(arg_8_0)
					SetActive(var_5_11, true)
					SetActive(var_5_12, true)

					local var_8_0 = var_5_11.localPosition

					LeanTween.moveY(rtf(var_5_11), var_8_0.y + 30, 0.5):setOnComplete(System.Action(function()
						SetActive(var_5_11, false)

						var_5_11.localPosition = var_8_0

						pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_BOAT_LEVEL_UP)
					end))
					setText(var_5_10, arg_8_0)
					table.insert(arg_5_0.tweenTFs, var_5_11)
				end

				LeanTween.value(go(var_5_6), iter_5_3.exp / var_6_0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_10_0)
					var_5_15:GetComponent(typeof(Image)).fillAmount = arg_10_0
				end)):setOnComplete(System.Action(function()
					local var_11_0 = iter_5_3.level + 1

					var_6_3(var_11_0)

					local var_11_1 = var_11_0 + 1
					local var_11_2 = 0.1

					while var_11_1 <= var_5_5.level do
						local var_11_3 = var_11_1

						LeanTween.value(go(var_5_6), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_12_0)
							var_5_15:GetComponent(typeof(Image)).fillAmount = arg_12_0
						end)):setDelay(var_11_2):setOnComplete(System.Action(function()
							var_6_3(var_11_3)
						end))

						var_11_2 = var_11_2 + 1
						var_11_1 = var_11_1 + 1
					end

					arg_5_0.timerId[iter_5_3.id] = pg.TimeMgr.GetInstance():AddTimer("delayTimer", var_11_2, 0, function()
						if var_5_5.level == var_5_5:getMaxLevel() then
							var_5_15:GetComponent(typeof(Image)).fillAmount = 1
							arg_5_0._skipExp[iter_5_2] = false

							return
						end

						arg_5_0:PlayAnimation(var_5_6, 0, var_5_5.exp / var_6_1, 0.5, 0, function(arg_15_0)
							var_5_15:GetComponent(typeof(Image)).fillAmount = arg_15_0
							arg_5_0._skipExp[iter_5_2] = false
						end)
					end)
				end))
				table.insert(arg_5_0.tweenTFs, var_5_6)
			else
				local var_6_4 = math.ceil(var_5_5:getExp() - iter_5_3:getExp())

				setText(var_5_14, "+" .. var_6_4)

				if iter_5_3.level == iter_5_3:getMaxLevel() then
					var_5_15:GetComponent(typeof(Image)).fillAmount = 1
					arg_5_0._skipExp[iter_5_2] = false

					return
				end

				arg_5_0:PlayAnimation(var_5_6, iter_5_3.exp / var_6_0, var_5_5.exp / var_6_0, 1, 0, function(arg_16_0)
					var_5_15:GetComponent(typeof(Image)).fillAmount = arg_16_0
					arg_5_0._skipExp[iter_5_2] = false
				end)
			end
		end

		arg_5_0._skipExp[iter_5_2] = function()
			LeanTween.cancel(go(var_5_11))
			LeanTween.cancel(go(var_5_6))
			SetActive(var_5_6, true)
			SetActive(var_5_13, true)
			setText(var_5_10, var_5_5.level)

			if iter_5_3.level == iter_5_3:getMaxLevel() then
				setText(var_5_14, "+" .. math.ceil(var_5_5:getExp() - iter_5_3:getExp()))

				var_5_15:GetComponent(typeof(Image)).fillAmount = 1
			else
				if iter_5_3.level < var_5_5.level then
					local var_17_0 = 0

					for iter_17_0 = iter_5_3.level, var_5_5.level - 1 do
						var_17_0 = var_17_0 + iter_5_3:getLevelExpConfig(iter_17_0).exp
					end

					setText(var_5_14, "+" .. var_17_0 + var_5_5.exp - iter_5_3.exp)
				else
					setText(var_5_14, "+" .. math.ceil(var_5_5.exp - iter_5_3.exp))
				end

				var_5_15:GetComponent(typeof(Image)).fillAmount = var_5_5.exp / var_5_5:getLevelExpConfig().exp
			end

			SetActive(var_5_11, false)

			var_5_6:GetComponent("CanvasGroup").alpha = 1
			rtf(var_5_6).anchoredPosition = Vector2(rtf(var_5_6).anchoredPosition.x, 0)
		end

		local var_5_17 = var_5_6:GetComponent("CanvasGroup")
		local var_5_18 = iter_5_2 * 0.2

		setActive(var_5_6, false)
		LeanTween.moveY(rtf(var_5_6), 0, 0.2):setOnComplete(System.Action(function()
			setActive(var_5_6, true)
			var_5_16()
		end)):setDelay(var_5_18)
		table.insert(arg_5_0.tweenTFs, var_5_6)
		LeanTween.value(go(var_5_6), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_19_0)
			var_5_17.alpha = arg_19_0
		end)):setDelay(var_5_18)
	end
end

function var_0_0.skip(arg_20_0)
	if _.any(arg_20_0._skipExp, function(arg_21_0)
		return arg_21_0
	end) then
		for iter_20_0 = 1, #arg_20_0._skipExp do
			if arg_20_0._skipExp[iter_20_0] then
				arg_20_0._skipExp[iter_20_0]()

				arg_20_0._skipExp[iter_20_0] = false
			end
		end
	else
		arg_20_0:emit(BaseUI.ON_CLOSE)
	end
end

function var_0_0.PlayAnimation(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5, arg_22_6)
	LeanTween.value(arg_22_1.gameObject, arg_22_2, arg_22_3, arg_22_4):setDelay(arg_22_5):setOnUpdate(System.Action_float(function(arg_23_0)
		arg_22_6(arg_23_0)
	end))
	table.insert(arg_22_0.tweenTFs, arg_22_1)
end

function var_0_0.willExit(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.tweenTFs) do
		if LeanTween.isTweening(go(iter_24_1)) then
			LeanTween.cancel(go(iter_24_1))
		end
	end

	arg_24_0.tweenTFs = nil

	for iter_24_2, iter_24_3 in pairs(arg_24_0.timerId) do
		pg.TimeMgr.GetInstance():RemoveTimer(iter_24_3)
	end

	arg_24_0.timerId = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_24_0._tf)
end

return var_0_0
