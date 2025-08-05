return {
	id = "NG0032_1",
	events = {
		{
			alpha = 0.4,
			code = {
				1
			},
			ui = {
				delay = 1,
				dynamicPath = function()
					if getProxy(SettingsProxy):IsMellowStyle() then
						return "OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/right/activity/MainCoreActivityBtn"
					else
						return "OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/linkBtns/MainCoreActivityBtn"
					end
				end,
				triggerType = {
					1
				},
				fingerPos = {
					posY = -34.31,
					posX = 50
				}
			},
			style = {
				text = "調合機能が開放されたわ",
				mode = 1,
				posY = 0,
				dir = 1,
				posX = -277.2
			}
		},
		{
			alpha = 0.4,
			is3dDorm = false,
			code = {
				1
			},
			style = {
				text = "ここをタップで確認して",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/RyzaCoreActivityUI(Clone)/adapt/tabs/5",
				pathIndex = -1,
				fingerPos = {
					posY = -52.9,
					posX = 73.91
				},
				triggerType = {
					2,
					true
				}
			}
		},
		{
			alpha = 0.4,
			is3dDorm = false,
			code = {
				1
			},
			style = {
				text = "調合機能を確認するわよ。まずはレシピね",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/RyzaCoreActivityUI(Clone)/page_list/RyzaAtelierCompositeRePage(Clone)/adapt/atelierBtn",
				pathIndex = -1,
				triggerType = {
					1
				}
			}
		},
		{
			alpha = 0.4,
			code = {
				1
			},
			style = {
				text = "レシピをタップすると必要な素材を確認できる",
				mode = 1,
				posY = 0,
				dir = -1,
				posX = -122,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/Top/FormulaList/Frame/ScrollView",
						pathIndex = -1
					}
				}
			}
		},
		{
			alpha = 0.4,
			code = {
				1
			},
			style = {
				text = "素材は採取地から入手できるわ",
				mode = 1,
				posY = 0,
				dir = -1,
				posX = -122,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/Top/FormulaList/Frame/ScrollView",
						pathIndex = -1
					}
				}
			}
		},
		{
			alpha = 0.4,
			code = {
				1
			},
			style = {
				text = "一部の素材は母港依頼から入手できるわよ",
				mode = 1,
				posY = 0,
				dir = -1,
				posX = -122,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/Top/FormulaList/Frame/ScrollView",
						pathIndex = -1
					}
				}
			}
		}
	}
}
