return {
	id = "ISLANDSIDE01304",
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
			characterId = 0,
			say = "――パトリック、今ラベンダー用の肥料を注文したら、大体いつ届く？",
			animation = "talk",
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
			animation = "talk",
			characterId = 100200,
			subName = "依頼管理人",
			say = "ラベンダー用の肥料ね……今調べるよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "うっ、これは……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "ラベンダー用の肥料がちょうど切れてて、一か月以上待たないといけなさそう……",
			characterId = 100200,
			subName = "依頼管理人",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――それだと間に合わないな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "でも、急ぎなら……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "idea",
			characterId = 100200,
			subName = "依頼管理人",
			say = "肥料が見つかる場所を知ってるよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "貨物船埠頭には、受け取られなくて権利が放棄された荷物がたくさんあるから、その中に肥料もあるかも！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――最後のチャンスか……今すぐ行くよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100200,
			subName = "依頼管理人",
			say = "もし見つけたら、一度ここに戻ってきてね！記録しないといけないから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
