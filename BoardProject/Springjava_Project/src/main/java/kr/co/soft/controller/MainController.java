package kr.co.soft.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.soft.beans.BoardInfoBean;
import kr.co.soft.beans.ContentBean;
import kr.co.soft.service.BoardService;
import kr.co.soft.service.MainService;
import kr.co.soft.service.TopMenuService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private TopMenuService topMenuService;
	
	@GetMapping("/main")
	public String main(Model model) {
		//4개의 게시판 글 등록
		ArrayList<List<ContentBean>> list=new ArrayList<List<ContentBean>>();
		
		//1~4 자유, 유머, 스포츠 ,정치 게시판의 번호들
		for(int i=1;i<=4;i++) {
			List<ContentBean> list1=mainService.getMainList(i);
			list.add(list1);
		}
		
		model.addAttribute("list",list);
		
		
		List<BoardInfoBean> board_list =topMenuService.getTopMenuList();
		model.addAttribute("board_list",board_list);
		return "main";
	}

}
