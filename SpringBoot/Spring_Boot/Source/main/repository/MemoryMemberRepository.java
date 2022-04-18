package spring.boot.repository;


import spring.boot.domain.Member;

import java.util.*;

public class MemoryMemberRepository implements MemberRepository{

    private static Map<Long, Member> store=new HashMap<>();
    private static long sequence =0L; //키값생성하고 id로 부여

    @Override
    public Member save(Member member) {
        //아이디 생성
        member.setId(++sequence);
        store.put(member.getId(), member);//해당아이디와 멤버이름
        return null;
    }

    @Override
    public Optional<Member> findById(Long id) {
        //Optional.ofNullable : 저장소에서 회원정보를 id를 통해서 가져올때 null이 아닐때 가져옴
        //if(store.get(id) !=null){ }
        return Optional.ofNullable(store.get(id));
    }

    @Override
    public Optional<Member> findByName(String name) {
        //lambda  사용
        //store의 값 member(store.values())에 name이 같은 값이 있는지 필터링을 거쳐서 .findAny()로 name반환
        return store.values().stream()
                .filter(member -> member.getName().equals(name))
                .findAny(); //찾으면 반환
    }

    @Override
    public List<Member> findAll() {
        return new ArrayList<>(store.values()); //member 가져오기
    }


    public void clearStore(){
        store.clear();
    }
}
