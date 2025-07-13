return {
	id = "tb2_4",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "日常会話をすると、ナビィの好感度が上昇します",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/NewEducateMainUI(Clone)/root/adapt/favor",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/NewEducateMainUI(Clone)/root/adapt/favor",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "タップすると現在の好感度レベルを確認できます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/NewEducateFavorPanel(Clone)/favor_panel/panel",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "以降、レベルが1つ上がるごとに追加報酬が獲得できます",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "画面をタップして戻りましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/NewEducateFavorPanel(Clone)/favor_panel",
				pathIndex = -1,
				fingerPos = {
					posY = 0,
					posX = 400
				}
			}
		}
	}
}
