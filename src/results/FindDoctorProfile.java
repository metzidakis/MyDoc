package results;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.Doctor;
import dao.DoctorDAO;

/**
 * Servlet implementation class FindDoctorProfile
 */
@WebServlet("/FindDoctorProfile")
public class FindDoctorProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindDoctorProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//set request encoding at utf-8
		request.setCharacterEncoding("UTF-8");
		
		//get request parameters
		String doctor_id = request.getParameter("id");

		//set destination for response
		RequestDispatcher rd = request.getRequestDispatcher("doctorprofile.jsp");
		
		// create instance of DoctorDAO
		DoctorDAO ddao = new DoctorDAO();

	
		try {
						
			reslist = ddao.(id);
			
			request.setAttribute("doctors-results", reslist);
			
			rd.forward(request, response);
			return;			
			
		} catch (Exception e) {
			throw new ServletException(e.getMessage());
		}
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
