return {
	id = "tb2_14",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "Here you can view the level-up requirements for all activities.",
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
				text = "Tap this button to show or hide the level-up requirements for the activity.",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/main/left/plan_view/content/tpl/toggle",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/main/left/plan_view/content/tpl/toggle",
				pathIndex = -1,
				fingerPos = {
					posY = -80,
					posX = 20
				},
				triggerType = {
					2,
					true
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "The next activity level will automatically unlock when you meet the requirements.",
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
				text = "Higher-level activities give you bigger parameter boosts.",
				mode = 2,
				dir = -1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		}
	}
}
