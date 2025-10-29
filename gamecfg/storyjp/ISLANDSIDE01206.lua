return {
	id = "ISLANDSIDE01206",
	mode = 10,
	map = {
		{
			101100,
			10050002
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
			animation = "curious",
			characterId = 101100,
			subName = "果樹園管理人",
			say = "さすがです！肥料が均等に撒かれていますね",
			face2Face = {
				{
					0,
					101100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果樹園管理人",
			characterId = 101100,
			say = "植物の育て方に心得えがあるようですね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101100,
			subName = "果樹園管理人",
			say = "次は、えっと……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果樹園管理人",
			characterId = 101100,
			say = "土に肥料を撒いたので、みかんの種を少し持ってきてくれませんか？ちょうどここに植えますので！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――分かった",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
