<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
   
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
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edms" , "root","HaMiM1234kHaN");
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
   
   %>

<!DOCTYPE html>
<html>
<head>
  <title>Emergency Disaster Management System</title>
  <link rel="stylesheet" href="CSS/Profile.css" />
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

<body>

<!-- JavaScript Code -->

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
    	  var DistrictSelect = document.getElementById("DistrictSelectS");
    	  var UpazillaSelect = document.getElementById("UpazillaSelectS");
    	  var UnionSelect = document.getElementById("UnionSelectS");
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
              <h1 class="font-extrabold text-5xl text-amber-500">
                edms<span class="text-red-500">.</span>
              </h1>
            </a>
          </div>

          <!-- Form -->
          <form class="my-5 max-w-[800px] mx-auto" action="Registration" method="post" enctype="multipart/form-data">
            <!-- Individual / Volunteer Name -->
            <label class="label">
              <span class="label-text">Individual / Volunteer Group Name</span>
            </label>
            <input name="Name" type="text" class="input input-bordered w-full" required/>
            <!-- Username -->
            <label class="label">
              <span class="label-text">Username</span>
            </label>
            <input name="Username" type="text" class="input input-bordered w-full" required/>
            <!-- Email -->
            <label class="label">
              <span class="label-text">Email</span>
            </label>
            <input name="Email" type="email" class="input input-bordered w-full" required/>
            <!-- Password -->
            <label class="label">
              <span class="label-text">Password</span>
            </label>
            <input
              name="password1"
              type="password"
              class="input input-bordered w-full"required
            />
            <!-- Re-enter password -->
            <label class="label">
              <span class="label-text">Re-enter Password</span>
            </label>
            <input
              name="password2"
              type="password"
              class="input input-bordered w-full" required
            />
            <!-- select type -->
            <label class="label">
              <span class="label-text">Select User Type</span>
            </label>
            <select class="select select-bordered w-full"  name="TypeSelect"required>
              <option disabled selected>Pick one</option>
              <option>Individual</option>
              <option>Volunteer Group</option>
            </select>
            <!-- select district -->
            <label class="label">
              <span class="label-text">Select District</span>
            </label>
            <select id="DistrictSelectS"class="select select-bordered w-full"name="Districtitem" required>
              <option disabled selected>Add District</option>
              
            </select>
            
            <!-- Select District js -->
            
            <script>
					    document.getElementById("DistrictSelectS").addEventListener("change", function() {
					        var selectElement = document.getElementById("DistrictSelectS");
					        var selectOption = selectElement.options[selectElement.selectedIndex];
					        
					        var selectedText = selectOption.text;
					        
					        // Use AJAX to send selectedText to server
					        fetch("Registration.jsp?jsValue=" + encodeURIComponent(selectedText))
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
            <select id="UpazillaSelectS"class="select select-bordered w-full"name="Upazilaitem" required>
              <option disabled selected>Add Upazilla</option>
              
            </select>
            
            <!-- Select Upazilla js -->
            
            		<script>
					    document.getElementById("UpazillaSelectS").addEventListener("change", function() {
					        var selectElement = document.getElementById("UpazillaSelectS");
					        var selectOption = selectElement.options[selectElement.selectedIndex];
					        
					        var selectedText = selectOption.text;
					        
					        // Use AJAX to send selectedText to server
					        fetch("Registration.jsp?UpValue=" + encodeURIComponent(selectedText))
					        .then(response => response.text())
					        .then(data => {
					        	
					        	 
					        	
					            console.log(data); // Log the response from the server
					        })
					        .catch(error => {
					            console.error("Error:", error);
					        });
					    });
		            </script>
                
		            <%String selectedUpazilla = request.getParameter("UpValue");%>
		             <input type="hidden" name="selectedUpazilla" value="<%= selectedUpazilla %>">
            
            
            <!-- select union -->
            <label class="label">
              <span class="label-text">Select Union</span>
            </label>
            <select id="UnionSelectS"class="select select-bordered w-full"name="Unionitem" required>
              <option disabled selected>Add Union</option>
              
            </select>
            
            <script>
            	const unionSelectDropDown = document.getElementById('UnionSelectS')
            	unionSelectDropDown.addEventListener('change', function(){
            		document.getElementById('selectedUnionHiddenBox').value = unionSelectDropDown.options[unionSelectDropDown.selectedIndex].text
            	})
            </script>
            
            <!-- select Union js -->
            <script>
					     document.getElementById("UnionSelectS").addEventListener("change", function() {
					        var selectElement = document.getElementById("UnionSelectS");
					        var selectOption = selectElement.options[selectElement.selectedIndex];
					        
					        var selectedText = selectOption.text;
					        
					        // Use AJAX to send selectedText to server
					        fetch("Registration.jsp?UnionValue=" + encodeURIComponent(selectedText))
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
					
						/* String aise="null";
						
						if(aise=="null"&& selectedUnion!=null){
						
					 PreparedStatement ps=con.prepareStatement("insert into setloc(Location)values(?)");
					 ps.setString(1,selectedUnion);
					 ps.executeUpdate();
						
						} */
					%>
            
			<input type="hidden" name="selectedUnion" id="selectedUnionHiddenBox" value="selectedUnion">
            <!-- contact no -->
            <label class="label">
              <span class="label-text">Mobile No.</span>
            </label>
            <input name="ContactNo" type="tel" class="input input-bordered w-full" required/>
            <!-- Image upload -->
            <input class="my-4" type="file" id="myFile" name="ImageName" required/>
            <!-- about yourself -->
            <label class="label">
              <span class="label-text">Write Something about yourself or your volunteer group</span>
            </label>
            <textarea
              class="textarea textarea-bordered h-24 w-full" required
              placeholder="Bio" name="Description"
            ></textarea>
			<!-- submit button -->
			<input class="btn btn-warning my-5 w-full" type="submit" value="Submit">
			<p style="color:red;">${message}</p>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>

</html>
