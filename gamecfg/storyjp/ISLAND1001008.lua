return {
	id = "ISLAND1001008",
	mode = 10,
	map = {
		{
			100600,
			10040032
		},
		{
			100700,
			10040031
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
			say = "――これで大丈夫かな？",
			animation = "hi",
			face2Face = {
				{
					0,
					100600
				}
			},
			turnto = {
				{
					100700,
					0
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "うん！やっと修理できた！",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "rest",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "本当に骨が折れたね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "これで……夜までには荷物を届けられそうですか？",
			characterId = 100700,
			subName = "森の管理人",
			animation = "rest",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "うんうん、絶対大丈夫！これも指揮官が来てくれたおかげだね！",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "そうだ、お礼に……あ、あった！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100600,
			subName = "鉱山管理人",
			say = "これ、採掘中に見つけたものなんだけどあげる！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "すごく綺麗だ",
					flag = 1
				}
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "でしょでしょ！キラキラで、すっごく綺麗！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "そ、それならこれも……",
			characterId = 100700,
			subName = "森の管理人",
			animation = "shy",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "森の管理人",
			characterId = 100700,
			say = "私が……加工した木材で、この木目……星みたいに見えませんか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――本当だ。わざわざありがとう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "バスが来ました。あ……でももう積荷でいっぱいみたい……",
			characterId = 100700,
			subName = "森の管理人",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "急ぎの貨物が山積みになってたし仕方ないね",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "鉱山管理人",
			characterId = 100600,
			say = "指揮官、急ぎじゃなければ次の便でもいいんじゃない？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "――貨物は自分が港まで運ぶよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ちょうど、このエリアの稼働状況が気になってたところだし",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "じゃあお願い！これが貨物リストだから港に着いたらパトリックに渡してね！",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100600,
			subName = "鉱山管理人",
			say = "きっと港で見張ってると思うから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "パトリック？わかった、任せて",
					flag = 1
				}
			}
		},
		{
			say = "指揮官さん、お気をつけて",
			characterId = 100700,
			subName = "森の管理人",
			animation = "bye",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "じゃあね指揮官！今度はトロッコに乗ってみてね！",
			characterId = 100600,
			subName = "鉱山管理人",
			animation = "bye",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
