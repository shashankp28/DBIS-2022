package jdbc_demo;
import java.sql.*;
public class Driver {
	public static void main(String[] args) {
	try {
	//Get connection
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/university","root","MyPassword@123");
			Statement myS=myConn.createStatement();
			//Query
			ResultSet resultSet = myS.executeQuery("SELECT * FROM student");
			//Display
			while(resultSet.next()) {
				System.out.println(resultSet.getString("ID")+" "+resultSet.getString("name"));
			}
			System.out.println("");
			listDepartments(myS);
			
			String query2 = """
								select distinct class.room_number 
								from classroom class natural join section sec 
								where capacity>30 and class.room_number NOT IN 
								(select room.room_number from classroom room 
								natural join section sect 
								where capacity>30 and sect.semester=? and sect.year=?);
							""";
			PreparedStatement myP= myConn.prepareStatement(query2);
			System.out.println("");
			listDepartments(myP);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	static void listDepartments(Statement stmt)
	{
		try {
				//Query
				String query = """
								WITH S_count(dname, s_count) AS
									(SELECT S.dept_name, count(*)
									FROM student S
									GROUP BY S.dept_name),
								I_count(dname, i_count) AS
									(SELECT I.dept_name, count(*)
									FROM instructor I
									GROUP BY I.dept_name)
								SELECT *
								FROM I_count LEFT OUTER JOIN S_count
								ON I_count.dname=S_count.dname
								UNION
								SELECT *
								FROM I_count RIGHT OUTER JOIN S_count
								ON I_count.dname=S_count.dname
								""";
				ResultSet resultSet = stmt.executeQuery(query);
				//Display
				System.out.println("Department Student Instructor");
				while(resultSet.next()) {
					System.out.println(resultSet.getString("dname")+" "+resultSet.getInt("s_count")+" "+resultSet.getInt("i_count"));
				}
				}catch(Exception e) {
					e.printStackTrace();
			}
		return;
	}
	static void listDepartments(PreparedStatement stmt)
	{
		// Write the code for Q3
		try {
			stmt.setString(1, "Fall");
			stmt.setInt(2, 2009);
			ResultSet resultSet = stmt.executeQuery();
			//Display
			System.out.println("Room_Number");
			while(resultSet.next()) {
				System.out.println(resultSet.getString("room_number"));
			}
		}catch(Exception e) {
		e.printStackTrace();
}
	}
}
