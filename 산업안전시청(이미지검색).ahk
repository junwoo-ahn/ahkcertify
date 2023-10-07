#include <Vis2>
#Include <FindText>

global vSanViewID := "산업안전시청.txt"
global vKyeongViewID := "경비직무시청.txt"

; 한국이러닝교육센터 로고 -> 수정
global TextLogo:="|<>*156$201.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003k00000000000000000000000000000000S0D0Tzy00TU3szzsD3U01w7zzU03zz003zzls7zzy0DzUT7zz1sy00DVzzzk3zzz00TzzD0zzzs3zy3szzsD7k01wDzzy0zzzw03zzts7zzzUzzsT7zz1sy00DVzzzs7zzzU0TzzD0003wDkz3s01sD7k01w000z0y01w00001s000DVw1sT00D1sy00DU001s7U07U07zsD0001wDUD3s01sD7k01w000D0y01w01zzVzU007Vw1sT00D1sy00DU001s7zzzU0DzyDw000wDUD3s01sD7k01w000D0zzzw03zzlzU007Vw1sT00D1sy00DU001s3zzz00T0yDw000wDUD3s01tz7zzVw000D07zzU83s7ls00001w1sT7zzTsTzyDU001s000010DzyD3zzzzDUD3szzvz3zzlw000D3zzzz81zzVsTzzztw1sT7zzTsDzyDUD7lsTzzzt07zwD3zzzzDUD3szztz0001w1syD3zzzz00001sDzzzlw1sT7U01s00000D7lsDzzzk0000D0Tzw0DUD3sw00D0zzzk1syD07zzU01s01s7zzy1w1sT7U01sDzzz0D7ls7zzy00D0000zzzsDUD3sw00D3zzzw1syD0zzzs01s0007zzzVw1sT7U01sTzzzUD7k07zzz00D0000007wDUD3sy00D3k01w1sy00003w01w000000DVw3sT7k01sS00DUD7k0000DU0Dzzz0000w7tz3szzsD3zzzwTzzzk001w01zzzw0007UzzsT3zzVsTzzzbzzzy000DU07zzzU000w3zy3sDzwD1zzzszzzzk001w00Tzzw0007U7z0T0zzVs7zzy7zzzy000DU000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004M000000w08000001U000DU800000M0000a000000DU1U0000000001w100003000005UwD7Vs1U0A1kwD7VXsT081sH3lswMQDU0sAlVY/0DU1UP6lkqAT3M1sP2Mo/336ly07Va8Dks1wSA3sSA4lXAn0DW8H40sMMWAk0wAl1yT0A01UT7lUWANaM10F2MUD334Fa04la8A381U0A30aA4FXAH083MH638MMqAk0X7V0wD0Dk1wT7lUWANXs1wT3sSD3X7la000000000000000000003000000000000000000000000000000003s00000000000000000000000000000000A000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

; 로그아웃 버튼 -> 수정
global TextLogout:="|<>*186$63.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyTUTzy0T0DVnttzzznztsaSDDzy0TzDAHttzznzzttmTUTzyTzzDCEzzzzk1zttWQ03zznzzD4nzDzzyTztwCTzzzs0403znzDzzzzzzzyTUTzzzzzzznkkzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 아이디 입력창 -> 수정
global TextInputID:="|<>*206$63.0000000000000000000000000000000000000000000100E0A0000S8727xU0006N14EkA0000V8Mm61U00049n2EkA0000V8MG61U0004936EkA0000n88W61U0003l0sEzg0000080201U0000100E0A0000080201U00000000000000000000000000000000000000000000000000000004"

; 로그인버튼 -> 수정
global TextLoginIMG:="|<>*147$81.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw7zzzzzzzzzzzz0Tzzzzzzzzzzzk1zzzzzzzzzzzw07zzzzzzzzzzzU0zzzzzzzzzzzw07zzzzzzzzzzzU0zzzzzzzzzzzw07zzzzzzzzzzzU0zzzzzzzzzzzy0Dzzzzzzzzzzzs3zzzzzzzzzzzzvzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzk1zzzzzzzzzzzs03zzzzzzzzzzy00Dzzzzzzzzzzk01zzzzzzzzzzw007zzzzzzzzzz000Tzzzzzzzzzs003zzzzzzzzzy000Dzzzzzzzzzk001zzzzzzzzzy000DzzzzzzzzzU000zzzzzzzzzw0007zzzzzzzzzU000zzzzzzzzzw0007zzzzzzzzzU000zzzzzzzzzw0007zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7zzzzzzU1w0DkszzzzzzzzDztsn7zzzzzzztzzDC8zzzzzzw0Dzttt7zzzzzzXzzzDC8zzzzzzwTzztsn7zzzzzzU1zzDkszzzzzzznzzlzz7zzzzzzyTzyDnszzzzzzznzzlyT7zzzzzy00E03nzzzzzzzzzzzzyTzzzzzzzzzzzzk0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 확인 버튼 -> 수정
global TextOK:="|<>*113$29.00000000000000040001zEQE00V4U3t01002020Da8Y048C81zE0E000UU1z10002200047w00000000000000000001"

; 내 강의실 버튼 -> 수정
global TextMylec:="|<>*208$91.0000000000000000000000000000000000000000000000000000000000000000000zw0000000000003zzk000000000007s1y00000000000D003k0000000000C000Q0000000000C3zw70000000000S7zzVs000000000ADzzwA000000000CDzzz3000000000CDzzzlk00000000CDzzzwQ000000006Dzzzz6000000007DzzzznU00000003Ds007wk00000003bw003yQ00000001by001za00000000nzDzwzn00000000NzbzyTtU0000000NznvzDyM0000000AztwzbzA00000006Twy7nza00000003DyT3tzn00000001bzDjwztU0000000nzbzyTwk0000000NznzzDyM0000000Azs007zA00000006Tw003za00000001by001za00000000nzz0zzn00000000NzzUTztU0000000CTs00Ttk00000003Dw00Dwk00000001nzzzzws00000000MzzzzwM00000000CDzzzwQ000000003XzzzwQ000000000kzzzwA000000000ADzzwA0000000007VzzsS0000000000sDzkQ0000000000C000Q00000000003k00w00000000000TU7s000000000003zzk000000000000Dz000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006M001k00Q00A00s3A0Tss3sC0s600Q1a0DyQ3z70Q300C0n006C3XXUA1U070NU0771Utk70k03UAk073wkQs7kM01k6M071yMCQ7wA00s3w0D0sCCC77a00Q1y0T0Q3z7D1X00C0n060C0y3X01U070NU000001k00003zgk03w000s7zs00zqM07zU00Q3zw0003A07VsTzi0060001a03UQDzr0zz0000n01kC003UTzU000NU0wD001kC00000Ak0Dz000s7zw0000M01y000Q3zy000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E"

; 현장이 달라지는 경비직무마스터 타이틀 -> 수정
global TextKyungTitle:="|<>*207$201.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001y3003001k001U00k00Q700000C0070030DkMTwM3sC07yA7z63z3Us001zlkkMsTsM0033zX0zVk1zlUzskTwQ7000DyC6373zX1zyM0MM7CC0C0A076033Us0001zkkMs0MMDzn0731klk1k1w0sk0MQ70000Dy637073000M0kTA6C0C0DU76073UzzU03VkkMs1kM0y30D3tUtk1k1Uzsk0kQ3zw00sC7z70C30Dvs7wMA7C0Dzg7z7kC3U0000DTkzss7wM3Xz1tv1Utk0zxUk0y3kQ00007ny6371vv0MQMw6MA6C000A6060z3bzzs1s1kkMsw6M3Xz3031klk0000k0kDSQzzz0C0C6373030Dvs0007CC03zw6063lvU00001y0zss0000y307w0zVk0TzUzyks6Q00000zw7z70zz000M3zk3sC000A7zq603Us000D3k00s7zs0s30w7001k0DzU00k00Q70001kC007003070070M00C03zw006003Us000C1k00s00M0s00w7001k0Q0000k00Q70001sS00700307zw3zk00C03zy006003UzzU07zU00s00M0zzU7w001k0Dzk00k00Q7zw00Dk0070030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

; 산업안전보건 과정 타이틀 -> 수정
global TextSanTitle:="|<>*207$161.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A007007001k00000M0000zU0U1UM3sC1wC3z3Uk3VzkkTzk7zk3030kDwQ7wQ7z71U73zVUzzUS3kC061UsssQQs0AC30C0330030s3UM0Q31kzkkNk0sQ7zw0C60061sD0k0s631zXUnU1bsDzs0MA00A1zw3U1sDb3771bs7DkM1k1rs00M0zU607sTCCC63DkT3Uk3U7Dk00k000A0QskDsQCCQ1z71zz0Q1UCNXzzwM1ktUDUsDss77i3zw3k30Qn7zztk7Un001kDVkw6Q0A0D060ta0MQ3U406000003Vk0s0M0M0A1nA0ks3000A0k7007001k0k000M3a07zw6070M1UC1UC0M3U1U0C0k7A0DzsA0C003zw3000k0DzzkQ03zzw01kQ0Q007zs6001U0TzzUs07zzs03UM0s00A1kA003000001k00000070k1zz0TzUTzk7zs0003zy00000C1k1zy0zz0zzUDzk0003zw00000Q1U0000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E"

; 수강하기 버튼 -> 수정
global TextListenBtn:="|<>*187$57.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbs4y6Q2TzwzwbznyHzz3z4s0TmTznDtVzrwnzsySQy6DaTzzz7baLtnzk0DzwmySTzwzsDaLbnzzbyQy6zyTzwznbzrznzzbz1zyzyTzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 이어보기 버튼 -> 수정
global TextContinueBtn:="|<>*186$57.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzVnlnbnUHzwaQaQyTmTzAnCHU3yHztmNkSyTaTzCrCHrrwnztqxqS0zCTzYrYnyznnzyCyCTrwyTzzrzn01znzzyzyTzzyTzzrznzzznzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 수료 완료 -> 수정
global TextClear:="|<>*102$31.zzzzzzzzzzzzzzzzzzzzzTbzzbDXw0NDkzzAbXD0737lbzVzznzkzzs0sE079wDtzYy7ww00NyTzzCzDzzDzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 학습종료 버튼 -> 수정
global TextLecClear:="|<>*145$91.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzySTzzzzzzzzzzzzzDDyTw0DU1zzzzzs07z7zszzwzzzzzzznz3zsDzyTzzzzzUNyATlXw0DzzzzzX4ATXXASDzzzzzznmTzzzbz7zzzzzzslC00E03U1zzzzzy1bzzzzzwlzzzzzzzzsyTk7yMzzzzzzU1wTDXlzATzzzzzzwy07nws01zzzzzzyT7nswTzzzzzzzzzDU1z0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 로그아웃 버튼 -> 수정
global TextLogout:="|<>*187$57.zzzzzzzzzzzzzzzzzzzzzzzzzty1zs1w0y7DbbzzDzbWNwwzs1zwwtDbbzDzzbb9y1ztzzwwt3zzz07zbb9k0DzDzwwHDwzztzzbktzzzU0E0DzDwzzzzzzzty1zzzzzzzD33zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 평가응시 버튼 -> 수정
global TextStartTest:="|<>*205$51.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw1A2TUTbDm1yHtlwtyHDmTCDbDm1yHw3wtyHDa7zzXDU9tnU0sNzzySTzyNDw3bnw3ndzDDyTDDzDttznttztzUTyTUTzDzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 위 사항을 모두 숙지 하였으며 체크박스 -> 수정
global TextCheckBox:="|<>*151$181.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020023sUDk0007z00E00E0400U00027V01100EMA0Ty4000M1y8DW1sEDkDl4AU0UXzc820812000+0140137sAA88W2E0EE0463040V000Mk0WDyV148347l380M8DXUz020EU00k60V00EUW40W28S40A4A9000108Dy0000EUQ8ET20l1402063W4Xzy0zw000TzkMEF74EUkkUW0107V1wE00010000080G8EG1kEDkETDyU2EU08Dy00U7zw040kY890000088UEE24E7s0100E0200zsE+28U48007wE88218463zU08010004010sE2A0000844004211007zy0U00200U0836Dzw042200210UU00000E00100E043KU0002110010TUTw00008000U0802268000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

; 최종평가 유의사항 -> 수정
global TextLastTestCheck:="|<>*138$93.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000M3zz0003000Q03w30Tzs7zsM003U0TUM00C0zz31zsQ0003003U1lUMDzXU1zsM03k0CAz00QQ0Dz307zk1lbs033U01kMDsDkCA300MQ00Q30kQ61lbs073U070M03U0CAz00kTU3y300Q01lUM0C3w1xwMTzzwzzX01UQ0S1X3zzzbzwM0Q3U360M00000030D0Q00k3000000003k3U060M0Ds00Ds0w0Q00k30Dzk0DzkS03U7zzM3k703k71U0Q1zzv0Q0Q0Q0M003U000M3U3U3U3000Q00030S0s0S0s003U000M1zy01zy000Q000301z001z0003U000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000T000k01U0300000A60S60kA3sM000030MAMk61U0300000k311a0kATyM000030MMAk61U0300000A631a0kA00S00000T08Ak61UT300000001X61sD6AM00000003kkD1UVX00003zzk063AA6AM00001VU00kMlUT300000AA00K62A0T000001VUzslU1UA600000AA00600A30M00001VU00k01UM300000AA00600A1Uk000000000k01U3s000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

; 평가 재응시는 불가능하며 팝업 창 -> 수정
global TextIntoTestPopup:="|<>*123$181.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0jzbzyLkDzttzzvtzyyTzbjznzw3zzzr0Hz0/nnwwwzzw0w3TDy0LUNzwwzza3z9ztZttySSTzyyTtjbzzvrgzySTznRzgzwmy1zDD0Dz0Dwrk3sRvkTzUTzxczaTyNTzzbbzzzzzyvzztaxvDzzzzs1Tr3zAA03lnzzz00yQE0Bv6xbz00zzzjnbz6LzzmtU0TzDySzzyxjS3zzzzzkDbnzB/s7nAzzzw0yTTUTArjNzy1zznnbtzC5ttnmSTzzyQzjbbkvkAzySTztwzwzzmxyzzDDzz0DzrrvzxzyTzTjzwwzyTztSSTzbbzzjzzvttzyzzAzbbzz0zzDzwjUTznk3zk3zxy1zzTzazs7zzzzzzzzzzzzzzzzzzzzzzzzzzyTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 다음문제 버튼 -> 수정
global TextNextBtn:="|<>*194$101.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzXzk1zzzzzzzXzzzzz7z11zk03zzn7zzs0CDwD3zU07k1aDzzk0QTsT3z7yDU3ATzzVzszly7yDwTsyMzzz3zlzVwTwTszlwlzzy7zXzVkzszlzXlXzzwDz0z03zk03z637zzsTy1zUDzU07yA6Dzzkzw3zzzzzzzwTATzzVzszzzzzzzzkyMzzz3zls001zzzzUwlzzy7zXk002000D1tXzzwDx7zzzw000QFn7zzs02DzzzzzXzklaDzzk04Tk03zz7z3VATzzzzszU07yCDyDaMzzzzzlz7yDwQTyzwlzzzzzXyDwTszzzztXzzzzz7wTszlzzzzn7zzzzyDs01zU07zzaDzzzzwTk03z00DzzATzzzzzzU07y00Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

; 최종제출 버튼 -> 수정
global TextSendTest:="|<>*191$101.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzXzzzzzztzk1zzzz0T7s00zzsnzzzzzzy0yDk01s0lbzzzzzzzzwTz3zk1XDk01zzzU0szw3zwT6TU03zzz01lzk1zsyAzw3zzzzkzXw30zlwNzU1zzzzlz7UDUTX0ns30Dzzz1yDXllz61bkTUTzzw1wTzXzy7XDrzxzzzkUszy3zwD6Q000zzy3Ulk003kSAs001zzwDnXU007UQNzw7zzzxlz7zzzz0MnzwTzzzzXyDz0zwMlbs01zzzz7wTw0TksXDk03zzz00MzksT3l6Tzz7zzy00lz3szjyAz00DzzzzzXyDkzzwNy00Tzzzzz7wTVzzsnwDzzzzzzyDsT7zzlbsTzzzzzzwTsMDzzXDk01zzzzzzzs0zzzzzU03zzzzzzzw7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"

; 최종제출 후 수정 안됨 -> 수정
global TextLastCheck:="|<>*151$121.000000000000000000000000000000000000000000000000000000000000000000000000000000000000001k0000000000000QEz3m000D00UDYD8080E081U91z0000E0G04440MDY3U0UC0Dy0I0LDu320+0WCA5kMk000F0MU12F0MVV0028zy120kMGEwu4UEDCbzWY0U0T000EcGE00008E02G3y000Tz00EcDsDz48TW5010zy0E1w4Y0408ToE80UzU0U08113m3y0402840EE00E040UU11002013w08Ds08020DU0UzU1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

; 최종 확인 버튼 -> 수정
global TextLastOKBtn:="|<>*154$25.00000000000000000CEQE08F8Dw0Y0+0G1tm908UsUzk0E00887w400220011z00000000000000000E"

; 최종 확인2 버튼 -> 수정
global TextLastOKBtn2:="|<>*156$31.00000000000000000sVkU00F4E0TcV8084EY03ncW00V3V03zU0U000EE0Ds80004400023y00000000000000000000000000E"

; 로그인 오류 메시지 -> 수정
global TextCheckPass:="|<>*206$91.0000000000000000000000000000000000001zzU00000000000Dzzz00000000001zzzzy0000000003zzzzzk000000007zw03zy00000000Dz0003zk0000000Tw0000Dy0000000zs00001zk000000zk00000Dw000000zU000001z000001z0000000Ds00001z00000003y00001y00000000TU0001y000000007s0001y000000001y0001y000000000TU000y0000000007k000y0000000001w000y0000000000T000y00000000007k00T00000000003s00T00000000000y00D00000000000D00DU00000000007k07U00000000001s07k00000000000y03k003U0003U00D03s003s0003s007k1s001y0003w001s1w000zU003y000y0w000Ds003y000D0S0003y003y0007UD0000zU03y0003kD0000Ds03y0000w7U0003y03y0000S3k0000zU3y0000D1s0000Ds3y00007Vw00003y3y00003sw00000zXy00000wS00000Dvy00000SD000003zy00000D7U00000zy000007Xk00000Dy000003ls000003y000001sw000003zU00000wS000003zs00000SD000003zy00000D7U00003yzU00007Xk00003yDs00003ls00003y3y00001sy00003y0zU0001wD00003y0Ds0000w7U0003y03y0000S3k0003y00zU000D1s0003y00Ds0007US0003y003y0007UD0003y000zU003k7U003y000Ds001s3s001y0003w001w0w000y0000y000w0T000C0000C000y07U00000000000S03s00000000000T00w00000000000D00T00000000000DU07U00000000007U03s00000000007k00y00000000007k00T00000000003s007k0000000003s001w0000000003s000T0000000003s000Dk000000003w0003w000000003w0000z000000003w0000Dk00000003w00003y00000007w00000zU0000007w000007w000000Ds000001zU00000Ts000000Tw00000zs0000003zU0001zk0000000Ty0007zU00000003zy01zz000000000Tzzzzy0000000003zzzzw00000000007zzzU00000000000Dzw000000000000000000000E"

; 개인정보변경 이미지 -> 수정
global TextWelcome:="|<>*216$91.00000000000000000000000000000000000000000000000000000E00000000000003z00000000000003zs0000000000003zy0000000000003zz0000000000001zzk000000000001zzs000000000000zzw000000000000Tzy000000000000Dzz0000000000007zzU000000000001zzk000000000000zzk000000000000Dzs0000000000003zs0000000000000zk00000000000003000000000000000000000000000000000000000000003z00000000000007zs000000000000Dzz000000000000Dzzk00000000000Dzzw00000000000Dzzz00000000000Dzzzk00000000007zzzs00000000007zzzy00000000003zzzz00000000003zzzzk0000000001zzzzs0000000001zzzzy0000000000zzzzz0000000000TzzzzU000000000Tzzzzs000000000Dzzzzw0000000007zzzzy0000000003zzzzz0000000001zzzzzU000000000zzzzzk000000000Tzzzzs000000000Dzzzzw0000000007zzzzy0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003M0A030000A01U3xgS6DtVUMla7sk06qNX0AkkAMn0AM03PANUAMM6ATU7w03BiAkCwDz7wk6601bn6MD661X7s7z00nNaAAv30lXA61U0lgS6ABVzszaC0k0kq0300030030000kP31UDk1U01UDk0kBVUkAA0k1UkAA006kk0A7Tzsk0C3003MM033000M033000ADy0z000Dz0z00000000000000000000000000000000000000000000004"

; 문제 6 -> 6차시 평가 시 10문항 -> 수정
global TextNo6:="|<>*177$71.0000000000000000000000000000000000000Tz006M000001zz00Ak000003UC7wNU0DU0070QDwn01z000C0s0la070000Tzk1XA0Q0000Tz076M0k0000000Awk1j0000000xtU3z000zzz3sn077001zzyCta0A60000s0svA0MC0001k3UqM0kM001XU20Ak1Uk0037000NU3XU0060000n03y000A0001a03s000Tzk03A000000zzU00M0000000000000000000000000000000000000000000000000000000000000004"

Gui, Add, Text, x200 y20 w180 h30, 산업안전시청.txt
Gui, Add, Button, x10 y10 w180 h30, 산업안전시청
Gui, Add, Text, x200 y60 w180 h30, 경비직무시청.txt
Gui, Add, Button, x10 y50 w180 h30, 경비직무시청
Gui, Show, x1000 y400 w300 h110, PC로 보기
return

testText(imgFile)
{
	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 ./image/%imgFile%

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
	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 ./image/%imgFile%

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

findImg(imgFile)
{
	CoordMode pixel, screen

	ImageSearch, FoundX, FoundY, 0,0, A_ScreenWidth, A_ScreenHeight, *40 ./image/%imgFile%

	CoordMode mouse, screen

	if(ErrorLevel = 0)
	{
		str := % imgFile " 이미지 찾음 (findImg)"
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
	Text1o:="|<>*176$31.00000000000000000000000000300002U0000E0S0080NU0408E020480102400U1a00EUS00000000000000000000000000000000000004"

	; 2. x -> 수정
	Text2x:="|<>*165$31.000000000000000000000000001k000140000208U0102U0101U0100E0100Q0100+00y88U0000000000000000000000000000000000004"

	; 1번 -> 수정
	Text1:="|<>*176$33.0000003s0001zk000w7U0060A001U0k0kA060+300M0EM0302300M0EM0302300M0EA06021U0k0E60A000w7U001zk0003s000000004"

	; 2번 -> 수정
	Text2:="|<>*171$33.0000003s0001zk000w7U0060A001U0k1kA060F300M08M0301300M0EM0304300M10A060E1U0k3s60A000w7U001zk0003s000000004"

	; 3번 -> 수정
	Text3:="|<>*168$33.0000003s0001zk000Q700060A001U0k3kA0601300M08M0301300M1kM0301300M08A06011U0k3k60A000Q70001zk0003s000000004"

	; 4번 -> 수정
	Text4:="|<>*175$33.0000003s0001zk000w7U0060A001U0k0MA0607300M0cM0309300M28M030F300M7wA06011U0k0860A000w7U001zk0003s000000004"

	if (ok:=FindText(X, Y, 566-150000, 658-150000, 566+150000, 658+150000, 0, 0, Text1o))
	{
		; 3차시 문항일경우 OX 퀴즈
		Random, rbtn, 1, 2

		if (rbtn = 1) ; O 체크 버튼 클릭
		{
			if (ok:=FindText(X, Y, 566-150000, 658-150000, 566+150000, 658+150000, 0, 0, Text1o))
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
			if (ok:=FindText(X, Y, 565-150000, 692-150000, 565+150000, 692+150000, 0, 0, Text2x))
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
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] end`n, log.txt
	SoundPlay, *-1
	MsgBox, %err%
	ExitApp
}

logapp(err)
{
	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%] log`n, log.txt
}

waitLogo()
{
	Loop, 30
	{
		if (ok:=findImg("로고.png"))
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

; 강의 시청 모듈
watchLecture(lecture)
{
	idinfo := []
	varfile := 0
	checkIME()

	sleep 1000
	WinActivate, 한국이러닝교육센터 - Chrome
	sleep 1000

	;findImg("이어보기.png")
	;endapp("테스트 종료")

	; 산업안전, 경비직무 파일명 읽기
	if (lecture = "산업안전")
	{
		FileRead, varfile, % vSanViewID
	}
	else if (lecture = "경비직무")
	{
		FileRead, varfile, % vKyeongViewID
	}

	; 아이디.txt 파일 한줄씩 읽기
	Loop, Parse, varfile, `n
	{

		;idlist[A_Index] := A_LoopField

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
			if (ok:=findImg("개인정보변경.png"))
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
  		Loop, 30
  		{
			if (lecture = "산업안전")
			{
				if (ok:=clickImg("산업안전타이틀.png"))
					break
				else
					MouseClick WheelDown,,,1
			}
			else if (lecture = "경비직무")
			{
				if (ok:=clickImg("경비직무타이틀.png"))
					break
				else
					MouseClick WheelDown,,,1
			}

			sleep 1000

  		}

  		sleep 2000
		MouseClick WheelDown,,,9
		sleep 2000

		Loop, 12 ; 6차시 까지. - 이어보기 잘 안될경우 대비해서 12번 루프
		{
			; 이어보기 버튼 클릭 - 이어보기 버튼이 활성화 되어 있을 때에는 이어보기가 우선
			if (ok:=findImg("이어보기.png"))
			{
				; 이어보기 들어옴
				clickImg("이어보기.png")
				sleep 30000 ; 서버에 수강완료 데이터가 전송되는 시간 딜레이타임
			}
			else if (ok:=findImg("수강하기.png"))
			{
				; 수강하기 버튼 클릭
				clickImg("수강하기.png")
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
				if (ok:=findImg("학습종료.png"))
				{
					clickImg("학습종료.png")
					break
				}

				sleep 30000
			}

			sleep 3000
		}

		logapp("수강 완료 - 평가 시작")
		sleep 3000

		; 평가응시 버튼 클릭
		if (ok:=findImg("평가응시.png"))
			clickImg("평가응시.png")
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
		if (ok:=findImg("최종평가유의사항.png"))
		{
			; 설문 완료.
			clickImg("최종평가유의사항.png")
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
		if (ok:=findImg("평가재응시.png"))
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
		if (ok:=findImg("문제6.png"))
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
		if (ok:=findImg("최종제출후수정안됨.png"))
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

; 산업안전 시청
Button산업안전시청:
{
	watchLecture("산업안전")

	endapp("전체 완료\n에그를 끄세요!")

}

; 경비직무 시청
Button경비직무시청:
{

	watchLecture("경비직무")

	endapp("전체 완료\n에그를 끄세요!")

}

; 산업안전 인증
Button산업안전인증:
{

}

GuiClose:
ExitApp
