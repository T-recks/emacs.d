(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Begin Source config.org

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; End Source config.org

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#fafafa" "#ca1243" "#50a14f" "#c18401" "#4078f2" "#a626a4" "#4078f2" "#383a42"])
 '(ansi-term-color-vector
   [unspecified "#fafafa" "#ca1243" "#50a14f" "#c18401" "#4078f2" "#a626a4" "#4078f2" "#383a42"])
 '(background-color "#111111")
 '(background-mode dark)
 '(beacon-color "#f2777a")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#cccccc")
 '(custom-enabled-themes (quote (base16-one-light)))
 '(custom-safe-themes
   (quote
	("9a58c408a001318ce9b4eab64c620c8e8ebd55d4c52327e354f24d298fb6978f" "08e47c1b4faf013eadb945fd15748fe4bc98435c75c0e3014541ecdb5adf7196" "7f6796a9b925f727bbe1781dc65f7f23c0aa4d4dc19613aa3cf96e41a96651e4" "50b66fad333100cc645a27ada899a7b1d44f1ceb32140ab8e88fedabfb7d0daf" "77c3f5f5acaa5a276ca709ff82cce9b303f49d383415f740ba8bcc76570718b9" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "d2bd16a8bcf295dce0b70e1d2b5c17bb34cb28224a86ee770d56e6c22a565013" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "722e1cd0dad601ec6567c32520126e42a8031cd72e05d2221ff511b58545b108" "f446475d7dc4e382387edc7cedb8aa231797bcec7f328ffc6914551c6870087a" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "25c242b3c808f38b0389879b9cba325fb1fa81a0a5e61ac7cae8da9a32e2811b" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "87d46d0ad89557c616d04bef34afd191234992c4eb955ff3c60c6aa3afc2e5cc" "986e7e8e428decd5df9e8548a3f3b42afc8176ce6171e69658ae083f3c06211c" "50ff65ab3c92ce4758cc6cd10ebb3d6150a0e2da15b751d7fbee3d68bba35a94" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "7a1190ad27c73888f8d16142457f59026b01fa654f353c17f997d83565c0fc65" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "df21cdadd3f0648e3106338649d9fea510121807c907e2fd15565dde6409d6e9" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "ffe80c88e3129b2cddadaaf78263a7f896d833a77c96349052ad5b7753c0c5a5" "6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "c9f102cf31165896631747fd20a0ca0b9c64ecae019ce5c2786713a5b7d6315e" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "7a2ac0611ded83cdd60fc4de55ba57d36600eae261f55a551b380606345ee922" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "80930c775cef2a97f2305bae6737a1c736079fdcc62a6fdf7b55de669fbbcd13" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "250268d5c0b4877cc2b7c439687f8145a2c85a48981f7070a72c7f47a2d2dc13" "5b8eccff13d79fc9b26c544ee20e1b0c499587d6c4bfc38cabe34beaf2c2fc77" "3f67aee8f8d8eedad7f547a346803be4cc47c420602e19d88bdcccc66dba033b" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "dad1453029a183e5837ebfd7de65f74df7e06554e39468c758c8197bfa749fec" "8543b328ed10bc7c16a8a35c523699befac0de00753824d7e90148bca583f986" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "8cf1002c7f805360115700144c0031b9cfa4d03edc6a0f38718cef7b7cabe382" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "2a998a3b66a0a6068bcb8b53cd3b519d230dd1527b07232e54c8b9d84061d48d" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "f984e2f9765a69f7394527b44eaa28052ff3664a505f9ec9c60c088ca4e9fc0b" "9c4acf7b5801f25501f0db26ac3eee3dc263ed51afd01f9dcfda706a15234733" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "146061a7ceea4ccc75d975a3bb41432382f656c50b9989c7dc1a7bb6952f6eb4" "36282815a2eaab9ba67d7653cf23b1a4e230e4907c7f110eebf3cdf1445d8370" "264b639ee1d01cd81f6ab49a63b6354d902c7f7ed17ecf6e8c2bd5eb6d8ca09c" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "808b47c5c5583b5e439d8532da736b5e6b0552f6e89f8dafaab5631aace601dd" "1025e775a6d93981454680ddef169b6c51cc14cea8cb02d1872f9d3ce7a1da66" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "04790c9929eacf32d508b84d34e80ad2ee233f13f17767190531b8b350b9ef22" "428bdd4b98d4d58cd094e7e074c4a82151ad4a77b9c9e30d75c56dc5a07f26c5" "f5f3a6fb685fe5e1587bafd07db3bf25a0655f3ddc579ed9d331b6b19827ea46" "b0c5c6cc59d530d3f6fbcfa67801993669ce062dda1435014f74cafac7d86246" "542e6fee85eea8e47243a5647358c344111aa9c04510394720a3108803c8ddd1" "304c39b190267e9b863c0cf9c989da76dcfbb0649cbcb89592e7c5c08348fce9" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "ec3e6185729e1a22d4af9163a689643b168e1597f114e1cec31bdb1ab05aa539" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "69e7e7069edb56f9ed08c28ccf0db7af8f30134cab6415d5cf38ec5967348a3c" "41eb3fe4c6b80c7ad156a8c52e9dd6093e8856c7bbf2b92cc3a4108ceb385087" "732ccca2e9170bcfd4ee5070159923f0c811e52b019106b1fc5eaa043dff4030" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "0961d780bd14561c505986166d167606239af3e2c3117265c9377e9b8204bf96" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "b67b2279fa90e4098aa126d8356931c7a76921001ddff0a8d4a0541080dee5f6" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "a61109d38200252de49997a49d84045c726fa8d0f4dd637fce0b8affaa5c8620" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "c614d2423075491e6b7f38a4b7ea1c68f31764b9b815e35c9741e9490119efc0" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "fee4e306d9070a55dce4d8e9d92d28bd9efe92625d2ba9d4d654fc9cd8113b7f" "50d07ab55e2b5322b2a8b13bc15ddf76d7f5985268833762c500a90e2a09e7aa" "25c06a000382b6239999582dfa2b81cc0649f3897b394a75ad5a670329600b45" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "d83e34e28680f2ed99fe50fea79f441ca3fddd90167a72b796455e791c90dc49" "db73e672b32ebfe06b8bee3ca51769a56688fc6a7baed75bf88ef8ebf091c797" "0055e55e6a357a941027139152a67f93376616d3501055d06852f10fdc16bac0" "73bff6f2ef60f8a1238a9ca666235d258e3acdeeed85d092ca532788dd7a33c4" "81db42d019a738d388596533bd1b5d66aef3663842172f3696733c0aab05a150" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "5b388add509c423e4ac275668662486628690e7ffe0050998615fc4c3669c16c" "4e21fb654406f11ab2a628c47c1cbe53bab645d32f2c807ee2295436f09103c6" "05eeb814f74b2fd4f2e6e37b4d604eb9b1daaaedfa5e692f1d485250c6b553eb" "65d4e1535e8fa5d40b9a95d30ed0e95b3bac2b905e905f4397e0425a51addc55" "fec6c786b1d3088091715772839ac6051ed972b17991af04b50e9285a98c7463" "e6370c4899d463555a6aecf2da2700e2e039f93273212ce1836e9f94ad4af278" "7666b079fc1493b74c1f0c5e6857f3cf0389696f2d9b8791c892c696ab4a9b64" "293b55c588c56fe062afe4b7a3a4b023712a26d26dc69ee89c347b30283a72eb" "dcb9fd142d390bb289fee1d1bb49cb67ab7422cd46baddf11f5c9b7ff756f64c" "b5ecb5523d1a1e119dfed036e7921b4ba00ef95ac408b51d0cd1ca74870aeb14" "0846e3b976425f142137352e87dd6ac1c0a1980bb70f81bfcf4a54177f1ab495" "a866134130e4393c0cad0b4f1a5b0dd580584d9cf921617eee3fd54b6f09ac37" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "2a1b4531f353ec68f2afd51b396375ac2547c078d035f51242ba907ad8ca19da" "53d1bb57dadafbdebb5fbd1a57c2d53d2b4db617f3e0e05849e78a4f78df3a1b" "2af26301bded15f5f9111d3a161b6bfb3f4b93ec34ffa95e42815396da9cb560" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "54e08527b4f4b127ebf7359acbbbecfab55152da01716c4809682eb71937fd33" "75c5c39809c52d48cb9dcbf1694bf2d27d5f6fd053777c194e0b69d8e49031c0" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "ad109c1ad8115573f40e22ac2b996693b5d48052fa37b5919f70ea37c62a965e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "9deeab438d1d798c26d41c759d74a2406802427ff6acb7dec8cec961bcb4e7d5" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "a4d03266add9a1c8f12b5309612cbbf96e1291773c7bc4fb685bfdaf83b721c6" "b9a06c75084a7744b8a38cb48bc987de10d68f0317697ccbd894b2d0aca06d2b" "a19265ef7ecc16ac4579abb1635fd4e3e1185dcacbc01b7a43cf7ad107c27ced" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "ef1e992ef341e86397b39ee6b41c1368e1b33d45b0848feac6a8e8d5753daa67" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "eea01f540a0f3bc7c755410ea146943688c4e29bea74a29568635670ab22f9bc" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "12b204c8fcce23885ce58e1031a137c5a14461c6c7e1db81998222f8908006af" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "bea5fd3610ed135e6ecc35bf8a9c27277d50336455dbdd2969809f7d7c1f7d79" "bc4b650c41b16b98166b35da94b366c6a9e1e7883bbf4937c897fb7bd05aa619" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "599f1561d84229e02807c952919cd9b0fbaa97ace123851df84806b067666332" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "065efdd71e6d1502877fd5621b984cded01717930639ded0e569e1724d058af8" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
	(image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-color "#ECEFF1" t)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(foreground-color "#cccccc")
 '(frame-background-mode (quote dark))
 '(gnus-logo-colors (quote ("#528d8d" "#c0c0c0")))
 '(gnus-mode-line-image-cache
   (quote
	(image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")))
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-symbol-colors
   (--map
	(solarized-color-blend it "#fdf6e3" 0.25)
	(quote
	 ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
	(("#424748" . 0)
	 ("#63de5d" . 20)
	 ("#4BBEAE" . 30)
	 ("#1DB4D0" . 50)
	 ("#9A8F21" . 60)
	 ("#A75B00" . 70)
	 ("#F309DF" . 85)
	 ("#424748" . 100))))
 '(hl-bg-colors
   (quote
	("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
	("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-background-colors (quote ("#e8fce8" "#c1e7f8" "#f8e8e8")))
 '(hl-paren-colors (quote ("#40883f" "#0287c8" "#b85c57")))
 '(hl-sexp-background-color "#efebe9")
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#fd971f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#b6e63e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#525254"))
 '(magit-diff-use-overlays nil)
 '(notmuch-search-line-faces
   (quote
	(("unread" :foreground "#aeee00")
	 ("flagged" :foreground "#0a9dff")
	 ("deleted" :foreground "#ff2c4b" :bold t))))
 '(nrepl-message-colors
   (quote
	("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-src-tab-acts-natively t)
 '(package-selected-packages
   (quote
	(ido-completing-read+ ido-reading-complete+ slime guix geiser expand-region multiple-cursors base16-theme grayscale-theme solarized-theme kaolin-themes challenger-deep-theme doom-themes nord-theme alect-themes gruvbox-theme ujelly-theme moe-theme darktooth-theme plan9-theme minimal-theme ample-theme badwolf-theme monokai-theme monokai-alt-theme darkokai-theme labburn-theme flycheck stumpwm-mode smart-tabs-mode noctilux-theme zenburn-theme dracula-theme xresources-theme material-theme color-theme-sanityinc-tomorrow color-theme magit projectile linum-relative swiper popup-kill-ring symon symbon diminish spaceline company dashboard rainbow-delimiters sudo-edit rainbow-mode avy smex ido-vertical-mode org-bullets beacon spacemacs-theme which-key use-package)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(rainbow-identifiers-choose-face-function (quote rainbow-identifiers-cie-l*a*b*-choose-face) t)
 '(rainbow-identifiers-cie-l*a*b*-color-count 1024 t)
 '(rainbow-identifiers-cie-l*a*b*-lightness 80 t)
 '(rainbow-identifiers-cie-l*a*b*-saturation 25 t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#B71C1C")
	 (40 . "#FF5722")
	 (60 . "#FFA000")
	 (80 . "#558b2f")
	 (100 . "#00796b")
	 (120 . "#2196f3")
	 (140 . "#4527A0")
	 (160 . "#B71C1C")
	 (180 . "#FF5722")
	 (200 . "#FFA000")
	 (220 . "#558b2f")
	 (240 . "#00796b")
	 (260 . "#2196f3")
	 (280 . "#4527A0")
	 (300 . "#B71C1C")
	 (320 . "#FF5722")
	 (340 . "#FFA000")
	 (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff"))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))
