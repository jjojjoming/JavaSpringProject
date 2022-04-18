package kr.co.soft.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.soft.beans.UserBean;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return UserBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub

		UserBean userBean = (UserBean) target;

		// UserBean의 객체 중에서 유효성 검사를 할 객체만 사용하기 위한 name추출
		String beanname = errors.getObjectName();
		//System.out.println(beanname);

		// 에러 프로퍼티 이름 커스터마이징
		// 비번변경또는 회원가입시
		// 로그인시 정보수정시
		if (beanname.equals("joinUserBean") || beanname.equals("modifyUserBean")) {

			if (userBean.getUser_pw().equals(userBean.getUser_pw2()) == false) {
				errors.rejectValue("user_pw", "NotEquals");
				errors.rejectValue("user_pw2", "NotEquals");
			}

			// 회원가입시 에만
			if (beanname.equals("joinUserBean")) {
				if (userBean.isUserIdExist() == false) {
					errors.rejectValue("user_id", "DontCheckUserIdExist");
				}
			}
		}
	}
}
