package registercontrollers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.Member;
import dao.MemberDAO;

/**
 * Servlet implementation class RegistrationMemberController
 */
@WebServlet("/MemberSignUp")
public class RegistrationMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationMemberController() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    		//set encoding to utf-8
  		request.setCharacterEncoding("UTF-8");

  		//reading parameters from request
  		String mUsername = request.getParameter("member_username");
  		String mPassword = request.getParameter("mpassword");
  		String mEmail = request.getParameter("member_email");
  		String mName = request.getParameter("member_name");
  		String mSurname = request.getParameter("member_surname");
  		String mPhone = request.getParameter("member_phone");
  		String mGender = request.getParameter("member_gender");
  		String mRegion = request.getParameter("member_region");
  		String mYear = request.getParameter("member_year");
  		String mMonth = request.getParameter("member_month");
  		String mDay = request.getParameter("member_day");
  		String mJoin = new java.sql.Date(System.currentTimeMillis()).toString();
  		
  		StringBuilder sb= new StringBuilder();
  		sb.append(mYear);
  		sb.append("-");
  		sb.append(mMonth);
  		sb.append("-");
  		sb.append(mDay);
  		String dob=sb.toString();
  		//PrintWriter writer = response.getWriter();
  		
  		RequestDispatcher rd = request.getRequestDispatcher("/mydocmain.jsp");
  		
  		try {

			if(mUsername == null || mUsername.length() < 2 || mPassword == null || mPassword.length() < 3
					|| mEmail == null || mEmail.length() < 3) {
			
				request.setAttribute("errormessage", "Please fill the fields");
				
				rd.forward(request, response);
				return;
			}
			
			Member member = new Member(mUsername,mPassword,mEmail,mName,mSurname,mPhone,mGender,mRegion,dob,mJoin);
			MemberDAO mdao = new MemberDAO();
			mdao.saveMember(member);
			request.setAttribute("message", "Registration completed successfully!");

			rd.forward(request, response);
			return;

		} catch (Exception e) {
			request.setAttribute("errormessage", e.getMessage());
			
			rd.forward(request, response);	
		
		}
	}
		    protected void doGet(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		    		doPost(request, response);
	}
			
   }

