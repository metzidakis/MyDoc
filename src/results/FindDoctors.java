package results;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DoctorDAO;
import classes.Doctor;

/**
 * Servlet implementation class FindStudentController
 */
@WebServlet("/searchdoctors")
public class FindDoctors extends HttpServlet {
	
	//serial version ID locked in the class
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindDoctors() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//set request encoding at utf-8
		request.setCharacterEncoding("UTF-8");
		
		//get request parameters
		String keyword = request.getParameter("keyword");
		String specialty = request.getParameter("specialty");
		String location = request.getParameter("location");
		
		//set destination for response
		RequestDispatcher rd = request.getRequestDispatcher("searchlist.jsp");
		
		// create instance of DoctorDAO
		DoctorDAO ddao = new DoctorDAO();

		ArrayList<Doctor> reslist = null;
	
		try {
						
			reslist = ddao.findDoctorByKeywordAndLocationAndSpecialty(keyword,specialty,location);
			
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
