local var_0_0 = class("MainSpineIcon", import(".MainBaseIcon"))

function var_0_0.Resume(arg_1_0)
	if arg_1_0.spineAnim and not IsNil(arg_1_0.spineAnim) then
		arg_1_0.spineAnim:Resume()
	end
end

function var_0_0.Pause(arg_2_0)
	if arg_2_0.spineAnim and not IsNil(arg_2_0.spineAnim) and arg_2_0.spineAnim.Pause ~= nil and not IsNil(arg_2_0.spineAnim:GetAnimationState()) then
		arg_2_0.spineAnim:Pause()
	end
end

function var_0_0.Load(arg_3_0, arg_3_1)
	arg_3_0.loading = true

	assert(not arg_3_0.shipModel)

	arg_3_0.name = arg_3_1

	PoolMgr.GetInstance():GetSpineChar(arg_3_1, true, function(arg_4_0)
		if arg_3_0.name ~= arg_3_1 then
			PoolMgr.GetInstance():ReturnSpineChar(arg_3_1, arg_4_0)

			return
		end

		LeanTween.cancel(arg_4_0)

		arg_3_0.loading = false
		arg_3_0.shipModel = arg_4_0
		tf(arg_4_0).localScale = Vector3(0.75, 0.75, 1)

		local var_4_0 = pg.ship_spine_shift[arg_3_1]
		local var_4_1 = var_4_0 and var_4_0.mainui_shift[1] or 0
		local var_4_2 = -130 + (var_4_0 and var_4_0.mainui_shift[2] or 0)

		setParent(arg_4_0, arg_3_0._tf)

		tf(arg_4_0).localPosition = Vector3(var_4_1, var_4_2, 0)

		local var_4_3 = arg_4_0:GetComponent("SpineAnimUI")

		var_4_3:SetAction("normal", 0)

		arg_3_0.spineAnim = var_4_3

		onNextTick(function()
			if arg_3_0.name ~= arg_3_1 then
				return
			end

			var_4_3:Resume()
		end)
	end)
end

function var_0_0.Unload(arg_6_0)
	if arg_6_0.name and arg_6_0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(arg_6_0.name, arg_6_0.shipModel)
	end

	arg_6_0.name = nil
	arg_6_0.shipModel = nil
	arg_6_0.spineAnim = nil
end

return var_0_0
