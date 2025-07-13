local var_0_0 = {
	"対潜戦闘に関するシステムはヘルプボタンで詳細を確認できます"
}

return {
	id = "NG003",
	events = {
		{
			alpha = 0.4,
			style = {
				dir = 1,
				mode = 1,
				posY = -110,
				posX = 0,
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
