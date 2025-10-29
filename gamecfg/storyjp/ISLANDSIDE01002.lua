return {
	id = "ISLANDSIDE01002",
	mode = 10,
	map = {
		{
			100100,
			10010041
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
			animation = "doubt",
			characterId = 100100,
			subName = "製粉所管理人",
			say = "指揮官は何を相談したいの…？パトリックを応援してあげたい…？",
			face2Face = {
				{
					0,
					100100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "製粉所管理人",
			characterId = 100100,
			say = "うーん……正直、指揮官が何をしてもパトリックは喜ぶと思うけど……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "でも、具体的に言うなら……その……",
			characterId = 100100,
			subName = "製粉所管理人",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "製粉所管理人",
			characterId = 100100,
			say = "……Zzzz……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――オリンピック？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "製粉所管理人",
			characterId = 100100,
			say = "Zzzzzz……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――……立ったまま寝たのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――仕方ない、ステファンに聞いてみるか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――彼女ならパトリックと仕事で関わることも多いし、何かアイデアがあるかもしれない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
