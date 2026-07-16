local var_0_0 = import("view.activity.AuctionGame.game.settlement.store.AuctionGameMainSettlementStoreView")
local var_0_1 = class("AuctionGamePreorderBoxSettlementStoreView", var_0_0)

function var_0_1.Init(arg_1_0)
	arg_1_0.cellItemViewList = {}
	arg_1_0.itemViewList = {}

	local var_1_0 = getProxy(AuctionGameBaseProxy):GetMaxLineCnt() * AuctionGameConst.CELL_COL_CNT

	for iter_1_0 = 1, var_1_0 do
		arg_1_0.cellItemViewList[iter_1_0] = AuctionGameCellItem.New(tf(Instantiate(arg_1_0.uiCellItemTf, arg_1_0.uiCellParentTf)), arg_1_0._parentClass)

		arg_1_0.cellItemViewList[iter_1_0]:Show(true)
	end
end

function var_0_1.didEnter(arg_2_0)
	arg_2_0.itemDataList = getProxy(AuctionGameBaseProxy):GetItemList()
	arg_2_0.showIndex = 1

	onNextTick(function()
		arg_2_0:ShowAllContour()
		arg_2_0:RefreshNextItem()
	end)

	arg_2_0.eventList = {}
end

return var_0_1
