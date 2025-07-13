return {
	fadeOut = 1.5,
	mode = 2,
	id = "HUANYINLAIDAOTONGXINXUEYUAN1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "母港・執務室",
			bgm = "story-richang-7",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "スマホのメッセージを読んでみると――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "「シッキー助けて！学園に閉じ込められた」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "「既読ついた　発信できた」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "Z47からのメッセージだ。スタンプ爆撃や連投ではなく、短いメッセージが2回連続で届いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（イタズラか？いや、Z47はこんなイタズラをしないはず……とりあえずどんな状況か聞いてみよう）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 107990,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			actorName = "リトル·エンタープライズ",
			nameColor = "#A9F548FF",
			say = "指揮官！指揮官！",
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
			portrait = 304070,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			actorName = "天城ちゃん",
			nameColor = "#A9F548FF",
			say = "げほげほ、指揮官……",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "状況を聞こうとしたら、小さな艦船たちが執務室の中に入ってきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107990,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "天城、大丈夫か？すまない…引っ張りながらここまで連れてきてしまった…",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107990,
			say = "むむ…冷静になれとは言われたけど…この状況はとても冷静ではいられなかったんだ",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 304070,
			say = "ふぅ…運動が苦手なだけですのでお気になさらず。それより早く、指揮官さまに報告しましょう！",
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
					content = "そっちも何かトラブルが？",
					flag = 1
				},
				{
					content = "一体何が起きたんだ？",
					flag = 2
				}
			}
		},
		{
			actor = 304070,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			optionFlag = 1,
			nameColor = "#A9F548FF",
			say = "「そっちも」…？指揮官さまへのヘルプが届いたのでしょうか？",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			say = "――まずはそっちで何が起きたか説明してくれる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107990,
			say = "学園に異変が起きたんだ！仲間たちと連絡がつかなくなったし……中にも入れなくなった…",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（連絡がつかなくなった…？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――Z47も学園にいたのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 304070,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "はい。いましたよ",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "スマホを取り出してZ47にメッセージを送ってみたが、「メッセージ送信失敗」とのエラー表示が出た。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（思ったよりも深刻な状況のようだな…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107990,
			say = "指揮官、私たちで調査しに行かないか？",
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
			actor = 304070,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "私たちだけでは足りません。指揮官さま、もっと仲間たちを呼んできましょう",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――そうだな。天城、エンタープライズ、一緒に学園に行こう。仲間を呼ぶのは途中でも構わない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 0,
			bgName = "bg_story_task_2",
			hideOther = true,
			dir = -1,
			actorName = "二人",
			actor = 107990,
			nameColor = "#A9F548FF",
			say = "うん！",
			subActors = {
				{
					dir = -1,
					actor = 304070,
					expression = 6,
					pos = {
						x = -1030.5
					}
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "母港・学園のゲート前",
			bgm = "level",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "しばらくして、艦船たちが学園の入口に集まった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 405020,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "姉さんから連絡を受けてすぐ駆けつけてきたけど、ゲートは開かなかったわ",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 405010,
			say = "ああ。普通の方法はもちろん、強引に破壊してみようともしたが…",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 405010,
			say = "どうやら学園は特殊な空間に引き込まれていて、鏡面海域みたいに条件を満たさなければ侵入できないらしい",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（鏡面海域みたいなものが……学園に…？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "二人の説明を受け、ゲート前の顔認識セキュリティシステムの前に立ってみた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「――訪問者{playername}認証失敗！警告！警告！認証を通過しなければ立入は許可されません！」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――簡単に通してはくれないみたいだな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 405010,
			say = "私とティルピッツもダメだったが、まさか指揮官までとは…",
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
			actor = 405010,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "イングラハムとソオブラジーテリヌイにはもう連絡してある。すぐに到着するだろう",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "そうしているうちに、科学部の仲間たちもやってきた。状況説明を受け早速セキュリティシステムの突破を試み始めたが……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "しばらくして――",
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
			expression = 5,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101480,
			say = "ダメね。……開かない",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 701090,
			say = "ぐぬぬ……ちなみにこれはシステムの故障ではないからな",
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
			actor = 701090,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "暗号化された情報空間に侵入するために、そっちの専門家を呼んでくるか…",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101480,
			say = "システムの開発者に見てもらう、か。…指揮官、夕張にはもう連絡した？",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――ああ、来る途中に連絡してみたが、まだ返信が来なくてな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 701090,
			say = "ん？そういえば夕張は設備のメンテで学園に行ってたような……は！もしかしてあいつも学園に閉じ込められたのか！？",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 405010,
			say = "開発者も巻き込まれてるなんて…困ったわね…",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（母港の内部施設に向けて大火力をぶっ放すのは最後の手段として…一度TBにハッキングしてもらおうか）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "次にどうするか考えていると――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「認証成功。訪問者U-31。通ってヨシ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "セキュリティシステムの拍子抜けする音声とともにゲートがゆっくりと開いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "なんだぁ～、普通に開くじゃない～",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "いつの間にか「制服」を着たU-31がそばにいた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "えへへ～、しきかーん、守りに来たよ",
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
			actor = 408131,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "何が起きたか知らないけど…ゲートはもう開いたよ？",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101480,
			say = "普通に開いた？",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 701090,
			say = "あのインチキセキュリティが普通に動いているの？絶対にロックがかかったと思ったぞ！",
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
			actor = 405010,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "セキュリティシステムも何かしらの変化があったというわけか。面白い",
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
			actor = 405020,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "それよりみんな、学園を見て",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "学園の中を眺めると、スローガン？が書かれているカラフルな横断幕が真っ先に目に入った。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "――「童心、無邪気、わんぱくリトルパラダイス」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 405020,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "あんな横断幕…前はなかったわよね？",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107990,
			say = "うん！なかった！",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――なるほど、もしかして…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――エンタープライズ、天城、二人もセキュリティの前に立ってみて？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「認証成功。訪問者エンタープライズ。通ってヨシ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「認証成功。訪問者天城。通ってヨシ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101490,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "あー！つまり「無邪気」「童心」「リトル」が通行条件だね！どれどれ、このレジェンド探索者のブリストルも試してみよう！",
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
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「――訪問者ブリストル認証失敗！警告！警告！認証を通過しなければ立入は許可されません！」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101490,
			say = "なんでよ！",
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
			actor = 501020,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "探索者ブリストル、あまりにも闇の秘密に触れすぎたせいで、すでに己の童心を失っていたのか…",
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
			actor = 501020,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ここは冒険者の撫順が代わりにやってやろう！",
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
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「――訪問者撫順認証失敗！警告！警告！認証を通過しなければ立入は許可されません！」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 501020,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "なんでよ！私は母港一の冒険者の撫順だよ！？なんで入れないの？",
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
			actor = 501020,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "こうなったら……指揮官、こいつをぶっ飛ばしていいかな？",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 501070,
			say = "そういう暴力的なやり方はダメダメ～。ここはこの飛雲さまの出番ってことで……",
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
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「――訪問者飛雲認証失敗！警告！警告！認証を通過しなければ立入は許可されません！」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 13,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 501070,
			say = "なんでよ～！？（涙",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 199030,
			say = "せんせい、アンカレッジも……！",
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
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「――訪問者アンカレッジ認証失敗！警告！警告！認証を通過しなければ立入は許可されません！」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101490,
			say = "アンカレッジまで……？この認証は一体どういう条件なの？",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 304070,
			say = "私とエンタープライズ、それにU-31は認証されたのに……",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101266,
			say = "エルドリッジ、やってみる",
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
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「認証成功。訪問者エルドリッジ。通ってヨシ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 405010,
			say = "そうか。リトル艦船、もしくはそれに準ずる「制服」を着ているのが条件かしら？",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――そうみたいね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（異変発生時、リトル艦船たちの一部は課外活動で学園の外にいたらしい…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（であれば、これからの調査と救援のメンツは――）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "セキュリティシステムの認証条件に基づいて、メンバーを早速集めてみた。",
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
			expression = 4,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "魔眼の啓示によれば、すべては暗黒鎮魂歌の陰謀…絶境に陥る友はこの悪を裏切りしものが救い出そう！",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307130,
			say = "えへへへ……指揮官さま、大鳳は絶対任務を全うしてみせますから、安心して待っていて♡",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "そうそう！大鳳はわたしが見張っ……じゃなくて守ってあげるから！",
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
			actor = 101266,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "救援チーム、名前がない……",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "名前？ふん、なら「世界の悪を滅ぼし隊」でどうだ！",
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
			actor = 101266,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "……イミフメイ……",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102210,
			say = "「キラキラリトルスター」でどぉ？",
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
			actor = 101266,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "……かわいい",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "かわいいのもいいけど、なんだかオシャレな名前のほうがもっといいな～",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101490,
			say = "むむむ…せっかく不思議事件が目の前にあるというのに、探索者であるこのブリストルが拒絶されるなんて…！",
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
			actor = 501020,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "制服！指揮官、制服を作ってー！",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 501070,
			say = "指揮官！飛雲さまも制服ほしい！！",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			say = "騒ぎが続く中、救援チームはようやく出発の最終準備に入った。",
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
			expression = 1,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107990,
			say = "指揮官、私も中に入れる。一緒に行かせてくれないか？",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 304070,
			say = "天城も……",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――いや、二人は異変に驚かされて参ってるだろう。しばらくはここで休んでてほしい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107990,
			say = "むぅ……分かった",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――U-31、この撮影設備を持っていって。自分たちは外で中の様子を見ながらサポートする",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "りょうかーい！それじゃあまたあとでね、指揮官♪",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "クックック、魔眼はすでに凱旋の未来を予見した…ここで待っているといい！",
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
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102210,
			say = "キラキラリトルスター、みんなをぜーんぶ助けるよー！",
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
			actor = 101266,
			side = 2,
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "指揮官、バイバイ",
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
			side = 2,
			actorName = "セキュリティシステム",
			bgName = "bg_story_childschool",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "「認証成功。訪問者キラキラリトルスター。通ってヨシ」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			asideType = 1,
			mode = 1,
			sequence = {
				{
					"「リトル学園へようこそ」",
					2
				},
				{
					"「ハッピーな毎日を過ごせるように」",
					4
				},
				{
					"「無邪気のままで育つように」",
					6
				},
				{
					"「童心を永遠に忘れないように」",
					8
				}
			}
		},
		{
			mode = 1,
			blackBg = true,
			effects = {
				{
					active = true,
					name = "huanyinglaidaotongxinxueyuan"
				}
			},
			sequence = {
				{
					"",
					2
				}
			}
		}
	}
}
