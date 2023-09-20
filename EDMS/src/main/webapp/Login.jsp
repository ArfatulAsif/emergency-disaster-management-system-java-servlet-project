<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                    <form class="my-5 max-w-[400px] mx-auto" action="Login" method="post"
                        enctype="multipart/form-data">

                        <!-- Email -->
                        <label class="label">
                            <span class="label-text">Enter your username</span>
                        </label>
                        <input name="log_username" type="text" class="input input-bordered w-full" required />
                        <!-- Password -->
                        <label class="label">
                            <span class="label-text">Enter your password</span>
                        </label>
                        <input name="log_password" type="password" class="input input-bordered w-full" required />
                        <!-- submit button -->
                        <input class="btn btn-warning my-5 w-full" type="submit" value="Submit">
                        <p>${message}</p>
                    </form>
                    <h3 class=" max-w-[400px] mx-auto">Don't have an account? <a class="text-amber-500 hover:underline" href="Registration.jsp">Register Now</a></h3>

                </div>
            </div>
        </div>
    </div>
</body>

</html>