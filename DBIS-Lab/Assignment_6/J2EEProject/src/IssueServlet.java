


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/IssueServlet")
public class IssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public IssueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		int s_id = Integer.parseInt(request.getParameter("s_id"));
		int b_id = Integer.parseInt(request.getParameter("b_id"));
		String issue_date= request.getParameter("issue_date");
		String return_date = request.getParameter("return_date");
		
		if(return_date=="") {
			return_date = null;
		}

		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/library"; //MySQL URL and followed by the database name
 		String username = "root"; //MySQL username
 		String password = "MyPassword@123"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);
 		
 		PreparedStatement check_book = con .prepareStatement("select book_id from book where book_id=?");
 		check_book.setInt(1, b_id);
 		ResultSet rs_b= check_book.executeQuery();
 		if(!rs_b.isBeforeFirst()) {
 			RequestDispatcher rd = request.getRequestDispatcher("NoBook.jsp");
			rd.forward(request, response);
 		}
 		
 		PreparedStatement check_student = con .prepareStatement("select student_id from student where student_id=?");
 		check_student.setInt(1, s_id);
 		ResultSet rs= check_student.executeQuery();
 		if(!rs.isBeforeFirst()) {
 			RequestDispatcher rd = request.getRequestDispatcher("NoStudent.jsp");
			rd.forward(request, response);
 		}
 		
		//Prepared Statement to add student data
		PreparedStatement st = con .prepareStatement("insert into issue values(?, ?, ?, ?)");
 		st.setInt(1, s_id);
		st.setInt(2, b_id);
		st.setString(3, issue_date);
		st.setString(4, return_date);
		int result=st.executeUpdate();

		//Checks if insert is successful.If yes,then redirects to Result.jsp page 
		if(result>0)
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("IssueResult.jsp");
			rd.forward(request, response);
		}

		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 			RequestDispatcher rd = request.getRequestDispatcher("SQLError.jsp");
			rd.forward(request, response);
 		}

	
	}


}


