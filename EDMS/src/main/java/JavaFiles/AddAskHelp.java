package JavaFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@MultipartConfig
@WebServlet(name="AddAskHelp",urlPatterns= {"/AddAskHelp"})
public class AddAskHelp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		HttpSession session=request.getSession(false);
		String loggedInUser = (String) session.getAttribute("loggedInUser");
		//System.out.println(loggedInUser);
	    String LocationUsername=request.getParameter("LocationUsername");
	    //System.out.println(LocationUsername);
		String Description = request.getParameter("Description");
		//System.out.println(Description);
		String ams=request.getParameter("help-am");
		//System.out.println(ams);
		int am=Integer.parseInt(ams);
		String afs=request.getParameter("help-af");
		int af=Integer.parseInt(afs);
		String acs=request.getParameter("help-ac");
		int ac=Integer.parseInt(acs);
		int tot=af+am+ac;
		
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
		
		Part part1=request.getPart("ImageName1");
		Part part2=request.getPart("ImageName2");
		String contentType1 = part1.getContentType();
		String contentType2 = part2.getContentType();
		 if (!(contentType1 != null && (contentType1.startsWith("image/jpeg") || contentType1.startsWith("image/png") || contentType1.startsWith("image/gif") || contentType1.startsWith("image/jpg") || contentType1.startsWith("image/svg") || contentType1.startsWith("image/webp")|| contentType1.startsWith("image/JPEG") || contentType1.startsWith("image/PNG") || contentType1.startsWith("image/GIF") || contentType1.startsWith("image/JPG") || contentType1.startsWith("image/SVG") || contentType1.startsWith("image/WEBP")))) {
			 	request.setAttribute("message", "Give a proper image ( Photo 1)");
			 	String goUrl="AddAskHelp.jsp?LocationUsernameFromLocationProfile="+LocationUsername;
			    request.getRequestDispatcher(goUrl).forward(request, response);
		    }
		 else if (!(contentType2 != null && (contentType2.startsWith("image/jpeg") || contentType2.startsWith("image/png") || contentType2.startsWith("image/gif") || contentType2.startsWith("image/jpg") || contentType2.startsWith("image/svg") || contentType2.startsWith("image/webp")|| contentType2.startsWith("image/JPEG") || contentType2.startsWith("image/PNG") || contentType2.startsWith("image/GIF") || contentType2.startsWith("image/JPG") || contentType2.startsWith("image/SVG") || contentType2.startsWith("image/WEBP")))) {
			 	request.setAttribute("message", "Give a proper image  ( Photo 2)");
			 	String goUrl="AddAskHelp.jsp?LocationUsernameFromLocationProfile="+LocationUsername;
			    request.getRequestDispatcher(goUrl).forward(request, response);
		    }
		 else {
		
		try {
			InputStream is1=part1.getInputStream();
			InputStream is2=part2.getInputStream();
			PreparedStatement ps=con.prepareStatement("insert into "+LocationUsername+"_askhelp(Description,Photo1,Photo2,LocationUsername,Total,Username,Date,Second)values(?,?,?,?,?,?,?,?)");
			ps.setString(1,Description);
			ps.setBlob(2, is1);
			ps.setBlob(3,is2);
			ps.setString(4, LocationUsername);
			ps.setInt(5, tot);
			ps.setString(6, loggedInUser);
			Date currentDate = new Date();
	        SimpleDateFormat dateFormat = new SimpleDateFormat("h:mma dd MMM, yyyy", Locale.ENGLISH);
	        String formattedDateTime = dateFormat.format(currentDate);
	        ps.setString(7, formattedDateTime);
	        Date date = dateFormat.parse(formattedDateTime);
            long secondsSinceEpoch = date.getTime() / 1000;
            ps.setLong(8, secondsSinceEpoch);
            ps.executeUpdate();
		}catch(Exception e) {
			
		}
	   }
		response.sendRedirect("Location_Profile.jsp?LocationUsernameFromShelterPage="+LocationUsername);
	}
	

}
