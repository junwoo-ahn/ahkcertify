#include <Vis2>
#Include <FindText>

global vJikmuViewID := "직무아이디.txt"

; LDPlayer 설정버튼
global TextLDSet:="|<>*131$21.zzzzzzzy07zjzTxzvzTzjvzxyzzrrtyxy7vjkzSzDrrzyzTzjvzxzjzTxzvzk0zzzzzzzzzzzw"

; LDPlayer 디바이스 버튼
global TextDevice:="|<>*158$81.000000000000000000000000000000000000000000000000000000000000000000000008080800000003t4N1l0M000000k8X8H83000000614N690M000000k8z8V87U00000614No91a000000k8X8l8kA00000614N6N00000000zcz8S80000000010101000000000808080000000010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

; LDPlayer IMER 설정 랜덤
global TextRandom:="|<>*183$51.0000000000000000000000000000040A00007pbtU00006gkA00000paDU0000ywkA000065bxU0000zgSA000005Vz000008gDw00001011U0000808A00001zVzU000000000000000000000000000000000004"

; LDPlayer 설정 저장 버튼
global TextSave:="|<>*176$51.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzTzjzzzy0PUBzzzzyTTbjzzzznvwwTzzzySTbjzzzzn3vRzzzzyTQwjzzzzhvzxzzzztbTUTzzzySPttzzzzzzTTbzzzzzvvxzzzzzzTUTzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; Kedu 로그인 버튼
global TextLogin:="|<>*115$121.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0zzzzzzzzzzzzzzzzzzw07zzzzzzzzzzzzz7zzzw01zzzz007zzzzkzXzzzwDsTzzzU03w00TU7lzzzyDyDzzzk01y00DU1szzzyDzXzzzzzszzz7lsQTzzz7zlzzzzzwTzzXlyCDzzzXzszzzy00Dzzlsz77zzznzyTzzz007zzswTXXzzztzzDzzzXzzzzwT7llzzzwzzbzzzlzzzzyDUVszzzyTznzzzszzzzz7s0wTzzk0007zzw00Tzzby1yDzzs0003zzy00DzzXzzz7zzw0001zzzz7zzzlznzXzzy0000zzzzXzzzszlzlzzz0000TzzzlzzzzzszszzzU0E0Dzz000A001wTzzzzk0y07zzU006000yDzzzzs0T03zzs003zzzz007zzw0DU1zzzzzzzzzzU01zzy03U0zzzzzzzzzzs01zzz01k0TzzzzzzzzzzzzzzzU0s0Dzzzzzzzzzzzzzzzk0Q07zzzzzzzzzzzzzzzs0003zzzzzzzzzzzzzzzw0001zzzzzzzzzzzzzzzy0000zzzzzzzzzzzzzzzz0000Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 트리거 8차시 1강
global Text1lec:="|<>*127$61.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzDnzzyTzzzzbtztzDzz3znwzwzbzy0y06TyTnzzDD03DzDtzzDbyTbzbwzzbnzDnznyTzntzbtztzDzwsznw7wTbzz1zlyTwjnzz0TuTDwntzz7btbbyQwzzbttnnySCTznwswNwTXDztwMzAzTzbzwSTzyTzznzz0TzzDzztzzsTzzbzzwzzzzzznzzyTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzztzzzzzzzw0Qzzzzzzvy0CTzzzzzlzzbDzzzzzUzzrbzzzzzaTznkTzzzzzDzntzzzzzzbzlwzzzzzznzlyTzzzzztzXzDzzzzzwz3zbzzzzzyTzzvzzzzzzDzU7zzzzzzbzXkzzzzzznzbyTzzzzztznzjzzzzzwztzbzzzzzyTwTXzzzzzzzz03zzzzzzzzwDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"

; MOTP 어플 아이콘
global TextMOTP:="|<>*162$51.zzzzzzzzzzs0000Tzzk00000Tzw000000zy0000003zU000000Dw0000000z00000003k0000000S00000001k0000000C00000001U0000000A00000001U0000000A001yDxy1U00QMQAsA3vn3VVX1UNaMQAAMA3An3VVz1UNaMQADkA3An31VU1UNaQsAA0A3Aly1VU1U0000000A00000001U0000000A0prTuRQ1U7ivxHfUA0zLOntQ1U42nD2/UA00000001U0000000A00000001U00+eg00A003I7001U00/2c00A001JYU01U0000000A00000001k0000000C00000001k0000000C00000003s0000000TU0000007y0000001zs000000TzU000007zz000003zzzU0007zw"

; 웨일 어플 아이콘
global TextWhale:="|<>*123$51.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzrzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkDzzxzzzk0zzzjzzs07zztzzw00TzzDzz003zzlzzk00Tzy7zs003zzkTy000Dzy1z0001zzk1UE00Dzy003001zzk00E00Dzy000001zzk00000Dzy000003zzk00000Tzz000003zzs00000TzzU00007zzy00000zzzk0000Dzzzs0003zzzz0000zzzzk000Dzzzw0003zzzz0000zzzzk000Tzzzs3k0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; LDPlayer 뒤로가기 버튼
global TextLDBack:="|<>*114$31.zzzzzzzzzzzzzzzzzzzzzzzzzzzzz7zzzy/zzzyRzzzwyzzzwzTzztzjzzlzrzzvzvzztzxzzyDyzzznzTzzyTjzzzbrzzzwvzzzz5zzzzszzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"

; LDPlayer 홈 버튼
global TextLDHome:="|<>*106$31.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkDzzzXlzzzbyTzzbzbzzrzvzznzwzzvzzTzxzzjzyzzrzzTzvzzbztzzvzxzzwzwzzzDwzzzlszzzy1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"

; LDPlayer 전체앱 버튼
global TextLDAll:="|<>*139$31.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs01zzxzyzzyzzTzzTzjzzjzrzzrzvzzvzxzzxzyzzyzzTzzTzjzzjzrzzrzvzzvzxzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"

; LDPlayer 모두 지우기 버튼
global TextLDDeleteAll:="|<>*138$141.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzxzzzzzzzzzzk0DzzznzU7zzzjzzzzzzk03y00zw06Ts8Ds0xzzzzzzyDyTnzzzU0nyTsz07jzzzzzznznyTzzzvyTXzbzwxzzzzzzyTyTnzzzzTnwzwzzbjzzzzzznznyTzzztyTnzbztxzzzzzzyTyTnzzzyDnyDlzzDjzzzzzznzny00zzlyTs0TztxzzzzzzyTyTzzzzyDnzsTzyTjzzzzzzk03zzzzzUyTzzzzXxzzzzzzzyTzzzzzwbnzzzzwzjzzzzzzznzk00DzCSS001yDxzzzzzzzyTzzbzzltnzwzzXzjzzzzzzznzzwzzwTWTzbzkzxzzzzzzzyTzzbzzbynzwzyTzjzzzzzz000zwzzzzyTzbzzzxzzzzzzs007zbzzzznzwzzzzjzzzzzzzzzzwzzzzyTzbzzzxzzzzzzzzzzzbzzzznzwzzzzjzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; MOTP 등록 초기화 버튼
global TextMOTPInit:="|<>*180$141.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000s0A0s00Tzz07zzU000s0000701U7003zzs000A000700000s0A0s00Q000001U000s01zw71zzb003U00000A00TzzU01UsDzws00Q0007zzU03zzw00A70007003U000zzw00070001Us0S0s00Tzz06000000s000A70Dw7003zzs0k00000D0003Us3Vks0000007zzk001w000M70s770000000zzy000Rk0070s60Mz000000030000D7U00k70k77s0Tzzz00M0007kT00C0s70ks01zzzszzzw03s0y03U70SS70000007zzzU0Q71k0s0s1zUs0000000000000s00C0701U7000Dz000000007003U0s0A0s007zy0DzzU000s01s0701U7001k0s1zzy000700S00sTzys00Q030001k000s030073zy7003U0M000C01zzzw000s000s00Q070001k0DzzzU0070007001s1k000C000000000s000s007zw0001k00000000700070003w00004000000000s000s0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

; MOTP 작은 확인 버튼
global TextOK:="|<>*116$51.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwzDzztzzzbtzlzDzy01Ds3tzzzztyCDDzzkDDnttzzwwtwzbDzzDr1bwtzztwsAzjDzzU7Dnttzzz3ty4TDzzwzDw7tzzk09zzzDzy0zDzztzzzzzzbzDzzU0Dwztzzw01zbzzzzzzDwzzzzzztzbzzzzzzDw01zzzztzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; MOTP 큰 확인 버튼
global TextOKBlue:="|<>*150$71.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7yTzzzXzzzzyDwzzzz7zzzw00Nzs3yDzzzs00nzU3wTzzzzzzbyDXszzzzy0TDszXlzzzzkESTlz7Xzzzzbww3bzD7zzzzDss7DySDzzzyDnnyDswTzzzy07byTnszzzzy0zDwC7lzzzzz7yTw0TXzzzzyA4zy3z7zzzw009zzzyDzzzs0TnzzzwTzzzzzzbznzszzzzzzzzzbzlzzzzs00TzDzzzzzzk00zyTzzzzzzzztzwzzzzzzzzznztzzzzzzzzzbzk00TzzzzzzDzU00zzzzzzyTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"

; MOTP 개인정보수집 동의 버튼
global TextAgree:="|<>*146$61.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzlzzzs00zw7szzzwTzzs0wTzzyTzzsQSDzzzDzzwzb7zzzbzzyTnXzzzk01zDtlzzzs00zbwszzzzyTznyQTzzzzDzsQSDzzw001y0D7zzy000TkTXzzzzzzzzzlzzzzzzzzzszzzzU1zzzoTzzz1sTU02Dzzz7zbs0D7zzzbznzzzXzzzlztzzzlzzzwTkzzzszzzz00zzzwTzzzs3zzzyTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

; MOTP 개인정보수집 동의함 버튼
global TextRbtnAgree:="|<>*186$61.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000001041U3zy0T0U70k1U00TsEzyM0k00MC800A0M00A341w60A0041W1z3s7zw30l1UlU0301UsUkMk01U0QsEMAM3zzs7s87CA1zzw0041w6000000200000zk0010TzU1sw3zwUDzk1U31z0E40M0k0U00820A0M0k00410607rk0020zz00zk0010TzU00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001"

Gui, Add, Text, x200 y20 w180 h30, 직무아이디.txt
Gui, Add, Button, x10 y10 w180 h30, 직무교육1강
Gui, Add, Button, x10 y50 w180 h30, 직무교육2강
Gui, Add, Button, x10 y90 w180 h30, 직무교육3강
Gui, Add, Button, x10 y130 w180 h30, 직무교육4강
Gui, Show, x1000 y400 w300 h170, PC로 보기
return

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

endapp(err)
{
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, log.txt
	SoundPlay, *-1
	MsgBox, %err%
	ExitApp
}

logapp(err)
{
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] log`n, log.txt
}

; 휴대폰 번호 파싱
transNum(fullNum)
{
	num := []

	Loop, Parse, fullNum, "-"
		num[A_Index] := A_LoopField

	return num

}

ldplayerInit()
{
	; LDPlater 홈 버튼 클릭
	if (ok:=FindText(X, Y, 576-150000, 938-150000, 576+150000, 938+150000, 0, 0, TextLDHome))
	{
		FindText().Click(X, Y, "L")
		MouseMove, 281, 400
		sleep 1000
	}
	else
		endapp("LDPlayer 홈 버튼 못찾음")

	; LDPlayer 전체 앱 버튼 클릭
	if (ok:=FindText(X, Y, 576-150000, 984-150000, 576+150000, 984+150000, 0, 0, TextLDAll))
	{
		FindText().Click(X, Y, "L")
		MouseMove, 281, 400
		sleep 1000
	}
	else
		endapp("LDPlayer 전체 앱 버튼 못찾음")

	Loop, 10
		MouseClick WheelUp,,,1

	sleep 1000

	; LDPlayer 모두 지우기 버튼 클릭
	if (ok:=FindText(X, Y, 474-150000, 121-150000, 474+150000, 121+150000, 0, 0, TextLDDeleteAll))
	{
		FindText().Click(X, Y, "L")
		sleep 1000
	}
	else
		endapp("LDPlayer 모두 지우기 버튼 못찾음")

}

; 강의 시청 모듈
watchLecture(lecture)
{
	; 휴대폰 디바이스 폰 모델명
	deviceModel := ["SM-S908N", "SM-S901N", "SM-S906N", "SM-G977N", "SM-G973N", "SM-G975N", "SM-G970N", "SM-N971N", "SM-N976N", "SM-N970N", "SM-G965N", "SM-G965N", "SM-G960N", "SM-G965N", "SM-A908N", "SM-A805N", "SM-G9880", "SM-F721N", "SM-F700N", "SM-F711N", "SM-F731N", "SM-F946N", "SM-F936N", "SM-F926N", "SM-A245N", "SM-A346N", "SM-A546S", "SM-A536N", "SM-A136S"]

	sleep 1000
	FileEncoding, UTF-8
	CoordMode, Mouse, Screen

	; 아이디 읽기
	FileRead, varfile, % vJikmuViewID

	idinfo := []
	; 아이디.txt 파일 읽기, 아이디, 전화번호 구분, idinfo[1] = 이름, idinfo[2] = 아이디, idinfo[3] = 휴대폰번호
	Loop, Parse, varfile, " "
		idinfo[A_Index] := A_LoopField

	checkPass = 1

	; 전화번호 파싱 -> phoneNum[1] = 010, phoneNum[2] = 두번째 폰번호, phoneNum[3] = 세번째 폰번호
	phoneNum := transNum(idinfo[3])

	logapp(A_LoopField)
	logapp("시작")

	; LDPlayer 설정 시작
	if (ok:=FindText(X, Y, 576-150000, 52-150000, 576+150000, 52+150000, 0, 0, TextLDSet))
	{
		FindText().Click(X, Y, "L")
		sleep 1000

		; LDPlayer 디바이스 설정
		if (ok:=FindText(X, Y, 66-150000, 326-150000, 66+150000, 326+150000, 0, 0, TextDevice))
		{
			FindText().Click(X, Y, "L")
			sleep 1000

			MouseClick, Left, 426, 346
			checkIME()
			sleep 500
			Send, ^{a}

			Random, dev, 1, deviceModel.length()
			sleep 500
			send, % deviceModel[dev]
			sleep 500

			MouseClick, Left, 426, 438
			sleep 500
			Send, ^{a}
			sleep 500

			Send, % phoneNum[1] phoneNum[2] phoneNum[3]
			sleep 500

			; IMEI 랜덤 설정
			if (ok:=FindText(X, Y, 604-150000, 488-150000, 604+150000, 488+150000, 0, 0, TextRandom))
				FindText().Click(X, Y, "L")
			else
				endapp("LDPlayer IMEI 랜덤 못찾음")

			sleep 500

			; LDPlayer 설정 저장
			if (ok:=FindText(X, Y, 575-150000, 765-150000, 575+150000, 765+150000, 0, 0, TextSave))
				FindText().Click(X, Y, "L")
			else
				endapp("LDPlayer 저장버튼 못찾음")

			sleep 500

		}
		else
			endapp("LDPlayer 디바이스버튼 못찾음")
	}
	else
		endapp("LDPlayer 설정버튼 못찾음")

	; MOTP 설정
	; MOTP 아이콘 클릭
	if (ok:=FindText(X, Y, 214-150000, 462-150000, 214+150000, 462+150000, 0, 0, TextMOTP))
	{
		FindText().Click(X, Y, "L")
		sleep 4000

		; MOTP 초기화 시작
		; MOTP 등록 초기화 버튼
		if (ok:=FindText(X, Y, 258-150000, 913-150000, 258+150000, 913+150000, 0, 0, TextMOTPInit))
		{
			FindText().Click(X, Y, "L")
			sleep 500

			; 등록 초기화 하시겠습니까? 확인 클릭 (작은 확인)
			if (ok:=FindText(X, Y, 448-150000, 623-150000, 448+150000, 623+150000, 0, 0, TextOK))
			{
				FindText().Click(X, Y, "L")
				sleep 500
			}
			else
				endapp("MOTP 확인 버튼 못찾음")

			; 초기화 되었습니다. 확인 클릭 (작은 확인)
			if (ok:=FindText(X, Y, 448-150000, 623-150000, 448+150000, 623+150000, 0, 0, TextOK))
			{
				FindText().Click(X, Y, "L")
				sleep 500
			}
			else
				endapp("MOTP 확인 버튼 못찾음")
		}
		else
			logapp("MOTP 등록 초기화 버튼 못찾음, 이미 초기화 됨")

		; 개인정보수집 동의
		if (ok:=FindText(X, Y, 279-150000, 755-150000, 279+150000, 755+150000, 0, 0, TextAgree))
		{
			FindText().Click(X, Y, "L")
			sleep 500
		}
		else
			endapp("MOTP 개인정보수집 동의 버튼 못찾음")

		; 개인정보수집 동의함 라디오 버튼
		if (ok:=FindText(X, Y, 278-150000, 515-150000, 278+150000, 515+150000, 0, 0, TextRbtnAgree))
		{
			FindText().Click(X, Y, "L")
			sleep 500
		}
		else
			endapp("MOTP 개인정보수집 동의 라디오 버튼 못찾음")

		Loop, 10
			MouseClick WheelDown,,,1

		sleep 500
		MouseClick, Left, 281, 375
		sleep 500
		Send, % idinfo[1]
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

		; MOTP 입력 확인 (파랑색 확인 버튼)
		if (ok:=FindText(X, Y, 277-150000, 930-150000, 277+150000, 930+150000, 0, 0, TextOKBlue))
		{
			FindText().Click(X, Y, "L")
			sleep 500
		}
		else
			endapp("MOTP 파랑 확인 버튼 못찾음")

		; 승인 요청하시겠습니까? (작은 확인 버튼)
		if (ok:=FindText(X, Y, 448-150000, 623-150000, 448+150000, 623+150000, 0, 0, TextOK))
		{
			FindText().Click(X, Y, "L")
			sleep 500
		}
		else
			endapp("MOTP 작은 확인 버튼 못찾음")

		; 승인이 완료되었습니다. 확인 클릭 (작은 확인)
		if (ok:=FindText(X, Y, 448-150000, 623-150000, 448+150000, 623+150000, 0, 0, TextOK))
		{
			FindText().Click(X, Y, "L")
			sleep 500
		}
		else
			endapp("MOTP 작은 확인 버튼 못찾음")

	}
	else
		endapp("MOTP 아이콘 못찾음")

	; Kedu 로그인 시작
	; LDPlater 홈 버튼 클릭
	if (ok:=FindText(X, Y, 576-150000, 938-150000, 576+150000, 938+150000, 0, 0, TextLDHome))
	{
		FindText().Click(X, Y, "L")
		MouseMove, 281, 400
		sleep 1000
	}
	else
		endapp("LDPlayer 홈 버튼 못찾음")

	; 웨일 어플 실행
	if (ok:=FindText(X, Y, 92-150000, 334-150000, 92+150000, 334+150000, 0, 0, TextWhale))
	{
		FindText().Click(X, Y, "L")
		sleep 2000
	}
	else
		endapp("웨일 어플 못찾음")

	; kedu 로그인 버튼 찾기
	if (ok:=FindText(X, Y, 279-150000, 480-150000, 279+150000, 480+150000, 0, 0, TextLogin))
	{
		sleep 500
		MouseClick, Left, 272, 320
		sleep 500
		Send, ^{a}
		sleep 500
		Send, {Backspace}
		sleep 500
		Send, % idinfo[2]
		sleep 500

		MouseClick, Left, 272, 388
		sleep 500
		Send, ^{a}
		sleep 500
		Send, {Backspace}
		sleep 500
		Send, hanaro2@
		sleep 500

		if (ok:=FindText(X, Y, 279-150000, 480-150000, 279+150000, 480+150000, 0, 0, TextLogin))
		{
			FindText().Click(X, Y, "L")
			sleep 2000
		}
		else
			endapp("Kedu 로그인 버튼 못찾음")
	}
	else
		endapp("Kedu 로그인 버튼 못찾음")

	; kedu 로그인 완료

	if(lecture = "직무1강")
	{

	}

}

; 산업안전 시청
Button직무교육1강:
{
	sleep 1000
	WinActivate, LDPlayer
	sleep 1000
	WinMove, LDPlayer,, 0,0,,
	sleep 1000

	ldplayerInit()

	watchLecture("직무1강")


	endapp("전체 완료\n에그를 끄세요!")

}

Button직무교육2강:
{
	sleep 1000
	WinActivate, LDPlayer
	sleep 1000
	WinMove, LDPlayer,, 0,0,,
	sleep 1000

	watchLecture("직무2강")

	endapp("전체 완료\n에그를 끄세요!")

}

Button직무교육3강:
{
	sleep 1000
	WinActivate, LDPlayer
	sleep 1000
	WinMove, LDPlayer,, 0,0,,
	sleep 1000

	watchLecture("직무3강")

	endapp("전체 완료\n에그를 끄세요!")

}

Button직무교육4강:
{
	sleep 1000
	WinActivate, LDPlayer
	sleep 1000
	WinMove, LDPlayer,, 0,0,,
	sleep 1000

	watchLecture("직무4강")

	endapp("전체 완료\n에그를 끄세요!")

}

GuiClose:
ExitApp
