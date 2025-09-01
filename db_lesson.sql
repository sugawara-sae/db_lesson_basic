#Q1#

CREATE TABLE
  departments(
    department_id int unsigned not null auto_increment primary key,
    name VARCHAR(20) not null,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp on update current_timestamp
    );




#Q2#

ALTER TABLE 
  people 
ADD
  department_id
INT
  unsigned
AFTER
  email;




#Q3 (departments)#

INSERT INTO 
  departments(name)
VALUES
  ('営業'),
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');

#Q3 (people)#

INSERT INTO
  people
  (name,email,department_id,age,gender)
VALUES
  ('和泉一織','iori@beyond-works.co.jp',5,27,1),
  ('二階堂大和','yamato@beyond-works.co.jp',2,32,1),
  ('和泉三月','mituki@beyond-works.co.jp',1,31,1),
  ('四葉環','tamaki@beyond-works.co.jp',2,27,1),
  ('逢坂壮五','sougo@beyond-works.co.jp',3,30,1),
  ('六弥ナギ','nagi@beyond-works.co.jp',1,29,1),
  ('七瀬陸','riku@beyond-works.co.jp',1,28,1),
  ('八乙女楽','gaku@beyond-works.co.jp',2,32,1),
  ('九条天','ten@beyond-works.co.jp',4,28,1),
  ('十龍之介','ryuu@beyond-works.co.jp',2,33,1);

#Q3 (reports)#

INSERT INTO 
  reports
  (person_id,content)
VALUES
  ('11','経理担当になりました。逢坂です。'),
  ('9','営業担当になりました。和泉三月です。'),
  ('13','営業担当になりました！七瀬陸です！'),
  ('15','人事担当になりました。九条です。'),
  ('8','開発担当になりました。二階堂です。'),
  ('16','開発担当になりました。十です。'),
  ('7','情報システム担当になりました。和泉一織です。'),
  ('14','開発担当になりました。八乙女です。'),
  ('12','営業担当になりました。六弥です。'),
  ('10','開発担当になりました。四葉です。');




#Q4#

UPDATE
  people
SET
  department_id = case person_id
    WHEN 1 THEN 1
    WHEN 2 THEN 2
    WHEN 3 THEN 3
    WHEN 4 THEN 4
    WHEN 6 THEN 5
ELSE
  department_id
END
WHERE
  person_id in (1,2,3,4,6);




#Q5#

SELECT
  name, age
FROM
  people
WHERE
  gender = 1
ORDER BY
  age
DESC;




#Q6#

'people'テーブルから、'name'、'email'、'age'の情報を取得し、'作成日時の昇順'に並べたい。
ただし、'department_id'のカラムが1に該当するレコードに限定する。




#Q7#

SELECT
  name
FROM
  people
WHERE
  (age between 20 and 29 and gender = 2)
  or
  (age between 40 and 49 and gender = 1);




#Q8#

SELECT
  name
FROM
  people
WHERE
  department_id = 1
ORDER BY
  age
ASC;




#Q9#

SELECT
  avg(age) as average_age
FROM
  people
WHERE
  department_id = 2
  and
  gender = 2;




#Q10#

SELECT
people.name,
departments.name,
reports.content
FROM
  people
INNER JOIN
  departments
    ON people.department_id = departments.department_id
INNER JOIN
  reports
    ON people.person_id = reports.person_id;




#Q11#

SELECT
  people.name
FROM
  people
LEFT JOIN
  reports
ON
  people.person_id = reports.person_id
WHERE
  reports.person_id IS NULL;
  