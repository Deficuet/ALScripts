local var_0_0 = class("BaseSubPanel", import("view.base.BaseSubView"))
local var_0_1 = import("view.util.FuncBuffer")
local var_0_2 = import("view.util.AutoLoader")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	assert(arg_1_1, "NIL Parent View")

	local var_1_0 = arg_1_1 and arg_1_1._tf
	local var_1_1 = arg_1_1 and isa(arg_1_1, BaseEventLogic) and arg_1_1.event or nil
	local var_1_2 = {}

	var_0_0.super.Ctor(arg_1_0, var_1_0, var_1_1, var_1_2)

	arg_1_0.buffer = var_0_1.New()
	arg_1_0.loader = var_0_2.New()
	arg_1_0.viewParent = arg_1_1
end

function var_0_0.Init(arg_2_0)
	if arg_2_0._state ~= var_0_0.STATES.LOADED then
		return
	end

	arg_2_0._state = var_0_0.STATES.INITED

	bindComponent(arg_2_0, arg_2_0._go)
	arg_2_0:OnInit()
	arg_2_0:Show()
	arg_2_0:HandleFuncQueue()
	arg_2_0.buffer:SetNotifier(arg_2_0)
	arg_2_0.buffer:ExcuteAll()
end

function var_0_0.Destroy(arg_3_0)
	if arg_3_0._state == var_0_0.STATES.DESTROY then
		return
	end

	if not arg_3_0:GetLoaded() then
		arg_3_0._state = var_0_0.STATES.DESTROY

		return
	end

	arg_3_0._state = var_0_0.STATES.DESTROY

	pg.DelegateInfo.Dispose(arg_3_0)
	arg_3_0:Hide()
	arg_3_0:OnDestroy()
	arg_3_0.loader:Clear()
	arg_3_0.buffer:Clear()
	bindComponent(arg_3_0, arg_3_0._go, true)
	arg_3_0:disposeEvent()
	arg_3_0:cleanManagedTween()

	arg_3_0._tf = nil

	local var_3_0 = PoolMgr.GetInstance()
	local var_3_1 = arg_3_0:getUIName()

	if arg_3_0._go ~= nil and var_3_1 then
		var_3_0:ReturnUI(var_3_1, arg_3_0._go)

		arg_3_0._go = nil
	end
end

function var_0_0.Hide(arg_4_0)
	arg_4_0:OnHide()
	var_0_0.super.Hide(arg_4_0)
end

function var_0_0.RawHide(arg_5_0)
	var_0_0.super.Hide(arg_5_0)
end

function var_0_0.Show(arg_6_0)
	var_0_0.super.Show(arg_6_0)
	arg_6_0:OnShow()
end

function var_0_0.RawShow(arg_7_0)
	var_0_0.super.Show(arg_7_0)
end

function var_0_0.IsShowing(arg_8_0)
	return arg_8_0:GetLoaded() and isActive(arg_8_0._go)
end

function var_0_0.IsHiding(arg_9_0)
	return arg_9_0:GetLoaded() and not isActive(arg_9_0._go)
end

function var_0_0.SetParent(arg_10_0, arg_10_1, ...)
	setParent(arg_10_0._tf, arg_10_1, ...)
end

function var_0_0.OnShow(arg_11_0)
	return
end

function var_0_0.OnHide(arg_12_0)
	return
end

return var_0_0
