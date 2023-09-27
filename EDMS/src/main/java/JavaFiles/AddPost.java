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


@MultipartConfig
@WebServlet(name="AddPost",urlPatterns= {"AddPost"})
public class AddPost extends HttpServlet {
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
		
		HttpSession session=request.getSession(false);

    String Username = (String) session.getAttribute("loggedInUser");
    if (Username == null) {
        String currentURL = request.getRequestURI();
        session.setAttribute("redirectURL", currentURL);
        response.sendRedirect("Login.jsp");
    }
      
      System.out.println("Printing from AddPost Servlet "+Username);
		
		
		String PostString = request.getParameter("PostString");
		
		System.out.println(PostString);
		
		Statement stmtm;
		String selectedUnion= request.getParameter("selectedUnion");
		
		
		 String query1 = "SELECT * FROM bangladesh where Unionn = '"+selectedUnion+"'";

         String District = null;
         String Upazilla = null;
         String Union = selectedUnion;

         Statement stmt1;
         try 
          {
              stmt1 = con.createStatement();
              ResultSet rs1 = stmt1.executeQuery(query1);
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

		
		String Name=null;
		String queryn="SELECT * FROM registrationinfo where Username = '"+Username+"'";
		Statement stmtn;
		try 
        {
            stmtn = con.createStatement();
            ResultSet rs1 = stmtn.executeQuery(queryn);
            while(rs1.next())
            {
                 Name=rs1.getString("Name");
            }
   
        }
        catch(Exception e)
      	{
      		e.printStackTrace();
      	}
		//String ImageName = request.getParameter("ImageName");
		
		
		
		
    response.setContentType("text/html;charset=UTF-8");
		
    out=response.getWriter();
		
    
	Part part1=request.getPart("ImageName1");
    Part part2=request.getPart("ImageName2");
    
    String contentType1 = part1.getContentType();
	String contentType2 = part2.getContentType();
	 if (!(contentType1 != null && (contentType1.startsWith("image/jpeg") || contentType1.startsWith("image/png") || contentType1.startsWith("image/gif") || contentType1.startsWith("image/jpg") || contentType1.startsWith("image/svg") || contentType1.startsWith("image/webp")|| contentType1.startsWith("image/JPEG") || contentType1.startsWith("image/PNG") || contentType1.startsWith("image/GIF") || contentType1.startsWith("image/JPG") || contentType1.startsWith("image/SVG") || contentType1.startsWith("image/WEBP")))) {
		 	request.setAttribute("message", "Give a proper image ( Photo 1)");
		 	String goUrl="AddPost.jsp";
		    request.getRequestDispatcher(goUrl).forward(request, response);
	    }
	 else if (!(contentType2 != null && (contentType2.startsWith("image/jpeg") || contentType2.startsWith("image/png") || contentType2.startsWith("image/gif") || contentType2.startsWith("image/jpg") || contentType2.startsWith("image/svg") || contentType2.startsWith("image/webp")|| contentType2.startsWith("image/JPEG") || contentType2.startsWith("image/PNG") || contentType2.startsWith("image/GIF") || contentType2.startsWith("image/JPG") || contentType2.startsWith("image/SVG") || contentType2.startsWith("image/WEBP")))) {
		 	request.setAttribute("message", "Give a proper image  ( Photo 2)");
		 	String goUrl="AddPost.jsp";
		    request.getRequestDispatcher(goUrl).forward(request, response);
	    }
	 else {
	
    if(part1!=null && part2!=null) {
			try {
				PreparedStatement ps=con.prepareStatement("insert into "+Username+"_post"+"(Description,Photo1,Photo2,Location,Affected,Date,Second)values(?,?,?,?,?,?,?)");
				
				InputStream is1=part1.getInputStream();
				InputStream is2=part2.getInputStream();

        		ps.setString(1,PostString);
        		ps.setBlob(2, is1);
        		ps.setBlob(3,is2);
				ps.setString(4, selectedUnion);
				ps.setInt(5, -1);
				Date currentDate = new Date();
		        SimpleDateFormat dateFormat = new SimpleDateFormat("h:mma dd MMM, yyyy", Locale.ENGLISH);
		        String formattedDateTime = dateFormat.format(currentDate);
		        ps.setString(6, formattedDateTime);
		        Date date = dateFormat.parse(formattedDateTime);
	            long secondsSinceEpoch = date.getTime() / 1000;
	            ps.setLong(7, secondsSinceEpoch);
				int res=0;
				res=ps.executeUpdate();
				
				PreparedStatement ps1=con.prepareStatement("insert into post_added "+"(Username,Photo1,Photo2,Description,District,Upazilla,Unionn,Affected,Date,Second,Name)values(?,?,?,?,?,?,?,?,?,?,?)");
				
				is1=part1.getInputStream();
				is2=part2.getInputStream();
				ps1.setString(1,Username);
				ps1.setBlob(2, is1);
				ps1.setBlob(3,is2);
				ps1.setString(4,PostString );
				ps1.setString(5,District );
				ps1.setString(6,Upazilla );
				ps1.setString(7,Union );
				ps1.setInt(8, -1);
				ps1.setString(9, formattedDateTime);
	            ps1.setLong(10, secondsSinceEpoch);
	            ps1.setString(11,Name);
				ps1.executeUpdate();
				
			}catch(Exception e) {
				System.out.println("Add image a dhora");
				e.printStackTrace();
			}
			
		}
    	else 
    	{
    		System.out.println("Photot somosssa");
    	}
     }
     response.sendRedirect("Profile.jsp");
   }
	
	
	
	
}
