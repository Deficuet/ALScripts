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

local function var_0_1(arg_2_0)
	local var_2_0

	if arg_2_0 and arg_2_0.getUIName then
		local var_2_1, var_2_2 = pcall(function()
			return arg_2_0:getUIName()
		end)

		if var_2_1 then
			var_2_0 = var_2_2
		end
	end

	if not noEmptyStr(var_2_0) and arg_2_0 then
		var_2_0 = arg_2_0.__cname
	end

	return tostring(var_2_0 or "Unknown")
end

local function var_0_2(arg_4_0)
	local var_4_0 = string.format("进入界面: BaseSubView - %s", var_0_1(arg_4_0))

	print(var_4_0)

	local var_4_1, var_4_2 = pcall(function()
		ReflectionHelp.RefCallMethod(typeof(ResourceMgr), "WriteMarkedShortPathLog", ResourceMgr.Inst, {
			typeof("System.String")
		}, {
			var_4_0
		})
	end)

	if not var_4_1 then
		warning(string.format("Write base sub view load log failed: %s", tostring(var_4_2)))
	end
end

function var_0_0.RegisterView(arg_6_0, arg_6_1)
	arg_6_0.viewComponent = arg_6_1

	for iter_6_0, iter_6_1 in ipairs(var_0_0.InheritFuncs) do
		arg_6_0[iter_6_1] = arg_6_0[iter_6_1] or function(arg_7_0, ...)
			return arg_7_0.viewComponent[iter_6_1](arg_7_0.viewComponent, ...)
		end
	end
end

function var_0_0.Load(arg_8_0, arg_8_1)
	if arg_8_0._state ~= var_0_0.STATES.NONE then
		return
	end

	if EDITOR_TOOL then
		var_0_2(arg_8_0)
	end

	arg_8_0._state = var_0_0.STATES.LOADING

	pg.UIMgr.GetInstance():LoadingOn()

	local var_8_0 = PoolMgr.GetInstance()

	seriesAsync({
		function(arg_9_0)
			local var_9_0 = arg_8_0:getResource(arg_8_0.contextData)

			SplitPackConst.DownloadByLuaArr(var_9_0, arg_9_0)
		end,
		function(arg_10_0)
			if arg_8_1 then
				arg_8_0.noReturnPrefab = true

				arg_10_0(arg_8_1)
			else
				var_8_0:GetUI(arg_8_0:getUIName(), true, arg_10_0)
			end
		end
	}, function(arg_11_0)
		if arg_8_0._state == var_0_0.STATES.DESTROY and not arg_8_0.noReturnPrefab then
			pg.UIMgr.GetInstance():LoadingOff()
			var_8_0:ReturnUI(arg_8_0:getUIName(), arg_11_0)
		else
			arg_8_0:Loaded(arg_11_0)
			arg_8_0:Init()
		end
	end)
end

function var_0_0.Loaded(arg_12_0, arg_12_1)
	pg.UIMgr.GetInstance():LoadingOff()

	if arg_12_0._state ~= var_0_0.STATES.LOADING then
		return
	end

	arg_12_0._state = var_0_0.STATES.LOADED
	arg_12_0._go = arg_12_1
	arg_12_0._tf = tf(arg_12_1)

	setActiveViaLayer(arg_12_0._tf, true)
	pg.DelegateInfo.New(arg_12_0)

	if arg_12_0._tf.parent ~= arg_12_0._parentTf then
		SetParent(arg_12_0._tf, arg_12_0._parentTf, false)
	end

	bindComponent(arg_12_0, arg_12_0._go)
	arg_12_0:OnLoaded()
end

function var_0_0.Init(arg_13_0)
	if arg_13_0._state ~= var_0_0.STATES.LOADED then
		return
	end

	arg_13_0._state = var_0_0.STATES.INITED

	arg_13_0:OnInit()
	arg_13_0:HandleFuncQueue()
end

function var_0_0.Destroy(arg_14_0)
	if arg_14_0._state == var_0_0.STATES.DESTROY then
		return
	end

	if not arg_14_0:GetLoaded() then
		arg_14_0._state = var_0_0.STATES.DESTROY

		return
	end

	arg_14_0._state = var_0_0.STATES.DESTROY

	pg.DelegateInfo.Dispose(arg_14_0)
	arg_14_0:OnDestroy()
	bindComponent(arg_14_0, arg_14_0._go, true)
	arg_14_0:disposeEvent()
	arg_14_0:cleanManagedTween()

	arg_14_0._tf = nil

	if arg_14_0._go ~= nil and not arg_14_0.noReturnPrefab then
		PoolMgr.GetInstance():ReturnUI(arg_14_0:getUIName(), arg_14_0._go)

		arg_14_0._go = nil
	end

	arg_14_0.noReturnPrefab = nil
end

function var_0_0.HandleFuncQueue(arg_15_0)
	if arg_15_0._state == var_0_0.STATES.INITED then
		while #arg_15_0._funcQueue > 0 do
			local var_15_0 = table.remove(arg_15_0._funcQueue, 1)

			var_15_0.func(unpackEx(var_15_0.params))
		end
	end
end

function var_0_0.Reset(arg_16_0)
	arg_16_0._state = var_0_0.STATES.NONE
end

function var_0_0.ActionInvoke(arg_17_0, arg_17_1, ...)
	assert(arg_17_0[arg_17_1], "func not exist >>>" .. arg_17_1)

	arg_17_0._funcQueue[#arg_17_0._funcQueue + 1] = {
		funcName = arg_17_1,
		func = arg_17_0[arg_17_1],
		params = packEx(arg_17_0, ...)
	}

	arg_17_0:HandleFuncQueue()
end

function var_0_0.ActionInvokeExclusive(arg_18_0, arg_18_1, ...)
	local var_18_0 = #arg_18_0._funcQueue

	while var_18_0 > 0 do
		if arg_18_0._funcQueue[var_18_0].funcName == arg_18_1 then
			table.remove(arg_18_0._funcQueue, var_18_0)
		end

		var_18_0 = var_18_0 - 1
	end

	arg_18_0:ActionInvoke(arg_18_1, ...)
end

function var_0_0.CallbackInvoke(arg_19_0, arg_19_1, ...)
	arg_19_0._funcQueue[#arg_19_0._funcQueue + 1] = {
		func = arg_19_1,
		params = packEx(...)
	}

	arg_19_0:HandleFuncQueue()
end

function var_0_0.ExecuteAction(arg_20_0, arg_20_1, ...)
	arg_20_0:Load()
	arg_20_0:ActionInvoke(arg_20_1, ...)
end

function var_0_0.GetLoaded(arg_21_0)
	return arg_21_0._state >= var_0_0.STATES.LOADED
end

function var_0_0.CheckState(arg_22_0, arg_22_1)
	return arg_22_0._state == arg_22_1
end

function var_0_0.Show(arg_23_0)
	setActive(arg_23_0._tf, true)
	arg_23_0:ShowOrHideResUI(true)
	arg_23_0:PlayBGM()
end

function var_0_0.Hide(arg_24_0)
	setActive(arg_24_0._tf, false)
	arg_24_0:ShowOrHideResUI(false)
	arg_24_0:StopBgm()
end

function var_0_0.isShowing(arg_25_0)
	return arg_25_0._tf and isActive(arg_25_0._tf) or false
end

function var_0_0.getBGM(arg_26_0, arg_26_1)
	return getBgm(arg_26_1 or arg_26_0.__cname)
end

function var_0_0.PlayBGM(arg_27_0)
	local var_27_0 = arg_27_0:getBGM()

	if var_27_0 then
		pg.BgmMgr.GetInstance():Push(arg_27_0.__cname, var_27_0)
	end
end

function var_0_0.StopBgm(arg_28_0)
	pg.BgmMgr.GetInstance():Pop(arg_28_0.__cname)
end

function var_0_0.getTpl(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = (arg_29_2 or arg_29_0._tf):Find(arg_29_1)

	var_29_0:SetParent(arg_29_0._tf, false)
	SetActive(var_29_0, false)

	return var_29_0
end

function var_0_0.getUIName(arg_30_0)
	return nil
end

function var_0_0.getResource(arg_31_0)
	return {
		"ui/" .. arg_31_0:getUIName()
	}
end

function var_0_0.OnLoaded(arg_32_0)
	return
end

function var_0_0.OnInit(arg_33_0)
	return
end

function var_0_0.OnDestroy(arg_34_0)
	return
end

function var_0_0.ResUISettings(arg_35_0)
	return nil
end

function var_0_0.ShowOrHideResUI(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0:ResUISettings()

	if not var_36_0 then
		return
	end

	if var_36_0 == true then
		var_36_0 = {
			anim = true,
			showType = PlayerResUI.TYPE_ALL
		}
	end

	local var_36_1 = arg_36_0:getGroupName()

	if arg_36_1 then
		pg.playerResUI:SetSettings(var_36_1, setmetatable({
			groupName = var_36_1
		}, {
			__index = var_36_0
		}))
	else
		pg.playerResUI:RemoveSettings(var_36_1)
	end
end

function var_0_0.getGroupName(arg_37_0)
	return arg_37_0.contextData.groupName or arg_37_0.__cname
end

return var_0_0
