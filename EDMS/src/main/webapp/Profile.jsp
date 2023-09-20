<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.sql.*" %>
  <%@page import="java.util.*" %>
  <%@page import="JavaFiles.PrintCharacter"%>
   
<%
   
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


    String loggedInUser = (String) session.getAttribute("loggedInUser");
   if (loggedInUser == null) {
    String currentURL = request.getRequestURI();
    session.setAttribute("redirectURL", currentURL);
    response.sendRedirect("Login.jsp");
    return;
  }


      String query = "SELECT * FROM verified WHERE Username = '"+loggedInUser+"'";
      Statement stmt;
      String Verified = null;
    	try 
    	{
    		stmt = con.createStatement();
    		ResultSet rs = stmt.executeQuery(query);
    		while(rs.next())
    		{
          Verified = rs.getString("Username");
    			
    		}
    
	     }
     	catch(Exception e)
    	{
    		e.printStackTrace();
    	}


     //Get from registrationinfo table 


     
      String Image = null;

      String Name = null;
      String Type = null;
      String ContactNo = null;
      String Description = null;
      String UserDistrict = null;
      String UserUpazila = null;
      String UserUnion = null;
      
     query = "SELECT * FROM registrationinfo WHERE Username = '"+loggedInUser+"'";
      
     try 
    {
    		stmt = con.createStatement();
    		ResultSet rs = stmt.executeQuery(query);
    		while(rs.next())
    		{
		          Name = rs.getString("Name");
		          Type = rs.getString("Type");
		          ContactNo = rs.getString("ContactNo");
		          Description = rs.getString("Description");
		          UserUnion = rs.getString("Location");
		          Image="data:image/gif;base64,"+encodeBlobToBase64(rs.getBlob("Image"));
    			
    		}
    
	     }
     	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
     
     
     
     
     
     String query123  = "SELECT * FROM bangladesh WHERE Unionn = '"+UserUnion+"'";
     
     Statement stmt123;
     
     try 
     {
     		stmt123 = con.createStatement();
     		ResultSet rs = stmt123.executeQuery(query123);
     		while(rs.next())
     		{
 		          UserDistrict = rs.getString("District");
 		          UserUpazila = rs.getString("Upazila");
 		          
     			
     		}
     
 	     }
      	catch(Exception e)
     	{
     		e.printStackTrace();
     	}
     
     
     
     
     
     
     


     //Get from User_location 

     Stack<String>LocName = new Stack<String>();
     Stack<String>LocType = new Stack<String>();
     Stack<String>LocActivity = new Stack<String>();
     Stack<String>LocVerified= new Stack<String>();
     Stack<String>LocUsername= new Stack<String>();
     
       
     query = "SELECT * FROM "+loggedInUser+"_location";

     try 
    	{
    		stmt = con.createStatement();
    		ResultSet rs = stmt.executeQuery(query);
    		while(rs.next())
    		{
			          String LLocName = rs.getString("Name");
			          String LLocType = rs.getString("Type");
			          String LLocActivity = rs.getString("Activity");
			          String LLocUsername = rs.getString("LocationUsername");
			          String LLocVerified = null;
			          
			          String query2 = "SELECT * FROM verified WHERE Username = '"+loggedInUser+"'";
			          
			          Statement stmt33 = con.createStatement();;
			          
			          ResultSet rs2 = stmt33.executeQuery(query2);
			          
			          
			          while(rs2.next())
			          {
			        	  LLocVerified = rs2.getString("Username");  
			          }

			          LocName.push(LLocName);
			          LocType.push(LLocType);
			          LocActivity.push(LLocActivity);
			          LocVerified.push(LLocVerified);
			          LocUsername.push(LLocUsername);
    			
    		}
    
	     }
     	catch(Exception e)
    	{
    		e.printStackTrace();
    	}


      //Get From User_post 

     Stack<String>PostDate = new Stack<String>();
     Stack<String>PostUnionn= new Stack<String>();
     Stack<String>PostUpazilla= new Stack<String>();
     Stack<String>PostDistrict= new Stack<String>();
     
     Stack<Integer>PostAffected  = new Stack<Integer>();
     Stack<String>PostDescription= new Stack<String>();
     
     //Kora baki    
     Stack<String>PostPhoto1= new Stack<String>();
     Stack<String>PostPhoto2= new Stack<String>();

      query = "SELECT * FROM "+loggedInUser+"_post";
      

     try 
    	{
    		stmt = con.createStatement();
    		ResultSet rs = stmt.executeQuery(query);
    		while(rs.next())
    		{
          String PostDate1 = rs.getString("Date");
          String PostLocation1 = rs.getString("Location");
          Integer  PostAffected1 = rs.getInt("Affected");
          String PostDescription1 = rs.getString("Description");
			//String PostPhoto11=rs.getString("Photo1");
			String PostPhoto11="data:image/gif;base64,"+encodeBlobToBase64(rs.getBlob("Photo1"));
			
			String PostPhoto21="data:image/gif;base64,"+encodeBlobToBase64(rs.getBlob("Photo2"));
			PostPhoto1.push(PostPhoto11);
			PostPhoto2.push(PostPhoto21);
          PostDate.push(PostDate1);
          PostAffected.push(PostAffected1);
          PostDescription.push(PostDescription1);

          String query1 = "SELECT * FROM bangladesh where Unionn = '"+PostLocation1+"'";

           String District = null;
           String Upazilla = null;
           String Union = PostLocation1;

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

           

            PostUnionn.push(Union);
            PostUpazilla.push(Upazilla);
            PostDistrict.push(District);
          

       
    		}
    
	     }
     	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
     
%>
   
<!DOCTYPE html>

<head>
    <title>Emergency Disaster Management System</title>
    <link rel="stylesheet" href="CSS/Profile.css">
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


<body>
    <!-- Start of Navbar -->
    <div class="border-b-[1px] bg-amber-500">
        <div class="my-container">
            <!-- For Large Device -->
            <div class="hidden lg:flex items-center justify-between">
                <!-- Logo -->
                <a href='Home.jsp'>
                    <h1 class="font-extrabold text-5xl text-white">edms<span class="text-red-500">.</span></h1>
                </a>

                <!-- Nav links for medium and large devices -->
                <div class="flex flex-row items-center justify-between gap-3 md:gap-0">
                    <!-- active link style -->
                    <a href="Home.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Home</a>
                    <!-- inactive link styles -->
                    <a href="Shelter_and_Areas.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Shelters & Areas</a>
                    <a href="Social.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Social</a>
                    <a href="Faq.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">FAQ</a>
                </div>

                <!-- user icon  -->
                <div class="flex justify-center items-center text-[18px]">
                    <div class="tooltip tooltip-left" data-tip="Log Out">
                        <a href="logout.jsp" class="text-white hover:text-white transition duration-300">
                            <i class="fa-solid fa-right-from-bracket"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- For Medium and small devices -->
            <div class="navbar bg-base-100 lg:hidden bg-amber-500 min-h-[100px]">
                <div class="navbar-start">
                    <div class="dropdown">
                        <label tabindex="0" class="btn btn-ghost btn-circle">
                            <i class="fa-solid fa-bars text-[40px]"></i>
                        </label>

                        <ul tabindex="0"
                            class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-[400px] flex flex-col gap-5 p-5">
                            <li><a href="Home.jsp"
                                    class="text-[40px] text-[#293341] block border-b-[1px] p-3 hover:text-[#F17829] transition duration-500">Homepage</a>
                            </li>
                            <li><a href="Shelter_and_Areas.jsp"
                                    class="text-[40px] text-[#293341] block border-b-[1px] p-3 hover:text-[#F17829] transition duration-500">Shelters
                                    & Areas</a></li>
                            <li><a href="Social.jsp"
                                    class="text-[40px] text-[#293341] block border-b-[1px] p-3 hover:text-[#F17829] transition duration-500">Social</a>
                            </li>
                            <li><a href="Faq.jsp"
                                    class="text-[40px] text-[#293341] block border-b-[1px] p-3 hover:text-[#F17829] transition duration-500">FAQ</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="navbar-center">
                    
                        <a href='Home.jsp'>
                            <h1 class="font-extrabold text-[50px] text-white">edms<span class="text-red-500">.</span>
                            </h1>
                        </a>
                    
                </div>
                <div class="navbar-end">
                    <a href="Profile.jsp" class="text-white hover:text-[#F17829] transition duration-300">
                        <i class="fa-regular fa-circle-user text-[40px]"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Navbar -->


    <!-- Profile -->
    <div class="my-container grid grid-cols-1 lg:flex gap-5 p-5">
        <!-- Profile Card -->
        <div class="static lg:sticky top-0">
            <div class="sticky top-5 flex flex-col gap-1 justify-center items-center p-5 shadow-lg rounded-lg min-w-[280px]">
                <img onclick="profile_img_modal.showModal()" class="cursor-pointer rounded-full w-[250px] h-[250px] mt-3" src=<%=Image%> alt="profile picture">
                <dialog id="profile_img_modal" class="modal w-[100vw]">
                    <div class="modal-box max-w-[90vw] w-full lg:w-auto">
                        <form method="dialog">
                        	<button class="btn btn-sm btn-circle btn-error text-white absolute right-2 top-2">X</button>
                        </form>
						<div class="flex justify-center items-center">
                        	<img class="rounded-xl" src=<%=Image%> alt="">
                    	</div>
					</div>
                </dialog>
                
                <h1 class="font-bold text-[20px] flex items-center justify-center gap-2"> <% if(Verified !=null) { %> <img class="w-[30px] h-[30px]" src="IMAGES/badge-2.png" alt=""> <% } %><%=Name%></h1>
                <h3 class="text-slate-500"><%=Type%></h3>
                <h3 class="text-slate-500"><%=ContactNo%></h3>
                
                
				<div>
					<div class="my-2 text-[15px] flex gap-1  flex-wrap">
						<i class="fa-solid fa-location-dot"></i>
						<div class="badge badge-ghost"><%=UserUnion%></div>
                	</div>
                
	                <div class="my-2 text-[15px] flex gap-1 flex-wrap">
						<i class="fa-solid fa-location-dot"></i>
						<div class="badge badge-ghost"><%=UserUpazila%></div>
	                </div>
	                
	                <div class="my-2 text-[15px] flex gap-1 flex-wrap">
						<i class="fa-solid fa-location-dot"></i>
						<div class="badge badge-ghost"><%=UserDistrict%></div>
	                </div>
				</div>
              
              <a href="UpdateProfile.jsp">              
              	<input class="btn btn-outline btn-warning" type="submit" value="Update Profile" />
              </a> 
              
                
                <div class="divider"></div>
                	<h2 class="mb-3 text-slate-600">Locations Added: <%=LocName.size()%></h2>
            	</div>
      	</div>
        

        <!-- Timeline -->
        <div class="shadow-lg rounded-lg p-5 grow">     
        <!-- User description -->
        <div class="bg-gray-100 p-3 lg:p-5 rounded-lg mb-5">
        	<h1 class="font-bold text-center text-[20px] mb-2">User Description</h1>
        	<p class="text-justify">
        		<%=Description %>
        	</p>
        </div>
           	
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-5">
                <a href="AddPost.jsp"><button class="btn btn-warning w-full hover:bg-amber-500">Add Post</button></a>
				<div class="flex gap-5 w-full">
					<a class="grow" href="AddLocation.jsp"><button class="btn btn-warning hover:bg-amber-500 w-full">Add Location</button></a>
					
					<% if(loggedInUser.equals("UAK") || loggedInUser.equals("AIA") ) { %>
						<form action = "MachineLearning" method="post">
							
								<input type="submit" value="Update System" class="btn btn-error hover:bg-amber-500 w-full" />
							
						</form>
					<% } %>
				</div>
            </div>
             <div>
                <div class="divider"></div>
                <h1 class="text-slate-600 font-bold text-[20px] text-center">Locations Added</h1>
                <!-- Locations Table -->
                
                
                
               
                
                
                
                
                <div class="overflow-x-auto my-3">
                    <table class="table">
                      <!-- head -->
                      <thead>
                        <tr>
                          <th>
                            <label>
                            </label>
                          </th>
                          <th>Name</th>
                          <th>Type</th>
                          <th>Activity</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- row 1 -->
                        
                         <!-- -------- FOR loop one ----->
                        
                     <% 
                     
                     while(!LocName.empty())
                     {
                          String NName = LocName.peek();
                          String TType = LocType.peek();
                          String AActivity = LocActivity.peek();
                          String VVerified = LocVerified.peek();
                          String UUsername = LocUsername.peek();
                          LocName.pop();
                          LocType.pop();
                          LocActivity.pop();
                          LocVerified.pop();
                          LocUsername.pop();
                        
                          
                          
                     
                     %>   
                        <tr>
                          <th>
                            <label>
                            <%
                            if(VVerified!=null)
                            {
                            
                            %>                       
                              <img class="w-[30px] h-[30px]" src="IMAGES/badge-2.png" alt="">
                          <% } %>
                              
                            </label>
                          </th>
                          <td>
                            <div class="flex items-center space-x-3">
                              <div>
                                <div class="font-bold"><a class="hover:text-red-500" href="Location_Profile.jsp?LocationUsernameFromShelterPage=<%=UUsername%>"><%=NName%></a></div>
                              </div>
                            </div>
                          </td>
                          <td>
                            <%=TType%>
                          </td>
                          <td>
                          
                          <%
                          
                          if(AActivity.equals("Active"))
                          {
                          
                          %>
                          
                          <div class="badge badge-accent">Active</div>
                          
                          <%
                          }
                          %>
                           <%
                          
                          if(AActivity.equals("Inactive") )
                          {
                          
                          %>
                          
                          <div class="badge badge-ghost">Inactive</div>
                          
                          <%
                          }    
                          %>
                           <%
                          
                          if(AActivity.equals("Critical Help Needed"))
                          {
                          
                          %>
                          
                          <div class="badge badge-error">Critical Help Needed</div>
                          
                          <%
                          }
                          %>
                          
                          
                          
                          </td>
                        </tr>   
                        
                        
                    <% 
                        
                     
                     }
                     
                    %>
                                                              


                    </table>

                    <div class="divider"></div>
                    
                    <h1 class="text-slate-600 font-bold text-[20px] text-center">Timeline</h1>

                    <!-- Posts -->
                    
                    <div class="flex flex-col gap-5 overflow-hidden my-5">
                      <!-- Post1 start -->
                      
                      
                      
                      
                      
                      
                     <!-- for loop starts here -->
                     
                     
                     <% 
                     
                     while(!PostDate.empty())
                     {
                   
                     
                     %>
                     
                     
                    <div data-aos="fade-right" class="bg-[#d9d9d9] p-3 md:p-5 rounded-xl">
                      <div class="flex flex-col md:flex-row gap-3 justify-between">
                          <div class="flex gap-3">
                              <!-- TODO: if verified then show badge -->
                              <%
                        if(Verified!=null)
                        {
                        %>
                        
                        <img class="h-full w-auto" src="IMAGES/badge-2.png" alt="verified">
                        
                       <%} %>
                       
                        <div>
                        <% 
                       if(PostAffected.peek()!=-1) 
                       {
                        %>
                            <h1 class="text-[16px] font-bold"><%=Name%> </h1>
                         
                     <% } %>
                     
                      <% 
                     if(PostAffected.peek()==-1) 
                       {
                        %>
                            <h1 class="text-[16px] font-bold"><%=Name%> </h1>
                         
                     <% } %>
                            
                            <h3 class="text-[15px]"><%=PostDate.pop()%></h3>
                        </div>
                    </div>
                    <!-- TODO: implement conditional rendering -->
                    
                    <% 
                    if(PostAffected.peek()!=-1) 
                    {
                    %>       
                    <div class="badge badge-ghost text-[18px] p-3 border-1 border-black">Affected People: <%=PostAffected.pop()%></div>
           
                    <%} %>
                    
                      
                      </div>
                      <div class="my-2 text-[15px] flex gap-1 items-center">
                          <i class="fa-solid fa-location-dot"></i>
                          <div class="badge badge-ghost"><%=PostUnionn.pop()%></div>
                          <div class="badge badge-ghost"><%=PostUpazilla.pop()%></div>
                          <div class="badge badge-ghost"><%=PostDistrict.pop()%></div>
                      </div>
                      <div class="grid grid-cols-1 lg:grid-cols-2 gap-5">
                          <div class="grid grid-cols-2 lg:flex gap-2">
                          
                          <%  String take1 = "img_modal_"+PostPhoto1.size()+"_1.showModal()"; %>
                          
                          
                               <img onclick=<%=take1%>
                                  class="center-cropped max-h-[200px] cursor-pointer lg:w-[50%] rounded-xl w-full"
                                 src=<%=PostPhoto1.peek()%> alt="">
                            
                            
                              <!-- image-1 modal -->
                              
                               <%  String take2 ="img_modal_"+PostPhoto1.size()+"_1"; %>
                              
                              <dialog id=<%=take2%> class="modal w-[100vw]">
                                  <div class="modal-box max-w-[90vw] w-full lg:w-auto">
                                      <form method="dialog">
                                          <button class="btn btn-sm btn-circle btn-error text-white absolute right-2 top-2">X</button>
                                      </form>
                                      <div class="flex justify-center items-center">
                                          <img class="rounded-xl" src=<%=PostPhoto1.pop()%> alt="">
                                      </div>
                                  </div>
                              </dialog>
                              
                              
                              
                             <%  String take3 = "img_modal_"+PostPhoto2.size()+"_2.showModal()"; %>
                          
                          
                               <img onclick=<%=take3%>
                                  class="center-cropped max-h-[200px] cursor-pointer lg:w-[50%] rounded-xl w-full"
                                 src=<%=PostPhoto2.peek()%> alt="">
                              <!-- image-2 modal -->
                              
                               <%  String take4 ="img_modal_"+PostPhoto2.size()+"_2"; %>
                              
                              <dialog id=<%=take4%> class="modal w-[100vw]">
                                  <div class="modal-box max-w-[90vw] w-full lg:w-auto">
                                      <form method="dialog">
                                          <button class="btn btn-sm btn-circle btn-error text-white absolute right-2 top-2">X</button>
                                      </form>
                                      <div class="flex justify-center items-center">
                                          <img class="rounded-xl" src=<%=PostPhoto2.pop()%> alt="">
                                      </div>
                                  </div>
                              </dialog>
                              
                              
                              
                              
                              
                         
                         
                          </div>
      
                          <div class="post-description flex flex-col justify-between">
                              
                               <%  PrintCharacter PCobj = new PrintCharacter(); %>
                        
                               <p><%=PCobj.Print_200_Characters(PostDescription.peek())%></p>
                          
                              <div class="flex justify-end items-center">
                              
                              <% String take5 = "show_more_modal_"+PostDescription.size()+".showModal()"; %>
                              <% String take6 = "show_more_modal_"+PostDescription.size(); %>
                                  <span onclick=<%=take5%>
                                      class="px-3 py-2 bg-[#F2F2F2] rounded-xl cursor-pointer hover:bg-[#E5E5E5]">See
                                      more</span>
                                  <!-- See More Modal -->
                                  <dialog id=<%=take6%> class="modal w-[100vw] h-[100vh]">
                                      <div class="modal-box max-w-[90vw] max-h-[70vh] w-full h-auto lg:w-auto">
                                          <form method="dialog">
                                              <button class="btn btn-sm btn-circle btn-error text-white absolute right-2 top-2">X</button>
                                          </form>
                                         <p class="text-justify mt-4 text-[24px]"><%=PostDescription.pop()%></p>
                                      </div>
                                  </dialog>
                              </div>
                          </div>
                      </div>
                  </div>
                  
                  
                  
                  
                  <% }  %>
                    <!-- Post1 end -->
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    

    
    <!-- Start of Footer -->
    <div class='flex justify-between gap-0'>
        <div class='hidden md:flex flex-col items-center justify-center gap-3 border-[1px] p-8 min-w-[250px]'>
            <h3 class='text-[18px] text-center font-semibold uppercase'>Links</h3>
            <a href='Home.jsp' class='text-[16px] text-[#868686] hover:text-black transition duration-500'>Home</a>
            <a href='Shelter_and_Areas.jsp'
                class='text-[16px] text-[#868686] hover:text-black transition duration-500'>Shelters</a>
            <a href='Social.jsp'
                class='text-[16px] text-[#868686] hover:text-black transition duration-500'>Social</a>
            <a href='Faq.jsp' class='text-[16px] text-[#868686] hover:text-black transition duration-500'>FAQ</a>
        </div>

        <div class='flex flex-col items-center justify-center gap-3 border-[1px] p-8 w-full'>
            <a href='Home.jsp'>
                <h1 class="font-extrabold text-5xl text-amber-600">edms<span class="text-red-500">.</span></h1>
            </a>
            <h3 class='text-[16px] text-[#7B7B7B] text-center'>EDMS - Your comprehensive resource for shelter,
                assistance, and information during times of crisis</h3>
            <h3 class='text-[16px] text-[#868686] text-center'>&copy; 2023 EDMS. All rights reserved.</h3>
        </div>

        <div class='hidden md:flex flex-col items-center justify-center gap-3 border-[1px] p-8 min-w-[250px]'>
            <h3 class='text-[18px] text-center font-semibold uppercase'>Help</h3>
            <a href='/' class='text-[16px] text-[#868686] hover:text-black transition duration-500'>Terms</a>
            <a href='/' class='text-[16px] text-[#868686] hover:text-black transition duration-500'>Privacy</a>
        </div>
    </div>
    <!-- End of Footer -->


    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
    
    
    
    
    
<!-- ------encodeBlob Function Here -->

 <%!
    String encodeBlobToBase64(Blob blob) {
        try {
        	
            byte[] byteArray = blob.getBytes(1, (int) blob.length());
            byte[] base64Bytes = java.util.Base64.getEncoder().encode(byteArray);
            
            return new String(base64Bytes);
        } catch (Exception e) {
        	System.out.println("exception");
            e.printStackTrace();
            return "";
        }
    }
   %>

    
    
    
    
    
    
    
</body>

</html>