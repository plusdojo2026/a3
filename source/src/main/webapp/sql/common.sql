
drop database if exists `a3`;
create database if not exists `a3`;




use `a3`;

CREATE TABLE `a3`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `state` INT NOT NULL DEFAULT 1,
  `name` VARCHAR(20) NOT NULL,
  `birthday` DATE NOT NULL,
  `age` INT NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `tel` VARCHAR(20) NOT NULL,
  `mail` VARCHAR(50) NOT NULL,
  `parents_mail` VARCHAR(50) NOT NULL,
  `post_code` VARCHAR(20) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `preparation` VARCHAR(200) NULL,
  `image_url` VARCHAR(50) NULL,
  PRIMARY KEY (`user_id`)
);



INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(1, '山田太郎', '2013-05-15', 13, '男', '070-8888-8888', 'tarou@gmail', 'yamada@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');

INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(0, '樋口先生', '2013-05-15', 13, '男', '070-8888-8888', 'HIGUCHI@gmail', 'HIGUCHI@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');
INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(1, '山田太郎', '2013-05-15', 13, '男', '070-8888-8888', 'tarou@gmail', 'yamada@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');
INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(1, '山田太郎', '2013-05-15', 13, '男', '070-8888-8888', 'tarou@gmail', 'yamada@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');
INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(1, '山田太郎', '2013-05-15', 13, '男', '070-8888-8888', 'tarou@gmail', 'yamada@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');


INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(0, 'a3', '2026-06-26', 18, '男', '080-8888-8888', 'managaer@gmail', 'HIGUCHI@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', 'XhZrfw3gUeTCVyeA', '', '');
INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(0, 'A3', '2026-06-26', 18, '男', '080-8888-8888', 'managaer@gmail', 'HIGUCHI@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', 'XhZrfw3gUeTCVyeA', '', '');

ALTER TABLE users MODIFY image_url TEXT;

CREATE TABLE if not exists `schedules`(
  `schedule_id` INT PRIMARY KEY AUTO_INCREMENT,
  `date` DATE,
  `subject` VARCHAR(10),
  `start_time` TIME,
  `finish_time` TIME,
  `type` VARCHAR(10),
  `memo` VARCHAR(50),
  `user_id` INT,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);


insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-01', '数学', '09:00:00', '09:45:00', '', '','1');

insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-02', '英語', '13:00:00', '13:45:00', '', '','1');

insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-03', '国語', '11:50:00', '12:35:00', '', '','1');
insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-01', '数学', '09:00:00', '09:45:00', '', '','2');

insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-02', '英語', '13:00:00', '13:45:00', '', '','2');

insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-03', '国語', '11:50:00', '12:35:00', '', '','2');

CREATE TABLE IF NOT EXISTS `subjects` (
  `subject_id` INT AUTO_INCREMENT PRIMARY KEY,
  -- データ番号
  `subject_name` VARCHAR(20) NOT NULL
);

INSERT INTO `subjects` (`subject_name`) 
VALUES 
  ('国語'),
  ('数学'),
  ('英語'),
  ('理科'),
  ('社会');
-- ======================================
-- a3 を作成する
-- ======================================
-- CREATE DATABASE `a3`;

-- a3 を使用する
USE `a3`;

-- ======================================
-- classesテーブル構造
-- classes
-- ├─ class_id        : クラスID(主キー)
-- ├─ user_id         : ユーザーID(外部キー,users)
-- └─ class_name              : クラス名
-- ======================================
CREATE TABLE if not exists `a3`.`classes` (
  `class_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `class_name` VARCHAR(200) NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
  PRIMARY KEY (`class_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


INSERT INTO `classes`(`user_id`,`class_name`) VALUES(1,'一年一組');
INSERT INTO `classes`(`user_id`,`class_name`) VALUES(2,'一年二組');



USE `a3`;


CREATE TABLE if not exists `dialogs` (
  `dialog_id` INT AUTO_INCREMENT PRIMARY KEY,
  -- 日記の番号
  `date` DATE,
  -- 日時
  `contain` VARCHAR(200) NOT NULL,
  -- 日記の本文
  `user_id` INT,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);

INSERT INTO `dialogs` (`date`, `contain`, `user_id`) VALUES
('2026-06-15', '面談を実施しました。', 1),
('2026-06-16', '宿題の提出状況について話し合いました。', 2),
('2026-06-17', '次の小テストの相談を受けました。', 3),
('2026-06-17', '人間関係についての相談を受けました。', 4),
('2026-06-17', '窓ガラスを割った件について指導しました。', 5);
-- ======================================
-- scoresテーブル構造
-- scores
-- ├─ scores_id        : クラスID(主キー)
-- └─ score              : 点数
-- ======================================
CREATE TABLE `a3`.`scores` (
  `scores_id` INT NOT NULL AUTO_INCREMENT,
  `score` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`scores_id`)
);

INSERT INTO `scores`(`score`) VALUES (100);
INSERT INTO `scores`(`score`) VALUES (100);
INSERT INTO `scores`(`score`) VALUES (99);

CREATE database if not exists a3;

-- a3を使用
USE a3;

-- testsテーブル
CREATE TABLE  if not exists `a3`.`tests` (
  `test_id` INT AUTO_INCREMENT,
  `scores_id` INT,
  `test_date` DATE,
  `subject_id` INT,
  `user_id` INT,
  PRIMARY KEY (`test_id`),
  CONSTRAINT `fk_tests_user` FOREIGN KEY (`user_id`) REFERENCES `a3`.`users` (`user_id`),
  CONSTRAINT `fk_tests_score` FOREIGN KEY (`scores_id`) REFERENCES `a3`.`scores` (`scores_id`),
  CONSTRAINT `fk_tests_subject` FOREIGN KEY (`subject_id`) REFERENCES `a3`.`subjects` (`subject_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- サンプルデータ
INSERT INTO `tests` (`scores_id`, `test_date`,  `subject_id`, `user_id`)
VALUES(1, '2026-06-17', 1, 1),(2, '2026-06-17', 2, 1),(3, '2026-06-17', 3, 1);
-- CREATE database `a3`;
-- CREATE DATABASE a3;

-- a3を使用
USE a3;

-- メンタルテストテーブル
CREATE TABLE mental_tests(
    `mt_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `mt_img_url` VARCHAR(100) NOT NULL,
    `question` VARCHAR(200) NOT NULL,

    -- メンタルテスト選択肢
    `choiceA` VARCHAR(200) NOT NULL,
    `choiceB` VARCHAR(200) NOT NULL,
    `choiceC` VARCHAR(200) NOT NULL,
    `choiceD` VARCHAR(200) NOT NULL,

    -- メンタルテスト説明
    `choiceA_descript` VARCHAR(200) NOT NULL,
    `choiceB_descript` VARCHAR(200) NOT NULL,
    `choiceC_descript` VARCHAR(200) NOT NULL,
    `choiceD_descript` VARCHAR(200) NOT NULL,

    -- メンタルテスト点数
    `choiceA_score` INT NOT NULL,
    `choiceB_score` INT NOT NULL,
    `choiceC_score` INT NOT NULL,
    `choiceD_score` INT NOT NULL,

    -- メンタルテスト日付
    `mt_test_date` DATE NOT NULL,
    `user_id` INT,
   FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);

-- サンプルデータ
/*	INSERT INTO `mental_testss` (`mt_img_url`, `question`, `choiceA`, `choiceB`, `choiceC`, `choiceD`, 
		`choiceA_descript`, `choiceB_descript`, `choiceC_descript`, `choiceD_descript`, 
		`choiceA_score`, `choiceB_score`, `choiceC_score`, `choiceD_score`, 
		`mt_test_date`, `user_id`)
		VALUES ('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 1),('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 3),('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 4),('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 1),('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 1);
	*/		
			
			
			
			INSERT INTO mental_tests (
    mt_img_url, question,
    choiceA, choiceB, choiceC, choiceD,
    choiceA_descript, choiceB_descript, choiceC_descript, choiceD_descript,
    choiceA_score, choiceB_score, choiceC_score, choiceD_score,
    mt_test_date, user_id
) VALUES
-- 1
('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
'初対面の人と話すとき、あなたの気持ちに最も近いものはどれですか',
'緊張して避けたい','少し不安だが話せる','普通に話せる','積極的に話しかける',
'内向的傾向が強い','控えめだが適応可能','バランス型','外向性が高い',
1,3,6,10,'2024-12-01',1),

-- 2
('https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
'大人数の飲み会に誘われたら？',
'行きたくない','気分次第','行ってもいい','喜んで参加する',
'内向的傾向が強い','状況により変わるタイプ','平均的','外向性が高い',
1,3,6,10,'2024-12-01',1),

-- 3
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'休日はどのように過ごすことが多いですか',
'一人で静かに','少人数で過ごす','友人と外出','大勢でにぎやかに',
'内向的で落ち着きを好む','控えめな社交性','社交的','非常に外向的',
1,3,6,10,'2024-12-01',1),

-- 4
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'新しい環境に入るときの気持ちは？',
'不安が大きい','少し緊張','すぐ慣れる','むしろ楽しみ',
'変化に弱い','適応に時間が必要','柔軟に対応できる','刺激を好む',
1,3,6,10,'2024-12-01',1),

-- 5
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'会議で意見を求められたら？',
'話したくない','必要なら話す','普通に話せる','自分から発言する',
'内向的','控えめ','平均的','積極的で外向的',
1,3,6,10,'2024-12-01',1),

-- 6
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'パーティーでのあなたの行動は？',
'端で静かに過ごす','知り合いとだけ話す','いろんな人と話す','主役のように振る舞う',
'内向的','控えめな社交性','社交的','非常に外向的',
1,3,6,10,'2024-12-01',1),

-- 7
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'SNS の投稿頻度は？',
'ほぼしない','時々する','よくする','毎日する',
'内向的','控えめ','平均的','外向性が高い',
1,3,6,10,'2024-12-01',1),

-- 8
('https://images.unsplash.com/photo-1506784983877-45594efa4cbe',
'初めての場所でのあなたの行動は？',
'できるだけ目立たない','様子を見る','普通に行動する','積極的に探索する',
'慎重で内向的','控えめ','平均的','冒険心が強い',
1,3,6,10,'2024-12-01',1),

-- 9
('https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
'友達から突然遊びの誘いが来たら？',
'断ることが多い','気分次第','行くことが多い','すぐにOKする',
'内向的','状況依存','社交的','非常に外向的',
1,3,6,10,'2024-12-01',1),

-- 10
('https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb',
'人前で話すことについて',
'とても苦手','少し苦手','普通','得意',
'内向的','控えめ','平均的','外向性が高い',
1,3,6,10,'2024-12-01',1),

-- 11（協調性）
('https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
'困っている人を見るとどう感じますか',
'関わりたくない','余裕があれば助ける','できるだけ助けたい','積極的に助ける',
'協調性が低い','状況依存','協調的','非常に思いやりがある',
1,3,6,10,'2024-12-02',1),

-- 12
('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
'他人の意見に対してあなたは？',
'反発しやすい','時々反発する','受け入れることが多い','積極的に共感する',
'対立的','やや対立的','協調的','非常に協調的',
1,3,6,10,'2024-12-02',1),

-- 13
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'友人が悩みを相談してきたら？',
'面倒に感じる','聞くだけ聞く','助言する','親身に寄り添う',
'冷淡','普通','協力的','非常に思いやりがある',
1,3,6,10,'2024-12-02',1),

-- 14
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'グループ作業では？',
'一人でやりたい','必要最低限だけ協力','協力的に参加','積極的に支援する',
'協調性が低い','やや低い','協調的','非常に協調的',
1,3,6,10,'2024-12-02',1),

-- 15
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'他人の成功を見たときの気持ちは？',
'嫉妬する','少し複雑','素直に喜べる','自分のことのように嬉しい',
'競争心が強い','やや競争的','協調的','非常に協調的',
1,3,6,10,'2024-12-02',1),

-- 16（誠実性）
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'締め切りのある仕事は？',
'いつもギリギリ','時々遅れる','ほぼ守る','必ず早めに終わらせる',
'誠実性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-03',1),

-- 17
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'部屋の片付けは？',
'ほとんどしない','気が向いたらする','定期的にする','常に整理整頓している',
'衝動的','やや無計画','計画的','非常に計画的',
1,3,6,10,'2024-12-03',1),

-- 18
('https://images.unsplash.com/photo-1506784983877-45594efa4cbe',
'約束の時間には？',
'よく遅れる','時々遅れる','ほぼ時間通り','必ず早めに到着する',
'誠実性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-03',1),

-- 19
('https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
'長期的な計画を立てることは？',
'苦手','あまりしない','普通にできる','得意',
'衝動的','やや無計画','計画的','非常に計画的',
1,3,6,10,'2024-12-03',1),

-- 20
('https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb',
'仕事のミスに対して？',
'気にしない','少し気にする','改善しようとする','徹底的に改善する',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-03',1),

-- 21（神経質）
('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
'突然のトラブルが起きたとき？',
'強く不安になる','少し不安になる','冷静に対処する','ほとんど動じない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-04',1),

-- 22
('https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
'小さな失敗をしたとき？',
'ずっと気にする','しばらく気にする','すぐ切り替える','気にしない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-04',1),

-- 23
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'人から注意されたら？',
'深く落ち込む','少し落ち込む','改善しようとする','気にしすぎない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-04',1),

-- 24
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'将来のことを考えると？',
'不安でいっぱいになる','少し不安','楽観的','特に気にしない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-04',1),

-- 25
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'ストレスが溜まったとき？',
'すぐ体調に出る','気分が落ちる','工夫して対処する','ほとんど影響がない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-04',1);


INSERT INTO mental_tests (
    mt_img_url, question,
    choiceA, choiceB, choiceC, choiceD,
    choiceA_descript, choiceB_descript, choiceC_descript, choiceD_descript,
    choiceA_score, choiceB_score, choiceC_score, choiceD_score,
    mt_test_date, user_id
) VALUES
-- 26（開放性）
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'新しい趣味を始めることについてどう感じますか',
'興味がない','誘われたらやる','自分から探す','常に新しいことを求める',
'開放性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 27
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'知らない文化に触れることは？',
'あまり興味がない','少し興味がある','積極的に知りたい','深く学びたい',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 28
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'芸術（音楽・絵画）への関心は？',
'ほとんどない','時々ある','よくある','生活の一部',
'開放性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 29
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'新しいアイデアを考えることは？',
'苦手','あまりしない','よくする','常に考えている',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 30
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'旅行先では？',
'定番だけで十分','少し冒険する','積極的に探索する','現地文化に深く入り込む',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 31
('https://images.unsplash.com/photo-1506784983877-45594efa4cbe',
'読書のジャンルは？',
'同じジャンルだけ読む','時々変える','幅広く読む','常に新ジャンルを探す',
'開放性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 32
('https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
'新しい技術やアプリに対して？',
'抵抗がある','必要なら使う','積極的に試す','人より先に試す',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 33
('https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb',
'未知の体験に対して？',
'避けたい','少し不安','興味がある','強く惹かれる',
'開放性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 34
('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
'創造的な活動（絵・音楽・文章）について？',
'ほとんどしない','時々する','よくする','常に創作している',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 35
('https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
'価値観の違う人と話すことは？',
'避けたい','必要なら話す','興味がある','積極的に議論したい',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-05',1),

-- 36（協調性）
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'他人のミスに対して？',
'厳しく批判する','少し批判する','理解を示す','優しくフォローする',
'協調性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-06',1),

-- 37
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'意見が対立したとき？',
'強く主張する','やや主張する','歩み寄る','相手を尊重する',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-06',1),

-- 38
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'人の気持ちを察するのは？',
'苦手','少し苦手','普通','得意',
'協調性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-06',1),

-- 39
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'友人関係で大切にすることは？',
'自分の意見','自分の利益','お互いの調和','相手の気持ち',
'協調性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-06',1),

-- 40
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'困っている人を見たとき？',
'関わらない','少し気にする','助ける','積極的に支援する',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-06',1),

-- 41（誠実性）
('https://images.unsplash.com/photo-1506784983877-45594efa4cbe',
'仕事の優先順位をつけるのは？',
'苦手','時々できる','普通にできる','得意',
'誠実性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-07',1),

-- 42
('https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
'計画を立てるとき？',
'ほとんど立てない','簡単に立てる','しっかり立てる','詳細に立てる',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-07',1),

-- 43
('https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb',
'忘れ物は？',
'よくする','時々する','あまりしない','ほとんどしない',
'誠実性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-07',1),

-- 44
('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
'仕事の質に対するこだわりは？',
'低い','普通','高い','非常に高い',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-07',1),

-- 45
('https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
'日常のルーティンは？',
'ほとんどない','時々ある','しっかりある','厳格に守る',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-07',1),

-- 46（神経質）
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'他人の評価が気になる？',
'とても気になる','少し気になる','あまり気にしない','ほとんど気にしない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-08',1),

-- 47
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'緊張しやすい？',
'とても緊張する','少し緊張する','あまりしない','ほとんどしない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-08',1),

-- 48
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'心配性？',
'とても心配性','少し心配性','あまり心配しない','ほとんど心配しない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-08',1),

-- 49
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'気分の浮き沈みは？',
'激しい','ややある','少ない','ほとんどない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-08',1),

-- 50
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'ストレスに強い？',
'とても弱い','少し弱い','普通','強い',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-08',1);
INSERT INTO mental_tests (
    mt_img_url, question,
    choiceA, choiceB, choiceC, choiceD,
    choiceA_descript, choiceB_descript, choiceC_descript, choiceD_descript,
    choiceA_score, choiceB_score, choiceC_score, choiceD_score,
    mt_test_date, user_id
) VALUES
-- 51（開放性）
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'新しい料理を試すことについて？',
'興味がない','時々試す','よく試す','常に新しい料理を探す',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-09',1),

-- 52
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'知らない場所への一人旅は？',
'絶対に行かない','少し不安','興味がある','ぜひ行きたい',
'開放性が低い','やや低い','高い','非常に高い',
1,3,6,10,'2024-12-09',1),

-- 53
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'新しい考え方に触れたとき？',
'受け入れにくい','少し抵抗がある','興味がある','積極的に取り入れる',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-09',1),

-- 54
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'創造的な問題解決は？',
'苦手','時々できる','得意','非常に得意',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-09',1),

-- 55
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'新しい音楽ジャンルを聴くことは？',
'ほとんどない','時々ある','よくある','常に探している',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-09',1),

-- 56（外向性）
('https://images.unsplash.com/photo-1506784983877-45594efa4cbe',
'職場のイベントには？',
'参加しない','気分次第','参加する','積極的に盛り上げる',
'内向的','やや内向的','外向的','非常に外向的',
1,3,6,10,'2024-12-10',1),

-- 57
('https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
'知らない人と話すのは？',
'避けたい','必要なら話す','普通に話せる','むしろ好き',
'内向的','普通','外向的','非常に外向的',
1,3,6,10,'2024-12-10',1),

-- 58
('https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb',
'にぎやかな場所は？',
'苦手','少し苦手','好き','大好き',
'内向的','やや内向的','外向的','非常に外向的',
1,3,6,10,'2024-12-10',1),

-- 59
('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
'友達を作るスピードは？',
'遅い','普通','早い','とても早い',
'内向的','普通','外向的','非常に外向的',
1,3,6,10,'2024-12-10',1),

-- 60
('https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
'雑談は？',
'苦手','少し苦手','普通','得意',
'内向的','やや内向的','外向的','非常に外向的',
1,3,6,10,'2024-12-10',1),

-- 61（協調性）
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'他人の意見を尊重する？',
'あまりしない','時々する','よくする','常にする',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-11',1),

-- 62
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'人の気持ちに寄り添う？',
'苦手','時々できる','よくできる','非常に得意',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-11',1),

-- 63
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'争いごとは？',
'避けない','時々避ける','できるだけ避ける','絶対に避ける',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-11',1),

-- 64
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'他人の成功を祝える？',
'あまり祝えない','普通','祝える','心から祝える',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-11',1),

-- 65
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'困っている人を助ける？',
'助けない','時々助ける','よく助ける','積極的に助ける',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-11',1),

-- 66（誠実性）
('https://images.unsplash.com/photo-1506784983877-45594efa4cbe',
'仕事の締め切り管理は？',
'苦手','時々できる','できる','完璧にできる',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-12',1),

-- 67
('https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
'物事を最後までやり遂げる？',
'あまりできない','時々できる','よくできる','必ずできる',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-12',1),

-- 68
('https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb',
'計画通りに行動する？',
'苦手','時々できる','できる','常にできる',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-12',1),

-- 69
('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
'整理整頓は？',
'苦手','時々する','よくする','常にしている',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-12',1),

-- 70
('https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
'約束を守る？',
'あまり守らない','時々守る','よく守る','必ず守る',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-12',1),

-- 71（神経質）
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'小さなことで不安になる？',
'とてもなる','少しなる','あまりならない','ほとんどならない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-13',1),

-- 72
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'気持ちの切り替えは？',
'とても苦手','少し苦手','普通','得意',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-13',1),

-- 73
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'ストレスを感じやすい？',
'とても感じる','少し感じる','あまり感じない','ほとんど感じない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-13',1),

-- 74
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'落ち込みやすい？',
'とても落ち込む','少し落ち込む','あまり落ち込まない','ほとんど落ち込まない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-13',1),

-- 75
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'緊張に強い？',
'とても弱い','少し弱い','普通','強い',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-13',1);

INSERT INTO mental_tests (
    mt_img_url, question,
    choiceA, choiceB, choiceC, choiceD,
    choiceA_descript, choiceB_descript, choiceC_descript, choiceD_descript,
    choiceA_score, choiceB_score, choiceC_score, choiceD_score,
    mt_test_date, user_id
) VALUES
-- 76（開放性）
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'新しい分野の勉強を始めるとしたら？',
'興味がない','必要ならやる','自分から始める','積極的に深く学ぶ',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-14',1),

-- 77
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'未知の体験に対しての姿勢は？',
'避ける','慎重に試す','興味を持つ','積極的に挑戦する',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-14',1),

-- 78
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'新しい価値観に触れたとき？',
'拒否する','少し抵抗がある','理解しようとする','積極的に受け入れる',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-14',1),

-- 79
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'創造的な発想は？',
'苦手','時々できる','よくできる','常にしている',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-14',1),

-- 80
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'新しい映画ジャンルを観る？',
'ほとんどしない','時々する','よくする','常に探している',
'開放性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-14',1),

-- 81（外向性）
('https://images.unsplash.com/photo-1506784983877-45594efa4cbe',
'初対面の人と食事する？',
'避けたい','少し不安','普通','楽しみ',
'内向的','やや内向的','外向的','非常に外向的',
1,3,6,10,'2024-12-15',1),

-- 82
('https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
'イベントでのあなたは？',
'隅で静かに','知り合いとだけ話す','多くの人と話す','中心で盛り上げる',
'内向的','普通','外向的','非常に外向的',
1,3,6,10,'2024-12-15',1),

-- 83
('https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb',
'人と話すときのエネルギーは？',
'消耗する','少し疲れる','普通','逆に元気になる',
'内向的','やや内向的','外向的','非常に外向的',
1,3,6,10,'2024-12-15',1),

-- 84
('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
'知らない人に話しかける？',
'ほぼしない','時々する','よくする','積極的にする',
'内向的','普通','外向的','非常に外向的',
1,3,6,10,'2024-12-15',1),

-- 85
('https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
'大人数の場は？',
'苦手','少し苦手','好き','大好き',
'内向的','やや内向的','外向的','非常に外向的',
1,3,6,10,'2024-12-15',1),

-- 86（協調性）
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'人の気持ちを考える？',
'あまりしない','時々する','よくする','常にする',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-16',1),

-- 87
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'相手の立場に立って考える？',
'苦手','時々できる','よくできる','常にできる',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-16',1),

-- 88
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'人の失敗に対して？',
'厳しい','少し厳しい','理解を示す','優しくフォローする',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-16',1),

-- 89
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'他人の意見を聞く姿勢は？',
'否定的','少し否定的','受け入れる','積極的に聞く',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-16',1),

-- 90
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'人の役に立つことは？',
'興味がない','時々する','よくする','積極的にする',
'協調性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-16',1),

-- 91（誠実性）
('https://images.unsplash.com/photo-1506784983877-45594efa4cbe',
'物事を計画通りに進める？',
'苦手','時々できる','できる','常にできる',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-17',1),

-- 92
('https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
'責任感は？',
'低い','普通','高い','非常に高い',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-17',1),

-- 93
('https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb',
'やりかけの仕事は？',
'放置する','時々放置する','最後までやる','必ず完了させる',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-17',1),

-- 94
('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
'細かい作業は？',
'苦手','少し苦手','得意','非常に得意',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-17',1),

-- 95
('https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
'時間管理は？',
'苦手','時々できる','できる','完璧にできる',
'誠実性が低い','普通','高い','非常に高い',
1,3,6,10,'2024-12-17',1),

-- 96（神経質）
('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee',
'不安を感じやすい？',
'とても感じる','少し感じる','あまり感じない','ほとんど感じない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-18',1),

-- 97
('https://images.unsplash.com/photo-1504196606672-aef5c9cefc92',
'気分が落ち込みやすい？',
'とても落ち込む','少し落ち込む','あまり落ち込まない','ほとんど落ち込まない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-18',1),

-- 98
('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d',
'緊張しやすい？',
'とても緊張する','少し緊張する','あまりしない','ほとんどしない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-18',1),

-- 99
('https://images.unsplash.com/photo-1503342217505-b0a15ec3261c',
'ストレスに弱い？',
'とても弱い','少し弱い','普通','強い',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-18',1),

-- 100
('https://images.unsplash.com/photo-1517841905240-472988babdf9',
'心配事を引きずる？',
'とても引きずる','少し引きずる','あまり引きずらない','ほとんど引きずらない',
'神経質が高い','やや高い','安定している','非常に安定している',
10,6,3,1,'2024-12-18',1);

-- CREATE database `a3`;

USE `a3`;

CREATE TABLE `mental_scores` (
  `mt_scores_id` INT AUTO_INCREMENT PRIMARY KEY,
  -- 得点ID
  `score` VARCHAR(50),
  -- スコア                          
  `status` VARCHAR(50),
  -- 状態                        
  `mt_scores_memo` VARCHAR(500),
  -- メモ                  
  `mt_id` INT,
  -- 心理テストID                               
  `user_id` INT,
  -- ID     
  FOREIGN KEY (`mt_id`) REFERENCES `mental_tests`(`mt_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);

INSERT INTO mental_scores
(score, status, mt_scores_memo, mt_id, user_id)
VALUES

-- NORMAL
('88', 'NORMAL',
'【分析】: 社交性・安定性ともに高い優良な傾向が見られます。

【最終スコア】: 88.00
【分散】: 3.20
【時間分散】: 900.00
【平均時間】: 1800.00
【距離】: 10.20
[正常] 安定した回答パターンです。',
1, 1),

--  OBSERVE
('65', 'OBSERVE',
'【分析】: 全体的にバランスは良いが、やや変動が見られます。

【最終スコア】: 65.00
【分散】: 6.50
【時間分散】: 1500.00
【平均時間】: 2000.00
【距離】: 18.40
[観察] 軽度な変動が見られます。',
2, 2),

--  WARNING
('48', 'WARNING',
'【分析】: 回答にばらつきがあり、注意が必要です。

【最終スコア】: 48.00
【分散】: 14.20
【時間分散】: 3200.00
【平均時間】: 2500.00
【距離】: 28.70
[注意] 回答のばらつきが大きく、注意が必要です。',
3, 1),

--  ALERT
('32', 'ALERT',
'【分析】: 精神状態に大きな不安定要素が検出されました。

【最終スコア】: 32.00
【分散】: 21.50
【時間分散】: 4500.00
【平均時間】: 3000.00
【距離】: 40.10
[警告] 異常な回答傾向が検出されました。',
4, 2);

ALTER TABLE mental_scores ADD test_date DATE;
UPDATE mental_scores SET test_date = CURDATE() WHERE test_date IS NULL;
-- CREATE database `a3`;

USE `a3`;

CREATE TABLE `chat` (
  `chat_id` INT AUTO_INCREMENT PRIMARY KEY,
  -- チャットID
  `user_id_speaker` INT NOT NULL,
  -- 送信者
  `user_id_listener` INT NOT NULL,
  -- 受信者
  `talk` VARCHAR(1638),
  -- チャット内容
  `chat_image` VARCHAR(200),
  -- 画像パス
  `check` INT DEFAULT 0,
  -- （0=未読,1=既読）
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  -- 送信日時
  `user_id` INT NOT NULL,
  -- ID
  FOREIGN KEY (`user_id_speaker`) REFERENCES `users`(`user_id`),
  FOREIGN KEY (`user_id_listener`) REFERENCES `users`(`user_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);
USE `a3`;

CREATE TABLE if not exists `a3`.`trouble` (
  `trouble_id` INT PRIMARY KEY AUTO_INCREMENT,
  `tr_date` DATE, 
  `title` VARCHAR(600) NOT NULL,
  `contents` VARCHAR(600) NOT NULL,
  `members` VARCHAR(100) NOT NULL,
  `user_id` INT,
  `situation` VARCHAR(100) NOT NULL DEFAULT '対応中',
  FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`)
);
INSERT INTO trouble 
(tr_date, title, contents, members, user_id, situation)
VALUES 
('2026-06-22', '休み時間の口論', '休み時間に同じ班の生徒との口論があり、授業後に担任が聞き取りを行った。', '山田太郎', 1, '対応中'),
('2026-06-23', '休み時間の口論', '休み時間に同じ班の生徒との口論があり、授業後に担任が聞き取りを行った。', '山田太郎', 1, '対応中'),
('2026-06-24', '休み時間の口論', '休み時間に同じ班の生徒との口論があり、授業後に担任が聞き取りを行った。', '山田太郎', 1, '対応中'),
('2026-06-25', '休み時間の口論', '休み時間に同じ班の生徒との口論があり、授業後に担任が聞き取りを行った。', '山田太郎', 1, '対応中');