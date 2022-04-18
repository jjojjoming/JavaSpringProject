package spring.boot.repository;


import spring.boot.domain.Member;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Optional;

//JPA(Java Persistence API) : ORM(Object Relational Mapping)방식으로 작동한다.


public class JpaMemberRepository implements MemberRepository{
    // jpa는  Entity로만 작동을 하는데 Entity는 EntityManager가 구동을 시켜줌
    // 그래서 jpa를 사용하려면 EntityManager는 필수 주입이 되어 있어야 한다
    // EntityManager의 주된 역할은 특정 작업을 데이터베이스에 액세스하는 역할을 한다
    private final EntityManager em;

    public JpaMemberRepository(EntityManager em) {
        this.em = em;
    }

    //저장
    @Override
    public Member save(Member member) {
       em.persist(member);
       return member;
    }

    @Override
    public Optional<Member> findById(Long id) {
        Member member = em.find(Member.class, id);
        return Optional.ofNullable(member);
    }

    @Override
    public Optional<Member> findByName(String name) {
        List<Member> result = em.createQuery("select m from Member m where m.name= :name", Member.class) //동적쿼리
                .setParameter("name", name)
                .getResultList();
        return result.stream().findAny();

    }

    @Override
    public List<Member> findAll() {
        return em.createQuery("select m from Member m", Member.class).getResultList(); //동적쿼리
    }
}
