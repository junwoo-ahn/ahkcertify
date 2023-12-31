﻿#Include <FindText>

global vPatchNum := "1026.15"
global vSanViewID := "산업.txt"
global vKyeongViewID := "경비.txt"
global vMustViewID := "의무.txt"
global vJikmuViewID := "직무.txt"
global dirPath := "C:\Users\user\Downloads\"
global dirImgPath := "C:\Users\user\Downloads\image\"
global lecName := ["직장내성희롱.png", "직장내장애인.png", "직장내괴롭힘.png", "개인정보보호.png", "퇴직연금.png", "급여제공지침.png", "아동학대.png", "노인학대.png", "장애인학대.png"]
; 휴대폰 디바이스 폰 모델명
global deviceModel := ["SM-S908N", "SM-S901N", "SM-S906N", "SM-G977N", "SM-G973N", "SM-G975N", "SM-G970N", "SM-N971N", "SM-N976N", "SM-N970N", "SM-G965N", "SM-G965N", "SM-G960N", "SM-G965N", "SM-A908N", "SM-A805N", "SM-G9880", "SM-F721N", "SM-F700N", "SM-F711N", "SM-F731N", "SM-F946N", "SM-F936N", "SM-F926N", "SM-A245N", "SM-A346N", "SM-A546S", "SM-A536N", "SM-A136S"]
global vRefreshDelay := 1000

FileEncoding, UTF-8

Gui, 1:font, s200
Gui, 1:Add, Button, x10 y10 w560 h330, 산업
Gui, 1:Add, Button, x580 y10 w560 h330, 경비
Gui, 1:Add, Button, x10 y350 w560 h330, 의무
Gui, 1:Add, Button, x580 y350 w560 h330, 직무
Gui, 1:font, s20
Gui, 1:Add, Button, x750 y690 w390 h80 gPatchBtn, 미뮤패치 ver:%vPatchNum%
Gui, 1:Add, Text, x10 y690 w700 h30, 산업 : 산업.txt   경비 : 경비.txt   의무 : 의무.txt   직무 : 직무.txt
Gui, 1:Add, ListBox, x10 y730 w80 h20 vDelayLBox Choose5, 0|0.5|1|1.5|2|2.5|3|3.5|4|4.5|5|5.5|6
Gui, 1:Add, Text, x100 y730 w300 h30, 초 딜레이 추가
Gui, 1:Show, x360 y160 w1150 h780, PC로 보기

Gui, 2:font, s200
Gui, 2:Add, Button, x10 y10 w560 h330, 1강
Gui, 2:Add, Button, x580 y10 w560 h330, 2강
Gui, 2:Add, Button, x10 y350 w560 h330, 3강
Gui, 2:Add, Button, x580 y350 w560 h330, 4강

return

testText(imgFile)
{
	MouseMove, 10, 120

	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 %dirImgPath%%imgFile%

	CoordMode mouse, screen

	if(ErrorLevel = 0)
	{
		MouseClick, Left, % FoundX+20, FoundY+20
		return true
	}
	else
	{
		str := % imgFile " 이미지 못찾음"
		endapp(str)
		return false
	}
}

clickOnemoreImg(imgFile)
{
	MouseMove, 10, 120

	sleep vRefreshDelay+100

	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 %dirImgPath%%imgFile%

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
	MouseMove, 10, 120

	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 %dirImgPath%%imgFile%

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
	MouseMove, 10, 120

	sleep vRefreshDelay+100

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

; 2문항 o,x 퀴즈 답안 입력
clickTestBtn(index)
{
	; 1. o -> 수정
	;Text1o:="|<>*176$31.00000000000000000000000000300002U0000E0S0080NU0408E020480102400U1a00EUS00000000000000000000000000000000000004"

	; 2. x -> 수정
	;Text2x:="|<>*165$31.000000000000000000000000001k000140000208U0102U0101U0100E0100Q0100+00y88U0000000000000000000000000000000000004"

	; 1번 -> 수정
	;Text1:="|<>*176$33.0000003s0001zk000w7U0060A001U0k0kA060+300M0EM0302300M0EM0302300M0EA06021U0k0E60A000w7U001zk0003s000000004"

	; 2번 -> 수정
	;Text2:="|<>*171$33.0000003s0001zk000w7U0060A001U0k1kA060F300M08M0301300M0EM0304300M10A060E1U0k3s60A000w7U001zk0003s000000004"

	; 3번 -> 수정
	;Text3:="|<>*168$33.0000003s0001zk000Q700060A001U0k3kA0601300M08M0301300M1kM0301300M08A06011U0k3k60A000Q70001zk0003s000000004"

	; 4번 -> 수정
	;Text4:="|<>*175$33.0000003s0001zk000w7U0060A001U0k0MA0607300M0cM0309300M28M030F300M7wA06011U0k0860A000w7U001zk0003s000000004"

	Text1:="|<>*207$17.000000000000600w00M00k01U0300600A00Mk00000000000000001" ; 1번
	Text2:="|<>*151$17.000000000000C00W00400800U0200800U01wE00000000000000001" ; 2번
	Text3:="|<>*149$17.000000000000000w00400800E0700100200403kU00000000000001" ; 3번
	Text4:="|<>*177$17.000000000000000600Q00c02E08U0F01z004008U00000000000001" ; 4번


	if (ok:=FindText(X, Y, 566-150000, 658-150000, 566+150000, 658+150000, 0, 0, Text1o))
	{
		; 3차시 문항일경우 OX 퀴즈
		Random, rbtn, 1, 2

		if (rbtn = 1) ; O 체크 버튼 클릭
		{
			if (ok:=FindText(X, Y, 566-150000, 658-150000, 566+150000, 658+150000, 0, 0, Text1))
			{
				if !ok[index].x
					FindText().Click(ok[1].x, ok[1].y, "L")
				else
					FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				endapp("1.O 버튼을 못찾음")
		}
		else ; X 체크 버튼 클릭
		{
			if (ok:=FindText(X, Y, 565-150000, 692-150000, 565+150000, 692+150000, 0, 0, Text2))
			{
				if !ok[index].x
					FindText().Click(ok[1].x, ok[1].y, "L")
				else
					FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				endapp("2.X 버튼 못찾음")
		}
	}
	else
	{
		; 6차시 문항일경우 4지선다
		Random, rbtn, 1, 4

		if (rbtn = 1) ; 1번 버튼 클릭
		{
			if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text1))
			{
				if !ok[index].x
					FindText().Click(ok[1].x, ok[1].y, "L")
				else
					FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				logapp("1번 버튼을 못찾음")
		}
		else if (rbtn = 2) ; 2번 버튼 클릭
		{
			if (ok:=FindText(X, Y, 545-150000, 631-150000, 545+150000, 631+150000, 0, 0, Text2))
			{
				if !ok[index].x
					FindText().Click(ok[1].x, ok[1].y, "L")
				else
					FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				logapp("2번 버튼 못찾음")
		}
		else if (rbtn = 3) ; 3번 버튼 클릭
		{
			if (ok:=FindText(X, Y, 540-150000, 754-150000, 540+150000, 754+150000, 0, 0, Text3))
			{
				if !ok[index].x
					FindText().Click(ok[1].x, ok[1].y, "L")
				else
					FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				logapp("3번 버튼 못찾음")
		}
		else ; 4번 버튼 클릭
		{
			if (ok:=FindText(X, Y, 541-150000, 787-150000, 541+150000, 787+150000, 0, 0, Text4))
			{
				if !ok[index].x
					FindText().Click(ok[1].x, ok[1].y, "L")
				else
					FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				logapp("4번 버튼 못찾음")
		}
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
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, % dirPath "log.txt"
	SoundPlay, *-1
	MsgBox, %err%
	ExitApp
}

logapp(err)
{
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, % dirPath "log.txt"
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

waitText(str)
{
	loop, 4
	{
		MsgBox, 들어옴

		if (ok:=FindText(X, Y, 592-150000, 476-150000, 592+150000, 476+15000, 0, 0, str))
			return true
		Sleep 500
	}
	return false
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

; 미뮤 설정
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

; MOTP 설정
setMOTP(name, phoneNum)
{
	;clickImg("미뮤MOTP아이콘.png")
	clickImg("미뮤MOTP아이콘.bmp")
	sleep 5000

	; MOTP 초기화 시작
	; MOTP 등록 초기화 버튼

	;if(ok:=findImg("MOTP등록정보수정.png", true))
	if(ok:=findImg("MOTP등록정보수정.bmp", true))
	{
		; 등록 초기화 시작
		sleep 500

		; 등록 초기화 하시겠습니까? 확인 클릭 (작은 확인)
		;clickImg("MOTP작은확인.png")
		clickImg("MOTP작은확인.bmp")
		sleep 500

		; 초기화 되었습니다. 확인 클릭 (작은 확인)
		;clickImg("MOTP작은확인3.png")
		clickImg("MOTP작은확인3.bmp")
		sleep 500
	}
	else
		logapp("MOTP 등록 초기화 버튼 못찾음, 이미 초기화 됨")

	sleep 500

	; 개인정보수집 동의
	;clickImg("MOTP동의.png")
	clickImg("MOTP동의.bmp")
	sleep 500

	; MOTP 이용 주의사항
	;clickImg("MOTP동의2.png")
	clickImg("MOTP동의2.bmp")
	sleep 500

	; 개인정보수집 동의함 라디오 버튼
	;clickImg("MOTP동의함.png")
	clickImg("MOTP동의함.bmp")
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
	;clickImg("MOTP파랑확인.png")
	clickImg("MOTP파랑확인.bmp")
	sleep 1000

	; 승인 요청하시겠습니까? (작은 확인 버튼)
	;clickImg("MOTP작은확인2.png")
	clickImg("MOTP작은확인2.bmp")
	sleep 1000

	; 승인이 완료되었습니다. 확인 클릭 (작은 확인)
	;clickImg("MOTP작은확인3.png")
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

; 웨일 새로고침
refreshWhale()
{
	MouseClick, Left, 474, 872 ; 웨일 새로고침 버튼 위치
	sleep 2000
}

; 웨일 초기화
whaleInit()
{
	Loop, 5
	{
		refreshWhale()
		if(ok:=findImg("웨일세션종료메시지.png", false))
		{
			sleep 1000
			findImg("웨일확인.png", true)
			sleep 3000
			MouseClick, Left, 281, 875
			sleep 2000
			Send, kedu.kr
			sleep 1000
			send, {Enter}
		}
		else
		{
			findImg("웨일확인.png", true)
			sleep 2000
			if(ok:=findImg("웨일로그인버튼(세션종료).png", true))
			{
				Sleep 2000
				findImg("웨일아이콘(세션종료).png", true)
			}
		}
		sleep 2000
		if(ok:=findImg("kedu로그인.png", false))
			break
	}
}

; 프렙 강의 찾기
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

; 프렙 플레이버튼 클릭
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

; 미뮤 초기화
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
	sleep 6000

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
	sleep 1000

	; MOTP 이용 주의사항
	clickImg("MOTP동의2.png")
	sleep 1000

	MouseClick, Left, 264, 730 ; 이름 위치
	sleep 1000
	Send, 1234
	sleep 1000
	clickImg("미뮤홈버튼.png")
	MouseMove, 503, 942
	Sleep 1000
}

; 산업안전, 경비직무 모듈
watchLecture(lecture)
{
	idinfo := []
	varfile := 0
	checkIME()

	sleep 1000
	WinActivate, 한국이러닝교육센터 - Chrome
	sleep 1000

	; 산업안전, 경비직무 파일명 읽기
	if (lecture = "산업안전")
		FileRead, varfile, %dirPath%%vSanViewID%
	else if (lecture = "경비직무")
		FileRead, varfile, %dirPath%%vKyeongViewID%

	; 아이디.txt 파일 한줄씩 읽기
	Loop, Parse, varfile, `n
	{
 		idinfo := []
 		; 아이디.txt 파일 읽기, 아이디, 전화번호 구분, idinfo[1] = ID, idinfo[2] = 가운데 전화번호, idinfo[3] = 세번째 전화번호
 		Loop, Parse, A_LoopField, " "
			idinfo[A_Index] := A_LoopField

		if(!A_LoopField)
			break

		checkPass = 1

		logapp(A_LoopField)
		logapp("시작")

		Loop, 2
		{
			checkPass = 1

			; 아이디 입력창 검색
			clickImg("아이디.png")

			RegEx := RegExReplace(A_LoopField, "\D")

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
		sleep 1000

  		; 산업안전보건 과정 찾기, 경비직무 찾기
  		Loop, 20
  		{
			if (lecture = "산업안전")
			{
				if (ok:=findImg("산업안전타이틀.png", true))
					break
				else
					MouseClick WheelDown,,,1
			}
			else if (lecture = "경비직무")
			{
				if (ok:=findImg("경비직무타이틀.png", true))
					break
				else
					MouseClick WheelDown,,,1
			}

			sleep 500

  		}

  		sleep 2000
		MouseClick WheelDown,,,9
		sleep 2000

		Loop, 12 ; 6차시 까지. - 이어보기 잘 안될경우 대비해서 12번 루프
		{
			; 이어보기 버튼 클릭 - 이어보기 버튼이 활성화 되어 있을 때에는 이어보기가 우선
			if (ok:=findImg("이어보기.png", true))
			{
				; 이어보기 들어옴
				;clickImg("이어보기.png")
				sleep 30000 ; 서버에 수강완료 데이터가 전송되는 시간 딜레이타임
			}
			else if (ok:=findImg("수강하기.png", true))
			{
				; 수강하기 버튼 클릭
				;clickImg("수강하기.png")
			}
			else
			{
				; 3차시 완료 후, 혹은 이어보기, 수강하기 버튼을 인식하지 못했을 때.
				logapp("3, 6차시 완료, 혹은 이어보기, 수강하기 버튼 인식 못함")
				break
			}

			sleep 3000

			; 수강 시작
			logapp("수강 시작")

			Loop
			{
				if (ok:=findImg("학습종료.png", true))
				{
					;clickImg("학습종료.png")
					break
				}

				sleep 30000
			}

			sleep 3000
		}

		logapp("수강 완료 - 평가 시작")
		sleep 3000

		; 평가응시 버튼 클릭
		if (ok:=findImg("평가응시.png", true))
		{}
			;clickImg("평가응시.png")
		else
		{
			; 이미 평가가 본 경우 혹은 버튼 못찾음
			; endapp("평가응시 버튼 못찾음")
			logapp("이미 평가 완료 됨, 혹은 평가응시 버튼 못찾음 -> 로그아웃")
			logout()
			continue
		}

		; 평가 시작
		sleep 2000

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

		; 평가 시작
		MouseClick WheelDown,,,5

		;clickTestBtn(1) ; 문항 1 체크
		;sleep 1000
		clickTestBtn(1) ; 문항 1 체크
		sleep 1000
		clickTestBtn(2) ; 문항 2 체크
		sleep 1000

		; 다음문제 버튼 클릭
		clickImg("다음문제.png")

		sleep 4000
		clickTestBtn(1) ; 문항 3 체크
		sleep 1000
		clickTestBtn(2) ; 문항 4 체크
		sleep 1000

		; 다음문제 버튼 클릭
		clickImg("다음문제.png")

		sleep 4000
		clickTestBtn(1) ; 문항 5 체크
		sleep 1000

		; 3차시 과정은 평가문항이 5문항
		if (ok:=findImg("문제6.png", false))
		{
			; 6번째 문항이 있을 경우
			clickTestBtn(2) ; 문항 6 체크
			sleep 1000

			; 다음문제 버튼 클릭
			clickImg("다음문제.png")

			sleep 4000
			clickTestBtn(1) ; 문항 7 체크
			sleep 1000
			clickTestBtn(2) ; 문항 8 체크
			sleep 1000

			; 다음문제 버튼 클릭
			clickImg("다음문제.png")

			sleep 4000
			clickTestBtn(1) ; 문항 9 체크
			sleep 1000
			clickTestBtn(2) ; 문항 10 체크
			sleep 1000
		}

		; 최종버튼 클릭
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

		logout()

	}
	endapp("전체 완료\n에그를 끄세요!")

}

; 의무교육 시청
watchMustLecture(lecture)
{
	idinfo := []
	varfile := 0
	checkIME()

	sleep 1000
	WinActivate, 한국이러닝교육센터 - Chrome
	sleep 1000

	; 산업안전, 경비직무 파일명 읽기
	if (lecture = "의무교육")
		FileRead, varfile, %dirPath%%vMustViewID%

	if(!varfile)
		return

	checkPass = 1

	idStr := % varfile " 시작"
	logapp(idStr)

	Loop, 2
	{
		checkPass = 1

		; 아이디 입력창 검색
		clickImg("아이디.png")

		RegEx := RegExReplace(varfile, "\D")

		sleep 500
		Send, % RegEx
		Send, {Tab}
		sleep 500

		if (A_Index = 1)
			Send, 1234 ; 로그인 비번 qwer1234{!}
		else
			Send, qwer1234{!} ; 로그인 비번 1234
		sleep 500
		Send, {Enter} ; 로그인 버튼 클릭
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

	Loop, % lecName.Length()
	{
		; 내 강의실 클릭
		clickImg("내강의실.png")
		sleep 1000

		indexLec := A_Index

		; 과정 찾기
		Loop, 20
		{
			if (ok:=findImg(lecName[indexLec], true))
				break
			else
				MouseClick WheelDown,,,1

			sleep 500
		}

		sleep 2000
		MouseClick WheelDown,,,8
		sleep 2000

		Loop, 30 ; 6차시 까지. - 이어보기 잘 안될경우 대비해서 12번 루프
		{
			; 이어보기 버튼 클릭 - 이어보기 버튼이 활성화 되어 있을 때에는 이어보기가 우선
			if (ok:=findImg("이어보기.png", true))
			{
				; 이어보기 버튼 클릭
				sleep 30000 ; 서버에 수강완료 데이터가 전송되는 시간 딜레이타임
			}
			else if (ok:=findImg("수강하기.png", true))
			{
				; 수강하기 버튼 클릭
			}
			else
			{
				; 볼 수 있는 과정 없음. 스크롤 내림
				logapp("볼 수 있는 과정 없음. 스크롤 내림")
				sleep 500
				MouseClick WheelDown,,,1
				sleep 500
				if(indexLec = 6) ; 급여제공지침 일 경우 스크롤 내리면서 더 검색
					continue
				else if(indexLec = 7) ; 어린이집 통합교육일 경우 스크롤 내리면서 더 검색
					continue
				else
					break
			}

			sleep 3000

			; 수강 시작
			logapp("수강 시작")

			Loop
			{
				if (ok:=findImg("학습종료.png", true))
					break

				sleep 30000
			}

			sleep 3000
		}

		logapp("수강 완료 - 다음과정 진행")

		MouseClick WheelUp,,,50
		sleep 500
		clickImg("로고.png")
		Sleep 1000
		waitLogo()
		sleep 3000
	}

	logout()

}

; 직무교육 강의 시청 모듈
watchJikmuLecture(lecture)
{
	SetKeyDelay, 300

	checkIME()

	sleep 1000

	CoordMode, Mouse, Screen

	; 아이디 읽기
	FileRead, varfile, %dirPath%%vJikmuViewID%

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
	;clickImg("미뮤웨일아이콘.png")
	clickImg("미뮤웨일아이콘.bmp")
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
Button산업:
{
	Gui, submit, nohide
	GuiControlGet, delay,,DelayLBox
	vRefreshDelay := delay*1000

	watchLecture("산업안전")

	endapp("전체 완료\n에그를 끄세요!")

}

; 경비직무 시청
Button경비:
{
	Gui, submit, nohide
	GuiControlGet, delay,,DelayLBox
	vRefreshDelay := delay*1000

	watchLecture("경비직무")

	endapp("전체 완료\n에그를 끄세요!")

}

; 의무교육 시청
Button의무:
{
	Gui, submit, nohide
	GuiControlGet, delay,,DelayLBox
	vRefreshDelay := delay*1000

	watchMustLecture("의무교육")

	endapp("전체 완료\n에그를 끄세요!")
}

; 직무교육 시청
Button직무:
{
	Gui, submit, nohide
	GuiControlGet, delay,,DelayLBox
	vRefreshDelay := delay*1000
	Gui, destroy
	Gui, 2:show, x380 y180 w1150 h750, 직무교육 강의듣기

	return
}

2Button1강:
{
	Gui, Minimize

	sleep 1000
	Run, "C:\Program Files\Microvirt\MEmu\MEmu.exe" MEmu ; 미뮤 실행
	sleep 10000

	Loop, 20
	{
		;if(ok:=findImg("미뮤웨일아이콘.png", false))
		if(ok:=findImg("미뮤웨일아이콘.bmp", false))
			break
		sleep 1000
	}

	sleep 1000
	WinActivate, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기)
	sleep 1000
	WinMove, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기),, 0,0,,
	sleep 1000

	memuInit()

	watchJikmuLecture("8차시1강")

	endapp("전체 완료\n에그를 끄세요!")
}

2Button2강:
{
	Gui, Minimize

	sleep 1000
	Run, "C:\Program Files\Microvirt\MEmu\MEmu.exe" MEmu ; 미뮤 실행
	sleep 10000

	Loop, 20
	{
		if(ok:=findImg("미뮤웨일아이콘.bmp", false))
		;if(ok:=findImg("미뮤웨일아이콘.png", false))
			break
		sleep 1000
	}

	sleep 1000
	WinActivate, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기)
	sleep 1000
	WinMove, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기),, 0,0,,
	sleep 1000

	memuInit()

	watchJikmuLecture("8차시2강")

	endapp("전체 완료\n에그를 끄세요!")
}

2Button3강:
{
	Gui, Minimize

	sleep 1000
	Run, "C:\Program Files\Microvirt\MEmu\MEmu.exe" MEmu ; 미뮤 실행
	sleep 10000

	Loop, 20
	{
		if(ok:=findImg("미뮤웨일아이콘.bmp", false))
		;if(ok:=findImg("미뮤웨일아이콘.png", false))
			break
		sleep 1000
	}

	sleep 1000
	WinActivate, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기)
	sleep 1000
	WinMove, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기),, 0,0,,
	sleep 1000

	memuInit()

	watchJikmuLecture("8차시3강")

	endapp("전체 완료\n에그를 끄세요!")

}

2Button4강:
{
	Gui, Minimize

	sleep 1000
	Run, "C:\Program Files\Microvirt\MEmu\MEmu.exe" MEmu ; 미뮤 실행
	sleep 10000

	Loop, 20
	{
		if(ok:=findImg("미뮤웨일아이콘.bmp", false))
		;if(ok:=findImg("미뮤웨일아이콘.png", false))
			break
		sleep 1000
	}

	sleep 1000
	WinActivate, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기)
	sleep 1000
	WinMove, (미뮤 앱플레이어 - memu1.ova 을 (를) 불러오기),, 0,0,,
	sleep 1000

	memuInit()

	watchJikmuLecture("8차시4강")

	endapp("전체 완료\n에그를 끄세요!")

}

PatchBtn:
{
	sleep 2000
	Run, "C:\Program Files\Microvirt\MEmu\MEmuConsole.exe" ; 미뮤 멀티 실행
	sleep 5000

	loop, 5
	{
		if(ok:=findImg("미뮤휴지통.bmp", true))
		{
			sleep 2000
			clickImg("미뮤휴지통삭제.bmp")
			sleep 2000
		}
		else
			break
	}

	sleep 2000
	clickImg("미뮤불러오기.bmp")
	sleep 2000
	clickImg("미뮤싱글가져오기.bmp")
	sleep 2000

	send, !{d}
	sleep 500
	send, C:\Users\user\Downloads
	sleep 500
	send, {Enter}
	sleep 500
	send, !{n}
	send, memu1.ova
	sleep 500
	send, {Enter}
	sleep 10000

	Loop, 30
	{
		if(ok:=findImg("미뮤멀티실행버튼.bmp", false))
			break
		sleep 1000
	}

	sleep 1000
	WinClose, 미뮤 멀티
	sleep 1000

	MsgBox, 패치 완료
}


GuiClose:
ExitApp

2GuiClose:
ExitApp

Esc::
MsgBox, 프로그램 종료
ExitApp
