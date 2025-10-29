local var_0_0 = class("LevelStageComboPanel", import("view.base.BaseSubPanel"))

function var_0_0.getUIName(arg_1_0)
	return "LevelStageComboPanel"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.tf_combo = arg_2_0._tf:Find("combo/text")
	arg_2_0.text_combo = arg_2_0.tf_combo:GetComponent(typeof(Text))
	arg_2_0.tf_perfect = arg_2_0._tf:Find("perfect/text")
	arg_2_0.text_perfect = arg_2_0.tf_perfect:GetComponent(typeof(Text))
	arg_2_0.tf_good = arg_2_0._tf:Find("good/text")
	arg_2_0.text_good = arg_2_0.tf_good:GetComponent(typeof(Text))
	arg_2_0.tf_miss = arg_2_0._tf:Find("miss/text")
	arg_2_0.text_miss = arg_2_0.tf_miss:GetComponent(typeof(Text))
	arg_2_0.anims = {}
end

function var_0_0.UpdateView(arg_3_0, arg_3_1)
	if not arg_3_1 then
		return
	end

	setText(arg_3_0.text_combo, arg_3_1.combo or 0)

	local var_3_0 = arg_3_1.scoreHistory

	if var_3_0 then
		arg_3_0.text_perfect.text = var_3_0[4] or 0
		arg_3_0.text_good.text = (var_3_0[2] or 0) + (var_3_0[3] or 0)
		arg_3_0.text_miss.text = (var_3_0[0] or 0) + (var_3_0[1] or 0)
	end
end

function var_0_0.UpdateViewAnimated(arg_4_0, arg_4_1)
	if not arg_4_1 then
		return
	end

	arg_4_0:SetTextAnim(arg_4_0.tf_combo, arg_4_0.text_combo, arg_4_1.combo or 0, 1)

	local var_4_0 = arg_4_1.scoreHistory

	if var_4_0 then
		arg_4_0:SetTextAnim(arg_4_0.tf_perfect, arg_4_0.text_perfect, var_4_0[4] or 0, 2)
		arg_4_0:SetTextAnim(arg_4_0.tf_good, arg_4_0.text_good, (var_4_0[2] or 0) + (var_4_0[3] or 0), 3)
		arg_4_0:SetTextAnim(arg_4_0.tf_miss, arg_4_0.text_miss, (var_4_0[0] or 0) + (var_4_0[1] or 0), 4)
	end
end

function var_0_0.SetTextAnim(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	if tonumber(arg_5_2.text) == arg_5_3 then
		return
	end

	local var_5_0 = false
	local var_5_1 = arg_5_1.localPosition
	local var_5_2 = var_5_1 + Vector3(0, 30, 0)

	arg_5_0.anims[arg_5_4] = LeanTween.value(go(arg_5_1), 0, 1, 0.3):setLoopPingPong(1):setOnUpdate(System.Action_float(function(arg_6_0)
		arg_5_1.localPosition = Vector3.Lerp(var_5_1, var_5_2, arg_6_0)

		if arg_6_0 >= 1 and not var_5_0 then
			arg_5_2.text = arg_5_3
			var_5_0 = true
		end
	end)).id
end

function var_0_0.OnDestroy(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.anims) do
		LeanTween.cancel(iter_7_1)
	end

	table.clear(arg_7_0.anims)
end

return var_0_0
