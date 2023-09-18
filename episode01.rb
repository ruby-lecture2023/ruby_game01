require 'dxruby'

WINDOW_X = 640
WINDOW_Y = 480

# 人物の画像設定
normal_img = Image.load("image/character/hohoemi.png") # 通常

# その他画像設定
back_img = Image.load("image/back/kyousitu01.jpg") # 背景
myroom_img = Image.load("image/back/myroom.jpg") # 背景（主人公の部屋）
window_img = Image.load("image/textbox/window_01.png") # メッセージボックス
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
        Window.draw_font(44, 404, "桜が散り切った4月のある日、", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 1
        end
    when 1
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "春休みが終わり、私たち私立池照学園2年生の新たな一年が始まった───", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 2
        end
    when 2
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(124, 374, "先生", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "HRは以上！今日はこれで終わりだ、気をつけて帰れよ", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 3
        end
    when 3
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(94, 374, "隣の席の男子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "ねえ、初めましてだよね？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 4
        end
    when 4
        # メッセージウィンドウの表示
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "僕は中野黄治。君は？", font, color:[165, 83, 126])

        # 「Input.mouse_down?~」だけではマウスが押されている間しか選択肢が表示されないので
        # 一旦フラグを挟み、「マウスが押されたらフラグを1にする→フラグが1の間は選択肢を表示する」
        # とすることで、意図したとおりに表示することができます。
        if Input.mouse_push?(M_LBUTTON) then
            flag = 1
        end

        # 選択肢を表示する
        if flag == 1 && flag_end == 0 then
            # 選択肢1
            Window.draw_scale(109, 224, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(279, 229, "氷見鏡子です", font, color:[165, 83, 126])
            # 選択肢2
            Window.draw_scale(109, 274, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(149, 279, "初めまして、氷見鏡子です。これからよろしくね", font, color:[165, 83, 126])
            # 選択肢3
            Window.draw_scale(109, 324, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(259, 329, "（無視して帰る）", font, color:[165, 83, 126])

            if timer >= 40
                # マウスの座標が特定の領域にある間、選択肢をホバー状態にする
                if (109 < x && x <541 && 224 < y && y < 260) then # 選択肢1
                    Window.draw_scale(109, 224, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(279, 229, "氷見鏡子です", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 1
                        flag = 0
                        flag_end = 1
                        flag2 = 5
                    end
                elsif (109 < x && x <541 && 274 < y && y < 310) then # 選択肢2
                    Window.draw_scale(109, 274, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(149, 279, "初めまして、氷見鏡子です。これからよろしくね", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 2
                        flag = 0
                        flag_end = 1
                        flag2 = 5
                        likability += 1
                    end
                elsif (109 < x && x <541 && 324 < y && y < 360) then # 選択肢3
                    Window.draw_scale(109, 324, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(259, 329, "（無視して帰る）", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 3
                        flag = 0
                        flag_end = 1
                        flag2 = 5
                        likability -= 1
                    end
                end
            end
        end
    when 5
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "鏡子ちゃん、1年間よろしくね", font, color:[165, 83, 126])
        # Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 6
        end
    when 6
        Window.draw(0, 0, back_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(99, 374, "鏡子の友達", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "鏡子～！一緒に買えろ", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 7
        end
    when 7
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(109, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "うん、ちょっと待ってて！\n中野くん、また明日", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 8
        end
    when 8
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(109, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "またね", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 9
        end
    when 9
        Window.draw(0, 0, mayroom_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "───鏡子の部屋───", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 10
        end
    when 10
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(109, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "中野くん、かっこよかったなぁ……", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 11
        end
    when 11
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(109, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "中野くん、かっこよかったなぁ……", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 11
        end
    end
end