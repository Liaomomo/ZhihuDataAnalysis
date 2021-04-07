package com.qd.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qd.demo.service.UserQuestionService;

@Controller
@RequestMapping("userQuestion")
public class UserQuestionController {
	
	@Autowired
	private UserQuestionService userQuestionService;

	
	//知乎问题导向功能 数据 
	@RequestMapping("/getUserQuestion")
	@ResponseBody
	public List<Map > getUserQuestion(){
			
			return userQuestionService.getUserQuestion();
	}
	

	
	//用户兴趣画像功能  getUserInterest 
	@RequestMapping("/getUserInterest")
	@ResponseBody
	public List<Map > getUserInterest(){
						
		return userQuestionService.getUserInterest();
	}
	

}
