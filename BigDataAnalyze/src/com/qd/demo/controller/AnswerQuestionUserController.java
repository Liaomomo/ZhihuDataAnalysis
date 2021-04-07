package com.qd.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qd.demo.service.UserService;
@Controller
@RequestMapping("user")
public class AnswerQuestionUserController {
	
	@Autowired
	private UserService userService;
	
	//知乎回答问题最多的100位用户数据
	@RequestMapping("/getAnswerQuestionNumUser")
	@ResponseBody
	public List<Map > chart_1_data(){
		
		 //System.out.println(userService.getAnswerQuestionNumUser());
		 return userService.getAnswerQuestionNumUser();
	}
	

	
	//知乎用户职业分布  
	@RequestMapping("/getUserJobLocation")
	@ResponseBody
	public List<Map > getUserJobLocation(){
		
		return userService.getUserJobLocation();
	}
	
	//知乎用户职业分布  
	@RequestMapping("/getUserJobLocation_1")
	@ResponseBody
	public List<Map > getUserJobLocation_1(){
		
		return userService.getUserJobLocation_1();
	}
	
	//知乎用户职业分布  
		@RequestMapping("/getUserJobLocation2_2")
		@ResponseBody
		public List<Map> getUserJobLocation2_2(){
			System.out.println(userService.getUserJobLocation2_2());
			
			return userService.getUserJobLocation2_2();
		}
	
		//知乎用户的地区分布
		@RequestMapping("/getUserlocationMap")
		@ResponseBody
		public List<Map >getUserlocationMap(){
						
			return userService.getUserlocationMap();
		}
	

	
	
	//知乎僵尸粉统计功能 数据  getDiePowderUser
	@RequestMapping("/getDiePowderUser")
	@ResponseBody
	public List<Map > getDiePowderUser(){
				
			return userService.getDiePowderUser();
	}
	
	@RequestMapping("/getUserInfo")
	@ResponseBody
	public List getUserInfo(String username){
		  
			List list = userService.getUserInfo(username);
			/*System.out.print(list);
			ModelAndView model = new ModelAndView("../yonghu.jsp");
			model.addObject("list", list);
			if(list.isEmpty()){
				return null;
			}*/
			
			return list;
	}


}
