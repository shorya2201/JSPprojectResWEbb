<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%-- Set encoding to UTF-8 --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%-- Assuming header.jsp includes necessary meta tags, potentially base CSS --%>
    

    <meta charset="UTF-8"> <%-- Ensure UTF-8 meta tag is present --%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - ResWebb</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        /* Apply Inter font globally */
        body {
            font-family: 'Inter', sans-serif;
            /* Background color is now handled by Tailwind class on body tag */
        }
        /* Add a subtle transition effect to action items */
        .action-item {
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .action-item:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
    </style>
</head>
<%-- Body uses flex-col and min-h-screen to allow footer positioning --%>
<body class="flex flex-col min-h-screen bg-emerald-50"> <%-- Kept main background soothing green --%>

    <%-- Include the navigation bar --%>
    <jsp:include page="/include/navbar.jsp"></jsp:include>

    <%-- flex-grow allows main content to expand and push footer down --%>
    <main class="flex-grow container mx-auto px-4 py-12">
        <div class="text-center mb-12">
            <h1 class="text-4xl font-bold text-gray-800">Welcome Back!</h1>
            <p class="text-lg text-gray-600 mt-2">Ready to order or check your history?</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-4xl mx-auto">

            <%-- Added no-underline class to remove underline from child elements --%>
            <a href="showMenu.jsp" class="action-item block bg-white p-8 rounded-lg shadow-md text-center no-underline">
                <%-- Consider adding an icon here --%>
                <h2 class="text-xl font-semibold text-blue-600 mb-3">View Menu</h2>
                <p class="text-gray-500">Browse our delicious offerings and find your next meal.</p>
            </a>

            <%-- Added no-underline class to remove underline from child elements --%>
            <a href="cart.jsp" class="action-item block bg-white p-8 rounded-lg shadow-md text-center no-underline">
                 <%-- Consider adding an icon here --%>
                <h2 class="text-xl font-semibold text-green-600 mb-3">View Cart</h2>
                <p class="text-gray-500">Check your current selections and proceed to checkout.</p>
            </a>

            <%-- Added no-underline class to remove underline from child elements --%>
            <a href="viewOrder.jsp" class="action-item block bg-white p-8 rounded-lg shadow-md text-center no-underline">
                 <%-- Consider adding an icon here --%>
                <h2 class="text-xl font-semibold text-purple-600 mb-3">Order History</h2>
                <p class="text-gray-500">Review your past orders and reorder your favorites.</p>
            </a>

        </div>
    </main>

    <%-- Updated footer styles: grey background, darker border, black & bolder text --%>
    <footer class="mt-auto w-full border-t border-gray-300 bg-gray-100 py-6">
        <div class="container mx-auto text-center">
            <%-- Updated text color and weight --%>
            <p class="text-sm text-black font-semibold">
                RessWebb - A food buddy for everyone
            </p>
        </div>
    </footer>

</body>
</html>
