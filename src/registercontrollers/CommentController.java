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

import dao.CommentDAO;
import dao.DoctorDAO;
import classes.Comment;
import classes.Doctor;

@WebServlet("/CommentController")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentController() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//set encoding to utf-8
		request.setCharacterEncoding("UTF-8");

		//reading parameters from request
		String dID = request.getParameter("dID");
		String mID = request.getParameter("mID");
		String comment_text = request.getParameter("comment_text");
  		String comment_date = new java.sql.Date(System.currentTimeMillis()).toString();
  		String comment_rating = "3";
			
		RequestDispatcher rd = request.getRequestDispatcher("/mydocmain.jsp");
			
						
			Comment comment = new Comment( comment_rating, comment_date, dID, mID, comment_text);
			
			CommentDAO cdao = new CommentDAO();

			try {
				cdao.saveComment(comment);
			} catch (Exception e) {
				request.setAttribute("errormessage", e.getMessage());
				
				rd.forward(request, response);	
			} 

			request.setAttribute("message", "Comment placed successfully!");

			rd.forward(request, response);


	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
}

