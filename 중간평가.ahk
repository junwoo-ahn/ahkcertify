#Include <FindText>
#Include testQA.ahk

global vMiddleTestID := "중간평가.txt"
global vLastTestID := "최종평가.txt"
global dirPath := "C:\Users\user\Downloads\"
global dirImgPath := "C:\Users\user\Downloads\image\"
global dirTestPath := "C:\Users\user\Downloads\평가문제\"
global lecList := ["직무-X와MZ.png", "직무-기업의성공.png", "직무-디지털융합의중심.png", "직무-비대면시대.png"]
global deviceModel := ["SM-S908N", "SM-S901N", "SM-S906N", "SM-G977N", "SM-G973N", "SM-G975N", "SM-G970N", "SM-N971N", "SM-N976N", "SM-N970N", "SM-G965N", "SM-G965N", "SM-G960N", "SM-G965N", "SM-A908N", "SM-A805N", "SM-G9880", "SM-F721N", "SM-F700N", "SM-F711N", "SM-F731N", "SM-F946N", "SM-F936N", "SM-F926N", "SM-A245N", "SM-A346N", "SM-A546S", "SM-A536N", "SM-A136S"]
global folderName := ["x와mz", "기업의성공", "디지털융합", "비대면시대"]
global CLICKPOINT := 20 ; default 20 평가 이미지들은 크기가 작아서 20포인트로 설정하면 잘못된 곳에 클릭이 됨.
global questionList := ["안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음"]
global answerList := ["정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답"]
global lecQuestion := []
global lecAnswer := []
global ansIndex := 1
global testType := false ; false : 중간평가, true : 최종평가
global Text1:="|<>*207$17.000000000000600w00M00k01U0300600A00Mk00000000000000001" ; 1번
global Text2:="|<>*151$17.000000000000C00W00400800U0200800U01wE00000000000000001" ; 2번
global Text3:="|<>*149$17.000000000000000w00400800E0700100200403kU00000000000001" ; 3번
global Text4:="|<>*177$17.000000000000000600Q00c02E08U0F01z004008U00000000000001" ; 4번

FileEncoding, UTF-8

Gui, Add, Text, x200 y20 w180 h30, 중간평가.txt
Gui, Add, Button, x10 y10 w180 h30, 중간평가테스트
Gui, Add, Text, x200 y60 w180 h30, 최종평가.txt
Gui, Add, Button, x10 y50 w180 h30, 최종평가테스트
Gui, Show, x1000 y400 w300 h110, PC로 보기
return

compareQuestion(qSource, qTarget, len)
{
	Loop, % len
	{
		if(InStr(lecQuestion[A_Index], Clipboard))
		{
			return lecAnswer[A_Index]
		}
	}

	return false
}

findQuestion(imgFile)
{
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
		str := % imgFile " 이미지 찾음 (findImg)"
		return true
	}
	else
	{
		str := % imgFile " 이미지 못찾음 (findImg)"
		return false
	}
}

clickAnswer(rBtn, index, answer)
{
	;index = 1
	testVar := % rBtn
	testVar--
	testVar++

	if(answer = "오답")
	{
		;MsgBox, "오답 입력"
		Loop, 10
		{
			Random, rVar, 1, 4
			if(testVar != rVar)
			{
				testVar := rVar
				break
			}
		}
	}

	if (testVar = 1) ; 1번 버튼 클릭
	{
		;MsgBox, 1번 클릭
		if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text1))
				FindText().Click(ok[index].x, ok[index].y, "L")
		else
			logapp("1번 버튼을 못찾음")
	}
	else if (testVar = 2) ; 2번 버튼 클릭
	{
		;MsgBox, 2번 클릭
		if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text2))
				FindText().Click(ok[index].x, ok[index].y, "L")
		else
			logapp("2번 버튼 못찾음")
	}
	else if (testVar = 3) ; 3번 버튼 클릭
	{
		;MsgBox, 3번 클릭
		if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text3))
				FindText().Click(ok[index].x, ok[index].y, "L")
		else
			logapp("3번 버튼 못찾음")
	}
	else ; 4번 버튼 클릭
	{
		;MsgBox, 4번 클릭
		if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text4))
				FindText().Click(ok[index].x, ok[index].y, "L")
		else
			logapp("4번 버튼 못찾음")
	}
}

research()
{
	; 설문 완료 되었는지 확인
	if (ok:=findImg("최종평가유의사항.png", true))
	{
		; 설문 완료.
		;clickImg("최종평가유의사항.png")
		sleep 1000
	}
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
	questionList := ["안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음"]
	answerList := ["정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답"]
	ansIndex := 1
}

testStart(testFolder, index, answer)
{
	; 1번
	Text1:="|<>*207$17.000000000000600w00M00k01U0300600A00Mk00000000000000001"

	; 2번
	Text2:="|<>*151$17.000000000000C00W00400800U0200800U01wE00000000000000001"

	; 3번
	Text3:="|<>*149$17.000000000000000w00400800E0700100200403kU00000000000001"

	; 4번
	Text4:="|<>*177$17.000000000000000600Q00c02E08U0F01z004008U00000000000001"

	Loop, ./image/%testFolder%/*.png, 0, 0 ; 해당 폴더에 파일이 있는대로 루프
	{
		; 중간평가는 한 화면에 모든 문제가 보임.  만약 안 보일 시 스크롤 해야함.
		if(questionList[A_Index] = "했음") ; 해당 문제를 푼 적이 있을 경우
			continue

		str := % testFolder "/q" A_Index ".png"
		if(ok:=findImg(str, false)) ; 문제 검색
		{
			MsgBox, 정답 찾았음

			questionList[A_Index] := "했음"
			ans := % testFolder "/a" A_Index ".png"
			changeClickPoint(10)
			clickImg(ans)
			changeClickPoint(20)
			sleep 1000

			if(answer = "오답") ; 정답을 틀려야 할 경우
			{
				MsgBox,오답
				Random, rbtn, 1, 4
				logapp(rbtn)
				if (rbtn = 1) ; 1번 버튼 클릭
				{
					if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text1))
							FindText().Click(ok[index].x, ok[index].y, "L")
					else
						logapp("1번 버튼을 못찾음")
				}
				else if (rbtn = 2) ; 2번 버튼 클릭
				{
					if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text2))
							FindText().Click(ok[index].x, ok[index].y, "L")
					else
						logapp("2번 버튼 못찾음")
				}
				else if (rbtn = 3) ; 3번 버튼 클릭
				{
					if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text3))
							FindText().Click(ok[index].x, ok[index].y, "L")
					else
						logapp("3번 버튼 못찾음")
				}
				else ; 4번 버튼 클릭
				{
					if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text4))
							FindText().Click(ok[index].x, ok[index].y, "L")
					else
						logapp("4번 버튼 못찾음")
				}
			}

			return
		}
	}
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
	clickImg("미뮤MOTP아이콘.png")
	sleep 5000

	; MOTP 초기화 시작
	; MOTP 등록 초기화 버튼

	if(ok:=findImg("MOTP등록정보수정.png", true))
	{
		; 등록 초기화 시작
		sleep 500

		; 등록 초기화 하시겠습니까? 확인 클릭 (작은 확인)
		clickImg("MOTP작은확인.png")
		sleep 500

		; 초기화 되었습니다. 확인 클릭 (작은 확인)
		clickImg("MOTP작은확인3.png")
		sleep 500
	}
	else
		logapp("MOTP 등록 초기화 버튼 못찾음, 이미 초기화 됨")

	sleep 500

	; 개인정보수집 동의
	clickImg("MOTP동의.png")
	sleep 500

	; MOTP 이용 주의사항
	clickImg("MOTP동의2.png")
	sleep 500

	; 개인정보수집 동의함 라디오 버튼
	clickImg("MOTP동의함.png")
	sleep 500

	Loop, 10
		MouseClick WheelDown,,,1

	sleep 500
	MouseClick, Left, 281, 375
	sleep 500

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
	clickImg("MOTP파랑확인.png")
	sleep 1000

	; 승인 요청하시겠습니까? (작은 확인 버튼)
	clickImg("MOTP작은확인2.png")
	sleep 1000

	; 승인이 완료되었습니다. 확인 클릭 (작은 확인)
	clickImg("MOTP작은확인3.png")
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
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, % dirPath "log.txt"
}

endapp(err)
{
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, % dirPath "log.txt"
	SoundPlay, *-1
	MsgBox, %err%
	ExitApp
}

middleTest()
{
	; 이미지 불러오기 (선형 탐색)
	; MOTP 해야됨
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
	FileRead, varfile, %dirPath%%vMiddleTestID%

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
		lecIndex = % A_Index
		Loop, 10
		{
			if(ok:=findImg(lecList[lecIndex], true))
			{
				; 강의클릭 후 들어옴
				sleep 2000
				MouseClick WheelDown,,,4
				sleep 1000

				findBtn := false

				; 중간평가 응시하기 버튼 있는지 확인
				Loop, 20
				{
					if(ok:=findImg("중간평가평가응시버튼.png", true))
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

					MouseClick, Left, 947, 741, 2 ; 크롬 OTP번호란 클릭
					sleep 1000

					send, ^v
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

				sleep 4000

				; 중간평가 시작
				qaListInit()
				startTime := A_TickCount ; 시작시간 저장

				; 오답수, 오답문제 설정
				Random, wAnsNum, 1, 5

				Loop, % wAnsNum
				{
					Random, wAns, 1, 10

					if(answerList[wAns] = "오답") ; 이미 오답설정이 되어 있는 경우
					{
						wAnsNum--
						continue
					}
					else
						answerList[wAns] := "오답"
				}

				FileRead, testVar, % dirTestPath folderName[lecIndex] "-중간평가.txt"

				Loop, Parse, testVar, `n
				{
					if(mod(A_Index,2))
						lecQuestion.push(A_LoopField)
					else
						lecAnswer.push(A_LoopField)
				}

				; 중간평가 10문항, 최종평가 20~21문항
				qTotal := 10 ; 이거 왜 안되지?

				Loop, % qTotal
				{
					str := % "평가문제" A_Index ".bmp"

					if(ok:=findQuestion(str))
					{
						if(ok:=compareQuestion(lecQuestion[A_Index], Clipboard, lecQuestion.Length()))
						{
							if(mod(A_Index,2)) ; 홀수
								clickAnswer(ok, 1, answerList[ansIndex])
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
							str := % A_Index "번 문제 못찾음"
							logapp(str)
							break
						}
						sleep 500
					}
					else
					{
						str := % A_Index "번 문제번호 위치 못찾음"
						endapp(str)
					}
				}

				; 랜덤하기 대기 5분~7분
				endTime := A_TickCount - startTime
				Random, sleepTime, 300000, 420000

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
					sleep 1000

					clickImg("확인3.png")
					sleep 1000

				}

				break ; 평가 완료
			}
			else
				MouseClick WheelDown,,,1

			sleep 500

		}

		; 탑으로 올라가서 로고 클릭 내강의실 클릭
		sleep 1000
		MouseClick WheelUp,,,50

		; 로고 클릭
		clickImg("로고.png")
		Sleep 1000
		waitLogo()

		; 내 강의실 클릭
		clickImg("내강의실.png")
		sleep 2000

	}

	logout()

}

; 최종평가 테스트
lastTest()
{
	; 이미지 불러오기 (선형 탐색)
	; MOTP 해야됨
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
		lecIndex = % A_Index
		Loop, 10
		{
			if(ok:=findImg(lecList[lecIndex], true))
			{
				; 강의클릭 후 들어옴
				sleep 2000
				MouseClick WheelDown,,,4
				sleep 1000

				findBtn := false

				; 중간평가 응시하기 버튼 있는지 확인
				Loop, 25
				{
					if(ok:=findImg("중간평가평가응시버튼.png", true))
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

					MouseClick, Left, 947, 741, 2 ; 크롬 OTP번호란 클릭
					sleep 1000

					send, ^v
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

				; 최종평가 설문조사 실시
				sleep 1000
				researchCheck := false
				if(ok:=findImg("최종평가유의사항.png", false))
				{
					researchCheck := true
					sleep 1000
					research()
				}

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

				sleep 4000

				; 평가 시작
				qaListInit()
				startTime := A_TickCount ; 시작시간 저장

				; 오답수, 오답문제 설정
				Random, wAnsNum, 1, 5

				Loop, % wAnsNum
				{
					Random, wAns, 1, 10

					if(answerList[wAns] = "오답") ; 이미 오답설정이 되어 있는 경우
					{
						wAnsNum--
						continue
					}
					else
						answerList[wAns] := "오답"
				}

				Loop, 5
				{
					testStart(folderName[lecIndex], 1, answerList[ansIndex]) ; 폴더명, 인덱스, 문제 정답 맞추기 유무
					ansIndex++
					testStart(folderName[lecIndex], 2, answerList[ansIndex]) ; 폴더명, 인덱스, 문제 정답 맞추기 유무
					ansIndex++
					sleep 1000
					clickImg("다음문제.png")
					sleep 4000
					if(ok:=findImg("마지막문제확인.png", true))
					{
						sleep 1000
						break
					}
				}

				; 랜덤하기 대기 5분~7분
				endTime := A_TickCount - startTime
				Random, sleepTime, 300000, 420000

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
					sleep 1000

					clickImg("확인3.png")
					sleep 1000

				}

				break ; 평가 완료
			}
			else
				MouseClick WheelDown,,,1

			sleep 500

		}

		; 탑으로 올라가서 로고 클릭 내강의실 클릭
		sleep 1000
		MouseClick WheelUp,,,50

		; 로고 클릭
		clickImg("로고.png")
		Sleep 1000
		waitLogo()

		; 내 강의실 클릭
		clickImg("내강의실.png")
		sleep 2000

	}

	logout()

}

; 중간평가 시작
Button중간평가테스트:
{
	logapp("시작")
	middleTest()
	endapp("테스트 종료")

}

Button최종평가테스트:
{
	logapp("시작")
	lastTest()
	endapp("테스트 종료")

}


GuiClose:
ExitApp

Esc::
MsgBox, 프로그램 종료
ExitApp
