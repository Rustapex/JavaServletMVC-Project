# Servlet/JSP 기반 영화 예매 MVC 웹 프로젝트

Servlet, JSP, DAO, DTO, Service 계층을 기반으로 제작한 영화 예매 웹 프로젝트입니다.
회원 관리, 영화 검색, 영화 상세 조회, 좌석 예매, 관람 기록, 리뷰, 친구 기능, 관리자 기능을 도메인별 패키지로 분리하여 구현했습니다.

---

## 1. 프로젝트 소개

이 프로젝트는 Java Servlet/JSP와 MVC 패턴을 학습하기 위해 제작한 영화 예매 웹 애플리케이션입니다.
사용자는 회원가입과 로그인을 통해 서비스를 이용할 수 있으며, 영화 검색, 영화 상세 조회, 좌석 선택, 예매, 예매 내역 확인 등의 기능을 사용할 수 있습니다.

또한 관리자 기능을 통해 회원, 상영 일정, 상영관, 좌석 등의 데이터를 관리할 수 있도록 구성했습니다.

---

## 2. 주요 기능

### 사용자 기능

* 회원가입
* 로그인 / 로그아웃
* 네이버 로그인 연동
* 영화 검색
* 영화 상세 조회
* 영화 예매
* 좌석 선택
* 예매 내역 조회
* 예매 수정 / 취소
* 관람 기록 다이어리 생성
* 리뷰 작성 및 조회
* 친구 기능
* 개인 일정 관리

### 관리자 기능

* 관리자 메인 화면
* 회원 목록 조회
* 회원 권한 변경
* 영화 관리
* 상영 일정 등록 / 수정 / 삭제
* 상영관 관리
* 좌석 관리
* 에러 로그 조회

---

## 3. 기술 스택

| 구분           | 사용 기술                              |
| ------------ | ---------------------------------- |
| Language     | Java                               |
| Web          | Servlet, JSP, JSTL                 |
| Frontend     | HTML, CSS, JavaScript, jQuery      |
| Database     | Oracle DB                          |
| Server       | Apache Tomcat 9                    |
| Library      | Gson, JSON, ojdbc8                 |
| Architecture | MVC Pattern, DAO/DTO/Service Layer |
| External API | KMDB API, Naver Login OAuth        |

---

## 4. 프로젝트 구조

```text
JavaServletMVC-Project/
├── src/
│   └── main/
│       ├── java/
│       │   ├── admin/
│       │   ├── common/
│       │   ├── diary/
│       │   ├── friend/
│       │   ├── member/
│       │   ├── movie/
│       │   ├── reservation/
│       │   ├── review/
│       │   ├── schedule/
│       │   └── screen/
│       ├── resources/
│       │   └── config.example.properties
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── lib/
│           │   └── views/
│           ├── css/
│           ├── img/
│           └── js/
├── .classpath
├── .project
└── README.md
```

---

## 5. 실행 환경

이 프로젝트는 Spring Boot 프로젝트가 아니라 Servlet/JSP 기반 웹 프로젝트입니다.
Eclipse Dynamic Web Project와 Apache Tomcat 9 환경을 기준으로 실행합니다.

필요한 실행 환경은 다음과 같습니다.

* Java
* Apache Tomcat 9
* Oracle DB
* Eclipse IDE 또는 Servlet/JSP 실행이 가능한 IDE
* ojdbc8
* JSTL
* Gson
* JSON 라이브러리

---

## 6. 환경 설정

`src/main/resources/config.example.properties` 파일을 참고하여
같은 위치에 `config.properties` 파일을 생성한 뒤 개인 API 키와 OAuth 설정 값을 입력합니다.

```properties
KMDB_SERVICE_KEY=your-kmdb-service-key
KMDB_API_URL=https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp

NAVER_CLIENT_ID=your-naver-client-id
NAVER_CLIENT_SECRET=your-naver-client-secret
NAVER_CALLBACK_URL=http://localhost:8080/MoviePrj/member/naverCallback.do
```

> 실제 API 키와 Client Secret은 GitHub에 올리지 않도록 주의해야 합니다.

---

## 7. 실행 방법

1. 레포지토리를 clone합니다.

```bash
git clone https://github.com/Rustapex/JavaServletMVC-Project.git
```

2. Eclipse에서 프로젝트를 import합니다.

```text
File → Import → Existing Projects into Workspace
```

3. Apache Tomcat 9 서버를 설정합니다.

```text
Servers → New → Server → Apache Tomcat v9.0
```

4. Oracle DB 연결 정보를 설정합니다.

5. `config.example.properties`를 참고해 `config.properties`를 생성합니다.

6. Tomcat 서버에 프로젝트를 추가한 뒤 실행합니다.

7. 브라우저에서 아래 주소로 접속합니다.

```text
http://localhost:8080/MoviePrj
```

---

## 8. 주요 구현 흐름

### 회원 로그인

* 로그인 화면에서 아이디와 비밀번호 입력
* `LoginServlet`에서 요청 처리
* `MemberService`를 통해 회원 정보 확인
* 로그인 성공 시 세션에 `loginMember` 저장
* 메인 화면으로 이동

### 영화 검색

* 사용자가 검색어 입력
* `MovieSearchServlet`에서 검색어와 페이지 번호 처리
* `MovieSearchService`에서 영화 검색 결과 조회
* JSP 화면으로 검색 결과 전달

### 영화 예매

* 사용자가 영화와 상영 일정을 선택
* 좌석 선택 후 예매 요청
* 로그인 회원 여부 확인
* 선택한 좌석 ID 목록 처리
* 예매 생성
* 예매 성공 시 관람 기록 다이어리 생성

---

## 9. 구현 포인트

### 1. MVC 패턴 적용

Servlet은 Controller 역할을 담당하고, JSP는 View 역할을 담당하도록 구성했습니다.
비즈니스 로직은 Service 계층으로 분리하고, DB 접근은 DAO 계층에서 처리하도록 설계했습니다.

### 2. 도메인별 패키지 분리

회원, 영화, 예매, 리뷰, 친구, 관리자 기능을 각각 별도 패키지로 분리하여 기능별 책임을 구분했습니다.

### 3. 세션 기반 로그인 처리

로그인 성공 시 세션에 로그인 회원 정보를 저장하고, 예매와 같은 회원 전용 기능에서 세션을 확인하도록 구현했습니다.

### 4. 외부 API 연동 구조

KMDB API를 활용한 영화 검색 구조와 Naver Login OAuth 설정 구조를 포함했습니다.

### 5. 예매와 관람 기록 연계

영화 예매가 완료되면 해당 예매 정보를 기반으로 관람 기록 다이어리를 생성하는 흐름을 구현했습니다.

---

## 10. 한계 및 개선 예정 사항

현재 프로젝트는 Servlet/JSP MVC 학습 목적의 웹 프로젝트입니다.
Spring Boot 기반 프로젝트처럼 자동 설정이나 빌드 자동화가 완전히 구성되어 있지는 않습니다.

향후 개선한다면 다음 기능을 추가할 수 있습니다.

* Maven 또는 Gradle 기반 빌드 구조로 전환
* DB 스키마 및 초기 데이터 SQL 정리
* 예외 처리 공통화
* 로그인 인터셉터 또는 필터 정리
* 관리자 기능 고도화
* REST API 구조로 개선
* Spring Boot 전환
* 테스트 코드 추가
* README에 화면 캡처 추가
* 배포 환경 구성

---

## 11. 프로젝트를 통해 학습한 점

* Servlet/JSP 기반 웹 애플리케이션 구조
* MVC 패턴 설계
* DAO/DTO/Service 계층 분리
* 세션 기반 로그인 처리
* JSP forward / redirect 흐름
* Oracle DB 연동
* 외부 API 설정 관리
* Tomcat 기반 웹 프로젝트 실행 방식
* 도메인별 패키지 구조 설계
