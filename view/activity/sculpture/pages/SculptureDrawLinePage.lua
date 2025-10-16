local var_0_0 = class("SculptureDrawLinePage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "SculptureDrawLineUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.cg = GetOrAddComponent(arg_2_0._parentTf, typeof(CanvasGroup))
	arg_2_0.backBtn = arg_2_0._tf:Find("back")
	arg_2_0.helpBtn = arg_2_0._tf:Find("help")
	arg_2_0.frame = arg_2_0._tf:Find("frame")
	arg_2_0.eventTrigger = arg_2_0._tf:Find("frame"):GetComponent(typeof(EventTriggerListener))
	arg_2_0.uiCam = pg.UIMgr.GetInstance().uiCamera:GetComponent("Camera")
	arg_2_0.oneKeyBtn = arg_2_0.frame:Find("onekey")
	arg_2_0.penTpl = arg_2_0.frame:Find("pen")

	setText(arg_2_0._tf:Find("tip"), i18n("sculpture_drawline_tip"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.points = {}
	arg_3_0.index = 0
end

function var_0_0.Show(arg_4_0, arg_4_1, arg_4_2)
	var_0_0.super.Show(arg_4_0)

	arg_4_0.id = arg_4_1
	arg_4_0.activity = arg_4_2

	seriesAsync({
		function(arg_5_0)
			arg_4_0:Clear()
			arg_4_0:InitLine(arg_5_0)
		end,
		function(arg_6_0)
			arg_4_0:InitOneKey(arg_6_0)
		end,
		function(arg_7_0)
			arg_4_0:InitLineRendering()
			arg_4_0:RegisterEvent(arg_7_0)
		end
	})
	pg.BgmMgr.GetInstance():Push(arg_4_0.__cname, "bar-soft")
end

function var_0_0.InitLine(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.activity:GetResorceName(arg_8_0.id)

	ResourceMgr.Inst:getAssetAsync("ui/" .. var_8_0 .. "_line", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_9_0)
		arg_8_0.tracker = Object.Instantiate(arg_9_0, arg_8_0.frame).transform
		arg_8_0.trackerCollider = arg_8_0.tracker:GetComponent("EdgeCollider2D")

		arg_8_1()
	end), true, true)
end

function var_0_0.InitOneKey(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0.activity:GetResorceName(arg_10_0.id)

	ResourceMgr.Inst:getAssetAsync("ui/" .. var_10_0 .. "_onekey", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_11_0)
		local var_11_0 = Object.Instantiate(arg_11_0, arg_10_0.frame).transform

		arg_10_0.onekeyTrack = var_11_0:GetComponent("EdgeCollider2D")

		arg_10_1()
	end), true, true)
end

function var_0_0.InitLineRendering(arg_12_0)
	arg_12_0.eventTrigger:AddPointDownFunc(function(arg_13_0, arg_13_1)
		arg_12_0:OnPointDown(arg_13_1)
	end)
	arg_12_0.eventTrigger:AddPointUpFunc(function(arg_14_0, arg_14_1)
		arg_12_0:OnPointUp()
	end)
	arg_12_0.eventTrigger:AddDragFunc(function(arg_15_0, arg_15_1)
		arg_12_0.index = arg_12_0.index + 1

		if arg_12_0.index % 5 ~= 0 then
			return
		end

		arg_12_0:OnDrag(arg_15_1)
	end)
end

function var_0_0.OnPointDown(arg_16_0, arg_16_1)
	arg_16_0.points = {}

	arg_16_0:AddPoint(arg_16_1.position)

	local var_16_0 = arg_16_0.points[#arg_16_0.points]

	arg_16_0.pen = Object.Instantiate(arg_16_0.penTpl, var_16_0, Quaternion.New(0, 0, 0, 0), arg_16_0.frame)

	setActive(arg_16_0.pen, true)
end

function var_0_0.OnPointUp(arg_17_0)
	if not arg_17_0.pen then
		return
	end

	if #arg_17_0.points <= 2 then
		arg_17_0.points = {}

		return
	end

	local var_17_0 = true

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.points) do
		if not arg_17_0.trackerCollider:OverlapPoint(iter_17_1) then
			var_17_0 = false

			break
		end
	end

	if var_17_0 and (#arg_17_0.points < 20 or Vector2.Distance(arg_17_0.points[1], arg_17_0.points[#arg_17_0.points]) > 2) then
		var_17_0 = false
	end

	if not var_17_0 then
		arg_17_0.contextData.tipPage:ExecuteAction("Show")
	else
		arg_17_0:OnPass()
	end

	Object.Destroy(arg_17_0.pen.gameObject)

	arg_17_0.pen = nil
end

function var_0_0.OnPass(arg_18_0)
	arg_18_0.contextData.miniMsgBox:ExecuteAction("Show", {
		yes_text = "btn_next",
		effect = true,
		model = true,
		content = i18n("sculpture_drawline_done"),
		onYes = function()
			arg_18_0:emit(SculptureMediator.ON_DRAW_SCULPTURE, arg_18_0.id)
		end
	})
end

function var_0_0.OnDrag(arg_20_0, arg_20_1)
	if not arg_20_0.pen then
		return
	end

	arg_20_0:AddPoint(arg_20_1.position)

	local var_20_0 = arg_20_0.points[#arg_20_0.points]

	arg_20_0.pen.position = var_20_0
end

function var_0_0.AddPoint(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.uiCam:ScreenToWorldPoint(arg_21_1)
	local var_21_1 = Vector3(var_21_0.x, var_21_0.y, -1)

	table.insert(arg_21_0.points, var_21_1)
end

function var_0_0.RegisterEvent(arg_22_0, arg_22_1)
	onButton(arg_22_0, arg_22_0.backBtn, function()
		arg_22_0.contextData.miniMsgBox:ExecuteAction("Show", {
			showNo = true,
			content = i18n("sculpture_drawline_exit"),
			onYes = function()
				arg_22_0:Hide()
			end
		})
	end, SFX_PANEL)
	onButton(arg_22_0, arg_22_0.oneKeyBtn, function()
		arg_22_0:OnOneKey()
	end, SFX_PANEL)
	onButton(arg_22_0, arg_22_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.gift_act_help.tip
		})
	end, SFX_PANEL)
end

function var_0_0.OnOneKey(arg_27_0)
	arg_27_0.points = {}

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.onekeyTrack.points:ToTable()) do
		local var_27_0 = arg_27_0.tracker:TransformPoint(iter_27_1)
		local var_27_1 = Vector3(var_27_0.x, var_27_0.y, -1)

		table.insert(arg_27_0.points, var_27_1)
	end

	local function var_27_2(arg_28_0)
		if not arg_27_0.pen then
			arg_27_0.pen = Object.Instantiate(arg_27_0.penTpl, arg_28_0, Quaternion.New(0, 0, 0, 0), arg_27_0.frame)
		else
			arg_27_0.pen.position = arg_28_0
		end
	end

	local var_27_3 = {}

	for iter_27_2 = 1, #arg_27_0.points do
		table.insert(var_27_3, function(arg_29_0)
			var_27_2(arg_27_0.points[iter_27_2])
			onNextTick(arg_29_0)
		end)
	end

	arg_27_0.cg.blocksRaycasts = false

	seriesAsync(var_27_3, function()
		arg_27_0:OnPass()

		arg_27_0.cg.blocksRaycasts = true

		if arg_27_0.pen then
			Object.Destroy(arg_27_0.pen.gameObject)

			arg_27_0.pen = nil
		end
	end)
end

function var_0_0.Clear(arg_31_0)
	if not IsNil(arg_31_0.tracker) then
		Object.Destroy(arg_31_0.tracker.gameObject)
	end

	arg_31_0.points = {}
	arg_31_0.tracker = nil

	removeOnButton(arg_31_0.oneKeyBtn)
end

function var_0_0.Hide(arg_32_0)
	var_0_0.super.Hide(arg_32_0)
	pg.BgmMgr.GetInstance():Pop(arg_32_0.__cname)
	arg_32_0:Clear()
end

function var_0_0.OnDestroy(arg_33_0)
	arg_33_0.exited = true
end

return var_0_0
