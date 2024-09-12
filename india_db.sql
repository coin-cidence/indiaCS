
CREATE TABLE "User" (
    user_id VARCHAR2(50) PRIMARY KEY, -- 유저 아이디
    password VARCHAR2(100) NOT NULL, -- 유저 패스워드
    user_name VARCHAR2(100) NOT NULL, -- 유저 이름
    user_phone VARCHAR2(20) NOT NULL -- 유저 폰번호
);
CREATE TABLE Product (
    product_id VARCHAR2(50) PRIMARY KEY, -- 제품 식별번호
    user_id VARCHAR2(50), -- 유저 아이디 (외래키)
    product_type VARCHAR2(50) NOT NULL, -- 제품군
    product_serial_number VARCHAR2(100) NOT NULL, -- 제품 고유번호
    product_purchase_date DATE NOT NULL, -- 제품 구매일
    product_assurance_date DATE NOT NULL, -- 제품 보증기간 만료일,
    CONSTRAINT fk_product_user FOREIGN KEY (user_id) REFERENCES "User"(user_id) -- 외래키 설정
);
CREATE TABLE AS_Request (
    as_request_id VARCHAR2(50) PRIMARY KEY, -- AS접수번호
    product_id VARCHAR2(50), -- 제품 ID
    as_request_date DATE NOT NULL, -- AS접수일
    as_request_center VARCHAR2(100) NOT NULL, -- AS접수센터
    CONSTRAINT fk_as_request_product FOREIGN KEY (product_id) REFERENCES Product(product_id) -- 외래키 설정
);
CREATE TABLE Diagnose (
    diagnose_id VARCHAR2(50) PRIMARY KEY, -- 식별용 ID
    as_request_id VARCHAR2(50), -- AS 접수 ID (외래키)
    diagnose_content VARCHAR2(500) NOT NULL, -- 진단 내용
    diagnose_date DATE NOT NULL, -- 진단일시
    CONSTRAINT fk_diagnose_as_request FOREIGN KEY (as_request_id) REFERENCES AS_Request(as_request_id) -- 외래키 설정
);
CREATE TABLE Repair (
    repair_id VARCHAR2(50) PRIMARY KEY, -- 식별용 ID
    diagnose_id VARCHAR2(50), -- 진단 ID (외래키)
    repair_state NUMBER NOT NULL, -- 수리 단계 상태
    repair_date DATE NOT NULL, -- 수리일시
    repair_part_inventory VARCHAR2(50), -- 부품 인벤토리
    CONSTRAINT fk_repair_diagnose FOREIGN KEY (diagnose_id) REFERENCES Diagnose(diagnose_id) -- 외래키 설정
);
CREATE TABLE Technician (
    technician_id VARCHAR2(50) PRIMARY KEY, -- 식별용 ID
    technician_name VARCHAR2(100) NOT NULL, -- 기사님 이름
    technician_avg_score NUMBER DEFAULT 0.0, -- 기사님 평점
    technician_center VARCHAR2(100) NOT NULL -- 기사님 소속 센터
);
CREATE TABLE Review (
    as_request_id VARCHAR2(50) PRIMARY KEY, -- AS 접수 ID (외래키)
    technician_id VARCHAR2(50), -- 기사님 ID (외래키)
    review_rating NUMBER NOT NULL, -- 리뷰 별점
    review_date DATE NOT NULL, -- 리뷰 작성일
    CONSTRAINT fk_review_as_request FOREIGN KEY (as_request_id) REFERENCES AS_Request(as_request_id), -- 외래키 설정
    CONSTRAINT fk_review_technician FOREIGN KEY (technician_id) REFERENCES Technician(technician_id) -- 외래키 설정
);
CREATE TABLE Review_more (
    as_request_id VARCHAR2(50) PRIMARY KEY, -- AS 접수 ID (외래키)
    question1 NUMBER, -- 1번 질문 답변
    question2 NUMBER, -- 2번 질문 답변
    question3 NUMBER, -- 3번 질문 답변
    review_comment VARCHAR2(500), -- 추가 코멘트
    review_date DATE NOT NULL, -- 추가 리뷰 작성일
    CONSTRAINT fk_review_more_as_request FOREIGN KEY (as_request_id) REFERENCES AS_Request(as_request_id) -- 외래키 설정
);

-- insert data
INSERT all
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user001', 'pass001', 'John Doe', '010-1234-5678')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user002', 'pass002', 'Jane Smith', '010-9876-5432')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user003', 'pass003', 'Alex Kim', '010-1111-2222')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user004', 'pass004', 'Chris Lee', '010-3333-4444')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user005', 'pass005', 'Emma Brown', '010-5555-6666')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user006', 'pass006', 'Sophia Davis', '010-7777-8888')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user007', 'pass007', 'Liam Johnson', '010-6666-5555')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user008', 'pass008', 'Mason Wilson', '010-4444-3333')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user009', 'pass009', 'Olivia Martinez', '010-2222-1111')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user010', 'pass010', 'Ava Hernandez', '010-9999-0000')


INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod001', 'user001', 'TV', 'OLED65G46LA', TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod002', 'user001', 'laptop', '16Z90SP-KAOWK', TO_DATE('2021-05-10', 'YYYY-MM-DD'), TO_DATE('2023-05-10', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod003', 'user002', 'TV', 'SN11223344', TO_DATE('2023-07-22', 'YYYY-MM-DD'), TO_DATE('2025-07-22', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod004', 'user003', 'air conditioner', 'SN44556677', TO_DATE('2020-03-12', 'YYYY-MM-DD'), TO_DATE('2023-03-12', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod005', 'user004', 'refrigerator', 'SN99887766', TO_DATE('2019-12-25', 'YYYY-MM-DD'), TO_DATE('2022-12-25', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod006', 'user005', 'TV', 'SN56781234', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod007', 'user006', 'air conditioner', 'SN87653421', TO_DATE('2022-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod008', 'user007', 'washing machine', 'SN12349876', TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod009', 'user008', 'washing machine', 'SN12349876', TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod010', 'user009', 'washing machine', 'SN12349876', TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod011', 'user010', 'washing machine', 'SN12349876', TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'))


INTO AS_Request (as_request_id, as_request_date, as_request_center) VALUES ('asr000', TO_DATE('2024-08-16 10:00', 'YYYY-MM-DD HH24:MI'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr001', 'prod001', TO_DATE('2024-09-02 19:00', 'YYYY-MM-DD HH24:MI'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr002', 'prod002', TO_DATE('2024-09-08 13:00', 'YYYY-MM-DD HH24:MI'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr003', 'prod003', TO_DATE('2024-09-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr004', 'prod004', TO_DATE('2024-08-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr005', 'prod005', TO_DATE('2024-08-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr006', 'prod006', TO_DATE('2024-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr007', 'prod007', TO_DATE('2024-08-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr008', 'prod008', TO_DATE('2024-09-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr009', 'prod009', TO_DATE('2024-08-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr010', 'prod010', TO_DATE('2024-08-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'A')

INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag000', 'asr000', 'TV 화면 멈춤 현상', TO_DATE('2024-08-16 12:07', 'YYYY-MM-DD HH24:MI'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag001', 'asr001', '냉장고 냉동 기능 이상', TO_DATE('2024-09-02 20:48', 'YYYY-MM-DD HH24:MI'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag002', 'asr002', '세탁기 탈수 소음 발생', TO_DATE('2024-09-08 15:09:00', 'YYYY-MM-DD HH24:MI:SS'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag003', 'asr003', 'TV 화면 깜빡임 현상', TO_DATE('2024-09-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag004', 'asr004', '에어컨 냉방 불량', TO_DATE('2024-08-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag005', 'asr005', '냉장고 문 닫힘 문제', TO_DATE('2024-08-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag006', 'asr006', 'TV 전원 불량', TO_DATE('2024-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag007', 'asr007', '에어컨 소음 발생', TO_DATE('2024-08-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag008', 'asr008', '세탁기 물이 새는 문제', TO_DATE('2024-09-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag009', 'asr009', '냉장고 온도 조절 문제', TO_DATE('2024-08-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag010', 'asr010', 'TV 화면 멈춤 현상', TO_DATE('2024-08-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))

INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep001', 'diag000', 1, TO_DATE('2024-08-17 09:03:00', 'YYYY-MM-DD HH24:MI:SS'), 'Incheon, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep002', 'diag000', 2, TO_DATE('2024-08-19 18:41:00', 'YYYY-MM-DD HH24:MI:SS'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep003', 'diag000', 3, TO_DATE('2024-08-26 23:16:00', 'YYYY-MM-DD HH24:MI:SS'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep004', 'diag000', 4, TO_DATE('2024-08-30 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep005', 'diag001', 1, TO_DATE('2024-09-09 09:11:00', 'YYYY-MM-DD HH24:MI:SS'), 'Changwon, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep006', 'diag001', 2, TO_DATE('2024-09-09 23:44:00', 'YYYY-MM-DD HH24:MI:SS'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep007', 'diag001', 3, TO_DATE('2024-09-15 17:27:00', 'YYYY-MM-DD HH24:MI:SS'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep008', 'diag001', 4, TO_DATE('2024-09-18 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep009', 'diag002', 1, TO_DATE('2024-09-11 22:18:00', 'YYYY-MM-DD HH24:MI:SS'), 'Busan, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep010', 'diag002', 2, TO_DATE('2024-09-12 08:05:00', 'YYYY-MM-DD HH24:MI:SS'), null)
 
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech001', 'Mike Johnson', 4.8, 'A')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech002', 'Emily Brown', 4.5, 'B')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech003', 'David Lee', 4.7, 'C')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech004', 'Sarah Green', 4.9, 'D')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech005', 'James Black', 4.3, 'A')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech006', 'Michael Jordan', 4.4, 'A')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech007', 'Jennifer Carter', 4.7, 'B')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech008', 'William Harris', 4.9, 'C')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech009', 'Emily Baker', 4.6, 'D')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech010', 'Robert Clark', 4.8, 'A')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech011', 'Ethan Allen', 4.2, 'B')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech012', 'Madison Green', 4.9, 'A')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech013', 'Charlotte Carter', 4.7, 'C')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech014', 'Daniel Anderson', 4.5, 'D')
INTO Technician (technician_id, technician_name, technician_avg_score, technician_center) VALUES ('tech015', 'Amelia White', 4.8, 'A')

INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr000', 'tech010', 4, TO_DATE('2024-10-01', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr001', 'tech001', 5, TO_DATE('2024-09-29', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr003', 'tech003', 3, TO_DATE('2024-09-08', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr004', 'tech004', 5, TO_DATE('2024-08-23', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr005', 'tech005', 4, TO_DATE('2024-08-18', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr006', 'tech006', 5, TO_DATE('2024-09-04', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr007', 'tech007', 4, TO_DATE('2024-08-28', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr008', 'tech008', 3, TO_DATE('2024-09-08', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr009', 'tech009', 5, TO_DATE('2024-08-23', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr010', 'tech010', 4, TO_DATE('2024-08-18', 'YYYY-MM-DD'))

INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr000', 2, 2, 3, '수리는 잘 되었지만 시간이 조금 걸렸습니다.', TO_DATE('2024-10-01', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr001', 1, 1, 1, '서비스가 아주 훌륭했습니다!', TO_DATE('2024-09-29', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr003', 2, 3, 3, '보통이었습니다.', TO_DATE('2024-09-08', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr004', 1, 1, 1, '기사님이 매우 친절하고 수리도 빠르게 완료되었습니다!', TO_DATE('2024-08-23', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr005', 2, 2, 3, '기사님이 친절하셨습니다.', TO_DATE('2024-08-18', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr006', 1, 1, 1, '기사님이 매우 친절하시고 작업도 신속했습니다.', TO_DATE('2024-09-04', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr007', 3, 3, 2, '대체적으로 만족스러웠습니다.', TO_DATE('2024-08-28', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr008', 2, 3, 4, '약간의 불편함이 있었습니다.', TO_DATE('2024-09-08', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr009', 1, 1, 1, '최고의 서비스를 받았습니다!', TO_DATE('2024-08-23', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr010', 2, 2, 3, '수리는 잘 되었지만 시간이 조금 걸렸습니다.', TO_DATE('2024-08-18', 'YYYY-MM-DD'))
SELECT * FROM DUAL;

SELECT * FROM REVIEW;
SELECT * FROM TECHNICIAN;
SELECT * FROM REVIEW_MORE;
SELECT * FROM "User";
SELECT * FROM PRODUCT;
SELECT * FROM AS_REQUEST;
SELECT * FROM DIAGNOSE;
SELECT * FROM REPAIR;
--
ALTER TABLE Review_more
DROP CONSTRAINT fk_review_more_as_request;

ALTER TABLE Review
DROP CONSTRAINT fk_review_as_request
DROP CONSTRAINT fk_review_technician;

ALTER TABLE Repair
DROP CONSTRAINT fk_repair_diagnose;

ALTER TABLE Diagnose
DROP CONSTRAINT fk_diagnose_as_request;

ALTER TABLE AS_Request
DROP CONSTRAINT fk_as_request_product;

ALTER TABLE PRODUCT
DROP CONSTRAINT fk_product_user;

DROP TABLE REVIEW;
DROP TABLE REVIEW_MORE;
DROP TABLE TECHNICIAN;
DROP TABLE REPAIR;
DROP TABLE PRODUCT;
DROP TABLE Diagnose;
DROP TABLE "User";
DROP TABLE AS_REQUEST;
--


--select u.user_id, a.as_request_id
--from "User" u, Product p, AS_request a
--where u.user_id = p.user_id
--and a.product_id=p.product_id;

--insert INTO AS_Request (as_request_id, as_request_date, as_request_center) VALUES ('asr000', TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'D');
--insert INTO AS_Request (as_request_id, as_request_date, as_request_center) VALUES ('asr000', TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'D');