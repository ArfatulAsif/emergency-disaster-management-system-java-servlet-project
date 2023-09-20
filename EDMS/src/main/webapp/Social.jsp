<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
    <%@page import="java.lang.Math" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.util.Locale" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="JavaFiles.*"%>
    <%@page import="JavaFiles.Pair"%>
    <%@page import="JavaFiles.divisions"%>
    <%@page import="JavaFiles.PrintCharacter"%>
    
<!DOCTYPE html>
<html>

<head>
    <title>Emergency Disaster Management System</title>
    <link rel="stylesheet" href="CSS/Social.css">
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

<!-- JAVA CODE HERE -->

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
    
 
 String query9 = "SELECT * FROM registrationinfo WHERE Username = '"+loggedInUser+"'";



      Statement stmt9;
      String Image=null;
     try 
    	{
    		stmt9 = con.createStatement();
    		ResultSet rs = stmt9.executeQuery(query9);
    		while(rs.next())
    		{
          
          Image="data:image/gif;base64,"+encodeBlobToBase64(rs.getBlob("Image"));
    			
    		}
    
	     }
     	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    
    
    /**/
    
   
        Statement stmtm;
		String selectedUnion=null;
		try {
			stmtm=con.createStatement();
			ResultSet rss=stmtm.executeQuery("select * from registrationinfo where Username = '"+loggedInUser+"'");
			
			while(rss.next()) {
				selectedUnion=rss.getString("Location");
			}
			
		}catch(Exception e) {
			
		}
		
		 String query14 = "SELECT * FROM bangladesh where Unionn = '"+selectedUnion+"'";

         String selectedDistrict = null;
         String selectedUpazilla = null;
         

         Statement stmt14;
         try 
        {
              stmt14 = con.createStatement();
              ResultSet rs1 = stmt14.executeQuery(query14);
              while(rs1.next())
              {
                selectedDistrict = rs1.getString("District");
                selectedUpazilla = rs1.getString("Upazila");
              }
     
         }
        catch(Exception e)
        {
        		e.printStackTrace();
        }
      

    divisions obj = new divisions();
        
    obj.make();
        
    String myDiv = selectedDistrict;
    
    System.out.println(myDiv);
    System.out.println("---------------------------");
    
    if(myDiv==null)
    {
    	myDiv = "Sylhet";
    }
        
    Map<Double, String> sortedMap = new TreeMap<>();
        
    for (Map.Entry<String, Pair> x : obj.divisionCoordinates.entrySet())
    {
         double val = obj.haversineDistance(obj.divisionCoordinates.get(myDiv).First ,obj.divisionCoordinates.get(myDiv).second , x.getValue().First , x.getValue().second );
            
        sortedMap.put(val , x.getKey());
    }
    Date currentDate = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("h:mma dd MMM, yyyy", Locale.ENGLISH);
	String formattedDateTime = dateFormat.format(currentDate);
    Date date = dateFormat.parse(formattedDateTime);
	long secondsSinceEpoch = date.getTime() / 1000;

    ArrayList<String>Date = new ArrayList();
    ArrayList<String>Name = new ArrayList();
    ArrayList<String>Verified =new ArrayList();
    ArrayList<String>Username = new ArrayList();
    
    ArrayList<Integer>Affected= new ArrayList();
    ArrayList<String>PostPhoto1 = new ArrayList();
    ArrayList<String>PostPhoto2 = new ArrayList();
    ArrayList<String>Description = new ArrayList();
    
    ArrayList<String>Unionn = new ArrayList();
    ArrayList<String>Upazila = new ArrayList();
    ArrayList<String>District = new ArrayList();
        
    for(int j=0;j<20;j++)
    {
    	 for(Map.Entry<Double , String> x: sortedMap.entrySet())
    	    {
    	            //System.out.println(x.getValue());
    				 long xx=secondsSinceEpoch-86400*(j+1);
                     long yy=secondsSinceEpoch-86400*(j);
                     
                    
    				
                     String query = "SELECT * FROM post_added WHERE District = '"+x.getValue()+"' AND Second >= "+xx+" AND Second < "+yy+" order by Second Desc";

    	            Statement stmt;
    	            try 
    	             {
    	                 stmt = con.createStatement();
    	                 ResultSet rs = stmt.executeQuery(query);
    	                 while(rs.next())
    	                 {
    	                      String District1 = rs.getString("District");
    	                      String Upazilla1 = rs.getString("Upazilla");
    	                      String Unionn1 = rs.getString("Unionn");
    	                      
    	                      
    	                      Unionn.add(Unionn1);
    	                      Upazila.add(Upazilla1);
    	                      District.add(District1);
    	                      
    	                      
    	                      String Date1 = rs.getString("Date");
    	                      Date.add(Date1);
    	                      String Username1 = rs.getString("Username");
    	                      Username.add(Username1);

    	                      int Affected1 = rs.getInt("Affected");
    	                      Affected.add(Affected1);

    	                      String PostPhoto11="data:image/gif;base64,"+encodeBlobToBase64(rs.getBlob("Photo1"));
    	                      //System.out.println("1st "+PostPhoto11);
    	                      String PostPhoto21="data:image/gif;base64,"+encodeBlobToBase64(rs.getBlob("Photo2"));
    	                      PostPhoto1.add(PostPhoto11);
    	                      PostPhoto2.add(PostPhoto21);

    	                      String Description1 = rs.getString("Description");
    	                      Description.add(Description1);
    	                      
    	                      String Name1=rs.getString("Name");
    	                      Name.add(Name1);

    	                        String Verified1 = null;
    	                        String query1 = "SELECT * FROM verified WHERE Username = '"+Username+"'";
    	                        Statement stmt1;
    	                        try 
    	                        {
    	                            stmt1 = con.createStatement();
    	                            ResultSet rs1 = stmt1.executeQuery(query1);
    	                            while(rs1.next())
    	                            {
    	                                Verified1 = rs1.getString("Username");
    	                            }

    	                        }
    	                        catch(Exception e)
    	                        {

    	                        }
    	                    
    	                    Verified.add(Verified1);

    	                      


    	                      

    	                 }
    	        
    	             }
    	             catch(Exception e)
    	            {
    	                e.printStackTrace();
    	            }


    	    }
    }
    


%>



<!-- JAVA CODE END HERE  -->


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
                    <a href="Home.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Home</a>
                    <a href="Shelter_and_Areas.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Shelters & Areas</a>
                    <a href="Social.jsp" class="text-white h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Social</a>
                    <!-- active link style -->
                    <a href="Faq.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                hover:text-white transition duration-500">FAQ</a>
                </div>

                <!-- user icon  -->
                <div class="flex justify-center items-center text-[18px]">
                    <div class="tooltip tooltip-left" data-tip="Profile">
                        <a href="Profile.jsp" class="hover:text-white transition duration-300">
                            <i class="fa-regular fa-circle-user"></i>
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
                                    class="text-[40px] text-[#F17829] block border-b-[1px] p-3 hover:text-[#F17829] transition duration-500">Social</a>
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
                    <a href="Profile.jsp" class="hover:text-[#F17829] transition duration-300">
                        <i class="fa-regular fa-circle-user text-[40px]"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Navbar -->

    <!-- Start of Posts section -->
    <div class="my-container my-6">
        <h2 class="text-xl font-bold text-[#F17829] sm:text-2xl text-center my-3">Latest Updates</h2>









        <!-- All posts below -->
        <div class="flex flex-col gap-5 overflow-hidden">
            
            
            <!-- TODO: Start for loop here -->
            
        <%    
        for(int i=0;i<Date.size();i++)
        {    
          
        %>

            <div data-aos="fade-right" class="bg-[#d9d9d9] p-3 md:p-5 rounded-xl">
                <div class="flex flex-col md:flex-row gap-3 justify-between">
                    <div class="flex gap-3">
                        <!-- TODO: if verified then show badge -->
                        <%
                        if(Verified.get(i)!=null)
                        {
                        %>
                        
                        <img class="h-full w-auto" src="IMAGES/badge-2.png" alt="verified">
                        
                       <%} %>
                       
                        <div>
                        <% 
                       if(Affected.get(i)!=-1) 
                       {
                        %>
                            <h1 class="text-[16px] font-bold"><a href="Location_Profile.jsp?LocationUsernameFromShelterPage=<%=Username.get(i)%>"><%=Name.get(i)%></a> </h1>
                         
                     <% } %>
                     
                      <% 
                     if(Affected.get(i)==-1) 
                       {
                        %>
                            <h1 class="text-[16px] font-bold">  <a href ="People_Profile.jsp?PeopleUsernameFromSocialPage=<%=Username.get(i)%>"> <%=Name.get(i) %></a>  </h1>
                         
                     <% } %>
                            
                            <h3 class="text-[15px]"><%=Date.get(i)%></h3>
                        </div>
                    </div>
                    <!-- TODO: implement conditional rendering -->
                    
                    <% 
                    if(Affected.get(i)!=-1) 
                    {
                    %>       
                    <div class="badge badge-ghost text-[18px] p-3 border-1 border-black">Affected People: <%=Affected.get(i)%></div>
           
                    <%} %>
                    
                    
                </div>
                <div class="my-2 text-[15px] flex gap-1 items-center">
                    <i class="fa-solid fa-location-dot"></i>
                    <div class="badge badge-ghost"><%=Unionn.get(i)%></div>
                    <div class="badge badge-ghost"><%=Upazila.get(i)%></div>
                    <div class="badge badge-ghost"><%=District.get(i)%></div>
                </div>
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-5">
                    <div class="grid grid-cols-2 lg:flex gap-2">
                    
                  
                  
                    <%  String take1 = "img_modal_"+i+"_1.showModal()"; %>
                        <img onclick=<%=take1%>
                            class="center-cropped max-h-[200px] cursor-pointer lg:w-[50%] rounded-xl w-full"
                            src=<%=PostPhoto1.get(i)%> alt="">
                        <!-- image-1 modal -->
                        <%  String take2 = "img_modal_"+i+"_1"; %>
                        
                        <dialog id=<%=take2%> class="modal w-[100vw]">
                            <div class="modal-box max-w-[90vw] w-full lg:w-auto">
                                <form method="dialog">
                                    <button class="btn btn-sm btn-circle btn-error text-white absolute right-2 top-2">X</button>
                                </form>
                                <div class="flex justify-center items-center">
                                    <img class="rounded-xl" src=<%=PostPhoto1.get(i)%> alt="">
                                </div>
                            </div>
                        </dialog>
                        
                           <%  String take3 = "img_modal_"+i+"_2.showModal()"; %>
                        <img onclick=<%=take3%>
                            class="center-cropped max-h-[200px] cursor-pointer lg:w-[50%] rounded-xl w-full"
                            src=<%=PostPhoto2.get(i)%> alt="">
                        <!-- image-1 modal -->
                        <%  String take4 = "img_modal_"+i+"_2"; %>
                        
                        <dialog id=<%=take4%> class="modal w-[100vw]">
                            <div class="modal-box max-w-[90vw] w-full lg:w-auto">
                                <form method="dialog">
                                    <button class="btn btn-sm btn-circle btn-error text-white absolute right-2 top-2">X</button>
                                </form>
                                <div class="flex justify-center items-center">
                                    <img class="rounded-xl" src=<%=PostPhoto2.get(i)%> alt="">
                                </div>
                            </div>
                        </dialog>
                        
                    </div>

                    <div class="post-description flex flex-col justify-between">
                        
                        <!-- show 30 words -->
                        
                        <%  PrintCharacter PCobj = new PrintCharacter(); %>
                        
                        <p><%=PCobj.Print_200_Characters(Description.get(i))%></p>
                    
                        <div class="flex justify-end items-center">
                        
                           <% String take5 = "show_more_modal_"+i+".showModal()";%>
                           
                            <span onclick=<%=take5%>
                                class="px-3 py-2 bg-[#F2F2F2] rounded-xl cursor-pointer hover:bg-[#E5E5E5]">See
                                more</span>
                            <!-- See More Modal -->
                            
                            <% String take6 = "show_more_modal_"+i; %>
                            
                            <dialog id=<%=take6%> class="modal w-[100vw] h-[100vh]">
                                <div class="modal-box max-w-[90vw] max-h-[70vh] w-full h-auto lg:w-auto">
                                    <form method="dialog">
                                        <button class="btn btn-sm btn-circle btn-error text-white absolute right-2 top-2">X</button>
                                    </form>
                                    <p class="text-justify mt-4 text-[24px]"><%=Description.get(i)%></p>
                                </div>
                            </dialog>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <% } %>
            
            <!-- loop end here -->









        </div>

    </div>
    <!-- End of Posts section -->

    <!-- Start of Footer -->
    <div class='flex justify-between gap-0'>
        <div class='hidden md:flex flex-col items-center justify-center gap-3 border-[1px] p-8 min-w-[250px]'>
            <h3 class='text-[18px] text-center font-semibold uppercase'>Links</h3>
            <a href='Home.jsp' class='text-[16px] text-[#868686] hover:text-black transition duration-500'>Home</a>
            <a href='Shelter_and_Areas.jsp'
                class='text-[16px] text-[#868686] hover:text-black transition duration-500'>Shelters</a>
            <a href='Social.jsp' class='text-[16px] text-[#868686] hover:text-black transition duration-500'>Social</a>
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