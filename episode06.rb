require 'dxruby'

WINDOW_X = 640
WINDOW_Y = 480

# 人物の画像設定
normal_img = Image.load("image/character/hohoemi.png") # 通常
sekimen1_img = Image.load("image/character/sekimen01.png") # 赤面1
sekimen2_img = Image.load("image/character/sekimen02.png") # 赤面2
sekimen3_img = Image.load("image/character/sekimen03.png") # 赤面3
iraira_img = Image.load("image/character/iraira.png") # いらいら
smile_img = Image.load("image/character/smile.png") # 笑顔
kanashii_img = Image.load("image/character/kanashii.png") # 悲しい
bikkuri_img = Image.load("image/character/bikkuri.png") # 驚き

# その他画像設定
back_img = Image.load("image/back/kyousitu01.jpg") #背景
window_img = Image.load("image/textbox/window_01.png") #メッセージボックス
button_img = Image.load("image/textbox/button_01.png") # 選択肢
button_hover_img = Image.load("image/textbox/button_01_hover.png") # 選択肢（選択状態）

# フォント設定
font = Font.new(24, fontname="ドットゴシック16") # 本文（サイズは24pt）
font_name = Font.new(22, fontname="ドットゴシック16") # 人物の名前（サイズ）

# 各種初期化
likability = 0 # 好感度
flag = 0 #　フラグ
flag2 = 0
flag_end = 0 # 終了フラグ
player_chose = 0 # どの選択肢を選んだか
timer = 0
click_count = 0

Window.loop do
    # マウスの座標取得
    x = Input.mouse_pos_x  # マウスカーソルのx座標
    y = Input.mouse_pos_y  # マウスカーソルのy座標

    # タイマーのカウントアップ
    timer += 1 if flag == 1

    # 背景の表示
    Window.draw(0, 0, back_img)

    # モノローグの部分はcase文で管理
    case flag2
    when 0
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "───教室──", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 1
        end
    when 1
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "担任", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "えー、今日は来月の修学旅行に向けて\n班ごとにフィールドワークの計画立ててもらうぞ。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 2
        end
    when 2
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "担任", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "班はこれからくじ引きで決めるから、番号順に並びなさい。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 3
        end
    when 3
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(109, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "照池学園の修学旅行先は、なんとハワイ！", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =4
        end
    when 4
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(109, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "マリンスポーツにショッピング！誰と一緒になるか、ならないか。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =5
        end
    when 5
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(109, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "それが問題だ。あわよくば、中野くんと一緒になれたら…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =6
        end
    when 6
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "わぁ、よろしくね鏡子ちゃん", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =7
        end
    when 7
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "よろしく、楽しみだね。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =8
        end
    when 8
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "友人１", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "ねぇ、どこ行く？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =9
        end
    when 9
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "友人２", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "海だろ海！", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =10
        end
    when 10
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "色々あるんだね。鏡子ちゃんはどこ行きたい？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =11
        end
    when 11
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "うーん…アラモアナショッピングセンター…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =12
        end
    when 12
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "あっパイナップル農園とか？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =13
        end
    when 13
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "パイナップル…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =14
        end
    when 14
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "友人２", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "パイナップル…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =15
        end
    when 15
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "友人１", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "これかな？ドールプランテーション。\n電車に乗ってパイナップル畑の見学ができるんだってー！", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =16
        end
    when 16
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "友人２", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "パイナップルのソフトクリーム？へぇ、いいじゃん", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =17
        end
    when 17
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "パイナップル好きなんだ？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =18
        end
    when 18
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "まあ、それなりに…？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =19
        end
    when 19
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "……", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =21
        end
    when 21
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "……", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =22
        end
    when 22
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "…………", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =23
        end
    when 23
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "ね、鏡子ちゃん", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =24
        end
    when 24
        Window.draw(125, 0, smile_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "は、はいっ", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =25
        end
    when 25
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "修学旅行２日目の自由行動、鏡子ちゃん予約できる？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =26
        end
    when 26
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "えっ……うーん、", font, color:[165, 83, 126])

        if Input.mouse_push?(M_LBUTTON) then
            flag = 1
        end

        # 選択肢による反応の変化と、好感度の加算
        case player_chose
        when 1 then
            Window.draw(125, 0, normal_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
            Window.draw_font(44, 404, "そうなの？それじゃあ仕方ないね", font, color:[165, 83, 126])
        when 2 then
            Window.draw(125, 0, smile_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
            Window.draw_font(44, 404, "よかった、ありがとう。楽しみだね", font, color:[165, 83, 126])
        when 3 then
            Window.draw(125, 0, kanashii_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
            Window.draw_font(44, 404, "……そっか", font, color:[165, 83, 126])
        end

        # 選択肢を表示する
        if flag == 1 && flag_end == 0 then
            # 選択肢1
            Window.draw_scale(109, 224, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(290, 229, "先約あるから", font, color:[165, 83, 126])
            # 選択肢2
            Window.draw_scale(109, 274, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(260, 279, "２人きりなら、いいよ。", font, color:[165, 83, 126])
            # 選択肢3
            Window.draw_scale(109, 324, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(285, 329, "ちょっと嫌かな", font, color:[165, 83, 126])

            if timer >= 45
                # マウスの座標が特定の領域にある間、選択肢をホバー状態にする
                if (109 < x && x <541 && 224 < y && y < 260) then # 選択肢1
                    Window.draw_scale(109, 224, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(290, 229, "先約あるから", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 1
                        flag = 0
                        flag_end = 1
                    
                    end
                elsif (109 < x && x <541 && 274 < y && y < 310) then # 選択肢2
                    Window.draw_scale(109, 274, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(260, 279, "２人きりなら、いいよ。", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 2
                        flag = 0
                        flag_end = 1
                        likability += 1
                    end
                elsif (109 < x && x <541 && 324 < y && y < 360) then # 選択肢3
                    Window.draw_scale(109, 324, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(285, 329, "ちょっと嫌かな", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 3
                        flag = 0
                        flag_end = 1
                        likability -= 1
                    end
                end
            end
        end
    end
end