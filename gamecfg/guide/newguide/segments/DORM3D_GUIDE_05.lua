return {
	id = "DORM3D_GUIDE_05",
	events = {
		{
			alpha = 0,
			style = {
				text = "Now tap Sirius again!",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -98,
				posX = 600,
				uiset = {}
			},
			showSign = {
				type = 2,
				signList = {
					{
						signType = 8,
						pos = {
							-23,
							-97,
							0
						}
					}
				},
				clickArea = {
					500,
					880
				}
			}
		},
		{
			alpha = 0,
			notifies = {
				{
					notify = "Dorm3dRoomMediator.GUIDE_CLICK_LADY",
					body = {}
				}
			}
		},
		{
			alpha = 0.4,
			delay = 0.5,
			style = {
				text = "Tap the Gifts button to give presents to the quarters' inhabitants!",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -203,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/watch/Role/Gift",
				pathIndex = -1
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "You can select your gift over here.",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -36,
				posX = 83,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/gift_panel",
						pathIndex = -1
					}
				}
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "Giving gifts will raise the character's Intimacy with you.",
				mode = 4,
				dir = 1,
				char = "char",
				posY = 252,
				posX = 43,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/gift_panel/content/view/container/1021001",
						pathIndex = -1
					}
				}
			}
		}
	}
}
