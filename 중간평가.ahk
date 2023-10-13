#Include <FindText>

global vJikmuViewID := "직무아이디.txt"
global lecList := ["직무-X와MZ.png", "직무-기업의성공.png", "직무-디지털융합의중심.png", "직무-비대면시대.png"]
global deviceModel := ["SM-S908N", "SM-S901N", "SM-S906N", "SM-G977N", "SM-G973N", "SM-G975N", "SM-G970N", "SM-N971N", "SM-N976N", "SM-N970N", "SM-G965N", "SM-G965N", "SM-G960N", "SM-G965N", "SM-A908N", "SM-A805N", "SM-G9880", "SM-F721N", "SM-F700N", "SM-F711N", "SM-F731N", "SM-F946N", "SM-F936N", "SM-F926N", "SM-A245N", "SM-A346N", "SM-A546S", "SM-A536N", "SM-A136S"]
global folderName := ["x와mz"]
global CLICKPOINT := 20 ; default 20
global questionList := ["안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음"]
global answerList := ["정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답"]
global ansIndex := 1

Gui, Add, Text, x200 y20 w180 h30, .txt
Gui, Add, Button, x10 y10 w180 h30, 중간평가테스트
Gui, Show, x1000 y400 w300 h110, PC로 보기
return

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
			questionList[A_Index] := "했음"
			ans := % testFolder "/a" A_Index ".png"
			changeClickPoint(10)
			clickImg(ans)
			changeClickPoint(20)
			sleep 1000

			if(answer = "오답") ; 정답을 틀려야 할 경우
			{
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
	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *60 ./image/%imgFile%

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
	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 ./image/%imgFile%

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
	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 ./image/%imgFile%

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
			Send, qwer1234{!} ; 로그인 비번 qwer1234{!}
		else
			Send, 1234 ; 로그인 비번 1234
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
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] log`n, log.txt
}

endapp(err)
{
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, log.txt
	SoundPlay, *-1
	MsgBox, %err%
	ExitApp
}

middleTest()
{
	; 이미지 불러오기 (선형 탐색)
	; MOTP 해야됨

	;Sleep 1000
	;WinActivate, (memu1)
	;Sleep 1000
	;WinMove, (memu1),, 0,0,,

	SetKeyDelay, 300

	checkIME()

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

	if(!idinfo[1])
		return

	; 전화번호 파싱 -> phoneNum[1] = 010, phoneNum[2] = 두번째 폰번호, phoneNum[3] = 세번째 폰번호
	phoneNum := transNum(idinfo[3])

	idStr := % A_LoopField " 시작"
	logapp(idStr)

	clipboard =

	; 미뮤 설정 시작
	;setMemu(phoneNum)

	; 미뮤 초기화
	;memuInit()

	; MOTP 설정
	;setMOTP(idinfo[1], phoneNum)

	; kedu 로그인
	;loginKedu(idinfo[2])

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

				; 중간평가 응시하기 버튼 있는지 확인
				if(ok:=findImg("중간평가응시하기.png", true))
				{
					sleep 3000
					motp := 1

					Loop, 2
					{
						; MOTP 인식
						WinActivate, (memu1)
						Sleep 1000
						WinMove, (memu1),, 0,0,,
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
						endapp("평가 재응시 불가능 팝업창 못찾음")

					sleep 4000

					; 중간평가 시작
					qaListInit()

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
						testStart("x와mz", 1, answerList[ansIndex]) ; 폴더명, 인덱스, 문제 정답 맞추기 유무
						ansIndex++
						testStart("x와mz", 2, answerList[ansIndex]) ; 폴더명, 인덱스, 문제 정답 맞추기 유무
						ansIndex++
						sleep 1000
						clickImg("다음문제.png")
						sleep 4000
						if(ok:=findImg("마지막문제확인.png", true))
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

				}
				else
					break ; 중간평가 준비 되지 않았음

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

}


; 산업안전 시청
Button산업안전시청:
{

	endapp("전체 완료\n에그를 끄세요!")

}

; 경비직무 시청
Button경비직무시청:
{


	endapp("전체 완료\n에그를 끄세요!")

}

; 산업안전 인증
Button중간평가테스트:
{
	logapp("시작")
	middleTest()
	endapp("테스트 종료")

}

F9:
{
	endapp("테스트 종료")
}

GuiClose:
ExitApp
