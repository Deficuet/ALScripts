return {
	id = "DORM3D_GUIDE_06",
	events = {
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "ここをタップするとキャラを配置できるわ",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -300,
				posX = 70,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/invite_panel/window/container",
				pathIndex = 0
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "キャラ配置はまだ開放されていないわね。まずはアイコンをタップよ",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -40,
				posX = 296,
				uiset = {
					{
						lineMode = 1,
						path = "OverlayCamera/Overlay/UIMain/select_panel/window/character/container/20220/base/mask",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/select_panel/window/character/container/20220/base/mask",
				pathIndex = -1
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "ここをタップすると、キャラを砂浜に配置できるようになるわ！",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -435,
				posX = -80,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/Dorm3dRoomUnlockWindow(Clone)/Window/Confirm",
				pathIndex = -1
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "シリアスをタップして、一緒に砂浜に行きましょう！",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -100,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "OverlayCamera/Overlay/UIMain/select_panel/window/character/container/20220",
						pathIndex = -1
					}
				}
			}
		}
	}
}
