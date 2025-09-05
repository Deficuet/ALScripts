local var_0_0 = class("IslandGetShipPage", import(".IslandBaseShipDisplayPage"))
local var_0_1 = "hi"

function var_0_0.getUIName(arg_1_0)
	return "IslandGetShipUI"
end

function var_0_0.NeedCache(arg_2_0)
	return false
end

function var_0_0.Preload(arg_3_0, arg_3_1, arg_3_2)
	seriesAsync({
		function(arg_4_0)
			arg_3_0:PlayTimeline(arg_4_0, arg_3_2)
		end,
		function(arg_5_0)
			arg_3_0:PrepareCharacterScene(arg_5_0)
		end
	}, function()
		IslandGuideChecker.CheckGuide("ISLAND_GUIDE_12")
		existCall(arg_3_1)
	end)
end

function var_0_0.PlayTimeline(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_2:getConfig("unit_id")

	arg_7_0:PlayGetShipTimeline(var_7_0, arg_7_1)
end

function var_0_0.OnLoaded(arg_8_0)
	arg_8_0.mainPanel = arg_8_0._tf:Find("main")
	arg_8_0.radarTr = arg_8_0._tf:Find("main/rader")
	arg_8_0.drawPolygon = arg_8_0._tf:Find("main/rader/Quad"):GetComponent("DrawPolygon")
	arg_8_0.back = arg_8_0._tf:Find("main/back")
	arg_8_0.goBtn = arg_8_0._tf:Find("main/go")
	arg_8_0.chatTr = arg_8_0._tf:Find("chat")
	arg_8_0.chatTxt = arg_8_0._tf:Find("chat/Text"):GetComponent(typeof(Text))
	arg_8_0.nameTxt = arg_8_0._tf:Find("main/name"):GetComponent(typeof(Text))
	arg_8_0.enNameTxt = arg_8_0._tf:Find("main/en"):GetComponent(typeof(Text))

	setActive(arg_8_0.chatTr, false)

	arg_8_0.radarTxts = {
		arg_8_0:findTF("main/rader/1/Text"):GetComponent(typeof(Text)),
		arg_8_0:findTF("main/rader/2/Text"):GetComponent(typeof(Text)),
		arg_8_0:findTF("main/rader/3/Text"):GetComponent(typeof(Text)),
		arg_8_0:findTF("main/rader/4/Text"):GetComponent(typeof(Text)),
		arg_8_0:findTF("main/rader/5/Text"):GetComponent(typeof(Text)),
		arg_8_0:findTF("main/rader/6/Text"):GetComponent(typeof(Text))
	}
end

function var_0_0.GetActiveCamName(arg_9_0)
	return IslandConst.GET_CHARA_CAMERA_NAME
end

function var_0_0.OnInit(arg_10_0)
	onButton(arg_10_0, arg_10_0._tf, function()
		arg_10_0:Hide()
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.back, function()
		arg_10_0:Hide()
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.goBtn, function()
		arg_10_0:Hide()
		arg_10_0:OpenScenePage(IslandShipMainPage)
	end, SFX_PANEL)
	arg_10_0:InitRaderTxt()
end

function var_0_0.OnShow(arg_14_0, arg_14_1)
	arg_14_0.ship = arg_14_1

	setActive(arg_14_0.mainPanel, false)
	arg_14_0:LoadCharacter(arg_14_0.ship:GetModel())
end

function var_0_0.OnCharLoaded(arg_15_0)
	arg_15_0.passTime = 0
	arg_15_0.animator = GetOrAddComponent(arg_15_0.role.transform:GetChild(0), typeof(Animator))

	if not arg_15_0.handle then
		arg_15_0.handle = UpdateBeat:CreateListener(arg_15_0.Update, arg_15_0)
	end

	UpdateBeat:AddListener(arg_15_0.handle)
	arg_15_0:PlayAnimation()
	arg_15_0:UpdateChat(arg_15_0.ship)
end

function var_0_0.Update(arg_16_0)
	arg_16_0.passTime = arg_16_0.passTime + Time.deltaTime

	local var_16_0 = arg_16_0.animator:GetCurrentAnimatorStateInfo(0)

	if var_16_0:IsName(var_0_1) and not arg_16_0.endTime then
		local var_16_1 = var_16_0.length / arg_16_0.animator.speed

		arg_16_0.endTime = arg_16_0.passTime + var_16_1
	end

	if arg_16_0.endTime and arg_16_0.passTime >= arg_16_0.endTime then
		arg_16_0:OnHelloAnimEnd()

		arg_16_0.endTime = nil
	end
end

function var_0_0.OnHelloAnimEnd(arg_17_0)
	setActive(arg_17_0.mainPanel, true)
	arg_17_0:InitRader(arg_17_0.ship)
	arg_17_0:UpdateNames(arg_17_0.ship)
	setActive(arg_17_0.chatTr, false)

	if arg_17_0.handle then
		UpdateBeat:RemoveListener(arg_17_0.handle)

		arg_17_0.handle = nil
	end
end

function var_0_0.PlayAnimation(arg_18_0)
	local var_18_0 = Animator.StringToHash(var_0_1)

	for iter_18_0 = 1, arg_18_0.animator.layerCount do
		arg_18_0.animator:CrossFadeInFixedTime(var_18_0, 0.2, iter_18_0 - 1)
	end
end

function var_0_0.GetSmoothRotateObject(arg_19_0)
	return GetOrAddComponent(arg_19_0:findTF("main/event"), typeof(SmoothRotateObject))
end

function var_0_0.UpdateChat(arg_20_0, arg_20_1)
	arg_20_0.chatTxt.text = arg_20_1:GetNewShipWord()
end

function var_0_0.InitRaderTxt(arg_21_0)
	for iter_21_0, iter_21_1 in ipairs(IslandShipAttr.ATTRS) do
		local var_21_0 = IslandShipAttr.ToChinese(iter_21_1)

		arg_21_0.radarTxts[iter_21_0].text = var_21_0
	end
end

function var_0_0.InitRader(arg_22_0, arg_22_1)
	local var_22_0 = IslandShipAttr.ATTRS
	local var_22_1 = {}
	local var_22_2 = {}
	local var_22_3 = IslandCalcUtil.GetUnReHexPoints(arg_22_0.radarTr.rect.width - 10, arg_22_0.radarTr.rect.height - 10, 30)

	table.insert(var_22_1, Vector3(0, 0, 0))

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		local var_22_4 = arg_22_1:GetAttr(iter_22_1)

		table.insert(var_22_1, arg_22_0:GetPoint(var_22_3[iter_22_0], var_22_4, 30))
		table.insert(var_22_2, 0)
		table.insert(var_22_2, iter_22_0)

		if iter_22_0 + 1 > #var_22_0 then
			table.insert(var_22_2, 1)
		else
			table.insert(var_22_2, iter_22_0 + 1)
		end
	end

	local var_22_5 = IslandCalcUtil.Vetor3Table2Array(var_22_1)

	arg_22_0.drawPolygon:draw(var_22_5, var_22_2)
end

function var_0_0.GetPoint(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = Mathf.Clamp01(arg_23_2 / arg_23_3)

	return Vector2.Normalize(arg_23_1) * (Vector2.Magnitude(arg_23_1) * var_23_0)
end

function var_0_0.UpdateNames(arg_24_0, arg_24_1)
	arg_24_0.nameTxt.text = arg_24_1:GetName()
	arg_24_0.enNameTxt.text = arg_24_1:GetEnName()
end

function var_0_0.OnDestroy(arg_25_0)
	var_0_0.super.OnDestroy(arg_25_0)

	if arg_25_0.handle then
		UpdateBeat:RemoveListener(arg_25_0.handle)

		arg_25_0.handle = nil
	end
end

return var_0_0
