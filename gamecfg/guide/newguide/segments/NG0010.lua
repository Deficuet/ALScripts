local var_0_0 = {
	"特殊目標の拿捕についてはヘルプボタンで説明を確認できます"
}

return {
	id = "NG0010",
	events = {
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 1,
				posY = 172,
				posX = -337,
				text = var_0_0[1]
			}
		},
		{
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/top/LevelStageView(Clone)/bottom_stage/normal/help_button"
			}
		}
	}
}
