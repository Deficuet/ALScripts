return {
	id = "ISLANDDAILYTASK15",
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
			animation = "hi",
			characterId = 100200,
			subName = "依頼管理人",
			say = "あっ、指揮官、来てくれたのね〜",
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
			say = "そこにあるのがみんなへの物資よ。本当は私が届けに行くべきなんだけど……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――今は手が離せないんだろう？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "依頼管理人",
			say = "そうなの…新しい貨物が届いたばかりで、数を確認してるところだから……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "これが終わってから届けるとなると……遅くなっちゃうから困ってて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――みんなに届けてくるよ。任せて",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "依頼管理人",
			characterId = 100200,
			say = "指揮官なら助けてくれると思ってたよ〜。中には指揮官の分もあるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100200,
			subName = "依頼管理人",
			say = "届け終わったら開けてね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
