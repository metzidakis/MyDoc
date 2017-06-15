package registercontrollers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationControl
 */
	@WebServlet("/SignUp")
public class RegistrationControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//set encoding to utf-8
				request.setCharacterEncoding("UTF-8");

				//reading parameters from request
				String registrationtype = request.getParameter("registrationtype");
				
				if (registrationtype.equals("Doctor")){
				RequestDispatcher rd = request.getRequestDispatcher("/doctorregister.jsp");
				rd.forward(request, response);
			 }else{
				RequestDispatcher rd = request.getRequestDispatcher("/memberregister.jsp");
				rd.forward(request, response);
			 }
	}

}
