package wye.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wye.dao.TestDao;
@Service("testService")
public class TestService {
	@Resource
	@Autowired
	public TestDao testDao;
	public List<Map<String,Object>> queryUser(String mobile){
		 List<Map<String,Object>> list = testDao.queryUser();
		return list;
	}
}
