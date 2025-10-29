return {
	id = "ISLANDDAILYTASK5",
	mode = 10,
	map = {
		{
			100500,
			10010003
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
			animation = "nod",
			characterId = 100500,
			subName = "牧場管理人",
			say = "わぁ！指揮官だ！動物たちにエサを持ってきてくれたの？",
			face2Face = {
				{
					0,
					100500
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧場管理人",
			characterId = 100500,
			say = "違っても大丈夫！指揮官がくれたものなら、なんでも大好きだから〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧場管理人",
			characterId = 100500,
			say = "動物たちも一緒！指揮官がいてくれたら、牧場はもっとにぎやかになるもんね〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
