return {
	id = "ISLANDDAILYTASK10",
	mode = 10,
	map = {
		{
			100800,
			10060002
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
			characterId = 100800,
			subName = "商店街管理人",
			say = "指揮官のお仕事は、やはりいつも通り早いですね……",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "商店街管理人",
			characterId = 100800,
			say = "まさに商店街に不足していたものです、数量もぴったりです",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "商店街管理人",
			say = "本当に助かりました。今の商店街の繁栄は指揮官の支援あってこそです",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
