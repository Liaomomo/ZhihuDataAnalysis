package com.qd.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qd.demo.service.CollegeUserInfoService;
@Controller
@RequestMapping("student")
public class CollegeUserInfoController {
	
	@Autowired
	private CollegeUserInfoService collegeStudentsUserInfoService;

	//知乎的高校用户人数
	@RequestMapping("/getCollegeUserNum")
	@ResponseBody
	public List<Map > getCollegeUserNum(){
					
		return collegeStudentsUserInfoService.getCollegeUserNum();
	}

	
	//知乎的高校男女用户人数
	@RequestMapping("/getCollegeUserSexRatio")
	@ResponseBody
	public List<Map > getCollegeUserSexRatio(){
					
		return collegeStudentsUserInfoService.getCollegeUserSexRatio();
	}
	
	

}
