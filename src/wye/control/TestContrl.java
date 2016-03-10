package wye.control;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wye.service.TestService;

@Controller("testContrl")
public class TestContrl {
	@Resource
	@Autowired
	public TestService testService;
	@RequestMapping ( "/showView" )  
	public ModelAndView show(){
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>>  list = testService.queryUser(null);
		Map<String, Object> map = list.get(0);
		mv.setViewName("user");
		mv.addObject("userinfo", map);
		return mv;
	}
}
