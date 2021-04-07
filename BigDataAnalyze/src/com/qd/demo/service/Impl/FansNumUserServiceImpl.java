package com.qd.demo.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qd.demo.service.FansNumUserService;
import com.qd.demo.mapper.FansNumUserMapper;

@Service
public class FansNumUserServiceImpl implements FansNumUserService{
	
	@Autowired
	private FansNumUserMapper fansNumUserMapper;
	public List<Map> getMostFansNumUser() {
		// TODO Auto-generated method stub
		return fansNumUserMapper.getMostFansNumUser();
	}
	@Override
	public List<Map> getMostFansNumUser_1() {
		// TODO Auto-generated method stub
		return fansNumUserMapper.getMostFansNumUser_1();
	}
	
	

}
