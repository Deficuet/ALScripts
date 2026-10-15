local var_0_0 = class("LuaList")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.parentClass_ = arg_1_1
	arg_1_0.uiListGo_ = arg_1_3.gameObject
	arg_1_0.itemClass_ = arg_1_4
	arg_1_0.itemRenderer_ = arg_1_2
	arg_1_0.itemOfInstanceID_ = {}
	arg_1_0.itemOfIndex_ = {}

	arg_1_0:InitUI()
	arg_1_0:AddListeners()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0.uiList_ = arg_2_0.uiListGo_:GetComponent(typeof(UIList))
end

function var_0_0.AddListeners(arg_3_0)
	if arg_3_0.uiList_ ~= nil then
		arg_3_0.uiList_:SetItemRenderer(handler(arg_3_0, arg_3_0.ItemRenderer))
		arg_3_0.uiList_:SetItemRecycleHandler(handler(arg_3_0, arg_3_0.ItemRecycleHandler))
		arg_3_0.uiList_:SetPageChangeHandler(handler(arg_3_0, arg_3_0.PageChangeHandler))
		arg_3_0.uiList_:SetHeadTailChangeHandler(handler(arg_3_0, arg_3_0.HeadTailChangeHandler))
	end
end

function var_0_0.RemoveListeners(arg_4_0)
	if arg_4_0.uiList_ ~= nil then
		arg_4_0.uiList_:SetItemRenderer(nil)
		arg_4_0.uiList_:SetItemRecycleHandler(nil)
		arg_4_0.uiList_:SetPageChangeHandler(nil)
		arg_4_0.uiList_:SetHeadTailChangeHandler(nil)
	end
end

function var_0_0.HeadTailChangeHandler(arg_5_0, arg_5_1, arg_5_2)
	if arg_5_0.headTailChangeHandler_ ~= nil then
		arg_5_0.headTailChangeHandler_(arg_5_1, arg_5_2)
	end
end

function var_0_0.ItemRenderer(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1 + 1
	local var_6_1 = arg_6_2:GetInstanceID()
	local var_6_2

	if arg_6_0.itemOfInstanceID_[var_6_1] then
		var_6_2 = arg_6_0.itemOfInstanceID_[var_6_1]
	else
		var_6_2 = arg_6_0.itemClass_.New(arg_6_2.transform, arg_6_0.parentClass_)
		arg_6_0.itemOfInstanceID_[var_6_1] = var_6_2
	end

	arg_6_0.itemOfIndex_[arg_6_1 + 1] = var_6_2

	if var_6_0 > arg_6_0.num_ then
		return
	end

	if arg_6_0.itemRenderer_ then
		arg_6_0.itemRenderer_(var_6_0, var_6_2)
	end
end

function var_0_0.GetItemByIndex(arg_7_0, arg_7_1)
	local var_7_0, var_7_1 = arg_7_0:GetHeadAndTail()

	if var_7_0 == 0 then
		return
	end

	if arg_7_1 < var_7_0 or var_7_1 < arg_7_1 then
		return nil
	end

	return arg_7_0.itemOfIndex_[arg_7_1]
end

function var_0_0.ItemRecycleHandler(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0.itemRecycleHandler_ then
		arg_8_0.itemRecycleHandler_(arg_8_1, arg_8_2)
	end
end

function var_0_0.SetItemRecycleHandler(arg_9_0, arg_9_1)
	arg_9_0.itemRecycleHandler_ = arg_9_1
end

function var_0_0.SetPageChangeHandler(arg_10_0, arg_10_1)
	arg_10_0.pageChangeHandler_ = arg_10_1
end

function var_0_0.SetHeadTailChangeHandler(arg_11_0, arg_11_1)
	arg_11_0.headTailChangeHandler_ = arg_11_1
end

function var_0_0.PageChangeHandler(arg_12_0, arg_12_1)
	if arg_12_0.pageChangeHandler_ ~= nil then
		arg_12_0.pageChangeHandler_(arg_12_1 + 1)
	end
end

function var_0_0.ScrollToIndex(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	local var_13_0 = arg_13_1 - 1

	arg_13_2 = arg_13_2 or false
	arg_13_3 = arg_13_3 or false
	arg_13_4 = arg_13_4 or -1

	arg_13_0.uiList_:ScrollToIndex(var_13_0, arg_13_2, arg_13_3, arg_13_4)
end

function var_0_0.RemoveTween(arg_14_0)
	arg_14_0.uiList_:RemoveTween()
end

function var_0_0.SwitchToPage(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1 - 1

	arg_15_0.uiList_:SwitchToPageIndex(var_15_0)
end

function var_0_0.GetItemList(arg_16_0)
	local var_16_0 = {}
	local var_16_1, var_16_2 = arg_16_0:GetHeadAndTail()

	if var_16_1 == 0 then
		return {}
	end

	for iter_16_0 = var_16_1, var_16_2 do
		var_16_0[iter_16_0] = arg_16_0.itemOfIndex_[iter_16_0]
	end

	return var_16_0
end

function var_0_0.GetHeadAndTail(arg_17_0)
	local var_17_0 = arg_17_0.uiList_:GetHeadAndTail()

	return var_17_0.x + 1, var_17_0.y + 1
end

function var_0_0.SetAlignment(arg_18_0, arg_18_1)
	arg_18_0.uiList_:SetAlignment(arg_18_1)
end

function var_0_0.StartScroll(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4, arg_19_5)
	arg_19_2 = arg_19_2 or 0
	arg_19_5 = arg_19_5 or -1

	local var_19_0 = arg_19_2 - 1

	arg_19_0.num_ = arg_19_1

	arg_19_0:UpdateUIList(arg_19_1)

	if var_19_0 >= 0 then
		arg_19_0.uiList_:ScrollToIndex(var_19_0, arg_19_3, arg_19_4, arg_19_5)
	end
end

function var_0_0.StartScrollWithoutAnimator(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.num_ = arg_20_1

	arg_20_0.uiList_:SetNumItems(arg_20_1, true)

	if arg_20_2 then
		arg_20_0.uiList_:SetScrolledPosition(arg_20_2)
	end
end

function var_0_0.Refresh(arg_21_0)
	local var_21_0, var_21_1 = arg_21_0:GetHeadAndTail()

	if var_21_0 == 0 then
		return
	end

	for iter_21_0 = var_21_0, var_21_1 do
		if arg_21_0.itemRenderer_ then
			local var_21_2 = arg_21_0.itemOfIndex_[iter_21_0]

			if var_21_2 then
				arg_21_0.itemRenderer_(iter_21_0, var_21_2)
			end
		end
	end
end

function var_0_0.SetScrolledPosition(arg_22_0, arg_22_1)
	arg_22_0.uiList_:SetScrolledPosition(arg_22_1)
end

function var_0_0.GetScrolledPosition(arg_23_0)
	return arg_23_0.uiList_:GetScrolledPosition()
end

function var_0_0.StartScrollByPosition(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.num_ = arg_24_1

	arg_24_0:UpdateUIList(arg_24_1)
	arg_24_0:SetScrolledPosition(arg_24_2 or Vector2.zero)
end

function var_0_0.UpdateUIList(arg_25_0, arg_25_1)
	arg_25_0.uiList_:SetNumItems(arg_25_1)
end

function var_0_0.StopRender(arg_26_0)
	if arg_26_0.uiList_ then
		arg_26_0.uiList_:StopRender()
	end
end

function var_0_0.Dispose(arg_27_0)
	arg_27_0:RemoveListeners()

	if arg_27_0.uiList_ ~= nil then
		arg_27_0:RemoveTween()
		arg_27_0.uiList_:StopRender()
		arg_27_0.uiList_:HideBlock()

		arg_27_0.uiList_ = nil
	end

	if arg_27_0.itemOfInstanceID_ then
		for iter_27_0, iter_27_1 in pairs(arg_27_0.itemOfInstanceID_) do
			iter_27_1:willExit()
		end

		arg_27_0.itemOfInstanceID_ = nil
	end

	arg_27_0.pageChangeHandler_ = nil
	arg_27_0.itemRecycleHandler_ = nil
end

function var_0_0.SetOrientation(arg_28_0, arg_28_1)
	if arg_28_1 == 0 then
		arg_28_0.uiList_:SetOrientation(Orientation.Horizontal)
	else
		arg_28_0.uiList_:SetOrientation(Orientation.Vertical)
	end
end

function var_0_0.GetNum(arg_29_0)
	return arg_29_0.num_
end

function var_0_0.SetAppearType(arg_30_0, arg_30_1)
	arg_30_0.uiList_:SetAppearType(arg_30_1)
end

return var_0_0
