package spring.boot.service;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;
import org.springframework.transaction.annotation.Transactional;
import spring.boot.domain.Member;
import spring.boot.repository.MemberRepository;
import spring.boot.repository.MemoryMemberRepository;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

//테스트케이스에서 @Transactional는 테스트시에 commit하고 테스트 후에는 rollback처리를 해준다
@SpringBootTest
@Transactional //db에 저장되지 않음
class MemberServiceIntegrationTest {

    @Autowired
    MemberService memberService;

    @Autowired
    MemberRepository memberRepository;

    @Test
    //@Commit //db에 자료를 저장하기 위해서는 commit처리가 필수
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
        IllegalStateException e=assertThrows(IllegalStateException.class, () -> memberService.join(member2)); //예외가 발생하면
        assertThat(e.getMessage()).isEqualTo("이미 존재하는 회원입니다");

    }


}