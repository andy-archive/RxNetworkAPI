# RxNetworkAPI
## 새싹 17주차 RxSwift 과제 
###  박스오피스 검색 화면
#### 구현 화면
| 날짜 | 231106 월 | 231107 화 | 
|:-:|:-:|:-:|
| 제목 | RxNetwork 네트워크 요청 성공 | 검색창의 텍스트에 의한 네트워크 요청 구현 |
| 화면 | ![#3 RxNetwork 네트워크 요청 성공  BUT 검색창이 반응하지 않음](https://github.com/andy-archive/RxNetworkAPI/assets/102043891/822ab8ec-9c84-4e2c-bad9-818cf5c1c716) | ![#5 RxNetwork 박스오피스 검색 화면과 검색창 텍스트 연결 성공 - 네트워크 통신](https://github.com/andy-archive/RxNetworkAPI/assets/102043891/ac04664b-020a-47a9-8829-9f7255897c9b) |
| 문제점 | 검색창이 반응하지 않음 | 적절하지 않은 값 입력 시 초깃값 설정 |
| 보완점 | 검색창의 text와, 검색창 클릭, 네트워크 통신 간의 Rx 문법을 살펴 봐야 함 | 오늘 날짜 또는 어제 날짜인 `yyyyMMdd` 형식의 Date를 초깃값으로 설정하기 |
| PR No. | [#4](https://github.com/andy-archive/RxNetworkAPI/pull/4) | [#5](https://github.com/andy-archive/RxNetworkAPI/pull/5) |

### 문제점 및 보완점
#### 231106 월
- Rx를 이용한 네트워크 통신에는 성공을 했지만,
- 검색창의 text와, 검색창 클릭, 네트워크 통신 간의 반응형 프로그래밍 로직에 어려움을 겪고 있음 
#### 231107 화
- 검색창에 부적절한 검색 입력 시 초깃값이 부족함
     - 오늘 날짜 또는 어제 날짜로
     - 형식은 `-` 없는 `yyyyMMdd`로 해야 할 듯
- MVVM으로의 전환 필요성
