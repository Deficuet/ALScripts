return {
	id = "ISLANDSIDE00302",
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
			characterId = 0,
			say = "――ブレーメン、大変だ",
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
			animation = "talk",
			characterId = 101200,
			subName = "カフェ店員",
			say = "指揮官……基地の業務で何かトラブル？落ち着いて話して",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――基地の中央サーバーがダウンした。反応しないし……焦げた匂いまでする",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101200,
			subName = "カフェ店員",
			say = "焦げた匂い……そう、とうとうサーバーが限界に……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "急いで修理しないとね。このままじゃ……基地の研究、資材の生産、通信に大損害が起きちゃう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――修理……って、どうやって直すんだ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "カフェ店員",
			say = "大丈夫だよ。前に壊れちゃったときはジョンが直してくれたんだ。サーバーのコンデンサーユニットが完全に焼き切れていたのが原因だったとか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "最近は研究計算の負荷も増えて、稼働時間も長かったし……多分同じトラブルだと思う",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "ジョンに聞いてきたけど、完全に直すには電力システムのコア部品を総取り替えするしかないんだけど……",
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
			say = "重要なパーツを作るのに高純度のアルミが必要なの。しかもかなりの量が",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 101200,
			subName = "カフェ店員",
			say = "例え鉱山でも……すぐにそんな量を揃えるのは難しいと思う……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――アルミ鉱石については任せてくれ。鉱山に行って何とかしてみる",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "カフェ店員",
			characterId = 101200,
			say = "指揮官、くれぐれも気をつけてね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "カフェ店員",
			say = "集め終わったらそのまま鉱山でジョンを探して。修理用の工具と作業場を用意してくれるはず",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
