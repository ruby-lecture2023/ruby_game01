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
back_img = Image.load("image/back/kyousitu01.jpg") #教室背景
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
        Window.draw_font(44, 404, "-教室-", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 1
        end
    when 1
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "担任", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "はい、2学期も今日で終わりだが、ハメ外しすぎるなよー。\n解散!", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 = 2
        end
    when 2
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "鏡子ちゃん、この後トミーへのクリスマスプレゼント買いに\n行くんだけど、もし予定空いてたら一緒に選びに行かない？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =3
        end
    when 3
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "是非！トミーくんのために、良いやつ選ばないとね", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =4
        end
    when 4
        Window.draw(125, 0, normal_img)
        Window.draw(0, 0, back2_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(44, 404, "-通学路-", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =5
        end
    when 5
        Window.draw(125, 0, normal_img)
        Window.draw_scale(0, 0, window_img, 0, 0, 640, 320)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "ワンちゃん用の可愛いケーキがあって良かったね", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =6
        end
     when 6
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "そうだね…", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =7
        end
    when 7
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "今日も寒いね、トミーくんは大丈夫？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =8
        end
    when 8
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "冬毛でぬくぬくしてるよ", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =9
        end
    when 9
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "…ね、鏡子ちゃん", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =10
        end
    when 10
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "中野黄治", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "これ、クリスマスプレゼント。\n気に入ってくれると嬉しいんだけど", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =11
        end
    when 11
        Window.draw(125, 0, normal_img)
        Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
        Window.draw_font(110, 374, "氷見鏡子", font_name, color:[255, 255, 255])
        Window.draw_font(44, 404, "わ。なになに。手袋？", font, color:[165, 83, 126])
        if Input.mouse_push?(M_LBUTTON)
            flag2 =12
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
            Window.draw(125, 0, normal_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
            Window.draw_font(44, 404, "わぁ、ありがとう。すごい偶然だね。\n大切に使うよ。", font, color:[165, 83, 126])
            Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
        when 2 then
            Window.draw(125, 0, normal_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
            Window.draw_font(44, 404, "うん、やっぱり似合うね。", font, color:[165, 83, 126])
            Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
        when 3 then
            Window.draw(125, 0, normal_img)
            Window.draw_scale(19, 374, window_img, 0.5, 0.5, 0, 0)
            Window.draw_font(110, 374, "仲野央士", font_name, color:[255, 255, 255])
            Window.draw_font(44, 404, "あぁ、そう…。", font, color:[165, 83, 126])
            Window.draw_font(0, 0, "好感度：#{likability}", font, color:[255, 255, 255])
        end

        # 選択肢を表示する
        if flag == 1 && flag_end == 0 then
            # 選択肢1
            Window.draw_scale(109, 224, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(135, 229, "私も中野くんにプレゼント用意してたの。手袋だよ。", font, color:[165, 83, 126])
            # 選択肢2
            Window.draw_scale(109, 274, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(225, 279, "可愛いね。気に入ったよ。", font, color:[165, 83, 126])
            # 選択肢3
            Window.draw_scale(109, 324, button_img, 0.6, 0.6, 0, 0)
            Window.draw_font(200, 329, "もっと豪華なのが良かったなぁ…", font, color:[165, 83, 126])

            if timer >= 45
                # マウスの座標が特定の領域にある間、選択肢をホバー状態にする
                if (109 < x && x <541 && 224 < y && y < 260) then # 選択肢1
                    Window.draw_scale(109, 224, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(135, 229, "私も中野くんにプレゼント用意してたの。手袋だよ。", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 1
                        flag = 0
                        flag_end = 1
                        likability += 1
                    end
                elsif (109 < x && x <541 && 274 < y && y < 310) then # 選択肢2
                    Window.draw_scale(109, 274, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(225, 279, "可愛いね。気に入ったよ。", font, color:[255, 255, 255])
                    if Input.mouse_push?(M_LBUTTON) then
                        player_chose = 2
                        flag = 0
                        flag_end = 1
                    end
                elsif (109 < x && x <541 && 324 < y && y < 360) then # 選択肢3（バットエンド）
                    Window.draw_scale(109, 324, button_hover_img, 0.6, 0.6, 0, 0)
                    Window.draw_font(200, 329, "もっと豪華なのが良かったなぁ…", font, color:[255, 255, 255])
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