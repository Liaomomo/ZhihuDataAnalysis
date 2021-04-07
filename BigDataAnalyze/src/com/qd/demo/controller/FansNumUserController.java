package com.qd.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qd.demo.service.FansNumUserService;


@Controller
@RequestMapping("fans")
public class FansNumUserController {

	@Autowired
	private FansNumUserService fansNumUserService;
	
	
          
	//getMostFansNumUser
	@RequestMapping("/getMostFansNumUser_1")
	@ResponseBody
	public List<Map > getMostFansNumUser_1(){
		List<Map> list = fansNumUserService.getMostFansNumUser_1();
		
		//System.out.println(list);
		
		return list;
	}
	
	//getMostFansNumUser
		@RequestMapping("/getMostFansNumUser")
		@ResponseBody
		public List<Map > getMostFansNumUser(){
			List<Map> list = fansNumUserService.getMostFansNumUser();
			
			//System.out.println(list);
			
			return list;
		}

}
