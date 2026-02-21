return {
	id = "XIANGCHEYUTIANQIONGZHIYIN29",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			say = "アンカレッジの都市防衛司令部へ向かう途中、突然「メンフィス」から連絡が入った。",
			bgm = "story-weimu-link",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				delay = 0,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_tianqiong_1",
			paintingNoise = true,
			dir = 1,
			actor = 900390,
			nameColor = "#C3ABFF",
			hidePaintObj = true,
			say = "指揮官、眠っていたマルコ・ポーロが「コンパイルフィールド」から姿を消したわ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actor = 900390,
			say = "位置情報によると、今はあなたのところに来ているみたい……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――……はぁ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_tianqiong_1",
			dir = 1,
			bgm = "theme-marcopolo",
			actor = 107250,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……みんな見て、あの街灯の上に人が立っていますよ？",
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
			},
			location = {
				"アンカレッジ・都市エリア",
				3
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9707060,
			say = "……本当だ……なんであんなところに立ってるんだろう？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_1",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――……街灯？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "bg_tianqiong_cg4",
			mode = 1,
			sequence = {
				{
					"",
					0
				}
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "おーっほっほっほ！……この法聖が戻ってきたわ！",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "ちっぽけな凡人どもよ、この絶対的な力の前で震えなさい！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			say = "少し離れた街灯の上で、マントをまとった人影が悪役のようなセリフを叫んでいた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			say = "もはや何も語るまい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "……マルコ・ポーロ！？",
					flag = 1
				},
				{
					content = "……そんな登場の仕方を誰に習ったんだ？",
					flag = 2
				}
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			nameColor = "#A9F548FF",
			dir = 1,
			optionFlag = 1,
			actorName = "マルコ·ポーロ",
			hidePaintObj = true,
			say = "まさしくマルコ・ポーロよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			nameColor = "#A9F548FF",
			dir = 1,
			optionFlag = 2,
			actorName = "マルコ·ポーロ",
			hidePaintObj = true,
			say = "この法聖が自ら考え出たものよ。どうかしら？覇気はあったかしら？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 101550,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "クラレンス・K・ブロンソン",
			say = "指揮官、もしかしてこの変人と知り合い……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 101550,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "クラレンス・K・ブロンソン",
			say = "……彼女も私たちの援軍なの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――本当は全然知らないと否定したいところだけど……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――……援軍かどうかもちょっと疑わしいし……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "ウィリアム・D・ポーター",
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "おおお！か、かっこいい！ぼくもやってみたい！",
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
			side = 2,
			actorName = "パサデナ",
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "私も私も！……一瞬でみんなの視線が釘付けにできるし！",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "ほら指揮官！この良さを理解できる子もちゃんといるわ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "心配しなくてよろしいっ！この法聖マルコ・ポーロはあなたたちの援軍よ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "さあ、照覧あれ——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "bg_tianqiong_cg5",
			mode = 1,
			sequence = {
				{
					"",
					0
				}
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			say = "空間の揺れと共に、巨大な銀白の虚影がマルコ・ポーロの背後からゆっくりと現れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			say = "それと同時に現れたのは、半透明の銀白のワンドだった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "ウィリアム・D・ポーター",
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "わあぁ——何なの！？",
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
			side = 2,
			actorName = "クラレンス・K・ブロンソン",
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "……ソリッドビジョンかなにか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "違——う！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "これこそが力！！",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "今の！私の！力の象徴よ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg5",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "ふふん、これだけじゃないわ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "bg_tianqiong_cg6",
			mode = 1,
			sequence = {
				{
					"",
					0
				}
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "空間の揺れがさらに広範囲に広がると、次々と獰猛な見た目の艦載機が現れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "おーっほっほっほ！！……この私の力を存分に仰ぎ見よ！",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "あはは！",
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
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "あははは！！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			effects = {
				{
					active = true,
					name = "speed"
				}
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "あははは……はは……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			effects = {
				{
					active = false,
					name = "speed"
				}
			}
		},
		{
			portrait = 699010,
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "マルコ·ポーロ",
			say = "えっと……どうやって街灯から降りればいいかしら……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "マルコ・ポーロのそばにハイエロファントの「影」とDevilの艦載機が現れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "以前からハイエロファントは何やら不審に思っていたが……彼女も「完璧な未来」の一端を覗き見たのだろうか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "まあいい、今は人数が多いほど、その分勝算も増える。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_tianqiong_cg6",
			hidePaintObj = true,
			say = "加勢に来てくれたのがマルコ・ポーロだけだったとしても、誰も来ないよりかはマシだろう。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
