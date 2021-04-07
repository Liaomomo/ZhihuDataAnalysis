package com.qd.demo.service.Impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qd.demo.service.UserService;
import com.qd.demo.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

		@Autowired
		private UserMapper userMapper;
		
		public List<Map> getAnswerQuestionNumUser() {
			// TODO Auto-generated method stub
			return userMapper.getAnswerQuestionNumUser();
		}

		public List<Map> getUserJobLocation() {
			// TODO Auto-generated method stub
			return userMapper.getUserJobLocation();
		}

		public List<Map> getDiePowderUser() {
			// TODO Auto-generated method stub
			return userMapper.getDiePowderUser();
		}

		public List<Map> getUserJobLocation2_2() {
			// TODO Auto-generated method stub
			return userMapper.getUserJobLocation2_2();
		}

		public List<Map> getUserlocationMap() {
			// TODO Auto-generated method stub
			return userMapper.getUserlocationMap();
		}

		public List<Map> getUserInfo(String username) {
			// TODO Auto-generated method stub
			return userMapper.getUserInfo(username);
		}

		@Override
		public List<Map> getUserJobLocation_1() {
			// TODO Auto-generated method stub
			return userMapper.getUserJobLocation_1();
		}
}
