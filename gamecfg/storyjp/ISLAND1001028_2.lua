return {
	id = "ISLAND1001028_2",
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
			characterId = 0,
			say = "――餌を持ってきたよ！これぐらいで足りる？",
			animation = "hi",
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
			animation = "amaze",
			characterId = 100500,
			subName = "牧場管理人",
			say = "わあ、指揮官！こんなにあれば十分だよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――次は餌が尽きる前に、ホメリックへ連絡しておいて",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100500,
			subName = "牧場管理人",
			say = "わかったわかった～。指揮官、せっかくだから餌やりもしてみる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧場管理人",
			characterId = 100500,
			say = "お腹いっぱいになったら、卵を産んでくれるかも",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――卵か……やってみよう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
