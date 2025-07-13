return {
	id = "tb2_7",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "では、ナビィ育成のスケジュール部分を見てみましょう",
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
				text = "「予定」をタップして、このターンの予定の調整を始めましょう",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/NewEducateMainUI(Clone)/root/adapt/normal/schedule",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/NewEducateMainUI(Clone)/root/adapt/normal/schedule",
				pathIndex = -1,
				fingerPos = {
					posY = 50,
					posX = -50
				}
			}
		}
	}
}
