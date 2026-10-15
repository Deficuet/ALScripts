local var_0_0 = class("TaskPtAwardWindow", import("..activity.Panels.PtAwardWindow"))

function var_0_0.UpdateList(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	assert(#arg_1_1 == #arg_1_2)
	arg_1_0.UIlist:make(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == UIItemList.EventUpdate then
			local var_2_0 = arg_1_1[arg_2_1 + 1]

			arg_1_0:UpdateDrop(arg_2_2:Find("award"), var_2_0[1])
			arg_1_0:UpdateDrop(arg_2_2:Find("award1"), var_2_0[2])

			local var_2_1 = arg_1_2[arg_2_1 + 1]

			setText(arg_2_2:Find("title/Text"), "PHASE " .. arg_2_1 + 1)
			setText(arg_2_2:Find("target/Text"), var_2_1)
			setText(arg_2_2:Find("target/title"), arg_1_0.resTitle)
			setActive(arg_2_2:Find("award/mask"), arg_2_1 + 1 <= arg_1_3)
			setActive(arg_2_2:Find("award1/mask"), arg_2_1 + 1 <= arg_1_3)

			if arg_2_2:Find("target/icon") then
				if arg_1_0.resIcon == "" then
					arg_1_0.resIcon = nil
				end

				if arg_1_0.resIcon then
					LoadImageSpriteAsync(arg_1_0.resIcon, arg_2_2:Find("target/icon"), false)
				end

				setActive(arg_2_2:Find("target/icon"), arg_1_0.resIcon)
				setActive(arg_2_2:Find("target/mark"), arg_1_0.resIcon)
			end
		end
	end)
	arg_1_0.UIlist:align(#arg_1_1)
end

function var_0_0.Show(arg_3_0, arg_3_1)
	var_0_0.super.Show(arg_3_0, arg_3_1)
	setActive(arg_3_0.getBtn, false)
end

function var_0_0.UpdateDrop(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_2 then
		setActive(arg_4_1, true)

		local var_4_0 = {
			type = arg_4_2[1],
			id = arg_4_2[2],
			count = arg_4_2[3]
		}

		updateDrop(arg_4_1, var_4_0, {
			hideName = true
		})
		onButton(arg_4_0.binder, arg_4_1, function()
			arg_4_0.binder:emit(BaseUI.ON_DROP, var_4_0)
		end, SFX_PANEL)
	else
		setActive(arg_4_1, false)
	end
end

return var_0_0
