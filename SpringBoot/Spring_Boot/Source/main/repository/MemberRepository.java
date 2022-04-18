package spring.boot.repository;

import org.springframework.stereotype.Repository;
import spring.boot.domain.Member;

import java.util.List;
import java.util.Optional;


public interface MemberRepository {

    Member save(Member member);
    Optional<Member> findById(Long id); //시스템이 해당아이디를 검색할때 사용
    Optional<Member> findByName(String name); //user 입력
    List<Member> findAll();

}