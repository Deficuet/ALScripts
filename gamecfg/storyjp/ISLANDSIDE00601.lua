return {
	id = "ISLANDSIDE00601",
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
			say = "――何かあったの？",
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
			animation = "weep",
			characterId = 100500,
			subName = "牧場管理人",
			say = "指揮官、大変！あたしのメェメーたちがいなくなっちゃった！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――いなくなったって……それはいつ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧場管理人",
			characterId = 100500,
			say = "つ、ついさっきのこと！いつものようにエサを用意しに行って……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "それで戻ってきたら……羊が一匹もいないの！全部いなくなっちゃったの！",
			characterId = 100500,
			subName = "牧場管理人",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧場管理人",
			characterId = 100500,
			say = "壊れた柵だけが残ってて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――落ち着いて。少し遠くまで行っただけかもしれない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――いつもはどこへ連れて行ってるの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100500,
			subName = "牧場管理人",
			say = "牧場横の丘だよ！メェメーたちはそこに行くのが大好きなの！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――わかった、一緒に行ってみよう。何か手がかりが見つかるかもしれない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
