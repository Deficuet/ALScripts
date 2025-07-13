return {
	id = "DORM3D_GUIDE_01",
	events = {
		{
			alpha = 0,
			stories = {
				"SUSHEHUANXINJIHUA1"
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "「母港」をタップしよう！",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -383,
				posX = -72,
				uiset = {}
			},
			ui = {
				pathIndex = -1,
				dynamicPath = function()
					if getProxy(SettingsProxy):IsMellowStyle() then
						return "/OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/bottom/frame/live"
					else
						return "/OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/bottom/liveButton"
					end
				end
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "「交流」をタップしよう！",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -326,
				posX = 260,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/MainLiveAreaUI(Clone)/dorm_btn",
				pathIndex = -1
			}
		},
		{
			delay = 1.5,
			alpha = 0.4,
			style = {
				text = "「宿舎」をタップしよう！",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -136,
				posX = 116,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/SelectDorm3DUI(Clone)/Map/floor_1/Tianlangxing",
				pathIndex = -1
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "アセットをダウンロードしたら艦船の部屋に入れるわ！",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -135,
				posX = -340,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/SelectDorm3DUI(Clone)/Map/tip/window",
						pathIndex = -1
					}
				}
			}
		}
	}
}
