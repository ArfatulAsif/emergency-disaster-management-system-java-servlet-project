package JavaFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.mindrot.jbcrypt.BCrypt;

@MultipartConfig
@WebServlet(name="Login",urlPatterns= {"/Login"})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		String Username=request.getParameter("log_username");
		String pass=request.getParameter("log_password");
		
		// ------------------------------- verified update here -------------------------------------------
		
		
		
		
		
		  String queryv = "SELECT * FROM verified WHERE Username = '"+Username+"'";
	      Statement stmtv;
	      String Verified = null;
	      try 
	      {
	    		stmtv = con.createStatement();
	    		ResultSet rs = stmtv.executeQuery(queryv);
	    		while(rs.next())
	    		{
	                   Verified = rs.getString("Username");
	    			
	    		}
	    
		  }
	     catch(Exception e)
	     {
	        	e.printStackTrace();
	     }
	      
	      
	      
	      
	     if(Verified==null)
	     {
	    	 
	    	 int count = 0;
	    	
	    	 String query90 = "SELECT * FROM "+Username+"_location";
	    	 Statement stmt90;
	         try 
	         {
	        		stmt90 = con.createStatement();
	        		ResultSet rs = stmt90.executeQuery(query90);
	        		while(rs.next())
	        		{
	    			          
	    			          
	    			            String LLocUsername = rs.getString("LocationUsername");

	    						
	    						String query901 = "SELECT COUNT(*) FROM "+LLocUsername+"_askhelp";
	    						Statement stmt901;
	    						
	    						try 
	    						{
	    						    stmt901 = con.createStatement();
	    						    ResultSet rs1 = stmt901.executeQuery(query901);
	    						    while(rs1.next())
	    						    {
	    						        
	    						          count = count + rs1.getInt(1);
	    						        
	    						    }
	    						
	    						}
	    						catch(Exception e)
	    						{
	    						   e.printStackTrace();
	    						}
	    			    
	        		}
	        
	    	     }
	         	catch(Exception e)
	        	{
	        		e.printStackTrace();
	        	}
	         
	         
	           if(count>=20)
	           {
	        	   
	        	    try 
	        	    {
	        	    	PreparedStatement ps=con.prepareStatement("insert into verified(Username)values(?)");
						
						ps.setString(1, Username);
						ps.executeUpdate();
	        	    }
	        	    catch(Exception e)
	        	    {
	        	    	
	        	    }
	        	  
	        	   
	           }
	         
	     }

		
		Statement stmtm;
		
		HttpSession session=request.getSession();
		try {
			stmtm=con.createStatement();
			ResultSet rss=stmtm.executeQuery("select * from registrationinfo where Username ='"+Username+"'");
			String password=null;
			
			
			while(rss.next()) {
				password=rss.getString("Password");
				if (BCrypt.checkpw(pass, password)) {
					password=pass;
		            System.out.println("Password is correct.");
		        }
				else {
					request.setAttribute("message", "Username or Password Doesn't Match");
				    request.getRequestDispatcher("Login.jsp").forward(request, response);
				}
				
			}
			
			
			if(password==null) {
				
				request.setAttribute("message", "Username or Password Doesn't Match");
			    request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
			else if(password.equals(pass)) {
				
				session.setAttribute("loggedInUser", Username);
			    
			    String redirectURL = (String) session.getAttribute("redirectURL");
			    if (redirectURL != null) {
			    	

			        session.removeAttribute("redirectURL");
			        response.sendRedirect(redirectURL);
			    } else {
			        response.sendRedirect("Home.jsp");
			    }
			}
			else {
				
				request.setAttribute("message", "Username or Password Doesn't Match");
			    request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}catch(Exception e) {
			
		}
		
	}

}