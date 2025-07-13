return {
	id = "AERSASI6",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			sequence = {
				{
					"アルザス、オーバーヒート！\n\n<size=45>六 減感ソリューション！</size>",
					1
				}
			}
		},
		{
			fontsize = 39,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "再び感情が暴走したアルザス。ようやく落ち着いたと思ったら、今度は完全に凹んでしまったようだ。",
			bgm = "story-richang-8",
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
			expression = 9,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "はぅ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ごめんなさい……今のアルザスでは、洗練された完璧な秘書艦になるのは不可能と認む……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "午前中だけでも効率よく稼働できてよかった…でないと指揮官に迷惑かけちゃう…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "落胆の色が隠せないアルザスを見ながら、彼女の度重なる暴走について真剣に考えてみた。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "（よくよく考えてみれば…アルザスの暴走はほぼこちらと目が合ったり、こちらが体に触れた時に起きた）",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "（ってことはこの話は、そもそもこちらに原因がある……）",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――アルザス。ちょっといいかな？",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "え、し、指揮官？何か命令は……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――質問があるんだが、真剣に答えてほしい",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 13,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そ、そそそそんないきなりどうしたの…",
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
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "真面目に聞かれてびっくりしながらもアルザスは今度こそ感情モジュールの制御を保とうと、こちらの目線を避けて顔を伏せた。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――アルザス、落ち着いて。経験談でいいから一つだけ教えてほしい",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――感情モジュールが暴走しやすくなったのは、もっぱら自分がいるときだよね？",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うぅ……そ、それは……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "アルザスはモジモジと答えあぐねた――その様子は照れているようでもあり、腹をくくったようでもあった。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "は、はい…アルザス、指揮官から発射されるマイクロウェーブに抵抗できなくて…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 12,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "マイクロウェーブを感知しただけで、アルザスの感情モジュールは、すぐに……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "で、でも！今日指揮官に助けてもらったおかげで、感情モジュールの制御能力はかなり強化されたと認む！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 11,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "こ、これなら…何秒か長く持ちこたえられるはず！",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――そうか。でもやはりもっと効率的…いや、対症療法的な措置とか訓練が必要だな",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――最大の要因が他でもない自分だというなら、まずは簡単な触れ合いから始めようか",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 13,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "し、指揮官とふ、ふれ…む、無理無理無理無理ーー！",
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
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――感度を意図的に低くする「減感作療法」というのがあってな。少しずつ耐性を強化していけば…",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "い、いずれ耐性がつき、簡単に暴走しなくなるってこと！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――そうだ。手始めに握手からやってみよう",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "アルザスはこくりと頷き、おどおどしく手を差し出した。指先が触れ、やがて手と手が重なり……",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――オッケーだ。一度離そう",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 13,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "はぁ……はぁ……え？？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "状況をイマイチ飲み込めていないアルザスだが、それでも素直に指示に従った。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――やってみてどうだった？",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 11,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "はぁ…はぁ…な、なんとか…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "顔が真っ赤になったものの、一生懸命頑張っている健気さははっきり伝わってきた。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "手を繋いでは離す――そう繰り返すうちに、彼女はだんだんと慣れていったようだ。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "では次は、彼女の肩を優しく触れてみよう。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うぅっ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "最初はびくっとしたものの、何回もやっていくうちに彼女も耐性がついたようだ。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "（よし…この調子なら続けても大丈夫そうだ）",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――もう慣れてきたかな？じゃあ次は頭を撫でてみるね",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 13,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "え？わわわ、わかった！指揮官……ど、どうぞ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "ぎゅーっと目を閉じてソワソワしている彼女。そんな彼女に影響されてか、自分もなんかドキドキしてきた。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "このまま頭に手を置こうとしたその瞬間――",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 803020,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "失礼する。執剣者、この前頼まれた書類を…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "半開きだった執務室のドアが誰かに開かれて振り向くと、ブレンヌスが訝しげな表情で立ち尽くしていた。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 803020,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "…演劇の練習でもしているのか？",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "――演劇の練習…？",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "その「練習相手」――アルザスは頬を紅潮をさせながら、目を閉じて「待ち」をしていた。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指揮官、あ、アルザスは準備できている……！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 803020,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……書類はここに置いておく",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "意味深な視線をこちらに送りながらブレンヌスは書類をドアに一番近い机に置くと、そっと執務室のドアを閉めて出ていった。",
			fontsize = 39,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
