package kr.co.soft.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.soft.beans.ContentBean;
import kr.co.soft.beans.PageBean;
import kr.co.soft.beans.UserBean;
import kr.co.soft.dao.BoardDao;
import kr.co.soft.mapper.BoardMapper;




@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class BoardService {
	
	@Value("${path.upload}")
	private String path_upload;
	//게시판 글 번호 10개씩
	@Value("${page.listcnt}")
	private int page_listcnt;
	//게시판 버튼 10개씩
	@Value("${page.paginationcnt}")
	private int paginationcnt;
	
	
	@Autowired
	private BoardDao boardDao;
	
	//세션에 달린 loginUserBean 가져옴
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	
	private String saveUploadFile(MultipartFile upload_file) {
		
		//현재시간과 오리지널 파일name							//getOriginalFilename:이미지나 동영상파일
		//String file_name=System.currentTimeMillis()+"_"+upload_file.getOriginalFilename();
	//	String file_name=System.currentTimeMillis()+"_"+upload_file.getName();
		
		//첨부파일 받기위한 코드(시간단위 ms여서 동일파일이름이여도 상관없음)
		String file_name = System.currentTimeMillis() + "_" +  
				FilenameUtils.getBaseName(upload_file.getOriginalFilename()) + "." + 
						FilenameUtils.getExtension(upload_file.getOriginalFilename());
		
		try {
			//경로와 파일네임
			upload_file.transferTo(new File(path_upload+"/"+file_name));// /는 \properties option 에 경로 마지막에 /가 없어서 넣어줌
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	//==============================파일 업로드
	
	public void addContentInfo(ContentBean writeContentBean) {
		MultipartFile upload_file=writeContentBean.getUpload_file();
		
		
		
		if(upload_file.getSize()>0) {
			
			String file_name =saveUploadFile(upload_file);
			System.out.println(file_name);
			
			//오라클에 저장될 파일이름으로 활용하는 코드
			writeContentBean.setContent_file(file_name);
		}
		writeContentBean.setContent_writer_idx(loginUserBean.getUser_idx());
		
		boardDao.addContentInfo(writeContentBean);
	}
	
	public String getBoardInfoName(int board_info_idx) {
		return boardDao.getBoardInfoName(board_info_idx);
	}
	
	public List<ContentBean> getContentList(int board_info_idx,int page) {
		
		/* 1페이지 0~9, 2페이지 10~19 */
		//start 글번호 (0,10,20)
		int start=(page-1)*page_listcnt;
		//행을 끈어줌(10개씩)
		RowBounds rowBounds=new RowBounds(start,page_listcnt);
		
		return boardDao.getContentList(board_info_idx,rowBounds);
	}
	
	public ContentBean getContentInfo(int content_idx) {
		return boardDao.getContentInfo(content_idx);
	}
	
	public void modifyContentInfo(ContentBean modifyContentBean) {
		
		MultipartFile upload_file = modifyContentBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			modifyContentBean.setContent_file(file_name);
		}
		
		boardDao.modifyContentInfo(modifyContentBean);
	}
	
	public void deleteContentInfo(int content_idx) {
		boardDao.deleteContentInfo(content_idx);
	}
	
	 public PageBean getContentCnt(int content_board_idx, int currentPage) {
		 
		 //전체글의 갯수
		int current_cnt= boardDao.getContentCnt(content_board_idx);
		
		//실 매개변수 중비
		PageBean pageBean=new PageBean(current_cnt, currentPage, page_listcnt, paginationcnt);
		return pageBean;
	}
}
	
	
	
