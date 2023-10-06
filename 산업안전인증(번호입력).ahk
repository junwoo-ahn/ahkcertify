#include <Vis2>
#Include <FindText>

; 아이디 입력창
global TextInputID:="|<>*204$71.0000000000000000000000000000000000000000000000000000000000000300200A0000S60w47yM00016A2A880k00064MA8EE1U0008AkEMUU30000ENVUl1060000Unn1W20A00011a63440M00023A46880k00064MA8EE1U0004Mk8kUzv00007VUD100600000300200A00000600400M00000A00800k00000M00E01U00000000000000000000000000000000000000000000000001"

; 로그인버튼
global TextLoginIMG:="|<>*147$101.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy1zzzzzzzzzzzzzzzk1zzzzzzzzzzzzzzz01zzzzzzzzzzzzzzw01zzzzzzzzzzzzzzs03zzzzzzzzzzzzzzk03zzzzzzzzzzzzzz007zzzzzzzzzzzzzy00Dzzzzzzzzzzzzzw00Tzzzzzzzzzzzzzw00zzzzzzzzzzzzzzs03zzzzzzzzzzzzzzs07zzzzzzzzzzzzzzk0Tzzzzzzzzzzzzzzs1zzzzzzzzzzzzzzzyzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0zzzzzzzzzzzzzzzk0Tzzzzzzzzzzzzzy00Dzzzzzzzzzzzzzs00DzzzzzzzzzzzzzU00Dzzzzzzzzzzzzy000Dzzzzzzzzzzzzw000Tzzzzzzzzzzzzk000Tzzzzzzzzzzzz0000Tzzzzzzzzzzzy0000zzzzzzzzzzzzw0001zzzzzzzzzzzzk0001zzzzzzzzzzzzU0003zzzzzzzzzzzz00007zzzzzzzzzzzw00007zzzzzzzzzzzs0000Dzzzzzzzzzzzk0000TzzzzzzzzzzzU0000zzzzzzzzzzzz00001zzzzzzzzzzzy00003zzzzzzzzzzzw00007zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyDzzzzzzzw01zzzz0wTzzzzzzzs03w03w0szzzzzzzzzz7s07sklzzzzzzzzzyDzyDXlXzzzzzzzz00TzwT7X7zzzzzzzy00zzsyD6DzzzzzzzwTzzzlwSATzzzzzzzszzzzXwMMzzzzzzzzk07zz7s1lzzzzzzzzU0DzyDs7XzzzzzzzzyDzzwTzz7zzzzzzzzwTzzszlyDzzzzzzzzszzzlzXzzzzzzzzzU00k00T7zzzzzzzzz001U00yDzzzzzzzzzzzzzzzw03zzzzzzzzzzzzzzs07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"

; 개인정보변경 버튼
global TextPersonalInfo:="|<>*184$101.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz8zzXzz7zzzzszzls2Fs7706D7tsslk1Xz4XX6DlwSDnllXz77y96CATXswTbXU7y0DwGASMy61s0D06DswTlYMwlwbXlySCATVszX0llXXb7XwwQMy41yCFlX6DaD7tss1szXsQXkCDzwS03k1XXz7Vt7zwTs3ztzzz7y0y7mDXsz3XznzsyDksyTYT7zyDXzbzlzzXszz8yDzwT6007Xzz7lzyFwTzsQTzzz7zy77zwXs0Dw1zzzy03z0Tzt7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

; 비밀번호 (*)
global TextPass:="|<>*151$101.0000000000000000000000000000000000000000000000000000000000000000000000k0A030000206000ANXwMla1w00A04000Mn6AlXA0000k0A000laANX6Mzy01U08001XAMn7zk00021UM003yMlaANUT00ADEk006AlyAMn1VU0MTVU00ANU0Mza3300kC3000Mn0000A3w01Uo6000za3zUkM100300A0000A031U0200200M0000MDy307zw0600U0000kM0600000A0300001UzsDy0000A040000000000000080M0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001"

; email (*)
global TextEmail:="|<>*154$71.00000000000000000000000000000000000000000000000000000000M0k000000m01U0k1y0001Y0200U30000080A01U600000E0M430A3NkSAU0Ue20M7AF4N013y40zAMkAm021k81UMlXtY046kE30lXAn80800U61X6laE0M030A36BbAU0k060TaANyN00U08000000001U0k000000001U3000000000000000000000000000000000000000000000000000000000000000000000001"

; 수정완료 버튼
global TextRewrite:="|<>*163$81.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwTzzyTzyDzzzzzXzU1nw3lzzzzzwTw0CT06DU0Dzz1zyDnsslw01zzk7zlUSDaDzyDzsQDwA3sslw01zw7kTUyT063U0DzXzbs3nw1kQTzzzzzyA6TsyDXzzz0013tnU01w01zs00AzyQ00DU0DzzXzzUDzzlzb7zzwTzk0TXyDwszzzXzyDXwTzzb7zzwTzXyDXzy003zzXzyDXwTzk00TzwTzk0TU0DzzzzzXzzUDw01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 등록하시겠습니까?
global TextCheckReg:="|<>*123$161.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1y07yTDzyzzdznzzyTztzzzzzzDzzzDwyTnxw3Hzbzbww0HkTzzzyTzs0S04zbvzaby7zDtzQbgTzzzwzznzzztzDrzBDlXyTnyvDwzzzzs0Tbzz3nyTjy2SDkwzbtqTtzzzzzzz03wlbwzTtozzztzDnAzbzzzy00TtznnDsyzbdk03nyTiMSTzzzzzzznzba7ZxwTHzzzbwyQntzzzzz0TU07DAyNvnzbnwzDttnbnzzzzwyDzzzANttrySzbty03bbDzzzzztyTU1z3nbtjwxz03zzbySTzzzzznwzznzzbzzTtlyTbzzDwwyTzzzzXlzzbzzDzyzVXwzDzyTztwzzzzzUDzzDzyTzxyMHs0TzwzznzzzzzzzzzyTzwzzvttnzzzztzzbzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"

; 확인 버튼
global TextOK:="|<>*112$51.000000000000000000000000000000000000000000000EE010000Tu0w800000E8F0000DW22800022EEF0000EHW280001wE8F0000220w80007zE010000000U80001zk410000020U000000E400000020zs00000000000000000000000000000000000000000000000000004"

; 내 강의실 버튼
global TextMylec:="|<>*209$111.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003b0000Q000C000Q0000Qs0Dz3U1w1k1k3U03U3b01zsQ0zsC0C0Q00Q0Qs0073UD7Vk1k3U03U3b000sQ1kQC0C0Q00Q0Qs00D3UQ3Vk1k3U03U3b001kTnUCC0T0Q00Q0Qs00Q3yQ1lk3w3U03U3b007UQ3UQC0zkQ00Q0Ts03s3UC3VkDD3U03U3z01w0Q1swC7kwQ00Q0Qs0T03U7z1kw1XU03U3b03U0Q0DUC600Q00Q0Qs00000001k000003Uvb001zU000C0Tzw00TzQs00zy001xk3zzU01zXb00D1s7zzi000Q0000Qs01k3UzzVk003U0003b00S0Q000C0Tzw0000Qs03k3U001k3zzU0003b00C0Q000C0Q000000Qs01sD0001k3U000003b007zk000C0Tzy00000s00Ds0001k3zzk00000000000000000000000000000000000004"

; 산업안전보건 과정 타이틀
global TextSanTitle:="|<>*206$201.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000k000s003U001k0000003U00001zU0703UC07k70DUQ000C00003zkQ00000zz01k0Q1k3zUs3z3UDz1k703UTz3UTzz0D0w0A03UC0wS70swQ1zsC0s0w01sQ3zzs3k1k3U0Q1k71ksC3XU071k707U0C3U0070Q0C0s03UC1kDz1kCQ00sC0s0w01kQ000s3U1k700S1kC1zsC1nU0C1k7zzU0S3U0070D0w0s07kC1kC71kCQ01ny0zzw03UQ000s0zz0C00z1z71ksC1ny0QTk707U0xzU00701zU1k0CwDswQ71kQTk7kC0s0w0DDw000s0000C03ntk3z0s77XU1z1k707U3k3U3Xb00001k1wDC07k70TsQ0SyC0zzw0w0Q0QQsTzzyC0D0Nk000s1w3UD1tk7zz0T03U3Xb3zzzlk1U0C0000000Q3k6C00s07k0Q0QQs0QC0C0001k0s0s003UM01k0700M03U3Xi03Vk1k000C0707000Q000C00s0000Q0QRk0QC0C00s0k0s0s1k3U1k1k07003U3U3XU0Tzy1k070007zz0C000C0000s00Q000QQ03zzk700s000zzs1k001k01zzzw3U03zzzs00C0s070007070C000C00DzzzUQ00Tzzz001k700s000s0s1k001k0000003U00000000C0Q070007070C000C0000000Q000000001k3U0zzs0zzs1zzk1zzs00003zzk000000C0C07zz07zz0Dzy07zz00000Dzy0000001k0s00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

; 인증번호 발송 버튼
global TextAuth:="|<>*163$141.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzznw01zzszwTzwQMzyDzzzzzUyTU0D7b7zXzzXX7zlzzzzzs3nzkzswsw00TwQMzw7zzzzyCCTw3z7b7U03zU37z0Tzzzzllnw63s0szzzzw0M7UUzzzzyT6S1s7007y0TzXX0kT1zzzznsnszlsw0z01zwQMy6ADzzzyCCTzzz7b7sy7zU37zlzzzzzllnk00M0syDszw0Mw007zzzz0SS003077sy7zzzzU00zzzzw7nzzzzzsz01zz00zzzzzzzzzyTs1zzz7y0zzs07y0TzzzzwTnw03z7szwTzzzszU0zzzzzXzzVsTszzzXzzs07sT3zzzzwTzwTnz7zs00Dz00z7wTzzzzXzzVsTszz001zszzsT3zzzzw01w03z00Tzzzz00zU0zzzzzU0Ds1zs03zzzzs07y0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 인증번호가 발송되었습니다.
global TextSendAuth:="|<>*124$201.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzts07zyTyTzzbzzyTyTzzvzzjzDzztzzbwDDyTySnznzUAzwwnznzk3TUxztznzD0AyANzVznqS00ztbzbaTwDyTvtnjy7yTttzbnnDlXySnzzzzAzw0kyATnzSTBz6DnzDDwySNsz3k0Tk7ztbzbaT7sSTvnsD3wSTttzbnnDzzySnwyTyQzwwnznznzSTBzzznzDDwyANk03nqTDtznUzU6TyTy0Ptnj00CTttzVwDDzzy0nwyTwwzzzzk03yTTUxzzznzDDwzztz0zzyTk7zDbzs0TzzznvzzjnwyTttzbxzDXlzznznzXwzzznz0TyTTvnyTbk0DDwzjtwzDxyTyTtzbzs0TbtznvySTk0zzts0bxzzbtzjzU03zwzzDzwzDU1TlnyTbzzDzwzjzwSDxzzzzzzbztzzXtzzvyADnwzztzzbw0Ds7zU1zzzzwzz01z0TzzTYAy07zzDzwzzzzzzzzzzzzzbzzzzzzzzvtnnzzzztzzbzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 인증번호는
global TextAuthNum:="|<>*142$91.zzzzzzzzzzzzzzzzztzzzzznzzzzzzzUwy00wyNztzwzzzbCTyTyTAzwzyTzzbnDy3zDaS00TDzzntbsQDbnDzzzbzztwnkzXk07w0znzzwyNzzztwnwSDs07zCQzzzwyNyznzzzzkSQ006TAzTtzzzzzzDzzz06TXls00DzzbzzzzzDs1zzzzyTny0TzzbzbzzzzzDtyD7yTnznztzzzbzzDtzDzztzwzzznzzbwzbzs00CTzztzzlsznzzzzzDzzw03w0zs07zzzU0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 인증번호 입력칸
global TextInputAuth:="|<>*195$141.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000063zz000k0A000w2001U000DUk0M063601U00MMEDwA00066603U0kMkDzw021201VU000UMk1X063600000kAE0Bw000A360sC0kMk000061W01VU001U8kQ0Q7zy0Ds00kAEDwA000A360000kMk30k02121UDU000UMk0006360k300MMEA0A000666DzzkkMk40M00w21U1U000DUk0007z60k300000DyA000006000000k30k00U2001U00000k1z00060Dw0040E0000003060kC0A0k0A000U20TzU000M0kA0E1U601U007zk00A0003001U20A000A000U2001U000M00A0E1U07zzs040E00A0003000sC0A0000000U2001U000Tzk1z01zz000007zk00A000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004"

; 인증하기 버튼
global TextAuthBtn:="|<>*160$101.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzyDU0DwT7zzXzzzzz0wT00TsyDzz7zzzzw0szwDzlwT06DzzzzsklzUDs00y0ATzzzzXlXw47k01zwMzzzzz7X7US3zzXztlzzzzyD6DXz7s77zXXzzzzwSATzzzU6Dz77zzzzwMMs00C643wSDzzzzs1lk00QS87lwTzzzzs7XzzzswFz3szzzzzzz7w0TkkXsDlzzzzzlyDk0Tk37VzXzzzzzXzz3sTkCDbz7zzzzz7zyDszzwTzyDzzzzyDzwDVzzszzwTzzzzw03w07zzlzzszzzzzs07w0TzzXzzlzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

; 인증확인 되었습니다
global TextAuthOK:="|<>*122$141.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzww03yTDzyzzztzzbzDzztzy7bzDznty3rzk3DUwztztzD76Azkzk1DbCzyTttnby7zDttttbslzztxwrznzDDAz6DtzDDDAwTVs7DDazyTtvs7XwDDttttbzzySMRwrznzDDAzzztzDD6As01nnDbCzy0Ntnb00DDtty7bzzz0ty3rzyTDUwzzztzDDzwzUTyTDzyzzntzzbnwzDttyzblsw01yTrzyTDtnyTbs0DDrwyTbzzznyzzntzCTk0zztsyzznwz01yTzzU1DllyTbzzDzrzyD7zzDnzzzzty4Dnwzztzy07w3zzty03zzzDa4y07zzDzzzzzzzzDzzzzztttnzzzztzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 로그아웃 버튼
global TextLogout:="|<>*185$75.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz7w0zzs07k0TUsz7XzzzszzXsX7lyDzzz7zwTC8yDlzz00zzXll7swTzszzzwSC8zU7zz7zzzXlt0zzzzszzzwSC8zzzzz00zzXll7003zznzzwTC8zwzzzyTzzXsX7zzzzznzzwTUszwzzw00800zz7z3zzzzzzzzzszkDzzzzzzzzz7sMTzzzzzzzzswDlzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw"

; 한국이러닝교육센터 로고
global TextLogo:="|<>*158$201.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003s00000000000000000000000000000000TU0w00000003s03k00007U0000T0000003w0Dk7zzzs03zs0z3zzy1y7k007s7zzz0zzzly0zzzzU0zzk7sTzzsDky000z0zzzsDzzyDk7zzzy0Tzz0z3zzz1y7k007s7zzz1zzzly0zzzzs3zzw7sTzzsDky000z0zzzsDzzyDk7zzzz0ztzUz1zzz1y7k007s3zzz0zzzly00007s7w3y7s007sDky000z000000000Dk0000z0z0Dkz000z1y7k007s00000Dzy1y00003s7k1y7s007sDky000z000003zzsDz0000T0y0Dkz000z1y7k007s00000TzzVzs0003s7k1y7s007sDky000z000007zzwDz0000T0y0Dkz000z1y7k007s00000zUTlzs0003s7k1y7s007sDkz000z000007s1yDz0000T0y0Dkz000zDy7zzw7s00000z0Tly0000007k1y7sDzzzzkzzzkz000007zzwDkTzzzzsy0Dkz3zzzzy7zzy7s00000TzzVy7zzzzz7k1y7sTzzzzkTzzkz000003zzwDkzzzzzsy0Dkz3zzzzy1zzy7s0z7s0Dzz1y7zzzzz7k1y7sTzztzk0000z07sz00Dz0DkTzzzzky0Dkz3w001y0000000z7s00001y0Tzzs07k1y7sTU00Dk1zzzk07sz00000Dk7zzzk0y0Dkz3w001y1zzzzU0z7s0T001y0zzzzU7k1y7sTU00DkTzzzy07sz03s00007zzzy0y0Dkz3w001y3zzzzs0z7s0T00000zzzzs7k1y7sTU00Dkzzzzz07sz03s00007zzzz0y0Dkz3w001y7w007s0z7s0T000000007s7s1y7sTU00Dkz000TU7sz03w00000000z0z0Tkz3y001y7s003w0z7s0Tzzzw00003s7yDw7sDzzkDkzzzzz3zzzs3zzzzk0000T0TzzUz1zzz1y7zzzzsTzzz0Dzzzy00003s3zzs7s7zzsDkTzzzz7zzzs1zzzzk0000T0Dzy0z0Tzz1y1zzzzkzzzz03zzzy00003s0TzU7s1zzsDk7zzzw3zzzs0000000000000D0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100000000T0000000000A00000y0A0000As00000007s0300000000U0000Dk1U0001a00000000s00M0000000400001k0g0000DUT1wDUy070030DUy3sz1Vy3w0A0TVX3s1s3AC3i6s0z00M1i6sQ7QADsNU1w7QAMQ0DUtlUTkT07sD30DkT30lVVX7A0DklVX301w6CA3y7s0s00M3y7sM6AAAMlU1k6AAME0BktlUTVz070030Dkz30lVVX7A0A0lVb301b3AA3UCs0s00M1U6sM6AAAMTU1k7QCsM0AMTVUDUz07w03wDkz30lVVX3w0DsTUz3s0000000000000000000000001U00000000000000000000000000000001w00000000000000000000000000000000T000000000000000000000000000000000000000004"

; 로그인 오류 메시지
global TextCheckPass:="|<>*205$121.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003zzk0000000000000000zzzzk000000000000003zzzzz00000000000000Dzzzzzw0000000000000zzzzzzzk000000000001zzw00zzy000000000003zz0000zzk00000000007zs00001zy00000000007zk00000DzU000000000Dz0000000zw000000000Dy00000007z000000000Tw00000000zs00000000Tw00000000Dy00000000Ts000000001zU0000000Ts000000000Ts0000000Tk0000000003y0000000Tk0000000000zU000000Tk0000000000Ds000000Tk00000000003y000000Tk00000000000zU00000Tk00000000000Ds00000Tk000000000003y00000Dk000000000000z00000Dk000000000000Dk0000Dk0000000000003w00007s0000000000001y00007s0000000000000TU0007s00000000000007s0003w00000000000003w0003w00000000000000z0001w00000000000000DU001y000000000000007s000y0000M00000C0001w000z0000y00000DU000z000T0000TU0000Dk000DU00DU000Ds0000Ds0007k00Dk0007y0000Dw0003w007k0001zU000Dw0000y003s0000Ts000Dw0000T003s00007y000Dw00007k01w00001zU00Dw00003s00y00000Ts00Dw00001w00z000007y00Dw00000z00T000001zU0Dw00000DU0DU00000Ts0Dw000007k07k000007y0Dw000003s03s000001zUDw000001w03w000000TsDw000000z01w0000007yDw000000DU0y0000001zzw0000007k0T0000000Tzw0000003s0DU0000007zw0000001w07k0000001zw0000000y03s0000000Tw0000000T01w0000000Dy0000000DU0y0000000DzU0000007k0T0000000Dzs0000003s0DU000000Dzy0000001w07k000000DzzU000000y03s000000DwTs000000T01w000000Dw7y000000DU0y000000Dw1zU000007k0TU00000Dw0Ts000007s07k00000Dw07y000003s03s00000Dw01zU00001w01w00000Dw00Ts00000y00y00000Dw007y00000T00TU0000Dw001zU0000TU07k0000Dw000Ts0000DU03s0000Dw0007y00007k01w0000Dw0001zU0003s00T0000Dw0000Ts0003s00DU000Dw00007w0001w007s0003w00001y0001y001w0001w00000T0000y000y0000Q0000070000T000TU00000000000000TU007k00000000000000DU003w00000000000000Dk000y000000000000007k000TU00000000000007s0007s00000000000007s0003w00000000000003w0000z00000000000003w0000Dk0000000000003w00007s0000000000001y00001y0000000000001y00000TU000000000001y00000Ds000000000001z000003y000000000001z000000zU00000000001z000000Ds00000000001z0000003y00000000001z0000000zU0000000001z0000000Ds0000000001z00000003z0000000003z00000000zk000000003z00000000Dy000000007z000000003zU00000007z000000000Tw0000000Dy0000000007zU000000Ty0000000000zy000001zw0000000000Dzk00003zw00000000001zzU000Tzs00000000000DzzU07zzk000000000001zzzzzzzU0000000000007zzzzzy00000000000000Tzzzzs000000000000001zzzzU0000000000000001zzs000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E"

; 메시지 앱 알림창
global TextMsgAlarm:="|<>*125$77.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz/zyTznz0Dzzs2Ltws1by0DzznYjntyTDw0Tzzb9TbnwyTs0zzzCGzDbtwzk1zzyQ5yTDltzU3zzwt/wSTXnz07zztmLmwyLbz0TzznYjgtwbDy0zzzU9SQnnaTw1zzzzmtwbDYzzzzzzzZzzDztzzzzzzz/zyTznzzzzzzyLzwzzbzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"

; 개인정보수정 그림
global TextWelcome:="|<>*214$121.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003z0000000000000000007zs000000000000000007zy000000000000000007zzU00000000000000007zzk00000000000000003zzw00000000000000003zzy00000000000000001zzzU0000000000000000zzzk0000000000000000Tzzs0000000000000000Dzzw00000000000000007zzy00000000000000003zzz00000000000000000zzz00000000000000000TzzU00000000000000007zzU00000000000000003zzU00000000000000000TzU000000000000000007zU000000000000000000A0000000000000000000000000000000000000000000000000000000000000000000000000000000Dy000000000000000000zzs00000000000000000zzy00000000000000000zzzk0000000000000001zzzw0000000000000001zzzz0000000000000001zzzzk000000000000000zzzzw000000000000000zzzzy000000000000000zzzzzU00000000000000Tzzzzs00000000000000Tzzzzw00000000000000Tzzzzz00000000000000DzzzzzU00000000000007zzzzzk00000000000007zzzzzw00000000000003zzzzzy00000000000001zzzzzz00000000000000zzzzzzk0000000000000zzzzzzs0000000000000Tzzzzzw0000000000000Dzzzzzy00000000000007zzzzzzU0000000000003zzzzzzk0000000000001zzzzzzs0000000000001zzzzzzw0000000000000zzzzzzy0000000000000Tzzzzzz00000000000007zzzzzzU000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006M01k01k00003U03000TnA7UsTssQ1UktlzlU00DxaDwQDwQC0kMQszsk000Cn7CC0CC70MADw0Ts0006Nb3b0Cz3zw7zy0Dw0003AnVnUDTVzy3zb0C60003aNktkDlks31VnUC30001nwQssSSsQ1UkzkCTU001lyDwQS6QDzkTzsTDk000kn1sCA0C7zsDwQS0M000sNU0700707000CC0A000sAk03U3w03U0070Ds001s6MC1k7zU1k0A3UDz000M3A7007Vtzzw600C3U0001a3U03UQzzy30060k0000n1k01sS0001U03Us0000NUzz0Ty0000zy0zw00000kDzU7w0000Tz0Ds00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E"

telNum := []
FileRead, varNum, 인증번호.txt

Loop, Parse, varNum, `n
{
	Loop, Parse, A_LoopField, " "
		telNum[A_Index] := A_LoopField
}

Gui, Add, Button, x10 y50 w170 h30, 인증시작
Gui, Add, Edit, x10 y10 w50 h20, 010
Gui, Add, Edit, x70 y10 w50 h20 vEditMiddle, % telNum[2]
Gui, Add, Edit, x130 y10 w50 h20 vEditEnd, % telNum[3]
Gui, Show, x1000 y400 w190 h100, 산업안전인증
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

IME_CHECK(WinTitle) {
    WinGet,hWnd,ID,%WinTitle%
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}

Send_ImeControl(DefaultIMEWnd, wParam, lParam) {
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
	;sendMsg(qwer1234{!})

	FileAppend, [%A_Mon%/%A_MDay% %A_Hour%:%A_Min%:%A_Sec%][%err%]`n, log.txt
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
		sleep 1000
		if (ok:=FindText(X, Y, 389-150000, 261-150000, 389+150000, 261+150000, 0, 0, TextLogo))
			return
	}
	endapp("화면 로딩 시간초과")
}

Button인증시작:
{
	Gui, Submit,

	FileDelete, 인증번호.txt
	FileAppend, 010 %EditMiddle% %EditEnd%, 인증번호.txt
	;MsgBox, % EditMiddle
	;MsgBox, % EditEnd

	idinfo := []

	sleep 1000
	WinActivate, 한국이러닝교육센터 - Chrome
	sleep 1000

	FileRead, varfile, 인증아이디.txt
	;FileRead, varfile2, 인증전화번호.txt

	; 아이디.txt 파일 한줄씩 읽기
	Loop, Parse, varfile, `n
	{
        checkIME()
		;idlist[A_Index] := A_LoopField

 		idinfo := []
 		; 아이디.txt 파일 읽기, 아이디, 전화번호 구분, idinfo[1] = ID, idinfo[3] = 가운데 전화번호, idinfo[4] = 세번째 전화번호
 		Loop, Parse, A_LoopField, " "
			idinfo[A_Index] := A_LoopField

		if(!A_LoopField)
			break

		checkPass = 1

		Loop, 2
		{
			checkPass = 1

			if (ok:=FindText(X, Y, 1309-150000, 521-150000, 1309+150000, 521+150000, 0, 0, TextInputID))
				FindText().Click(X, Y, "L")
			else
				endapp("아이디 입력창을 못찾음")

			RegEx := RegExReplace(A_LoopField, " ")

			sleep 500
			Send, % idinfo[1]
			Send, {Tab}
			sleep 500

			if (A_Index = 1)
				Send, 1234 ; 로그인 비번 qwer1234{!}
			else
				Send, qwer1234{!} ; 로그인 비번 1234
			sleep 500

			; 로그인 버튼 클릭
			if (ok:=FindText(X, Y, 592-150000, 476-150000, 592+150000, 476+150000, 0, 0, TextLoginIMG))
				FindText().Click(X, Y, "L")
			else
				endapp("로그인 버튼을 못찾음")

			Sleep 1000
			Click 68,437
			sleep 1000
			waitLogo()

			if (ok:=FindText(X, Y, 336-150000, 399-150000, 336+150000, 399+150000, 0, 0, TextWelcome))
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
				sleep 500

				; 로고 클릭
				if (ok:=FindText(X, Y, 389-150000, 261-150000, 389+150000, 261+150000, 0, 0, TextLogo))
				{
					FindText().Click(X, Y, "L")
					sleep 1000
					waitLogo()
				}
				else
					endapp("로고 버튼을 못찾음")
			}

			if (checkPass = 1)
				break ; 비번 맞음
			else
				continue
		}

		if (checkPass = 0)
			endapp("비번 1234, qwer1234! 둘 다 틀림")

  		sleep 3000
		logapp(idinfo[1])

  		; 개인정보변경 시작
  		if (ok:=FindText(X, Y, 1581-150000, 161-150000, 1581+150000, 161+150000, 0, 0, TextPersonalInfo))
  			FindText().Click(X, Y, "L")
  		else
  		{
  			endapp("개인정보수정 버튼을 못찾음")
  		}

  		sleep 5000

  		MouseClick WheelDown,,,4
  		sleep 2000

  		if (ok:=FindText(X, Y, 634-150000, 315-150000, 634+150000, 315+150000, 0, 0, TextPass))
  			FindText().Click(X+200, Y, "L")
  		else
  			endapp("비밀번호 글자를 못찾음")

  		sleep 500
  		Send, qwer1234{!}
  		Send, {Tab}
  		sleep 500
  		Send, qwer1234{!}
  		sleep 500
  		Send, {Tab} ; 전화번호 국번 입력
  		sleep 500
		Send, {Down}
		sleep 100
		Loop, 7
			Send, {Up}
		sleep 500
  		Send, {Tab}
  		sleep 500
  		Send, % EditMiddle
  		sleep 500
  		Send, {Tab}
  		sleep 500
  		Send, % EditEnd
  		sleep 500

  		; 이메일 위치 찾기
  		if (ok:=FindText(X, Y, 621-150000, 529-150000, 621+150000, 529+150000, 0, 0, TextEmail))
  			FindText().Click(X+200, Y, "L")
  		else
  			endapp("email (*) 글자를 못찾음")

  		Send, ^{a}
  		Send, a
  		sleep 500
  		Send, {Tab}
  		sleep 500
  		Send, gmail.com
		sleep 1000

  		; 수정완료 버튼 클릭
  		if (ok:=FindText(X, Y, 1136-150000, 819-150000, 1136+150000, 819+150000, 0, 0, TextRewrite))
  			FindText().Click(X, Y, "L")
  		else
  			endapp("수정완료 버튼을 못찾음")

  		sleep 1000

  		; 등록하시겠습니까 메뉴 확인
  		if (ok:=FindText(X, Y, 768-150000, 161-150000, 768+150000, 161+150000, 0, 0, TextCheckReg))
  		{
  			sleep 1000

  			if (ok:=FindText(X, Y, 1089-150000, 213-150000, 1089+150000, 213+150000, 0, 0, TextOK))
  				FindText().Click(X, Y, "L")
  			else
  				endapp("확인 버튼을 못찾음")

  			sleep 2000

  			if (ok:=FindText(X, Y, 1089-150000, 213-150000, 1089+150000, 213+150000, 0, 0, TextOK))
  				FindText().Click(X, Y, "L")
  			else
  				endapp("확인2 버튼을 못찾음")
  		}
  		else
  			endapp("등록하시겠습니까? 버튼 못찾음")

  		sleep 1000
  		MouseClick WheelUp,,,6
  		sleep 2000

  		; 내 강의실 클릭
  		if (ok:=FindText(X, Y, 1683-150000, 285-150000, 1683+150000, 285+150000, 0, 0, TextMylec))
  			FindText().Click(X, Y, "L")
  		else
  			endapp("내강의실 버튼 못찾음")

  		sleep 5000

  		; 산업안전보건 과정 찾기
  		Loop, 5
  		{
  			if (ok:=FindText(X, Y, 834-150000, 658-150000, 834+150000, 658+150000, 0, 0, TextSanTitle))
  			{
  				FindText().Click(X, Y, "L")
  				break
  			}
  			else
  				MouseClick WheelDown,,,6
  			sleep 1000
  		}

  		sleep 3000

  		; 인증번호 발송 버튼 클릭
  		if (ok:=FindText(X, Y, 566-150000, 971-150000, 566+150000, 971+150000, 0, 0, TextAuth))
  			FindText().Click(X, Y, "L")
  		else
		{
			; 산업안전 인증 받았을 경우
			sleep 3000
			MouseClick WheelUp,,,6
			sleep 1000

			; 개인정보변경 시작
			if (ok:=FindText(X, Y, 1581-150000, 161-150000, 1581+150000, 161+150000, 0, 0, TextPersonalInfo))
				FindText().Click(X, Y, "L")
			else
			{
				endapp("개인정보수정 버튼을 못찾음")
			}

			sleep 5000

			MouseClick WheelDown,,,4
			sleep 2000

			if (ok:=FindText(X, Y, 634-150000, 315-150000, 634+150000, 315+150000, 0, 0, TextPass))
				FindText().Click(X+200, Y, "L")
			else
				endapp("비밀번호 글자를 못찾음")

			sleep 500
			checkIME()
			Send, qwer1234{!}
			Send, {Tab}
			sleep 500
			Send, qwer1234{!}
			sleep 500
			Send, {Tab}
			sleep 500
			Send, {Tab}
			sleep 500

			Send, % idinfo[3]
			sleep 500
			Send, {Tab}
			sleep 500
			Send, % idinfo[4]
			sleep 500

			; 수정완료 버튼 클릭
			if (ok:=FindText(X, Y, 1136-150000, 819-150000, 1136+150000, 819+150000, 0, 0, TextRewrite))
				FindText().Click(X, Y, "L")
			else
				endapp("수정완료 버튼을 못찾음")

			sleep 1000

			; 등록하시겠습니까 메뉴 확인
			if (ok:=FindText(X, Y, 768-150000, 161-150000, 768+150000, 161+150000, 0, 0, TextCheckReg))
			{
				sleep 2000

				if (ok:=FindText(X, Y, 1089-150000, 213-150000, 1089+150000, 213+150000, 0, 0, TextOK))
				{
					;FindText().Click(X, Y, "L")
					Send, {Space}
				}
				else
					endapp("확인 버튼을 못찾음")

				sleep 2000

				if (ok:=FindText(X, Y, 1089-150000, 213-150000, 1089+150000, 213+150000, 0, 0, TextOK))
				{
					;FindText().Click(X, Y, "L")
					Send, {Space}
				}
				else
					endapp("확인2 버튼을 못찾음")
			}
			else
				endapp("등록하시겠습니까? 버튼 못찾음")

			sleep 1000
			MouseClick WheelUp,,,6
			sleep 1000

			; 로그아웃 버튼
			if (ok:=FindText(X, Y, 1699-150000, 161-150000, 1699+150000, 161+150000, 0, 0, TextLogout))
				FindText().Click(X, Y, "L")
			else
				endapp("로그아웃 버튼을 못찾음")

			sleep 8000
			if (ok:=FindText(X, Y, 389-150000, 261-150000, 389+150000, 261+150000, 0, 0, TextLogo))
				FindText().Click(X, Y, "L")
			else
				endapp("로고 버튼을 못찾음")

			sleep 5000

			continue
		}

  		sleep 3000

  		if (ok:=FindText(X, Y, 800-150000, 162-150000, 800+150000, 162+150000, 0, 0, TextSendAuth))
  		{
  			if (ok:=FindText(X, Y, 800-150000, 162-150000, 800+150000, 162+150000, 0, 0, TextOK))
			{
  				;FindText().Click(X, Y, "L")
				Send, {Space}
			}
  			else
  				endapp("인증번호 발송 확인 버튼 못찾음")

 		}
  		else
  			endapp("인증번호가 발송되었습니다. 못찾음")


  		sleep 1000

        loop, 60
        {
            if (ok:=FindText(X, Y, 699-150000, 469-150000, 699+150000, 469+150000, 0, 0, TextMsgAlarm))
                break
            else
                sleep 1000
        }

		sleep 1000
  		WinActivate, 휴대폰과 연결
  		sleep 2000

  		RegEx := 0

  		; 인증번호 받기 루틴
  		if (ok:=FindText(X, Y, 1309-150000, 521-150000, 1309+150000, 521+150000, 0, 0, TextAuthNum))
  		{
  			FindAuthNum := ok.Length()

  			;MsgBox, % "ok[FindAutnNum].x is " ok[FindAuthNum].x " " ok[FindAuthNum].y

  			CoordMode, Mouse, Screen
  			MouseMove, ok[FindAuthNum].x, ok[FindAuthNum].y
  			MouseClick Left, ok[FindAuthNum].x, ok[FindAuthNum].y
			sleep 500
  			Send, ^{a}
			sleep 500
  			Send, ^{c}
			sleep 500
  			;MsgBox, % "clipboard is " clipboard
  			RegEx := RegExReplace(clipboard, "\D")
  			;MsgBox, % "RegEx is " RegEx
  		}

  		sleep 1000
  		WinActivate, 한국이러닝교육센터 - Chrome
        sleep 2000

  		; 인증번호 입력
  		if (ok:=FindText(X, Y, 761-150000, 968-150000, 761+150000, 968+150000, 0, 0, TextInputAuth))
  			FindText().Click(X, Y, "L")
  		else
  			endapp("인증번호 입력칸 못찾음")

  		sleep 1000
  		Send, % RegEx
  		sleep 1000
  		Send, {Tab}
  		sleep 1000
  		Send, {Space}
  		sleep 1000

  		; 인증하기 버튼 클릭
  		if (ok:=FindText(X, Y, 927-150000, 969-150000, 927+150000, 969+150000, 0, 0, TextAuthBtn))
  			FindText().Click(X, Y, "L")
  		else
  			endapp("인증하기 버튼 못찾음")

		sleep 1000

  		; 인증이 완료되었습니다.
  		if (ok:=FindText(X, Y, 774-150000, 352-150000, 774+150000, 352+150000, 0, 0, TextAuthOK))
  		{
  			if (ok:=FindText(X, Y, 800-150000, 162-150000, 800+150000, 162+150000, 0, 0, TextOK))
  				FindText().Click(X, Y, "L")
  			else
  				endapp("인증번호 발송 확인 버튼 못찾음")
  		}
  		else
  			endapp("인증완료 되었습니다 알림 못찾음")

  		sleep 3000
  		MouseClick WheelUp,,,6
  		sleep 1000

		; 개인정보변경 시작
		if (ok:=FindText(X, Y, 1581-150000, 161-150000, 1581+150000, 161+150000, 0, 0, TextPersonalInfo))
			FindText().Click(X, Y, "L")
		else
		{
			endapp("개인정보수정 버튼을 못찾음")
		}

		sleep 5000

		MouseClick WheelDown,,,4
		sleep 2000

		if (ok:=FindText(X, Y, 634-150000, 315-150000, 634+150000, 315+150000, 0, 0, TextPass))
			FindText().Click(X+200, Y, "L")
		else
			endapp("비밀번호 글자를 못찾음")

		sleep 500
		checkIME()
		Send, qwer1234{!}
		Send, {Tab}
		sleep 500
		Send, qwer1234{!}
		sleep 500
		Send, {Tab}
		sleep 500
		Send, {Tab}
		sleep 500

		Send, % idinfo[3]
		sleep 500
		Send, {Tab}
		sleep 500
		Send, % idinfo[4]
		sleep 500

		; 수정완료 버튼 클릭
		if (ok:=FindText(X, Y, 1136-150000, 819-150000, 1136+150000, 819+150000, 0, 0, TextRewrite))
			FindText().Click(X, Y, "L")
		else
			endapp("수정완료 버튼을 못찾음")

		sleep 1000

		; 등록하시겠습니까 메뉴 확인
		if (ok:=FindText(X, Y, 768-150000, 161-150000, 768+150000, 161+150000, 0, 0, TextCheckReg))
		{
			sleep 2000

			if (ok:=FindText(X, Y, 1089-150000, 213-150000, 1089+150000, 213+150000, 0, 0, TextOK))
			{
				;FindText().Click(X, Y, "L")
				Send, {Space}
			}
			else
				endapp("확인 버튼을 못찾음")

			sleep 2000

			if (ok:=FindText(X, Y, 1089-150000, 213-150000, 1089+150000, 213+150000, 0, 0, TextOK))
			{
				;FindText().Click(X, Y, "L")
				Send, {Space}
			}
			else
				endapp("확인2 버튼을 못찾음")
		}
		else
			endapp("등록하시겠습니까? 버튼 못찾음")

		sleep 1000
		MouseClick WheelUp,,,6
		sleep 1000

		; 로그아웃 버튼
		if (ok:=FindText(X, Y, 1699-150000, 161-150000, 1699+150000, 161+150000, 0, 0, TextLogout))
			FindText().Click(X, Y, "L")
		else
			endapp("로그아웃 버튼을 못찾음")

		sleep 8000
		if (ok:=FindText(X, Y, 389-150000, 261-150000, 389+150000, 261+150000, 0, 0, TextLogo))
			FindText().Click(X, Y, "L")
		else
			endapp("로고 버튼을 못찾음")

		sleep 5000

	}

	endapp("전체 완료")


}

GuiClose:
ExitApp
