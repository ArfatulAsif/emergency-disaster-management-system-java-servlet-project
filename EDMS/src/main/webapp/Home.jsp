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
                    <!-- active link style -->
                    <a href="Home.jsp" class="text-white h-full py-5 px-6 border-b-amber-500 hover:border-b-white border-b-[3px]
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

    <!-- Start of Banner -->
    <div class="hero min-h-[500px] bg-base-200">
        <div class="hero-content text-center w-full">
            <div class="w-full md:max-w-[60vw]">
                <h1 class="text-[48px] font-bold animate__animated animate__zoomInDown text-amber-600 text-bol">
                    Emergency
                    Disaster Management System</h1>
                <p class="py-6 animate__animated animate__backInUp">In a world prone to unexpected natural and man-made
                    disasters, the need for efficient and swift emergency response systems cannot be overstated.</p>
                <div class="flex justify-center items-center">
                    <btn onclick="get_started_modal.showModal()"
                        class="cursor-pointer flex gap-2 items-center justify-center transition duration-300 text-white uppercase font-medium text-[12px] sm:text-[14px] bg-amber-600 hover:bg-[#0ec1ae] py-2 sm:py-3 px-5 sm:px-6 rounded-3xl">
                        <span>More Info</span>
                        <i class="fa-solid fa-caret-right"></i>
                    </btn>
                </div>
                <!-- Banner Modal Start -->
                <dialog id="get_started_modal" class="modal">
                    <div class="modal-box">
                        <h3 class="font-bold text-lg">EDMS</h3>
                        <p class="py-4">
                            In a world prone to unexpected natural and man-made disasters, the need for efficient
                            and swift emergency response systems cannot be overstated. Bangladesh's unique
                            geographical and environmental challenges stand as a testament to the importance of
                            effective disaster management. Frequent occurrences of cyclones and prolonged floods in
                            our country severely disrupt the supply chain, leading to significant issues such as
                            widespread starvation in the affected regions. Numerous compassionate individuals,
                            volunteer organizations, and social initiatives step forward with unwavering generosity,
                            extending a helping hand to those affected by offering vital disaster relief and daily
                            essentials. Regrettably, a centralized system to disseminate critical information
                            regarding affected areas and the whereabouts of relief shelters is notably absent. This
                            lack of coordination in relief endeavors results in mismanaged efforts, leading to
                            pockets of persistent starvation while some locations receive multiple rounds of
                            assistance. And considering this, we propose the development of an innovative web
                            application: the "Emergency Disaster Management System" (EDMS).
                        </p>
                        <div class="modal-action">
                            <form method="dialog">
                                <button class="btn">Close</button>
                            </form>
                        </div>
                    </div>
                </dialog>
            </div>
        </div>
    </div>
    <!-- End of Banner -->

    <div class="my-container">

        <!-- Start of Featured Sections -->
        <div class="my-container">
            <div class="max-w-screen-xl px-4 py-8 mx-auto sm:px-6 sm:py-12 lg:px-8">
                <div class="text-center">
                    <h2 class="text-xl font-bold text-amber-600 sm:text-3xl ">
                        Collaborate with EDMS
                    </h2>

                    <p class="w-full mx-auto mt-4 text-gray-500" data-aos="zoom-in">
                        Within the EDMS platform, individuals in need can readily seek assistance, while volunteers can
                        extend their support to others. This bidirectional functionality empowers disaster-affected
                        individuals to request aid efficiently, fostering a sense of community support.
                    </p>
                </div>
            </div>
        </div>

        <div class='my-container fashion-cards-my-container grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-2'>
            <!-- Card-1 -->
            <a data-aos="zoom-in-right" href="Shelter_and_Areas.jsp"
                class="group relative block bg-[#F2F2F2] rounded-tl-lg rounded-br-lagrge rounded-tr-3xl rounded-bl-3xl hover:bg-[#d9d9d9] transition-all duration-300">
                <div class="relative p-4 sm:p-6 lg:p-8">
                    <!-- icon -->
                    <div class="text-center">
                        <i class="fa-solid fa-people-roof text-[40px]"></i>
                    </div>

                    <p class="text-xl font-bold text-slate-900 sm:text-2xl text-center mt-1">Shelters & Areas</p>

                    <div class="mt-8">
                        <!-- <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100"> -->
                        <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100">
                            <p class="text-sm text-slate-800 text-center">
                                Users can search for locations and relief shelters based on different administrative
                                levels,
                                such as district, Upazilas, and union/ward.
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <!-- Card-2 -->
            <a data-aos="zoom-in-right" href="Social.jsp"
                class="delay-200 group relative block bg-[#F2F2F2] rounded-tl-lg rounded-br-lagrge rounded-tr-3xl rounded-bl-3xl hover:bg-[#d9d9d9] transition-all duration-300">
                <div class="relative p-4 sm:p-6 lg:p-8">
                    <!-- icon -->
                    <div class="text-center">
                        <i class="fa-solid fa-globe text-[40px]"></i>
                    </div>

                    <p class="text-xl font-bold text-slate-900 sm:text-2xl text-center mt-1">Social</p>

                    <div class="mt-8">
                        <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100">
                            <p class="text-sm text-slate-800 text-center">
                                Users can posts accompanied by photos, providing descriptions of affected locations and
                                offering insights into ways to help.
                            </p>
                        </div>
                    </div>
                </div>
            </a>

            <!-- Card-3 -->
            <a data-aos="zoom-in-right" href="Profile.jsp"
                class="delay-200 group relative block bg-[#F2F2F2] rounded-tl-lg rounded-br-lagrge rounded-tr-3xl rounded-bl-3xl hover:bg-[#d9d9d9] transition-all duration-300">
                <div class="relative p-4 sm:p-6 lg:p-8">
                    <!-- icon -->
                    <div class="text-center">
                        <i class="fa-solid fa-user text-[40px]"></i>
                    </div>

                    <p class="text-xl font-bold text-slate-900 sm:text-2xl text-center mt-1">Account</p>

                    <div class="mt-8">
                        <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100">
                            <p class="text-sm text-slate-800 text-center">
                                Non-registered users can create account. Register users can customized their profile.
                            </p>
                        </div>
                    </div>
                </div>
            </a>

            <!-- Card-4 -->
            <a data-aos="zoom-in-right" href="Faq.jsp"
                class="delay-200 group relative block bg-[#F2F2F2] rounded-tl-lg rounded-br-lagrge rounded-tr-3xl rounded-bl-3xl hover:bg-[#d9d9d9] transition-all duration-300">
                <div class="relative p-4 sm:p-6 lg:p-8">
                    <!-- icon -->
                    <div class="text-center">
                        <i class="fa-solid fa-question text-[40px]"></i>
                    </div>

                    <p class="text-xl font-bold text-slate-900 sm:text-2xl text-center mt-1">FAQ</p>

                    <div class="mt-8">
                        <div
                            class="transition-all lg:translate-y-8 transform opacity-100 lg:opacity-0 group-hover:translate-y-0 group-hover:opacity-100">
                            <p class="text-sm text-slate-800 text-center">
                                Contact information and others documentation and acknowledgement can be found here.
                            </p>
                        </div>
                    </div>
                </div>
            </a>

        </div>
        <!-- End of Featured Sections -->

        <!-- Start of Contact Section -->
        <div class="my-container">
            <div class="max-w-screen-xl px-4 py-8 mx-auto sm:px-6 sm:py-12 lg:px-8">
                <div class="text-center">
                    <h2 class="text-xl font-bold text-[#F17829] sm:text-3xl">
                        Contact Us
                    </h2>

                    <p class="max-w-md mx-auto mt-4 text-gray-500" data-aos="zoom-in">
                        Reach out to our dedicated team of developers for inquiries, assistance, or collaboration. We're
                        here to support you in any way we can.
                    </p>
                </div>

                <div class="grid grid-cols-2 gap-5 my-5">
                    <!-- Contact Asif -->
                    <div class="p-3 flex gap-3 justify-center items-center">
                        <div class="avatar">
                            <div class="max-h-[120px] w-auto rounded-xl">
                                <img src="IMAGES/asif.jpg" />
                            </div>
                        </div>
                        <div class="flex flex-col gap-1">
                            <h3 class="text-slate-800 font-bold text-[18px]">Arfatul Islam Asif</h3>
                            <h4 class="text-slate-800 text-[14px] ">Shahjalal University of Science and Technology</h4>
                            <div>
                            	<a href="https://bd.linkedin.com/in/arfatul-islam-asif-169116279" target="_blank">
	                                <button class="btn btn-sm btn-square hover:bg-slate-900 hover:text-white">
	                                    <i class="fa-brands fa-linkedin"></i>
	                                </button>
                                </a>
                                <a href="https://github.com/ArfatulAsif" target="_blank">
	                                <button class="btn btn-sm btn-square hover:bg-slate-900 hover:text-white">
	                                    <i class="fa-brands fa-github"></i>
	                                </button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- Contact Khan -->
                    <div class="p-3 flex gap-3 justify-center items-center">
                        <div class="avatar">
                            <div class="max-h-[120px] w-auto rounded-xl">
                                <img src="IMAGES/unayes.jpeg" />
                            </div>
                        </div>
                        <div class="flex flex-col gap-1">
                            <h3 class="text-slate-800 font-bold text-[18px]">Unayes Ahmed Khan</h3>
                            <h4 class="text-slate-800 text-[14px] ">Shahjalal University of Science and Technology</h4>
                            <div>
                            	<a href="https://bd.linkedin.com/in/unayes-ahmed-khan-3a45bb262" target="_blank">
                                	<button class="btn btn-sm btn-square hover:bg-slate-900 hover:text-white">
                                    	<i class="fa-brands fa-linkedin"></i>
                                	</button>
                                </a>
                                <a href="https://github.com/Unayes09" target="_blank">
	                                <button class="btn btn-sm btn-square hover:bg-slate-900 hover:text-white">
	                                    <i class="fa-brands fa-github"></i>
	                                </button>
								</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Contact Section -->

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
</body>

</html>