<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%@page import="com.connection.DbConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Optional: Add custom base styles or overrides here if needed */
        body {
            font-family: 'Inter', sans-serif; /* Example using a common modern font */
        }
        /* Ensure table layout is fixed to prevent content overflow issues */
        .table-fixed {
            table-layout: fixed;
            width: 100%; /* Ensure table takes full width */
        }
    </style>
     <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="bg-gray-100">

    <%-- Assuming navbar.jsp provides a responsive navigation bar --%>
    <jsp:include page="/include/navbar.jsp"></jsp:include>

    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-semibold text-gray-800 mb-6">Your Shopping Cart</h1>

        <div class="bg-white shadow-md rounded-lg overflow-hidden">
            <table class="min-w-full leading-normal table-fixed">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider w-1/6">Item-ID</th>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider w-2/6">Name</th>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider w-1/6">Price</th>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider w-1/6">Category</th>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider w-1/12">Qty</th>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider w-2/12">Update Qty</th>
                        <%-- Optional: Add remove button column header if needed --%>
                        <%-- <th class="px-5 py-3 border-b-2 border-gray-300 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">Remove</th> --%>
                    </tr>
                </thead>
                <tbody class="text-gray-700">
                    <%
                        int total = 0;
                        Connection con = null; // Initialize connection
                        PreparedStatement ps = null; // Initialize prepared statement
                        ResultSet rs = null; // Initialize result set
                        try {
                            con = DbConnection.takeConnection();
                            String q = "select * from cart"; // Assuming columns are: id, name, price, category, quantity
                            ps = con.prepareStatement(q);
                            rs = ps.executeQuery();

                            if (!rs.isBeforeFirst() ) { // Check if cart is empty
                                out.println("<tr><td colspan='6' class='text-center py-10 px-5 text-gray-500'>Your cart is empty.</td></tr>");
                            } else {
                                while (rs.next()) {
                                    // Get data for the current row
                                    String itemId = rs.getString(1);
                                    String itemName = rs.getString(2);
                                    int itemPrice = rs.getInt(3); // Assuming price is integer
                                    String itemCategory = rs.getString(4);
                                    int itemQuantity = rs.getInt(5); // Assuming quantity is integer

                                    // Calculate subtotal for the item
                                    int intertotal = itemPrice * itemQuantity;
                                    total += intertotal; // Add to grand total

                                    // Output the table row
                                    out.println("<tr class='border-b border-gray-200 hover:bg-gray-50'>");
                                    out.println("<td class='px-5 py-5 text-sm'>" + itemId + "</td>");
                                    out.println("<td class='px-5 py-5 text-sm'>" + itemName + "</td>");
                                    out.println("<td class='px-5 py-5 text-sm'>$" + String.format("%.2f", (double)itemPrice) + "</td>"); // Format price
                                    out.println("<td class='px-5 py-5 text-sm'>" + itemCategory + "</td>");
                                    out.println("<td class='px-5 py-5 text-sm text-center'>" + itemQuantity + "</td>");

                                    // Update Quantity Form - styled with Tailwind
                                    out.println("<td class='px-5 py-5 text-sm text-center'>");
                                    out.println("<form action='updateQuantity.jsp?id=" + itemId + "' method='post' class='flex items-center justify-center space-x-2'>");
                                    out.println("<input type='number' name='quant' value='" + itemQuantity + "' min='1' class='w-16 px-2 py-1 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm'>");
                                    out.println("<button type='submit' class='px-3 py-1 bg-blue-500 text-white text-xs font-semibold rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50 transition duration-150 ease-in-out'>Update</button>");
                                    out.println("</form>");
                                    out.println("</td>");

                                    // Optional: Add Remove Button Logic here if needed (using your commented-out code as a base)
                                    /*
                                    String removeItemUrl = "deleteCart.jsp?action=remove&itemId=" + itemId; // Simplified remove action
                                    out.println("<td class='px-5 py-5 text-sm text-center'>");
                                    out.println("<a href='" + removeItemUrl + "' class='text-red-500 hover:text-red-700 text-xs font-semibold'>Remove</a>");
                                    out.println("</td>");
                                    */

                                    out.println("</tr>");
                                }
                            }
                            session.setAttribute("total", total); // Store total in session

                        } catch (Exception e) {
                            e.printStackTrace();
                            // Display a user-friendly error message
                            out.println("<tr><td colspan='6' class='text-center py-10 px-5 text-red-500'>Error loading cart data. Please try again later.</td></tr>");
                        } finally {
                            // Ensure database resources are closed
                            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </tbody>
            </table>
        </div>

        <%-- Display Total Amount and Checkout Button if cart is not empty --%>
        <%
            Integer cartTotal = (Integer) session.getAttribute("total");
            if (cartTotal != null && cartTotal > 0) {
        %>
            <div class="mt-8 flex flex-col md:flex-row justify-between items-center">
                <div class="text-xl font-semibold text-gray-800 mb-4 md:mb-0">
                    Total Amount: <span class="text-blue-600">$<%= String.format("%.2f", (double)cartTotal) %></span>
                </div>
                <div>
                    <a href="checkout.jsp" class="inline-block px-8 py-3 bg-green-500 text-white font-bold rounded-lg shadow-md hover:bg-green-600 transition duration-150 ease-in-out focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-opacity-50">
                        Proceed to Checkout
                    </a>
                </div>
            </div>
        <%
            } else if (cartTotal != null && cartTotal == 0) {
                // Optional: Message if cart exists but total is 0 (e.g., free items)
                 // You could add a message here if needed, or just show nothing
            }
        %>

         <%-- Optional: Link to continue shopping --%>
         <div class="mt-6 text-center">
             <a href="index.jsp" class="text-blue-500 hover:text-blue-700">&larr; Continue Shopping</a> <%-- Adjust href as needed --%>
         </div>

    </div> <%-- End container --%>

</body>
</html>
