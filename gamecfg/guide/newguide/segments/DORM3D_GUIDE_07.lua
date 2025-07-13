return {
	id = "DORM3D_GUIDE_07",
	events = {
		{
			is3dDorm = true,
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "ここをタップすると親愛度確認できるわ",
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
				text = "ここをタップして、時間変更画面を開いて！",
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
				text = "タップすると時間を切り替えられるわ。部屋のオブジェクトは昼夜違うみたい…？",
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
