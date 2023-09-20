<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Emergency Disaster Management System</title>
    <link rel="stylesheet" href="CSS/Profile.css" />
    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- DaisyUI CDN -->
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.7.3/dist/full.css" rel="stylesheet" type="text/css" />
    <!-- Animate.css CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- AOS CDN -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/f13afb77f1.js" crossorigin="anonymous"></script>
</head>

<%

String loggedInUser = (String) session.getAttribute("loggedInUser");

if (loggedInUser == null) {
   String currentURL = request.getRequestURI();
   session.setAttribute("redirectURL", currentURL);
   response.sendRedirect("Login.jsp");
   return;
 }

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

String Name = null;
String ContactNo = null;

String query = "SELECT * FROM registrationinfo WHERE Username = '"+loggedInUser+"'";
Statement stmt;
try 
{
		stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next())
		{
	          Name = rs.getString("Name");
	          ContactNo = rs.getString("ContactNo");
	         
		}

   }
	catch(Exception e)
	{
		e.printStackTrace();
	}


%>

<body>
	<div class="bg-white">
        <div class="lg:min-h-screen">
            <div class="flex items-center justify-center px-5 py-5">
                <div class="w-full mx-auto">
                    <div class="relative mt-1 block text-center">
                        <a href="Home.jsp">
                            <h1 class="font-extrabold text-5xl text-amber-500">
                                edms<span class="text-red-500">.</span>
                            </h1>
                        </a>
                    </div>

                    <!-- Form -->
                    <form class="my-5 max-w-[400px] mx-auto" action="UpdateProfile" method="post"
                        enctype="multipart/form-data">

                        <!-- username -->
                        
                        <input name="Username"  type="hidden" value=<%=loggedInUser %> class="input input-bordered w-full" />
                        <!-- Name -->
                        <label class="label">
                            <span class="label-text">Full Name</span>
                        </label>
                        <input name="Name" type="text" value=<%=Name %> class="input input-bordered w-full" />
                        <!-- Mobile -->
                        <label class="label">
                            <span class="label-text">Mobile No.</span>
                        </label>
                        <input name="Cont" type="text" value=<%=ContactNo %> class="input input-bordered w-full" />
                        <!-- Password -->
                        <label class="label">
                            <span class="label-text">New Password</span>
                        </label>
                        <input name="Password" type="password" class="input input-bordered w-full" />
                        <div class="alert alert-warning mt-3">
						  <svg xmlns="http://www.w3.org/2000/svg" class="stroke-current shrink-0 h-6 w-6" fill="none" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" /></svg>
						  <span>Leave password blank to keep it unchanged.</span>
						</div>
                        <!-- submit button -->
                        <input class="btn btn-warning my-5 w-full" type="submit" value="Update">
                        <p>${message}</p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>