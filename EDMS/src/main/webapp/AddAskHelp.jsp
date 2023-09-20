<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
   

<!DOCTYPE html>

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

<body>
<% 
 
String LocationUsername = request.getParameter("LocationUsernameFromLocationProfile");
%>
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

                    <h1 class="text-3xl my-5 font-bold text-center">Ask for Help</h1>

                    <!-- Form -->
                    <form class="my-5 max-w-[400px] mx-auto" action="AddAskHelp" method="post"
                        enctype="multipart/form-data">

                        <div class="form-control">
                            <label class="label">
                                <span class="label-text text-xl">Write Description</span>
                            </label>
                            <textarea required class="textarea textarea-bordered h-24" placeholder="" name="Description"></textarea>
                        </div>

                        <label class="label">
                            <span class="label-text text-xl">Add 2 photos for visual confirmation :</span>
                        </label>
                        <div class="flex flex-col my-2 gap-1">
                            <input required type="file" id="myFile" name="ImageName1">
                            <input required type="file" id="myFile" name="ImageName2">
                        </div>

                        <label class="label">
                            <span class="label-text text-xl">Affected People Information :</span>
                        </label>
                        <div class="w-full flex flex-col gap-2">
                            <input class="w-full border border-slate-300 p-2 rounded-lg border-black" type="number" name="help-am" id="" placeholder="male">
                            <input class="w-full border border-slate-300 p-2 rounded-lg border-black" type="number" name="help-af" id="" placeholder="female">
                            <input class="w-full border border-slate-300 p-2 rounded-lg border-black" type="number" name="help-ac" id="" placeholder="children">
                        </div>
						<input type="hidden" name="LocationUsername" value= <%=LocationUsername %>>
                        <!-- submit button -->
                        <input class="btn btn-warning my-5 w-full" type="submit" value="Post">
                    </form>

                </div>
            </div>
        </div>
    </div>
</body>

</html>