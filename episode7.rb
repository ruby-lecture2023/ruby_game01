require 'dxruby'

WINDOW_X = 640
WINDOW_Y = 480

# 人物の画像設定
normal_img = Image.load("image/character/hohoemi.png") # 通常
sekimen1_img = Image.load("image/character/sekimen01.png") # 赤面1
sekimen2_img = Image.load("image/character/sekimen02.png") # 赤面2
sekimen3_img = Image.load("image/character/sekimen03.png") # 赤面3
iraira_img = Image.load("image/character/iraira.png") # いらいら

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
        Window.draw_font(44, 404, "-旅館-", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 1
        end
    when 1
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "今日は待ちに待った修学旅行初日。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 2
        end
    when 2
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "中野くんとは、昼間のフィールドワークであんなことも\nこんなこともなかったけど、無事1日が終わろうとしていた。", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 3
        end
    when 3
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "(旅館の大浴場、気持ちよかったな)", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =4
        end
    when 4
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "(明日は自由行動の日だから、今日は\nたくさん寝て明日に備えなきゃ、ね…)", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =5
        end
    when 5
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "あ…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =6
        end
    when 6
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "鏡子ちゃん…こ、こんばんは…？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =7
        end
    when 7
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "コンバンハ…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =8
        end
    when 8
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "えっと…お風呂上がり、だよね…\nその、いつもとちがって…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =9
        end
    when 9
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "ん…いつもと違ってかわいいよ", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =10
        end
    when 10
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "！！！", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =11
        end
    when 11
        Window.draw(125, 0, sekimen3_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "いや、いつももかわいいんだけどね！？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =12
        end
    when 12
        Window.draw(125, 0, sekimen2_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "…あーもう、何言ってんだろう僕…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =13
        end
    when 13
        Window.draw(125, 0, sekimen2_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "中野くん…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =14
        end
    else
        # メッセージウィンドウの表示
        #Window.draw(125, 0, normal_img)
        #Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        #Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        #Window.draw_font(44, 404, "僕は中野黄治。君は？", font, color:[165, 83, 126])

        # 「Input.mouse_down?~」だけではマウスが押されている間しか選択肢が表示されないので
        # 一旦フラグを挟み、「マウスが押されたらフラグを1にする→フラグが1の間は選択肢を表示する」
        # とすることで、意図したとおりに表示することができます。
        if Input.mouse_push?(M_LBUTTON) then
            flag = 1
        end

        # 選択肢による反応の変化と、好感度の加算
        case player_chose
        when 1 then
            Window.draw(125, 0, sekimen3_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
            Window.draw_font(44, 404, "そっ、そんなこと君に言われても\n嬉しくないから！", font, color:[165, 83, 126])
            Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
        when 2 then
            Window.draw(125, 0, normal_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
            Window.draw_font(44, 404, "そうかな…？\nまあどっちでもいいけど", font, color:[165, 83, 126])
            # 2は好感度が変化しない選択肢
            Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
        when 3 then
            Window.draw(125, 0, iraira_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
            Window.draw_font(44, 404, "君、意外と図々しいなあ。\n120円までね", font, color:[165, 83, 126])
            Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
        end

        # 選択肢を表示する
        if flag == 1 && flag_end == 0 then
            # 選択肢1
            Window.draw_scale(109, 224, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(230, 229, "中野くんも、かわいいよ", font, color:[165, 83, 126])
            # 選択肢2
            Window.draw_scale(109, 274, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(190, 279, "中野くんはいつもの方がかっこいいよ", font, color:[165, 83, 126])
            # 選択肢3
            Window.draw_scale(109, 324, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(225, 329, "可愛い私にジュース奢って", font, color:[165, 83, 126])

            if timer >= 45
                # マウスの座標が特定の領域にある間、選択肢をホバー状態にする
                if (109 < x && x <541 && 224 < y && y < 260) then # 選択肢1
                    Window.draw_scale(109, 224, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(230, 229, "中野くんも、かわいいよ", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 1
                        flag = 0
                        flag_end = 1
                        likability += 1
                    end
                elsif (109 < x && x <541 && 274 < y && y < 310) then # 選択肢2
                    Window.draw_scale(109, 274, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(190, 279, "中野くんはいつもの方がかっこいいよ", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 2
                        flag = 0
                        flag_end = 1
                    end
                elsif (109 < x && x <541 && 324 < y && y < 360) then # 選択肢3
                    Window.draw_scale(109, 324, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(225, 329, "可愛い私にジュース奢って", font, color:[255, 255, 255])
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