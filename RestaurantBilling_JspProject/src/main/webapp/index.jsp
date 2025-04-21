<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to ResWebb - Restaurant Ordering</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        /* Style for the new background image */
        .bg-image-custom {
            /* New background image - food/restaurant theme */
            background-image: url('https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=1200&auto=format&fit=crop&q=80&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        /* Custom style for select arrow visibility */
        select {
            appearance: none; /* Hide default arrow */
            -webkit-appearance: none; /* Hide default arrow for Safari */
            -moz-appearance: none; /* Hide default arrow for Firefox */
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke-width='1.5' stroke='%236b7280' class='w-6 h-6'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' d='m19.5 8.25-7.5 7.5-7.5-7.5' /%3E%3C/svg%3E%0A"); /* Custom arrow */
            background-repeat: no-repeat;
            background-position: right 0.75rem center; /* Position arrow */
            background-size: 1.25em; /* Size arrow */
            padding-right: 2.5rem; /* Add space for the arrow */
        }
         /* Fallback styling if image fails */
        .fallback-bg {
             background-color: #f0f4f8; /* A soft, neutral background color */
        }
    </style>
</head>
<body class="bg-image-custom flex items-center justify-center min-h-screen">
    <img src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=1200&auto=format&fit=crop&q=80&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
         alt="Restaurant background image"
         onerror="this.style.display='none'; document.body.classList.remove('bg-image-custom'); document.body.classList.add('fallback-bg');"
         style="display:none;" /> <div class="container mx-auto p-4 flex justify-center">
        <div class="login-container bg-white bg-opacity-90 backdrop-blur-sm p-8 rounded-xl shadow-2xl w-full max-w-sm">

            <h1 class="text-3xl font-bold text-center text-gray-800 mb-8">Welcome to ResWebb</h1>

            <form action="verifyLogin.jsp" method="post" class="space-y-5">
                <div>
                    <label for="username" class="block text-sm font-medium text-gray-700 mb-1">Enter Username</label>
                    <input type="text" id="username" name="user" placeholder="Your Username" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300 ease-in-out">
                </div>

                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Enter Password</label>
                    <input type="password" id="password" name="pass" placeholder="Your Password" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300 ease-in-out">
                </div>

                <div>
                    <label for="role" class="block text-sm font-medium text-gray-700 mb-1">Choose Your Role</label>
                    <select id="role" name="role"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-300 ease-in-out">
                        <option value="user">User</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>

                <button type="submit"
                        class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-4 rounded-lg shadow-md transition duration-300 ease-in-out transform hover:-translate-y-1 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50 mt-4">
                    Login
                </button>
            </form>

            <div class="text-center mt-6">
                <a href="guest.jsp" class="text-blue-600 hover:text-blue-800 text-sm font-medium transition duration-300 ease-in-out">
                    Continue as Guest
                </a>
            </div>
        </div>
    </div>

</body>
</html>
