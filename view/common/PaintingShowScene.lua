local var_0_0 = class("PaintingShowScene", import("..base.BaseUI"))
local var_0_1 = {
	{
		-176,
		-466,
		2,
		100,
		100,
		2
	},
	{
		526,
		-107,
		2,
		100,
		100,
		2
	},
	{
		-934,
		-115,
		2,
		100,
		100,
		2
	},
	{
		-32,
		643,
		2,
		100,
		100,
		2
	}
}
local var_0_2 = {
	ShipSkin.WITH_LIVE2D,
	ShipSkin.WITH_SPINE
}

function var_0_0.getUIName(arg_1_0)
	return "PaintingShowUI"
end

function var_0_0.didEnter(arg_2_0)
	arg_2_0.ad = findTF(arg_2_0._tf, "ad")
	arg_2_0.paintTf = findTF(arg_2_0.ad, "paint")
	arg_2_0.spineContainer = findTF(arg_2_0.ad, "paint/spinePainting")
	arg_2_0.l2dContainner = findTF(arg_2_0.ad, "paint/live2d")
	arg_2_0.paintingContainer = findTF(arg_2_0.ad, "paint")
	arg_2_0.paintingFitter = findTF(arg_2_0.ad, "paint/fitter")
	arg_2_0.effectContainer = findTF(arg_2_0.ad, "paint/effect")
	arg_2_0.flushAnimator = GetComponent(findTF(arg_2_0.ad, "flush"), typeof(Animator))
	arg_2_0.flushEevent = GetComponent(findTF(arg_2_0.ad, "flush"), typeof(DftAniEvent))
	arg_2_0.btnClose = findTF(arg_2_0.ad, "btnClose")
	arg_2_0.btnDebug = findTF(arg_2_0.ad, "btnDebug")
	arg_2_0.effectTf = findTF(arg_2_0.ad, "effect")

	onButton(arg_2_0, arg_2_0.btnClose, function()
		if not arg_2_0.loading then
			arg_2_0:closeView()
		end
	end)
	setActive(arg_2_0.btnDebug, false)
	onButton(arg_2_0, arg_2_0.btnDebug, function()
		arg_2_0:startShowing()
	end)
	arg_2_0.flushEevent:SetTriggerEvent(function(arg_5_0)
		if arg_2_0.triggerData then
			if not isActive(arg_2_0.paintTf) then
				SetActive(arg_2_0.paintTf, true)
			end

			arg_2_0.paintTf.anchoredPosition = arg_2_0.triggerData.pos
			arg_2_0.paintTf.localScale = Vector3(arg_2_0.triggerData.scale, arg_2_0.triggerData.scale, arg_2_0.triggerData.scale)
		elseif not arg_2_0.debugFlag then
			arg_2_0:closeView()
		end
	end)
	arg_2_0.flushEevent:SetEndEvent(function(arg_6_0)
		if arg_2_0.triggerData then
			arg_2_0:movePaint(function()
				arg_2_0:flushPainting()
			end)
		end
	end)

	arg_2_0.loading = false

	SetActive(arg_2_0.paintTf, false)

	arg_2_0.closeCallBack = arg_2_0.contextData.callback
	arg_2_0.skinId = arg_2_0.contextData.skinId

	pg.UIMgr.GetInstance():BlurPanel(arg_2_0.ad)

	if arg_2_0.skinId then
		local var_2_0 = pg.ship_skin_template[arg_2_0.skinId]
		local var_2_1 = var_2_0.ship_group * 10 + 1

		if var_2_0.get_showing then
			arg_2_0.debugFlag = var_2_0.get_showing.debug == 1 and true or false
		end

		setActive(arg_2_0.btnDebug, arg_2_0.debugFlag)
		arg_2_0:loadShowPaint(var_2_1, arg_2_0.skinId, function()
			arg_2_0:startShowing()
		end)
	else
		onNextTick(function()
			arg_2_0:closeView()
		end)
	end
end

function var_0_0.startShowing(arg_10_0)
	if not arg_10_0.l2dFlag then
		local var_10_0 = pg.ship_skin_template[arg_10_0.skinId]
		local var_10_1 = var_10_0.get_showing.data and var_10_0.get_showing.data or var_0_1
		local var_10_2
		local var_10_3

		if arg_10_0.paintOffset then
			var_10_2 = Vector2(arg_10_0.paintOffset[1], arg_10_0.paintOffset[2])
			var_10_3 = arg_10_0.paintOffset[3]
		else
			var_10_2 = Vector2(0, 0)
			var_10_3 = 1
		end

		arg_10_0.showDatas = {}

		for iter_10_0 = 1, #var_10_1 do
			local var_10_4 = var_10_1[iter_10_0]
			local var_10_5 = Vector2(var_10_4[1] + var_10_2.x, var_10_4[2] + var_10_2.y)
			local var_10_6 = var_10_4[3] * var_10_3
			local var_10_7
			local var_10_8

			if #var_10_4 >= 4 then
				var_10_7 = Vector3(var_10_4[1] + var_10_2.x + var_10_4[4], var_10_4[2] + var_10_2.y + var_10_4[5], 0)
				var_10_8 = var_10_4[6]
			end

			table.insert(arg_10_0.showDatas, {
				pos = var_10_5,
				scale = var_10_6,
				move = var_10_7,
				move_time = var_10_8
			})
		end

		arg_10_0:flushPainting()
	end
end

function var_0_0.flushPainting(arg_11_0)
	if #arg_11_0.showDatas > 0 then
		arg_11_0.triggerData = table.remove(arg_11_0.showDatas, 1)

		arg_11_0.flushAnimator:SetTrigger("active")
	else
		arg_11_0.triggerData = nil

		arg_11_0.flushAnimator:SetTrigger("active")
	end
end

function var_0_0.movePaint(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.triggerData.move
	local var_12_1 = arg_12_0.triggerData.move_time

	if var_12_0 and var_12_1 then
		LeanTween.moveLocal(go(arg_12_0.paintingContainer), var_12_0, var_12_1):setOnComplete(System.Action(function()
			if arg_12_1 then
				arg_12_1()
			end
		end))
	elseif arg_12_1 then
		arg_12_1()
	end
end

function var_0_0.loadShowPaint(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_0.loading = true
	arg_14_0.flagShip = Ship.New({
		configId = arg_14_1,
		skin_id = arg_14_2
	})

	local var_14_0 = arg_14_0.flagShip
	local var_14_1 = MainPaintingView.GetAssistantStatus(var_14_0)
	local var_14_2 = var_14_0:GetSkinConfig().tag
	local var_14_3 = pg.ship_skin_template[arg_14_0.skinId]

	if var_14_1 == MainPaintingView.STATE_SPINE_PAINTING then
		local var_14_4 = SpinePainting.GenerateData({
			ship = var_14_0,
			position = Vector3(0, 0, 0),
			parent = arg_14_0.spineContainer,
			effectParent = arg_14_0.effectContainer
		})

		arg_14_0.spinePainting = SpinePainting.New(var_14_4, function(arg_15_0)
			local var_15_0 = arg_15_0:GetSpineTrasform():GetComponent(typeof(ItemList)).prefabItem:ToTable()

			for iter_15_0, iter_15_1 in ipairs(var_15_0) do
				local var_15_1 = GetComponent(iter_15_1, typeof(Canvas))

				if var_15_1 then
					RemoveComponent(var_15_1, typeof(Canvas))
				end
			end

			arg_14_0.loading = false

			arg_14_3()
		end)
	elseif var_14_1 == MainPaintingView.STATE_PAINTING then
		arg_14_0.paintOffset = var_14_3.get_showing.paint_offset and var_14_3.get_showing.paint_offset or nil

		if (table.contains(var_14_2, ShipSkin.WITH_LIVE2D) or table.contains(var_14_2, ShipSkin.WITH_SPINE)) and not arg_14_0.paintOffset then
			arg_14_0.paintingFitter.localScale = Vector3(1.1, 1.1, 1.1)
		end

		local var_14_5 = var_14_0:getPainting()

		LoadPaintingPrefabAsync(arg_14_0.paintingContainer, var_14_5, var_14_5, "mainNormal", function()
			arg_14_0.loading = false

			arg_14_3()
		end)
	elseif var_14_1 == MainPaintingView.STATE_L2D then
		local var_14_6 = Live2D.GenerateData({
			ship = var_14_0,
			position = Vector3(0, 0, -1),
			parent = arg_14_0.l2dContainner
		})

		arg_14_0.live2dChar = Live2D.New(var_14_6, function(arg_17_0)
			arg_14_0:updateL2dSortMode(arg_17_0)
			arg_17_0:IgonreReactPos(true)

			arg_14_0.loading = false

			arg_14_3()
		end)
	else
		arg_14_0.paintOffset = var_14_3.get_showing.paint_offset and var_14_3.get_showing.paint_offset or nil

		if (table.contains(var_14_2, ShipSkin.WITH_LIVE2D) or table.contains(var_14_2, ShipSkin.WITH_SPINE)) and not arg_14_0.paintOffset then
			arg_14_0.paintingFitter.localScale = Vector3(1.1, 1.1, 1.1)
		end

		local var_14_7 = var_14_0:getPainting()

		LoadPaintingPrefabAsync(arg_14_0.paintingContainer, var_14_7, var_14_7, "mainNormal", function()
			arg_14_0.loading = false
		end)
	end
end

function var_0_0.updateL2dSortMode(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_19_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")
	local var_19_2 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontOrder", nil)

	ReflectionHelp.RefSetProperty(var_19_1, "SortingMode", var_19_0, var_19_2)
end

function var_0_0.StaticGetPaintingName(arg_20_0)
	local var_20_0 = arg_20_0

	if HXSet.isHx() then
		return var_20_0
	end

	local var_20_1 = getProxy(SettingsProxy):GetMainPaintingVariantFlag(arg_20_0) == var_0_0.PAINTING_VARIANT_EX

	if var_20_1 and not checkABExist("painting/" .. var_20_0 .. "_ex") then
		return var_20_0
	end

	return var_20_1 and var_20_0 .. "_ex" or var_20_0
end

function var_0_0.closeView(arg_21_0)
	if arg_21_0.loading then
		return
	end

	var_0_0.super.closeView(arg_21_0)
end

function var_0_0.onBackPressed(arg_22_0)
	if arg_22_0.loading then
		return
	end

	var_0_0.super.onBackPressed(arg_22_0)
end

function var_0_0.GetSkinShowAble(arg_23_0)
	local var_23_0 = pg.ship_skin_template[arg_23_0]
	local var_23_1 = false

	if var_23_0.get_showing.show and var_23_0.get_showing.show == 1 then
		var_23_1 = true
	end

	return var_23_1
end

function var_0_0.willExit(arg_24_0)
	arg_24_0.flushEevent:SetTriggerEvent(nil)
	arg_24_0.flushEevent:SetEndEvent(nil)

	if LeanTween.isTweening(go(arg_24_0.paintingContainer)) then
		LeanTween.cancel(go(arg_24_0.paintingContainer))
	end

	if arg_24_0.live2dChar then
		arg_24_0.live2dChar:Dispose()

		arg_24_0.live2dChar = nil
	end

	if arg_24_0.spinePainting then
		arg_24_0.spinePainting:Dispose()

		arg_24_0.spinePainting = nil
	end

	if arg_24_0.closeCallBack then
		arg_24_0.closeCallBack()

		arg_24_0.closeCallBack = nil
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_24_0.ad, arg_24_0._tf)
end

return var_0_0
