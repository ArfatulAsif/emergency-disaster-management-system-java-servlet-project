package JavaFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
/**
 * Servlet implementation class AddLocation
 */
@MultipartConfig
@WebServlet(name="AddLocation",urlPatterns= {"/AddLocation"})
public class AddLocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    PrintWriter out;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		HttpSession session=request.getSession(false);
		String loggedInUser = (String) session.getAttribute("loggedInUser");
	    if (loggedInUser == null) {
	        String currentURL = request.getRequestURI();
	        session.setAttribute("redirectURL", currentURL);
	        response.sendRedirect("Login.jsp");
	        return;
	    }
	    String LocationUser=loggedInUser+"_loc_";
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
		String qq="SELECT COUNT(*) FROM "+loggedInUser+"_location";
		Statement stmt;
		int count_loc=0;
		try {
			stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(qq);
			while(rs.next()) {
				count_loc=rs.getInt(1);
				count_loc++;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		LocationUser+=count_loc;
		
		String Name = request.getParameter("loc-name");
		String Type = request.getParameter("loc-type");
		String Description = request.getParameter("loc-des");
		String linki = request.getParameter("loc-link"); 
		
		String check1="https://www.google.c";
		String check2="https://maps.app.goo";
		String LinkCheck=linki.substring(0,Math.min(linki.length(),20));
		if(LinkCheck.equals(check1)||LinkCheck.equals(check2)) {
			
		}
		else {
			request.setAttribute("message", "Give proper link");
		    request.getRequestDispatcher("AddLocation.jsp").forward(request, response);
		}
		
		String cont=request.getParameter("loc-cont");
		String ams=request.getParameter("loc-am");
		int am=Integer.parseInt(ams);
		String afs=request.getParameter("loc-af");
		int af=Integer.parseInt(afs);
		String acs=request.getParameter("loc-ac");
		int ac=Integer.parseInt(acs);
		int tot=af+am+ac;
		Part part1=request.getPart("loc-p1");
		Part part2=request.getPart("loc-p2");
		String link=request.getParameter("loc-link");
		Statement stmtm;
		String selectedUnion= request.getParameter("selectedUnion");
		
		 String query5 = "SELECT * FROM bangladesh where Unionn = '"+selectedUnion+"'";

         String District = null;
         String Upazilla = null;
         String Union = selectedUnion;

         Statement stmt5;
         try 
          {
              stmt5 = con.createStatement();
              ResultSet rs1 = stmt5.executeQuery(query5);
              while(rs1.next())
              {
                   District = rs1.getString("District");
                   Upazilla = rs1.getString("Upazila");
              }
     
          }
          catch(Exception e)
        	{
        		e.printStackTrace();
        	}
         
         
         String contentType1 = part1.getContentType();
 		String contentType2 = part2.getContentType();
 		 if (!(contentType1 != null && (contentType1.startsWith("image/jpeg") || contentType1.startsWith("image/png") || contentType1.startsWith("image/gif") || contentType1.startsWith("image/jpg") || contentType1.startsWith("image/svg") || contentType1.startsWith("image/webp")|| contentType1.startsWith("image/JPEG") || contentType1.startsWith("image/PNG") || contentType1.startsWith("image/GIF") || contentType1.startsWith("image/JPG") || contentType1.startsWith("image/SVG") || contentType1.startsWith("image/WEBP")))) {
 			 	request.setAttribute("message", "Give a proper image ( Photo 1)");
 			 	String goUrl="AddLocation.jsp";
 			    request.getRequestDispatcher(goUrl).forward(request, response);
 		    }
 		 else if (!(contentType2 != null && (contentType2.startsWith("image/jpeg") || contentType2.startsWith("image/png") || contentType2.startsWith("image/gif") || contentType2.startsWith("image/jpg") || contentType2.startsWith("image/svg") || contentType2.startsWith("image/webp")|| contentType2.startsWith("image/JPEG") || contentType2.startsWith("image/PNG") || contentType2.startsWith("image/GIF") || contentType2.startsWith("image/JPG") || contentType2.startsWith("image/SVG") || contentType2.startsWith("image/WEBP")))) {
 			 	request.setAttribute("message", "Give a proper image  ( Photo 2)");
 			 	String goUrl="AddLocation.jsp";
 			    request.getRequestDispatcher(goUrl).forward(request, response);
 		    }
 		 else {
		
		try {
			InputStream is1=part1.getInputStream();
			InputStream is2=part2.getInputStream();
			
			PreparedStatement ps=con.prepareStatement("insert into "+loggedInUser+"_post(Description,Photo1,Photo2,Location,Affected,Date,Second)values(?,?,?,?,?,?,?)");
			ps.setString(1,Description);
			ps.setBlob(2, is1);
			ps.setBlob(3,is2);
			ps.setString(4, selectedUnion);
			ps.setInt(5, tot);
			Date currentDate = new Date();
	        SimpleDateFormat dateFormat = new SimpleDateFormat("h:mma dd MMM, yyyy", Locale.ENGLISH);
	        String formattedDateTime = dateFormat.format(currentDate);
	        ps.setString(6, formattedDateTime);
	        Date date = dateFormat.parse(formattedDateTime);
            long secondsSinceEpoch = date.getTime() / 1000;
            ps.setLong(7, secondsSinceEpoch);
            ps.executeUpdate();
            
            /**/
            PreparedStatement ps1=con.prepareStatement("insert into "+loggedInUser+"_location(Name,Type,Description,Photo1,Photo2,Location,Location_URL,Affected_Male,Affected_Female,Affected_Children,Affected_Total,ContactNo,Activity,LocationUsername,Date,Second)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            is1=part1.getInputStream();
			is2=part2.getInputStream();
            ps1.setString(1,Name);
			ps1.setString(2,Type);
			ps1.setString(3,Description);
			ps1.setBlob(4, is1);
			ps1.setBlob(5,is2);
			ps1.setString(6, selectedUnion);
			ps1.setString(7,linki);
			ps1.setInt(8, am);
			ps1.setInt(9, af);
			ps1.setInt(10, ac);
			ps1.setInt(11, tot);
			ps1.setString(12, cont);
			ps1.setString(13, "Inactive");
			ps1.setString(14,LocationUser);
			ps1.setString(15, formattedDateTime);
			ps1.setLong(16, secondsSinceEpoch);
            ps1.executeUpdate();
			PreparedStatement ps11=con.prepareStatement("create table "+LocationUser+"_askhelp(LocationUsername text,Description text,Photo1 longblob,Photo2 longblob,Male int,Female int,Children int,Total int,Username text,Date text,Second bigint);");
			ps11.executeUpdate();
			PreparedStatement ps22=con.prepareStatement("create table "+LocationUser+"_contribution(LocationUsername text,Description text,Photo1 longblob,Photo2 longblob,Total int,Username text,Date text,Second bigint);");
			ps22.executeUpdate();
			/**/
			PreparedStatement ps3=con.prepareStatement("insert into location_added(LocationUsername,Name,Type,Activity,Second,Priority,TotalPriority , District , Upazilla , Unionn,Link,Photo1,Photo2,ContactNo,Description,Male,Female,Children,Total)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps3.setString(1,LocationUser);
			ps3.setString(2,Name);
			ps3.setString(3,Type);
			is1=part1.getInputStream();
			is2=part2.getInputStream();
			
			ps3.setString(4, "Inactive");
			ps3.setLong(5, secondsSinceEpoch);
			ps3.setFloat(6, 0);
			ps3.setFloat(7, 0);
			ps3.setString(8, District);
			ps3.setString(9, Upazilla);
			ps3.setString(10, Union);
			ps3.setString(11, link);
			ps3.setBlob(12,is1);
			ps3.setBlob(13,is2);
			ps3.setString(14, cont);
			ps3.setString(15,Description);
			ps3.setInt(16, am);
			ps3.setInt(17, af);
			ps3.setInt(18, ac);
			ps3.setInt(19, tot);
            ps3.executeUpdate();
            
            /**/
            
            PreparedStatement ps4=con.prepareStatement("insert into post_added "+"(Username,Photo1,Photo2,Description,District,Upazilla,Unionn,Affected,Date,Second,Name)values(?,?,?,?,?,?,?,?,?,?,?)");
			
            is1=part1.getInputStream();
			is2=part2.getInputStream();
			ps4.setString(1,LocationUser);
			ps4.setBlob(2, is1);
			ps4.setBlob(3,is2);
			ps4.setString(4,Description);
			ps4.setString(5,District );
			ps4.setString(6,Upazilla );
			ps4.setString(7,Union );
			ps4.setInt(8, tot);
			ps4.setString(9, formattedDateTime);
            ps4.setLong(10, secondsSinceEpoch);
            ps4.setString(11,Name );
			ps4.executeUpdate();
            response.sendRedirect("Profile.jsp");
			
		}catch(Exception e) {
			
		}
 	   }
	}

}
