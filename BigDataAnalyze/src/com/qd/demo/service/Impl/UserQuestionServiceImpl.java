package com.qd.demo.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qd.demo.service.UserQuestionService;
import com.qd.demo.mapper.UserQuestionMapper;

@Service
public class UserQuestionServiceImpl implements UserQuestionService {
	
	@Autowired
	private UserQuestionMapper userQuestionMapper;

	public List<Map> getUserQuestion() {
		// TODO Auto-generated method stub
		return userQuestionMapper.getUserQuestion();
	}

	public List<Map> getUserInterest() {
		// TODO Auto-generated method stub
		return userQuestionMapper.getUserInterest();
	}

}
