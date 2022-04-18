show variables like '%ft_min%';

ALTER TABLE astar_admin.test ADD FULLTEXT(contents);
CREATE FULLTEXT INDEX idx1 ON test (contents);




select * from astar_admin.test
                  # where match(contents) against('"나는 그대를 사랑 합니다."' in boolean mode);
where match(contents) against('*세상');

SELECT * FROM test WHERE MATCH(contents) AGAINST('*세* *사랑* *엄마*' IN BOOLEAN MODE);
SELECT * FROM test WHERE MATCH(contents) AGAINST('만들');
SELECT * FROM test WHERE MATCH(contents) AGAINST('+"만들어낸"' in boolean mode);

SELECT * FROM test WHERE MATCH(contents) AGAINST('나는 그대를 사랑 합니다.');



# ALTER TABLE astar_admin.test ADD FULLTEXT INDEX ftest (contents) VISIBLE;


# ALTER TABLE astar_admin.test convert to charset utf8;

# insert into astar_admin.test values ('나를 세상에 태어나게 한 부모님을 고소하고 싶어요');
# insert into astar_admin.test value ('절대 현혹되지 마라');
# insert into astar_admin.test value ('사는 게 숨이 차요');
# insert into astar_admin.test value ('행복은 나눌수록 커지잖아요.');
# insert into astar_admin.test value ('욕망은 인간을 다른 존재로 만든다');
# insert into astar_admin.test value ('닭을 잡을 것인가 범인을 잡을 것인가');
# insert into astar_admin.test value ('나는 아들을 사랑하지 않는다');
# insert into astar_admin.test value ('내가 널 사랑할 수 있을까?');
# insert into astar_admin.test value ('사랑에 관한 가장 기묘한 상상');
# insert into astar_admin.test value ('나의 소원은 평범한 어른이 되는 것입니다');
# insert into astar_admin.test value ('사랑이 만들어낸 예술이라는 기적');
# insert into astar_admin.test value ('당신의 거짓된 믿음이 우리의 죄가 되었다');
# insert into astar_admin.test value ('언젠가는 엄마도 나를 사랑하지 않을 거야, 하지만 나는 항상 엄마를 위해 살게');
# insert into astar_admin.test value ('나와 함께 노래할래요?');
# insert into astar_admin.test value ('두려움은 너를 죄수로 가두고, 희망은 너를 자유롭게 하리라');
# insert into astar_admin.test value ('열일곱, 내 안의 엄마는 죽었다');
# insert into astar_admin.test value ('진화는 인류를 위협하는 혁명이다');
# insert into astar_admin.test value ('당신은 내가 더 좋은 사람이 되고싶게 해요.');
# insert into astar_admin.test value ('사랑은 그렇게 다시 기억된다');
# insert into astar_admin.test value ('우린 답을 찾을 것이다, 늘 그랬듯이');
# insert into astar_admin.test value ('15년간의 감금, 5일간의 추적');
# insert into astar_admin.test value ('아직도 망설이고 있나요?');
# insert into astar_admin.test value ('모든 황홀한 순간엔 고통이 대가로 따른다');
# insert into astar_admin.test value ('오랜만이야 조제, 잘 지내지?');
# insert into astar_admin.test value ('희망이 춤추던 자리에 당신이 있었습니다');
# insert into astar_admin.test value ('내가 낳은 작은 괴물');
# insert into astar_admin.test value ('난 그들의 삶을 훔쳤고, 그들은 나의 인생을 바꿨다');
# insert into astar_admin.test value ('미리 인사하죠, 굿애프터눈 굿이브닝 굿나잇!');
# insert into astar_admin.test value ('어쩌면 당신의 이야기');
# insert into astar_admin.test value ('당신의 삶은 진짜입니까?');
# insert into astar_admin.test value ('나는 피해자이며, 목격자이며 범인이다. 나는 누구인가?');
# insert into astar_admin.test value ('무지개 끝엔 황금이 있대');
# insert into astar_admin.test value ('천재성에는 인종이 없고 강인함에는 남녀가 없으며 용기에는 한계가 없다');

