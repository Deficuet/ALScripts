local var_0_0 = class("OutPostPtRePage", import(".TemplatePage.NewFrameTemplatePage"))
local var_0_1 = {
	16851,
	16852,
	16853,
	16854
}

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.switchBtn = arg_1_0._tf:Find("AD/switcher/switch_btn")
	arg_1_0.bar = arg_1_0._tf:Find("AD/switcher/phase2/Image/bar")
	arg_1_0.displayBtn = arg_1_0._tf:Find("AD/display_btn")
	arg_1_0.gotTag = arg_1_0._tf:Find("AD/switcher/phase2/Image/got")

	local var_1_0 = arg_1_0.displayBtn:Find("Image1")
	local var_1_1 = arg_1_0.displayBtn:Find("Image2")
	local var_1_2, var_1_3 = arg_1_0:GetActTask()
	local var_1_4 = var_1_2 and var_1_2:isReceive() and var_1_3

	setActive(var_1_0, not var_1_4)
	setActive(var_1_1, var_1_4)

	local var_1_5

	onButton(arg_1_0, arg_1_0.displayBtn, function()
		arg_1_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
			page = "activity",
			targetId = var_1_5
		})
	end)
end

function var_0_0.GetActTask(arg_3_0)
	local var_3_0 = var_0_1
	local var_3_1 = getProxy(TaskProxy)
	local var_3_2
	local var_3_3 = false

	for iter_3_0 = #var_3_0, 1, -1 do
		local var_3_4 = var_3_0[iter_3_0]
		local var_3_5 = var_3_1:getTaskById(var_3_4) or var_3_1:getFinishTaskById(var_3_4)

		if var_3_5 then
			var_3_2 = var_3_5

			if iter_3_0 == #var_3_0 then
				var_3_3 = true
			end

			break
		end
	end

	return var_3_2, var_3_3
end

return var_0_0
