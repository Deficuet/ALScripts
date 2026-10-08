local var_0_0 = class("RoomIKDriver")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.session = nil
	arg_1_0.generation = nil
	arg_1_0.callbacks = nil
	arg_1_0.attached = false
	arg_1_0.envRegistered = false
end

function var_0_0.IsCurrent(arg_2_0)
	return arg_2_0.attached and arg_2_0.session and arg_2_0.session:IsCurrent(arg_2_0.generation)
end

function var_0_0.Forward(arg_3_0, arg_3_1, ...)
	if not arg_3_0:IsCurrent() then
		return
	end

	local var_3_0 = arg_3_0.callbacks and arg_3_0.callbacks[arg_3_1]

	existCall(var_3_0, ...)
end

function var_0_0.Attach(arg_4_0, arg_4_1, arg_4_2)
	assert(arg_4_1, "Missing RoomIK session")
	assert(arg_4_1.controllers, "Missing RoomIK controllers")

	if #arg_4_1.controllers == 0 then
		arg_4_0:Detach()

		return
	end

	assert(arg_4_1.ikRoot, "Missing RoomIK IK root")
	assert(arg_4_1.boneMaps, "Missing RoomIK bone maps")
	arg_4_0:Detach()

	arg_4_0.session = arg_4_1
	arg_4_0.generation = arg_4_1.generation
	arg_4_0.callbacks = arg_4_2 or {}

	local var_4_0 = pg.IKMgr.GetInstance()

	var_4_0:RegisterEnv(arg_4_1.ikRoot, arg_4_1.boneMaps)

	arg_4_0.envRegistered = true
	arg_4_0.attached = true

	var_4_0:RegisterOnIKLayerActive(function(arg_5_0)
		arg_4_0:Forward("active", arg_5_0)
	end)
	var_4_0:RegisterOnIKLayerDrag(function(arg_6_0)
		arg_4_0:Forward("drag", arg_6_0)
	end)
	var_4_0:RegisterOnIKLayerDeactive(function(arg_7_0, arg_7_1)
		arg_4_0:Forward("deactive", arg_7_0, arg_7_1)
	end)
	var_4_0:RegisterOnIKLayerAction(function(arg_8_0)
		arg_4_0:Forward("action", arg_8_0)
	end)
	var_4_0:SetIKStatus(arg_4_1.controllers)
end

function var_0_0.Detach(arg_9_0)
	local var_9_0 = arg_9_0.envRegistered

	arg_9_0.attached = false
	arg_9_0.envRegistered = false
	arg_9_0.callbacks = nil
	arg_9_0.session = nil
	arg_9_0.generation = nil

	if not var_9_0 then
		return
	end

	local var_9_1 = pg.IKMgr.GetInstance()

	var_9_1:ReleaseDrag()
	var_9_1:UnregisterEnv()
end

function var_0_0.BeginDrag(arg_10_0, arg_10_1, arg_10_2)
	if not arg_10_0:IsCurrent() then
		return
	end

	pg.IKMgr.GetInstance():OnDragBegin(arg_10_1, arg_10_2)
end

function var_0_0.Drag(arg_11_0, arg_11_1)
	if not arg_11_0:IsCurrent() then
		return
	end

	pg.IKMgr.GetInstance():HandleBodyDrag(arg_11_1)
end

function var_0_0.Release(arg_12_0)
	if not arg_12_0.attached then
		return
	end

	pg.IKMgr.GetInstance():ReleaseDrag()
end

function var_0_0.Reset(arg_13_0, arg_13_1)
	if not arg_13_0:IsCurrent() then
		return
	end

	pg.IKMgr.GetInstance():ResetIK(arg_13_1)
end

function var_0_0.ResetActiveLayers(arg_14_0)
	if not arg_14_0:IsCurrent() then
		return
	end

	pg.IKMgr.GetInstance():ResetActiveIKs()
end

function var_0_0.PlayMove(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4, arg_15_5, arg_15_6)
	if not arg_15_0:IsCurrent() then
		return
	end

	pg.IKMgr.GetInstance():PlayIKMove(arg_15_1, arg_15_2, arg_15_3, arg_15_4, arg_15_5, arg_15_6)
end

return var_0_0
