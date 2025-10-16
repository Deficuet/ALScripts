local var_0_0 = class("SenrankaguraMainPage", import(".TemplatePage.PreviewTemplatePage"))

var_0_0.SWITCH_INTERVAL = 6
var_0_0.SWITCH_TIME = 0.5
var_0_0.SWITCH_WIDTH = 367
var_0_0.TACHIE_DELAY = 0.03

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD/mask")
	arg_1_0.btnList = arg_1_0.bg:Find("btn_list")
	arg_1_0.main = arg_1_0.bg:Find("main")
	arg_1_0.totalNum = arg_1_0.main.childCount
	arg_1_0.randomList = {}
	arg_1_0.children = {}

	for iter_1_0 = 1, arg_1_0.totalNum do
		local var_1_0 = arg_1_0.main:GetChild(iter_1_0 - 1)

		table.insert(arg_1_0.children, var_1_0)
		setActive(var_1_0, false)

		if PLATFORM_CODE ~= PLATFORM_CH then
			local var_1_1 = findTF(var_1_0, "hx")

			if var_1_1 then
				setActive(var_1_1, false)
			end
		end
	end
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.btnList:Find("mountain"), function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SENRANKAGURA_BACKHILL)
	end, SFX_PANEL)

	for iter_2_0 = 1, arg_2_0.totalNum do
		table.insert(arg_2_0.randomList, iter_2_0)
	end

	shuffle(arg_2_0.randomList)

	arg_2_0.index = 1

	setActive(arg_2_0.children[arg_2_0.randomList[arg_2_0.index]], true)

	arg_2_0.LTList = {}

	function arg_2_0.Interval()
		table.insert(arg_2_0.LTList, LeanTween.delayedCall(go(arg_2_0._tf), var_0_0.SWITCH_INTERVAL, System.Action(arg_2_0.FadeIn)).uniqueId)
	end

	function arg_2_0.FadeIn()
		local var_5_0 = arg_2_0.children[arg_2_0.randomList[arg_2_0.index]]

		arg_2_0.index = arg_2_0.index % arg_2_0.totalNum + 1

		local var_5_1 = arg_2_0.children[arg_2_0.randomList[arg_2_0.index]]
		local var_5_2 = var_0_0.SWITCH_WIDTH

		setActive(var_5_1, true)

		local var_5_3 = {
			findTF(var_5_1, "bg"),
			findTF(var_5_1, "tachie"),
			findTF(var_5_1, "hx")
		}
		local var_5_4 = {
			findTF(var_5_0, "bg"),
			findTF(var_5_0, "tachie"),
			findTF(var_5_0, "hx")
		}
		local var_5_5 = {
			0,
			var_0_0.TACHIE_DELAY,
			var_0_0.TACHIE_DELAY
		}

		table.insert(arg_2_0.LTList, LeanTween.delayedCall(go(arg_2_0._tf), var_0_0.SWITCH_TIME + var_0_0.TACHIE_DELAY, System.Action(arg_2_0.Interval)).uniqueId)
		table.Foreach(var_5_3, function(arg_6_0, arg_6_1)
			setImageAlpha(arg_6_1, 0)

			local var_6_0 = rtf(arg_6_1).anchoredPosition.x

			setAnchoredPosition(arg_6_1, {
				x = var_5_2 + var_6_0
			})

			local function var_6_1()
				table.insert(arg_2_0.LTList, LeanTween.alpha(arg_6_1, 1, var_0_0.SWITCH_TIME):setEase(LeanTweenType.easeOutSine).uniqueId)
				table.insert(arg_2_0.LTList, LeanTween.moveX(rtf(arg_6_1), 0 + var_6_0, var_0_0.SWITCH_TIME):setEase(LeanTweenType.easeOutSine).uniqueId)
			end

			if var_5_5[arg_6_0] > 0 then
				table.insert(arg_2_0.LTList, LeanTween.delayedCall(go(arg_6_1), var_5_5[arg_6_0], System.Action(var_6_1)).uniqueId)
			else
				var_6_1()
			end
		end)
		table.Foreach(var_5_4, function(arg_8_0, arg_8_1)
			local var_8_0 = rtf(arg_8_1).anchoredPosition.x

			local function var_8_1()
				setAnchoredPosition(arg_8_1, {
					x = var_8_0
				})
			end

			local function var_8_2()
				table.insert(arg_2_0.LTList, LeanTween.alpha(arg_8_1, 0, var_0_0.SWITCH_TIME):setEase(LeanTweenType.easeOutSine).uniqueId)
				table.insert(arg_2_0.LTList, LeanTween.moveX(rtf(arg_8_1), -var_5_2 + var_8_0, var_0_0.SWITCH_TIME):setOnComplete(System.Action(var_8_1)):setEase(LeanTweenType.easeOutSine).uniqueId)
			end

			if var_5_5[arg_8_0] > 0 then
				table.insert(arg_2_0.LTList, LeanTween.delayedCall(go(arg_8_1), var_5_5[arg_8_0], System.Action(var_8_2)).uniqueId)
			else
				var_8_2()
			end
		end)
	end

	arg_2_0.Interval()
end

function var_0_0.OnDestroy(arg_11_0)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.LTList or {}) do
		LeanTween.cancel(iter_11_1)
	end
end

return var_0_0
