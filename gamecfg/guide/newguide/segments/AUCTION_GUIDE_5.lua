return {
	id = "AUCTION_GUIDE_5",
	events = {
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "试着输入金额，然后点击出价按钮进行出价",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 96.2,
				posX = -296.64,
				uiset = {
					{
						lineMode = 3,
						path = "OverlayCamera/Overlay/UIMain/AuctionGameMainBidUI(Clone)/panel/inputPanel/curBid",
						pathIndex = -1
					},
					{
						lineMode = 3,
						path = "OverlayCamera/Overlay/UIMain/AuctionGameMainBidUI(Clone)/panel/inputPanel/numPanel",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AuctionGameMainBidUI(Clone)/panel/inputPanel/bidBtn",
				pathIndex = -1,
				fingerPos = {
					posY = -30.75,
					posX = 260.6
				}
			}
		}
	}
}
