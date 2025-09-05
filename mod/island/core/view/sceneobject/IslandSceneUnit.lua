local var_0_0 = class("IslandSceneUnit", import("..IslandBaseUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
	assert(arg_1_2.id)

	arg_1_0.id = arg_1_2.id
	arg_1_0.modelId = arg_1_2.modelId or 0
	arg_1_0.name = arg_1_2.name or ""
	arg_1_0.position = arg_1_2.position or Vector3.zero
	arg_1_0.rotation = arg_1_2.rotation or Vector3.zero
	arg_1_0.data = arg_1_2
	arg_1_0.active = true
	arg_1_0.unitType = nil
end

function var_0_0.GetDataVO(arg_2_0)
	return arg_2_0.data
end

function var_0_0.ResetPosition(arg_3_0)
	arg_3_0._go.transform.position = arg_3_0.position
	arg_3_0._go.transform.eulerAngles = arg_3_0.rotation
end

function var_0_0.OnInit(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0._go = arg_4_1
	arg_4_0.builder = arg_4_2

	assert(arg_4_0.builder and arg_4_0._go)
	SetParent(arg_4_0._go, arg_4_0:GetView().root)

	arg_4_0._go.name = arg_4_0.name
	arg_4_0.behaviourTreeOwner = arg_4_0._go:GetComponent(typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))

	arg_4_0:OnAttach(arg_4_1)

	arg_4_0._go.transform.position = arg_4_0.position
	arg_4_0._go.transform.eulerAngles = arg_4_0.rotation

	arg_4_0:OnLaterAttach(arg_4_1)

	arg_4_0._go.transform.position = arg_4_0.position
	arg_4_0._go.transform.eulerAngles = arg_4_0.rotation

	if arg_4_0:GetView():IsInit() then
		arg_4_0:Start()
	end
end

function var_0_0.OnAnomalyInit(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2:Recycle(arg_5_0.data, arg_5_1)
end

function var_0_0.SetUnitType(arg_6_0, arg_6_1)
	arg_6_0.unitType = arg_6_1
end

function var_0_0.GetUnitType(arg_7_0)
	return arg_7_0.unitType
end

function var_0_0.Start(arg_8_0)
	arg_8_0:SetupBt()
	arg_8_0:OnStart()
end

function var_0_0.OnDispose(arg_9_0)
	arg_9_0:OnDetach()
	arg_9_0:ClearBt()
	arg_9_0.builder:Recycle(arg_9_0.data, arg_9_0._go)

	arg_9_0._go = nil
end

function var_0_0.Dispose(arg_10_0)
	var_0_0.super.Dispose(arg_10_0)

	arg_10_0.builder = nil
end

function var_0_0.SetupBt(arg_11_0)
	if not arg_11_0.behaviourTreeOwner then
		return
	end

	arg_11_0.behaviourTreeOwner:StartBehaviour()
end

function var_0_0.RestartBt(arg_12_0)
	if not arg_12_0.behaviourTreeOwner then
		return
	end

	arg_12_0.behaviourTreeOwner:RestartBehaviour()
end

function var_0_0.PauseBt(arg_13_0)
	if not arg_13_0.behaviourTreeOwner then
		return
	end

	arg_13_0.behaviourTreeOwner:PauseBehaviour()
end

function var_0_0.StopBt(arg_14_0)
	if not arg_14_0.behaviourTreeOwner then
		return
	end

	arg_14_0.behaviourTreeOwner:StopBehaviour()
end

function var_0_0.ClearBt(arg_15_0)
	arg_15_0:StopBt()

	arg_15_0.behaviourTreeOwner = nil
end

function var_0_0.Enable(arg_16_0)
	if not arg_16_0:IsLoaded() then
		return
	end

	setActive(arg_16_0._go, true)
	arg_16_0:ActiveOrDisactive(true)
end

function var_0_0.Disable(arg_17_0)
	if not arg_17_0:IsLoaded() then
		return
	end

	setActive(arg_17_0._go, false)
	arg_17_0:ActiveOrDisactive(false)
end

function var_0_0.ActiveOrDisactive(arg_18_0, arg_18_1)
	arg_18_0.active = arg_18_1
end

function var_0_0.Update(arg_19_0)
	if not arg_19_0.active then
		return
	end

	var_0_0.super.Update(arg_19_0)
end

function var_0_0.OnAttach(arg_20_0, arg_20_1)
	return
end

function var_0_0.OnLaterAttach(arg_21_0, arg_21_1)
	return
end

function var_0_0.OnStart(arg_22_0)
	return
end

function var_0_0.OnDetach(arg_23_0)
	return
end

return var_0_0
