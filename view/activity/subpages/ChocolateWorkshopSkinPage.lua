local var_0_0 = class("ChocolateWorkshopSkinPage", import(".TemplatePage.SkinTemplatePage"))

var_0_0.FADE_TIME = 0.5
var_0_0.SHOW_TIME = 2
var_0_0.FADE_OUT_TIME = 0.5

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.finishContainer = arg_1_0.bg:Find("FinishContainer")
	arg_1_0.bubbleTF = arg_1_0.bg:Find("Bubble")
	arg_1_0.bubbleText = arg_1_0.bubbleTF:Find("Text")
	arg_1_0.bubbleCG = GetComponent(arg_1_0.bubbleTF, "CanvasGroup")
	arg_1_0.sdContainer = arg_1_0.bg:Find("SDcontainer")
	arg_1_0.sdBtn = arg_1_0.bg:Find("SDBtn")

	onButton(arg_1_0, arg_1_0.sdBtn, function()
		local var_2_0 = {
			{
				{
					2022,
					2,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					2,
					23
				},
				{
					23,
					59,
					59
				}
			}
		}

		if type(var_2_0) == "table" and pg.TimeMgr.GetInstance():inTime(var_2_0) then
			setActive(arg_1_0.boxTF, true)
		end
	end, SFX_PANEL)

	arg_1_0.boxTF = arg_1_0._tf:Find("Box")
	arg_1_0.boxBG = arg_1_0.boxTF:Find("BG")
	arg_1_0.boxText = arg_1_0.boxTF:Find("Content/Text")

	setText(arg_1_0.boxText, i18n("valentinesday__shop_tip"))

	arg_1_0.confirmBtn = arg_1_0.boxTF:Find("Content/Confirm")
	arg_1_0.cancelBtn = arg_1_0.boxTF:Find("Content/Cancel")

	onButton(arg_1_0, arg_1_0.boxBG, function()
		setActive(arg_1_0.boxTF, false)
	end, SFX_CANCEL)
	onButton(arg_1_0, arg_1_0.cancelBtn, function()
		setActive(arg_1_0.boxTF, false)
	end, SFX_CANCEL)
	onButton(arg_1_0, arg_1_0.confirmBtn, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SKINSHOP)
		setActive(arg_1_0.boxTF, false)
	end, SFX_PANEL)

	arg_1_0.sdNameList = {
		"anshan_3",
		"shiyu_4"
	}
	arg_1_0.bubbleTextTable = {
		anshan_3 = {
			"valentinesday__txt1_tip",
			"valentinesday__txt2_tip",
			"valentinesday__txt3_tip"
		},
		shiyu_4 = {
			"valentinesday__txt4_tip",
			"valentinesday__txt5_tip",
			"valentinesday__txt6_tip"
		}
	}
	arg_1_0.aniContainerTF = arg_1_0.bg:Find("AniContainer")
	arg_1_0.tplList = GetComponent(arg_1_0._tf, "ItemList").prefabItem:ToTable()
	arg_1_0.sdName = arg_1_0.sdNameList[math.random(#arg_1_0.sdNameList)]
	arg_1_0.animChar = nil

	GetSpineRequestPackage.New(arg_1_0.sdName, function(arg_6_0)
		arg_1_0.animChar = arg_6_0

		arg_1_0.animChar:SetParent(arg_1_0.sdContainer)
		arg_1_0.animChar:SetLocalScale(Vector3.one)
		arg_1_0.animChar:SetAction("stand2", 0)
	end):Start()
end

function var_0_0.OnFirstFlush(arg_7_0)
	arg_7_0.uilist:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = arg_8_1 + 1
			local var_8_1 = arg_8_2:Find("item")
			local var_8_2 = arg_7_0.taskGroup[arg_7_0.nday][var_8_0]
			local var_8_3 = arg_7_0.taskProxy:getTaskById(var_8_2) or arg_7_0.taskProxy:getFinishTaskById(var_8_2)

			assert(var_8_3, "without this task by id: " .. var_8_2)

			local var_8_4 = var_8_3:getConfig("award_display")[1]
			local var_8_5 = {
				type = var_8_4[1],
				id = var_8_4[2],
				count = var_8_4[3]
			}

			updateDrop(var_8_1, var_8_5)
			onButton(arg_7_0, var_8_1, function()
				arg_7_0:emit(BaseUI.ON_DROP, var_8_5)
			end, SFX_PANEL)

			local var_8_6 = var_8_3:getProgress()
			local var_8_7 = var_8_3:getConfig("target_num")

			setText(arg_8_2:Find("description"), var_8_3:getConfig("desc"))
			setText(arg_8_2:Find("progressText"), setColorStr(var_8_6, "#BBCF2EFF") .. "/" .. var_8_7)
			setSlider(arg_8_2:Find("progress"), 0, var_8_7, var_8_6)

			local var_8_8 = arg_8_2:Find("go_btn")
			local var_8_9 = arg_8_2:Find("get_btn")
			local var_8_10 = arg_8_2:Find("got_btn")
			local var_8_11 = var_8_3:getTaskStatus()

			setActive(var_8_8, var_8_11 == 0)
			setActive(var_8_9, var_8_11 == 1)
			setActive(var_8_10, var_8_11 == 2)
			onButton(arg_7_0, var_8_8, function()
				arg_7_0:emit(ActivityMediator.ON_TASK_GO, var_8_3)
			end, SFX_PANEL)
			onButton(arg_7_0, var_8_9, function()
				arg_7_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_8_3)
			end, SFX_PANEL)
		end
	end)

	arg_7_0.showBubbleTag = false
end

function var_0_0.OnUpdateFlush(arg_12_0)
	var_0_0.super.OnUpdateFlush(arg_12_0)
	setActive(arg_12_0.boxTF, false)

	for iter_12_0 = 1, arg_12_0.finishContainer.childCount do
		local var_12_0 = arg_12_0.finishContainer:GetChild(iter_12_0 - 1)

		setActive(var_12_0, iter_12_0 <= arg_12_0.nday)
	end

	local var_12_1 = arg_12_0.taskGroup[arg_12_0.nday][1]
	local var_12_2 = arg_12_0.taskProxy:getTaskVO(var_12_1):getTaskStatus()

	if not arg_12_0.showBubbleTag then
		if var_12_2 == 0 then
			arg_12_0:showBubble(i18n(arg_12_0.bubbleTextTable[arg_12_0.sdName][1]))

			arg_12_0.showBubbleTag = true
		elseif var_12_2 == 1 then
			arg_12_0:showBubble(i18n(arg_12_0.bubbleTextTable[arg_12_0.sdName][2]))

			arg_12_0.showBubbleTag = true
		end
	end

	eachChild(arg_12_0.aniContainerTF, function(arg_13_0)
		Destroy(arg_13_0)
	end)

	if var_12_2 == 0 then
		SetParent(Instantiate(arg_12_0.tplList[1]), arg_12_0.aniContainerTF, false)
	else
		SetParent(Instantiate(arg_12_0.tplList[2]), arg_12_0.aniContainerTF, false)
	end
end

function var_0_0.OnDestroy(arg_14_0)
	var_0_0.super.OnDestroy(arg_14_0)

	if arg_14_0.animChar then
		arg_14_0.animChar:Dispose()

		arg_14_0.animChar = nil
	end
end

function var_0_0.showBubble(arg_15_0, arg_15_1)
	local var_15_0

	if not arg_15_1 then
		var_15_0 = i18n(arg_15_0.bubbleTextList[math.random(#arg_15_0.bubbleTextList)])
	else
		var_15_0 = arg_15_1
	end

	setText(arg_15_0.bubbleText, var_15_0)

	local function var_15_1(arg_16_0)
		arg_15_0.bubbleCG.alpha = arg_16_0

		setLocalScale(arg_15_0.bubbleTF, Vector3.one * arg_16_0)
	end

	local function var_15_2()
		LeanTween.value(go(arg_15_0.bubbleTF), 1, 0, var_0_0.FADE_OUT_TIME):setOnUpdate(System.Action_float(var_15_1)):setOnComplete(System.Action(function()
			setActive(arg_15_0.bubbleTF, false)
		end))
	end

	LeanTween.cancel(go(arg_15_0.bubbleTF))
	setActive(arg_15_0.bubbleTF, true)
	LeanTween.value(go(arg_15_0.bubbleTF), 0, 1, var_0_0.FADE_TIME):setOnUpdate(System.Action_float(var_15_1)):setOnComplete(System.Action(function()
		LeanTween.delayedCall(go(arg_15_0.bubbleTF), var_0_0.SHOW_TIME, System.Action(var_15_2))
	end))
end

return var_0_0
