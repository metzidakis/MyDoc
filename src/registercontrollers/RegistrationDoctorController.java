package registercontrollers;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DoctorDAO;
import classes.Doctor;

@WebServlet("/DoctorSignUp")
public class RegistrationDoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistrationDoctorController() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//set encoding to utf-8
		request.setCharacterEncoding("UTF-8");

		//reading parameters from request
		String dname = request.getParameter("doctor_name");
		String dsurname = request.getParameter("doctor_surname");
		String dspeciality = request.getParameter("doctor_speciality");
		String daddress = request.getParameter("doctor_address");
		String dregion = request.getParameter("doctor_region");
		String dphone = request.getParameter("doctor_phone");
		String demail = request.getParameter("doctor_email");
		String dgender = request.getParameter("doctor_gender");
		String dusername = request.getParameter("doctor_username");
		String dpassword = request.getParameter("doctor_password");
		String mYear = request.getParameter("doctor_year");
  		String mMonth = request.getParameter("doctor_month");
  		String mDay = request.getParameter("doctor_day");
  		String mJoin = new java.sql.Date(System.currentTimeMillis()).toString();
		
		StringBuilder sb= new StringBuilder();
  		sb.append(mYear);
  		sb.append("-");
  		sb.append(mMonth);
  		sb.append("-");
  		sb.append(mDay);
  		String dob=sb.toString();
  		//PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession(true); 
			
		RequestDispatcher rd = request.getRequestDispatcher("/mydocmain.jsp");
		//writer.println(dob);
		request.setAttribute("dob", dob);
			
		try {

			if(dusername == null || dusername.length() < 2 || dpassword == null || dpassword.length() < 3
					|| dspeciality == null || dspeciality.length() < 2) {
			
				request.setAttribute("errormessage", "Please fill the fields");
				
				rd.forward(request, response);
				return;
			}
						
			Doctor doctor = new Doctor(dusername, dpassword, demail, dname, dsurname, daddress, dspeciality, dregion, dgender,dob,mJoin);
			
			DoctorDAO ddao = new DoctorDAO();

			ddao.saveDoctor(doctor); //store doctor to database

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
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
}

