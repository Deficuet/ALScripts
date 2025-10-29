return {
	id = "ISLANDDAILYTASK13",
	mode = 10,
	map = {
		{
			101400,
			10050003
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			animation = "talk",
			characterId = 101400,
			subName = "農園管理人",
			say = "ありがとう指揮官……ミツバチたちもきっと喜んでるよ",
			face2Face = {
				{
					0,
					101400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "……それから……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shy",
			characterId = 101400,
			subName = "農園管理人",
			say = "ラコニアも嬉しいよ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
