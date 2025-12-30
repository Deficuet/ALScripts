return {
	fadeOut = 1.5,
	mode = 2,
	id = "SHISHANGTEKANJICHIRELANG1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_186",
			say = "サーキットのボルテージが高まっており、エンジンの轟音と風を切り裂く音が響いていた。",
			bgm = "story-richang-4",
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
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = "home",
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "レーサーである自分がマシンのもとへ向かったところ、ニュージャージーの陽気な笑い声に引き止められた。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			side = 2,
			say = "やっと来たのね、ハニー！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "ニュージャージーはマシンの開いたトランクの縁にゆったりと腰かけ、長い脚をだらりと揺らしていた。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_186",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 105174,
			actorName = "{playername}",
			live2d = true,
			say = "――ニュージャージー？どうしてピットエリアに？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = "expedition",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "ふふっ、もちろんハニーを応援するために決まってるじゃない♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "ハニーのレースまでまだ時間はあるし、こっちに来てよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			side = 2,
			say = "ここは最高だよ。サーキットの熱気を感じられるし～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_186",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 105174,
			actorName = "{playername}",
			live2d = true,
			say = "――いつも一番いい場所を見つけてるね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "もちろ～ん。今のサーキットの熱気は、日差しよりずっと熱いよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "どう？ハニー？もしかしてちょっと緊張してる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "全然緊張してない",
					flag = 1
				},
				{
					content = "多少はね",
					flag = 2
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_186",
			nameColor = "#A9F548FF",
			optionFlag = 1,
			hideRecordIco = true,
			actor = 105174,
			actorName = "{playername}",
			live2d = true,
			say = "――全然緊張してないよ。ニュージャージーが応援してくれてるし、負けるはずがない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			bgName = "star_level_bg_186",
			withoutActorName = true,
			optionFlag = 1,
			hideRecordIco = true,
			actor = 105174,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "ニュージャージーは軽やかにマシンから飛び降り、日差しが彼女の髪を照らし、輝きを放っていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_186",
			dir = 1,
			optionFlag = 1,
			actor = 105174,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "じゃあただ勝つのではなく、最高に華麗な勝利を見せて～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_186",
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hideRecordIco = true,
			actor = 105174,
			actorName = "{playername}",
			live2d = true,
			say = "――ま、多少はね。やっぱり緊張感はあるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			bgName = "star_level_bg_186",
			withoutActorName = true,
			optionFlag = 2,
			hideRecordIco = true,
			actor = 105174,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "ニュージャージーは軽やかにマシンから飛び降り、日差しが彼女の髪を照らし、輝きを放っていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_186",
			dir = 1,
			optionFlag = 2,
			actor = 105174,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "今緊張してたら本番のパフォーマンスに影響するよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "というわけで…ハニーだけのチアリーダーが必勝祈願してあげる！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "返事を待たずに、彼女はつま先立ちして、両手でこちらの頬を包み込んだ。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = "headtouch",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "目を閉じて、ハニー。ブラックドラゴンの特別な祝福を贈るわ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "――目を閉じると、甘い香りを帯びた柔らかな唇が口元に触れた。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "ふふ～、甘くて幸せな超スピードの祝福よ♪",
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
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "幾秒か続いた後、ニュージャージーは離れて、得意げにしていた。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "どう？パワーが満タンになったでしょ？これにはあたしの――あっ――！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "後ずさりした時、ニュージャージーの靴のヒールが地面の溝に引っかかってしまった。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = "touch2",
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "彼女の腰を抱き寄せたが、トランクに倒れ込んでしまった。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "ハニーったら……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "……これは不意打ちよ〜？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_186",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 105174,
			actorName = "{playername}",
			live2d = true,
			say = "――さっきニュージャージーも不意打ちしてきたのに？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "あれは出発前の祝福！祈りみたいなものだよ〜",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			side = 2,
			say = "それにしてもこの雰囲気は……ドキドキさせてくれるわね♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_186",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 105174,
			actorName = "{playername}",
			live2d = true,
			say = "――雰囲気？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "こっちの言葉を聞いたニュージャージーは目を閉じ、こちらの唇に顔を寄せてきてそっと囁いた。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = "touch",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "そう。こういう雰囲気よ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "さあハニー……勝利を約束するキスをちょーだい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 105174,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "互いの息が絡み合う中、アナウンスが流れた。ニュージャージーは自分の肩を軽くつまみ、頬には恥じらいの色が残っていた。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_186",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 105174,
			say = "頑張って～！あたしのチャンピオン！あたしのハニー！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
