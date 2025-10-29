return {
	id = "ISLANDSIDE01011",
	mode = 10,
	map = {
		{
			101200,
			10090008
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
			animation = "sad",
			characterId = 101200,
			subName = "カフェ店員",
			say = "えっ、逆効果になっちゃったの……？",
			face2Face = {
				{
					0,
					101200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "ひとまずレシピを見直してみるね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "たぶん配分が悪かったのかも……あるいは……",
			characterId = 101200,
			subName = "カフェ店員",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "うん、糸口が見つかった気がする――材料を選びなおしてみるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "そうなると、新しいレシピには別の材料が必要になるね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "指揮官、新鮮な卵を探してきてもらえる？",
			characterId = 101200,
			subName = "カフェ店員",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "手軽でおいしい、すぐにエネルギーを補給できるメレンゲを作りたいんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――わかった探してみる",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
