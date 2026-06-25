local var_0_0 = import(".DynamicCellView")
local var_0_1 = import(".SpineCellView")
local var_0_2 = class("FleetCellView", DecorateClass(var_0_0, var_0_1))

function var_0_2.Ctor(arg_1_0, arg_1_1)
	var_0_2.super.Ctor(arg_1_0, arg_1_1)
	var_0_1.Ctor(arg_1_0)
	var_0_1.InitCellTransform(arg_1_0)

	arg_1_0.tfArrow = arg_1_0.tf:Find("arrow")
	arg_1_0.tfAmmo = arg_1_0.tf:Find("ammo")
	arg_1_0.tfAmmoText = arg_1_0.tfAmmo:Find("text")
	arg_1_0.tfOp = arg_1_0.tf:Find("op")
	arg_1_0.tfIconRecorded = nil
	arg_1_0.RecordedFlag = nil
end

function var_0_2.GetOrder(arg_2_0)
	return ChapterConst.CellPriorityFleet
end

function var_0_2.showPoisonDamage(arg_3_0, arg_3_1)
	local var_3_0 = "dexiv4_SLG_poison"
	local var_3_1 = arg_3_0.tfShip.localPosition

	arg_3_0:GetLoader():GetPrefab("ui/" .. var_3_0, var_3_0, function(arg_4_0)
		setParent(arg_4_0.transform, arg_3_0.tf, false)
		LeanTween.moveY(arg_3_0.tfShip, var_3_1.y - 10, 0.1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

		local var_4_0 = arg_4_0:GetComponent(typeof(ParticleSystemEvent))

		if not IsNil(var_4_0) then
			var_4_0:AddEndEvent(function()
				arg_3_0.tfShip.localPosition = var_3_1

				arg_3_0.loader:ClearRequest("PoisonDamage")
				LeanTween.cancel(arg_3_0.tfShip.gameObject)

				if arg_3_1 then
					arg_3_1()
				end
			end)
		end
	end, "PoisonDamage")
end

function var_0_2.SetActiveNoPassIcon(arg_6_0, arg_6_1)
	local var_6_0 = "NoPassIcon"

	if not arg_6_1 then
		if arg_6_0.loader then
			arg_6_0.loader:ClearRequest(var_6_0)
		end
	else
		if arg_6_0:GetLoader():GetRequestPackage(var_6_0) then
			return
		end

		local var_6_1 = "event_task_small"

		arg_6_0:GetLoader():GetPrefabBYStopLoading("boxprefab/" .. var_6_1, var_6_1, function(arg_7_0)
			setParent(arg_7_0.transform, arg_6_0.tf, false)

			local var_7_0 = 150

			setLocalPosition(arg_7_0, Vector3(0, var_7_0, 0))
			LeanTween.moveY(rtf(arg_7_0), var_7_0 - 10, 1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
		end, var_6_0)
	end
end

function var_0_2.UpdateIconRecordedFlag(arg_8_0, arg_8_1)
	arg_8_0.RecordedFlag = arg_8_1

	arg_8_0:UpdateIconRecorded()
end

function var_0_2.UpdateIconRecorded(arg_9_0)
	if not (arg_9_0.RecordedFlag and arg_9_0.visible) then
		if not IsNil(arg_9_0.tfIconRecorded) then
			setActive(arg_9_0.tfIconRecorded, false)
		end
	else
		if IsNil(arg_9_0.tfIconRecorded) then
			pg.PoolMgr.GetInstance():GetPrefab("effect/fleet_status_recorded", "", false, function(arg_10_0)
				arg_9_0.tfIconRecorded = tf(arg_10_0)

				setParent(arg_10_0, arg_9_0.tf, false)
			end)
		end

		setActive(arg_9_0.tfIconRecorded, true)
	end
end

function var_0_2.TweenShining(arg_11_0)
	local var_11_0 = arg_11_0:GetSpineRole()

	if not var_11_0 then
		return
	end

	local var_11_1 = Color.black
	local var_11_2 = Color.gray

	var_11_1.a = 0
	var_11_2.a = 0

	var_11_0:TweenShining(0.2, 2, 0, 1, var_11_1, var_11_2, true, true)
end

function var_0_2.SetSpineVisible(arg_12_0, arg_12_1)
	arg_12_0.visible = arg_12_1

	var_0_2.super.SetSpineVisible(arg_12_0, arg_12_1)
	setActive(arg_12_0.tfShadow, arg_12_1)
	arg_12_0:UpdateIconRecorded()
end

function var_0_2.StopTween(arg_13_0)
	local var_13_0 = arg_13_0:GetSpineRole()

	if not var_13_0 then
		return
	end

	var_13_0:StopTweenShining()
end

function var_0_2.unloadSpine(arg_14_0)
	var_0_2.super.UnloadSpine(arg_14_0)
end

function var_0_2.OnCanvasUpDate(arg_15_0)
	var_0_1.UpdateSortingOrder(arg_15_0)
end

function var_0_2.Clear(arg_16_0)
	var_0_1.ClearSpine(arg_16_0)
	var_0_2.super.Clear(arg_16_0)
end

return var_0_2
