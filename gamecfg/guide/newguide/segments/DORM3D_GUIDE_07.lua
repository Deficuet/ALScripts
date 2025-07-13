return {
	id = "DORM3D_GUIDE_07",
	events = {
		{
			is3dDorm = true,
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "Tap here to check your Intimacy with her.",
				mode = 4,
				dir = 1,
				char = "char",
				posY = 350,
				posX = 650,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/base/top/favor_level",
				pathIndex = -1
			}
		},
		{
			is3dDorm = true,
			delay = 0.8,
			alpha = 0.4,
			style = {
				text = "Tap this to open the menu to change the time of day!",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -450,
				posX = -450,
				uiset = {
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/Dorm3dLevelUI(Clone)/panel",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/Dorm3dLevelUI(Clone)/panel/bg/bottom/btn_time",
				pathIndex = -1,
				fingerPos = {
					posY = -40,
					posX = 65
				}
			}
		},
		{
			delay = 0.2,
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "Tap this to change the time of day. Certain things change around the quarters between night and day!~",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -400,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/TimeSelectWindow/panel",
						pathIndex = -1
					}
				}
			}
		}
	}
}
