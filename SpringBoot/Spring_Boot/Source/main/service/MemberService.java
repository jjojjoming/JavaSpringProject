package spring.boot.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.boot.domain.Member;
import spring.boot.repository.MemberRepository;

import java.util.List;
import java.util.Optional;

//JPA를 통한 모든 데이터 변경은 반드시 트랜젝션 안에서 실행되어야 한다
@Transactional
public class MemberService {

    private final MemberRepository memberRepository;
    
    //alt + insert
    public MemberService(MemberRepository memberRepository) { //DI식 주입
        this.memberRepository = memberRepository;
    }


    public Long join(Member member){
        //중복 회원 검증
        //Optional이 제공하는 .ifPresent()를 이용하여 null을 체크하는 if문 대신 간단하게 사용
        validateDuplicateMember(member); //ctrl+alt+m
        memberRepository.save(member);
        return member.getId();
    }


    private void validateDuplicateMember(Member member) {
        memberRepository.findByName(member.getName()).ifPresent(m-> {
            throw new IllegalStateException("이미 존재하는 회원입니다");
        });
    }
    
    //전체회원
    public List<Member> findMembers(){
        return memberRepository.findAll();
    }
    
    //상세정보
    public Optional<Member> findOne(Long memberId){
        return memberRepository.findById(memberId);
    }
    
}
