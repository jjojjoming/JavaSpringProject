package spring.boot.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import spring.boot.domain.Member;


import javax.sql.DataSource;
import javax.swing.tree.TreePath;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class JdbcTemplateMemberRepository implements MemberRepository{
    //JdbcTemplate : connection /prepareStatement
    private final JdbcTemplate jdbcTemplate;

    //@Autowired //생성자가 하나일 경우 @Autowired생략가능
    public JdbcTemplateMemberRepository(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public Member save(Member member) {
        //connection -> insert into
        SimpleJdbcInsert jdbcInsert=new SimpleJdbcInsert(jdbcTemplate);
        jdbcInsert.withTableName("member").usingGeneratedKeyColumns("id"); //usingGeneratedKeyColumns : 시퀀스값 적용
        Map<String, Object> parameters=new HashMap<>();
        parameters.put("name", member.getName());
        //SimpleJdbcInsert : primary key 설정 문번
        //jdbcInsert.executeAndReturnKey(Map).longValue();
        Number key = jdbcInsert.executeAndReturnKey(new
                MapSqlParameterSource(parameters));
        member.setId(key.longValue());

        return member;
    }

    @Override
    public Optional<Member> findById(Long id) {
        List<Member> result=jdbcTemplate.query("select * from member where id=?" , memberRowMapper(), id);
        return result.stream().findAny(); //결과값중 findAny()통해서 하나만 추출후 리턴
    }

    @Override
    public Optional<Member> findByName(String name) {
        List<Member> result=jdbcTemplate.query("select * from member where name=?" , memberRowMapper(), name);
        return result.stream().findAny(); //결과값중 findAny()통해서 하나만 추출후 리턴
    }

    @Override
    public List<Member> findAll() {
        return jdbcTemplate.query("select * from member", memberRowMapper());
    }

    //ResultSet
    private RowMapper<Member> memberRowMapper(){
        /*
        return  new RowMapper<Member>(){
            @Override
            public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
               Member member=new Member();
               member.setId(rs.getLong("id"));
               member.setName(rs.getString("name"));
               return member;
            }*/
            // 실무코딩 : 람다식으로 변경해서 사용-> RowMapper<Member>() -> 커서 위치시키고 alt+enter
            return (rs, rowNum) -> {
                Member member=new Member();
                member.setId(rs.getLong("id"));
                member.setName(rs.getString("name"));
                return member;
            };
    }


}
