
#Q1#

create table departments(
 department_id int unsigned not null auto_increment primary key,
 name VARCHAR(20) not null,
 created_at timestamp not null default current_timestamp,
 updated_at timestamp not null default current_timestamp on update current_timestamp
);




#Q2#

alter table people add department_id INT unsigned after email;




#Q3 (departments)#

insert into departments(name)
values
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

#Q3 (people)#

insert into people(name,email,department_id,age,gender)
values
('和泉一織','iori@beyond-works.co.jp','5','27','1'),
('二階堂大和','yamato@beyond-works.co.jp','2','32','1'),
('和泉三月','mituki@beyond-works.co.jp','1','31','1'),
('四葉環','tamaki@beyond-works.co.jp','2','27','1'),
('逢坂壮五','sougo@beyond-works.co.jp','3','30','1'),
('六弥ナギ','nagi@beyond-works.co.jp','1','29','1'),
('七瀬陸','riku@beyond-works.co.jp','1','28','1'),
('八乙女楽','gaku@beyond-works.co.jp','2','32','1'),
('九条天','ten@beyond-works.co.jp','4','28','1'),
('十龍之介','ryuu@beyond-works.co.jp','2','33','1');

#Q3 (reports)#

insert into reports(person_id,content)
values
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

update people
set department_id = case person_id
when 1 then 1
when 2 then 2
when 3 then 3
when 4 then 4
when 6 then 5
else department_id
end
where person_id in (1,2,3,4,6);




#Q5#

select name, age
from people
where gender = 1
order by age desc;




#Q6#

'people'テーブルから、'name'、'email'、'age'の情報を取得し、昇順に並べたい。
ただし、'department_id'のカラムが1に該当するレコードに限定する。




#Q7#

select name
from people
where
(age between 20 and 29 and gender = 2)
or
(age between 40 and 49 and gender = 1);




#Q8#

select name
from people
where department_id = 1
order by age asc;




#Q9#

select avg(age)
as average_age
from people
where department_id = 2 and gender = 2;




#Q10#

select
people.name,
people.department_id,
reports.content
from
reports
left join
people
on
people.person_id = reports.person_id;




#Q11#

SELECT people.name
FROM people
LEFT JOIN reports
ON people.person_id = reports.person_id
WHERE reports.person_id IS NULL;