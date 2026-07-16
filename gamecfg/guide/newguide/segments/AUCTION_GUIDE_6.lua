return {
	id = "AUCTION_GUIDE_6",
	events = {
		{
			is3dDorm = false,
			code = 1,
			alpha = 0.2,
			mask = true,
			style = {
				text = "每轮出价结束将公布所有人的出价。前四轮若最高者出价为第二名的2、1.6、1.3、1.1倍以上则直接中标，第五轮为出价最高者中标，如果第五轮最高者出价相同则先出价的中标",
				mode = 2,
				dir = -1,
				char = 1,
				posY = -291.5,
				posX = 742.3,
				uiset = {
					{
						lineMode = 3,
						path = "OverlayCamera/Overlay/UIMain/AuctionGameMainRoundOverUI(Clone)/panel",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "现在是第二轮出价，根据已知的信息，这一轮可以尝试出价100,000拿下藏品",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -240.1,
				posX = 526.7,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/AuctionGameMainUI(Clone)/adapt/rigltPanel/bidBtn",
				pathIndex = -1,
				fingerPos = {
					posY = -27.63,
					posX = 225.6
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "已经帮指挥官设定好了价格，请点击“确认出价”按钮进行出价",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 72.6,
				posX = 376.47,
				uiset = {
					{
						lineMode = 3,
						path = "OverlayCamera/Overlay/UIMain/AuctionGameMainBidUI(Clone)/panel/inputPanel/curBid",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AuctionGameMainBidUI(Clone)/panel/inputPanel/bidBtn",
				pathIndex = -1,
				fingerPos = {
					posY = -28.28,
					posX = 254.34
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			mask = true,
			style = {
				text = "指挥官的出价高TB出价1.6倍，直接中标！恭喜指挥官拿下本局藏品",
				mode = 2,
				dir = -1,
				char = 1,
				posY = -291.5,
				posX = 742.3,
				uiset = {
					{
						lineMode = 3,
						path = "OverlayCamera/Overlay/UIMain/AuctionGameMainRoundOverUI(Clone)/panel",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "竞拍结束后将结算获得藏品的总价值，总价值高于出价则获得所有收益，总价值低于出价则其他竞拍者将获得亏损额的15%分红",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -203.41,
				posX = -190.7,
				uiset = {
					{
						lineMode = 3,
						path = "OverlayCamera/Overlay/UIMain/adapt/rightPanel/info",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.2,
			style = {
				text = "教学已完成，接下来指挥官就可以亲自体验竞拍魅力了",
				mode = 2,
				dir = 1,
				char = 1,
				posY = -387.8,
				posX = 64.73,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/adapt/rightPanel/cancelBtn",
				pathIndex = -1,
				fingerPos = {
					posY = -25.4,
					posX = 227.3
				}
			}
		}
	}
}
