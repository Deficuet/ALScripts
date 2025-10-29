local var_0_0 = class("ReturnerAwardWindow", import(".PtAwardWindow"))

local function var_0_1(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.UIlist:make(function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_0 == UIItemList.EventUpdate then
			local var_2_0 = arg_1_1[arg_2_1 + 1]
			local var_2_1 = arg_1_2[arg_2_1 + 1]

			arg_1_0.resTitle = string.gsub(arg_1_0.resTitle, "：", "")

			setText(arg_2_2:Find("title/Text"), "PHASE " .. arg_2_1 + 1)
			setText(arg_2_2:Find("target/Text"), var_2_1)
			setText(arg_2_2:Find("target/title"), arg_1_0.resTitle)

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
			setActive(arg_2_2:Find("award/mask"), table.contains(arg_1_3, var_2_1))

			if arg_2_2:Find("target/icon") and arg_1_0.resIcon and arg_1_0.resIcon ~= "" then
				setActive(arg_2_2:Find("target/icon"), true)
				LoadImageSpriteAsync(arg_1_0.resIcon, arg_2_2:Find("target/icon"), false)
			else
				setActive(arg_2_2:Find("target/icon"), false)
			end
		end
	end)
	arg_1_0.UIlist:align(#arg_1_1)
end

function var_0_0.Show(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.dropList
	local var_4_1 = arg_4_1.targets
	local var_4_2 = arg_4_1.fetchList
	local var_4_3 = arg_4_1.count
	local var_4_4 = arg_4_1.resId

	arg_4_0.blur = arg_4_1.blur

	local var_4_5 = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_4_4
	}):getName()

	arg_4_0.resTitle, arg_4_0.cntTitle = i18n("pt_count", var_4_5), i18n("pt_total_count", var_4_5)
	arg_4_0.cntTitle = string.gsub(arg_4_0.cntTitle, "：", "")

	arg_4_0:updateResIcon(arg_4_1.resId, arg_4_1.resIcon, arg_4_1.type)
	var_0_1(arg_4_0, var_4_0, var_4_1, var_4_2)

	arg_4_0.totalTxt.text = var_4_3
	arg_4_0.totalTitleTxt.text = arg_4_0.cntTitle

	setActive(arg_4_0._tf, true)

	if arg_4_0.blur then
		pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf)
	end
end

return var_0_0
