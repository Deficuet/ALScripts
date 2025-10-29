return {
	id = "ISLAND_GUIDE_12",
	events = {
		{
			delay = 0.3,
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "下部のボタンをタップするとキャラ詳細を確認できます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandGetShipUI(Clone)/main/go",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "離島経営では、キャラはそれぞれ能力とスキルが存在します 離島教科書を消費し、能力とスキルレベルを上昇させることができます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = -200,
				uiset = {
					{
						lineMode = 2,
						path = "/UICamera/Canvas/UIMain/UIIsland/layer1/page/IslandShipInfoUI(Clone)/adapt/main_panel",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "着せ替えでは、キャラの外見を変更することができます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandShipMainUI(Clone)/top/toggles/dress",
				pathIndex = -1,
				triggerType = {
					2,
					true
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "きせかえパーツは衣装と3種類のアクセサリーが存在します",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "/UICamera/Canvas/UIMain/UIIsland/layer1/page/IslandShipDressUI(Clone)/adapt/right_panel/toggles",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "タップしてキャラ詳細画面を閉じましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandShipMainUI(Clone)/top/back",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			alpha = 0,
			style = {
				text = "タップして離島権限認証装置から離れましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/UIIsland/layer1/ui/IslandInviteUI(Clone)/top/back",
				pathIndex = -1
			}
		},
		{
			alpha = 0,
			doFunc = function()
				if _IslandCore then
					_IslandCore:GetView():NotifiyIsland(ISLAND_EX_EVT.PLAY_PERFORMANCE, {
						name = "ISLANDPERFORMANCE9"
					})
				end
			end
		}
	}
}
