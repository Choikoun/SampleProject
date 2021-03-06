CREATE TABLE member(
  id INT NOT NULL PRIMARY KEY IDENTITY (1, 1), 
  userid VARCHAR(20) NOT NULL, 
  userpwd VARCHAR(20) NOT NULL,
  name VARCHAR(20) NOT NULL, 
  gender VARCHAR(10), age INT,
  email VARCHAR(50), 
  phone VARCHAR(20), 
  auth VARCHAR(50) NOT NULL DEFAUlT 1,
  regitdate DATETIME NOT NULL DEFAULT (CONVERT(VARCHAR(50), getdate(), 121)),
  status INT NOT NULL DEFAULT 1);

CREATE TABLE board(
  id INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
  level INT NOT NULL DEFAULT 0,
  -- refid int references board(id),
  refid INT,
  title VARCHAR(50) NOT NULL,
  contents VARCHAR(500),
  -- writer int not null references member(id),
  writer INT NOT NULL,
  writedate VARCHAR(50) NOT NULL DEFAULT (CONVERT(VARCHAR(50), getdate(), 120)),
  modifieddate VARCHAR(50) NOT NULL DEFAULT (CONVERT(VARCHAR(50), getdate(), 120)),
  status INT NOT NULL DEFAULT 1);

  
INSERT INTO member(userid, userpwd, name, auth)
VALUES      ('huntak', '123', '오훈탁', 1);

INSERT INTO member(userid, userpwd, name, auth)
VALUES      ('test1', '123', '김정래', 2);

INSERT INTO member(userid, userpwd, name, auth)
VALUES      ('test2', '123', '임종빈', 3);

INSERT INTO member(userid, userpwd, name, auth)
VALUES      ('test3', '123', '임충환', 3);

INSERT INTO member(userid, userpwd, name, auth)
VALUES      ('test4', '123', '방재웅', 3);

INSERT INTO member(userid, userpwd, name, auth)
VALUES      ('test5', '123', '김민준', 3);



INSERT INTO board(title, contents, writer)
VALUES      ('첫번째글', 'ㅇㅇ잘되넹', 1);

INSERT INTO board(title, contents, writer)
VALUES      ('2번째글', 'gggg', 1);

INSERT INTO board(level, refid, title, contents, writer)
VALUES      (1, 1, '3번째글', 'wwww', 1);

INSERT INTO board(level, refid, title, contents, writer)
VALUES      (2, 1, '4번째글', 'dddd', 1);

INSERT INTO board(level, refid, title, contents, writer)
VALUES      (1, 2, '5번째글', 'zzz', 1);

INSERT INTO board(title, contents, writer)
VALUES      ('5번째글', 'zzz', 1);

INSERT INTO board(title, contents, writer)
VALUES      ('5번째글', 'zzz', 1);

INSERT INTO board(title, contents, writer)
VALUES      ('5번째글', 'zzz', 1);

INSERT INTO board(title, contents, writer)
VALUES      ('5번째글', 'zzz', 1);

INSERT INTO board(title, contents, writer)
VALUES      ('5번째글', 'zzz', 1);

INSERT INTO board(title, contents, writer)
VALUES      ('5번째글', 'zzz', 1);

INSERT INTO board(title, contents, writer)
VALUES      ('5번째글', 'zzz', 1);

INSERT INTO board(title, contents, writer)
VALUES      ('5번째글', 'zzz', 1);



-- 삭제 게시판 다시 보이게
UPDATE board
SET    status = 1;

-- 게시판 글 무한 증식 ㅎ.ㅎ
INSERT INTO board([level], refid, title, contents, writer, writedate, modifieddate, status)
  SELECT [level], refid, title, contents, writer, writedate, modifieddate, status FROM board;