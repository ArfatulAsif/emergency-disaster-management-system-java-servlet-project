package JavaFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.mindrot.jbcrypt.BCrypt;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


@MultipartConfig
@WebServlet(name="Registration",urlPatterns= {"/Registration"})
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       PrintWriter out;
    /**
     * @see HttpServlet#HttpServlet()
     */
    
       
       
      
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		//System.out.println("Entered into Registration.java");
		
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
		
		
		String Name = request.getParameter("Name");
		String Username = request.getParameter("Username");
		String Email = request.getParameter("Email");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		Statement stmtm;
		String selectedUnion= request.getParameter("selectedUnion");
		
		
		
		
//		try {
//			stmtm=con.createStatement();
//			ResultSet rss=stmtm.executeQuery("select * from setloc");
//			
//			while(rss.next()) {
//				selectedUnion=rss.getString("Location");
//			}
//		}catch(Exception e) {
//			
//		}
		
		String TypeSelect = request.getParameter("TypeSelect");
		
		String ContactNo = request.getParameter("ContactNo");
		//String ImageName = request.getParameter("ImageName");
		String Description = request.getParameter("Description");
		
		String query1 = "SELECT * FROM registrationinfo WHERE Username = '"+Username+"'";
		
		int CheckDublication = 0;
		
		Statement stmt;
		try 
		{
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query1);
			
			while(rs.next())
			{
				CheckDublication++;
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		if(CheckDublication>0)
		{
			
		    request.setAttribute("message", "Username Already Exists");
		    request.getRequestDispatcher("Registration.jsp").forward(request, response);
		    
		}
		else if(!password1.equals(password2))
		{
			
		    request.setAttribute("message", "Password and Re-Password doesn't match");
		    request.getRequestDispatcher("Registration.jsp").forward(request, response);
		    
		}
		else {
		response.setContentType("text/html;charset=UTF-8");
		out=response.getWriter();
		int res=0;
		Part part=request.getPart("ImageName");
		
		String contentType1 = part.getContentType();
		 if (!(contentType1 != null && (contentType1.startsWith("image/jpeg") || contentType1.startsWith("image/png") || contentType1.startsWith("image/gif") || contentType1.startsWith("image/jpg") || contentType1.startsWith("image/svg") || contentType1.startsWith("image/webp")|| contentType1.startsWith("image/JPEG") || contentType1.startsWith("image/PNG") || contentType1.startsWith("image/GIF") || contentType1.startsWith("image/JPG") || contentType1.startsWith("image/SVG") || contentType1.startsWith("image/WEBP")))) {
			 	request.setAttribute("message", "Give a proper image");
			    request.getRequestDispatcher("Registration.jsp").forward(request, response);
		    } else {
		    	
		    
		
		if(part!=null) {
			try {
				PreparedStatement ps=con.prepareStatement("insert into registrationinfo(Image,Name,Username,Password,Type,ContactNo,Email,Description,Location)values(?,?,?,?,?,?,?,?,?)");
				
				InputStream is=part.getInputStream();
				
				ps.setBlob(1, is);
				ps.setString(2, Name);
				ps.setString(3, Username);
				String hashedPassword = BCrypt.hashpw(password1, BCrypt.gensalt());
				ps.setString(4, hashedPassword);
				ps.setString(5, TypeSelect);
				ps.setString(6, ContactNo);
				ps.setString(7, Email);
				ps.setString(8, Description);
				ps.setString(9, selectedUnion);
				
				res=ps.executeUpdate();
				PreparedStatement ps1=con.prepareStatement("create table "+Username+"_post(Description text,Photo1 longblob,Photo2 longblob,Location text,Affected int,Date text,Second bigint);");
				ps1.executeUpdate();
				ps1=con.prepareStatement("create table "+Username+"_location(LocationUsername text,Name text,Type text,Description text,Photo1 longblob,Photo2 longblob,Location text,Location_URL text,Affected_Male int,Affected_Female int,Affected_Children int,Affected_Total int,ContactNo text,Activity text,Date text,Second bigint);");
				ps1.executeUpdate();
				
				if(res>0) {
					response.sendRedirect("Login.jsp");
				}
				else {
					response.sendRedirect("Registration.jsp?message=Some+Error+Occured");
				}
			}catch(SQLException e) {
				System.out.println("Add image a dhora");
				e.printStackTrace();
			}
			
		   }
		}
	  }
	}

}
