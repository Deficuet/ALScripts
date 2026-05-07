local var_0_0 = class("RyzaCoreActivityUI", import("view.activity.CorePage.CoreActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return "RyzaCoreActivityUI"
end

function var_0_0.init(arg_2_0, ...)
	var_0_0.super.init(arg_2_0, ...)

	arg_2_0.camEventId = pg.CameraFixMgr.GetInstance():bind(pg.CameraFixMgr.ASPECT_RATIO_UPDATE, function(arg_3_0, arg_3_1)
		arg_2_0:UpdateAdapt()
	end)

	arg_2_0:UpdateAdapt()
end

function var_0_0.didEnter(arg_4_0)
	var_0_0.super.didEnter(arg_4_0)
end

function var_0_0.UpdateAdapt(arg_5_0)
	local var_5_0 = 1.3333333333333333
	local var_5_1 = 2.1666666666666665
	local var_5_2 = pg.CameraFixMgr.GetInstance()
	local var_5_3 = var_5_2.currentWidth / var_5_2.currentHeight
	local var_5_4 = math.clamp(var_5_3, var_5_0, var_5_1)

	arg_5_0._tf:GetComponent(typeof(AspectRatioFitter)).aspectRatio = var_5_4
end

function var_0_0.willExit(arg_6_0)
	var_0_0.super.willExit(arg_6_0)

	if arg_6_0.camEventId then
		pg.CameraFixMgr.GetInstance():disconnect(arg_6_0.camEventId)

		arg_6_0.camEventId = nil
	end
end

return var_0_0
