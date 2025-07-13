return {
	id = "DORM3D_GUIDE_06",
	events = {
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "Tap here to move the character to the beach area.",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -300,
				posX = 177,
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
				text = "Looks like you haven't unlocked the ability to position characters yet. Start by tapping on this icon.",
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
				text = "Tap this icon and you'll get the ability to move characters to the beach!",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -435,
				posX = 207,
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
				text = "Tap Sirius to visit the beach with her!",
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
