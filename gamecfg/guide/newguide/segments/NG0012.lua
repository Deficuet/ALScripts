local var_0_0 = {
	"有新的战斗机制出现了！点击帮助按钮查看！"
}

return {
	id = "NG0012",
	events = {
		{
			action = {
				say = {
					text = var_0_0[1],
					style = {
						alpha = 0.4,
						mode = 1,
						dir = 1,
						posY = -110,
						posX = 0
					}
				}
			}
		},
		{
			action = {
				ui = {
					path = "/OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"
				}
			}
		}
	}
}
