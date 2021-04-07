package com.qd.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface UserQuestionMapper {

	List<Map> getUserQuestion();

	List<Map> getUserInterest();

}
