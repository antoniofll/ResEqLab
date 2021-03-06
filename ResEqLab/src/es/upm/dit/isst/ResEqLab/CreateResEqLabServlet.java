package es.upm.dit.isst.ResEqLab;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import es.upm.dit.isst.ResEqLab.dao.RecursosDAO;
import es.upm.dit.isst.ResEqLab.dao.RecursosDAOImpl;

public class CreateResEqLabServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		System.out.println("Creating new recurso ");
		User user = (User) req.getAttribute("user");
		if (user == null) {
			UserService userService = UserServiceFactory.getUserService();
			user = userService.getCurrentUser();
		}
		String title= checkNull(req.getParameter("title"));
		String Description = checkNull(req.getParameter("description"));
		
		RecursosDAO dao = RecursosDAOImpl.getInstance();
		dao.add(user.getNickname(),title, Description);
		resp.sendRedirect("/");
	}

	private String checkNull(String s) {
		if (s == null) {
			return "";
		}
		return s;
	}
}	