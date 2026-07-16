local var_0_0 = class("AuctionGameStoreView", import("view.base.BasePanel"))

var_0_0.UPDATE_ITEM_LIST = "AuctionGameStoreView::UPDATE_ITEM_LIST"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.cellItemViewList = {}
	arg_2_0.itemViewList = {}
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0.maxLine = 0

	arg_3_0:RefreshStore()

	arg_3_0.eventList = {
		arg_3_0:bind(var_0_0.UPDATE_ITEM_LIST, handler(arg_3_0, arg_3_0.RefreshStore))
	}
end

function var_0_0.RefreshStore(arg_4_0)
	local var_4_0 = getProxy(AuctionGameProxy):GetCurStoreLine()
	local var_4_1 = (var_4_0 - arg_4_0.maxLine) * AuctionGameConst.CELL_COL_CNT

	arg_4_0.maxLine = var_4_0

	for iter_4_0 = 1, var_4_1 do
		arg_4_0.cellItemViewList[#arg_4_0.cellItemViewList + 1] = AuctionGameCellItem.New(tf(Instantiate(arg_4_0.uiCellItemTf, arg_4_0.uiCellParentTf)), arg_4_0._parentClass)

		arg_4_0.cellItemViewList[iter_4_0]:Show(true)
	end

	onNextTick(function()
		arg_4_0:RefreshItemList()
	end)
end

function var_0_0.RefreshItemList(arg_6_0)
	local var_6_0 = getProxy(AuctionGameProxy):GetStoreItemDataList()

	for iter_6_0, iter_6_1 in pairs(var_6_0) do
		local var_6_1 = arg_6_0.itemViewList[iter_6_0] or AuctionGameStoreItem.New(tf(Instantiate(arg_6_0.uiItemTf, arg_6_0.uiCellParentTf)), arg_6_0._parentClass)
		local var_6_2 = AuctionGameConst.CELL_COL_CNT * (iter_6_1.position.y - 1) + iter_6_1.position.x
		local var_6_3 = arg_6_0.cellItemViewList[var_6_2]:GetPosition()

		var_6_1:SetPosition(var_6_3)
		var_6_1:didEnter(iter_6_1)

		arg_6_0.itemViewList[iter_6_0] = var_6_1
	end
end

function var_0_0.RefreshEventEffect(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in pairs(itemDataList) do
		local var_7_0 = arg_7_0.itemViewList[iter_7_0]

		if var_7_0 == nil then
			var_7_0 = AuctionGameStoreItem.New(tf(Instantiate(arg_7_0.uiItemTf, arg_7_0.uiCellParentTf)), arg_7_0._parentClass)

			local var_7_1 = AuctionGameConst.CELL_COL_CNT * (iter_7_1.position.y - 1) + iter_7_1.position.x
			local var_7_2 = arg_7_0.cellItemViewList[var_7_1]:GetPosition()

			var_7_0:SetPosition(var_7_2)

			arg_7_0.itemViewList[iter_7_0] = var_7_0
		end

		var_7_0:didEnter(iter_7_0, iter_7_1)
	end
end

function var_0_0.willExit(arg_8_0)
	for iter_8_0, iter_8_1 in ipairs(arg_8_0.eventList) do
		arg_8_0:disconnect(iter_8_1)
	end

	arg_8_0.eventList = nil

	for iter_8_2, iter_8_3 in ipairs(arg_8_0.cellItemViewList) do
		iter_8_3:willExit()
	end

	arg_8_0.cellItemViewList = nil

	for iter_8_4, iter_8_5 in pairs(arg_8_0.itemViewList) do
		iter_8_5:willExit()
	end

	arg_8_0.itemViewList = nil

	arg_8_0:detach()
end

return var_0_0
