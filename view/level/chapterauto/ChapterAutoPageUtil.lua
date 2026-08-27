local var_0_0 = class("ChapterAutoPageUtil", import("Support.Utils.PageUtil"))

function var_0_0.Ctor(arg_1_0, ...)
	var_0_0.super.Ctor(arg_1_0, ...)
	pressPersistTrigger(arg_1_0._leftBtn, 0.5, function()
		local var_2_0 = arg_1_0._curNum - arg_1_0._addNum

		var_2_0 = var_2_0 < 0 and arg_1_0._curNum or var_2_0

		arg_1_0:setCurNum(var_2_0)
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(arg_1_0._rightBtn, 0.5, function()
		local var_3_0 = arg_1_0._curNum + arg_1_0._addNum

		for iter_3_0, iter_3_1 in ipairs(arg_1_0._tipCntList) do
			if iter_3_1 < var_3_0 then
				pg.TipsMgr.GetInstance():ShowTips(arg_1_0._tipList[iter_3_0])

				break
			end
		end

		if arg_1_0._maxNum < 0 then
			arg_1_0:setCurNum(var_3_0)
		else
			var_3_0 = var_3_0 > arg_1_0._maxNum and arg_1_0._maxNum or var_3_0

			arg_1_0:setCurNum(var_3_0)
		end
	end, nil, true, true, 0.1, SFX_PANEL)
	onInputEndEdit(arg_1_0, arg_1_0._numTxt, function(arg_4_0)
		local var_4_0 = arg_1_0._curNum

		if not arg_4_0 or arg_4_0 == "" or not tonumber(arg_4_0) then
			local var_4_1 = arg_1_0._curNum
		end

		local var_4_2 = tonumber(arg_4_0)
		local var_4_3 = math.clamp(var_4_2, 0, arg_1_0._maxNum)

		arg_1_0:setCurNum(var_4_3)
	end)
end

function var_0_0.SetTipInfo(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._tipCntList = arg_5_1
	arg_5_0._tipList = arg_5_2
end

function var_0_0.setMaxNum(arg_6_0, arg_6_1)
	arg_6_0._maxNum = arg_6_1

	setActive(arg_6_0._maxBtn, true)
end

function var_0_0.setCurNum(arg_7_0, arg_7_1)
	arg_7_0._curNum = arg_7_1

	setInputText(arg_7_0._numTxt, arg_7_0._curNum)

	if arg_7_0._numUpdate ~= nil then
		arg_7_0._numUpdate(arg_7_0._curNum)
	end
end

return var_0_0
