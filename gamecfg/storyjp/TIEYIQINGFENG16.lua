return {
	id = "TIEYIQINGFENG16",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			bgm = "nagato-map",
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ー―ー―！！",
			soundeffect = "event:/battle/boom2",
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
			},
			flashN = {
				color = {
					1,
					1,
					1,
					1
				},
				alpha = {
					{
						0,
						1,
						0.2,
						0
					},
					{
						1,
						0,
						0.2,
						0.2
					},
					{
						0,
						1,
						0.2,
						0.4
					},
					{
						1,
						0,
						0.2,
						0.6
					}
				}
			},
			dialogShake = {
				speed = 0.09,
				x = 8.5,
				number = 2
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			say = "轟音とともに、航路を塞ぐ敵は消滅し、少ない残骸のみが残された。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 301490,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "長門さま。敵の数、出現位置、戦い方は前と同じです",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 307050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "この場所…もう何回も通りましたわね…もしかして私たち、虚像幻境とは違う結界に閉じ込められたのかしら…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "結界であれば破れる弱点がある。四万十が今それを調べておる",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "幻境が見せる「夢」に溺れてしまわぬよう、お主たちも余から遠く離れないように",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			say = "墨色に染まった桜の海を、長門たち艦船が進んで行く。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（……さっきまで何回も楔を解除したにもかかわらず、幻境が解除される兆しすらない）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "（それどころか、この楔を解除すると、幻境の様子が様変わりすると来た）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（ほかの幻境と同じと思っていたが、ここは余たちを閉じ込める檻なのか……？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（それとあの「天城」…もし幻境が作り出した虚像ではないとしたら…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			say = "しばらく前に一行とすれ違った、狐のお面を被っている紅い影を思い出す。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（うぅ……「天城」が何を言っていたか思い出せぬ……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（思えばこの幻境で天城と初めて出会った時、幻だと思い込み、言葉に耳を傾けなかったが……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "（それでも何やらこっちを案内したようで、知らず知らずのうちにその足取りを追っていた）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（途中何度も疑ったが、それでも隠された楔の出現で注意を取られた…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "（今思い返せば迂闊だった…そのままここに誘導されるとも知らず…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（この神木の海域に……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "（……ん？神木……天城……？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（…！！分かったぞ！これなら辻褄が合う！）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（三笠大先輩は余にこれを調べさせようとしていたのか…！）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "（天城の残されし想いは神木の根を流転し、自我を取り戻した…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（そして重桜の本島より、神木が守りし境界よりも遥か遠くまで活動しておる……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "（本来そんなことが起こるはずがない。しかし、誰かが幻境を使って神木の領域を重桜の外にも広げた……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（一体誰がその様なことを……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（仙哲だった雲仙が大神木の封印を果たし、ワタツミを大和が引き継いだと思っていたが……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（大和ではないとしたら……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "（そうか…！だから大和は余に警告しようとしたのか…！）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 301370,
			side = 2,
			bgName = "bg_unnamearea_0",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "「一度『天の扉（あまと）』を開くことになる。それで、長門さまもよければお越しいただいても…」",
			bgm = "map-longgong",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "memoryFog"
				}
			}
		},
		{
			actor = 301370,
			side = 2,
			bgName = "bg_unnamearea_0",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "「………長門さま」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 301370,
			side = 2,
			bgName = "bg_unnamearea_0",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "「瑞鶴を今すぐ御身の元に呼び寄せ、龍神もそばに引き止めると宜し」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 301370,
			side = 2,
			bgName = "bg_unnamearea_0",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "「現し世を焦がす炎がじきに燃え上がるがゆえに――」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_moran_3",
			dir = 1,
			bgm = "nagato-map",
			actor = 305050,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "（現し世を焦がす炎…………っ！？）",
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
			},
			effects = {
				{
					active = false,
					name = "memoryFog"
				}
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "（ぬかった……余としたことが……！）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（赤城……やはりお主、己の強すぎる情念に囚われたのか……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "（リュウコツが傷つき、己の存在すら維持できなくなりかけた姉を救おうとするのは分かる）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "（だがお主が蘇らせようとしているのはどういう存在か…お主自身分かっておるのか……？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_moran_3",
			hidePaintObj = true,
			say = "ー―ー―！！",
			soundeffect = "event:/battle/boom2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashN = {
				color = {
					1,
					1,
					1,
					1
				},
				alpha = {
					{
						0,
						1,
						0.2,
						0
					},
					{
						1,
						0,
						0.2,
						0.2
					},
					{
						0,
						1,
						0.2,
						0.4
					},
					{
						1,
						0,
						0.2,
						0.6
					}
				}
			},
			dialogShake = {
				speed = 0.09,
				x = 8.5,
				number = 2
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			say = "その時、長門が作り出した――仲間を幻惑から守るためのー―結界に砲弾が着弾した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			say = "防御機能も兼ね備えた結界に爆発が起こり、その表面の模様を歪ませた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "……っ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 301490,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "長門さま",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 303100,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ちっ…！キリがない…今度はどこから出たっすか…！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 399060,
			say = "長門さま、ここは私に任せて！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 399060,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "あなたの力はまだ万全に回復していないわ。このままじゃ危険よ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "ならぬ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "お主は札を作るのに力を使いすぎた。余よりお主の方が回復の時間を必要としておるぞ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 304010,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ならなおさら早くここから脱出しなければなりませんわ！四万十、幻境の弱点は見つかったかしら？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 399060,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ええ！私が案内するわ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "待った。四万十！金剛！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 399060,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "長門さま……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "この「虚像幻境」は人を惑わすだけのものではない。…神木こそが幻境の核なのだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305050,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "三笠大先輩はそれを調べるために、余たちをここに避難させたのだ…！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_moran_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 305050,
			say = "針路を変える！幻境の中心に向かうぞ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
