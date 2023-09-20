package JavaFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

@MultipartConfig
@WebServlet(name="UpdateProfile",urlPatterns= {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("aise");
		Connection con = null;
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		try
		{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edms" , "root","");
		}
		catch(SQLException e)
		{
			
			e.printStackTrace();
		}
		String Username=request.getParameter("Username");
		String Name=request.getParameter("Name");		
		String Cont=request.getParameter("Cont");
		String Password="";
		Password=request.getParameter("Password");
		if(Password.equals("")) {
			String sql="update registrationinfo set Name = ?, ContactNo = ? where Username=?";
			try {
				System.out.println("aise");
				System.out.println(Name);
				System.out.println(Cont);
				System.out.println(Username);
				PreparedStatement stmtp=con.prepareStatement(sql);
				stmtp.setString(1, Name);
				stmtp.setString(2, Cont);
				stmtp.setString(3, Username);
				int row= stmtp.executeUpdate();
				System.out.println("update"+row);
				stmtp.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			String sql="update registrationinfo set Name=?, ContactNo=?, Password=? where Username=?";
			try {
				PreparedStatement stmtp=con.prepareStatement(sql);
				stmtp.setString(1, Name);
				stmtp.setString(2, Cont);
				String hashedPassword = BCrypt.hashpw(Password, BCrypt.gensalt());
				stmtp.setString(3, hashedPassword);
				stmtp.setString(4, Username);
				stmtp.executeUpdate();
				stmtp.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect("Profile.jsp");
	}

}
