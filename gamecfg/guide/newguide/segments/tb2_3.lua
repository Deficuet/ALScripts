return {
	id = "tb2_3",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "ナビィとの日常会話も重要な育成要素です",
				mode = 2,
				dir = -1,
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
				text = "会話バブルが表示されていれば、ナビィが指揮官と会話したがっているサインになります",
				mode = 2,
				dir = -1,
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
				text = "タップして、ナビィが何を言いたいのか見てみましょう",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/NewEducateMainUI(Clone)/root/main/topic",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/NewEducateMainUI(Clone)/root/main/topic",
				pathIndex = -1
			}
		}
	}
}
