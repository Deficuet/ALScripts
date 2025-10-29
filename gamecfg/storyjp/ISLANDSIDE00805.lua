return {
	id = "ISLANDSIDE00805",
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
			animation = "hi",
			say = "――ステファンの依頼を終わらせてきたよ",
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
			say = "おかえり〜。全部解決したの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ああ。途中で急に追加依頼があって、原野を二往復する羽目になったけどな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100200,
			subName = "依頼管理人",
			say = "さすが指揮官、完璧にこなすなんてすごい！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ああそうだ、ステファンが報酬は倍にするって言ってた",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "note",
			characterId = 100200,
			subName = "依頼管理人",
			say = "心配無用だよ！ちゃんと記録してあるよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "依頼完了、今すぐ報酬を渡すね〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
