local var_0_0 = {
	"指挥官，欢迎来到碧蓝航线，先去新兵训练营报道吧。"
}

return {
	id = "NG004",
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
				dynamicPath = function()
					if getProxy(SettingsProxy):IsMellowStyle() then
						return "/OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/left/list/MainUIRecruitBtn4Mellow(Clone)"
					else
						return "/OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/link_top/layout/MainUIRecruitBtn(Clone)"
					end
				end
			}
		}
	}
}
