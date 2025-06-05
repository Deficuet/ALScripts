local var_0_0 = class("KillEnemyAwardWindow", import(".PtAwardWindow"))

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.UIlist:make(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == UIItemList.EventUpdate then
			local var_2_0 = arg_1_1[arg_2_1 + 1]
			local var_2_1 = arg_1_2[arg_2_1 + 1]

			setText(arg_2_2:Find("title/Text"), "PHASE " .. arg_2_1 + 1)
			setActive(arg_2_2:Find("target/Text"), false)
			setText(arg_2_2:Find("target/title"), var_2_1)
			setActive(arg_2_2:Find("target/icon"), false)

			local var_2_2 = {
				type = var_2_0[1],
				id = var_2_0[2],
				count = var_2_0[3]
			}

			updateDrop(arg_2_2:Find("award"), var_2_2, {
				hideName = true
			})
			onButton(arg_1_0.binder, arg_2_2:Find("award"), function()
				arg_1_0.binder:emit(BaseUI.ON_DROP, var_2_2)
			end, SFX_PANEL)
			setActive(arg_2_2:Find("award/mask"), arg_2_1 + 1 <= arg_1_3)
		end
	end)
	arg_1_0.UIlist:align(#arg_1_1)
end

function var_0_0.Show(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.dropList
	local var_4_1 = arg_4_1.descs
	local var_4_2 = arg_4_1.finishedIndex

	var_0_1(arg_4_0, var_4_0, var_4_1, var_4_2)
	setActive(arg_4_0.ptTF, false)
	setActive(arg_4_0._tf, true)
end

return var_0_0
