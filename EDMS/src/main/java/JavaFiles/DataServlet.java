package JavaFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
@WebServlet("/api/data")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	        // Handle API request
	        try {
	            Connection connection = null;
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
	        		connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/edms" , "root","");
	        	}
	        	catch(SQLException e)
	        	{
	        		e.printStackTrace();
	        	}
	        	String query = "SELECT * FROM location_added  order by Second desc";
				
				Statement stmt;
				ArrayList<String>Verified1=new ArrayList();
				ArrayList<String>Name1=new ArrayList();
				ArrayList<String>Type1=new ArrayList();
				ArrayList<String>Activity1=new ArrayList();
				ArrayList<String>District1=new ArrayList();
				ArrayList<String>Upazilla1=new ArrayList();
				ArrayList<String>Union1=new ArrayList();
				ArrayList<String>Username1=new ArrayList();
				try
				{
					stmt = connection.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					while(rs.next())
					{
						String name = rs.getString("Name");
						String type = rs.getString("Type");
						String activ = rs.getString("Activity");
						String LocUser = rs.getString("LocationUsername");
						String dist = rs.getString("District");
						String upa = rs.getString("Upazilla");
						String uni = rs.getString("Unionn");
						String user= rs.getString("LocationUsername");
						
						
						String Verified = null;
						
						String query2 = "SELECT * FROM location_verfied where LocationUsername = '"+LocUser+"'";
						try
						{
							Statement stmt2 = connection.createStatement();
							
							ResultSet rs2 = stmt2.executeQuery(query2);
							
							while(rs2.next())
							{
								Verified = rs2.getString("LocationUsername");
							}
							
						}
						catch(Exception e)
						{
							
						}
						
						
							
						Verified1.add(Verified);
						Name1.add(name);
						Type1.add(type);
						Activity1.add(activ);
						District1.add(dist);
						Upazilla1.add(upa);
						Union1.add(uni);
						Username1.add(user);
						//System.out.println("none"+Activity1.size());
						
					}
				
					
				}
				catch(Exception e)
				{
					
				}
				List<List<String>> mergedList = new ArrayList<>();
		        mergedList.add(Verified1);
		        mergedList.add(Name1);
		        mergedList.add(Type1);
		        mergedList.add(Activity1);
		        mergedList.add(District1);
		        mergedList.add(Upazilla1);
		        mergedList.add(Union1);
		        mergedList.add(Username1);
	            // Convert the data to JSON
				ObjectMapper objectMapper = new ObjectMapper();
		        try {
		            String json = objectMapper.writeValueAsString(mergedList);
		            
		            response.setContentType("application/json");
		            response.setCharacterEncoding("UTF-8");
		            response.getWriter().write(json);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }

	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.setStatus(500);
	        }
	    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}