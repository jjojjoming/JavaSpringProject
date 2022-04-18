package kr.co.soft.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soft.beans.UserBean;
import kr.co.soft.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	//세션에 담아둠
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	public boolean checkUserIdExist(String user_id) {

		String user_name = userDao.checkUserIdExist(user_id);

		if (user_name == null) {
			return true;
		} else {
			return false;
		}
	}

	public void addUserInfo(UserBean joUserBean) {
		userDao.addUserInfo(joUserBean);
	}

	public void getLoginUserInfo(UserBean tempLoginUserBean) {

		UserBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);
		
		if(tempLoginUserBean2 != null) {
			loginUserBean.setUser_idx(tempLoginUserBean2.getUser_idx());
			loginUserBean.setUser_name(tempLoginUserBean2.getUser_name());
			loginUserBean.setUserLogin(true); //로그인 된 상태
		}
			
	}
	
	public void getModifyUserInfo(UserBean modifyUserInfo) {
		//수정처리를 위한 유저 빈
		UserBean tempModifyUserBean=userDao.getModifyUserInfo(loginUserBean.getUser_idx());
		//modifyUserInfo에 현제 로그인한 아이디 담음
		modifyUserInfo.setUser_id(tempModifyUserBean.getUser_id());
		modifyUserInfo.setUser_name(tempModifyUserBean.getUser_name());
		//tempModifyUserBean는 아이디와 이름만 가지고있어서 loginUserBean 의 idx를 가져옴
		modifyUserInfo.setUser_idx(loginUserBean.getUser_idx());
		
	}
	
	public void modifyUserInfo(UserBean modifyUserBean) {
		
		//로그인한 인덱스 번호
		modifyUserBean.setUser_idx(loginUserBean.getUser_idx());
		
		userDao.modifyUserInfo(modifyUserBean);
	}

}
