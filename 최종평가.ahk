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
global lastQuestionList := ["안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음"]
global lastAnswerList := ["정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답"]
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
global TextQuestionNumber := [
; 문제 1
"|<>##0$0/0/565665,1/-1/FFD197,2/-1/565665,3/-1/565697,4/-1/D3FFFF,14/-2/565665,18/-3/FFD197,19/-3/565665,20/-3/567BB5,22/-3/D39C65,23/-3/565665,24/-3/569CCD,37/11/D39C65,39/11/9DD1FF,35/1/EFE2E1,34/-1/FFECC3,36/-3/FFFCE1",
; 문제 2
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,2/3/6CA1D2,17/1/FFD197,18/1/565665,19/1/567BB5,21/1/D39C65,22/1/565665,23/1/569CCD,32/1/FFD49B,32/0/EFB983,33/0/565665,34/1/B3D1E1,35/7/FFFFFA,36/7/D39E6F,37/7/565665,38/7/5B86BE,35/11/7CB7E6",
; 문제 3
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/15/D39E65,22/14/565665,23/14/569CCD,32/1/FFEAB5,33/1/7C637E,34/1/A2BFD7,37/1/FAEFD7,38/1/B88C6F,39/1/565665,41/1/C9F7FF,39/9/9D5665",
; 문제 4
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-2/FFD197,18/-1/565665,19/-1/567BB5,21/-1/D39C65,22/-1/565665,23/-1/569CCD,32/6/FFDAA1,33/6/665665,34/6/619CCD,38/6/B87B65,39/6/56567E,40/6/B8EAFF",
; 문제 5
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/-1/D39C65,22/-1/565665,23/-1/569CCD,32/-1/FFFFCD,33/-1/9D5665,34/-1/565665,40/-1/565697,41/-1/D3FFFF,41/7/569CCD,39/7/D39C65,33/12/E9D1B5,34/12/988173",
; 문제 6
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/0/FFD197,18/0/565665,19/0/567BB5,21/7/D39C65,22/7/565665,23/7/569CCD,31/6/FFFFE6,32/6/B87B65,33/6/565665,35/6/8CB7D7,35/4/DFB792,41/9/5663A1,41/0/9DD1FF",
; 문제 7
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/0/FFD197,18/0/565665,19/0/567BB5,21/0/D39C65,22/0/565665,23/0/569CCD,31/0/FFFFE6,32/0/B87B65,40/0/565665,41/0/87C1F1,38/8/B3E4FF,37/5/925B65",
; 문제 8
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/0/FFD197,18/0/565665,19/0/567BB5,21/0/D39C65,22/0/565665,23/0/569CCD,31/8/FFFFE1,31/9/FFF2BE,32/9/875665,33/9/56567E,34/9/B8EAFF,34/8/7CB4E6,41/8/567BB5",
; 문제 9
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/0/FFD197,18/0/565665,19/0/567BB5,21/0/D39C65,22/0/565665,23/0/569CCD,31/5/FFFFDD,32/4/9D5665,33/4/565679,34/4/B3E7FF,34/2/82BFF1,38/-1/668197,37/13/7689A6",
; 문제 10
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/0/FFD197,18/0/565665,19/0/567BB5,21/0/D39C65,22/0/565665,23/0/569CCD,36/6/D39C65,37/6/565665,38/6/9DD1FF,33/1/FFECC3,43/7/FFFFCD,44/7/9D5665,45/7/565665,46/7/9DD4FF,46/6/B8EAFF,53/6/565697,53/4/567BB5,53/3/569CCD,47/13/87736A",
; 문제 11
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/-1/D39C65,22/-1/565665,23/-1/569CCD,36/13/D39C65,37/13/565665,35/2/7CB7E6,34/3/EFE2E1,33/2/F4D197,33/1/FFECC3,45/1/FFECC3,46/1/926965,47/1/56566F,48/1/666965,49/1/565665,50/1/9DD1FF,48/6/D39C65",
; 문제 12
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/-1/D39C65,22/-1/565665,23/-1/569CCD,38/12/9DD1FF,37/12/565665,36/12/D39C65,35/1/7CB7E6,34/1/665665,34/2/EFE2E1,33/1/F4D197,52/1/567BB5,52/0/61A4D7,52/-1/C3EFFF,51/-1/565E8D,50/-1/565665,44/12/9D5665"
; 문제 13
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/15/D39E65,22/15/565665,23/15/569CCD,33/2/F4D197,34/2/665665,35/2/7CB7E6,36/2/CE9C65,37/2/565665,38/2/9DD1FF,44/11/B87E73,45/11/8CB7D7,46/6/B87B65,47/6/565665,50/3/FFE7AF,51/3/7C5665",
; 문제 14
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/0/FFD197,18/0/565665,19/0/567BB5,21/0/D39C65,22/0/565665,23/0/569CCD,33/1/FFECC3,34/1/926965,35/1/56566F,36/1/666965,37/1/565665,38/1/9DD1FF,43/9/E9B77E,43/10/D39C65,44/9/565665,44/8/AD7365,45/8/565B92,47/2/FFE7AF,48/2/7C5665,49/2/669EB5"
; 문제 15
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/-1/D39C65,22/-1/565665,23/-1/569CCD,36/13/D39C65,37/13/565665,38/13/9DD1FF,35/2/7CB7E6,34/2/665665,33/2/F4D197,36/1/666965,34/0/FFF4D2,44/-1/FFFFCD,45/-1/9D5665,46/-1/565665,52/-1/565697,53/-1/D3FFFF,51/8/D39C65,53/8/569CCD,49/13/5B667E"
; 문제 16
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/-1/D39C65,22/-1/565665,23/-1/569CCD,35/-1/FFFCE1,37/-1/565665,38/-1/9DD1FF,34/3/EFE2E1,44/4/CE9665,44/3/F4C187,44/2/FFEFBE,45/2/875B65,46/2/565665,46/3/566EA6,45/3/565665,47/3/DFFCFF,50/13/617387,46/13/F4DDB5"
; 문제 17
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/-1/D39C65,22/-1/565665,23/-1/569CCD,38/13/9DD1FF,36/13/D39C65,34/3/EFE2E1,35/2/7CB7E6,34/2/665665,33/2/F4D197,33/1/FFECC3,43/0/FFFFE6,44/0/B87B65,45/0/565665,53/0/87C1F1,48/7/B37365,49/8/565679,48/8/715665,48/5/FFF7C9"
; 문제 18
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/-1/D39C65,22/-1/565665,23/-1/569CCD,34/-1/FFF4D2,35/-1/A27665,36/-1/565665,37/-1/565665,38/-1/9DD1FF,43/9/FFFCC9,44/9/985665,45/9/56566F,46/9/A2D7FF,34/2/EFE2E1,51/12/98BFD7,50/12/616B83,46/12/DFBF97,47/12/826B6A"
; 문제 19
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-2/FFD197,18/-2/565665,19/-2/567BB5,21/-2/D39C65,22/-2/565665,23/-2/569CCD,37/12/565665,36/12/D39C65,34/2/EFE2E1,33/1/F4D197,34/1/665665,35/1/7CB7E6,46/-2/E9CCA6,47/-2/87736A,48/-2/5B5665,50/-2/668197,51/-2/BDDDF1,51/8/A26365,51/7/C3A16F"
; 문제 20
"|<>##0$0/0/FFD197,1/0/565665,2/0/565697,3/0/D3FFFF,17/-1/FFD197,18/-1/565665,19/-1/567BB5,21/-1/D39C65,22/-1/565665,23/-1/569CCD,33/-1/E9D1B5,34/-1/A2897E,35/-1/665E65,38/-1/8299BA,39/-1/DFF2FF,37/5/FFE2AA,31/12/FFFFF5,31/13/FFFFCD,32/13/9D5665,44/6/9D5665,45/5/565665,46/4/9DD1FF,44/2/E9B77E,50/-1/668197,51/-1/BDDDF1,53/6/565697,51/6/FFD197,51/2/AD7365,50/1/D3A479,46/13/EFCFA6,47/13/87736A"]

; 1번
; "|<>##0$0/0/565656,1/0/848484,1/-1/B7B7B7,9/-1/FFC784,10/-1/000084,10/-2/FFFFC6,11/-1/C6C784,11/-2/840000,12/-2/52A6E7,16/6/FFC784,17/6/0055A5"
; 2번
; "|<>##0$0/0/565656,1/0/848484,1/-1/B7B7B7,8/-1/FFFFE7,9/-1/A55584,9/-2/FFE3A5,10/-2/520000,12/-2/000084,13/-2/C6FFFF,13/0/840084,12/6/000000,14/6/A5E3FF,17/6/0055A5"
; 3번
; "|<>##0$0/0/565656,1/0/848484,1/-1/B7B7B7,8/-2/FFFFE7,9/-2/A55500,10/-2/000000,12/-2/000052,13/-2/A5E3FF,14/-1/C6FFFF,13/-1/520084,10/2/840000,16/6/FFC784,17/6/0055A5,13/6/C6FFFF,8/6/FFE3A5,10/6/000000"
; 4번
; "|<>##0$0/0/565656,1/0/848484,1/-1/B7B7B7,8/4/C68200,9/4/000000,9/3/52A6E7,8/3/FFC784,9/2/C68252,10/1/8455A5,12/-2/840000,14/4/0055A5,12/6/FFC784,13/6/52A6E7,16/6/FFC784,17/6/0055A5"

/*
if (ok:=FindText(X, Y, 638-150000, 544-150000, 638+150000, 544+150000, 0, 0, Text))
{
  ; FindText().Click(X, Y, "L")
}
*/


FileEncoding, UTF-8

Gui, Add, Text, x200 y20 w180 h30,
Gui, Add, Button, x10 y10 w180 h30, 로그인후보기
Gui, Add, Text, x200 y60 w180 h30, 최종평가.txt
Gui, Add, Button, x10 y50 w180 h30, 최종평가테스트
Gui, Add, Text, x200 y90 w180 h30, ver. 1107.1
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

clickAnswer(answer, index, rightA)
{
	; answer 값이 1~4 가 아닐경우 주관식
	tempVar := StrLen(answer)

	if(tempVar = 2) ; 객관식 (중간평가)
	{
		;index = 1
		testVar := % answer
		testVar--
		testVar++

		if(rightA = "오답")
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
			logapp("1번 클릭")
			if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text1))
					FindText().Click(ok[index].x, ok[index].y, "L")
			else if(ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text1_1))
			{
				logapp("1_1번 클릭")
				FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				logapp("1번 버튼을 못찾음")
		}
		else if (testVar = 2) ; 2번 버튼 클릭
		{
			logapp("2번 클릭")
			if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text2))
					FindText().Click(ok[index].x, ok[index].y, "L")
			else if(ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text2_1))
			{
				logapp("2_1번 클릭")
				FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				logapp("2번 버튼 못찾음")
		}
		else if (testVar = 3) ; 3번 버튼 클릭
		{
			logapp("3번 클릭")
			if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text3))
					FindText().Click(ok[index].x, ok[index].y, "L")
			else if(ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text3_1))
			{
				logapp("3_1번 클릭")
				FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				logapp("3번 버튼 못찾음")
		}
		else ; 4번 버튼 클릭
		{
			logapp("4번 클릭")
			if (ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text4))
					FindText().Click(ok[index].x, ok[index].y, "L")
			else if(ok:=FindText(X, Y, 544-150000, 876-150000, 544+150000, 876+150000, 0, 0, Text4_1))
			{
				logapp("4_1번 클릭")
				FindText().Click(ok[index].x, ok[index].y, "L")
			}
			else
				logapp("4번 버튼 못찾음")
		}

	}
	else ; 주관식
	{
		MouseClick, Left, qPositionX + 20, qPositionY + 20
		sleep 1000
		send, {Tab}
		sleep 1000

		if(rightA = "오답") ; 오답
		{
			len := wrongAnswer.length()
			Random, rbtn, 1, wrongAnswer.length()
			Clipboard := wrongAnswer[rbtn]
			send, % Clipboard

			;send, % wrongAnswer[rbtn]
			sleep, 1000

		}
		else ; 정답
		{
			Clipboard := answer
			send, % Clipboard
			;send, % answer
			sleep, 1000
		}
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
	lastQuestionList := ["안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음"]
	lastAnswerList := ["정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답"]
	questionList := ["안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음", "안했음"]
	answerList := ["정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답", "정답"]
	ansIndex := 1

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
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, % dirPath "log.txt"
}

endapp(err)
{
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, % dirPath "log.txt"
	SoundPlay, *-1
	MsgBox, %err%
	ExitApp
}

; 중간평가 시작
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
					sleep 2000

					clickImg("확인3.bmp")
					sleep 2000

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
				MouseClick WheelDown,,,4
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

					if(ok:=findQuestion(str))
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

	MouseClick WheelUp,,,10

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
				MouseClick WheelDown,,,4
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

					if(ok:=findQuestion(str))
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
