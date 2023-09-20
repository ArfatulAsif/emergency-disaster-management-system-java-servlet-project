<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
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
                    <a href="Social.jsp" class="text-black h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
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
    
    <div class="my-container mb-6">
        
		<h1 class="text-slate-600 font-bold text-[20px] text-center mt-5 mb-3">Frequently Asked Questions</h1>
		
		<div class="flex flex-col gap-3">
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" checked="checked" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q1: What is the purpose of the Emergency Disaster Management System (EDMS)?
			  </div>
			  <div class="collapse-content"> 
			    <p>A1: The EDMS is designed to provide real-time insights into critical areas during emergencies in Bangladesh. It empowers government officials, volunteer groups, and individuals to coordinate, share information, and take swift actions to mitigate disaster impacts.</p></p>
			  </div>
			</div>
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q2: How can I get involved as a government official?
			  </div>
			  <div class="collapse-content"> 
			    <p>A2: If you're a government official at the City Corporation, Union Parishad, or Zilla Parishad levels, you will automatically receive an account upon which you can input vital information about your area. Your input will be given priority within the system to aid disaster response efforts.</p>
			  </div>
			</div>
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q3: Can volunteer organizations participate in disaster management efforts through EDMS?
			  </div>
			  <div class="collapse-content"> 
			    <p>A3:  Absolutely! Volunteer organizations and charitable funds can create accounts on the EDMS platform. They can log their service history and provide vital on-ground information during disaster situations to enhance coordination and response effectiveness.</p>
			  </div>
			</div>
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q4: How can I sign up as an individual on the EDMS platform?
			  </div>
			  <div class="collapse-content"> 
			    <p>A4: Signing up as an individual is simple. Just navigate to the registration page and provide your details. Once registered, you can contribute real-time updates about your local area and request assistance when needed.</p>
			  </div>
			</div>
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q5: What types of disasters does the EDMS cover?
			  </div>
			  <div class="collapse-content"> 
			    <p>A5: The EDMS is designed to handle a wide range of disasters, including natural disasters like floods, cyclones, and earthquakes, as well as man-made disasters such as fires and industrial accidents.</p>
			  </div>
			</div>
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q6:  Can I view critical areas and information without registering?
			  </div>
			  <div class="collapse-content"> 
			    <p>A6: Yes, non-registered users can access critical area information on the EDMS platform. While they cannot use social features or post information, this feature ensures widespread awareness and understanding during disaster situations.</p>
			  </div>
			</div>
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q7:  How often is the critical information updated on the platform?
			  </div>
			  <div class="collapse-content"> 
			    <p>A7: The critical information is updated in real time. The system continuously collects and displays the latest data about disaster-affected areas, individuals in distress, and ongoing relief efforts.</p>
			  </div>
			</div>
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q8: How does the EDMS ensure the accuracy of the information provided?
			  </div>
			  <div class="collapse-content"> 
			    <p>A8: The EDMS encourages individuals and organizations to provide firsthand information, ensuring accuracy in disaster assessments. Additionally, government officials and volunteer groups verify and contribute to the information, enhancing its reliability.</p>
			  </div>
			</div>
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q9:  Is the EDMS accessible during power outages or network disruptions?
			  </div>
			  <div class="collapse-content"> 
			    <p>A9: The EDMS is designed to be accessible on various devices, including mobile phones. However, network disruptions during disasters might impact connectivity. It's recommended to have alternative means of communication during emergencies.</p>
			  </div>
			</div>
			<div class="collapse collapse-arrow bg-base-200">
			  <input type="radio" name="my-accordion-2" /> 
			  <div class="collapse-title text-xl font-medium">
			    Q10: How can I report a technical issue or suggest improvements for the EDMS platform
			  </div>
			  <div class="collapse-content"> 
			    <p>A10: You can reach out to our technical support team through the "Contact Us" section on the platform. We welcome feedback and are committed to continuously improving the EDMS based on user suggestions.</p>
			  </div>
			</div>
		</div>
        
        <!-- Add more FAQ items as needed -->
    </div>
    
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
</body>
</html>