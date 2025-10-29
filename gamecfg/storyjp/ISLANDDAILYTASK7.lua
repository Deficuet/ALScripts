return {
	id = "ISLANDDAILYTASK7",
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
			animation = "doubt",
			characterId = 100200,
			subName = "依頼管理人",
			say = "ん？指揮官、もうお願いしたものを揃えてくれたの？",
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
			say = "ちょっと確認するね……数も問題なし！仕事が早～い",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "指揮官がいてくれて助かったよ。私一人ではどうにもならなかったから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100200,
			subName = "依頼管理人",
			say = "本当にお疲れさま〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
