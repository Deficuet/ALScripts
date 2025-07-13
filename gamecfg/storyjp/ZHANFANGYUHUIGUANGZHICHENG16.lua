return {
	id = "ZHANFANGYUHUIGUANGZHICHENG16",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			say = "光が消え、目の前に現れたのは――夕日の砂浜だ。",
			bgm = "theme-aostelab",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（夕日……砂浜？マルティリウムに戻ったんじゃないのか？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "アルザス、目標を発見！指揮官と「ミスD」の無事を確認！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 803020,
			say = "心配したぞ。執剣者。今回も一足遅かったな",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "そうだそうだ！なんで助手の転移だけ毎回トラブルが起きるんだ！余計な手間かけさせやがって！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			},
			options = {
				{
					content = "ここはどこだ？",
					flag = 1
				},
				{
					content = "マルティリウムじゃない？",
					flag = 2
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901070,
			say = "モガドールたちにもわからないよ～。着いたらここだったって感じ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901070,
			say = "ちょっと広いサンゴ礁の島以外は何もなさそう～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "ねえアルザス？ここはアルザスのイメージを具現化したんじゃないの？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "アルザスの記憶領域にこんな島は存在しないし、「島」をイメージすらしてなかった…！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "じゃあなんでみんなここに？「ミスD」が間違えたとか？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "あたしが間違えるわけない！ほら、エリザベスも言ってやれ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "「ミスD」は別に間違えてないわ。みんなのいる座標は確かに「マルティリウム」の中よ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_zhedie_7",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "それもわたしの「列車」の6号車を変換してできた第二の「輪」、「死」の概念を具現化した鏡面海域ね",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――「エリザベス」？通信がまだつながっているなんて…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "その口ぶりだと、今まで散々な目に遭ってきたようね",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "大丈夫よ。わたしがバックアップしている以上、そんなひどい思いはさせないわ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（審判廷の通信機のおかげもあるが…とにかくこれで予想外の状況にもうまく対処できそうだ）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "ありがとう。助かるよ",
					flag = 1
				},
				{
					content = "「META」になってもさすがは陛下！",
					flag = 2
				}
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "ふん、ありがたく思いなさい",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "でも結局ここって本当にマルティリウムなの？外から見た感じと全然違うよ？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "ほら、転送される前だとこう…第一の「輪」と同じようにキラキラピカピカしてたし…",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "外は外、中身は中身！あの列車も車両ごとに独立した空間だから、外から見た雰囲気と違っててもおかしくない！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "あんたたちも列車に乗ってたのに、どうしてそんなこともわからないの！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 901050,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "だってここの雰囲気は全然違うじゃん！列車は車両の内装や空間が違っても「列車」だし！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "…………むむむ。「死」の概念を具現化してることは変わらないのに、確かにこうも違ってくるはずがないか…",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "わかった！多分入ってきた人が多すぎるから「死」の概念が混ざったんだ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "ここの「死」はアルザスがイメージしたものじゃなく、もっと多い人数の、誰も知らない奴らの「死」の具現化した場所なのかも！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "きっとそうだ！だからマルティリウムとこんなに違うんだ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（つまりここは元々「クジラ」が逃げ込んだ空間の本質に近いってこと？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "待て待て待て！見た目だけじゃない！ここには「時間」もあるよ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "ここの時間が流れてるんだ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901070,
			say = "……時間が流れる？時間って流れ続けるものじゃないの？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "バカ！あたしたちの時間じゃなく、この空間の時間だよ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "マルティリウムを具現化した時、エリザベスは時間のことは何もいじってなかった！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "だからあれは単なる基盤、つまり静止した世界だった！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "んで、ここ！今！この世界には「時間」の概念が出てきた！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "「死」の概念に時間が付与された！つまり「静止した死の状態」ではなく、「流動的な死」になっている！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901070,
			say = "…死が流動的？それってここの空間自体が時間経過で変わるってことぉ？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "そうそう！時間経過で空間が変わる！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "だから何が起きるか分からない！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 803020,
			say = "だが「死」は「死」だ。どんなことが起きても「死」につながるはず……",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "それも合っている！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（ってことは「走馬灯」か？この世界は誰か、もしくは世界そのものの「死んでゆく」記録だってことか？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			say = "砂浜に海。小丘にある南国の植物。どこにでもあるような島に見える。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			say = "…が、遠方にある建物が違和感を抱かせた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（間違いない。「リアリティレンズ」で見たものと多少違うが…あのシルエット、そして位置……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（世界αの「サモス海洋魚類研究所」…！）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（やっぱりここは世界αの誰か、もしくはこの空間の「死」の記録なのか？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901060,
			say = "な、なんだか怖い……",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901060,
			say = "こんなに穏やかな風景なのに「死」の具現化だなんて……",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "別にそこまで心配しなくていいわよ。「死」の具現化とはいえ、「死」はあくまでこの空間のルール、そして移動・離脱の手段になっただけ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_zhedie_7",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "概念そのものに飲み込まれなければ、別にここで「死んだ」ところで本当に死ぬわけじゃないわ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_zhedie_7",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "それと、もう一度チェックしたけど…ここまでやったのに、折り畳まれた空間はまだ完全には引っ張り出されていないわ",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "これ以上追うなら、もういっそ「死」の概念を利用して、向こうの空間に行くのも手ね",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "つ、つまり本当に「死」の概念に触れるってこと？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "アルザス、できれば今まで通り「列車」の概念で行きたく…！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "あたしがいるから「死」に触れても平気…と言いたいけど、もっといい案がある！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "今！ここで！クジラをとっ捕まえることだ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "そのことだけど…クジラはどこにも見当たらないよ？もう逃げたんじゃないの？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "逃げてない逃げてない！あたしには分かる！この近くで隠れているだけだ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "具体的な位置は……海か？！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "そうだ！きっとここの海に違いない！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "ということで潜って探そう！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――待って「ミスD」、この島、そして向こうにある建物に見覚えはないか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			say = "「ミスD」に海洋魚類研究所の方向を指差した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（この子が「アビータ」なら、オースタ博士の研究所を知っているはず…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "んー。海洋魚類研究所？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "懐かしいね。あたしんちだった？あんたのうちだった？うちのうちだった？かも？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――…かも？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "あたしもわからないもん！単にそんな気がするだけだから！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "あたしの大事な記憶はクジラにたくさん保存されてるよ！だからクジラを取り返さないと思い出せないの！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "って、助手はまさかあそこにいた時のことを覚えてるのか？！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――いや、「思い出す」というのは語弊があるな。すまないが先にそちらを調べさせてもらってもいいか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901070,
			say = "サモス島のことぉ？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――ああ。バミューダ海域のサモス島…いや、「未来」のサモス島かもしれないからな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_zhedie_7",
			paintingNoise = true,
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "……世界α？ここは世界αの情報で構成されてるってこと？！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_zhedie_7",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "……まあいっか。ここは助手のしたいようにしていいよ！まずは海洋研究所、それからクジラ狩りだ！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		}
	}
}
