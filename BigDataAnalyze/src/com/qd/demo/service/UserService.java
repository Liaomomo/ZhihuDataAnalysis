package com.qd.demo.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface UserService {
	
	public List<Map> getAnswerQuestionNumUser();

	public List<Map> getUserJobLocation();
	
	public List<Map> getUserJobLocation2_2();


	public List<Map> getDiePowderUser();

	public List<Map> getUserlocationMap();
	
	public List<Map> getUserInfo(String username);

	public List<Map> getUserJobLocation_1();
	
	


}
