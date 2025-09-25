local var_0_0 = class("IslandAniamtionOpCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.tipTr = arg_1_0._tf:Find("tip")
	arg_1_0.cutoffTr = arg_1_0._tf:Find("cut_off ")
	arg_1_0.item1 = arg_1_0._tf:Find("1/main")
	arg_1_0.item2 = arg_1_0._tf:Find("2/main")
	arg_1_0.item1TimeTr = arg_1_0.item1:Find("time")
	arg_1_0.item2TimeTr = arg_1_0.item2:Find("time")

	setActive(arg_1_0.item1TimeTr, false)
	setActive(arg_1_0.item2TimeTr, false)

	arg_1_0.layoutElement = arg_1_0._tf:GetComponent(typeof(LayoutElement))
	arg_1_0.baseHeight = arg_1_0.layoutElement.preferredHeight
	arg_1_0.cutOffHeight = arg_1_0.cutoffTr:GetComponent(typeof(LayoutElement)).preferredHeight
	arg_1_0.animationItem1 = arg_1_0._tf:Find("1"):GetComponent(typeof(Animation))
	arg_1_0.animationItem2 = arg_1_0._tf:Find("2"):GetComponent(typeof(Animation))
end

function var_0_0.Contains(arg_2_0, arg_2_1)
	return arg_2_0.firstId == arg_2_1 or arg_2_0.secondId == arg_2_1
end

function var_0_0.Update(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = arg_3_1[1]
	local var_3_1 = arg_3_1[2]

	arg_3_0.firstId = var_3_0
	arg_3_0.secondId = var_3_1

	arg_3_0:UpdateItem(arg_3_0.item1, var_3_0)
	arg_3_0:UpdateItem(arg_3_0.item2, var_3_1)
	arg_3_0:UpdateSelected(arg_3_2)
	arg_3_0:LoadingEffect(arg_3_3)
	setActive(arg_3_0.tipTr, false)
end

function var_0_0.UpdateItem(arg_4_0, arg_4_1, arg_4_2)
	setActive(arg_4_1, arg_4_2)

	if not arg_4_2 then
		return
	end

	local var_4_0 = pg.island_action[arg_4_2]

	setText(arg_4_1:Find("Text"), var_4_0.name)
	setActive(arg_4_1:Find("double"), var_4_0.type == IslandConst.ANIMATION_OP_DOUBLE)
	LoadImageSpriteAsync("island/IslandActionIcon/" .. var_4_0.resource, arg_4_1:Find("icon"), true)
end

function var_0_0.UpdateSelected(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.firstId and arg_5_1 == arg_5_0.firstId
	local var_5_1 = arg_5_0.secondId and arg_5_1 == arg_5_0.secondId

	arg_5_0:PlayAnimtion(var_5_0, var_5_1)
end

function var_0_0.PlayAnimtion(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_1 then
		arg_6_0.animationItem1:Play("Anim_IslandActionOpUI_Selected")
	else
		arg_6_0.animationItem1:Play("Anim_IslandActionOpUI_UnSelected")
	end

	if arg_6_2 then
		arg_6_0.animationItem2:Play("Anim_IslandActionOpUI_Selected")
	else
		arg_6_0.animationItem2:Play("Anim_IslandActionOpUI_UnSelected")
	end
end

function var_0_0.Clear(arg_7_0, ...)
	arg_7_0.animationItem1:Play("Anim_IslandActionOpUI_UnSelected")
	arg_7_0.animationItem2:Play("Anim_IslandActionOpUI_UnSelected")
	LeanTween.cancel(go(arg_7_0.item1TimeTr))
	LeanTween.cancel(go(arg_7_0.item2TimeTr))
end

function var_0_0.LoadingEffect(arg_8_0, arg_8_1)
	arg_8_0:ClearLoadingEffect()

	if not arg_8_1 then
		return
	end

	local var_8_0 = arg_8_0.firstId and arg_8_1.id == arg_8_0.firstId
	local var_8_1 = arg_8_0.secondId and arg_8_1.id == arg_8_0.secondId
	local var_8_2

	if var_8_0 then
		var_8_2 = arg_8_0.item1TimeTr
	elseif var_8_1 then
		var_8_2 = arg_8_0.item2TimeTr
	end

	if not var_8_2 then
		return
	end

	local var_8_3 = arg_8_1.startTime
	local var_8_4 = arg_8_1.endTime
	local var_8_5 = var_8_4 - var_8_3
	local var_8_6 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_8_7 = (var_8_6 - var_8_3) / var_8_5
	local var_8_8 = var_8_4 - var_8_6

	setActive(var_8_2, true)
	LeanTween.value(go(var_8_2), var_8_7, 1, var_8_8):setOnUpdate(System.Action_float(function(arg_9_0)
		setFillAmount(var_8_2, arg_9_0)
	end)):setOnComplete(System.Action(function()
		setActive(var_8_2, false)
	end))
end

function var_0_0.ClearLoadingEffect(arg_11_0)
	setActive(arg_11_0.item1TimeTr, false)
	setActive(arg_11_0.item2TimeTr, false)
	LeanTween.cancel(go(arg_11_0.item1TimeTr))
	LeanTween.cancel(go(arg_11_0.item2TimeTr))
end

function var_0_0.Dispose(arg_12_0)
	arg_12_0:Clear()
end

return var_0_0
