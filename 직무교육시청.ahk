#Include <FindText>

; 휴대폰 디바이스 폰 모델명
global deviceModel := ["SM-S908N", "SM-S901N", "SM-S906N", "SM-G977N", "SM-G973N", "SM-G975N", "SM-G970N", "SM-N971N", "SM-N976N", "SM-N970N", "SM-G965N", "SM-G965N", "SM-G960N", "SM-G965N", "SM-A908N", "SM-A805N", "SM-G9880", "SM-F721N", "SM-F700N", "SM-F711N", "SM-F731N", "SM-F946N", "SM-F936N", "SM-F926N", "SM-A245N", "SM-A346N", "SM-A546S", "SM-A536N", "SM-A136S"]

global vJikmuViewID := "직무아이디.txt"

Gui, Add, Text, x200 y20 w180 h30, 직무아이디.txt
Gui, Add, Button, x10 y10 w180 h30, 직무교육1강
Gui, Add, Button, x10 y50 w180 h30, 직무교육2강
Gui, Add, Button, x10 y90 w180 h30, 직무교육3강
Gui, Add, Button, x10 y130 w180 h30, 직무교육4강
Gui, Show, x1000 y400 w300 h170, PC로 보기
return

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


clickOnemoreImg(imgFile)
{
	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *60 ./image/%imgFile%

	CoordMode mouse, screen

	if(ErrorLevel = 0)
	{
		str := % imgFile " 이미지 찾음 (clickOnemoreImg)"
		logapp(str)

		MouseClick, Left, % FoundX+20, FoundY+20
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

		MouseClick, Left, % FoundX+20, FoundY+20
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

refreshWhale()
{
	MouseClick, Left, 474, 872 ; 웨일 새로고침 버튼 위치
	sleep 2000
}

whaleInit()
{
	Loop, 5
	{
		refreshWhale()
		findImg("웨일확인.png", true)
		sleep 2000
		if(ok:=findImg("kedu로그인.png", false))
			break
	}
}

findFrepLec(lec)
{
	; 8차시1강, 8치시2강, 8차시3강, 8차시4강

	fileName := % "frep" lec ".png"

	loop, 20 ; 무한루프는 걸지 않기로.
	{
		sleep 500
		MouseMove, 490, 182
		sleep 500

		if(ok:=findImg(fileName, false))
			break
		else
			MouseClick, Left, 416, 182 ; 프렙위치
	}
}

playFrep()
{
	Loop, 3
	{
		clickImg("미뮤frep2아이콘.png")
		sleep 3000

		clickImg("미뮤홈버튼.png")
		sleep 2000

		if(ok:=findImg("frepplay.png", false))
			return
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

; MOTP 초기화
motpInit() ; motp 한글입력 오류 수정
{
	clickImg("미뮤홈버튼.png")
	Sleep 1000
	clickImg("미뮤MOTP아이콘.png")
	sleep 4000

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

	; 개인정보수집 동의
	clickImg("MOTP동의.png")
	sleep 500

	; MOTP 이용 주의사항
	clickImg("MOTP동의2.png")
	sleep 500

	MouseClick, Left, 264, 730 ; 이름 위치
	sleep 1000
	Send, 1234
	sleep 1000
	clickImg("미뮤홈버튼.png")
	MouseMove, 503, 942
	Sleep 1000
}

; 강의 시청 모듈
watchLecture(lecture)
{
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

	; 미뮤 설정 시작
	setMemu(phoneNum) ; 테스트 해야함

	; MOTP 설정
	setMOTP(idinfo[1], phoneNum)

	; Kedu 로그인 시작
	; LDPlayer 홈 버튼 클릭
	clickImg("미뮤홈버튼.png")
	sleep 1500

	; 프렙 실행
	playFrep()
	sleep 1000

	; 웨일 어플 실행
	clickImg("미뮤웨일아이콘.png")
	sleep 5000

	; kedu 로그인 버튼 찾기
	loop, 2
	{
		whaleInit()

		if(ok:=findImg("kedu로그인.png", false))
		{
			sleep 500
			MouseClick, Left, 272, 300 ; 아이디 입력창
			sleep 500
			Send, ^{a}
			sleep 500
			Send, {Backspace}
			sleep 500
			Send, % idinfo[2] ; 아이디 입력
			sleep 500

			MouseClick, Left, 272, 388 ; 비밀번호 입력창
			sleep 500
			Send, ^{a}
			sleep 500
			Send, {Backspace}
			sleep 500

			if (A_Index = 1)
				Send, 1234 ; qwer1234{!} ; 로그인 비번 qwer1234{!}
			else
				Send, qwer1234! ; 1234 ; 로그인 비번 1234

			sleep 500

			Send, {Enter}
			sleep 4000

			; 로그인 되는지 확인
			if(ok:=findImg("kedu내강의실.png", false))
				break
		}
		else
			endapp("Kedu 로그인 버튼 못찾음")
	}

	; 로그인 되는지 확인
	if(ok:=findImg("kedu내강의실.png", false))
	{}
	else
		endapp("Kedu 로그인 비번 1234 qwer 둘다 틀림")

	; kedu 로그인 완료

	findFrepLec(lecture)
	sleep 500

	clickImg("frepplay.png")

}

; 산업안전 시청
Button직무교육1강:
{
	sleep 1000
	Run, "C:\Program Files\Microvirt\MEmu\MEmu.exe" MEmu_1 ; 미뮤 실행
	sleep 10000

	Loop, 20
	{
		if(ok:=findImg("미뮤웨일아이콘.png", false))
			break
		sleep 1000
	}

	sleep 1000
	WinActivate, (memu1)
	sleep 1000
	WinMove, (memu1),, 0,0,,
	sleep 1000

	memuInit()

	watchLecture("8차시1강")

	endapp("전체 완료\n에그를 끄세요!")

}

Button직무교육2강:
{
	sleep 1000
	Run, "C:\Program Files\Microvirt\MEmu\MEmu.exe" MEmu_1 ; 미뮤 실행
	sleep 10000

	Loop, 20
	{
		if(ok:=findImg("미뮤웨일아이콘.png", false))
			break
		sleep 1000
	}

	sleep 1000
	WinActivate, (memu1)
	sleep 1000
	WinMove, (memu1),, 0,0,,
	sleep 1000

	memuInit()

	watchLecture("8차시2강")

	endapp("전체 완료\n에그를 끄세요!")
}

Button직무교육3강:
{
	sleep 1000
	Run, "C:\Program Files\Microvirt\MEmu\MEmu.exe" MEmu_1 ; 미뮤 실행
	sleep 10000

	Loop, 20
	{
		if(ok:=findImg("미뮤웨일아이콘.png", false))
			break
		sleep 1000
	}

	sleep 1000
	WinActivate, (memu1)
	sleep 1000
	WinMove, (memu1),, 0,0,,
	sleep 1000

	memuInit()

	watchLecture("8차시3강")

	endapp("전체 완료\n에그를 끄세요!")

}

Button직무교육4강:
{
	sleep 1000
	Run, "C:\Program Files\Microvirt\MEmu\MEmu.exe" MEmu_1 ; 미뮤 실행
	sleep 10000

	Loop, 20
	{
		if(ok:=findImg("미뮤웨일아이콘.png", false))
			break
		sleep 1000
	}

	sleep 1000
	WinActivate, (memu1)
	sleep 1000
	WinMove, (memu1),, 0,0,,
	sleep 1000

	memuInit()

	watchLecture("8차시4강")

	endapp("전체 완료\n에그를 끄세요!")

}

GuiClose:
ExitApp
