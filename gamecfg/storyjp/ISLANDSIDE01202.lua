return {
	id = "ISLANDSIDE01202",
	mode = 10,
	map = {
		{
			100400,
			10010040
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
			characterId = 100400,
			subName = "畑管理人",
			say = "ルシタニアの剪定バサミが壊れたから、私のを借りに来たって？",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "いいですけど……この前、買い替えるように言ったのに……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "そんな暇もないくらい、あの子は最近忙しいみたいですね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "畑管理人",
			say = "どうぞ。刃物ですから取り扱いは十分気をつけてください",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――分かった、ありがとう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "それと……使い終わったら、返してくださいね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――安心して、ちゃんと返すように伝えておくから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
