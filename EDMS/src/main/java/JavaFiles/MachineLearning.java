package JavaFiles;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Date;

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


/**
 * Servlet implementation class MachineLearning
 */
public class MachineLearning extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MachineLearning() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
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
		
		
		ArrayList<String> LocationUsername = new ArrayList<String>();
		ArrayList<String> District = new ArrayList<String>();
		ArrayList<Long> Second = new ArrayList<Long>();
		
		String queryU="select * from location_added";
		Statement stmt0;
		try{
			
			stmt0 = con.createStatement();
		    ResultSet rs0 = stmt0.executeQuery(queryU);
			while(rs0.next()){
                   String Username = rs0.getString("LocationUsername");
                   String DD = rs0.getString("District");
                   
                   Long sec = rs0.getLong("Second");
                   
                   District.add(DD);
                   LocationUsername.add(Username);
                   Second.add(sec);
              
			}
		}catch(Exception e){
			
		}
		
		Date currentDate = new Date();
	    SimpleDateFormat dateFormat = new SimpleDateFormat("h:mma dd MMM, yyyy", Locale.ENGLISH);
		String formattedDateTime = dateFormat.format(currentDate);
	    Date date;
	    long secondsSinceEpoch=0;
	    try {
			date = dateFormat.parse(formattedDateTime);
			secondsSinceEpoch = date.getTime() / 1000;

		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
	    int contribution = 0;
	    int askhelp = 0;
		
		for(int i=0;i<LocationUsername.size();i++)
		{
			int total_contribution = 0;
			
			
			String query1231 = "SELECT COUNT(*) FROM " + LocationUsername.get(i) + "_askhelp";
			Statement stmt121;
			try{
				
				stmt121 = con.createStatement();
			    ResultSet rs12 = stmt121.executeQuery(query1231);
				while(rs12.next()){
	                   total_contribution = rs12.getInt(1);
	              
				}
			}catch(Exception e){
				
			}
			
			
			
			
			
			long xx = secondsSinceEpoch;
			long yy = secondsSinceEpoch-86400*3;
			
			String query123 = "SELECT COUNT(*) FROM " + LocationUsername.get(i) + "_contribution WHERE second >= "+yy+" AND second <= "+xx;
			Statement stmt12;
			try{
				
				stmt12 = con.createStatement();
			    ResultSet rs12 = stmt12.executeQuery(query123);
				while(rs12.next()){
	                   contribution = rs12.getInt(1);
	              
				}
			}catch(Exception e){
				
			}
			
			
			String query12311 = "SELECT COUNT(*) FROM " + LocationUsername.get(i) + "_askhelp WHERE second >= "+yy+" AND second <= "+xx;
			Statement stmt1211;
			try{
				
				stmt1211 = con.createStatement();
			    ResultSet rs12 = stmt1211.executeQuery(query1231);
				while(rs12.next()){
	                   askhelp = rs12.getInt(1);
	              
				}
			}catch(Exception e){
				
			}
			
			
			
			
			int MLvalue = 0;
			
			PredictWithModel obj = new PredictWithModel();
			
			try
			{
				MLvalue = obj.Predict(District.get(i) , contribution , askhelp);
				System.out.println(MLvalue);
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			
			
			
			if(total_contribution>5)
			{

				try {
		            // Establish a database connection
		            

		            // Define the SQL query with placeholders
					String sql = "UPDATE location_verified SET LocationUsername	 = ?";

		            // Create a prepared statement
		            PreparedStatement preparedStatement = con.prepareStatement(sql);

		            // Set the new total_priority, new priority, and condition values as parameters
		           
		            preparedStatement.setString(1,LocationUsername.get(i));
		            

		            // Execute the update
		            int rowsUpdated = preparedStatement.executeUpdate();
		            System.out.println("Rows updated: " + rowsUpdated);

		            // Close the resources
		            preparedStatement.close();
		            
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
			}
			
			
			if(MLvalue==1)
			{
				
				try {
		            // Establish a database connection
		            

		            // Define the SQL query with placeholders
					String sql = "UPDATE location_added SET TotalPriority = ?, Activity = ? WHERE LocationUsername = ?";

		            // Create a prepared statement
		            PreparedStatement preparedStatement = con.prepareStatement(sql);

		            // Set the new total_priority, new priority, and condition values as parameters
		            float x = (float)(Second.get(i)/1000000.00);
		            preparedStatement.setFloat(1,x );
		            preparedStatement.setString(2 ,"Critical Help Needed");
		            preparedStatement.setString(3, LocationUsername.get(i));

		            // Execute the update
		            int rowsUpdated = preparedStatement.executeUpdate();
		            System.out.println("Rows updated: " + rowsUpdated);

		            // Close the resources
		            preparedStatement.close();
		            
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
				
				
			}
			
			else 
			{
				try {
		            // Establish a database connection
		            

		            // Define the SQL query with placeholders
					String sql = "UPDATE location_added SET TotalPriority = ?, Activity = ? WHERE LocationUsername = ?";

		            // Create a prepared statement
		            PreparedStatement preparedStatement = con.prepareStatement(sql);

		            // Set the new total_priority, new priority, and condition values as parameters
		            float x = (float)(Second.get(i)/10000000.00);
		            preparedStatement.setFloat(1,x );
		            
		            if(askhelp>0)
		            {
		            	preparedStatement.setString(2 ,"Active");
		            }
		            else 
		            {
		            	preparedStatement.setString(2 ,"Inactive");
		            }
		            
		            preparedStatement.setString(3, LocationUsername.get(i));

		            // Execute the update
		            int rowsUpdated = preparedStatement.executeUpdate();
		            System.out.println("Rows updated: " + rowsUpdated);

		            // Close the resources
		            preparedStatement.close();
		            
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
				
				
			}
			
			
			
			
			
			
		}
		
		
		
		
		
	}

}