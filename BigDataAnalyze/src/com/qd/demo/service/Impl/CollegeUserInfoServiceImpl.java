package com.qd.demo.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qd.demo.service.CollegeUserInfoService;
import com.qd.demo.mapper.CollegeUserInfoMapper;
@Service
public class CollegeUserInfoServiceImpl implements CollegeUserInfoService {
	
	@Autowired
	private CollegeUserInfoMapper collegeUserInfoMapper;

	public List<Map> getCollegeUserNum() {
		// TODO Auto-generated method stub
		return collegeUserInfoMapper.getCollegeStudentsUserNum();
	}

	public List<Map> getCollegeUserSexRatio() {
		// TODO Auto-generated method stub
		return collegeUserInfoMapper.getCollegeUserSexRatio();
	}

}
