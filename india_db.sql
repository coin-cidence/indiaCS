CREATE TABLE AS_Request (
    as_request_id VARCHAR2(50) PRIMARY KEY, -- AS������ȣ
    product_id VARCHAR2(50), -- ��ǰ ID
    as_request_date DATE NOT NULL, -- AS������
    as_request_center VARCHAR2(100) NOT NULL -- AS��������
);
CREATE TABLE "User" (
    user_id VARCHAR2(50) PRIMARY KEY, -- ���� ���̵�
    password VARCHAR2(100) NOT NULL, -- ���� �н�����
    user_name VARCHAR2(100) NOT NULL, -- ���� �̸�
    user_phone VARCHAR2(20) NOT NULL -- ���� ����ȣ
);
CREATE TABLE Product (
    product_id VARCHAR2(50) PRIMARY KEY, -- ��ǰ �ĺ���ȣ
    user_id VARCHAR2(50), -- ���� ���̵� (�ܷ�Ű)
    product_type VARCHAR2(50) NOT NULL, -- ��ǰ��
    product_serial_number VARCHAR2(100) NOT NULL, -- ��ǰ ������ȣ
    product_purchase_date DATE NOT NULL, -- ��ǰ ������
    product_assurance_date DATE NOT NULL, -- ��ǰ �����Ⱓ ������,
    CONSTRAINT fk_product_user FOREIGN KEY (user_id) REFERENCES "User"(user_id) -- �ܷ�Ű ����
);
CREATE TABLE Diagnose (
    diagnose_id VARCHAR2(50) PRIMARY KEY, -- �ĺ��� ID
    as_request_id VARCHAR2(50), -- AS ���� ID (�ܷ�Ű)
    diagnose_content VARCHAR2(500) NOT NULL, -- ���� ����
    diagnose_date DATE NOT NULL, -- �����Ͻ�
    CONSTRAINT fk_diagnose_as_request FOREIGN KEY (as_request_id) REFERENCES AS_Request(as_request_id) -- �ܷ�Ű ����
);
CREATE TABLE Repair (
    repair_id VARCHAR2(50) PRIMARY KEY, -- �ĺ��� ID
    diagnose_id VARCHAR2(50), -- ���� ID (�ܷ�Ű)
    repair_state NUMBER NOT NULL, -- ���� �ܰ� ����
    repair_date DATE NOT NULL, -- �����Ͻ�
    repair_part_inventory VARCHAR2(50), -- ��ǰ �κ��丮
    CONSTRAINT fk_repair_diagnose FOREIGN KEY (diagnose_id) REFERENCES Diagnose(diagnose_id) -- �ܷ�Ű ����
);
CREATE TABLE Technician (
    technician_id VARCHAR2(50) PRIMARY KEY, -- �ĺ��� ID
    technician_name VARCHAR2(100) NOT NULL, -- ���� �̸�
    technician_avg_score NUMBER DEFAULT 0.0, -- ���� ����
    technician_center VARCHAR2(100) NOT NULL -- ���� �Ҽ� ����
);
CREATE TABLE Review (
    as_request_id VARCHAR2(50) PRIMARY KEY, -- AS ���� ID (�ܷ�Ű)
    technician_id VARCHAR2(50), -- ���� ID (�ܷ�Ű)
    review_rating NUMBER NOT NULL, -- ���� ����
    review_date DATE NOT NULL, -- ���� �ۼ���
    CONSTRAINT fk_review_as_request FOREIGN KEY (as_request_id) REFERENCES AS_Request(as_request_id), -- �ܷ�Ű ����
    CONSTRAINT fk_review_technician FOREIGN KEY (technician_id) REFERENCES Technician(technician_id) -- �ܷ�Ű ����
);
CREATE TABLE Review_more (
    as_request_id VARCHAR2(50) PRIMARY KEY, -- AS ���� ID (�ܷ�Ű)
    question1 NUMBER, -- 1�� ���� �亯
    question2 NUMBER, -- 2�� ���� �亯
    question3 NUMBER, -- 3�� ���� �亯
    review_comment VARCHAR2(500), -- �߰� �ڸ�Ʈ
    review_date DATE NOT NULL, -- �߰� ���� �ۼ���
    CONSTRAINT fk_review_more_as_request FOREIGN KEY (as_request_id) REFERENCES AS_Request(as_request_id) -- �ܷ�Ű ����
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
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user011', 'pass011', 'Emma Thompson', '010-8888-9999')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user012', 'pass012', 'Noah Lee', '010-5555-6666')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user013', 'pass013', 'James Perez', '010-4444-5555')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user014', 'pass014', 'Mia Rivera', '010-3333-7777')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user015', 'pass015', 'Lucas Miller', '010-2222-9999')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user016', 'pass016', 'Sophia Wilson', '010-1111-6666')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user017', 'pass017', 'Ethan Brown', '010-2222-3333')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user018', 'pass018', 'Oliver Davis', '010-3333-4444')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user019', 'pass019', 'Isabella Johnson', '010-4444-5555')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user020', 'pass020', 'Liam Martinez', '010-5555-6666')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user021', 'pass021', 'Ava Smith', '010-7777-8888')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user022', 'pass022', 'Noah Johnson', '010-8888-9999')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user023', 'pass023', 'Emma Wilson', '010-9999-0000')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user024', 'pass024', 'James Brown', '010-1111-2222')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user025', 'pass025', 'Mia Davis', '010-2222-3334')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user026', 'pass026', 'Lucas Anderson', '010-3333-4445')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user027', 'pass027', 'Charlotte Thomas', '010-4444-5556')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user028', 'pass028', 'Benjamin Taylor', '010-5555-6667')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user029', 'pass029', 'Amelia Moore', '010-6666-7778')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user030', 'pass030', 'William Harris', '010-7777-8889')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user031', 'pass031', 'Elijah Walker', '010-8888-9990')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user032', 'pass032', 'Sophia Clark', '010-9999-1111')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user033', 'pass033', 'Oliver Young', '010-1111-2223')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user034', 'pass034', 'Isabella Scott', '010-2222-3334')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user035', 'pass035', 'Mason Green', '010-3333-4445')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user036', 'pass036', 'James Martinez', '010-4444-5555')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user037', 'pass037', 'Emily Hernandez', '010-5555-6666')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user038', 'pass038', 'Michael King', '010-6666-7777')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user039', 'pass039', 'Ava Wright', '010-7777-8888')
INTO "User" (user_id, password, user_name, user_phone) VALUES ('user040', 'pass040', 'Ethan Hall', '010-8888-9999')

INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod001', 'user001', 'refrigerator', 'SN12345678', TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod002', 'user002', 'washing machine', 'SN87654321', TO_DATE('2021-05-10', 'YYYY-MM-DD'), TO_DATE('2023-05-10', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod003', 'user003', 'TV', 'SN11223344', TO_DATE('2023-07-22', 'YYYY-MM-DD'), TO_DATE('2025-07-22', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod004', 'user004', 'air conditioner', 'SN44556677', TO_DATE('2020-03-12', 'YYYY-MM-DD'), TO_DATE('2023-03-12', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod005', 'user005', 'refrigerator', 'SN99887766', TO_DATE('2019-12-25', 'YYYY-MM-DD'), TO_DATE('2022-12-25', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod006', 'user006', 'TV', 'SN56781234', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod007', 'user007', 'air conditioner', 'SN87653421', TO_DATE('2022-07-15', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod008', 'user008', 'washing machine', 'SN12349876', TO_DATE('2021-09-20', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod009', 'user009', 'refrigerator', 'SN43218765', TO_DATE('2020-11-05', 'YYYY-MM-DD'), TO_DATE('2022-11-05', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod010', 'user010', 'TV', 'SN89761234', TO_DATE('2019-06-28', 'YYYY-MM-DD'), TO_DATE('2021-06-28', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod011', 'user011', 'refrigerator', 'SN12345678', TO_DATE('2022-05-12', 'YYYY-MM-DD'), TO_DATE('2024-05-12', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod012', 'user012', 'washing machine', 'SN23456789', TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2025-07-10', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod013', 'user013', 'TV', 'SN34567890', TO_DATE('2021-03-25', 'YYYY-MM-DD'), TO_DATE('2023-03-25', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod014', 'user014', 'air conditioner', 'SN45678901', TO_DATE('2020-08-20', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod015', 'user015', 'refrigerator', 'SN56789012', TO_DATE('2019-11-30', 'YYYY-MM-DD'), TO_DATE('2021-11-30', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod016', 'user016', 'washing machine', 'SN67890123', TO_DATE('2023-03-12', 'YYYY-MM-DD'), TO_DATE('2025-03-12', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod017', 'user017', 'air conditioner', 'SN78901234', TO_DATE('2021-09-18', 'YYYY-MM-DD'), TO_DATE('2023-09-18', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod018', 'user018', 'TV', 'SN89012345', TO_DATE('2022-02-20', 'YYYY-MM-DD'), TO_DATE('2024-02-20', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod019', 'user019', 'refrigerator', 'SN90123456', TO_DATE('2020-07-22', 'YYYY-MM-DD'), TO_DATE('2022-07-22', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod020', 'user020', 'washing machine', 'SN01234567', TO_DATE('2021-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-01', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod021', 'user021', 'refrigerator', 'SN34567890', TO_DATE('2023-06-15', 'YYYY-MM-DD'), TO_DATE('2025-06-15', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod022', 'user022', 'TV', 'SN45678901', TO_DATE('2021-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-12', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod023', 'user023', 'air conditioner', 'SN56789012', TO_DATE('2022-01-25', 'YYYY-MM-DD'), TO_DATE('2024-01-25', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod024', 'user024', 'washing machine', 'SN67890123', TO_DATE('2022-08-19', 'YYYY-MM-DD'), TO_DATE('2024-08-19', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES
('prod025', 'user025', 'refrigerator', 'SN78901234', TO_DATE('2021-10-30', 'YYYY-MM-DD'), TO_DATE('2023-10-30', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod026', 'user026', 'TV', 'SN89012346', TO_DATE('2022-09-18', 'YYYY-MM-DD'), TO_DATE('2024-09-18', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod027', 'user027', 'refrigerator', 'SN90123457', TO_DATE('2023-02-10', 'YYYY-MM-DD'), TO_DATE('2025-02-10', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod028', 'user028', 'washing machine', 'SN01234568', TO_DATE('2021-12-12', 'YYYY-MM-DD'), TO_DATE('2023-12-12', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod029', 'user029', 'air conditioner', 'SN23456789', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2025-07-01', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod030', 'user030', 'TV', 'SN34567890', TO_DATE('2022-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod031', 'user031', 'refrigerator', 'SN45678912', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod032', 'user032', 'air conditioner', 'SN56789023', TO_DATE('2021-05-15', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod033', 'user033', 'TV', 'SN67890134', TO_DATE('2022-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod034', 'user034', 'washing machine', 'SN78901245', TO_DATE('2023-03-21', 'YYYY-MM-DD'), TO_DATE('2025-03-21', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod035', 'user035', 'refrigerator', 'SN89012356', TO_DATE('2021-08-22', 'YYYY-MM-DD'), TO_DATE('2023-08-22', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod036', 'user036', 'air conditioner', 'SN90123456', TO_DATE('2022-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod037', 'user037', 'washing machine', 'SN01234567', TO_DATE('2021-03-15', 'YYYY-MM-DD'), TO_DATE('2023-03-15', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod038', 'user038', 'refrigerator', 'SN23456789', TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2025-09-10', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod039', 'user039', 'TV', 'SN34567890', TO_DATE('2022-10-05', 'YYYY-MM-DD'), TO_DATE('2024-10-05', 'YYYY-MM-DD'))
INTO Product (product_id, user_id, product_type, product_serial_number, product_purchase_date, product_assurance_date) VALUES ('prod040', 'user040', 'air conditioner', 'SN45678901', TO_DATE('2021-11-22', 'YYYY-MM-DD'), TO_DATE('2023-11-22', 'YYYY-MM-DD'))
 
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr001', 'prod001', TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr002', 'prod002', TO_DATE('2024-08-25', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr003', 'prod003', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr004', 'prod004', TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr005', 'prod005', TO_DATE('2024-08-15', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr006', 'prod006', TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr007', 'prod007', TO_DATE('2024-08-25', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr008', 'prod008', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr009', 'prod009', TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr010', 'prod010', TO_DATE('2024-08-15', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr011', 'prod011', TO_DATE('2024-09-10', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr012', 'prod012', TO_DATE('2024-09-11', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr013', 'prod013', TO_DATE('2024-09-12', 'YYYY-MM-DD'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr014', 'prod014', TO_DATE('2024-09-13', 'YYYY-MM-DD'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr015', 'prod015', TO_DATE('2024-09-14', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr016', 'prod016', TO_DATE('2024-09-18', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr017', 'prod017', TO_DATE('2024-09-19', 'YYYY-MM-DD'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr018', 'prod018', TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr019', 'prod019', TO_DATE('2024-09-21', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr020', 'prod020', TO_DATE('2024-09-22', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr021', 'prod021', TO_DATE('2024-09-26', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr022', 'prod022', TO_DATE('2024-09-27', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr023', 'prod023', TO_DATE('2024-09-28', 'YYYY-MM-DD'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr024', 'prod024', TO_DATE('2024-09-29', 'YYYY-MM-DD'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr025', 'prod025', TO_DATE('2024-09-30', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr026', 'prod026', TO_DATE('2024-10-04', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr027', 'prod027', TO_DATE('2024-10-05', 'YYYY-MM-DD'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr028', 'prod028', TO_DATE('2024-10-06', 'YYYY-MM-DD'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr029', 'prod029', TO_DATE('2024-10-07', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr030', 'prod030', TO_DATE('2024-10-08', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr031', 'prod031', TO_DATE('2024-10-09', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr032', 'prod032', TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr033', 'prod033', TO_DATE('2024-10-11', 'YYYY-MM-DD'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr034', 'prod034', TO_DATE('2024-10-12', 'YYYY-MM-DD'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr035', 'prod035', TO_DATE('2024-10-13', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr036', 'prod036', TO_DATE('2024-10-14', 'YYYY-MM-DD'), 'C')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr037', 'prod037', TO_DATE('2024-10-15', 'YYYY-MM-DD'), 'D')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr038', 'prod038', TO_DATE('2024-10-16', 'YYYY-MM-DD'), 'A')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr039', 'prod039', TO_DATE('2024-10-17', 'YYYY-MM-DD'), 'B')
INTO AS_Request (as_request_id, product_id, as_request_date, as_request_center) VALUES ('asr040', 'prod040', TO_DATE('2024-10-18', 'YYYY-MM-DD'), 'C')

INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag001', 'asr001', '����� �õ� ��� �̻�', TO_DATE('2024-09-02', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag002', 'asr002', '��Ź�� Ż�� ���� �߻�', TO_DATE('2024-08-26', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag003', 'asr003', 'TV ȭ�� ������ ����', TO_DATE('2024-09-06', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag004', 'asr004', '������ �ù� �ҷ�', TO_DATE('2024-08-21', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag005', 'asr005', '����� �� ���� ����', TO_DATE('2024-08-16', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag006', 'asr006', 'TV ���� �ҷ�', TO_DATE('2024-09-02', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag007', 'asr007', '������ ���� �߻�', TO_DATE('2024-08-26', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag008', 'asr008', '��Ź�� ���� ���� ����', TO_DATE('2024-09-06', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag009', 'asr009', '����� �µ� ���� ����', TO_DATE('2024-08-21', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag010', 'asr010', 'TV ȭ�� ���� ����', TO_DATE('2024-08-16', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag011', 'asr011', '����� �ð� ����', TO_DATE('2024-09-11', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag012', 'asr012', '��Ź�� ���� ����', TO_DATE('2024-09-12', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag013', 'asr013', 'TV ȭ�� ������', TO_DATE('2024-09-13', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag014', 'asr014', '������ �ٶ��� ����', TO_DATE('2024-09-14', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag015', 'asr015', '����� ���� ������ ����', TO_DATE('2024-09-15', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag016', 'asr016', '��Ź�� ���� ���� ����', TO_DATE('2024-09-19', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag017', 'asr017', '������ �µ� ���� �ȵ�', TO_DATE('2024-09-20', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag018', 'asr018', 'TV ���� ����', TO_DATE('2024-09-21', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag019', 'asr019', '����� ���� ����', TO_DATE('2024-09-22', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag020', 'asr020', '��Ź�� ȸ�� �ҷ�', TO_DATE('2024-09-23', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag021', 'asr021', '����� �õ� ����� ����', TO_DATE('2024-09-27', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag022', 'asr022', 'TV ȭ�� ������', TO_DATE('2024-09-28', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag023', 'asr023', '������ �ù� ���� ����', TO_DATE('2024-09-29', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag024', 'asr024', '��Ź�� ��� ����', TO_DATE('2024-09-30', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag025', 'asr025', '����� ���� ����', TO_DATE('2024-10-01', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag026', 'asr026', 'TV ���� ��ư ����', TO_DATE('2024-10-05', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag027', 'asr027', '����� ���� ��� ����', TO_DATE('2024-10-06', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag028', 'asr028', '��Ź�� ������ ����', TO_DATE('2024-10-07', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag029', 'asr029', '������ ���� ����', TO_DATE('2024-10-08', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag030', 'asr030', 'TV ȭ���� ������ ����', TO_DATE('2024-10-09', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag031', 'asr031', '����� �µ� ���� ����', TO_DATE('2024-10-10', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag032', 'asr032', '���������� ���ٶ��� �� ����', TO_DATE('2024-10-11', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag033', 'asr033', 'TV ȭ���� �� ����', TO_DATE('2024-10-12', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag034', 'asr034', '��Ź�� �巳 ȸ�� �ҷ�', TO_DATE('2024-10-13', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag035', 'asr035', '����� ������ ����', TO_DATE('2024-10-14', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag036', 'asr036', '������ �ð� ����� �ȵ�', TO_DATE('2024-10-15', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag037', 'asr037', '��Ź�� ���� �� ����', TO_DATE('2024-10-16', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag038', 'asr038', '������� ������ ��', TO_DATE('2024-10-17', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag039', 'asr039', 'TV ������ �� ����', TO_DATE('2024-10-18', 'YYYY-MM-DD'))
INTO Diagnose (diagnose_id, as_request_id, diagnose_content, diagnose_date) VALUES ('diag040', 'asr040', '���������� �̻��� �Ҹ��� ��', TO_DATE('2024-10-19', 'YYYY-MM-DD'))

INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep001', 'diag001', 1, TO_DATE('2024-09-03', 'YYYY-MM-DD'), 'Changwon, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep002', 'diag002', 2, TO_DATE('2024-08-27', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep003', 'diag003', 3, TO_DATE('2024-09-07', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep004', 'diag004', 4, TO_DATE('2024-08-22', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep005', 'diag005', 1, TO_DATE('2024-08-17', 'YYYY-MM-DD'), 'Changwon, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep006', 'diag006', 2, TO_DATE('2024-09-03', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep007', 'diag007', 1, TO_DATE('2024-08-27', 'YYYY-MM-DD'), 'Incheon, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep008', 'diag008', 3, TO_DATE('2024-09-07', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep009', 'diag009', 4, TO_DATE('2024-08-22', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep010', 'diag010', 1, TO_DATE('2024-08-17', 'YYYY-MM-DD'), 'Seoul, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep011', 'diag011', 1, TO_DATE('2024-09-12', 'YYYY-MM-DD'), 'Changwon, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep012', 'diag012', 2, TO_DATE('2024-09-13', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep013', 'diag013', 3, TO_DATE('2024-09-14', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep014', 'diag014', 4, TO_DATE('2024-09-15', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep015', 'diag015', 2, TO_DATE('2024-09-16', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep016', 'diag016', 1, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Busan, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep017', 'diag017', 3, TO_DATE('2024-09-21', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep018', 'diag018', 4, TO_DATE('2024-09-22', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep019', 'diag019', 2, TO_DATE('2024-09-23', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep020', 'diag020', 1, TO_DATE('2024-09-24', 'YYYY-MM-DD'), 'Busan, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep021', 'diag021', 2, TO_DATE('2024-09-28', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep022', 'diag022', 3, TO_DATE('2024-09-29', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep023', 'diag023', 4, TO_DATE('2024-09-30', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep024', 'diag024', 1, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 'Busan, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep025', 'diag025', 2, TO_DATE('2024-10-02', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep026', 'diag026', 3, TO_DATE('2024-10-06', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep027', 'diag027', 1, TO_DATE('2024-10-07', 'YYYY-MM-DD'), 'Changwon, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep028', 'diag028', 4, TO_DATE('2024-10-08', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep029', 'diag029', 2, TO_DATE('2024-10-09', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep030', 'diag030', 1, TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'Seoul, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep031', 'diag031', 2, TO_DATE('2024-10-11', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep032', 'diag032', 3, TO_DATE('2024-10-12', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep033', 'diag033', 1, TO_DATE('2024-10-13', 'YYYY-MM-DD'), 'Seoul, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep034', 'diag034', 4, TO_DATE('2024-10-14', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep035', 'diag035', 2, TO_DATE('2024-10-15', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep036', 'diag036', 1, TO_DATE('2024-10-16', 'YYYY-MM-DD'), 'Incheon, South Korea')
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep037', 'diag037', 3, TO_DATE('2024-10-17', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep038', 'diag038', 2, TO_DATE('2024-10-18', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep039', 'diag039', 4, TO_DATE('2024-10-19', 'YYYY-MM-DD'), null)
INTO Repair (repair_id, diagnose_id, repair_state, repair_date, repair_part_inventory) VALUES ('rep040', 'diag040', 1, TO_DATE('2024-10-20', 'YYYY-MM-DD'), 'Incheon, South Korea')
 
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
 
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr001', 'tech001', 5, TO_DATE('2024-09-04', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr002', 'tech002', 4, TO_DATE('2024-08-28', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr003', 'tech003', 3, TO_DATE('2024-09-08', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr004', 'tech004', 5, TO_DATE('2024-08-23', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr005', 'tech005', 4, TO_DATE('2024-08-18', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr006', 'tech006', 5, TO_DATE('2024-09-04', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr007', 'tech007', 4, TO_DATE('2024-08-28', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr008', 'tech008', 3, TO_DATE('2024-09-08', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr009', 'tech009', 5, TO_DATE('2024-08-23', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr010', 'tech010', 4, TO_DATE('2024-08-18', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr011', 'tech011', 4, TO_DATE('2024-09-13', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr012', 'tech012', 5, TO_DATE('2024-09-14', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr013', 'tech013', 3, TO_DATE('2024-09-15', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr014', 'tech014', 5, TO_DATE('2024-09-16', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr015', 'tech015', 4, TO_DATE('2024-09-17', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr016', 'tech011', 4, TO_DATE('2024-09-21', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr017', 'tech012', 5, TO_DATE('2024-09-22', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr018', 'tech013', 4, TO_DATE('2024-09-23', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr019', 'tech014', 3, TO_DATE('2024-09-24', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr020', 'tech015', 5, TO_DATE('2024-09-25', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr021', 'tech001', 4, TO_DATE('2024-09-29', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr022', 'tech002', 5, TO_DATE('2024-09-30', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr023', 'tech003', 4, TO_DATE('2024-10-01', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr024', 'tech004', 3, TO_DATE('2024-10-02', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr025', 'tech005', 5, TO_DATE('2024-10-03', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr026', 'tech006', 5, TO_DATE('2024-10-07', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr027', 'tech007', 4, TO_DATE('2024-10-08', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr028', 'tech008', 3, TO_DATE('2024-10-09', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr029', 'tech009', 5, TO_DATE('2024-10-10', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr030', 'tech010', 4, TO_DATE('2024-10-11', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr031', 'tech011', 4, TO_DATE('2024-10-12', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr032', 'tech012', 5, TO_DATE('2024-10-13', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr033', 'tech013', 3, TO_DATE('2024-10-14', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr034', 'tech014', 4, TO_DATE('2024-10-15', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr035', 'tech015', 5, TO_DATE('2024-10-16', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr036', 'tech001', 5, TO_DATE('2024-10-17', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr037', 'tech002', 4, TO_DATE('2024-10-18', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr038', 'tech003', 5, TO_DATE('2024-10-19', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr039', 'tech004', 3, TO_DATE('2024-10-20', 'YYYY-MM-DD'))
INTO Review (as_request_id, technician_id, review_rating, review_date) VALUES ('asr040', 'tech005', 4, TO_DATE('2024-10-21', 'YYYY-MM-DD'))

INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr001', 1, 1, 1, '���񽺰� ���� �Ǹ��߽��ϴ�!', TO_DATE('2024-09-04', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr002', 3, 2, 2, '���񽺰� �����ҽ��ϴ�.', TO_DATE('2024-08-28', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr003', 2, 3, 3, '�����̾����ϴ�.', TO_DATE('2024-09-08', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr004', 1, 1, 1, '������ �ſ� ģ���ϰ� ������ ������ �Ϸ�Ǿ����ϴ�!', TO_DATE('2024-08-23', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr005', 2, 2, 3, '������ ģ���ϼ̽��ϴ�.', TO_DATE('2024-08-18', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr006', 1, 1, 1, '������ �ſ� ģ���Ͻð� �۾��� �ż��߽��ϴ�.', TO_DATE('2024-09-04', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr007', 3, 3, 2, '��ü������ �������������ϴ�.', TO_DATE('2024-08-28', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr008', 2, 3, 4, '�ణ�� �������� �־����ϴ�.', TO_DATE('2024-09-08', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr009', 1, 1, 1, '�ְ��� ���񽺸� �޾ҽ��ϴ�!', TO_DATE('2024-08-23', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr010', 2, 2, 3, '������ �� �Ǿ����� �ð��� ���� �ɷȽ��ϴ�.', TO_DATE('2024-08-18', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr011', 2, 3, 3, '����� ������ �ذ�Ǿ����� �ð��� �ټ� �ҿ�Ǿ����ϴ�.', TO_DATE('2024-09-13', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr012', 1, 1, 1, '�Ϻ��� ���񽺿����ϴ�! ���� �ְ�!', TO_DATE('2024-09-14', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr013', 4, 3, 2, 'ȭ�� ������ �ذ�Ǿ����� ���񽺴� �����̾����ϴ�.', TO_DATE('2024-09-15', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr014', 1, 1, 1, '���� ������ ģ���� ���񽺿����ϴ�.', TO_DATE('2024-09-16', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr015', 3, 2, 3, '����� ������ �� �Ǿ����� �ణ �������� �־����ϴ�.', TO_DATE('2024-09-17', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr016', 3, 3, 4, '���񽺴� ����������, �ð��� ���� �ɷȽ��ϴ�.', TO_DATE('2024-09-21', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr017', 1, 1, 1, '�Ϻ��� ����, ����� �����߽��ϴ�.', TO_DATE('2024-09-22', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr018', 2, 2, 2, '������ �ذ�Ǿ����� ���񽺰� �ణ �ƽ������ϴ�.', TO_DATE('2024-09-23', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr019', 4, 4, 3, '������ ģ���ϰ� ������ �ּ̽��ϴ�.', TO_DATE('2024-09-24', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr020', 1, 1, 1, '���� ������ �Ϻ��� ���񽺿����ϴ�.', TO_DATE('2024-09-25', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr021', 4, 4, 4, '����� ������ �ż��ϰ� �ذ��� �ּ̽��ϴ�.', TO_DATE('2024-09-29', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr022', 5, 5, 5, '�Ϻ��� ���񽺿� �ſ� �����߽��ϴ�.', TO_DATE('2024-09-30', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr023', 4, 4, 3, '���񽺰� ������ ���ҽ��ϴ�.', TO_DATE('2024-10-01', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr024', 3, 3, 3, '������ ���񽺿����� ���� ������ �ֽ��ϴ�.', TO_DATE('2024-10-02', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr025', 5, 5, 5, '������ �ſ� ģ���ϰ� ������ �ذ��� �ּ̽��ϴ�.', TO_DATE('2024-10-03', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr026', 5, 5, 5, 'TV ������ ������ �ذ�Ǿ����ϴ�. ���񽺿� �ſ� �����մϴ�.', TO_DATE('2024-10-07', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr027', 4, 4, 4, '������ ģ���߰� ���� �ذῡ �����մϴ�.', TO_DATE('2024-10-08', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr028', 3, 3, 3, '������ �ʾ����� �ƽ������ϴ�.', TO_DATE('2024-10-09', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr029', 5, 5, 4, '���� ������ �� �ذ��� �ּż� �ſ� �����߽��ϴ�.', TO_DATE('2024-10-10', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr030', 4, 4, 4, 'TV ȭ�� ������ �� �ذ�Ǿ����ϴ�.', TO_DATE('2024-10-11', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr031', 4, 4, 4, '����� ������ ������ �ذ����ּż� �����մϴ�.', TO_DATE('2024-10-12', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr032', 5, 5, 5, '������ ������ �Ϻ��ϰ� ���ּż� �ſ� �����߽��ϴ�.', TO_DATE('2024-10-13', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr033', 3, 3, 3, '���񽺴� ���������� �ð��� ���� ���� �ɷȽ��ϴ�.', TO_DATE('2024-10-14', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr034', 4, 4, 4, '��Ź�� ������ �� �ذ����ּż� �����մϴ�.', TO_DATE('2024-10-15', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr035', 5, 5, 5, '������ ģ���߰�, ����� ������ �Ϻ��ϰ� �ذ�Ǿ����ϴ�.', TO_DATE('2024-10-16', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr036', 5, 5, 5, '������ ������ ������ �ذ����ּż� �ſ� �����߽��ϴ�.', TO_DATE('2024-10-17', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr037', 4, 4, 4, '��Ź�� ���� �ذῡ �����մϴ�.', TO_DATE('2024-10-18', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr038', 5, 5, 5, '����� ������ �� �ذ����ּż� ����帳�ϴ�.', TO_DATE('2024-10-19', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr039', 3, 3, 3, 'TV ������ ���� �ʾ����ϴ�.', TO_DATE('2024-10-20', 'YYYY-MM-DD'))
INTO Review_more (as_request_id, question1, question2, question3, review_comment, review_date) VALUES ('asr040', 4, 4, 4, '������ �Ҹ� ������ �� �ذ����ּ̽��ϴ�.', TO_DATE('2024-10-21', 'YYYY-MM-DD')) 
SELECT * FROM DUAL;

SELECT * FROM REVIEW;
SELECT * FROM TECHNICIAN;
SELECT * FROM REVIEW_MORE;
SELECT * FROM "User";
SELECT * FROM PRODUCT;
SELECT * FROM AS_REQUEST;
SELECT * FROM DIAGNOSE;
SELECT * FROM REPAIR;

--DROP TABLE REVIEW;
--DROP TABLE TECHNICIAN;
--DROP TABLE REVIEW_MORE;
--DROP TABLE "User";
--DROP TABLE PRODUCT;
--DROP TABLE AS_REQUEST;
--DROP TABLE Diagnose;
--DROP TABLE REPAIR;

