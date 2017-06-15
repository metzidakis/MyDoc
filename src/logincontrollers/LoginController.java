package logincontrollers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Doctor;
import classes.Member;
import dao.DoctorDAO;
import dao.MemberDAO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	
    	
        request.setCharacterEncoding("UTF-8");
        
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String loginType = request.getParameter("loginType");
        
        HttpSession session = request.getSession(true); 
        
        //set destination for response
        RequestDispatcher rd = request.getRequestDispatcher("mydocmain.jsp");
        
        
        if (loginType.equals("Doctor")){
        
        
	        DoctorDAO ddao = new DoctorDAO();
	        Doctor result = null;
        
	        try {
	            result = ddao.authenticateDoctor(username,password);
	            session.setAttribute("loggedinas","doctor");
	            session.setAttribute("doctor",result);
	        } catch (Exception e) {
	            
	            request.setAttribute("message", "<b>Error</b><br>" + e.getMessage());
	            
	            rd.forward(request, response);
	            return;    
	        }
        
	        request.setAttribute("verifyDoc", result);
	        
	        rd.forward(request, response);
	        return;
	        
        } else if (loginType.equals("Member")) {
        	
        	MemberDAO mdao = new MemberDAO();
        	Member result = null;
        
	        try {
	            result = mdao.authenticateMember(username,password);
	            session.setAttribute("loggedinas","member");
	            session.setAttribute("member",result);
	        } catch (Exception e) {
	            
	            request.setAttribute("message", "<b>Error</b><br>" + e.getMessage());
	            
	            rd.forward(request, response);
	            return;    
	        }
        
	        request.setAttribute("verifyMem", result);
	        
	        rd.forward(request, response);
	        return;
        	
        }
    }
}