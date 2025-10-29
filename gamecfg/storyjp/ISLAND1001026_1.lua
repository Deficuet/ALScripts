return {
	id = "ISLAND1001026_1",
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
			characterId = 0,
			animation = "hi",
			say = "――これでよし！",
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
			say = "それで指揮官……さっきの種で、何か気づいたことはありませんか？",
			characterId = 100400,
			subName = "畑管理人",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "あったよ",
					flag = 1
				},
				{
					content = "えっと……",
					flag = 2
				}
			}
		},
		{
			characterId = 0,
			optionFlag = 1,
			say = "――形も大きさも、普通の小麦とはっきり違う……不思議だな",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			optionFlag = 2,
			say = "――言われてみれば違うような気が……たとえば……たとえば……",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100400,
			optionFlag = 2,
			subName = "畑管理人",
			say = "じーっ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			optionFlag = 2,
			say = "――……こっちのが大きい！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100400,
			subName = "畑管理人",
			say = "お気づきになりましたか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "島の環境はやっぱり恵まれていて、ここで栽培した作物は質がとてもいいです……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "図鑑と照らし合わせても……多くの作物に見ればわかる変化が出ています",
			characterId = 100400,
			subName = "畑管理人",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――聞いてる限り……この畑のポテンシャルはまだまだありそうだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "はい。少し時間をかければ、この畑だけで開発エリア全体の食糧を賄えるようになるでしょう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――でも……栽培の規模を大きくするなら……",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――島内の供給を賄いつつ、外への出荷も増やす…というのはどうだ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100400,
			subName = "畑管理人",
			say = "栽培の規模を大きくすれば……収穫量と成長サイクルは確かに強みになります……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "ですが同時に、土壌の養分を大きく消耗させてしまうということでもあります",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "今の輪作や基本的な堆肥だけじゃ……消耗がいずれ…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "この畑は表面上は問題なさそうですが、土壌深部の有機質が既に減少し始めています",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 100400,
			subName = "畑管理人",
			say = "補給を怠れば、次のシーズンには収穫量も質も明らかに落ちます……長期的には持ちません",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――保肥力か……確かに……なら……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――畑から奪うだけじゃなく、きちんと返したらどうだ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "あ。そうですね…！さすが指揮官です！",
			characterId = 100400,
			subName = "畑管理人",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――例えば……エコ肥料を試してみるとか？ちょうど隣に牧場があるし",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100400,
			subName = "畑管理人",
			say = "そうですね。安全かつ効率的なエコ肥料を使えれば……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "さらに畑の状態に応じて、化学肥料を適宜に組み合わせると……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "これなら土壌の養分と作物の質が両方維持できそうです！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――よし！となると解決のカギは牧場にあるか",
			characterId = 0,
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "もっとも……土壌の養分は何とかできても……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "畑管理人",
			characterId = 100400,
			say = "指揮官の望む規模となると、私一人では……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――人手の問題だな？大丈夫。ちゃんと助っ人を用意するさ",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――さて、牧場の「宝物」を見に行くとしよう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
