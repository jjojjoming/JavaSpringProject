package spring.boot.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import spring.boot.domain.Member;

import java.util.Optional;

public interface SpringDataJpaMemberRepository extends JpaRepository<Member, Long>, MemberRepository {

    Optional<Member> findByName(String name); //별도로 구현


}
