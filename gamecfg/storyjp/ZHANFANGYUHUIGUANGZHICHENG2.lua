return {
	id = "ZHANFANGYUHUIGUANGZHICHENG2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_590",
			hidePaintObj = true,
			say = "列車が空にかかった不可視の軌道に沿ってしばらく走ると――",
			bgm = "theme-richelieu",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_590",
			hidePaintObj = true,
			say = "スカパ・フロー海域周辺にある鏡面海域に到着した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			stopbgm = true,
			mode = 1,
			asideType = 3,
			blackBg = true,
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			},
			sequence = {
				{
					"ロイヤル所属　スカパ・フロー泊地",
					1
				},
				{
					"鏡面海域「キャメロット」　転送装置「アヴァロンの扉」",
					2
				}
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "列車の扉を開けると、華やかなる金色の光が視界に降り注いだ。",
			bgm = "theme-camelot",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "時間は早朝のはずなのに、この鏡面海域の風景は白昼のようだ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "私の「アヴァロン」へようこそ、下僕",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「枝」の跳躍も行えるこの「扉」はすごいでしょ？",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "「アヴァロンの扉」――ロイヤルが掌握した鏡面海域にある人工特異点を改修して作った施設。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "コンパイラーを倒した戦いのあと、エリザベスから送られた資料と通信でその存在を把握してはいたが…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "あくまで情報でのことなので、実物をこの目で見ると迫力が全然違うな。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9705040,
			nameColor = "#FFC960",
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			actorName = "？？？",
			side = 2,
			say = "ふふん、狙い通りの反応ね♪",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――狙い通り…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_camelot_15",
			actorName = "？？？",
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "そうよ。こっちの「エリザベス」はあんたが初めて来るからって、見せびらかそうとして照明をこんなに明るくしたのよ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "あんたはなにを言ってるのよ！",
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
			bgName = "bg_camelot_15",
			actorName = "？？？",
			dir = 1,
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "なにって事実でしょ？",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "コホン！……照明を明るくしたのは今回の作戦を重要なものとして見てもらうためよ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "それより下僕、こっちの「私」に会うのは初めてよね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "こいつは「META」の「クイーン・エリザベス」",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "今はとある組織を率いて、私の援軍としてここに滞在しているわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「ミスD」も、下僕が乗ってきた列車もこいつが運んできたの",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "ごきげんよう…「指揮官」。色々観察させてもらったわ",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――あの列車を運転していたのもあなたが？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "そうよ。「クイーンズライト号」は私にしか運転できないから、あんたをここに連れ出すには私自ら出るしかなかったってわけ",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "それで、私の正体については「エリザベス」が説明した通りよ。本当はちゃんとした自己紹介がしたかったけど、今はそれどころじゃないわね",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "で、観察した結果だけど…あんたも「ミスD」も似たような状態ね",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "一言で言えば…「不完全」ね",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――「不完全」？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "それじゃあ説明にならないわよ…さあ下僕、ここに座りなさい",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "リシュリューから、このアヴァロンで全部説明を聞いてから作戦に参加するか決めていいって聞いてるわよね？",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "これから私が教えるのはロイヤルの最高機密よ。もし下僕が参加しないことにしたとしても、決して上層部に探られないように注意しなさい",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――もちろんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "ならいいわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "コホン、まずは一度あんたと共有してきた状況を整理するわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "まず、私たちが「セイレーン」と呼んでいる敵の正体は、どうやら「未来」の人々によって作られた「アンチエックス」という存在みたい",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「人工海上作戦機構・自己進化型知能 対X兵器」、通称「Anti-X(アンチエックス)」だけど",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「X(エックス)」についてはまだ誰も知らないわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "知っているのは「エックス」は実在する脅威であり、現状アンチエックスも「余燼」も根本的な対策法を持ち合わせていない――これだけね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "次、私たちのいる「枝」を含めて、セイレーンは色々な「枝」で「エックス」に対抗するための実験を行っているわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "セイレーンは実験場を好き勝手に操れるだけじゃなく…処分する技術も持っていて、好きな時にこの世界を滅ぼすことだってできる",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "いくら「エックス」のことがあるとはいえ、セイレーンは私たちにとって倒すべき敵であることに変わりない",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "でもここで問題よ。仮に私たちがセイレーンを倒しても、その後いずれ「エックス」が襲ってくる",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "その時に対処法を知らなければ、結局セイレーンに滅ぼされるのと変わらないわけ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "だから作戦を考えたわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "下僕も「ミスD」がセイレーンだって気づいているわよね？",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「META」の私は、「ミスD」がアンチエックスの上位端末なんじゃないかって予想しているわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "あの子は今「クジラ」という巨大な滑空艤装を失っていて、そのせいでリソースも記憶も欠けている状態らしいの",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "もし私たちがあの子を「完全」な状態に戻すことができれば…",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "アンチエックスたちが持っている「エックス」の資料、作戦記録、そして「エックス」の侵攻を阻止する方法が見つかるかもしれない",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "そういうわけよ。私も「ミスD」を回収してからというもの、戦力を派遣して「クジラ」を捕らえようとしたけど…",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "残念なことにまだ成功してないわ。この前はあと一歩のところだったんだけどね",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "そしたらこの前、「ミスD」がまた「クジラ」の痕跡を捉えたから、こうして「クジラ狩り」を準備しているのよ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「ミスD」は時々「クジラ」の行動の痕跡を捉えているからね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "次にどうして下僕に参加してほしいのかを説明するわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「ミスD」がキャッチしたクジラがいる空間には、さっき「空間衝壊現象」が起きたらしいわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "私たちは「クジラ」はそれによって惹きつけられたと思ってるわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "この手の「空間衝壊現象」は戦いがあった場所で起きることが多いから、敵が混乱している間に漁夫の利を得ることで、成功する可能性が格段に上がるわ。",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "あんたの指揮能力があればそれもできるでしょ？それともう一つ。「空間衝壊現象」はメンタルキューブ実験でもよく起きるの",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "あんたの唯一無二のキューブ適性があれば、作戦に万が一のことがあっても対応できるわ",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "あと、「ミスD」からもあんたに参加してほしいってすごく騒いでたわ",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "あの子は見た目も性格も子供そのものだけど……腐ってもセイレーンだから「勘」は圧倒的にこっちよりいいわね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "下僕が「リアリティレンズ」で知った言葉について聞いてもきちんと反応してくれるわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "まあ、情報らしい情報は得られていないけど…",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「未来」の出来事が「余燼」とアンチエックスの誕生に関係しているのは確かね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "ちなみにアンチエックスや艦船が誕生した「未来」のことを、セイレーンたちは「世界α」と呼んでいるわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "もし「世界α」の情報をもっと手に入れられれば、セイレーンと「エックス」のこともきっと……",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "そんなに睨まれても、別に私はその「世界α」出身じゃないわよ",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "「世界α」出身と思わしき子たちはみんな、彼女たちが元いた「枝」のことを口にしないの",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "もしくは記憶が一部欠落していて、口にしたくてもうまく言葉にできないのね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "この前「扉」を使って連れてきた「META」のレナウンとレパルスも同じね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "同じ出来事で二人の記憶に矛盾があっても、私が注意するまでお互い気づいてもいなかったみたい",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "こんな感じじゃ「世界α」を調査しようにも無理な話ね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "でも下僕は違うわ。「ミスD」は明らかにあんたに何かを教えようとしているの",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "もしうまく一緒に「クジラ」を回収できれば、あんたの調査も大きく進むに違いないわ",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "二人の「エリザベス」からもたらされた情報は確かに衝撃的だ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（リアリティレンズで見た「世界α」、確かに調査するにしても自分以上の適任者はいない…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（アンジュ、オースタ、それにグアムたちがシミュレーションで出会ったギンギツネも、全員「世界α」の関係者である可能性が高い…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（それを言うなら「自分」もだ。記録から再現された世界だったとしても、明らかに自分を知っている様子だった――）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（自分もほかの「META」と同じく、記憶が欠落しているとしたら…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			oldPhoto = true,
			side = 2,
			bgName = "star_level_bg_505",
			actorName = "リプレイヤー",
			bgm = "theme-arbitrator-tower",
			actor = 900308,
			nameColor = "#C3ABFF",
			hidePaintObj = true,
			say = "「どうやらリュウコツの『謎』には気づいたようだ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = false,
				alpha = {
					1,
					0
				}
			}
		},
		{
			actor = 900308,
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			oldPhoto = true,
			actorName = "リプレイヤー",
			nameColor = "#C3ABFF",
			say = "「かつての『私』が残した記録との整合性は1％未満だが、この波長は間違いなく『君』だ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900308,
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			oldPhoto = true,
			actorName = "リプレイヤー",
			nameColor = "#C3ABFF",
			say = "「この記録の再生に成功したことが、なにより『君』である証拠だ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900308,
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			oldPhoto = true,
			actorName = "リプレイヤー",
			nameColor = "#C3ABFF",
			say = "「そして、『私』が最後に打ち込んだ楔がうまく機能していることになるな」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900308,
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			oldPhoto = true,
			actorName = "リプレイヤー",
			nameColor = "#C3ABFF",
			say = "「分かっている。『君』がいつ、どこにいようと、どんな形でいようと」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900308,
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			oldPhoto = true,
			actorName = "リプレイヤー",
			nameColor = "#C3ABFF",
			say = "「彼女たちのことを放っておくわけにはいかないはずだよ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900308,
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			oldPhoto = true,
			actorName = "リプレイヤー",
			nameColor = "#C3ABFF",
			say = "「『保険』を、『君』に託してよかった」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（心象空間で出会った、アンジュに似ていた「リプレイヤー」…もしかして……）",
			bgm = "theme-camelot",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = false,
				alpha = {
					1,
					0
				}
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "今の反応、どうやら下僕の中でも情報が色々つながったみたいね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "ふふ、やっぱり下僕を信じてよかったわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "艦船である私たちに全力を尽くし、知っていることを隠さずに教えてくれる",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "そんな下僕だからこそ、セイレーンに操られた上層部の陰謀を見破り、私たちの世界のために動いてくれるし",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "各陣営の力を一つにして、セイレーンや「余燼」ですら手こずっている敵に立ち向かえる",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "この前の南極での戦いのように、ね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "元々は上層部の誘導で各陣営が争ってしまい、結局ドロイドによって一網打尽にされちゃう運命だったけど…",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "下僕がビスマルクとソユーズに情報を流すことで紛争は回避できたし、さらに「パーミャチ」たちを撃退できた",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "私たちがここに立って作戦の話ができているのも下僕おかげよ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "だから下僕、気になることがあったら何でも教えて？私にできることならなんでも協力してやるわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "その代わり……作戦に参加してもらえないかしら…？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "正直危険な作戦だ……",
					flag = 1
				}
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "でもせっかくのチャンスをみすみす逃すわけにはいかないでしょ？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "そうだな。乗った！",
					flag = 1
				},
				{
					content = "こっちも放っておけないな",
					flag = 2
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "ふふふ。なかなか言うわね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "だから言ったでしょ？私が見込んだ下僕はすごいんだから！",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――問題が一つある。もし自分が会場から突然消えてしまったら大混乱に陥るのでは…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "そんなことはもちろん想定済みよ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「ロイヤルの女王」と「アイリスの枢機卿」がなんとかみんなと上層部をごまかすもの。そうすれば多少時間は稼げるでしょ？",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "私は「クイーンズライト号」の概念防御を確保するためにあんたと同行するの。あの列車は「エリザベス女王」が一人乗ることで安定するわ",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "むむむ……反論はできないけど、別に納得もしていないからね！覚えておきなさい！",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "というわけで、私が残ってリシュリューと一緒にあんたのフォローをするわ",
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
			actor = 805010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "はい、「女王陛下が急に会場に押しかけてきたせいで指揮官はその対応に追われた」ということにすれば、数日ぐらいはごまかせるかと",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "そんなに多くはいらないわよ。この「エリザベス」がいるから1日2日で十分だわ",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "エリザベス！来るなって言ったでしょ！",
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
			expression = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "「META」はいらない！「META」はいらない！「META」はいらない！",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "だからこの「世界β」の艦船たちにしたでしょ？",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "私までここに残ったら誰が「クイーンズライト号」の運転をするのよ？",
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
			expression = 9,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "あ。そっかー。運転するやつがいなくなるんだ。……ならいい！気をつけろ！",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "はいはい…",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805010,
			say = "アルザスたちが全力でお守りいたしますので、ご安心ください",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "うん！「META」じゃないほうがいい！役に立つ！",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（戦力のことを考えれば、「META」のエリザベスの部下も何人か編成したほうがいいと思うけど……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（「ミスD」はどうしていらないと言うんだろうか？もしかしてなにか今回の作戦に不利な要素でも…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（いや、今考えても仕方がないか）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――それで、その「枝」まで「クイーンズライト号」に乗って移動するのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "そうしてもいいけど、作戦のバックアップとしてここの転送装置を使うわ",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "いざという時の帰還ルートを確保するためにも、「キャメロット」を通ったほうがいいでしょうし",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "セイレーンの監視と「リシャール」の脅威もあるけど、私の列車と改修された「扉」を以てすれば「枝」の出入りは容易いわ",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "それでほかに聞きたいことは？",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――今は特にないな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "ならいいわ。そろそろこっちも出発の準備をしないと",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "じゃあ私はアイリスに向かう準備をするわね",
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
			actor = 205010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「クジラ狩り」、気をつけて行ってきなさい！",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "ベルファストとシェフィールドを連れて、こっちの「枝」のエリザベスは外に出ていった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（エリザベスのことだから、てっきり設備提供以外、メイド隊の誰かを一緒に同行させるんじゃないかと思ったが…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（そうしないのはリシュリューたちアイリスを信頼するようになったのか？それは良いことだ……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805010,
			say = "「尊きアイリスの名にかけて、いかなる時も誓いを忘れず、何があっても指揮官をお守りするように」",
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
			actor = 805030,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "「指揮官を守る剣として、生きている限りいかなる危害から守り――」",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901070,
			say = "「審判廷のエージェントとして、聖座の命を全うする」",
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
			actor = 805010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "アイリスの導きを――みんな、どうかよろしくお願いします",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805010,
			say = "そして指揮官、通信システムはこちらをお使いください",
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
			actor = 805010,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "審判廷が改修した新型のものになります。「アズールレーン」…ユニオンのものよりも安定性・機密性が上回っているはずです",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805010,
			say = "みんなにも同じ端末を配っていますから、指揮官は普段通り命令を出すことができますよ",
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
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（審判廷のバックアップも入ったのか…「ヘレナ」との通信がまだ回復していないし、敵のジャミングをうまく防げればいいのだが…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――ありがとう。リシュリュー",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805010,
			say = "指揮官に幸運とアイリスのご加護を。どうかお気をつけて",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "祝福の言葉を残し、リシュリューもまたキャメロットから離れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			say = "「アヴァロンの扉」――揺光の城のアーチである巨大な円環が動き出す。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_camelot_15",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "――さあ、クジラ狩りと行こうか…！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
