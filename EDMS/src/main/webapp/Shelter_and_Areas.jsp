<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
    <!-- 
    <title>Emergency Disaster Management System-Shelter & Areas</title>
        <link rel="stylesheet" href = "CSS/Shelter_and_areas.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    
     -->
        
    	<title>Emergency Disaster Management System</title>
	    <link rel="stylesheet" href="CSS/Home.css">
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
      
//       print data
	fetch('http://localhost:8080/EDMS/DataServlet')
	.then(res => res.json())
	.then(data => {
		const table = document.getElementById('data_table');
		const verifiedIcon = `
			<img src="IMAGES/badge-2.png" class="max-h-[30px] max-w[30px]]" />
		`
		const activeBadge = `<div class="badge badge-accent">Active</div>`
		const inactiveBadge = `<div class="badge badge-warning">Inactive</div>`
		const criticalBadge = `<div class="badge badge-error">Critical Help Needed</div>`

		
		
		let table_html = ''
		
		table_html += `
			<tr class="dat_tab">
		        <th class="dat1"></th>
		        <th class="dat2">Name</th>
		        <th class="dat3">Type</th>
		        <th class="dat4">Activity</th>
		    </tr>  
		`;
		
		const verifiedList = data[0]
		const nameList = data[1]
		const typeList = data[2]
		const activityList = data[3]
		const distList = data[4]
		const upaList = data[5]
		const unionList = data[6]
		const userList = data[7]
// 		console.log(verifiedList)
		
		for(let i=0; i<verifiedList.length; i++){
			table_html += '<tr  class="dat_tab hover:bg-slate-200" data-aos="fade-right">';
			
			if(verifiedList[i] == null) {				
				table_html += '<td class="dat1">' + '</td>';
			}
			else {
				table_html += '<td class="dat1">' + verifiedIcon + '</td>';
			}
			
			
			table_html = table_html + '<td class="dat2"><a href="Location_Profile.jsp?LocationUsernameFromShelterPage='+userList[i]+ '"class="hover:text-red-500">' + nameList[i] + '</a></td>';
				
				
			table_html += '<td class="dat3">' + typeList[i] + '</td>';
			
			if(activityList[i] === 'Active'){
				table_html += '<td class="dat4">' + activeBadge +'</td>';
			}
			else if(activityList[i] === 'Inactive'){
				table_html += '<td class="dat4">' + inactiveBadge +'</td>';
			}
			else {
				table_html += '<td class="dat4">' + criticalBadge +'</td>';
			}
			
			
			table_html += '</tr>'
		}
		
		table.innerHTML = table_html;
		
		console.log(data)
	})
// 
      
      
      
      window.onload = function()
      {
    	  const DistrictSelect = document.getElementById("DistrictSelect");
    	  const UpazillaSelect = document.getElementById("UpazillaSelect");
    	  const UnionSelect = document.getElementById("UnionSelect");
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
                    <a href="Shelter_and_Areas.jsp" class="text-white h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Shelters & Areas</a>
                    <a href="Social.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
                    hover:text-white transition duration-500">Social</a>
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
                                    class="text-[40px] text-[#F17829] block border-b-[1px] p-3 hover:text-[#F17829] transition duration-500">Homepage</a>
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
                    <a href="Profile.jsp" class="hover:text-[#F17829] transition duration-300">
                        <i class="fa-regular fa-circle-user text-[40px]"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Navbar -->

	<div class="my-container">
		<!-- Search Bar -->
		<div class="my-6 p-3 grid grid-cols-1 md:grid-cols-3 justify-center items-center gap-3">
			<div class="flex flex-col lg:flex-row justify-center items-center gap-2">	
				<label class="Label" for="itemSelect"><span class="label-text font-bold text-orange-500">District: </span></label>
                <select class="w-full lg:w-auto lg:grow select select-bordered" id="DistrictSelect" name="Districtitem">
                	<option value="null">None</option>
                </select>
			</div>
			
			<div class="flex flex-col lg:flex-row justify-center items-center gap-2">	
				<label class="Label" for="itemSelect"><span class="label-text font-bold text-orange-500">Upazilla :</span></label>
                <select class="w-full lg:w-auto lg:grow select select-bordered" class ="dropbox" id="UpazillaSelect" name="Upazilaitem">                              
                 	<option value="null">None</option>
                </select>
			</div>
			<div class="flex flex-col lg:flex-row justify-center items-center gap-2">	
				<label class="Label" for="itemSelect"><span class="label-text font-bold text-orange-500">Union/Ward :</span></label>
                <select class="w-full lg:w-auto lg:grow select select-bordered" id="UnionSelect" name="Unionitem">
                 	<option value="null">None </option>                                             
                </select>
			</div>
		</div>
		<!-- Table -->
		<div class="overflow-x-auto">
		  <table class="table" id="data_table">
		    
		  </table>
		</div>
	</div>


        
        <script>
        	const distComponent = document.getElementById("DistrictSelect");
        	const upazComponent = document.getElementById("UpazillaSelect");
        	const unionComponent = document.getElementById("UnionSelect");

        	
        	function updateTable () {
        		const district = distComponent.options[distComponent.selectedIndex].text;
        		const upazila = upazComponent.options[upazComponent.selectedIndex].text;
        		const union = unionComponent.options[unionComponent.selectedIndex].text;
        		const verifiedIcon = `
        			<img src="IMAGES/badge-2.png" class="max-h-[30px] max-w[30px]]" />
        		`
        		
        		const activeBadge = `<div class="badge badge-accent">Active</div>`
				const inactiveBadge = `<div class="badge badge-warning">Inactive</div>`
				const criticalBadge = `<div class="badge badge-error">Critical Help Needed</div>`

        		
        		let new_table_data = `<tr class="dat_tab">
    		        <th class="dat1"></th>
    		        <th class="dat2"><a href="../Home/Home.html">Name</a></th>
    		        <th class="dat3">Type</th>
    		        <th class="dat4">Activity</th>
    		    </tr>`;
        		
     			fetch('http://localhost:8080/EDMS/DataServlet')
     			.then(res => res.json())
     			.then(data => {
     				console.log(data)
     				const verifiedList = data[0]
     				const nameList = data[1]
     				const typeList = data[2]
     				const activityList = data[3]
     				const distList = data[4]
     				const upaList = data[5]
     				const unionList = data[6]
     				const userList = data[7]
     				//console.log(verifiedList)
     				
     				if(union !== 'None'){
     					for(let i=0; i<verifiedList.length; i++){
     						if(unionList[i] === union){
     							new_table_data = new_table_data + '<tr  class="dat_tab hover:bg-slate-200" data-aos="fade-right">';
     							
     							if(verifiedList[i] == null) {				
     								new_table_data += '<td class="dat1">' + '</td>';
     							}
     							else {
     								new_table_data += '<td class="dat1">' + verifiedIcon + '</td>';
     							}
     							
     							new_table_data = new_table_data + '<td class="dat2"><a href="Location_Profile.jsp?LocationUsernameFromShelterPage='+userList[i]+ '"class="hover:text-red-500">' + nameList[i] + '</a></th>';
     								
     							new_table_data = new_table_data + '<td class="dat3">' + typeList[i] + '</th>';
     							
     							if(activityList[i] === 'Active'){
     								new_table_data += '<td class="dat4">' + activeBadge +'</td>';
     							}
     							else if(activityList[i] === 'Inactive'){
     								new_table_data += '<td class="dat4">' + inactiveBadge +'</td>';
     							}
     							else {
     								new_table_data += '<td class="dat4">' + criticalBadge +'</td>';
     							}
     							
     							new_table_data += '</tr>'
     						}
     					}
     				}
     				else if(upazila !== 'None'){
     					for(let i=0; i<verifiedList.length; i++){
     						if(upaList[i] === upazila){
     							new_table_data = new_table_data + '<tr  class="dat_tab hover:bg-slate-200 data-aos="fade-right"">';
     							
     							if(verifiedList[i] == null) {				
     								new_table_data += '<td class="dat1">' + '</td>';
     							}
     							else {
     								new_table_data += '<td class="dat1">' + verifiedIcon + '</td>';
     							}
     							
     							new_table_data = new_table_data + '<td class="dat2"><a href="Location_Profile.jsp?LocationUsernameFromShelterPage='+userList[i]+ '"class="hover:text-red-500">' + nameList[i] + '</a></th>';
 								
     								
     							new_table_data = new_table_data + '<td class="dat3">' + typeList[i] + '</th>';
     							
     							if(activityList[i] === 'Active'){
     								new_table_data += '<td class="dat4">' + activeBadge +'</td>';
     							}
     							else if(activityList[i] === 'Inactive'){
     								new_table_data += '<td class="dat4">' + inactiveBadge +'</td>';
     							}
     							else {
     								new_table_data += '<td class="dat4">' + criticalBadge +'</td>';
     							}
     							
     							new_table_data += '</tr>'
     						}
     					}
     				}
     				else if(district !== 'None'){
     					for(let i=0; i<verifiedList.length; i++){
     						if(distList[i] === district){
     							new_table_data = new_table_data + '<tr  class="dat_tab hover:bg-slate-200" data-aos="fade-right">';

     							if(verifiedList[i] == null) {				
     								new_table_data += '<td class="dat1">' + '</td>';
     							}
     							else {
     								new_table_data += '<td class="dat1">' + verifiedIcon + '</td>';
     							}
     							
     							new_table_data = new_table_data + '<td class="dat2"><a href="Location_Profile.jsp?LocationUsernameFromShelterPage='+userList[i]+ '"class="hover:text-red-500">' + nameList[i] + '</a></th>';
 								
     								
     							new_table_data = new_table_data + '<td class="dat3">' + typeList[i] + '</th>';
     							
     							if(activityList[i] === 'Active'){
     								new_table_data += '<td class="dat4">' + activeBadge +'</td>';
     							}
     							else if(activityList[i] === 'Inactive'){
     								new_table_data += '<td class="dat4">' + inactiveBadge +'</td>';
     							}
     							else {
     								new_table_data += '<td class="dat4">' + criticalBadge +'</td>';
     							}
     							
     							new_table_data += '</tr>'
     						}
     					}
     				}
     				else {
     					for(let i=0; i<verifiedList.length; i++){
     						//console.log("wow");
     						new_table_data = new_table_data + '<tr  class="dat_tab hover:bg-slate-200" data-aos="fade-right">';
//      						new_table_data = new_table_data + '<td class="dat1">' + verifiedList[i] + '</th>';

						if(verifiedList[i] == null) {				
							new_table_data += '<td class="dat1">' + '</td>';
						}
						else {
							new_table_data += '<td class="dat1">' + verifiedIcon + '</td>';
						}
     							
							new_table_data = new_table_data + '<td class="dat2"><a href="Location_Profile.jsp?LocationUsernameFromShelterPage='+userList[i]+ '"class="hover:text-red-500">' + nameList[i] + '</a></th>';
								
     								
     						new_table_data = new_table_data + '<td class="dat3">' + typeList[i] + '</th>';
     						
     						if(activityList[i] === 'Active'){
     							new_table_data += '<td class="dat4">' + activeBadge +'</td>';
     						}
     						else if(activityList[i] === 'Inactive'){
     							new_table_data += '<td class="dat4">' + inactiveBadge +'</td>';
     						}
     						else {
     							new_table_data += '<td class="dat4">' + criticalBadge +'</td>';
     						}
     							
     						new_table_data += '</tr>'
     					}
     				}
     				
	        		
	     			document.getElementById('data_table').innerHTML = new_table_data
     			})
     			
        	}

        	distComponent.addEventListener('change', updateTable);
        	upazComponent.addEventListener('change', updateTable);
        	unionComponent.addEventListener('change', updateTable);
        </script>
        
        <!-- Start of Footer -->
    <div class='flex justify-between gap-0 mt-6'>
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
</body>
</html>