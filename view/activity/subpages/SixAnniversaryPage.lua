local var_0_0 = class("SixAnniversaryPage", import("...base.BaseActivityPage"))
local var_0_1 = 42
local var_0_2 = {}
local var_0_3 = 3.5
local var_0_4 = 1
local var_0_5 = 5
local var_0_6 = SCENE.NEWYEAR_BACKHILL_2023
local var_0_7 = false
local var_0_8 = "sixth"

function var_0_0.OnInit(arg_1_0)
	arg_1_0.hideIndex = {}
	arg_1_0.scrollAble = var_0_7

	local var_1_0 = findTF(arg_1_0._tf, "BtnList")

	if PLATFORM_CODE == PLATFORM_CH then
		var_0_2 = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		}
	else
		var_0_2 = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		}
	end

	if PLATFORM_CODE == PLATFORM_CH then
		arg_1_0.hideIndex = {}
	elseif PLATFORM_CODE == PLATFORM_CHT then
		arg_1_0.hideIndex = {
			2,
			3,
			5
		}
	else
		arg_1_0.hideIndex = {
			2,
			5
		}
	end

	local var_1_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.SIX_SIGN_ACT_ID)

	if not var_1_1 or not var_1_1:isShow() then
		table.insert(arg_1_0.hideIndex, 4)
	end

	arg_1_0:findUI()
end

function var_0_0.findUI(arg_2_0)
	arg_2_0.paintBackTF = arg_2_0._tf:Find("Paints/PaintBack")
	arg_2_0.paintFrontTF = arg_2_0._tf:Find("Paints/PaintFront")
	arg_2_0.skinShopBtn = arg_2_0._tf:Find("BtnShop")
	arg_2_0.btnContainer = arg_2_0._tf:Find("BtnList/Viewport/Content")

	local var_2_0 = arg_2_0.btnContainer.childCount / 3

	arg_2_0.btnList1 = {}

	for iter_2_0 = 0, var_2_0 - 1 do
		arg_2_0.btnList1[iter_2_0 + 1] = arg_2_0.btnContainer:GetChild(iter_2_0)
	end

	arg_2_0.btnList2 = {}

	for iter_2_1 = var_2_0, 2 * var_2_0 - 1 do
		arg_2_0.btnList2[#arg_2_0.btnList2 + 1] = arg_2_0.btnContainer:GetChild(iter_2_1)
	end

	arg_2_0.btnList3 = {}

	for iter_2_2 = var_2_0 * 2, 3 * var_2_0 - 1 do
		arg_2_0.btnList3[#arg_2_0.btnList3 + 1] = arg_2_0.btnContainer:GetChild(iter_2_2)
	end

	for iter_2_3 = 1, var_2_0 * 3 do
		if table.contains(arg_2_0.hideIndex, (iter_2_3 - 1) % var_0_5 + 1) or not arg_2_0.scrollAble and iter_2_3 > var_0_5 then
			setActive(arg_2_0.btnContainer:GetChild(iter_2_3 - 1), false)
		end
	end

	arg_2_0.gridLayoutGroupCom = GetComponent(arg_2_0.btnContainer, "GridLayoutGroup")
end

function var_0_0.initData(arg_3_0)
	arg_3_0.displayDatas = arg_3_0.activity:getConfig("config_client").display_link

	local var_3_0 = {}

	if arg_3_0.displayDatas and #arg_3_0.displayDatas then
		for iter_3_0 = 1, #arg_3_0.displayDatas do
			local var_3_1 = arg_3_0.displayDatas[iter_3_0]
			local var_3_2 = var_3_1[1]
			local var_3_3 = var_3_1[2]

			if var_3_3 and var_3_3 ~= 0 then
				local var_3_4 = pg.shop_template[var_3_3].time
				local var_3_5, var_3_6 = pg.TimeMgr.GetInstance():inTime(var_3_4)

				if not var_3_5 then
					table.insert(var_3_0, var_3_2)
				end
			end
		end
	end

	if var_3_0 and #var_3_0 > 0 then
		for iter_3_1 = #var_0_2, 1, -1 do
			local var_3_7 = var_0_2[iter_3_1]

			if table.contains(var_3_0, var_3_7) then
				table.remove(var_0_2, iter_3_1)
			end
		end
	end

	arg_3_0.paintCount = #var_0_2
	arg_3_0.curPaintIndex = math.random(1, #var_0_2)
	arg_3_0.paintSwitchTime = var_0_4
	arg_3_0.paintStaticTime = var_0_3
	arg_3_0.paintStaticCountValue = 0
	arg_3_0.paintPathPrefix = "clutter/"
	arg_3_0.paintNamePrefix = var_0_8
	arg_3_0.btnCount = arg_3_0.btnContainer.childCount / 3
	arg_3_0.btnSpeed = 50
	arg_3_0.btnSizeX = arg_3_0.gridLayoutGroupCom.cellSize.x
	arg_3_0.btnMarginX = arg_3_0.gridLayoutGroupCom.spacing.x
	arg_3_0.moveLength = (arg_3_0.btnCount - #arg_3_0.hideIndex) * (arg_3_0.btnSizeX + arg_3_0.btnMarginX)
	arg_3_0.startAnchoredPosX = arg_3_0.btnContainer.anchoredPosition.x
end

function var_0_0.switchNextPaint(arg_4_0)
	arg_4_0.frameTimer:Stop()

	local var_4_0 = arg_4_0.curPaintIndex % arg_4_0.paintCount + 1
	local var_4_1 = arg_4_0.paintNamePrefix .. var_0_2[var_4_0]
	local var_4_2 = arg_4_0.paintPathPrefix .. var_4_1
	local var_4_3 = nil or LoadSprite(var_4_2, var_4_1)

	setImageSprite(arg_4_0.paintBackTF, var_4_3)
	LeanTween.value(go(arg_4_0.paintFrontTF), 1, 0, arg_4_0.paintSwitchTime):setOnUpdate(System.Action_float(function(arg_5_0)
		setImageAlpha(arg_4_0.paintFrontTF, arg_5_0)
		setImageAlpha(arg_4_0.paintBackTF, 1 - arg_5_0)
	end)):setOnComplete(System.Action(function()
		setImageFromImage(arg_4_0.paintFrontTF, arg_4_0.paintBackTF)
		setImageAlpha(arg_4_0.paintFrontTF, 1)
		setImageAlpha(arg_4_0.paintBackTF, 0)

		arg_4_0.curPaintIndex = var_4_0

		arg_4_0.frameTimer:Start()
	end))
end

function var_0_0.OnFirstFlush(arg_7_0)
	arg_7_0:initData()
	onButton(arg_7_0, arg_7_0.skinShopBtn, function()
		arg_7_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SKINSHOP)
	end)
	arg_7_0:initPaint()
	arg_7_0:initBtnList(arg_7_0.btnList1)
	arg_7_0:initBtnList(arg_7_0.btnList2)
	arg_7_0:initBtnList(arg_7_0.btnList3)
	arg_7_0:initTimer()
end

function var_0_0.initPaint(arg_9_0)
	local var_9_0 = (arg_9_0.curPaintIndex - 1) % arg_9_0.paintCount + 1
	local var_9_1 = arg_9_0.paintNamePrefix .. var_0_2[var_9_0]
	local var_9_2 = arg_9_0.paintPathPrefix .. var_9_1

	setImageSprite(arg_9_0.paintFrontTF, LoadSprite(var_9_2, var_9_1))

	local var_9_3 = arg_9_0.paintNamePrefix .. var_0_2[var_9_0]
	local var_9_4 = arg_9_0.paintPathPrefix .. var_9_3

	setImageSprite(arg_9_0.paintBackTF, LoadSprite(var_9_4, var_9_3))
end

function var_0_0.initBtnList(arg_10_0, arg_10_1)
	for iter_10_0 = 1, #arg_10_1 do
		arg_10_0:initBtnEvent(arg_10_1[iter_10_0], iter_10_0)
	end
end

function var_0_0.initBtnEvent(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_2 == 1 then
		onButton(arg_11_0, arg_11_1, function()
			arg_11_0:emit(ActivityMediator.GO_PRAY_POOL)
		end, SFX_PANEL)
	elseif arg_11_2 == 2 then
		onButton(arg_11_0, arg_11_1, function()
			arg_11_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.CHARGE, {
				wrap = ChargeScene.TYPE_DIAMOND
			})
		end, SFX_PANEL)
	elseif arg_11_2 == 3 then
		onButton(arg_11_0, arg_11_1, function()
			arg_11_0:emit(ActivityMediator.SELECT_ACTIVITY, ActivityConst.ACTIVITY_TYPE_RETURN_AWARD_ID6)
		end, SFX_PANEL)
	elseif arg_11_2 == 4 then
		onButton(arg_11_0, arg_11_1, function()
			arg_11_0:emit(ActivityMediator.SELECT_ACTIVITY, ActivityConst.SIX_SIGN_ACT_ID)
		end, SFX_PANEL)
	elseif arg_11_2 == 5 then
		onButton(arg_11_0, arg_11_1, function()
			arg_11_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SUMMARY)
		end, SFX_PANEL)
	end
end

function var_0_0.initTimer(arg_17_0)
	local var_17_0 = 0.016666666666666666

	arg_17_0.paintStaticCountValue = 0
	arg_17_0.frameTimer = Timer.New(function()
		arg_17_0.paintStaticCountValue = arg_17_0.paintStaticCountValue + var_17_0

		if arg_17_0.paintStaticCountValue >= arg_17_0.paintStaticTime then
			arg_17_0.paintStaticCountValue = 0

			arg_17_0:switchNextPaint()
		end
	end, var_17_0, -1, false)

	arg_17_0.frameTimer:Start()

	if arg_17_0.scrollAble then
		arg_17_0.frameTimer2 = Timer.New(function()
			local var_19_0 = arg_17_0.btnContainer.anchoredPosition.x - arg_17_0.btnSpeed * var_17_0

			if arg_17_0.startAnchoredPosX - var_19_0 >= arg_17_0.moveLength then
				var_19_0 = arg_17_0.btnContainer.anchoredPosition.x + arg_17_0.moveLength
			end

			arg_17_0.btnContainer.anchoredPosition = Vector3(var_19_0, 0, 0)
		end, var_17_0, -1, false)

		arg_17_0.frameTimer2:Start()
	end
end

function var_0_0.OnDestroy(arg_20_0)
	if LeanTween.isTweening(go(arg_20_0.paintFrontTF)) then
		LeanTween.cancel(go(arg_20_0.paintFrontTF))
	end

	if arg_20_0.frameTimer then
		arg_20_0.frameTimer:Stop()

		arg_20_0.frameTimer = nil
	end

	if arg_20_0.frameTimer2 then
		arg_20_0.frameTimer2:Stop()

		arg_20_0.frameTimer2 = nil
	end
end

return var_0_0
