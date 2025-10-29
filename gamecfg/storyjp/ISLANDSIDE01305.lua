return {
	id = "ISLANDSIDE01305",
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
			say = "――倉庫はぐちゃぐちゃだったけど、なんとか肥料は見つけられた",
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
			animation = "clap",
			characterId = 100200,
			subName = "依頼管理人",
			say = "良かった！今手続きするね～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――助かったよ、ありがとう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "どういたしまして。指揮官の助けになれただけで十分嬉しいから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			withoutIcon = true,
			withoutName = true,
			say = "ラベンダー用の肥料をラコニアに渡そう。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
