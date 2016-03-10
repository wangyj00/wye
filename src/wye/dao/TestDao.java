package wye.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
@Component("testDao")
public class TestDao {
@Resource
private JdbcTemplate jdbcSale;
public List<Map<String,Object>> queryUser(){
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	String sql = "SELECT * FROM TJSUNIUSERINFO T WHERE T.LOGINMOBILE='18410141590'";
	list = jdbcSale.queryForList(sql, new Object[]{});
	
	return list;
}
}
