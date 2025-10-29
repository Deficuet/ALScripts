return {
	id = "ISLAND_GUIDE_17",
	events = {
		{
			is3dDorm = false,
			delay = 0.3,
			alpha = 0.4,
			style = {
				text = "順位を上げて、報酬を手に入れましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/blur/pages/IslandSeasonRankPanel(Clone)/content/player_rank",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "前の画面に戻りましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/blur/top/back",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "管理画面を開きましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandUI(Clone)/top/btn_container/device",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "倉庫をタップしましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandDeviceUI(Clone)/panel/btn_container/inventory",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "ここをタップすると、資源を開発PTに変換できます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandInventoryUI(Clone)/window/batch_sell",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "シーズンが終了すると、全ての資源はシーズンの開発PTに自動で変換されます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		}
	}
}
