


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

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String author = request.getParameter("author");


		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/library"; //MySQL URL and followed by the database name
 		String username = "root"; //MySQL username
 		String password = "MyPassword@123"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);

		//Prepared Statement to add student data
 		PreparedStatement check = con .prepareStatement("select book_id from book where book_id=?");
 		check.setInt(1, id);
 		ResultSet rs= check.executeQuery();
 		if(rs.isBeforeFirst()) {
 			RequestDispatcher rd = request.getRequestDispatcher("BookExists.jsp");
			rd.forward(request, response);
 		}
 		
		PreparedStatement st = con .prepareStatement("insert into book values(?, ?, ?, ?)");
 		st.setInt(1, id);
		st.setString(2, title);
		st.setString(3, category);
		st.setString(4, author);
		int result=st.executeUpdate();

		//Checks if insert is successful.If yes,then redirects to Result.jsp page 
		if(result>0)
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("AddResult.jsp");
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


