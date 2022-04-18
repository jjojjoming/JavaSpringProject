package spring.boot.service;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import spring.boot.domain.Member;
import spring.boot.repository.MemberRepository;
import spring.boot.repository.MemoryMemberRepository;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

class MemberServiceTest {

    MemberService memberService;
    MemoryMemberRepository memberRepository;

    //DI
    //테스트가 수행되기 전에 각각의 테스트에 영향이 없도록 새로운 객체를 생성하고 의존관게도 새로 맺어준다
    @BeforeEach
    public void beforeEach(){
        memberRepository= new MemoryMemberRepository(); //객체가 만들어 지고
        memberService = new MemberService(memberRepository); //만들어진 객체가 매갭변수
    }
    //테스트 후 메모리 비우기
    @AfterEach
    public void afterEach() {
        memberRepository.clearStore();
    }

    @Test
    public void 회원가입() throws  Exception{
        //Given
        Member member = new Member();
        member.setName("soldesk");
        //when
        Long saveId = memberService.join(member); //test
        //then 결과
        Member findMember = memberRepository.findById(saveId).get();
        assertEquals(member.getName(), findMember.getName());
    }

    @Test
    public void 중복_회원_예외() throws  Exception{
        //Given
        Member member1 = new Member();
        member1.setName("soldesk1");
        Member member2 = new Member();
        member2.setName("soldesk1");
        //when
        memberService.join(member1);//soldesk1 가입
        //then
        /*try {
            memberService.join(member2);
            fail(); //예외발생
            //IllegalStateException: 부적절... 부정
        }catch (IllegalStateException e){
            assertThat(e.getMessage()).isEqualTo("이미 존재하는 회원입니다");
        }*/
        IllegalStateException e=assertThrows(IllegalStateException.class, () -> memberService.join(member2)); //예외가 발생하면
        assertThat(e.getMessage()).isEqualTo("이미 존재하는 회원입니다");

    }


}