<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.sql.*" %>

<!DOCTYPE html>
<head>
  <title>Emergency Disaster Management System</title>
  <link rel="stylesheet" href="styles/Profile.css" />
  <!-- Tailwind CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- DaisyUI CDN -->
  <link
    href="https://cdn.jsdelivr.net/npm/daisyui@3.7.3/dist/full.css"
    rel="stylesheet"
    type="text/css"
  />
  <!-- Animate.css CDN -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
  <!-- AOS CDN -->
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <!-- Font Awesome -->
  <script
    src="https://kit.fontawesome.com/f13afb77f1.js"
    crossorigin="anonymous"
  ></script>
</head>
<html>
<body>

<!-- Javascript code -->

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
    System.out.println(loggedInUser);
   %>

<script>

var subjectObject = {
    	"Sylhet": {
    		    
    			 "Companiganj": ["Islampur Paschim",
    		    	"Ranikhali Uttar",
    		    	"Telikhal",
    		    	"Islampur Purba",
    		    	"Ichhakalash",
    		    	"Dakshin Ranikhai"],
    		    
    		    "Kanaighat": [
    		    	"Bara Chatul",
    		    	"Dakshin Banigram",
    		    	"Jhingabari",
    		    	"Kanaighat",
    		    	"Paschim Laxmi Prasad",
    		    	"Shatbank",
    		    	"Purba Laxmi Prasad",
    		    	"Purba Dighirpar",
    		    	"Rajaganj"],
    		    	
    		    "Dakshin Surma": [
    		    	"Baraikandi",
    		    	"Daudpur",
    		    	"Jalalpur",
    		    	"Kuchai",
    		    	"Lal Bazar",
    		    	"Mogal Bazar",
    		    	"Mollargaon",
    		    	"Silam",
    		    	"Tetli"],
    		    "Zakiganj": [
    		    	"Barahal",
    		    	"Bara Thakuri",
    		    	"Birasree",
    		    	"Kas Kanakpur",
    		    	"Kajalshah",
    		    	"Kholachhara",
    		    	"Manikpur",
    		    	"Sultanpur",
    		    	"Zakiganj"],
    		    "Sylhet Sadar": [
    		    	"Hatkhola",
    		    	"Jalalabad",
    		    	"Kandigaon",
    		    	"Khadimnagar",
    		    	"Khadim Para",
    		    	"Mogalgaon",
    		    	"Tuker Bazar",
    		    	"Tultikar"],
    		    "Jointiapur": [
    		    	"Charikata",
    		    	"Darbasta",
    		    	"Fatehpur",
    		    	"Jointapur",
    		    	"Nijpat",
    		    	"Chikangul"],
     			 "Gowainghat": [
     				 "Alirgaon",
     				"Fatehpur",
     				"Lengura",
     				"Nandirgaon",
     				"Paschim Jaflong",
     				"Purba Jaflong",
     				"Rustampur",
     				"Towakul",], 
    		    "Fenchuganj": [
    		    	"Fenchuganj",
    		    	"Gilachhara",
    		    	"Maijgaon"], 
     			 "Biswanath": [
     				 "Alankari",
     				"Bishwanath",
     				"Daulatpur",
     				"Deokalas",
     				"Dasghar",
     				"Khazanchi",
     				"Lama Kazi",
     				"Rampasha"], 
    		    "Beanibazar": [
    		    	"Alinagar",
    		    	"Mollahpur",
    		    	"Charkhai",
    		    	"Dubag",
    		    	"Kurar Bazar",
    		    	"Lauta",
    		    	"Mathiura",
    		    	"Muria",
    		    	"Sheola",
    		    	"Tilpara"], 
     			 "Balaganj": [
     				 "Balaganj",
     				"Boaljur",
     				"Buronga Bazar",
     				"Dayamir",
     				"Dewan Bazar",
     				"Goal Bazar",
     				"Omarpur",
     				"Osmanpur",
     				"Pashchim Gauripur",
     				"Purba Pawlanpur",
     				"Purba Gauripur",
     				"Sadipur",
     				"Tajpur",
     				"Pashchim Pawlanpur"], 
      			"Golapganj": [
      				"Paschim Amura",
      				"Bagha",
      				"Bhadeshwar",
      				"Badhubari",
      				"Dhaka Dakshin",
      				"Fulbari",
      				"Golabganj",
      				"Laxmi Pasha",
      				"Sharifganj",
      				"Lakshanaband",
      				"Uttar Bade Pasha"]
      
    		  },
   "Moulvibazar": {
	  
    		  "Kulaura": [
    			  "Baramchal",
    			  "Bhatera",
    			  "Bhakshimail",
    			  "Bramhan Bazar",
    			  "Hajipur",
    			  "Joychandi",
    			  "Kadirpur",
    			  "Karmadha",
    			  "Kulaura",
    			  "Prithempasha",
    			  "Routhgaon",
    			  "Sharifpur",
    			  "Tilagaon"],
    		    "Kamalganj": [
    		    	"Adampur",
    		    	"Alinagar",
    		    	"Islampur",
    		    	"Kamalganj",
    		    	"Madhabpur",
    		    	"Munshi Bazar",
    		    	"Patanushar",
    		    	"Rahimpur",
    		    	"Shamshernagar"],
    		     "Moulvibazar Sadar": [
    		    	 "Akhailkura",
    		    	 "Amtail",
    		    	 "Chandnighat",
    		    	 "Ekatuna",
    		    	 "Giasnagar",
    		    	 "Kamalpur",
    		    	 "Kanakpur",
    		    	 "Khalilpur",
    		    	 "Manumukh",
    		    	 "Mostafapur",
    		    	 "Nazirabad",
    		    	 "Kagabala"],
    		     "Rajnagar": [
    		    	 "Fatehpur",
    		    	 "Kamar Chak",
    		    	 "Mansurnagar",
    		    	 "Munshi Bazar",
    		    	 "Panchgaon",
    		    	 "Rajnagar",
    		    	 "Tengra",
    		    	 "Uttarbhag"],
    		     "Sreemangal": [
    		    	 "Ashidron",
    		    	 "Bhunabir",
    		    	 "Kashipur",
    		    	 "Kalighat",
    		    	 "Mirzapur",
    		    	 "Rajghat",
    		    	 "Satgoan",
    		    	 "Sindurkhan",
    		    	 "Sreemangal"],
    		     "Juri": [
    		    	 "Paschim Juri",
    		    	 "Purba Juri",
    		    	 "Fultala",
    		    	 "Goalbari",
    		    	 "Jaifarnagar",
    		    	 "Sagarnal"],
    		     "Barlekha": [
    		    	 "Baralekha",
    		    	 "Barni",
    		    	 "Dakshin Shahabajpur",
    		    	 "Dakshin Dakshinbhagh",
    		    	 "Dasher Bazar",
    		    	 "Nij Bahadurpur",
    		    	 "Sujanagar",
    		    	 "Uttar Dakshinbhag",
    		    	 "Uttar Shahabajpur",
    		    	 "Talimpur"]
    		  }
    }
      
      
      window.onload = function()
      {
    	  var DistrictSelect = document.getElementById("DistrictSelect");
    	  var UpazillaSelect = document.getElementById("UpazillaSelect");
    	  var UnionSelect = document.getElementById("UnionSelect");
    	  for(var x in subjectObject )
    		  {
    		   		DistrictSelect.options[DistrictSelect.options.length] = new Option(x,x);
    		  }
    	  
    	  DistrictSelect.onchange = function()
    	  {
    		  UpazillaSelect.length = 1;
    		  UnionSelect.length = 1;
    		  
    		  for(var y in subjectObject[this.value])
    			  {
    			  		UpazillaSelect.options[UpazillaSelect.options.length] = new Option(y,y);
    			  }
    	  }
    	  
    	  UpazillaSelect.onchange = function()
    	  {
    		  UnionSelect.length = 1;
    		  
    		  var z = subjectObject[DistrictSelect.value][this.value];
    		  for(var i =0;i<z.length;i++)
    			  {
    			  		UnionSelect.options[UnionSelect.options.length] = new Option(z[i],z[i]);
    			  }
    		  
    	  }
    	  
      }
</script>


  <div class="bg-white">
    <div class="lg:min-h-screen">
      <div class="flex items-center justify-center px-5 py-5">
        <div class="w-full mx-auto">
          <div class="relative mt-1 block text-center">
            <a href="Home.jsp">
              <h1 class="font-extrabold text-5xl text-black">
                edms<span class="text-red-500">.</span>
              </h1>
            </a>
          </div>

          <!-- Form -->
          <form
            class="my-5 max-w-[800px] mx-auto"
            action="AddLocation"
            method="post"
            enctype="multipart/form-data"
          >
            <!-- Relief shelters / area name -->
            <label class="label">
              <span class="label-text"
                >Type your relief shelter / areas name</span
              >
            </label>
            <input
              name="loc-name"
              type="text"
              class="input input-bordered w-full"
              required
            />
            <!-- Relief Center or Location -->
            <select
              class="my-5 select select-bordered w-full"
              name="loc-type"
              required
            >
              <option>Relief Center</option>
              <option>Location</option>
            </select>
            <!-- write your post here -->
            <label class="label">
              <span class="label-text">Write your post here.</span>
            </label>
            <textarea
              class="textarea textarea-bordered h-24 w-full"
              required
              placeholder=""
              name="loc-des"
            ></textarea>
            <!-- Add two photos of shelter -->
            <label class="label">
              <span class="label-text"
                >Add 2 photos of relief shelter / areas:</span
              >
            </label>
            <input
              class="my-4"
              type="file"
              id="myFile"
              name="loc-p1"
              required
            />
            <input
              class="my-4"
              type="file"
              id="myFile"
              name="loc-p2"
              required
            />

            <!-- Affected people info -->
            <label class="label">
              <span class="label-text">Affected people info:</span>
            </label>
            <div class="flex flex-col gap-2 p-1">
              <input type="number" name="loc-am" id="male" placeholder="Male" />
              <input
                type="number"
                name="loc-af"
                id="female"
                placeholder="Female"
              />
              <input
                type="number"
                name="loc-ac"
                id="children"
                placeholder="Children"
              />
            </div>

            <!-- contact info -->
			<label class="label">
				<span class="label-text">Mobile No.</span>
			  </label>
			  <input
				name="loc-cont"
				type="tel"
				class="input input-bordered w-full"
				required
			  />
			  <!-- Add your relief / shelter location: -->
			  	<!-- select district -->
				  <label class="label">
					<span class="label-text">Select District</span>
				  </label>
				  <select id="DistrictSelect"
					class="select select-bordered w-full"
					name="Districtitem"
					required
				  >
					<option disabled selected>Add District</option>
					
				  </select>
				  
				  <!-- select District js -->
				  <script>
					    document.getElementById("DistrictSelect").addEventListener("change", function() {
					        var selectElement = document.getElementById("DistrictSelect");
					        var selectOption = selectElement.options[selectElement.selectedIndex];
					        
					        var selectedText = selectOption.text;
					        
					        // Use AJAX to send selectedText to server
					        fetch("AddLocation.jsp?jsValue=" + encodeURIComponent(selectedText))
					        .then(response => response.text())
					        .then(data => {
					            console.log(data); // Log the response from the server
					        })
					        .catch(error => {
					            console.error("Error:", error);
					        });
					    });
					</script>
                
			   <%
			   String selectedDistrict = request.getParameter("jsValue");%>
			   <input type="hidden" name="selectedDistrict" value="<%= selectedDistrict %>">
				  
				  <!-- select upazila -->
				  <label class="label">
					<span class="label-text">Select Upazilla</span>
				  </label>
				  <select id="UpazillaSelect"
					class="select select-bordered w-full"
					name="Upazilaitem"
					required
				  >
					<option disabled selected>Add Upazilla</option>
					
				  </select>
				  
				  <!-- select upazilla js -->
				  <script>
					    document.getElementById("UpazillaSelect").addEventListener("change", function() {
					        var selectElement = document.getElementById("UpazillaSelect");
					        var selectOption = selectElement.options[selectElement.selectedIndex];
					        
					        var selectedText = selectOption.text;
					        
					        // Use AJAX to send selectedText to server
					        fetch("AddLocation.jsp?UpValue=" + encodeURIComponent(selectedText))
					        .then(response => response.text())
					        .then(data => {
					        	
					            console.log(data); // Log the response from the server
					        })
					        .catch(error => {
					            console.error("Error:", error);
					        });
					    });
		</script>
                
		  <%
						    
			                String selectedUpazilla = request.getParameter("UpValue");%>
				  
				  <!-- select union -->
				  <label class="label">
					<span class="label-text">Select Union</span>
				  </label>
				  <select id="UnionSelect"
					class="select select-bordered w-full"
					name="Unionitem"
					required
				  >
					<option disabled selected>Add Union</option>
					
				  </select>
				  
				  <!-- select union js -->
				  <script>
					     document.getElementById("UnionSelect").addEventListener("change", function() {
					        var selectElement = document.getElementById("UnionSelect");
					        var selectOption = selectElement.options[selectElement.selectedIndex];
					        
					        var selectedText = selectOption.text;
					        
					        // Use AJAX to send selectedText to server
					        fetch("AddLocation.jsp?UnionValue=" + encodeURIComponent(selectedText))
					        .then(response => response.text())
					        .then(data => {
					        	
					        	 
					        	
					            console.log(data); // Log the response from the server
					        })
					        .catch(error => {
					            console.error("Error:", error);
					        });
					    });
					     
					</script>
					
					<%
						    
					String selectedUnion = request.getParameter("UnionValue");
					
					
					%>
				  
				  <input type="hidden" id="selectedUnionHiddenBox" name="selectedUnion" value=<%=selectedUnion %> />
				  
				  <script>
				  	const unionSelectDropDown = document.getElementById('UnionSelect')
	            	unionSelectDropDown.addEventListener('change', function(){
	            		document.getElementById('selectedUnionHiddenBox').value = unionSelectDropDown.options[unionSelectDropDown.selectedIndex].text
	            	})
				  </script>
				  
				  
				  <!-- Google map url -->
				  <label class="label">
					<span class="label-text"
					  >Give your relief shelter / areas Google-map URL</span
					>
				  </label>
				  
				  <input
					name="loc-link"
					type="text"
					class="input input-bordered w-full"
					required
				  />
				  <input class="btn btn-warning my-5 w-full" type="submit" value="Submit">
				  <p style="color:red;">${message}</p>


          </form>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
