return {
	id = "DORM3D_GUIDE_04",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "Tap here to change the area.",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -439,
				posX = 416,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/base/right/Zone",
				pathIndex = -1
			}
		},
		{
			alpha = 0.4,
			delay = 0.5,
			style = {
				text = "Tap the Dining Area to invite Sirius over.",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -285,
				posX = 307,
				uiset = {
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/base/right/Zone/List/Table",
						pathIndex = -1
					}
				}
			},
			ui = {
				lineMode = 2,
				path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/base/right/Zone/List",
				pathIndex = 1
			}
		}
	}
}
