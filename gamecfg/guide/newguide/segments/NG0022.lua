local var_0_0 = {
	"新しい兵装を開発できるようになったわ！早速チェックしなさい！",
	"兵装の開発ツリーはここで確認できるわ",
	"画面をスライドすると、開発ツリーを最後まで確認できるわよ",
	"アイコンをタップすることで開発したい兵装を選択できるわ",
	"既存の兵装…つまり開発元となる兵装を選択する必要があるわね",
	"あとは資金と素材ね。素材は主にセイレーン作戦で入手できるそうよ",
	"全ての素材が揃えたら、開発ボタンをタップよ！新兵装を受け取ってちょうだい！"
}

return {
	id = "NG0022",
	events = {
		{
			ui = {
				dynamicPath = function()
					if getProxy(SettingsProxy):IsMellowStyle() then
						return "/OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/bottom/frame/tech"
					else
						return "/OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/bottom/technologyButton"
					end
				end,
				triggerType = {
					1
				},
				fingerPos = {
					posX = 50.9,
					posY = -28.1,
					rotateX = 0,
					rotateZ = 0,
					rotateY = 0
				}
			}
		},
		{
			style = {
				dir = 1,
				mode = 1,
				posY = 0,
				posX = -60.9,
				text = var_0_0[1]
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/SelectTechnologyUI(Clone)/frame/bg/transform_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posX = 131.46,
					posY = -120.12,
					rotateX = 0,
					rotateZ = 0,
					rotateY = 0
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 1,
				posY = 0,
				posX = -396.33,
				text = var_0_0[2],
				ui = {
					path = "/UICamera/Canvas/UIMain/EquipmentTransformTreeUI(Clone)/Adapt/Left/EquipmentTypes/ViewPort/Content"
				}
			}
		},
		{
			style = {
				dir = 1,
				mode = 1,
				posY = 0,
				posX = -65.8,
				text = var_0_0[3]
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = 1,
				mode = 1,
				posY = -253.44,
				posX = 151.52,
				text = var_0_0[4]
			},
			ui = {
				path = "UICamera/Canvas/UIMain/EquipmentTransformTreeUI(Clone)/Adapt/Right/ViewPort/Content/11060/Item",
				triggerType = {
					1
				},
				fingerPos = {
					posX = 101.97,
					posY = -92.07,
					rotateX = 0,
					rotateZ = 0,
					rotateY = 0
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 1,
				posY = -251.52,
				posX = -122.97,
				text = var_0_0[5],
				ui = {
					path = "OverlayCamera/Overlay/UIMain/EquipmentTransformUI(Clone)/Adapt/SourceEquip/Item"
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 1,
				posY = 0,
				posX = -396.56,
				text = var_0_0[6],
				ui = {
					path = "OverlayCamera/Overlay/UIMain/EquipmentTransformUI(Clone)/Adapt/MaterialModule1/Item"
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = 1,
				mode = 1,
				posY = -215.3,
				posX = 337.29,
				text = var_0_0[7],
				ui = {
					path = "OverlayCamera/Overlay/UIMain/EquipmentTransformUI(Clone)/Adapt/ComposePanel"
				}
			}
		}
	}
}
