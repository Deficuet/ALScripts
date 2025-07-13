local var_0_0 = {
	"ホーネットに勝つなんて、さすが私が見込んだだけあるわ！",
	"早く母港に戻って演習成功の報酬を手に入れましょ！",
	"ボタンをタップしてメイン画面に戻って"
}

return {
	id = "S029",
	events = {
		{
			alpha = 0.17,
			style = {
				dir = -1,
				mode = 2,
				posY = 0,
				posX = 0,
				text = var_0_0[1]
			}
		},
		{
			style = {
				dir = -1,
				mode = 2,
				posY = 0,
				posX = 0,
				text = var_0_0[2]
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/top/top_chapter/back_button"
			}
		},
		{
			style = {
				dir = -1,
				mode = 2,
				posY = 0,
				posX = 0,
				text = var_0_0[3]
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/top/top_chapter/back_button"
			}
		}
	}
}
