<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.connection.DbConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %> <%-- Import for date formatting --%>
<%@ page import="java.text.NumberFormat" %> <%-- Import for currency formatting --%>
<%@ page import="java.util.Locale" %> <%-- Import for locale-specific currency --%>
<%@ page import="java.text.ParseException" %> <%-- Import for handling parsing errors --%>


<!DOCTYPE html>
<html lang="en">
<head>
    <%-- Assuming header.jsp contains necessary meta tags, title etc. --%>
    <%-- <jsp:include page="/include/header.jsp"></jsp:include> --%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="bg-gray-100">

    <jsp:include page="/include/navbar.jsp"></jsp:include>

    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-semibold text-gray-800 mb-6">Order History</h1>

        <div class="bg-white shadow-md rounded-lg overflow-x-auto">
            <table class="min-w-full leading-normal">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Order-ID</th>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Placed-By</th>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Order-Date</th>
                        <th class="px-5 py-3 border-b-2 border-gray-300 text-right text-xs font-semibold text-gray-600 uppercase tracking-wider">Order-Amount</th>
                    </tr>
                </thead>
                <tbody class="text-gray-700">
                    <%
                        Connection con = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;
                        // Define currency formatter
                        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("en", "IN")); // Example: INR currency format
                        // Define the format EXPECTED FROM THE DATABASE STRING
                        // *** FIX: Corrected the date format pattern (replaced 'umpire' with 'yyyy') ***
                        SimpleDateFormat dbDateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
                        // Define the desired OUTPUT format
                        SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd MMM yyyy, hh:mm a"); // Matched year style


                        try {
                            con = DbConnection.takeConnection();
                            String q = "SELECT * FROM orders ORDER BY order_date DESC"; // Assuming order_date is the column name
                            ps = con.prepareStatement(q);
                            rs = ps.executeQuery();

                            if (!rs.isBeforeFirst()) {
                                out.println("<tr><td colspan='4' class='text-center py-10 px-5 text-gray-500'>No orders found in the system.</td></tr>");
                            } else {
                                while (rs.next()) {
                                    String orderId = rs.getString(1); // Assuming column 1 is order ID
                                    String placedBy = rs.getString(2); // Assuming column 2 is placed_by

                                    // *** FIX: Read date as String first ***
                                    String orderDateString = rs.getString(3); // Assuming column 3 is order_date stored as String

                                    double orderAmount = rs.getDouble(4); // Assuming column 4 is order_amount

                                    String formattedDate = "Invalid Date"; // Default/fallback value
                                    if (orderDateString != null && !orderDateString.isEmpty()) {
                                        try {
                                            // *** FIX: Parse the string using the correct format ***
                                            Date parsedDate = dbDateFormat.parse(orderDateString);
                                            // Format the parsed date into the desired output format
                                            formattedDate = outputDateFormat.format(parsedDate);
                                        } catch (ParseException pe) {
                                            // Handle cases where the string might not match the expected format
                                            // System.err.println("Could not parse date string: " + orderDateString); // Log error
                                            formattedDate = orderDateString; // Show the raw string as fallback
                                            // pe.printStackTrace(); // Optionally print stack trace to logs
                                        }
                                    } else {
                                         formattedDate = "N/A"; // Handle null or empty date strings from DB
                                    }


                                    String formattedAmount = currencyFormat.format(orderAmount);

                                    out.println("<tr class='border-b border-gray-200 hover:bg-gray-50'>");
                                    out.println("<td class='px-5 py-5 text-sm'>" + orderId + "</td>");
                                    out.println("<td class='px-5 py-5 text-sm'>" + placedBy + "</td>");
                                    out.println("<td class='px-5 py-5 text-sm'>" + formattedDate + "</td>"); // Display the formatted date
                                    out.println("<td class='px-5 py-5 text-sm text-right'>" + formattedAmount + "</td>");
                                    out.println("</tr>");
                                }
                            }

                        } catch (Exception e) {
                            e.printStackTrace(); // This still prints other runtime errors to the log
                            out.println("<tr><td colspan='4' class='text-center py-10 px-5 text-red-500'>Error loading order history. Please check server logs for details.</td></tr>");
                        } finally {
                            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="mt-6 text-center">
            <a href="user.jsp" class="text-blue-500 hover:text-blue-700">Back to Account</a>
        </div>

    </div>

</body>
</html>
