local var_0_0 = class("MapBuilderPermanent", import(".MapBuilder"))

function var_0_0.OnLoaded(arg_1_0)
	setParent(arg_1_0._tf, arg_1_0.float)
end

function var_0_0.OnShow(arg_2_0)
	var_0_0.super.OnShow(arg_2_0)
	setActive(arg_2_0.sceneParent.float, true)
end

function var_0_0.OnHide(arg_3_0)
	arg_3_0.sceneParent:HideBtns()
	setActive(arg_3_0.sceneParent.float, false)
	var_0_0.super.OnHide(arg_3_0)
end

function var_0_0.UpdateButtons(arg_4_0)
	arg_4_0.sceneParent:updateDifficultyBtns()
	arg_4_0.sceneParent:updateActivityBtns()
	arg_4_0.sceneParent:UpdateSwitchMapButton()
end

function var_0_0.UpdateMapItems(arg_5_0)
	var_0_0.super.UpdateMapItems(arg_5_0)

	local var_5_0 = arg_5_0.contextData.map

	if not var_5_0 then
		return
	end

	local var_5_1 = var_5_0:getConfig("cloud_suffix")

	if var_5_1 == "" then
		setActive(arg_5_0.sceneParent.clouds, false)
	else
		setActive(arg_5_0.sceneParent.clouds, true)

		for iter_5_0, iter_5_1 in ipairs(var_5_0:getConfig("clouds_pos")) do
			local var_5_2 = arg_5_0.sceneParent.cloudRTFs[iter_5_0]
			local var_5_3 = var_5_2:GetComponent(typeof(Image))

			var_5_3.enabled = false

			GetSpriteFromAtlasAsync("clouds/cloud_" .. iter_5_0 .. "_" .. var_5_1, "", function(arg_6_0)
				if arg_5_0:CheckState(var_0_0.STATES.DESTROY) then
					return
				end

				if not IsNil(var_5_3) and var_5_0 == arg_5_0.contextData.map then
					var_5_3.enabled = true
					var_5_3.sprite = arg_6_0

					var_5_3:SetNativeSize()

					arg_5_0.sceneParent.cloudRects[iter_5_0] = var_5_2.rect.width
				end
			end)
		end
	end
end

return var_0_0
