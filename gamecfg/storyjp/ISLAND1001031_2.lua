return {
	id = "ISLAND1001031_2",
	mode = 10,
	map = {
		{
			3120100,
			10090020
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
			say = "――明石、何か用？",
			face2Face = {
				{
					0,
					3120100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 3120100,
			say = "指揮官、こっちにゃ！飛行装置を直す方法を見つけたにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――飛行装置？まさか墜落したあの機体のこと？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "その通りにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "ただ、墜落した時に散らばった破片を集めてもらう必要があるにゃ",
			characterId = 3120100,
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――どうして急に飛行装置を直そうと？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "ふふん……指揮官、最近港で噂になってる宝の島は知ってるにゃ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "宝の島？パトリックやステファンから聞いたけど……それと何の関係が？",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――まさか、明石もその宝とやらに興味が？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 3120100,
			say = "ムフフ、もちろん興味あるにゃ〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "でも……指揮官は最近明石にいっぱい贔屓してくれるから、明石だけ得するなんて恩知らずのことはできないにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "だからこのチャンス、指揮官に譲るにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――チャンス？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 3120100,
			say = "宝の島の周りは怪しい霧や乱流だらけで、船で近づいてもグルグルと迷ってばかりで島にたどり着けないにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "でも！明石にはちゃんと手があるにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――……まさか空から行くつもりか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 3120100,
			say = "さすが指揮官、察しがいいにゃ。その通り、飛んで行くのにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――あの墜落してボロボロになった飛行装置で？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "もちろんにゃ。だから散らばった部品を全部集めて、明石がバッチリ直してみせるにゃ！",
			characterId = 3120100,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――本当に大丈夫か…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			animation = "amaze",
			say = "うにゃ！指揮官、どうして明石の腕を疑うにゃ！霧と乱流を突破するには空からしかないにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "なんか怪しい……",
					flag = 1
				},
				{
					content = "宝か……",
					flag = 2
				}
			}
		},
		{
			characterId = 0,
			optionFlag = 1,
			animation = "nod",
			say = "――とはいえ、今は開発エリアも軌道に乗ってきたし、成長につながる新しい突破口を探すのも悪くない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			optionFlag = 2,
			say = "――離島は着実に発展してるが、もし追加の起業資金が入れば……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "（借金の重圧はまだあるが、進むべき方向ははっきりしているし、着実に前進できている……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――わかった",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 3120100,
			say = "ムフフフ、指揮官ならそう言ってくれると思ってたにゃ！だからもう準備しておいたにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "あとは肝心の部品だけ…多分風の原野、朝露農場、港の辺りにあるはずにゃ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "部品を見つけたら、明石を呼べばいいにゃ〜。明石が何とかしてみせるにゃ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
