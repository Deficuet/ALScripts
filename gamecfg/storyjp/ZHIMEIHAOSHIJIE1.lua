return {
	id = "ZHIMEIHAOSHIJIE1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_endingsong_3",
			hidePaintObj = true,
			say = "エリザベスの効率的な采配によって、アイリスに到着するより前に「ロイヤルの記念観艦式に出席するように」という指示が届いた。",
			bgm = "level03",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				black = true,
				dur = 1,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_endingsong_3",
			hidePaintObj = true,
			say = "専用機はそのままロイヤルへ――エリザベスが長らく滞在してるために、もはや第二の行政中枢となりつつあるスカパ・フロー泊地に向かった。",
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
			sequence = {
				{
					"スカパ・フロー泊地",
					1
				},
				{
					"「アヴァロンの扉」",
					2
				},
				{
					"応接エリア",
					3
				}
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "star_level_bg_322",
			dir = 1,
			bgm = "theme-camelot",
			actor = 900430,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "助手、やっと遊びに来てくれたか～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 45,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			say = "応接室に入るなり、クジラのぬいぐるみを抱えた少女がこちらに飛びついてきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――ミスD？クジラから離れられるようになったのか？デス・シャドウはどうした？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900430,
			say = "ふふん♪あのうるさいやつは、なんか知らないけど勝手に消えちゃった！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 45,
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
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900430,
			say = "だから今はどこへでも行ける～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "もちろん、活動範囲は「アヴァロンの扉」の中に限るけどね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 0,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900430,
			say = "しょうがないけどさ……「エリザベス」が外に出ちゃダメって！ひどいよね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205130,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "今のがもし「META」のエリザベス陛下に聞かれたら……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900430,
			say = "べーっ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――久しぶり、エリザベス、ヴァンガード",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "久しぶりね下僕。座りなさい。ちょうどティータイムよ。お茶を飲みながらゆっくり話そうじゃない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			say = "紅茶を味わいながら、穏やかで優雅な空気の中で時間が静かに過ぎていく。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
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
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			say = "天域アマハラで起こった出来事、「META」のヘレナからの言葉を伝えると、エリザベスはしばらく黙り込み、何かを考え込むような表情を見せた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "なるほど……確かにその通りね。あの子がいなければ、ここがこの世界で最も安全な場所と言えるかもね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "けれど、あの子は何かを恐れているように感じるわ。まるで自分がいなくなった途端、あんたを襲う何かがいるみたいな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――正直、見当がつかない。「META」のエリザベスの意見も聞いてみたいと思っている",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――どうにか時間を作って話せないかな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "うーん……「エリザベス」はアヴァロンのナビゲーションシステムのアップグレード作業中よ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "特殊な環境下にあるらしくて、私でも直接の連絡が取れないわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "幸い、3日に一度は情報を共有し合ってて、次の定期連絡はちょうど明日の正午だから、そのときになったら連れてってやるわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――わかった。じゃあしばらくはここでお世話になるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "もちろん。危険が払拭されるまでは、私の庇護のもとにいるべきだわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205010,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ベル、何か美味しいものを持ってきて",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 202120,
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "ベルファスト",
			say = "かしこまりました、陛下",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "（あれほど念を押したということは、やはり何か起きると考えてよさそうだな……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
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
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（あの日はだいぶ急だったし、「メンフィス」たちにも情報を共有できていなかったかもしれないが……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（だが、もう何日も経っているのに、どうして誰からも連絡がないんだ……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（今の自分には、彼女たちに連絡を取る手段もない……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_322",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（ただ待つだけとは、あまりに無力だな……）",
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
			sequence = {
				{
					"ロイヤル・アヴァロンの扉",
					1
				},
				{
					"指揮官休憩室",
					2
				},
				{
					"深夜",
					3
				}
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_115",
			hidePaintObj = true,
			say = "眠りにつく前、メンフィスからメッセージが届いた。",
			bgm = "theme-partydress",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_115",
			paintingNoise = true,
			dir = 1,
			actor = 102160,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指揮官、私は今アイリスの首都にはいないんだけど、どこにいると思う？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_115",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102160,
			say = "実はこっちでちょっとすごい発見があって",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_115",
			paintingNoise = true,
			dir = 1,
			actor = 102160,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "もしかしたら、近いうちにサプライズがあるかも！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_115",
			paintingNoise = true,
			dir = 1,
			actor = 102160,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "楽しみにしてて！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_115",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "――……なんだか思わせぶりだな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
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
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_115",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――「サプライズ」か……何だろう？少し気になるな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "？？？·？？？",
			bgm = "qe-ova-10",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "光が消えると、目に映ったのは明るいキャンパス風景だった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――アヴァロンの扉で眠っていたはずなのに……夢の中に飛ばされたのか？まさか、「エリザベス」の防御が破られたのか…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900481,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "あの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "ふと、眼の前に白いワンピースを纏った少女がいることに気付いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "少女はまるで最初からいたかのような溶け込み具合だった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――……？以前どこかで会ったよね？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――レディEは？彼女はここにいるの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900481,
			say = "休暇中",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "ワンピースの少女は、突然遠くの木の下に移動したかと思えば、次の瞬間にはさらに奥の木のそばに立っていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――ついて来てってことか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900481,
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "少女は何も言わず、並木の間を軽やかに駆け抜けていく。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "残像の軌跡を追うように、自分もキャンパスの中を走り出した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "奥へ進むにつれ、心の奥にひとつの考えが浮かんだ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――誰かに会わせようとしているのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――レディEじゃない、別の誰かに",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900481,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "急いで",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "少女の移動速度が一気に上がった。自分はその背を追いかけ、さらに足を速めた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "そうして角を曲がった、その瞬間――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			say = "世界が一瞬で純白に塗りつぶされ、少女も学校もすべてが消えた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = false,
				alpha = {
					1,
					0
				}
			}
		},
		{
			blackBg = true,
			mode = 1,
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
			},
			effects = {
				{
					active = true,
					name = "zhimeihaoshijie"
				}
			},
			sequence = {
				{
					"",
					1
				}
			}
		}
	}
}
