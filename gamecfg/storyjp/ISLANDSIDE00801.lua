return {
	id = "ISLANDSIDE00801",
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
			say = "――パトリック、何を書いてるの？",
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
			say = "あっ！指揮官、ちょうどいいタイミングに",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "ちょうど指揮官にお願いしたい、大～事な任務があって",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――当ててみようか。島の依頼に関することだろ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100200,
			subName = "依頼管理人",
			say = "えっ！どうしてわかったの？指揮官ってやっぱりすごい！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――その手元のメモを見ればだいたいわかるさ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――で、具体的にどこへ行って何をすればいいの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100200,
			subName = "依頼管理人",
			say = "ステファンのところに行ってほしいの。さっきすごい勢いで私のところに来たから、多分急ぎの用事なんだと思う",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "今ちょうど人手が足りなくて困ってた時に指揮官が現れたから、渡りに船だよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "依頼管理人",
			say = "この緊急依頼を代わりにお願い",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
