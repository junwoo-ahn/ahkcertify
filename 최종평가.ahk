#Include <FindText>
#Include testQA.ahk

global vMiddleTestID := "중간평가.txt"
global vLastTestID := "최종평가.txt"
global dirPath := "C:\Users\user\Downloads\"
global dirImgPath := "C:\Users\user\Downloads\image\"
global dirTestPath := "C:\Users\user\Downloads\평가문제\"
global lecList := ["직무-스마트워크.png", "직무-구해줘.png", "직무-디지털트랜스.png", "직무-평범한회사.png", "직무-헬스케어.png", "직무-주거서비스.png", "직무-X와MZ.png", "직무-기업의성공.png", "직무-디지털융합의중심.png", "직무-비대면시대.png"]
global deviceModel := ["SM-S908N", "SM-S901N", "SM-S906N", "SM-G977N", "SM-G973N", "SM-G975N", "SM-G970N", "SM-N971N", "SM-N976N", "SM-N970N", "SM-G965N", "SM-G965N", "SM-G960N", "SM-G965N", "SM-A908N", "SM-A805N", "SM-G9880", "SM-F721N", "SM-F700N", "SM-F711N", "SM-F731N", "SM-F946N", "SM-F936N", "SM-F926N", "SM-A245N", "SM-A346N", "SM-A546S", "SM-A536N", "SM-A136S"]
global folderName := ["스마트워크", "구해줘", "디지털트랜스", "평범한회사", "헬스케어", "주거서비스", "x와mz", "기업의성공", "디지털융합", "비대면시대"]
global CLICKPOINT := 20 ; default 20 평가 이미지들은 크기가 작아서 20포인트로 설정하면 잘못된 곳에 클릭이 됨.
global answerList := ["정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답"]
global lecQuestion := []
global lecAnswer := []
global wrongAnswer := []
global ansIndex := 1
global qPositionX := 0
global qPositionY := 0
global testType := false ; false : 중간평가, true : 최종평가
global Text1:="|<>*207$17.000000000000600w00M00k01U0300600A00Mk00000000000000001" ; 1번
global Text2:="|<>*151$17.000000000000C00W00400800U0200800U01wE00000000000000001" ; 2번
global Text3:="|<>*149$17.000000000000000w00400800E0700100200403kU00000000000001" ; 3번
global Text4:="|<>*177$17.000000000000000600Q00c02E08U0F01z004008U00000000000001" ; 4번
global Text1_1:="|<>*185$13.0000000M0Q020100U0E080402600000000001"
global Text2_1:="|<>*166$13.000000000S0900E0E080808080Dm000000001"
global Text3_1:="|<>*165$13.0000001s0601010300M04060y800000000001"
global Text4_1:="|<>*162$13.00000004060500U2E281y0201400000000001"
global QText := [["|<>*178$71.00000000000000000000000000000000000003zw00PU000007zs00r000000A0kTli01U000M1UzXQ070000k3036s0S0001zy0CBk0w0003zw0MPU0M0000001rr00k0000003ji01U003zzwDXQ030007zzsvas060000303Xhk0A000060C2PU0M0006A0M0r00k000AM001i01U000M0003Q030000k0006s060001zz00Bk000003zy003U000000000000000000000000000000000000001","|<>*177$71.00000000000000000000000000000000000000000000000007zk01a000000Tzk03A000000s3Vz6M030001k73zAk0C0003UC0ANU0w0007zw0Mn03M0007zk1la00k0000003DA01U000000DSM03000DzzkyAk06000TzzXiNU0A0000C0CCn00M0000Q0sBa00k000Ms0U3A01U000lk006M030001U000Ak0600030000NU0A0007zw00n000000Dzs0060000000000000000000000000001"],["|<>*178$71.0000000000000000000000000000000000000TzU03Q000000zz006s000001U63yBk0y00030A7wPU3y00060M0Mr04C000Dzk1li00A000TzU33Q00M000000Cys01k000000Rxk03000TzzVwPU0C000zzz7Qr00s0000M0QRi01U0000k1kHQ060000lU306s0M0001X000Bk1k00030000PU7z00060000r0Dy000Dzs01i000000Tzk00Q0000000000000000000000000000000000000001","|<>*177$71.00000000000000000000000003zs00n000000Dzs01a000000Q1kzXA0DU000s3VzaM0zk001k706Ak1XU003zy0ANU030003zs0sn0060000001ba00A0000007jA00s007zzsT6M01U00DzzlrAk0600007077NU0Q0000C0Q6n01k000AQ0E1a030000Ms003A0A0000k0006M0zs001U000Ak1zk003zy00NU000007zw0030000000000000000000000000000000000000000000000000001"],["|<>*177$71.0000000000000000000000000000000000000Tz006M000001zz00Ak000003UC7wNU0y00070QDwn07y000C0s0la0AC000Tzk1XA00A000Tz076M00s000000Awk03U000000xtU0y000zzz3sn01w001zzyCta00Q0000s0svA00Q0001k3UqM00M001XU20Ak01k0037000NU2300060000n07y000A0001a07k000Tzk03A000000zzU00M0000000000000000000000000000000000000001","|<>*178$71.0000000000000000000000000000000000000TzU03Q000000zz006s000001U63yBk0y00030A7wPU3z00060M0Mr04C000Dzk1li00A000TzU33Q00M000000Cys01k000000Rxk0z000TzzVwPU1y000zzz7Qr00C0000M0QRi00A0000k1kHQ00M000lU306s00k001X000Bk33U0030000PU7y00060000r07s000Dzs01i000000Tzk00Q0000000000000000000000000000000000000001"],["|<>*177$71.0000000000000000000000000000000000000DzU03A000000zzU06M000001k73yAk03U003UC7yNU0700070Q0Mn00S000Dzs0la01g000DzU3XA03M0000006SM0Ak000000Swk0FU00TzzVwNU1X000zzz7Qn0660000Q0QRa0AA0000s1kPA0zy000lk106M1zw001XU00Ak01U0030000NU0300060000n006000Dzs01a000000Tzk00A0000000000000000000000000000000000000001","|<>*177$71.0000000000000000000000000000000000000Dzk01i000000TzU03Q000000k31z6s01U001U63yBk0700030A0APU0C0007zs0kr00w000Dzk1Vi03M0000007TQ04k000000Cys0NU00DzzkyBk1X000TzzXiPU360000A0CCr0AA0000M0s9i0Ty000Mk1U3Q1zw000lU006s01U001U000Bk0300030000PU060007zw00r000000Dzs00C0000000000000000000000000000000000000001"],["|<>*177$71.00000000000000000000000000000000000007zk01a000000Tzk03A000000s3Vz6M0Ts001k73zAk0zk003UC0ANU1U0007zw0Mn0300007zk1la0600000003DA0Tk000000DSM0zk00DzzkyAk1Vk00TzzXiNU01U000C0CCn0030000Q0sBa006000Ms0U3A00A000lk006M0ks001U000Ak1zU0030000NU1w0007zw00n000000Dzs0060000000000000000000000000000000000000001","|<>*178$71.0000000000000000000000000000000000000Dzk01i000000TzU03Q000000k31z6s0zk001U63yBk1zU0030A0APU300007zs0sr060000Dzk1Vi0A00000007TQ0TU000000Cys0zk00DzzkyBk1XU00TzzXiPU03U000A0CCr0070000M0s9i00C000Mk1U3Q00M000lU006s0Vk001U000Bk1z00030000PU1w0007zw00r000000Dzs00C0000000000000000000000000000000000000001"],["|<>*177$71.0000000000000000000000000000000000000Tz006M000001zz00Ak000003UC7wNU0DU0070QDwn01z000C0s0la070000Tzk1XA0Q0000Tz076M0k0000000Awk1j0000000xtU3z000zzz3sn077001zzyCta0A60000s0svA0MC0001k3UqM0kM001XU20Ak1Uk0037000NU3XU0060000n03y000A0001a03s000Tzk03A000000zzU00M0000000000000000000000000000000000000001","|<>*178$71.00000000000000000000000000000000000007zs00r000000Dzk01i000000M1UzXQ03s000k31z6s0Tk001U606Bk0s0003zw0QPU3U0007zs0kr0600000003ji0Rk0000007TQ0zs007zzsT6s1sk00DzzlrBk3Uk0006077PU61U000A0Q4r0C3000AM0k1i0A6000Mk003Q0QM000k0006s0Tk001U000Bk0S0003zy00PU000007zw0070000000000000000000000000000000000000001"],["|<>*177$71.0000000000000000000000000000000000000DzU03A000000zzU06M000001k73yAk1zk003UC7yNU3zU0070Q0Mn007000Dzs0la00A000DzU3XA00s0000006SM01U000000Swk03000TzzVwNU0A000zzz7Qn00M0000Q0QRa01k0000s1kPA030000lk106M060001XU00Ak0M00030000NU0k00060000n03U000Dzs01a000000Tzk00A0000000000000000000000000000000000000001","|<>*178$71.0000000000000000000000000000000000000Dzk01i000000TzU03Q000000k31z6s1zs001U63yBk3zU0030A0APU030007zs0sr00C000Dzk1Vi00M0000007TQ01k000000Cys03000DzzkyBk06000TzzXiPU0Q0000A0CCr00k0000M0s9i03U000Mk1U3Q060000lU006s0A0001U000Bk0s00030000PU1U0007zw00r000000Dzs00C0000000000000000000000000000000000000001"],["|<>*177$71.0000000000000000000000000000000000000Tz006M000001zz00Ak000003UC7wNU0y00070QDwn03y000C0s0la0CC000Tzk1XA0MA000Tz076M0kM000000Awk0vU000000xtU0y000zzz3sn01w001zzyCta0CC0000s0svA0MA0001k3UqM1kQ001XU20Ak1Us0037000NU3XU0060000n03z000A0001a03s000Tzk03A000000zzU00M0000000000000000000000000000000000000001","|<>*178$71.00000000000000000000000000000000000007zs00r000000Dzk01i000000M1UzXQ07k000k31z6s0zk001U606Bk1VU003zw0QPU73U007zs0kr0660000003ji0CQ0000007TQ0Dk007zzsT6s0TU00DzzlrBk1nU0006077PU73U000A0Q4r0A3000AM0k1i0M6000Mk003Q0sQ000k0006s0zk001U000Bk0S0003zy00PU000007zw0070000000000000000000000000000000000000001"],["|<>*178$71.0000000000000000000000000000000000000TzU03Q000000zz006s000001U63yBk0S00030A7wPU3y00060M0Mr06C000Dzk1li0QA000TzU33Q0kA000000Cys1UM000000Rxk3Vk00TzzVwPU33U00zzz7Qr07z0000M0QRi03y0000k1kHQ00M000lU306s00k001X000Bk03U0030000PU3y00060000r07k000Dzs01i000000Tzk00Q0000000000000000000000000000000000000001","|<>*177$71.00000000000000000000000007zk01a000000Tzk03A000000s3Vz6M0DU001k73zAk0zU003UC0ANU3XU007zw0Mn0630007zk1la0A60000003DA0MA000000DSM0kM00DzzkyAk1lk00TzzXiNU1zU000C0CCn01v0000Q0sBa006000Ms0U3A00Q000lk006M01k001U000Ak1z00030000NU3w0007zw00n000000Dzs0060000000000000000000000000000000000000000000000000001"],["|<>*178$71.000000000000000000000000000000000000Dzk01i000000TzU03Q000000k31z6s060D01U63yBk0Q0z030A0APU1s3b07zs0sr03k660Dzk1Vi01UQ600007TQ030kA0000Cys061UMDzzkyBk0A30kTzzXiPU0M61U0A0CCr00kA300M0s9i01UQ60Mk1U3Q030MM0lU006s060tk1U000Bk0A0z030000PU0M0w07zw00r000000Dzs00C00000000000000000000000000000000000000001","|<>*177$71.0000000000000000000000003zs00n000000Dzs01a000000Q1kzXA01U7k0s3VzaM070Tk1k706Ak0S1lk3zy0ANU1g31U3zs0sn00M6300001ba00kA600007jA01UMA7zzsT6M030kQDzzlrAk061Us07077NU0A31U0C0Q6n00M630AQ0E1a00kA60Ms003A01UQQ0k0006M030Tk1U000Ak060T03zy00NU000007zw00300000000000000000000000000000000000000000000000000001"],["|<>*179$71.0000000000000000000000000000000000007zs00r000000Dzk01i000000M1UzXQ030300k31z6s0C0C01U606Bk0w0w03zw0QPU1s1s07zs0kr00k0k00003ji01U1U00007TQ030307zzsT6s06060DzzlrBk0A0A006077PU0M0M00A0Q4r00k0k0AM0k1i01U1U0Mk003Q030300k0006s060601U000Bk0A0A03zy00PU000007zw00700000000000000000000000000000000000000001"],["|<>*178$71.0000000000000000000000000000000000007zs00r000000Dzk01i000000M1UzXQ030DU0k31z6s0C0zU1U606Bk0w13U3zw0QPU1s0307zs0kr00k0600003ji01U0Q00007TQ0300k7zzsT6s0603UDzzlrBk0A0C006077PU0M0M00A0Q4r00k1U0AM0k1i01U600Mk003Q030Q00k0006s061zk1U000Bk0A3zU3zy00PU000007zw00700000000000000000000000000000000000000001"],["|<>*178$71.0000000000000000000000000000000000007zs00r000000Dzk01i000000M1UzXQ030DU0k31z6s0C0zk1U606Bk0w13U3zw0QPU1s0307zs0kr00k0600003ji01U0Q00007TQ030Dk7zzsT6s060TUDzzlrBk0A03U06077PU0M0300A0Q4r00k060AM0k1i01U0A0Mk003Q030ks0k0006s061zU1U000Bk0A1y03zy00PU000007zw00700000000000000000000000000000000000000001"],["|<>*178$71.0000000000000000000000000000000000007zs00r000000Dzk01i000000M1UzXQ0300k0k31z6s0C03U1U606Bk0w0703zw0QPU1s0S07zs0kr00k1g00003ji01U2M00007TQ030Ak7zzsT6s060lUDzzlrBk0A1X006077PU0M6600A0Q4r00kDz0AM0k1i01Uzy0Mk003Q0300k0k0006s0601U1U000Bk0A0303zy00PU000007zw00700000000000000000000000000000000000000001"],["|<>*178$71.0000000000000000000000000000000000007zs00r000000Dzk01i000000M1UzXQ030Ts0k31z6s0C0zk1U606Bk0w1U03zw0QPU1s3007zs0kr00k6000003ji01UDk00007TQ030Ts7zzsT6s060lkDzzlrBk0A01k06077PU0M03U0A0Q4r00k070AM0k1i01U0A0Mk003Q030Es0k0006s060zU1U000Bk0A0y03zy00PU000007zw00700000000000000000000000000000000000000001"],["|<>*178$71.000000000000000000000000000000000000Dzk01i000000TzU03Q000000k31z6s0607k1U63yBk0Q0zU30A0APU1s1k07zs0sr03k700Dzk1Vi01UA000007TQ030vU0000Cys061zkDzzkyBk0A3lUTzzXiPU0M71U0A0CCr00kA300M0s9i01UQ60Mk1U3Q030MA0lU006s060sk1U000Bk0A0zU30000PU0M0w07zw00r000000Dzs00C00000000000000000000000000000000000000001"],["|<>*178$71.000000000000000000000000000000000000Dzk01i000000TzU03Q000000k31z6s061zs1U63yBk0Q3zU30A0APU1s0307zs0sr03k0C0Dzk1Vi01U0M00007TQ0301k0000Cys06030DzzkyBk0A060TzzXiPU0M0Q00A0CCr00k0k00M0s9i01U3U0Mk1U3Q030600lU006s060A01U000Bk0A0s030000PU0M1U07zw00r000000Dzs00C00000000000000000000000000000000000000001"],["|<>*178$71.000000000000000000000000000000000000Dzk01i000000TzU03Q000000k31z6s060DU1U63yBk0Q1zU30A0APU1s3307zs0sr03kC70Dzk1Vi01UAA00007TQ030Qs0000Cys060TUDzzkyBk0A0z0TzzXiPU0M3b00A0CCr00kC700M0s9i01UM60Mk1U3Q030kA0lU006s061ks1U000Bk0A1zU30000PU0M0w07zw00r000000Dzs00C00000000000000000000000000000000000000001"],["|<>*178$71.0000000000000000000000007zs00r000000Dzk01i000000M1UzXQ0307U0k31z6s0C0zU1U606Bk0w1XU3zw0QPU1s7307zs0kr00kA300003ji01UM600007TQ030sQ7zzsT6s060ksDzzlrBk0A1zk06077PU0M0zU0A0Q4r00k060AM0k1i01U0A0Mk003Q0300s0k0006s060zU1U000Bk0A1w03zy00PU000007zw00700000000000000000000000000000000000000000000000000001"],["|<>*177$71.000000000000000000000000000000000000000000000000TzU03Q000000zz006s000001U63yBk0y0S030A7wPU3y1y060M0Mr04C7C0Dzk1Vi00AAA0TzU33Q00MsA0000Cys01lUM0000Rxk0330kTzzVwPU0C61Uzzz7Qr00sA300M0QRi01UM600k1kHQ060sA0lU306s0M0kk1X000Bk1k1nU30000PU7z1y060000r0Dy1s0Dzs01i000000Tzk00Q00000000000000000000000000001"]]

FileEncoding, UTF-8

Gui, Add, Text, x200 y20 w180 h30,
Gui, Add, Button, x10 y10 w180 h30, 로그인후보기
Gui, Add, Text, x200 y60 w180 h30, 최종평가.txt
Gui, Add, Button, x10 y50 w180 h30, 최종평가테스트
Gui, Add, Text, x200 y90 w180 h30, ver. 1212.15
Gui, Show, x1000 y400 w300 h110, PC로 보기
return

compareQuestion(qSource, qTarget, len)
{
	StringReplace, targetVar, qTarget, `r`n, , All
	logapp(targetVar)

	Loop, % len
	{
		tempVar := lecQuestion[A_Index]
		StringReplace, sourceVar, tempVar, `r`n, , All

		str := % "source = " sourceVar "-compareQuestion"
		logapp(str)

		if(InStr(sourceVar, targetVar))
		{
			return lecAnswer[A_Index]
		}
	}

	return false
}

findQuestionText(index)
{
	str := % "index = " index "-findQuestionText"
	logapp(str)

	CoordMode mouse, screen

	loop, % QText[index].length()
	{
		;logapp(QText[index][A_Index])
		if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, QText[index][A_Index]))
		{
			Clipboard := ""
			logapp(ok[1][1])
			logapp(ok[1][2])
			qPositionX := ok[1][1]
			qPositionY := ok[1][2]
			sleep 1000
			Mouseclick, left, ok[1][1], ok[1][2]
			sleep 1000
			Mouseclick, left, ok[1][1], ok[1][2]+60, 1, 10, D
			sleep 100
			Mouseclick, left, ok[1][1]+952, ok[1][2]+70, 1, 10, U
			sleep 1000
			send, ^{c}
			str := % "문제 " index "번 찾았음-findQuestionText"
			logapp(str)
			return true
		}
	}

	str := "문제 " %index% "번 못찾음-findQuestionText"
	endapp(str)
}

; 문제 블록지정 해서 찾기
findQuestion(imgFile)
{
	MouseClick, L, 10, 120

	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 %dirImgPath%%imgFile%

	CoordMode mouse, screen

	sleep 1000
	Mouseclick, left, FoundX, FoundY
	sleep 1000
	Mouseclick, left, FoundX, FoundY+60, 1, 10, D
	Mouseclick, left, FoundX+952, FoundY+60, 1, 10, U
	sleep 1000
	send, ^{c}

	if(ErrorLevel = 0)
	{
		qPositionX := FoundX
		qPositionY := FoundY
		str := % FoundX ", " FoundY imgFile " 이미지 찾음 (findImg)"
		logapp(str)
		return true
	}
	else
	{
		str := % imgFile " 이미지 못찾음. 한번더 검색 (findImg)"
		logapp(str)

		StringReplace, str_1, imgFile, .bmp, _1.bmp
		;MsgBox, % str_1

		CoordMode pixel, screen

		ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 %dirImgPath%%str_1%

		CoordMode mouse, screen

		sleep 1000
		Mouseclick, left, FoundX, FoundY
		sleep 1000
		Mouseclick, left, FoundX, FoundY+60, 1, 10, D
		Mouseclick, left, FoundX+952, FoundY+60, 1, 10, U
		sleep 1000
		send, ^{c}

		if(ErrorLevel = 0)
		{
			qPositionX := FoundX
			qPositionY := FoundY
			str := % imgFile " 이미지 찾음 (findImg)"
			return true
		}
		else
		{
			str := % imgFile " 이미지 못찾음 (findImg)"
			return false
		}
	}
}

clickNumber(answer)
{
	str := % answer "번 클릭"
	if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text1))
	{
		logapp(str)
		FindText().Click(ok[index].x, ok[index].y, "L")
	}
	else if(ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text1_1))
	{
		logapp("1_1번 클릭")
		FindText().Click(ok[index].x, ok[index].y, "L")
	}
	else
	{

		logapp("1번 버튼을 못찾음")
	}


}

clickAnswer(rightAnswer, index, verify)
{
	QText1 := ["|<>*178$19.0000000000000001060U70M0UA0E6083041U20U10E0V0000000000000000E", "|<>*183$19.0000000000000001030k2UM0EA086043021U10k0UE0EU000000000000000E"]
	QText2 := ["|<>*169$19.00000000000000010D0U4UM08A086043041U40U40E7t0000000000000000E", "|<>*162$19.0000000000000001070U4EM08A046043041U40U40E3sU000000000000000E"]
	QText3 := ["|<>*169$19.00000000000000010D0U0kM08A0860M3031U0UU0kE7l0000000000000000E", "|<>*160$19.00000000000000010D0U0EM08A0460Q3011U0UU0EE3kU000000000000000E"]
	QText4 := ["|<>*167$19.0000000000000001010U1UM1EA0860Y30W1UTUU0UE0F0000000000000000E", "|<>*176$19.000000000000000101UU1kM0cA0Y60W30F1UTkU0EE08U000000000000000E"]

	;index = 1
	testVar := % rightAnswer
	testVar--
	testVar++

	str := % "verify = " verify "-clickAnswer"
	logapp(str)

	if(verify = "오답")
	{
		if((testVar != 1) && (testVar != 2) && (testVar != 3) && (testVar != 4)) ; 주관식일 경우
		{}
		else
		{
			Loop, 10 ; 객관식 오답 입력
			{
				Random, rVar, 1, 4
				if(testVar != rVar)
				{
					testVar := rVar
					break
				}
			}
		}
	}

	str := % "testVar = " testVar "-clickAnswer"
	logapp(str)

	qtextNum := []

	if(testVar = 1)
		qtextNum := QText1
	else if(testVar = 2)
		qtextNum := QText2
	else if(testVar = 3)
		qtextNum := QText3
	else if(testVar = 4)
		qtextNum := QText4
	else ; 주관식
	{
		str := % "주관식(" rightAnswer "-clickAnswer"
		logapp(str)
		MouseClick, Left, qPositionX + 20, qPositionY + 20
		sleep 1000
		send, {Tab}
		sleep 1000

		if(verify = "오답") ; 오답
		{
			str := % "오답입력 [" wrongAnswer[rVar] "]"
			logapp(str)
			len := wrongAnswer.length()
			Random, rVar, 1, wrongAnswer.length()
			Clipboard := wrongAnswer[rVar]
			send, % Clipboard
			sleep, 1000
			return
		}
		else ; 정답
		{
			Clipboard := rightAnswer
			send, % Clipboard
			;send, % answer
			sleep, 1000
			return
		}
	}

	loop, % qtextNum.length()
	{
		if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, qtextNum[A_Index]))
		{
			logapp("답안 버튼 찾음-clickAnswer")
			FindText().Click(ok[index].x, ok[index].y, "L")
			break
		}
		else
			logapp("답안 버튼 못찾음-clickAnswer")
	}
}

research()
{
	sleep 2000
	; 설문 완료 되었는지 확인
	if (ok:=findImg("최종평가유의사항.png", true))
		return ; 설문 완료
	else
	{
		MouseClick WheelDown,,,4

		clickRBtn(0) ; ?? 이게 없으면 설문 1 클릭이 안됨. 이유 모름
		logapp("??번 설문 클릭 완료")
		sleep 1000
		clickRBtn(1) ; 설문 1 클릭
		logapp("1번 설문 클릭 완료")
		sleep 1000
		clickRBtn(2) ; 설문 2 클릭
		logapp("2번 설문 클릭 완료")
		sleep 1000
		clickRBtn(3) ; 설문 3 클릭
		logapp("3번 설문 클릭 완료")
		sleep 1000
		clickRBtn(4) ; 설문 4 클릭
		sleep 1000
		Send, {Tab}
		sleep 1000

		Send, .
		sleep 1000
		Send, {Tab}
		sleep 1000
		Send, .
		sleep 1000
		Send, {Tab}
		sleep 1000
		Send, {Space}
		sleep 5000
	}

}

clickRBtn(index)
{
	; 매우 그렇다 버튼 -> 수정
	TextRBtn1:="|<>*152$61.000000000000000000000000000000000000000000000000000w8T07wT4T8E4EE020W048284017r02414400W0U123Vw00FyE0l0E0008080EU/zs041k08S4200200Do02107zlz02010U00010100UE000D00U000000000000000000000000000000E"

	; 그렇다 버튼 -> 수정
	TextRBtn2:="|<>*154$61.000000000000000000000000000000000000000000000000000001z7l7m007U00U8U1002E00Fxk0U004008U80E004004TY0A00200202040020010Q02002000U03x00201zwTk0U03wU000E0F0000003k0800000000000000000000000000000000E"

	; 보통이다 버튼 -> 수정
	TextTBtn3:="|<>*154$61.0000000000000000000000000000000000000000000EEzUsXt1s088E0WF0U607wDsF8UE1022400YE810113y0G87300zU829420M023zt4W10401000QFyU60Tz7s080ES800400408k0001y020400000000000000000000000000000000000000000E"

	Random, rbtn, 1, 3

	if (rbtn = 1) ;  매우 그렇다 버튼 클릭
	{
		if (ok:=FindText(X, Y, 295-150000, 156-150000, 295+150000, 156+150000, 0, 0, TextRBtn1))
  			FindText().Click(ok[index].x, ok[index].y, "L")
  		else
  			endapp("매우 그렇다 버튼을 못찾음")

	}
	else if (rbtn = 2) ; 그렇다 버튼 클릭
	{
		if (ok:=FindText(X, Y, 282-150000, 191-150000, 282+150000, 191+150000, 0, 0, TextRBtn2))
  			FindText().Click(ok[index].x, ok[index].y, "L")
  		else
  			endapp("그렇다 버튼을 못찾음")

	}
	else if (rbtn = 3) ; 보통이다 버튼 클릭
	{
		if (ok:=FindText(X, Y, 291-150000, 224-150000, 291+150000, 224+150000, 0, 0, TextTBtn3))
  			FindText().Click(ok[index].x, ok[index].y, "L")
  		else
  			endapp("보통이다 버튼을 못찾음")
	}
	else
		endapp("라디오 버튼 인덱스 못찾음")
}

; kedu 로그아웃 버튼 클릭
logout()
{
	; 교육 다 들음 - 로그아웃
	MouseClick WheelUp,,,50
	sleep 1000

	; 로그아웃 버튼
	clickImg("로그아웃.png")

	waitLogo()

	clickImg("로고.png")

	sleep 4000

}

changeClickPoint(data)
{
	CLICKPOINT := data
}

qaListInit()
{
	answerList := ["정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답"]
	ansIndex := 1
	lecQuestion := []
	lecAnswer := []
	wrongAnswer := []

	; 오답리스트 읽기
	FileRead, testVar, % dirTestPath "오답리스트.txt"
	Loop, Parse, testVar, `n
		wrongAnswer.push(A_LoopField)
}

memuInit()
{
	; 미뮤 홈 버튼 클릭
	clickImg("미뮤홈버튼.png")
	sleep 500
	MouseMove, 281, 400
	sleep 1000

	; 미뮤 전체 앱 버튼 클릭
	clickImg("미뮤전체앱버튼.png")
	sleep 500
	MouseMove, 281, 400
	sleep 1000

	Loop, 10
	{
		MouseClick WheelUp,,,1
		sleep 500
	}

	sleep 1000

	; 미뮤 모두 지우기 버튼 클릭
	if(ok:=findImg("미뮤모두지우기.png", true))
	{}
	else
		clickImg("미뮤홈버튼.png")

	sleep 2000
}

waitLogo()
{
	Loop, 30
	{
		if (ok:=findImg("로고.png", false))
			return
		else
			sleep 1000
	}
	endapp("화면 로딩 시간초과")
}

clickOnemoreImg(imgFile)
{
	MouseMove, 10, 120

	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *60 %dirImgPath%%imgFile%

	CoordMode mouse, screen

	if(ErrorLevel = 0)
	{
		str := % imgFile " 이미지 찾음 (clickOnemoreImg)"
		logapp(str)

		MouseClick, Left, % FoundX+CLICKPOINT, FoundY+CLICKPOINT
		return true
	}
	else
	{
		str := % imgFile " 이미지 못찾음 (clickOnemoreImg)"
		endapp(str)
	}
}

clickImg(imgFile)
{
	MouseMove, 10, 120

	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 %dirImgPath%%imgFile%

	CoordMode mouse, screen

	if(ErrorLevel = 0)
	{
		str := % imgFile " 이미지 찾음 (clickImg)"
		logapp(str)

		MouseClick, Left, % FoundX+CLICKPOINT, FoundY+CLICKPOINT
	}
	else
		clickOnemoreImg(imgFile)

	return true
}

findImg(imgFile, isClick)
{
	MouseMove, 10, 120

	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 %dirImgPath%%imgFile%

	CoordMode mouse, screen

	if(ErrorLevel = 0)
	{
		str := % imgFile " 이미지 찾음 (findImg)"

		if (isClick = true)
			MouseClick, Left, % FoundX+20, FoundY+20

		logapp(str)
		return true
	}
	else
	{
		str := % imgFile " 이미지 못찾음 (findImg)"
		logapp(str)
		return false
	}
}

; kedu 로그인
loginKedu(keduID)
{
	sleep 1000
	WinActivate, 한국이러닝교육센터 - Chrome
	sleep 1000

	Loop, 2
	{
		checkPass = 1

		; 아이디 입력창 검색
		clickImg("아이디.png")

		RegEx := RegExReplace(keduID, "\D")

		sleep 500
		Send, % RegEx
		Send, {Tab}
		sleep 500

		if (A_Index = 1)
			Send, 1234 ; 로그인 비번 qwer1234{!}
		else
			Send, qwer1234{!} ; 로그인 비번 1234
		sleep 500
		Send, {Enter}

		; 로그인 버튼 클릭
		;clickImg("로그인.png")

		Sleep 1000
		Click 68,437
		sleep 1000
		waitLogo()

		; 로그인 확인
		if (ok:=findImg("개인정보변경.png", false))
		{
			; 비번 맞음
			logapp("비번 맞음")
			checkPass = 1
		}
		else
		{
			; 비번 틀림
			logapp("비번 틀림")
			checkPass = 0
			Sleep 500

			; 로고 클릭
			clickImg("로고.png")
			Sleep 1000
			waitLogo()
		}

		if (checkPass = 1)
			break ; 비번 맞음
		else
			continue
	}

	if (checkPass = 0)
		endapp("비번 1234, qwer1234! 둘 다 틀림")

	sleep 3000
	logapp(A_LoopField)

	; 내 강의실 클릭
	clickImg("내강의실.png")
	sleep 2000

}

setMemu(phoneNum)
{
	clickImg("미뮤설정.png")
	sleep 1000

	WinMove, MEmu,, 0,0,,
	sleep 500
	MouseClick, Left, 106, 193 ; 옵션 클릭
	sleep 500
	MouseClick, Left, 309, 111 ; 브랜드
	sleep 500
	Send, ^{a}
	sleep 500
	send, Samsung
	sleep 500
	Send, {Tab}
	sleep 500

	Random, dev, 1, deviceModel.length() ; 브랜드 무작위
	send, % deviceModel[dev]
	sleep 500
	Send, {Tab}
	sleep 100
	Send, {Tab}
	sleep 100
	Send, {Tab}
	sleep 500
	Send, % phoneNum[1] phoneNum[2] phoneNum[3]
	sleep 500
	MouseClick, Left, 473, 357 ; IMEI 랜덤
	sleep 500

	clickImg("미뮤설정확인.png")
	sleep 500

	clickImg("미뮤설정확인2.png")
	sleep 500

}

setMOTP(name, phoneNum)
{
	clickImg("미뮤MOTP아이콘.bmp")
	sleep 5000

	; MOTP 초기화 시작
	; MOTP 등록 초기화 버튼

	if(ok:=findImg("MOTP등록정보수정.bmp", true))
	{
		; 등록 초기화 시작
		sleep 1000

		; 등록 초기화 하시겠습니까? 확인 클릭 (작은 확인)
		clickImg("MOTP작은확인.bmp")
		sleep 1000

		; 초기화 되었습니다. 확인 클릭 (작은 확인)
		clickImg("MOTP작은확인3.bmp")
		sleep 1000
	}
	else
		logapp("MOTP 등록 초기화 버튼 못찾음, 이미 초기화 됨")

	sleep 1000

	; 개인정보수집 동의
	clickImg("MOTP동의.bmp")
	sleep 1000

	; MOTP 이용 주의사항
	clickImg("MOTP동의2.bmp")
	sleep 1000

	; 개인정보수집 동의함 라디오 버튼
	clickImg("MOTP동의함.bmp")
	sleep 1000

	Loop, 10
		MouseClick WheelDown,,,1

	sleep 1000
	MouseClick, Left, 281, 375
	sleep 1000

	; 입력 오류
	send, 1234
	sleep 500
	Send, ^{a}
	sleep 500
	Send, {Backspace}
	sleep 300
	Send, {Backspace}
	sleep 300
	Send, {Backspace}
	sleep 300
	Send, {Backspace}
	sleep 500

	Send, % name
	sleep 500
	send, {Tab}
	sleep 500
	send, {Tab}
	sleep 500
	send, % phoneNum[2]
	sleep 500
	send, {Tab}
	sleep 500
	send, % phoneNum[3]
	sleep 500
	send, {Tab}
	sleep 500
	send, 1
	sleep 700
	send, 1
	sleep 700
	send, 1
	sleep 700
	send, 1
	sleep 700
	send, 1
	sleep 700
	MouseClick, Left, 12, 364
	sleep 700

	; MOTP 입력 확인 (파랑색 확인 버튼)
	clickImg("MOTP파랑확인.bmp")
	sleep 1000

	; 승인 요청하시겠습니까? (작은 확인 버튼)
	clickImg("MOTP작은확인2.bmp")
	sleep 1000

	; 승인이 완료되었습니다. 확인 클릭 (작은 확인)
	clickImg("MOTP작은확인3.bmp")
	sleep 1000

}

; 휴대폰 번호 파싱
transNum(fullNum)
{
	num := []

	Loop, Parse, fullNum, "-"
		num[A_Index] := A_LoopField

	return num

}

checkIME()
{
	WinGetActiveTitle, ExplorerTitle
	ime_status := % IME_CHECK("A")
	if (ime_status = "0")
	{

	}
	else
	{
		Send, {vk15sc138}
	}
}

IME_CHECK(WinTitle)
{
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}

Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
if (DetectSave <> A_DetectHiddenWindows)
    DetectHiddenWindows,%DetectSave%
    return ErrorLevel
}

ImmGetDefaultIMEWnd(hWnd)
{
 return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}

logapp(err)
{
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] log`n, % dirPath "log.txt"
}

endapp(err)
{
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, % dirPath "log.txt"
	SoundPlay, *-1
	MsgBox, %err%
	ExitApp
}

; 최종평가 시작
lastTest()
{
	sleep 1000
	Run, "C:\Program Files\Microvirt\MEmu\MEmu.exe" MEmu ; 미뮤 실행
	sleep 10000

	Loop, 20
	{
		if(ok:=findImg("미뮤웨일아이콘.png", false))
			break
		sleep 1000
	}

	Sleep 1000
	WinActivate, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기)
	Sleep 1000
	WinMove, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기),, 0,0,,

	SetKeyDelay, 300

	checkIME()

	sleep 1000
	FileEncoding, UTF-8
	CoordMode, Mouse, Screen

	; 아이디 읽기
	FileRead, varfile, %dirPath%%vLastTestID%

	idinfo := []
	; 아이디.txt 파일 읽기, 아이디, 전화번호 구분, idinfo[1] = 이름, idinfo[2] = 아이디, idinfo[3] = 휴대폰번호
	Loop, Parse, varfile, " "
		idinfo[A_Index] := A_LoopField

	checkPass = 1

	if(!idinfo[1])
		return

	; 전화번호 파싱 -> phoneNum[1] = 010, phoneNum[2] = 두번째 폰번호, phoneNum[3] = 세번째 폰번호
	phoneNum := transNum(idinfo[3])

	idStr := % A_LoopField " 시작"
	logapp(idStr)

	clipboard =

	; 미뮤 설정 시작
	setMemu(phoneNum)

	; 미뮤 초기화
	memuInit()

	; MOTP 설정
	setMOTP(idinfo[1], phoneNum)

	; kedu 로그인
	loginKedu(idinfo[2])

	WinActivate, 한국이러닝교육센터 - Chrome

	; 강의 종류 만큼 루프
	Loop, % lecList.length()
	{
		sleep 2000

		lecIndex = % A_Index
		Loop, 10
		{
			if(ok:=findImg(lecList[lecIndex], true))
			{
				; 강의클릭 후 들어옴
				sleep 2000
				MouseClick WheelDown,,,5
				sleep 1000

				findBtn := false

				; 최종평가 응시하기 버튼 있는지 확인
				Loop, 33
				{
					if(ok:=findImg("최종평가평가응시버튼.bmp", true))
					{
						sleep 2000
						if(ok:=findImg("진도율부족.bmp", false))
						{
							sleep 1000
							clickImg("확인(인증).png")
							sleep 1000
							break
						}

						findBtn := true
						break
					}

					MouseClick WheelDown,,,1
					sleep 500
				}

				if(findBtn = false)
					break ; 중간평가 준비 되지 않았음

				sleep 3000
				motp := 1

				Loop, 2
				{
					; MOTP 인식
					WinActivate, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기)
					Sleep 1000
					WinMove, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기),, 0,0,,
					sleep 1000

					MouseClick, Left, 262, 575, 2 ; MOTP 클립보드에 복사
					sleep 2000

					MouseClick, Left, 947, 731, 2 ; 크롬 OTP번호란 클릭
					sleep 500
					send, ^{v}
					sleep 500
					send, {Tab}


					sleep 500
					send, {Tab}
					sleep 500
					Send, {Enter} ; 인증하기 클릭
					sleep 1000

					; 오류 확인
					if(ok:=findImg("MOTP오류확인.png", true))
					{
						; MOTP 틀림
						if (motp = 2)
						{
							; MOTP 2번 틀림
							endapp("MOTP 2번 틀림.  즉시 종료")
						}
						continue
					}
					else
						break ; MOTP 맞음
				}

				; 설문조사 (최종평가)
				research()

				Sleep 1000
				MouseClick WheelDown,,,12
				sleep 1000

				clickImg("위사항을.png")

				sleep 1000
				Send, {Tab}
				sleep 1000
				Send, {Space}
				sleep 3000

				; 평가 재응시 불가능 팝업창
				if (ok:=findImg("평가재응시.png", false))
				{
					clickImg("확인1.png")
					sleep 2000
				}
				else
					logapp("평가 재응시 불가능 팝업창 못찾음")

				sleep 5000
				MouseClick WheelDown,,,5
				sleep 1000

				; 최종평가 시작
				qaListInit()
				startTime := A_TickCount ; 시작시간 저장

				; 오답수, 오답문제 설정
				Random, wAnsNum, 1, 5
				str := "오답수 = " wAnsNum "-main"
				logapp(str)

				Loop, % wAnsNum
				{
					Random, wAns, 1, 20

					if(answerList[wAns] = "오답") ; 이미 오답설정이 되어 있는 경우
					{
						wAnsNum--
						continue
					}
					else
						answerList[wAns] := "오답"
				}

				FileRead, testVar, % dirTestPath folderName[lecIndex] "-최종평가.txt"

				Loop, Parse, testVar, `n
				{
					;StringReplace, newVar, A_LoopField, `r, , All

					if(mod(A_Index,2))
						lecQuestion.push(A_LoopField)
					else
						lecAnswer.push(A_LoopField)
				}

				; 최종평가 20문항 (가끔 21문항 짜리도 있음)
				qTotal := 20

				Loop, % qTotal
				{
					str := % "최종문제" A_Index ".bmp"

					;if(ok:=findQuestion(str))
					if(ok:=findQuestionText(A_Index))
					{
						if(ok:=compareQuestion(lecQuestion[A_Index], Clipboard, lecQuestion.Length()))
						{
							if(mod(A_Index,2)) ; 홀수
							{
								clickAnswer(ok, 1, answerList[ansIndex])
								sleep 2000
							}
							else ; 짝수
							{
								; 문제 풀이 후 다음문제 클릭
								clickAnswer(ok, 2, answerList[ansIndex])
								sleep 1000
								clickImg("다음문제.png")
								sleep 4000
								if(ok:=findImg("마지막문제확인.png", true))
								{
									sleep 1000
									break
								}
							}

							ansIndex++
							continue
						}
						else
						{
							str := % A_Index "번 문제 못찾음(신규문제)-main"
							logapp(str)
							break
						}
						sleep 500
					}
					else
					{
						str := % A_Index "번 문제번호 위치 못찾음-main"
						endapp(str)
					}
				}

				; 랜덤하기 대기 9분~11분
				endTime := A_TickCount - startTime
				Random, sleepTime, 540000, 700000

				waitTime := sleepTime - endTime

				Loop
				{
					if(waitTime > 0)
					{
						waitTime := waitTime - 10000
						leftTime := waitTime / 1000
						MsgBox,,, %leftTime%"초 남았음", 5
						sleep 10000
					}
					else
						break
				}

				clickImg("최종제출.png")

				sleep 4000

				; 최종 제출후 수정 안됨 확인
				if (ok:=findImg("최종제출후수정안됨.png", false))
				{
					; 최종 확인 버튼 클릭
					clickImg("확인2.png")
					sleep 2000

					clickImg("확인3.bmp")
					sleep 2000

				}

				break ; 평가 완료
			}
			else
				MouseClick WheelDown,,,1

			sleep 2000

		}

		; 탑으로 올라가서 로고 클릭 내강의실 클릭
		sleep 2000
		MouseClick WheelUp,,,50

		; 로고 클릭
		clickImg("로고.png")
		Sleep 2000
		waitLogo()

		; 내 강의실 클릭
		clickImg("내강의실.png")
		sleep 2000

	}

	logout()

}

; 중간부터 보기
logingTest()
{
	checkIME()

	sleep 1000
	FileEncoding, UTF-8
	CoordMode, Mouse, Screen

	WinActivate, 한국이러닝교육센터 - Chrome

	sleep 1000

	MouseClick WheelUp,,,30

	; 강의 종류 만큼 루프
	Loop, % lecList.length()
	{
		sleep 2000
		lecIndex = % A_Index
		Loop, 10
		{
			if(ok:=findImg(lecList[lecIndex], true))
			{
				; 강의클릭 후 들어옴
				sleep 2000
				MouseClick WheelDown,,,5
				sleep 1000

				findBtn := false

				if(ok:=findImg("최종평가응시완료.bmp", false)) ; 평가 완료되었는지 확인
					break

				; 최종평가 응시하기 버튼 있는지 확인
				Loop, 33
				{
					if(ok:=findImg("최종평가평가응시버튼.bmp", true))
					{
						sleep 2000
						if(ok:=findImg("진도율부족.bmp", false))
						{
							sleep 1000
							clickImg("확인(인증).png")
							sleep 1000
							break
						}

						findBtn := true
						break
					}

					MouseClick WheelDown,,,1
					sleep 500
				}

				if(findBtn = false)
					break ; 중간평가 준비 되지 않았음

				sleep 3000
				motp := 1

				Loop, 2
				{
					; MOTP 인식
					WinActivate, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기)
					Sleep 1000
					WinMove, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기),, 0,0,,
					sleep 1000

					MouseClick, Left, 262, 575, 2 ; MOTP 클립보드에 복사
					sleep 2000

					MouseClick, Left, 947, 731, 2 ; 크롬 OTP번호란 클릭
					sleep 500
					send, ^{v}
					sleep 500
					send, {Tab}


					sleep 500
					send, {Tab}
					sleep 500
					Send, {Enter} ; 인증하기 클릭
					sleep 1000

					; 오류 확인
					if(ok:=findImg("MOTP오류확인.png", true))
					{
						; MOTP 틀림
						if (motp = 2)
						{
							; MOTP 2번 틀림
							endapp("MOTP 2번 틀림.  즉시 종료")
						}
						continue
					}
					else
						break ; MOTP 맞음
				}

				; 설문조사 (최종평가)
				research()

				Sleep 1000
				MouseClick WheelDown,,,12
				sleep 1000

				clickImg("위사항을.png")

				sleep 1000
				Send, {Tab}
				sleep 1000
				Send, {Space}
				sleep 3000

				; 평가 재응시 불가능 팝업창
				if (ok:=findImg("평가재응시.png", false))
				{
					clickImg("확인1.png")
					sleep 2000
				}
				else
					logapp("평가 재응시 불가능 팝업창 못찾음")

				sleep 5000
				MouseClick WheelDown,,,5
				sleep 1000

				; 최종평가 시작
				qaListInit()
				startTime := A_TickCount ; 시작시간 저장

				; 오답수, 오답문제 설정
				Random, wAnsNum, 1, 5

				str := "오답수 = " wAnsNum "-main"
				logapp(str)

				Loop, % wAnsNum
				{
					Random, wAns, 1, 20

					if(answerList[wAns] = "오답") ; 이미 오답설정이 되어 있는 경우
					{
						wAnsNum--
						continue
					}
					else
						answerList[wAns] := "오답"
				}

				FileRead, testVar, % dirTestPath folderName[lecIndex] "-최종평가.txt"

				Loop, Parse, testVar, `n
				{
					;StringReplace, newVar, A_LoopField, `r, , All

					if(mod(A_Index,2))
						lecQuestion.push(A_LoopField)
					else
						lecAnswer.push(A_LoopField)
				}

				; 최종평가 20문항 (가끔 21문항 짜리도 있음)
				qTotal := 20

				Loop, % qTotal
				{
					sleep 2000

					str := % "최종문제" A_Index ".bmp"

					;if(ok:=findQuestion(str))
					if(ok:=findQuestionText(A_Index))
					{
						if(ok:=compareQuestion(lecQuestion[A_Index], Clipboard, lecQuestion.Length()))
						{
							;MouseClick WheelDown,,,5

							if(mod(A_Index,2)) ; 홀수
							{
								clickAnswer(ok, 1, answerList[ansIndex])
								sleep 2000
							}
							else ; 짝수
							{
								; 문제 풀이 후 다음문제 클릭
								clickAnswer(ok, 2, answerList[ansIndex])
								sleep 1000
								clickImg("다음문제.png")
								sleep 4000
								if(ok:=findImg("마지막문제확인.png", true))
								{
									sleep 1000
									break
								}
							}

							;MouseClick WheelUp,,,5
							ansIndex++
							continue
						}
						else
						{
							str := % A_Index "번 문제 못찾음(신규문제)-main"
							logapp(str)
							break
						}
						sleep 500
					}
					else
					{
						str := % A_Index "번 문제번호 위치 못찾음-main"
						endapp(str)
					}
				}

				; 랜덤하기 대기 9분~11분
				endTime := A_TickCount - startTime
				Random, sleepTime, 540000, 700000

				waitTime := sleepTime - endTime

				Loop
				{
					if(waitTime > 0)
					{
						waitTime := waitTime - 10000
						leftTime := waitTime / 1000
						MsgBox,,, %leftTime%"초 남았음", 5
						sleep 10000
					}
					else
						break
				}

				clickImg("최종제출.png")

				sleep 4000

				; 최종 제출후 수정 안됨 확인
				if (ok:=findImg("최종제출후수정안됨.png", false))
				{
					; 최종 확인 버튼 클릭
					clickImg("확인2.png")
					sleep 2000

					clickImg("확인3.bmp")
					sleep 2000

				}

				break ; 평가 완료
			}
			else
				MouseClick WheelDown,,,1

			sleep 2000

		}

		; 탑으로 올라가서 로고 클릭 내강의실 클릭
		sleep 2000
		MouseClick WheelUp,,,50

		; 로고 클릭
		clickImg("로고.png")
		Sleep 2000
		waitLogo()

		; 내 강의실 클릭
		clickImg("내강의실.png")
		sleep 2000

	}

	logout()

}

; 중간평가 버튼
Button로그인후보기:
{
	Gui, Minimize
	Clipboard :=

	logapp("시작")
	logingTest()
	endapp("테스트 종료")

}

; 최종평가 버튼
Button최종평가테스트:
{
	Gui, Minimize
	Clipboard :=

	logapp("시작")
	lastTest()
	endapp("테스트 종료")

}


GuiClose:
ExitApp

Esc::
MsgBox, 프로그램 종료
ExitApp
