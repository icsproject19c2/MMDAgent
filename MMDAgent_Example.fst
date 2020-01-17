# ----------------------------------------------------------------- #
#           MMDAgent "Sample Script"                                #
#           released by MMDAgent Project Team                       #
#           http://www.mmdagent.jp/                                 #
# ----------------------------------------------------------------- #
#                                                                   #
#  Copyright (c) 2009-2015  Nagoya Institute of Technology          #
#                           Department of Computer Science          #
#                                                                   #
# Some rights reserved.                                             #
#                                                                   #
# This work is licensed under the Creative Commons Attribution 3.0  #
# license.                                                          #
#                                                                   #
# You are free:                                                     #
#  * to Share - to copy, distribute and transmit the work           #
#  * to Remix - to adapt the work                                   #
# Under the following conditions:                                   #
#  * Attribution - You must attribute the work in the manner        #
#    specified by the author or licensor (but not in any way that   #
#    suggests that they endorse you or your use of the work).       #
# With the understanding that:                                      #
#  * Waiver - Any of the above conditions can be waived if you get  #
#    permission from the copyright holder.                          #
#  * Public Domain - Where the work or any of its elements is in    #
#    the public domain under applicable law, that status is in no   #
#    way affected by the license.                                   #
#  * Other Rights - In no way are any of the following rights       #
#    affected by the license:                                       #
#     - Your fair dealing or fair use rights, or other applicable   #
#       copyright exceptions and limitations;                       #
#     - The author's moral rights;                                  #
#     - Rights other persons may have either in the work itself or  #
#       in how the work is used, such as publicity or privacy       #
#       rights.                                                     #
#  * Notice - For any reuse or distribution, you must make clear to #
#    others the license terms of this work. The best way to do this #
#    is with a link to this web page.                               #
#                                                                   #
# See http://creativecommons.org/ for details.                      #
# ----------------------------------------------------------------- #

# 1st field: state before transition
# 2nd field: state after transition
# 3rd field: event (input message)
# 4th field: command (output message)
#
# Model
# MODEL_ADD|(model alias)|(model file name)|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(ON or OFF for cartoon)|(parent model alias)|(parent bone name)
# MODEL_CHANGE|(model alias)|(model file name)
# MODEL_DELETE|(model alias)
# MODEL_EVENT_ADD|(model alias)
# MODEL_EVENT_CHANGE|(model alias)
# MODEL_EVENT_DELETE|(model alias)
#
# Motion
# MOTION_ADD|(model alias)|(motion alias)|(motion file name)|(FULL or PART)|(ONCE or LOOP)|(ON or OFF for smooth)|(ON or OFF for repos)
# MOTION_ACCELERATE|(model alias)|(motion alias)|(speed)|(duration)|(specified time for end)
# MOTION_CHANGE|(model alias)|(motion alias)|(motion file name)
# MOTION_DELETE|(mpdel alias)|(motion alias)
# MOTION_EVENT_ADD|(model alias)|(motion alias)
# MOTION_EVENT_ACCELERATE|(model alias)|(motion alias)
# MOTION_EVENT_CHANGE|(model alias)|(motion alias)
# MOTION_EVENT_DELETE|(model alias)|(motion alias)
#
# Move and Rotate
# MOVE_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(move speed)
# MOVE_STOP|(model alias)
# MOVE_EVENT_START|(model alias)
# MOVE_EVENT_STOP|(model alias)
# TURN_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(rotation speed)
# TURN_STOP|(model alias)
# TURN_EVENT_START|(model alias)
# TURN_EVENT_STOP|(model alias)
# ROTATE_START|(model alias)|(x rotation),(y rotaion),(z rotation)|(GLOBAL or LOCAL rotation)|(rotation speed)
# ROTATE_STOP|(model alias)
# ROTATE_EVENT_START|(model alias)
# ROTATE_EVENT_STOP|(model alias)
#
# Sound
# SOUND_START|(sound alias)|(sound file name)
# SOUND_STOP|(sound alias)
# SOUND_EVENT_START|(sound alias)
# SOUND_EVENT_STOP|(sound alias)
#
# Stage
# STAGE|(stage file name)
# STAGE|(bitmap file name for floor),(bitmap file name for background)
#
# Light
# LIGHTCOLOR|(red),(green),(blue)
# LIGHTDIRECTION|(x position),(y position),(z position)
#
# Camera
# CAMERA|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(distance)|(fovy)|(time)
# CAMERA|(motion file name)
#
# Speech recognition
# RECOG_EVENT_START
# RECOG_EVENT_STOP|(word sequence)
# RECOG_MODIFY|GAIN|(ratio)
# RECOG_MODIFY|USERDICT_SET|(dictionary file name)
# RECOG_MODIFY|USERDICT_UNSET
# RECOG_MODIFY|CHANGE_CONF|(config file name)
#
# Speech synthesis
# SYNTH_START|(model alias)|(voice alias)|(synthesized text)
# SYNTH_STOP|(model alias)
# SYNTH_EVENT_START|(model alias)
# SYNTH_EVENT_STOP|(model alias)
# LIPSYNC_START|(model alias)|(phoneme and millisecond pair sequence)
# LIPSYNC_STOP|(model alias)
# LIPSYNC_EVENT_START|(model alias)
# LIPSYNC_EVENT_STOP|(model alias)
#
# Variable
# VALUE_SET|(variable alias)|(value)
# VALUE_SET|(variable alias)|(minimum value for random)|(maximum value for random)
# VALUE_UNSET|(variable alias)
# VALUE_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)
# VALUE_EVENT_SET|(variable alias)
# VALUE_EVENT_UNSET|(variable alias)
# VALUE_EVENT_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)|(TRUE or FALSE)
# TIMER_START|(count down alias)|(value)
# TIMER_STOP|(count down alias)
# TIMER_EVENT_START|(count down alias)
# TIMER_EVENT_STOP|(count down alias)
#
# Plugin
# PLUGIN_ENABLE|(plugin name)
# PLUGIN_DISABLE|(plugin name)
# PLUGIN_EVENT_ENABLE|(plugin name)
# PLUGIN_EVENT_DISABLE|(plugin name)
#
# Other events
# DRAGANDDROP|(file name)
# KEY|(key name)
#
# Other commands
# EXECUTE|(file name)
# KEY_POST|(window class name)|(key name)|(ON or OFF for shift-key)|(ON or OFF for ctrl-key)|(On or OFF for alt-key)

# 0011-0020 Initialization

0    11   <eps>                               MODEL_ADD|bootscreen|Accessory\bootscreen\bootscreen.pmd|0.0,12.85,17.6|0.0,0.0,0.0|OFF
11   12   MODEL_EVENT_ADD|bootscreen          MODEL_ADD|mei|Model\mei\mei.pmd|0.0,0.0,-14.0
12   13   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|ON|mei
13   14   <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF|OFF
14   15   <eps>                               STAGE|Stage\building2\floor.bmp,Stage\building2\back.jpg
15   16   <eps>                               MOTION_ADD|mei|base|Motion\mei_wait\mei_wait.vmd|FULL|LOOP|ON|OFF
16   17   <eps>                               TIMER_START|bootscreen|1.5
17   18   <eps>                               EXECUTE|reload.exe
18   2    TIMER_EVENT_STOP|bootscreen         MODEL_DELETE|bootscreen

# 0021-0030 Idle behavior

2    21   <eps>                               TIMER_START|idle1|20
21   22   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
22   23   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
23   1    TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1    2    TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0031-0040 Hello

1    31   RECOG_EVENT_STOP|こんにちは         SYNTH_START|mei|mei_voice_normal|こんにちは。
1    31   RECOG_EVENT_STOP|こんにちわ         SYNTH_START|mei|mei_voice_normal|こんにちは。
31   32   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32   2    SYNTH_EVENT_STOP|mei                <eps>

# 0041-0050 Self introduction

1    41   RECOG_EVENT_STOP|自己紹介           SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|あなた,誰          SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|君,誰              SYNTH_START|mei|mei_voice_normal|メイと言います。
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|よろしくお願いします。
43   2    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|ありがと           SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有難う             SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有り難う           SYNTH_START|mei|mei_voice_normal|どういたしまして。
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|いつでも、話しかけてくださいね。
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   2    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|可愛い             VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|かわいい           VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|綺麗               VALUE_EVAL|random|LE|80
1    61   RECOG_EVENT_STOP|きれい             VALUE_EVAL|random|LE|80
61   62   VALUE_EVENT_EVAL|random|LE|80|TRUE  SYNTH_START|mei|mei_voice_bashful|恥ずかしいです。
61   62   VALUE_EVENT_EVAL|random|LE|80|FALSE SYNTH_START|mei|mei_voice_bashful|ありがとう。
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   2    SYNTH_EVENT_STOP|mei                <eps>

# 0071-0090 Guide

1    71   RECOG_EVENT_STOP|図書館             MODEL_DELETE|menu
71   72   <eps>                               MODEL_ADD|panel|Accessory\map\map_library.pmd|0.0,2.8,2.5|0.0,0.0,0.0|ON|mei
72   73   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
73   74   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
74   75   <eps>                               SYNTH_START|mei|mei_voice_normal|図書館は、正面から見ると、右前の方向にあります。
75   76   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
76   77   <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
77   78   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
78   79   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
79   80   <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
80   81   SYNTH_EVENT_STOP|mei                MODEL_DELETE|panel
81   82   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|ON|mei
82   83   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
83   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

# 0091-0100 Bye

1    91   RECOG_EVENT_STOP|バイバイ           SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さようなら         SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さよなら           SYNTH_START|mei|mei_voice_normal|さようなら。
91   92   <eps>                               MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
92   2    SYNTH_EVENT_STOP|mei                <eps>

# 0101-0110 Browsing

1    101  RECOG_EVENT_STOP|ホームページ       EXECUTE|http://www.mmdagent.jp/
1    101  RECOG_EVENT_STOP|ＭＭＤＡｇｅｎｔ   EXECUTE|http://www.mmdagent.jp/
101  102  <eps>                               SYNTH_START|mei|mei_voice_normal|ＭＭＤＡｇｅｎｔの、ホームページを表示します。
102  2    SYNTH_EVENT_STOP|mei                <eps>

# 0111-0120 Screen

1    111  RECOG_EVENT_STOP|フルスクリーン     KEY_POST|MMDAgent|F|OFF
111  112  <eps>                               SYNTH_START|mei|mei_voice_normal|スクリーンの設定を、変更しました。
112  2    SYNTH_EVENT_STOP|mei                <eps>

# 0121-0130 English example

1    121  RECOG_EVENT_STOP|はじめまして       "SYNTH_START|mei|slt_voice_normal|Hello, nice to meet you."
1    121  RECOG_EVENT_STOP|はじめ             "SYNTH_START|mei|slt_voice_normal|Hello, nice to meet you."
1    121  RECOG_EVENT_STOP|始め               "SYNTH_START|mei|slt_voice_normal|Hello, nice to meet you."
1    121  RECOG_EVENT_STOP|初め               "SYNTH_START|mei|slt_voice_normal|Hello, nice to meet you."
121  2    SYNTH_EVENT_STOP|mei                <eps>

# 0131-0140 Male speech example

1    131  RECOG_EVENT_STOP|男性               MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
131  132  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
132  133  MOTION_EVENT_CHANGE|mei|base        SYNTH_START|mei|takumi_voice_normal|こんにちは、私はタクミです。
133  134  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
134  135  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
135  2    MOTION_EVENT_CHANGE|mei|base        <eps>

#Manzai
1    201  RECOG_EVENT_STOP|漫才               MODEL_DELETE|menu
1    201  KEY|o                               MODEL_DELETE|menu
201  202  <eps>                               TEXTAREA_ADD|caption_1|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
202  203  <eps>                               MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
203  204  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_greeting\takumi_greeting.vmd
204  205  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"どうもー。私はタクミです。"
205  206  <eps>                               SYNTH_START|mei|takumi_voice_normal|どうもお、私はタクミです。
206  207  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
207  208  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_greeting\mei_greeting.vmd
208  209  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"私はメイです。よろしくお願いします。"
209  210  <eps>                               SYNTH_START|mei|mei_voice_normal|私はメイです。よろしくお願いします。

210  211  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
211  212  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
212  213  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"突然やけどね、うちのおかんが好きな朝ごはんがあるらしいんやけど、その名前をちょっと忘れたらしくてね。"
213  214  <eps>                               SYNTH_START|mei|takumi_voice_normal|とつぜんやけどね、うちのおかんが好きな朝ごはんがあるらしいんやけど、その名前をちょっと忘れたらしくてね。
214  215  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
215  216  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
216  217  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"そんなら私が一緒に考えてあげるから、どんな特徴を言うてたか教えてみてよ。"
217  218  <eps>                               SYNTH_START|mei|mei_voice_normal|そんなら私が一緒に考えてあげるから、どんな特徴をゆうてたか教えてみてよ。
218  219  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
219  220  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
220  221  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"なんか甘くてカリカリしてて、牛乳とかかけて食べるやつらしいんやけど。"
221  222  <eps>                               SYNTH_START|mei|takumi_voice_normal|なんか甘くてカリカリしてて、牛乳とかかけて食べるやつらしいんやけど。
222  223  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
223  224  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

224  225  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"コーンフレークやんか。その特徴は完全にコーンフレークやがな。すぐ分かったやんこんなん。"
225  226  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークやんか。その特徴は完全にコーンフレークやがな。すぐわかったやんこんなん。
226  227  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
227  228  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
228  229  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"いや、俺もコーンフレークやと思ったんやけどな、おかんが言うには死ぬ前の最後のご飯もそれでいい言うてんねん。"
229  230  <eps>                               SYNTH_START|mei|takumi_voice_normal|いや、俺もコーンフレークやと思ったんやけどな、おかんがゆうには死ぬまえの最後のごはんもそれでいいゆうてんねん。
230  231  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
231  232  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
232  233  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"ほーん。そんならコーンフレークと違うか。人生最後の食事がコーンフレークでええ訳ないもんね。"
233  234  <eps>                               SYNTH_START|mei|mei_voice_normal|ほーん、そんならコーンフレークと違うか。人生最後の食事がコーンフレークでええ訳ないもんね。
234  235  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"コーンフレークはまだ寿命に余裕があるから食べてられんねん。コーンフレーク側も最後のご飯に任命されたら荷が重いわ。"
235  236  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークはまだ寿命に余裕があるから食べてられんねん。コーンフレーク側も最後のごはんに任命されたら荷が重いわ。
236  237  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"てことはコーンフレークちゃうかあ。ならもうちょっと詳しく教えてくれる？"
237  238  <eps>                               SYNTH_START|mei|mei_voice_normal|てことはコーンフレークちゃうかあ。ならもうちょっと詳しく教えてくれる？
238  239  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
239  240  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
240  241  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"なんであんなに栄養バランスの五角形でかいか分からんらしいわ。"
241  242  <eps>                               SYNTH_START|mei|takumi_voice_normal|なんであんなに栄養バランスの五角形でかいかわからんらしいわ。
242  243  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
243  244  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

244  245  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"コーンフレークやないかい。パッケージに書いてある五角形めちゃくちゃでかいんやから。"
245  246  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークやないかい。パッケージに書いてある五角形めちゃくちゃでかいんやから。
246  247  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"でもあれは自分の得意な項目だけで勝負してるからやとにらんでんねん。私の目は騙されへんよ。"
247  248  <eps>                               SYNTH_START|mei|mei_voice_normal|でもあれは自分の得意な項目だけで勝負してるからやとにらんでんねん。私の目は騙されへんよ。
248  249  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
249  250  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
250  251  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"でも分からへんねん。"
251  252  <eps>                               SYNTH_START|mei|takumi_voice_normal|でも分からへんねん。
252  253  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
253  254  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
254  255  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"何が分からへんの。"
255  256  <eps>                               SYNTH_START|mei|mei_voice_normal|何が分からへんの。
256  257  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
257  258  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
258  259  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"おかんが言うには晩飯にもよく出てくるらしいねん。"
259  260  <eps>                               SYNTH_START|mei|takumi_voice_normal|おかんがゆうには晩飯にもよく出てくるらしいねん。
260  261  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
261  262  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

262  263  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"ほなコーンフレークと違うやないかい。晩飯でコーンフレーク出てきたらちゃぶ台ひっくり返すもんね。"
263  264  <eps>                               SYNTH_START|mei|mei_voice_normal|ほなコーンフレークと違うやないかい。晩めしでコーンフレーク出てきたらちゃぶ台ひっくり返すもんね。
264  265  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"コーンフレークはまだ朝の寝ぼけてるときやから食べてられんねん。"
265  266  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークはまだ朝の寝ぼけてるときやから食べてられんねん。
266  267  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"それで食べてるうちにだんだん目が覚めてくるから最後ちょっとだけ残してまうねん。そういうカラクリやからね。"
267  268  <eps>                               SYNTH_START|mei|mei_voice_normal|それで食べてるうちにだんだん目が覚めてくるから最後ちょっとだけ残してまうねん。そういうカラクリやからね。
268  269  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"コーンフレークちゃうがな。ほな、なんか他言うてなかった？"
269  270  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークちゃうがな。ほな、なんかほかゆうてなかった？
270  271  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
271  272  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
272  273  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"子供のころ何故かみんな憧れたらしい。"
273  274  <eps>                               SYNTH_START|mei|takumi_voice_normal|子供のころ何故かみんな憧れたらしい。
274  275  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
275  276  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

276  277  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"コーンフレークやないかい。コーンフレークとミロとフルーチェはみんな憧れたんや。"
277  278  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークやないかい。コーンフレークとミロとフルーチェはみんな憧れたんや。
278  279  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"コーンフレークやそんなもん。"
279  280  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークやそんなもん。
280  281  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
281  282  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
282  283  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"でも、おかんが言うにはお坊さんが修行の時も食べてるって。"
283  284  <eps>                               SYNTH_START|mei|takumi_voice_normal|でも、おかんがゆうにはお坊さんが修行の時も食べてるって。
284  285  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
285  286  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

286  287  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"ほなコーンフレークちゃうやないかい。精進料理にカタカナのメニューなんか出えへんねん。"
287  288  <eps>                               SYNTH_START|mei|mei_voice_normal|ほなコーンフレークちゃうやないかい。精進料理にカタカナのメニューなんかでえへんねん。
288  289  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"コーンフレークはね、朝から楽して腹を満たしたいという煩悩の塊やからね。あれみんな煩悩に牛乳かけとんねん。"
289  290  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークはね、朝かららくして腹を満たしたいという煩悩の塊やからね。あれみんな煩悩に牛乳かけとんねん。
290  291  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"ほなコーンフレークちゃうがな。なんかもうちょっと言ってなかったか？"
291  292  <eps>                               SYNTH_START|mei|mei_voice_normal|ほなコーンフレークちゃうがな。なんかもうちょっとゆってなかったか？
292  293  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
293  294  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
294  295  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"パフェとかのかさ増しに使われてるらしいわ。"
295  296  <eps>                               SYNTH_START|mei|takumi_voice_normal|パフェとかのかさましに使われてるらしいわ。
296  297  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
297  298  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

298  299  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"コーンフレークやないかい。あれ法律すれすれくらい入ってるんやから。"
299  300  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークやないかい。あれ法律すれすれくらい入ってるんやから。
300  301  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"店側がもう一段増やそうもんなら私は動くよもう。"
301  302  <eps>                               SYNTH_START|mei|mei_voice_normal|店側がもう一段増やそうもんなら私は動くよもう。
302  303  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
303  304  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
304  305  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"俺もコーンフレークやと思うんやけどな、おかんが言うにはジャンルで言うたら中華らしいわ。"
305  306  <eps>                               SYNTH_START|mei|takumi_voice_normal|俺もコーンフレークやと思うんやけどな、おかんがゆうにはジャンルで言うたら中華らしいわ。
306  307  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
307  308  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

308  309  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"ほなコーンフレークちゃうやないかい。ジャンル全く分からんけど中華だけではないねん。"
309  310  <eps>                               SYNTH_START|mei|mei_voice_normal|ほなコーンフレークちゃうやないかい。ジャンル全くわからんけど中華だけではないねん。
310  311  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"もし回るテーブルの上にコーンフレーク置いたら回した時全部飛び散るからね。コーンフレークちゃうやないかい。"
311  312  <eps>                               SYNTH_START|mei|mei_voice_normal|もし回るテーブルの上にコーンフレーク置いたら回した時全部飛び散るからね。コーンフレークちゃうやないかい。
312  313  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"ほなもうちょっとなんか言ってなかった？"
313  314  <eps>                               SYNTH_START|mei|mei_voice_normal|ほなもうちょっとなんかゆってなかった？
314  315  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
315  316  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
316  317  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"食べるときに誰に感謝していいか分からんらしいわ。"
317  318  <eps>                               SYNTH_START|mei|takumi_voice_normal|食べるときに誰に感謝していいか分からんらしいわ。
318  319  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
319  320  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

320  321  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"コーンフレークやないかい。コーンフレークは生産者さんの顔が浮かばへんのよ。"
321  322  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークやないかい。コーンフレークは生産者さんの顔が浮かばへんのよ。
322  323  SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption_1|"コーンフレークに決まりや。おかんの好きな朝ご飯はコーンフレーク。"
323  324  <eps>                               SYNTH_START|mei|mei_voice_normal|コーンフレークに決まりや。おかんの好きな朝ごはんはコーンフレーク。
324  325  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
325  326  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
326  327  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"でもおかんが言うにはコーンフレークではない言うねん。"
327  328  <eps>                               SYNTH_START|mei|takumi_voice_normal|でもおかんが言うにはコーンフレークではない言うねん。
328  329  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
329  330  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

330  331  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"ほなコーンフレークちゃうやないかい。おかんがコーンフレークちゃう言うなら違うやないかい。先言えよ。"
331  332  <eps>                               SYNTH_START|mei|mei_voice_normal|ほなコーンフレークちゃうやないかい。おかんがコーンフレークちゃうゆうなら違うやないかい。先言えよ。
332  333  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\takumi_parka\takumi_parka.pmd
333  334  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\takumi_wait\takumi_wait.vmd
334  335  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"でもおとんが言うにはサバの塩焼きちゃうかって。"
335  336  <eps>                               SYNTH_START|mei|takumi_voice_normal|でもおとんが言うにはサバの塩焼きちゃうかって。
336  337  SYNTH_EVENT_STOP|mei                MODEL_CHANGE|mei|Model\mei\mei.pmd
337  338  MODEL_EVENT_CHANGE|mei              MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
338  339  MOTION_EVENT_CHANGE|mei|base        TEXTAREA_SET|caption_1|"絶対ちゃうやろ。もうええわ。ありがとうございました。"
339  340  <eps>                               SYNTH_START|mei|mei_voice_normal|絶対ちゃうやろ。もうええわ。ありがとうございました。
340  341  SYNTH_EVENT_STOP|mei                TEXTAREA_DELETE|caption_1
341  2    <eps>                               MODEL_ADD|menu

#zatugaku  0501-0600
1    501   RECOG_EVENT_STOP|雑学                VALUE_SET|x|0|6
1    501   RECOG_EVENT_STOP|雑談                VALUE_SET|x|0|6
1    501   KEY｜y                               VALUE_SET|x|0|6        

501  502   VALUE_EVENT_SET|x                    VALUE_EVAL|x|LE|1
502  512   VALUE_EVENT_EVAL|x|LE|1|TRUE         <eps>
512  550   <eps>                                SYNTH_START|mei|mei_voice_normal|ネズミといえばチーズが大好物というイメージがある。しかし、ネズミはチーズが好きではなく、他に食べ物があるときは絶対に食べない。
502  503   VALUE_EVENT_EVAL|x|LE|1|FALSE        VALUE_EVAL|x|LE|2
503  513   VALUE_EVENT_EVAL|x|LE|2|TRUE         <eps>
513  550   <eps>                                SYNTH_START|mei|mei_voice_normal|スポーツドリンクはスポーツ選手の水分補給用に開発されたが、体に吸収される速度は水よりも遅い。 
503  504   VALUE_EVENT_EVAL|x|LE|2|FALSE        VALUE_EVAL|x|LE|3
504  514   VALUE_EVENT_EVAL|x|LE|3|TRUE         <eps>
514  550   <eps>                                SYNTH_START|mei|mei_voice_normal|髪の毛は1日に0.3から0.5mm伸びるといわれているが、もしも全身の毛が1本に合わさったとすると1分間に約3cm伸びている計算になる。
504  505   VALUE_EVENT_EVAL|x|LE|3|FALSE        VALUE_EVAL|x|LE|4
505  515   VALUE_EVENT_EVAL|x|LE|4|TRUE         <eps>
515  550   <eps>                                SYNTH_START|mei|mei_voice_normal|開発されたが、体に吸収される速度は水よりも遅い。 
505  506   VALUE_EVENT_EVAL|x|LE|4|FALSE        VALUE_EVAL|x|LE|5
506  516   VALUE_EVENT_EVAL|x|LE|5|TRUE         <eps>
516  550   <eps>                                SYNTH_START|mei|mei_voice_normal|パソコンを操作するさいに使うマウス。このマウスを動かした時の長さの単位はミッキーで、１ミッキー、２ミッキーと数える。
506  517   VALUE_EVENT_EVAL|x|LE|5|FALSE        <eps>
517  550   <eps>                                SYNTH_START|mei|mei_voice_normal|日本の球場は同じ方向を向いて建てられている。理由としてはルールブックに本塁から投手板を経て二塁に向かう線は東北東に向かっている事を理想とするとあるためである。

550   2    SYNTH_EVENT_STOP|mei                 <eps>

#bus
1    601  RECOG_EVENT_STOP|バス　　　　       EXECUTE|https://www.tmu.ac.jp/extra/download.html?d=assets/files/download/campus/1159/03_unkoujikokuhyou_2019kouki.pdf
1    601  KEY|6                               EXECUTE|https://www.tmu.ac.jp/extra/download.html?d=assets/files/download/campus/1159/03_unkoujikokuhyou_2019kouki.pdf
601  602  <eps>                               SYNTH_START|mei|mei_voice_normal|南大沢、日野キャンパス間の連絡バスの時刻表を表示します。
602  2    SYNTH_EVENT_STOP|mei                <eps>

#weather
1    1001    KEY|e                            MODEL_DELETE|menu
1    1001    RECOG_EVENT_STOP|天気            MODEL_DELETE|menu
1    1001    RECOG_EVENT_STOP|予報            MODEL_DELETE|menu
1    1001    RECOG_EVENT_STOP|天気予報        MODEL_DELETE|menu
1001 1002    <eps>                            TEXTAREA_ADD|caption_1|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
1002 1003    TEXTAREA_EVENT_ADD|caption_1     TEXTAREA_SET|caption_1|"東京都の天気予報をお知らせします。"
1003 1004    <eps>                            SYNTH_START|mei|mei_voice_normal|東京都の天気予報をお知らせします。
1004 1005    SYNTH_EVENT_STOP|mei             TEXTAREA_SET|caption_1|"今日の天気は曇のち雨です。"
1005 1006    <eps>                            SYNTH_START|mei|mei_voice_normal|今日の天気は曇のち雨です。
1006 1007    SYNTH_EVENT_STOP|mei             TEXTAREA_SET|caption_1|"明日の天気は雪のち曇です。"
1007 1008    <eps>                            SYNTH_START|mei|mei_voice_normal|明日の天気は雪のち曇です。
1008 1009    SYNTH_EVENT_STOP|mei             TEXTAREA_SET|caption_1|"明日の予想最高気温、5度、予想最低気温、2度です。"
1009 1010    <eps>                            SYNTH_START|mei|mei_voice_normal|明日の予想最高気温、5度、予想最低気温、2度です。
1010 1011    SYNTH_EVENT_STOP|mei             TEXTAREA_DELETE|caption_1
1011 2       <eps>                            MODEL_ADD|menu

#date
1    2001    KEY|i                            MODEL_DELETE|menu
1    2001    RECOG_EVENT_STOP|日付            MODEL_DELETE|menu
1    2001    RECOG_EVENT_STOP|日にち          MODEL_DELETE|menu
1    2001    RECOG_EVENT_STOP|何日            MODEL_DELETE|menu
1    2001    RECOG_EVENT_STOP|いつ            MODEL_DELETE|menu
2001 2002    <eps>                            TEXTAREA_ADD|caption_1|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
2002 2003    TEXTAREA_EVENT_ADD|caption_1     TEXTAREA_SET|caption_1|"現在時刻をお知らせします。"
2003 2004    <eps>                            SYNTH_START|mei|mei_voice_normal|現在時刻をお知らせします。
2004 2005    SYNTH_EVENT_STOP|mei             TEXTAREA_SET|caption_1|"現在時刻は、1月17日17時10分です。"
2005 2006    <eps>                            SYNTH_START|mei|mei_voice_normal|現在時刻は、1月17日17時10分です。
2006 2007    SYNTH_EVENT_STOP|mei             TEXTAREA_DELETE|caption_1
2007 2       <eps>                            MODEL_ADD|menu

# 3141-3300 seikakusindan
1     3141   RECOG_EVENT_STOP|ひまつぶし         MODEL_DELETE|menu
1     3141   RECOG_EVENT_STOP|暇潰し             MODEL_DELETE|menu
1     3141   RECOG_EVENT_STOP|暇つぶし           MODEL_DELETE|menu
1     3141   KEY|q                               MODEL_DELETE|menu
3141  3142   <eps>                               TEXTAREA_ADD|caption_1|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
3142  3143   TEXTAREA_EVENT_ADD|caption_1        TEXTAREA_SET|caption_1|"性格診断をしていくよ。今からする質問に、はいかいいえで答えてね。じゃあスタートするよ。"
3143  3144   <eps>                               SYNTH_START|mei|mei_voice_normal|性格診断をしていくよ。今からする質問に、はいかいいえで答えてね。じゃあスタートするよ。
3144  3150   SYNTH_EVENT_STOP|mei                <eps>                               


3150  3151   <eps>                               TEXTAREA_SET|caption_1|"前例がなくてもチャレンジする。"
3151  3152   <eps>                               SYNTH_START|mei|mei_voice_normal|前例がなくてもチャレンジする。
3152  3153   SYNTH_EVENT_STOP|mei                <eps>                               
3153  3160   RECOG_EVENT_STOP|はい               <eps>
3153  3160   KEY|1                               <eps>
3153  3170   RECOG_EVENT_STOP|いいえ             <eps>
3153  3170   KEY|2                               <eps>

3160  3161   <eps>                               TEXTAREA_SET|caption_1|"どちらかといえばユニークな性格である。"
3161  3162   <eps>                               SYNTH_START|mei|mei_voice_normal|どちらかといえばユニークな性格である。
3162  3163   SYNTH_EVENT_STOP|mei                <eps>
3163  3190   RECOG_EVENT_STOP|はい               <eps>
3163  3190   KEY|1                               <eps>
3163  3180   RECOG_EVENT_STOP|いいえ             <eps>
3163  3180   KEY|2                               <eps>

3170  3171   <eps>                               TEXTAREA_SET|caption_1|"どちらかというと優柔不断である。"
3171  3172   <eps>                               SYNTH_START|mei|mei_voice_normal|どちらかというと優柔不断である。
3172  3173   SYNTH_EVENT_STOP|mei                <eps>
3173  3190   RECOG_EVENT_STOP|はい               <eps>
3173  3190   KEY|1                               <eps>
3173  3200   RECOG_EVENT_STOP|いいえ             <eps>
3173  3200   KEY|2                               <eps>

3180  3181   <eps>                               TEXTAREA_SET|caption_1|"信念に基づいて行動する。"
3181  3182   <eps>                               SYNTH_START|mei|mei_voice_normal|信念に基づいて行動する。      
3182  3183   SYNTH_EVENT_STOP|mei                <eps>
3183  3210   RECOG_EVENT_STOP|はい	       <eps>
3183  3210   KEY|1                      	       <eps>
3183  3220   RECOG_EVENT_STOP|いいえ             <eps>
3183  3220   KEY|2                               <eps>

3190  3191   <eps>                               TEXTAREA_SET|caption_1|"決断が早い方だ。"
3191  3192   <eps>                               SYNTH_START|mei|mei_voice_normal|決断が早い方だ。
3192  3193   SYNTH_EVENT_STOP|mei                <eps>
3193  3220   RECOG_EVENT_STOP|はい               <eps>
3193  3220   KEY|1                               <eps>
3193  3230   RECOG_EVENT_STOP|いいえ             <eps>
3193  3230   KEY|2                               <eps>

3200  3201   <eps>                               TEXTAREA_SET|caption_1|"一人で映画を見に行ける。"
3201  3202   <eps>                               SYNTH_START|mei|mei_voice_normal|一人で映画を見に行ける。
3202  3203   SYNTH_EVENT_STOP|mei                <eps>
3203  3230   RECOG_EVENT_STOP|はい               <eps>
3203  3230   KEY|1                               <eps>
3203  3240   RECOG_EVENT_STOP|いいえ             <eps>
3203  3240   KEY|2                               <eps>

3210  3211   <eps>                               TEXTAREA_SET|caption_1|"結果が何よりも大事。"
3211  3212   <eps>                               SYNTH_START|mei|mei_voice_normal|結果が何よりも大事。			       
3212  3213   SYNTH_EVENT_STOP|mei                <eps>
3213  3250   RECOG_EVENT_STOP|はい	         <eps>
3213  3250   KEY|1                 	         <eps>
3213  3220   RECOG_EVENT_STOP|いいえ             <eps>
3213  3220   KEY|2                               <eps>

3220  3221   <eps>                               TEXTAREA_SET|caption_1|"直感に従うほうだ。"
3221  3222   <eps>                               SYNTH_START|mei|mei_voice_normal|直感に従うほうだ。
3222  3223   SYNTH_EVENT_STOP|mei                <eps>
3223  3260   RECOG_EVENT_STOP|はい               <eps>
3223  3260   KEY|1                               <eps>
3223  3250   RECOG_EVENT_STOP|いいえ             <eps>
3223  3250   KEY|2                               <eps>

3230  3231   <eps>                               TEXTAREA_SET|caption_1|"さみしがり屋で構われたい。"
3231  3232   <eps>                               SYNTH_START|mei|mei_voice_normal|さみしがり屋で構われたい。
3232  3233   SYNTH_EVENT_STOP|mei                <eps>
3233  3270   RECOG_EVENT_STOP|はい               <eps>
3233  3270   KEY|1                               <eps>
3233  3280   RECOG_EVENT_STOP|いいえ             <eps>
3233  3280   KEY|2                               <eps>

3240  3241   <eps>                               TEXTAREA_SET|caption_1|"こつこつ努力を惜しまない。"
3241  3242   <eps>                               SYNTH_START|mei|mei_voice_normal|こつこつ努力を惜しまない。
3242  3243   SYNTH_EVENT_STOP|mei                <eps>
3243  3280   RECOG_EVENT_STOP|はい               <eps>
3243  3280   KEY|1                               <eps>
3243  3230   RECOG_EVENT_STOP|いいえ             <eps>
3243  3230   KEY|2                               <eps>

3250  3251   <eps>                               TEXTAREA_SET|caption_1|"診断結果を教えるよ。あなたは火のタイプ。何事においてもパワフルで、情熱をもって突き進みます。熱しやすく冷めやすい為、周りがついていけないことも多いタイプ。あなたを表すキーワードは。生命力、決断力、アピール性。歴史上の人物なら織田信長。"
3251  3252   <eps>                               SYNTH_START|mei|mei_voice_normal|診断結果を教えるよ。あなたは火のタイプ。何事においてもパワフルで、情熱をもって突き進みます。熱しやすく冷めやすい為、周りがついていけないことも多いタイプ。あなたを表すキーワードは。生命力、決断力、アピール性。歴史上の人物なら織田信長。
3252  3290   SYNTH_EVENT_STOP|mei                <eps>                               

3260  3261   <eps>                               TEXTAREA_SET|caption_1|"診断結果を教えるよ。あなたは風のタイプ。独特の空気感をかもしだし、自分の感性を大切にマイペースに事をすすめるタイプ。余り群れることは好きではない。あなたを表すキーワードは、楽観的、マイペース、自由。歴史上の人物なら坂本龍馬。"
3261  3262   <eps>                               SYNTH_START|mei|mei_voice_normal|診断結果を教えるよ。あなたは風のタイプ。独特の空気感をかもしだし、自分の感性を大切にマイペースに事をすすめるタイプ。余り群れることは好きではない。あなたを表すキーワードは、楽観的、マイペース、自由。歴史上の人物なら坂本龍馬。
3262  3290   SYNTH_EVENT_STOP|mei                <eps>                               

3270  3271   <eps>                               TEXTAREA_SET|caption_1|"診断結果を教えるよ。あなたは水のタイプ。人の為に役に立つことが大好きで、困っている人を放っておくことができません。いつも誰かと一緒にいないと不安なタイプ。あなたを表すキーワードは、優しさ、情が深い、サポート。歴史上の人物なら直江兼続。"
3271  3272   <eps>                               SYNTH_START|mei|mei_voice_normal|診断結果を教えるよ。あなたは水のタイプ。人の為に役に立つことが大好きで、困っている人を放っておくことができません。いつも誰かと一緒にいないと不安なタイプ。あなたを表すキーワードは、優しさ、情が深い、サポート。歴史上の人物なら直江兼続。
3272  3290   SYNTH_EVENT_STOP|mei                <eps> 

3280  3281   <eps>                               TEXTAREA_SET|caption_1|"診断結果を教えるよ。あなたは地のタイプ。見た目も態度も安定し安心感があるタイプ。ルールを守り、規則正しい生活を送ります。現状をしっかり分析してから行動に移します。あなたを表すキーワードは、努力、現実的、継続力。歴史上の人物なら徳川家康。"
3281  3282   <eps>                               SYNTH_START|mei|mei_voice_normal|診断結果を教えるよ。あなたは地のタイプ。見た目も態度も安定し安心感があるタイプ。ルールを守り、規則正しい生活を送ります。現状をしっかり分析してから行動に移します。あなたを表すキーワードは、努力、現実的、継続力。歴史上の人物なら徳川家康。
3282  3290   SYNTH_EVENT_STOP|mei                <eps> 

3290  3291   <eps>                               TEXTAREA_SET|caption_1|"「おわり」と言ったらホームに戻ります。"
3291  3292   RECOG_EVENT_STOP|おわり　　　　　　 TEXTAREA_DELETE|caption_1
3291  3292   RECOG_EVENT_STOP|終わり　　　　　　 TEXTAREA_DELETE|caption_1
3291  3292   RECOG_EVENT_STOP|終り　　　　　　　 TEXTAREA_DELETE|caption_1
3291  3292   KEY|q                               TEXTAREA_DELETE|caption_1
3292  2      <eps>                               MODEL_ADD|menu


# 4141-4150 jk
1     4141  RECOG_EVENT_STOP|じゃんけん          MODEL_DELETE|menu
1     4141  KEY|j                                MODEL_DELETE|menu
4141  4142  <eps>                                TIMER_START|timer_caption|4
4142  4143  <eps>                                TEXTAREA_ADD|caption_1|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
4143  4144  <eps>                                TEXTAREA_SET|caption_1|"じゃんけんしましょう。最初はブンブン。じゃんけん。"
4144  4145  <eps>                                SYNTH_START|mei|mei_voice_normal|じゃんけんしましょう。最初は。ブンブン。じゃんけん。
4145  4146  TIMER_EVENT_STOP|timer_caption       TIMER_START|timer_caption2|2
4146  4147  <eps>                                VALUE_SET|x|0|3
4147  4148  VALUE_EVENT_SET|x                    VALUE_EVAL|x|LE|1

4148  4150  VALUE_EVENT_EVAL|x|LE|1|TRUE         SYNTH_START|mei|mei_voice_normal|グー
4150  4151  <eps>                                TEXTAREA_ADD|map|10,10|1,1,1|1,1,1,0|0,0,0,0|-15,15,0
4151  4190  TEXTAREA_EVENT_ADD|map               TEXTAREA_SET|map|img\janken_gu.jpg

4148  4160  VALUE_EVENT_EVAL|x|LE|1|FALSE        VALUE_EVAL|x|LE|2
4160  4170  VALUE_EVENT_EVAL|x|LE|2|TRUE         SYNTH_START|mei|mei_voice_normal|チョキ
4170  4171  <eps>                                TEXTAREA_ADD|map|10,10|1,1,1|1,1,1,0|0,0,0,0|-15,15,0
4171  4190  TEXTAREA_EVENT_ADD|map               TEXTAREA_SET|map|img\janken_choki.jpg

4160  4180  VALUE_EVENT_EVAL|x|LE|2|FALSE        SYNTH_START|mei|mei_voice_normal|パー
4180  4181  <eps>                                TEXTAREA_ADD|map|10,10|1,1,1|1,1,1,0|0,0,0,0|-15,15,0
4181  4190  TEXTAREA_EVENT_ADD|map               TEXTAREA_SET|map|img\janken_pa.jpg

4190  4191  SYNTH_EVENT_STOP|mei                 TEXTAREA_DELETE|caption_1
4191  4192  TIMER_EVENT_STOP|timer_caption2      TEXTAREA_DELETE|map
4192  2     <eps>                                MODEL_ADD|menu



#music
1     5001   KEY|m                               MODEL_DELETE|menu
1     5001   RECOG_EVENT_STOP|音楽               MODEL_DELETE|menu
5001  5002   <eps>                               TEXTAREA_ADD|caption_1|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
5002  5003   TEXTAREA_EVENT_ADD|caption_1        TEXTAREA_SET|caption_1|"ランダムに曲を再生します。"
5003  5004   <eps>                               SYNTH_START|mei|mei_voice_normal|ランダムに曲を再生します。
5004  5005   SYNTH_EVENT_STOP|mei                TEXTAREA_DELETE|caption_1
5005  5006   <eps>                               VALUE_EVAL|random|LE|70
5006  5007   VALUE_EVENT_EVAL|random|LE|70|TRUE  SOUND_START|BGM|Music\pre.mp3
5006  5007   VALUE_EVENT_EVAL|random|LE|70|FALSE SOUND_START|BGM|Music\love.mp3
5007  2      <eps>                               MODEL_ADD|menu

1     5010  RECOG_EVENT_STOP|解除                SOUND_STOP|BGM
1     5010  KEY|n                                SOUND_STOP|BGM
5010  2    <eps>                                <eps>

#train
1    6001    KEY|c                            MODEL_DELETE|menu
1    6001    RECOG_EVENT_STOP|電車            MODEL_DELETE|menu
1    6001    RECOG_EVENT_STOP|列車            MODEL_DELETE|menu
1    6001    RECOG_EVENT_STOP|遅延            MODEL_DELETE|menu
1    6001    RECOG_EVENT_STOP|中央            MODEL_DELETE|menu
1    6001    RECOG_EVENT_STOP|中央線          MODEL_DELETE|menu
1    6001    RECOG_EVENT_STOP|快速            MODEL_DELETE|menu
1    6001    RECOG_EVENT_STOP|運行            MODEL_DELETE|menu
1    6001    RECOG_EVENT_STOP|運行情報        MODEL_DELETE|menu
6001 6002    <eps>                            TEXTAREA_ADD|caption_1|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
6002 6003    TEXTAREA_EVENT_ADD|caption_1     TEXTAREA_SET|caption_1|"中央線快速の運行情報をお知らせします。"
6003 6004    <eps>                            SYNTH_START|mei|mei_voice_normal|中央線快速の運行情報をお知らせします。
6004 6005    SYNTH_EVENT_STOP|mei             TEXTAREA_SET|caption_1|"現在､事故･遅延に関する情報はありません。"
6005 6006    <eps>                            SYNTH_START|mei|mei_voice_normal|現在､事故･遅延に関する情報はありません。
6006 6007    SYNTH_EVENT_STOP|mei             TEXTAREA_DELETE|caption_1
6007 2       <eps>                            MODEL_ADD|menu

#news
1    7001    KEY|n                            MODEL_DELETE|menu
1    7001    RECOG_EVENT_STOP|ニュース        MODEL_DELETE|menu
7001 7002    <eps>                            TEXTAREA_ADD|caption_1|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
7002 7003    TEXTAREA_EVENT_ADD|caption_1     TEXTAREA_SET|caption_1|"ニュースをお知らせします。"
7003 7004    <eps>                            SYNTH_START|mei|mei_voice_normal|ニュースをお知らせします。
7004 7005    SYNTH_EVENT_STOP|mei             TEXTAREA_SET|caption_1|"タイトル"
7005 7006    <eps>                            SYNTH_START|mei|mei_voice_normal|タイトル
7006 7007    SYNTH_EVENT_STOP|mei             TEXTAREA_SET|caption_1|"本文"
7007 7008    <eps>                            SYNTH_START|mei|mei_voice_normal|本文
7008 7009    SYNTH_EVENT_STOP|mei             TEXTAREA_DELETE|caption_1
7009 2       <eps>                            MODEL_ADD|menu

#reboot
1    9991    KEY|0                            MODEL_DELETE|menu
1    9991    RECOG_EVENT_STOP|再起動          MODEL_DELETE|menu
1    9991    RECOG_EVENT_STOP|起動            MODEL_DELETE|menu
1    9991    RECOG_EVENT_STOP|更新            MODEL_DELETE|menu
9991 9992    <eps>                            TEXTAREA_ADD|caption_1|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
9992 9993    TEXTAREA_EVENT_ADD|caption_1     TEXTAREA_SET|caption_1|"ＭＭＤＡｇｅｎｔを再起動します。"
9993 9994    <eps>                            SYNTH_START|mei|mei_voice_normal|ＭＭＤＡｇｅｎｔを再起動します。
9994 9995    SYNTH_EVENT_STOP|mei             EXECUTE|reboot.exe
9995 9996    SYNTH_EVENT_STOP|mei             TEXTAREA_DELETE|caption_1
9996 2       <eps>                            MODEL_ADD|menu
