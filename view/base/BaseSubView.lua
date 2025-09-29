local var_0_0 = class("BaseSubView", import("view.base.BaseEventLogic"))

var_0_0.STATES = {
	DESTROY = 5,
	NONE = 1,
	LOADING = 2,
	INITED = 4,
	LOADED = 3
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_2)

	arg_1_0.contextData = arg_1_3
	arg_1_0._parentTf = arg_1_1
	arg_1_0.event = arg_1_2
	arg_1_0._go = nil
	arg_1_0._tf = nil
	arg_1_0._state = var_0_0.STATES.NONE
	arg_1_0._funcQueue = {}
end

var_0_0.InheritFuncs = {
	"getGroupName",
	"Add2Overlay",
	"DelFromOverlay",
	"OverlayPanel",
	"UnOverlayPanel",
	"BlurPanel",
	"TempOverlayPanelPB",
	"TempUnOverlayPanelPB"
}

function var_0_0.RegisterView(arg_2_0, arg_2_1)
	arg_2_0.viewComponent = arg_2_1

	for iter_2_0, iter_2_1 in ipairs(var_0_0.InheritFuncs) do
		arg_2_0[iter_2_1] = arg_2_0[iter_2_1] or function(arg_3_0, ...)
			return arg_3_0.viewComponent[iter_2_1](arg_3_0.viewComponent, ...)
		end
	end
end

function var_0_0.Load(arg_4_0, arg_4_1)
	if arg_4_0._state ~= var_0_0.STATES.NONE then
		return
	end

	arg_4_0._state = var_0_0.STATES.LOADING

	pg.UIMgr.GetInstance():LoadingOn()

	local var_4_0 = PoolMgr.GetInstance()

	seriesAsync({
		function(arg_5_0)
			if arg_4_1 then
				arg_4_0.noReturnPrefab = true

				arg_5_0(arg_4_1)
			else
				var_4_0:GetUI(arg_4_0:getUIName(), true, arg_5_0)
			end
		end
	}, function(arg_6_0)
		if arg_4_0._state == var_0_0.STATES.DESTROY and not arg_4_0.noReturnPrefab then
			pg.UIMgr.GetInstance():LoadingOff()
			var_4_0:ReturnUI(arg_4_0:getUIName(), arg_6_0)
		else
			onNextTick(function()
				arg_4_0:Loaded(arg_6_0)
				arg_4_0:Init()
			end)
		end
	end)
end

function var_0_0.Loaded(arg_8_0, arg_8_1)
	pg.UIMgr.GetInstance():LoadingOff()

	if arg_8_0._state ~= var_0_0.STATES.LOADING then
		return
	end

	arg_8_0._state = var_0_0.STATES.LOADED
	arg_8_0._go = arg_8_1
	arg_8_0._tf = tf(arg_8_1)

	setActiveViaLayer(arg_8_0._tf, true)
	pg.DelegateInfo.New(arg_8_0)

	if arg_8_0._tf.parent ~= arg_8_0._parentTf then
		SetParent(arg_8_0._tf, arg_8_0._parentTf, false)
	end

	arg_8_0:OnLoaded()
end

function var_0_0.Init(arg_9_0)
	if arg_9_0._state ~= var_0_0.STATES.LOADED then
		return
	end

	arg_9_0._state = var_0_0.STATES.INITED

	bindComponent(arg_9_0, arg_9_0._go)
	arg_9_0:OnInit()
	arg_9_0:HandleFuncQueue()
end

function var_0_0.Destroy(arg_10_0)
	if arg_10_0._state == var_0_0.STATES.DESTROY then
		return
	end

	if not arg_10_0:GetLoaded() then
		arg_10_0._state = var_0_0.STATES.DESTROY

		return
	end

	arg_10_0._state = var_0_0.STATES.DESTROY

	pg.DelegateInfo.Dispose(arg_10_0)
	arg_10_0:OnDestroy()
	arg_10_0:disposeEvent()
	arg_10_0:cleanManagedTween()

	arg_10_0._tf = nil

	if arg_10_0._go ~= nil and not arg_10_0.noReturnPrefab then
		PoolMgr.GetInstance():ReturnUI(arg_10_0:getUIName(), arg_10_0._go)

		arg_10_0._go = nil
	end

	arg_10_0.noReturnPrefab = nil
end

function var_0_0.HandleFuncQueue(arg_11_0)
	if arg_11_0._state == var_0_0.STATES.INITED then
		while #arg_11_0._funcQueue > 0 do
			local var_11_0 = table.remove(arg_11_0._funcQueue, 1)

			var_11_0.func(unpackEx(var_11_0.params))
		end
	end
end

function var_0_0.Reset(arg_12_0)
	arg_12_0._state = var_0_0.STATES.NONE
end

function var_0_0.ActionInvoke(arg_13_0, arg_13_1, ...)
	assert(arg_13_0[arg_13_1], "func not exist >>>" .. arg_13_1)

	arg_13_0._funcQueue[#arg_13_0._funcQueue + 1] = {
		funcName = arg_13_1,
		func = arg_13_0[arg_13_1],
		params = packEx(arg_13_0, ...)
	}

	arg_13_0:HandleFuncQueue()
end

function var_0_0.ActionInvokeExclusive(arg_14_0, arg_14_1, ...)
	local var_14_0 = #arg_14_0._funcQueue

	while var_14_0 > 0 do
		if arg_14_0._funcQueue[var_14_0].funcName == arg_14_1 then
			table.remove(arg_14_0._funcQueue, var_14_0)
		end

		var_14_0 = var_14_0 - 1
	end

	arg_14_0:ActionInvoke(arg_14_1, ...)
end

function var_0_0.CallbackInvoke(arg_15_0, arg_15_1, ...)
	arg_15_0._funcQueue[#arg_15_0._funcQueue + 1] = {
		func = arg_15_1,
		params = packEx(...)
	}

	arg_15_0:HandleFuncQueue()
end

function var_0_0.ExecuteAction(arg_16_0, arg_16_1, ...)
	arg_16_0:Load()
	arg_16_0:ActionInvoke(arg_16_1, ...)
end

function var_0_0.GetLoaded(arg_17_0)
	return arg_17_0._state >= var_0_0.STATES.LOADED
end

function var_0_0.CheckState(arg_18_0, arg_18_1)
	return arg_18_0._state == arg_18_1
end

function var_0_0.Show(arg_19_0)
	setActive(arg_19_0._tf, true)
	arg_19_0:ShowOrHideResUI(true)
	arg_19_0:PlayBGM()
end

function var_0_0.Hide(arg_20_0)
	setActive(arg_20_0._tf, false)
	arg_20_0:ShowOrHideResUI(false)
	arg_20_0:StopBgm()
end

function var_0_0.isShowing(arg_21_0)
	return arg_21_0._tf and isActive(arg_21_0._tf)
end

function var_0_0.getBGM(arg_22_0, arg_22_1)
	return getBgm(arg_22_1 or arg_22_0.__cname)
end

function var_0_0.PlayBGM(arg_23_0)
	local var_23_0 = arg_23_0:getBGM()

	if var_23_0 then
		pg.BgmMgr.GetInstance():Push(arg_23_0.__cname, var_23_0)
	end
end

function var_0_0.StopBgm(arg_24_0)
	pg.BgmMgr.GetInstance():Pop(arg_24_0.__cname)
end

function var_0_0.findTF(arg_25_0, arg_25_1, arg_25_2)
	assert(arg_25_0._tf, "transform should exist")

	return findTF(arg_25_2 or arg_25_0._tf, arg_25_1)
end

function var_0_0.getTpl(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0:findTF(arg_26_1, arg_26_2)

	var_26_0:SetParent(arg_26_0._tf, false)
	SetActive(var_26_0, false)

	return var_26_0
end

function var_0_0.getUIName(arg_27_0)
	return nil
end

function var_0_0.OnLoaded(arg_28_0)
	return
end

function var_0_0.OnInit(arg_29_0)
	return
end

function var_0_0.OnDestroy(arg_30_0)
	return
end

function var_0_0.ResUISettings(arg_31_0)
	return nil
end

function var_0_0.ShowOrHideResUI(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0:ResUISettings()

	if not var_32_0 then
		return
	end

	if var_32_0 == true then
		var_32_0 = {
			anim = true,
			showType = PlayerResUI.TYPE_ALL
		}
	end

	local var_32_1 = arg_32_0:getGroupName()

	if arg_32_1 then
		pg.playerResUI:SetSettings(var_32_1, setmetatable({
			groupName = var_32_1
		}, {
			__index = var_32_0
		}))
	else
		pg.playerResUI:RemoveSettings(var_32_1)
	end
end

function var_0_0.getGroupName(arg_33_0)
	return arg_33_0.contextData.groupName or arg_33_0.__cname
end

return var_0_0
