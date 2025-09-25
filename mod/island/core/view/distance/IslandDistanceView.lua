local var_0_0 = class("IslandDistanceView", import("..IslandBaseOpView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandDistanceUI"
end

function var_0_0.SetUIParent(arg_2_0, arg_2_1)
	setParent(arg_2_1, arg_2_0:GetView().interactionContainer)
end

function var_0_0.OnInit(arg_3_0, arg_3_1)
	arg_3_0.targetTracker = IslandTargetTracker.New(arg_3_0._tf)
end

function var_0_0.OnUpdate(arg_4_0)
	arg_4_0.targetTracker:Update()
end

function var_0_0.SetTrackingTarget(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_0.targetTracker:Tracking(arg_5_1._go, arg_5_2._go, arg_5_3)
end

function var_0_0.CancelTracking(arg_6_0)
	arg_6_0.targetTracker:UnTracking()
end

function var_0_0.ShowHud(arg_7_0, arg_7_1)
	arg_7_0.targetTracker:OnShowHud(arg_7_1)
end

function var_0_0.HideHud(arg_8_0, arg_8_1)
	arg_8_0.targetTracker:OnHideHud(arg_8_1)
end

function var_0_0.OnDestroy(arg_9_0)
	if arg_9_0.targetTracker then
		arg_9_0.targetTracker:Dispose()

		arg_9_0.targetTracker = nil
	end
end

return var_0_0
