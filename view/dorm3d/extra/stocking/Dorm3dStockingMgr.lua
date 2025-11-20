local var_0_0 = class("Dorm3dStockingMgr", import("view.dorm3d.Extra.BaseExtraSystem"))

var_0_0.L_COLLIDERS = {
	"LeftThighCollider",
	"LeftCalfCollider",
	"LeftFootCollider"
}
var_0_0.R_COLLIDERS = {
	"RightThighCollider",
	"RightCalfCollider",
	"RightFootCollider"
}
var_0_0.UNLOCK_CONFIG = {
	[307071] = 1222
}

local var_0_1

function var_0_0.OnBeginDrag(arg_1_0, arg_1_1, arg_1_2)
	if arg_1_0.blockingDrag then
		return
	end

	local var_1_0 = arg_1_2.position
	local var_1_1 = CameraMgr.instance:Raycast(arg_1_0:Get("sceneRaycaster"), var_1_0):ToTable()

	if #var_1_1 > 0 then
		local var_1_2 = var_1_1[1].gameObject.transform
		local var_1_3, var_1_4 = table.Find(var_0_0.L_COLLIDERS, function(arg_2_0, arg_2_1)
			return var_1_2.name == arg_2_1
		end)
		local var_1_5, var_1_6 = table.Find(var_0_0.R_COLLIDERS, function(arg_3_0, arg_3_1)
			return var_1_2.name == arg_3_1
		end)
		local var_1_7 = var_1_4 and 1 or var_1_6 and 2 or nil

		warning(var_1_2, var_1_7)

		if not var_1_7 or var_0_1.enable_drag[var_1_7] == 0 or not arg_1_0.isShow[var_1_7] then
			return
		end

		arg_1_0.inDragStocking = var_1_7

		if arg_1_0.inDragStocking then
			arg_1_0.startStockingPos = GraphicsInterface.Instance:GetStockingPos(arg_1_0.stockingTFs[arg_1_0.inDragStocking].gameObject)
			arg_1_0.preMin, arg_1_0.preMax = arg_1_0.startStockingPos, arg_1_0.startStockingPos

			GraphicsInterface.Instance:StockingMouseDown(arg_1_0.stockingTFs[arg_1_0.inDragStocking].gameObject, arg_1_2.position, arg_1_0.mainCamera)
		end
	end
end

function var_0_0.OnDrag(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0.blockingDrag then
		return
	end

	if arg_4_0.inDragStocking then
		GraphicsInterface.Instance:StockingMouseDrag(arg_4_0.stockingTFs[arg_4_0.inDragStocking].gameObject, arg_4_2.position, arg_4_0.mainCamera)

		local var_4_0 = GraphicsInterface.Instance:GetStockingPos(arg_4_0.stockingTFs[arg_4_0.inDragStocking].gameObject)

		arg_4_0.preMin = math.min(arg_4_0.preMin, var_4_0)
		arg_4_0.preMax = math.max(arg_4_0.preMax, var_4_0)

		return
	end

	local var_4_1 = arg_4_2.delta

	arg_4_0:Emit(Dorm3dRoomTemplateScene.ON_STICK_MOVE, var_4_1)
end

function var_0_0.OnEndDrag(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.blockingDrag then
		return
	end

	if arg_5_0.inDragStocking then
		GraphicsInterface.Instance:StockingMouseUp(arg_5_0.stockingTFs[arg_5_0.inDragStocking].gameObject)

		arg_5_0.endStockingPos = GraphicsInterface.Instance:GetStockingPos(arg_5_0.stockingTFs[arg_5_0.inDragStocking].gameObject)

		arg_5_0:TryTriggerEvent()
		arg_5_0:CheckStockingShow()
	end

	arg_5_0.inDragStocking = nil
end

function var_0_0.TryTriggerEvent(arg_6_0)
	warning("TryTriggerEvent", arg_6_0.inDragStocking, arg_6_0.startStockingPos, arg_6_0.endStockingPos, arg_6_0.preMin, arg_6_0.preMax)

	local var_6_0 = arg_6_0.inDragStocking

	if arg_6_0.endStockingPos > arg_6_0.startStockingPos then
		var_6_0 = var_6_0 * 2 - 1
	else
		var_6_0 = var_6_0 * 2
	end

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.triggerDic[var_6_0]) do
		if iter_6_1:Check(arg_6_0.endStockingPos, arg_6_0.preMax, arg_6_0.preMin) then
			local var_6_1, var_6_2, var_6_3 = iter_6_1:Trigger()

			arg_6_0:TriggerEvent(var_6_1, var_6_2, var_6_3)

			break
		end
	end
end

function var_0_0.TriggerEvent(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	warning("TriggerEvent", arg_7_1, arg_7_2, arg_7_3)

	arg_7_0.blockingDrag = true

	local function var_7_0()
		arg_7_0.blockingDrag = false

		if arg_7_3 then
			arg_7_0:ExitStockingStatus()
		else
			arg_7_0:ResetLady()
		end
	end

	switch(arg_7_1, {
		function()
			arg_7_0:Func("DoTalk", arg_7_2[1], var_7_0)
		end
	})
end

function var_0_0.CheckStockingShow(arg_10_0)
	if not arg_10_0.useHideMode then
		return
	end

	if arg_10_0.endStockingPos <= 0.01 then
		arg_10_0.isShow[arg_10_0.inDragStocking] = false

		setActive(arg_10_0.stockingTFs[arg_10_0.inDragStocking], false)
		setActive(arg_10_0.sceneStockingTFs[arg_10_0.inDragStocking], true)
	end
end

function var_0_0.InitStatus(arg_11_0, arg_11_1)
	arg_11_0.ladyEnv = arg_11_0:Func("GetCurrentLadyEnv")
	var_0_1 = pg.dorm3d_stocking[arg_11_1]
	arg_11_0.cacheIkStatus = arg_11_0.ladyEnv.currentIkStatus
	arg_11_0.inDragStocking = false
	arg_11_0.stockingL, arg_11_0.stockingR = var_0_0.GetStockingGeo(arg_11_0.ladyEnv.lady, var_0_1.skin_id)
	arg_11_0.stockingTFs = {
		arg_11_0.stockingL,
		arg_11_0.stockingR
	}
	arg_11_0.mainCamera = arg_11_0:Get("mainCameraTF"):GetComponent(typeof(Camera))
	arg_11_0.tiptransforms = {
		arg_11_0.ladyEnv.lady:Find(var_0_1.tip_show_path[1]),
		arg_11_0.ladyEnv.lady:Find(var_0_1.tip_show_path[2])
	}
	arg_11_0.tipDirections = {
		{
			arg_11_0.ladyEnv.lady:Find(var_0_1.l_tip_bone_path[1]),
			arg_11_0.ladyEnv.lady:Find(var_0_1.l_tip_bone_path[2])
		},
		{
			arg_11_0.ladyEnv.lady:Find(var_0_1.r_tip_bone_path[1]),
			arg_11_0.ladyEnv.lady:Find(var_0_1.r_tip_bone_path[2])
		}
	}
	arg_11_0.triggerDic = {
		{},
		{},
		{},
		{}
	}

	local function var_11_0(arg_12_0, arg_12_1)
		local var_12_0 = {}
		local var_12_1 = {}

		for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
			local var_12_2 = StockingTrigger.New(iter_12_1)

			if var_12_2:GetCompareType() == 0 then
				table.insert(var_12_0, var_12_2)
			else
				table.insert(var_12_1, var_12_2)
			end
		end

		StockingTrigger.Sort(var_12_0)
		StockingTrigger.Sort(var_12_1)

		arg_11_0.triggerDic[arg_12_0 * 2 - 1] = var_12_0
		arg_11_0.triggerDic[arg_12_0 * 2] = var_12_1
	end

	for iter_11_0, iter_11_1 in ipairs({
		var_0_1.l_trigger,
		var_0_1.r_trigger
	}) do
		var_11_0(iter_11_0, iter_11_1)
	end

	arg_11_0.inited = true
end

function var_0_0.InitHideMode(arg_13_0)
	arg_13_0.useHideMode = var_0_1.scene_stocking_path ~= "" and #var_0_1.scene_stocking_path == 2
	arg_13_0.isShow = {
		isActive(arg_13_0.stockingL),
		isActive(arg_13_0.stockingR)
	}

	if arg_13_0.useHideMode then
		arg_13_0.sceneStockingTFs = {
			arg_13_0:Func("GetSceneItem", var_0_1.scene_stocking_path[1]),
			arg_13_0:Func("GetSceneItem", var_0_1.scene_stocking_path[2])
		}

		local function var_13_0(arg_14_0, arg_14_1)
			GetOrAddComponent(arg_14_1, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_15_0, arg_15_1)
				arg_13_0.isShow[arg_14_0] = true

				setActive(arg_13_0.stockingTFs[arg_14_0], true)
				setActive(arg_13_0.sceneStockingTFs[arg_14_0], false)
				GraphicsInterface.Instance:SetStockingPos(arg_13_0.stockingTFs[arg_14_0].gameObject, var_0_1.wear_initial_pos[arg_14_0])
			end)
		end

		for iter_13_0, iter_13_1 in ipairs(arg_13_0.sceneStockingTFs) do
			var_13_0(iter_13_0, iter_13_1)
			setActive(iter_13_1, not arg_13_0.isShow[iter_13_0])
		end
	end
end

function var_0_0.ResetLady(arg_16_0)
	local var_16_0 = arg_16_0:Get("furnitures"):Find(var_0_1.character_position)

	assert(var_16_0, "找不到角色位置点 " .. var_0_1.character_position)

	local var_16_1 = var_16_0:Find("StayPoint")

	arg_16_0.ladyEnv:SetPosition(var_16_1.position)
	arg_16_0.ladyEnv:SetRotation(var_16_1.rotation)
	arg_16_0.ladyEnv:PlaySingleAction(var_0_1.character_action)
end

function var_0_0.SetStockingStatus(arg_17_0, arg_17_1)
	arg_17_0:InitStatus(arg_17_1)
	arg_17_0:InitHideMode()
	warning(">>>>>>>>>>> enter stocking mode <<<<<<<<<<", arg_17_1)
	seriesAsync({
		function(arg_18_0)
			arg_17_0:Func("SetIKState", false, arg_18_0, {
				ignoreResetExtraItem = true
			})
		end,
		function(arg_19_0)
			arg_17_0:Func("SetUI", arg_19_0, "stocking")
		end,
		function(arg_20_0)
			arg_17_0:ResetLady()
			arg_17_0:Func("ActiveCameraByName", var_0_1.camera)

			local var_20_0 = arg_17_0:Get("cameraRoot"):Find(var_0_1.camera):GetComponent(typeof(Cinemachine.CinemachineFreeLook))

			if var_20_0 then
				arg_17_0:Func("RegisterOrbits", var_20_0)
			end

			arg_17_0:Func("PlayEnterSceneAnim", var_0_1.enter_scene_anim)
			arg_17_0:Func("PlayEnterExtraItem", arg_17_0.ladyEnv, var_0_1.enter_extra_item)
			arg_17_0:Func("HideSceneItem", arg_17_0.ladyEnv, var_0_1.hide_scene_item)
			setActive(arg_17_0.ladyEnv.ladyCollider, false)
			_.each(arg_17_0.ladyEnv.ladyTouchColliders, function(arg_21_0)
				setActive(arg_21_0, true)
			end)
			arg_20_0()
		end
	})
end

function var_0_0.ExitStockingStatus(arg_22_0)
	seriesAsync({
		function(arg_23_0)
			arg_22_0:Func("SetUI", arg_23_0, "back")
		end,
		function(arg_24_0)
			warning(">>>>>>>>>>> exit stocking mode <<<<<<<<<<")

			if arg_22_0.useHideMode then
				for iter_24_0, iter_24_1 in ipairs(arg_22_0.sceneStockingTFs) do
					GetOrAddComponent(iter_24_1, typeof(EventTriggerListener)):RemovePointClickFunc()
				end
			end

			setActive(arg_22_0.ladyEnv.ladyCollider, true)
			_.each(arg_22_0.ladyEnv.ladyTouchColliders, function(arg_25_0)
				setActive(arg_25_0, false)
			end)
			arg_22_0:Func("ResetSceneItemAnimators")
			arg_22_0:Func("ResetTempHideSceneItems", arg_22_0.ladyEnv)
			arg_22_0:Func("RevertCameraOrbit")
			arg_22_0:Func("SwitchIKConfig", arg_22_0.ladyEnv, arg_22_0.cacheIkStatus)
			arg_22_0:Func("SetIKState", true)
			arg_24_0()
		end
	})
end

function var_0_0.OnExitTouchMode(arg_26_0)
	if arg_26_0.inited then
		arg_26_0.inited = false
	end
end

function var_0_0.GetTipShowInfo(arg_27_0)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in ipairs(var_0_1.enable_drag) do
		if iter_27_1 == 1 then
			local var_27_1 = arg_27_0:Func("GetScreenPosition", arg_27_0.tipDirections[iter_27_0][1].position, arg_27_0.mainCamera)
			local var_27_2 = arg_27_0:Func("GetScreenPosition", arg_27_0.tipDirections[iter_27_0][2].position, arg_27_0.mainCamera)

			table.insert(var_27_0, {
				pos = arg_27_0:Func("GetScreenPosition", arg_27_0.tiptransforms[iter_27_0].position, arg_27_0.mainCamera),
				dir = var_27_2 - var_27_1
			})
		end
	end

	local var_27_3 = {}

	if arg_27_0.useHideMode then
		for iter_27_2, iter_27_3 in ipairs(arg_27_0.sceneStockingTFs) do
			if not arg_27_0.isShow[iter_27_2] then
				table.insert(var_27_3, {
					pos = arg_27_0:Func("GetScreenPosition", iter_27_3.position, arg_27_0.mainCamera)
				})
			end
		end
	end

	return var_27_0, var_27_3
end

function var_0_0.GetStockingGeo(arg_28_0, arg_28_1)
	local var_28_0 = pg.dorm3d_resource[arg_28_1].stocking_geo_path

	if var_28_0 == "" then
		return nil, nil
	end

	local var_28_1 = arg_28_0:Find(var_28_0[1])
	local var_28_2 = arg_28_0:Find(var_28_0[2])

	return var_28_1, var_28_2
end

function var_0_0.Init(arg_29_0)
	local var_29_0 = arg_29_0:Func("GetCurrentLadyEnv")

	if var_29_0 then
		for iter_29_0, iter_29_1 in pairs(var_29_0.skinIdList) do
			local var_29_1 = arg_29_0:Get("skinDict")[iter_29_1].ladyGameObject

			arg_29_0:InitDormStocking(var_29_1.transform, iter_29_1)
		end
	end
end

function var_0_0.InitDormStocking(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0, var_30_1 = arg_30_0:IsUnlockStocking(arg_30_2)

	if not var_30_0 then
		return
	end

	local var_30_2 = pg.dorm3d_resource[arg_30_2].stocking_pos
	local var_30_3, var_30_4 = var_0_0.GetStockingGeo(arg_30_1, arg_30_2)

	if var_30_1 then
		setActive(var_30_3, true)
		setActive(var_30_4, true)
		GraphicsInterface.Instance:SetStockingPos(var_30_3.gameObject, var_30_2[1])
		GraphicsInterface.Instance:SetStockingPos(var_30_4.gameObject, var_30_2[2])
	else
		setActive(var_30_3, false)
		setActive(var_30_4, false)

		local var_30_5 = arg_30_1:Find("all/body_geo"):GetComponent(typeof(SkinnedMeshRenderer))

		var_30_5:SetBlendShapeWeight(0, 0)
		var_30_5:SetBlendShapeWeight(1, 0)
	end
end

function var_0_0.IsUnlockStocking(arg_31_0, arg_31_1)
	if not var_0_0.UNLOCK_CONFIG[arg_31_1] then
		return false, false
	end

	return true, arg_31_0:Get("room"):IsFurnitureSetIn(var_0_0.UNLOCK_CONFIG[arg_31_1])
end

function var_0_0.GetInterests()
	return {
		GAME.APARTMENT_REPLACE_FURNITURE_DONE
	}
end

function var_0_0.HandleNotification(arg_33_0, arg_33_1, arg_33_2)
	if arg_33_1 == GAME.APARTMENT_REPLACE_FURNITURE_DONE then
		local var_33_0 = arg_33_0:Func("GetCurrentLadyEnv")

		for iter_33_0, iter_33_1 in pairs(var_33_0.skinIdList) do
			local var_33_1 = arg_33_0:Get("skinDict")[iter_33_1].ladyGameObject

			arg_33_0:InitDormStocking(var_33_1.transform, iter_33_1)
		end
	end
end

return var_0_0
