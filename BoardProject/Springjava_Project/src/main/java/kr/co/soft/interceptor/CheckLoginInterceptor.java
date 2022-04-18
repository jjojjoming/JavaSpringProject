package kr.co.soft.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.soft.beans.ContentBean;
import kr.co.soft.beans.UserBean;
import kr.co.soft.service.BoardService;

public class CheckLoginInterceptor implements HandlerInterceptor{
	//로그인 여부를 판단
	private UserBean loginUserBean;
	
	public CheckLoginInterceptor(UserBean loginUserBean) {
		this.loginUserBean = loginUserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(loginUserBean.isUserLogin() == false) {
			//경로 읽어오기
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/user/not_login");
			return false;
		}
		//로그인이 되어 있는 상태
		return true;
	}
	
	

}
