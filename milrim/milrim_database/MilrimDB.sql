-- Member table
CREATE TABLE Member (
    ID VARCHAR2(100) PRIMARY KEY,
    Pass VARCHAR2(100),
    Name VARCHAR2(100),
    Email VARCHAR2(100),
    PhoneNumber VARCHAR2(100),
    Auth VARCHAR2(100)
);
SELECT * FROM MEMBER ;
DELETE FROM MEMBER;

UPDATE Member
SET Pass = '3333'
WHERE Pass = '1111' AND id='himan';

DELETE FROM member WHERE id = '1123';

-- Select all data from Member table
SELECT * FROM Member;

SELECT * FROM MEMBER WHERE ID like 'heoyoun38' AND PASS like '00000000';

SELECT MembershipID,id,StartDate,EndDate FROM Membership WHERE id = 'gPdnjs01';


SELECT * FROM MEMBER WHERE id LIKE '%'||'heoyoun38'||'%' and NAME LIKE '%'||'윤석민'||'%';


INSERT INTO MEMBER values('heoyoun38','0000','윤석민','heoyoun38@naver.com','01033293090','admin');
INSERT INTO MEMBER values('dbsdk01','0000','김윤아','dbsdk12@naver.com','01011112222','admin');
INSERT INTO MEMBER values('gPdnjs01','0000','신혜원','gPdnjs12@naver.com','01033332222','admin');
INSERT INTO MEMBER values('dudwo01','0000','유영재','dudwo12@naver.com','01044442222','admin');
INSERT INTO MEMBER values('wnsrb11','0000','강준규','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('ruddnd','0000','강경웅','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('ektha23','0000','박다솜','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('wnsehf14','0000','김준혁','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja01','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja02','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja03','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja04','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja05','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja06','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja07','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja08','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja09','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja10','0000','실험','Tkddyd18@naver.com','01044442222','user');
INSERT INTO MEMBER values('tlagja11','0000','실험','Tkddyd18@naver.com','01044442222','user');

-- Video Post table
CREATE TABLE VideoPost (
    VideoID VARCHAR2(100) PRIMARY KEY,
    Title VARCHAR2(100),
    Synopsis VARCHAR2(100),
    Image VARCHAR2(100),
    Video VARCHAR2(100),
    UploadDate DATE,
    ParentNumber VARCHAR2(100),
  	value VARCHAR2(100)
);

DROP TABLE VIDEOPOST;
DELETE FROM VIDEOPOST;

CREATE SEQUENCE postSQU
    START WITH 1   -- 시작값 설정 (기본값: 1)
    INCREMENT BY 1 -- 증가값 설정 (기본값: 1)
    MAXVALUE 99999
    NOCACHE;
   
SELECT  * FROM VIDEOPOST v ;

INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '진격의 거인', '설명샬아상라', 'image1', 'video1', sysdate,'진격의거인',NULL);
INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '갓슈벨', '설명샬아상라1', 'image2', 'video2', sysdate,'갓슈벨',NULL);
INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '흑집사', '설명샬아상라2', 'image3', 'video3', sysdate,'흑집사',NULL);
INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '코난', '설명샬아상라3', 'image4', 'video4', sysdate,'코난',NULL);

INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '진격의 거인1화', '줄거리', 'image1-1', 'video1-1', sysdate,'1','진격의거인');
INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '진격의 거인2화', '줄거리', 'image1-2', 'video1-2', sysdate,'2','진격의거인');
INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '진격의 거인3화', '줄거리', 'image1-3', 'video1-3', sysdate,'3','진격의거인');
INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '갓슈벨 1화', '줄거리', 'image2-1', 'video2-1', sysdate,'1','갓슈벨');
INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '갓슈벨 2화', '줄거리', 'image2-2', 'video2-2', sysdate,'2','갓슈벨');
INSERT INTO VIDEOPOST VALUES ('v'||postSQU.nextval, '갓슈벨 3화', '줄거리', 'image2-3', 'video2-3', sysdate,'3','갓슈벨');

DELETE FROM VIDEOPOST WHERE VALUE = '갓슈벨';

SELECT LEVEL, p.*
FROM VIDEOPOST p
START WITH ParentNumber LIKE '%'||''||'%'
CONNECT BY PRIOR ParentNumber = value
ORDER BY IMAGE;

SELECT LEVEL, v.*
FROM VIDEOPOST v
START WITH value IS NULL 
CONNECT BY PRIOR ParentNumber = value
ORDER BY IMAGE;

SELECT LEVEL, v.*
FROM VIDEOPOST v
START WITH value IS NULL 
CONNECT BY PRIOR ParentNumber = value
ORDER BY IMAGE;

DELETE FROM VIDEOPOST WHERE ParentNumber = '10'; 


-- Comment table
CREATE TABLE Comment (
    CommentID VARCHAR2(100) PRIMARY KEY,
    PostID VARCHAR2(100) REFERENCES VideoPost(VideoID),
    Content VARCHAR2(100),
    CDate DATE,
    ID VARCHAR2(100) REFERENCES Member(ID) ON DELETE CASCADE
);

-- Tag table
CREATE TABLE Tag (
    VideoID VARCHAR2(100) REFERENCES VideoPost(VideoID) ON DELETE CASCADE,
    TagName VARCHAR2(100)
);

-- Bookmark table
CREATE TABLE Bookmark (
    ID VARCHAR2(100) REFERENCES Member(ID) ON DELETE CASCADE,
    VideoID VARCHAR2(100) REFERENCES VideoPost(VideoID) ON DELETE CASCADE
);

-- Card table
CREATE TABLE Card (
    ID VARCHAR2(100) REFERENCES Member(ID) ON DELETE CASCADE,
    CardNum VARCHAR2(100),
    MMYY VARCHAR2(100),
    bday VARCHAR2(100),
    cardPass VARCHAR2(100)
);
SELECT * FROM card WHERE id = 'min030900';
INSERT INTO card VALUES ('min030900','1111222233334444','22/44','980309','1234');
INSERT INTO card VALUES (#{id},#{cardNum},#{mm},#{yy},#{bday},#{cardPass});
SELECT * FROM card;
DROP TABLE card;

-- Free Board table
CREATE TABLE FreeBoard (
    PostID VARCHAR2(100) PRIMARY KEY,
    Title VARCHAR2(100),
    Content VARCHAR2(3000),
    FBDate DATE,
    ID VARCHAR2(100) REFERENCES Member(ID) ON DELETE CASCADE
);
      
CREATE SEQUENCE freeboSQU
    START WITH 1   -- 시작값 설정 (기본값: 1)
    INCREMENT BY 1 -- 증가값 설정 (기본값: 1)
    MAXVALUE 99999
    NOCACHE;       
   
SELECT * FROM FREEBOARD f ;

DELETE FROM FREEBOARD WHERE postid = #{postid};
DELETE FROM FREEBOARD WHERE postid = 3;


SELECT postid,title,TO_CHAR (fbdate,'YYYY-MM-DD'),id FROM FREEBOARD WHERE title LIKE '%'||'실험2'||'%';
INSERT INTO FREEBOARD VALUES (freeboSQU.nextval,'실험','안녕~',sysdate,'heoyoun38');
INSERT INTO FREEBOARD VALUES (freeboSQU.nextval,'실험2','안녕~2',sysdate,'himan');
INSERT INTO FREEBOARD VALUES (freeboSQU.nextval,'실험3','안녕~3',sysdate,'himan');
-- Membership table
CREATE TABLE Membership (
    MembershipID VARCHAR2(100) PRIMARY KEY,
    ID VARCHAR2(100) REFERENCES Member(ID) ON DELETE CASCADE,
    StartDate DATE,
    EndDate DATE
);
ALTER TABLE Membership ADD CONSTRAINT uk_Membership_ID UNIQUE (ID);

DROP TABLE MEMBERSHIP ;
DELETE FROM MEMBERSHIP m ;
SELECT MembershipID,id,TO_CHAR(StartDate,'YYYY-MM-DD'),TO_CHAR(EndDate,'YYYY-MM-DD') FROM Membership WHERE id = 'heoyoun38';

SELECT * FROM MEMBERSHIP m ;

SELECT ADD_MONTHS(sysdate, 1) AS date_after_one_month
FROM dual;
INSERT INTO Membership VALUES ('s'||shipSQ.nextval,'heoyoun38',sysdate,ADD_MONTHS(sysdate, 1));
INSERT INTO Membership VALUES ('s'||shipSQ.nextval,'gPdnjs01',sysdate,ADD_MONTHS(sysdate, 1));
CREATE SEQUENCE shipSQ
    START WITH 5   -- 시작값 설정 (기본값: 1)
    INCREMENT BY 1 -- 증가값 설정 (기본값: 1)
    MAXVALUE 99999
    NOCACHE;

-- Select all data from VideoPost table
SELECT * FROM VideoPost;

-- Select all data from Comment table
SELECT * FROM Comment01;

-- Select all data from Tag table
SELECT * FROM Tag;

-- Select all data from Bookmark table
SELECT * FROM Bookmark;

-- Select all data from Card table
SELECT * FROM Card;

-- Select all data from FreeBoard table
SELECT * FROM FreeBoard;

-- Select all data from Membership table
SELECT * FROM Membership;



-- Drop VideoPost table
DROP TABLE VideoPost;

-- Drop Comment table
DROP TABLE Comment01;

-- Drop Tag table
DROP TABLE Tag;

-- Drop Bookmark table
DROP TABLE Bookmark;

-- Drop Card table
DROP TABLE Card;

-- Drop FreeBoard table
DROP TABLE FreeBoard;

-- Drop Membership table
DROP TABLE Membership;

-- Drop Member table
DROP TABLE Member;


