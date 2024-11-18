package com.org.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.org.Dao.UserDao;
import com.org.Entity.User;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ControllerClass {
	UserDao dao = new UserDao();
	
	@RequestMapping("/")
	public String initialPage() {
		return "loginandregister.jsp";
	}
	
	@PostMapping("/register")
	public String registerUser(User u, HttpSession session) {
		dao.saveAndUpdateUser(u);
		session.setAttribute("registered", "registered");
		return "loginandregister.jsp";
	}
	
	@PostMapping("/login")
	public String loginUser(ServletRequest req, HttpSession session) {
		User user = dao.loginUser(req.getParameter("email"), req.getParameter("password"));
		if(user!=null) {
			session.setAttribute("user", user);
			return "profile.jsp";
		}
		else {
			session.setAttribute("lgnFailed", "loginFailed");
			return "loginandregister.jsp";
		}
	}
	
	@PostMapping("/update")
	public String updateUser(User u) {
		dao.saveAndUpdateUser(u);
		return "profile.jsp";
	}
	
	@GetMapping("/logout")
	public String userLogout(HttpSession hs) {
		hs.removeAttribute("user");
		hs.removeAttribute("loginFailed");
		hs.removeAttribute("registered");
		return "loginandregister.jsp";
	}
}
