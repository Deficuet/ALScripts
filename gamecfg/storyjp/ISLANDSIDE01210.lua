return {
	id = "ISLANDSIDE01210",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			animation = "think",
			characterId = 100200,
			subName = "依頼管理人",
			say = "うっ……注文の数の確認ね…",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "ちょっと待ってね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "記憶違いじゃなければ、今回は以前より少ないはず",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "idea",
			characterId = 100200,
			subName = "依頼管理人",
			say = "あと別件だけど、ルシタニアが以前注文した防虫剤も届いてるから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "代わりに届けてきてくれないかな？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
