local var_0_0 = class("RoomIKSession")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.generation = 0
	arg_1_0.active = false
	arg_1_0.mode = nil
	arg_1_0.currentIkStatus = nil
	arg_1_0.currentIkConfig = nil
	arg_1_0.currentIkTimelineStatus = nil
	arg_1_0.stockingCachedIkStatus = nil
	arg_1_0.aimIKCachedIkStatus = nil
	arg_1_0.ikSpecialCall = nil
	arg_1_0.ikActionDict = nil
	arg_1_0.readyIKLayers = nil
	arg_1_0.ikTouchDatas = nil
	arg_1_0.ikSettings = nil
	arg_1_0.ladyEnv = nil
	arg_1_0.ikRoot = nil
	arg_1_0.boneMaps = nil
	arg_1_0.controllers = nil
	arg_1_0.ikHandler = nil
	arg_1_0.ikTimelineColliderStates = nil
	arg_1_0.ikNextCheckStamp = nil
	arg_1_0.nextTipIKTime = nil
	arg_1_0.enableIKTip = false
	arg_1_0.blockIK = nil
	arg_1_0.uiBlockHeld = false
	arg_1_0.blockReasons = {}
	arg_1_0.ikSwitchSkinId = nil
	arg_1_0.spec = nil
end

function var_0_0.Start(arg_2_0, arg_2_1)
	arg_2_0.generation = arg_2_0.generation + 1
	arg_2_0.active = true
	arg_2_0.mode = arg_2_1
	arg_2_0.blockReasons = {}
	arg_2_0.blockIK = nil

	return arg_2_0.generation
end

function var_0_0.IsCurrent(arg_3_0, arg_3_1)
	return arg_3_0.active and arg_3_0.generation == arg_3_1
end

function var_0_0.ApplySpec(arg_4_0, arg_4_1)
	assert(arg_4_1, "Missing RoomIK session spec")

	arg_4_0.spec = arg_4_1
	arg_4_0.mode = arg_4_1.mode
	arg_4_0.currentIkStatus = arg_4_1.mode == "normal" and arg_4_1.statusId or nil
	arg_4_0.currentIkConfig = arg_4_1.mode == "normal" and arg_4_1.config or nil
	arg_4_0.currentIkTimelineStatus = arg_4_1.mode == "timeline" and arg_4_1.statusId or nil
	arg_4_0.ladyEnv = arg_4_1.ladyEnv
	arg_4_0.ikActionDict = arg_4_1.actionDict
	arg_4_0.readyIKLayers = arg_4_1.layers
	arg_4_0.ikTouchDatas = arg_4_1.touchDatas
	arg_4_0.ikRoot = arg_4_1.ikRoot
	arg_4_0.boneMaps = arg_4_1.boneMaps
	arg_4_0.controllers = arg_4_1.controllers
	arg_4_0.ikSettings = {
		Colliders = arg_4_1.colliders,
		CameraRaycaster = arg_4_1.raycaster
	}
end

function var_0_0.IsBlocked(arg_5_0)
	return next(arg_5_0.blockReasons) ~= nil
end

function var_0_0.RefreshBlockState(arg_6_0)
	arg_6_0.blockIK = arg_6_0:IsBlocked() or nil
end

function var_0_0.AcquireBlock(arg_7_0, arg_7_1)
	arg_7_0.blockReasons[arg_7_1 or "legacy"] = true

	arg_7_0:RefreshBlockState()
end

function var_0_0.ReleaseBlock(arg_8_0, arg_8_1)
	arg_8_0.blockReasons[arg_8_1 or "legacy"] = nil

	arg_8_0:RefreshBlockState()
end

function var_0_0.SetLegacyBlock(arg_9_0, arg_9_1)
	if arg_9_1 then
		arg_9_0:AcquireBlock("legacy")
	else
		arg_9_0:ReleaseBlock("legacy")
	end
end

function var_0_0.ClearBlocks(arg_10_0)
	arg_10_0.blockReasons = {}

	arg_10_0:RefreshBlockState()
end

function var_0_0.ClearRuntime(arg_11_0)
	arg_11_0.generation = arg_11_0.generation + 1
	arg_11_0.active = false
	arg_11_0.mode = nil
	arg_11_0.currentIkStatus = nil
	arg_11_0.currentIkConfig = nil
	arg_11_0.currentIkTimelineStatus = nil
	arg_11_0.spec = nil
	arg_11_0.ikActionDict = nil
	arg_11_0.readyIKLayers = nil
	arg_11_0.ikTouchDatas = nil
	arg_11_0.ikSettings = nil
	arg_11_0.ladyEnv = nil
	arg_11_0.ikRoot = nil
	arg_11_0.boneMaps = nil
	arg_11_0.controllers = nil
	arg_11_0.ikHandler = nil
	arg_11_0.ikNextCheckStamp = nil
	arg_11_0.nextTipIKTime = nil
	arg_11_0.enableIKTip = false
	arg_11_0.blockIK = nil
	arg_11_0.blockReasons = {}
end

function var_0_0.Invalidate(arg_12_0)
	arg_12_0:ClearRuntime()

	arg_12_0.stockingCachedIkStatus = nil
	arg_12_0.aimIKCachedIkStatus = nil
	arg_12_0.ikSpecialCall = nil
	arg_12_0.ikTimelineColliderStates = nil
	arg_12_0.ikSwitchSkinId = nil
	arg_12_0.uiBlockHeld = false
end

return var_0_0
