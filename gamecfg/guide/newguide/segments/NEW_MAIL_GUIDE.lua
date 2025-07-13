return {
	id = "NEW_MAIL_GUIDE",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "メールボックスがいっぱいです。新しいメールを受け取れませんので、メールの整理をお願いします",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 0,
				posX = 61.36,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/MailTipLayersMsgBoxUI(Clone)/adapt/window/button_container/btn_ok",
				pathIndex = -1
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "ここをタップするとメールを一括管理できるわ",
				mode = 1,
				dir = 1,
				char = "char",
				posY = -200,
				posX = -230,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/MailUI(Clone)/adapt/main/content/left/left_content/bottom/btn_managerMail",
				pathIndex = -1
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "メールを絞り込むことで、下記アイテムが含まれるメールのみを表示させられるわ",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 230,
				posX = -170,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/MailMgrMsgboxUI(Clone)/window/frame/toggle_group/filter",
				pathIndex = -1,
				fingerPos = {
					posY = -58,
					posX = -151
				},
				triggerType = {
					2,
					true
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "アイテムを選択しないと、表示メールをうまく絞り込めないわ！まずは【資金】をタップして！",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 180,
				posX = -170,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/MailMgrMsgboxUI(Clone)/window/frame/toggle_group/filter/content",
				pathIndex = 1,
				fingerPos = {
					posY = -42,
					posX = 0
				},
				triggerType = {
					2,
					true
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "それから【燃料】もタップよ！これで【資金】と【燃料】が添付されたメールだけを表示できるわ",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 180,
				posX = -170,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/MailMgrMsgboxUI(Clone)/window/frame/toggle_group/filter/content",
				pathIndex = 2,
				fingerPos = {
					posY = -42,
					posX = 0
				},
				triggerType = {
					2,
					true
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "ボタンをタップするとメールを一括操作できるわ。「一括受取」ではメールを全て受け取り、添付アイテムの資金と燃料を貯蔵庫に保管できるぞ！「一括削除」はすでに添付アイテムを受け取ったメールを全て削除できるわ！",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 80,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/MailMgrMsgboxUI(Clone)/window/button_container",
						pathIndex = -1
					}
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "タップすると、受け取るアイテムの一覧が表示されるわ。やってみて！",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 80,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/MailMgrMsgboxUI(Clone)/window/button_container/btn_get",
				pathIndex = -1
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "確定をタップすると、一括で添付アイテムを受け取れるわ！一度確認画面を閉じてメールを実際に整理してみて！",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 340,
				posX = -120,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/MailConfirmationMsgboxUI(Clone)/adapt/window/top/btnBack",
				pathIndex = -1,
				fingerPos = {
					posY = -30,
					posX = 42
				}
			}
		}
	}
}
