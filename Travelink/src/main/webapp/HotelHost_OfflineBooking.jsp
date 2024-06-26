<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="com.travelink.Model.*" %>
<%@page import="com.travelink.Database.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Reservation Form</title>
    </head>
    <body>
        <h1>Reservation Form</h1>
        <form action="yourServletURL" method="GET" onsubmit="return validateDates()">
            <label for="number_of_guests">Number of Guests:</label>
            <input type="number" id="number_of_guests" name="number_of_guests" value="1" min="1" required><br><br>

            <label for="checkInDate">Check-In Date:</label>
            <input type="date" id="checkInDate" name="checkInDate" onchange="validateDates()" required value="${requestScope.checkInDate}" readonly><br><br>

            <label for="checkOutDate">Check-Out Date:</label>
            <input type="date" id="checkOutDate" name="checkOutDate" onchange="validateDates()" required value="${requestScope.checkOutDate}" readonly><br><br>

            <label for="totalPrice">Total Price:</label>
            <input type="number" id="totalPrice" name="totalPrice" required><br><br>

            <label for="paymentMethod">Payment Method:</label>
            <input type="text" id="paymentMethod" name="paymentMethod" required value="OFFLINE" readonly><br><br>

            <label for="status">Status:</label>
            <input type="text" id="status" name="status" required value="PAID" readonly><br><br>

            <h2>Available Rooms</h2>
            <table border="1">
                <tr>
                    <th>Room Name</th>
                    <th>Number of Rooms</th>
                </tr>
                <%
                    List<Room> roomList = (List<Room>) request.getAttribute("roomList");
                    List<Integer> availableRoomList = (List<Integer>) request.getAttribute("availableRoomList");

                    for (int i = 0; i < roomList.size(); i++) {
                        Room room = roomList.get(i);
                        Integer availableRooms = availableRoomList.get(i);
                %>
                <tr data-room-id="<%= room.getRoom_ID() %>" data-room-name="<%= room.getName() %>" data-price="<%= room.getPrice() %>">
                    <td><%= room.getName() %></td>
                    <td>
                        <select name="room_<%= room.getRoom_ID() %>_count">
                            <% for (int j = 0; j <= availableRooms; j++) { %>
                            <option value="<%= j %>"><%= j %></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <label for="bookingStr">Booking String:</label>
            <input type="text" name="bookingStr" id="bookingStr" readonly><br>
            <input type="submit" value="Submit">
        </form>

        <script>
            function validateDates() {
                var today = new Date();
                var checkInDate = new Date(document.getElementById("checkInDate").value);
                var checkOutDate = new Date(document.getElementById("checkOutDate").value);

                // Set hours to 0 to compare dates without considering time
                today.setHours(0, 0, 0, 0);
                checkInDate.setHours(0, 0, 0, 0);
                checkOutDate.setHours(0, 0, 0, 0);

                // Check if checkInDate is today or later
                if (checkInDate < today) {
                    alert("Check-in date must be today or a future date.");
                    document.getElementById("checkInDate").value = ''; // Clear incorrect date
                    return false;
                }

                // Check if checkOutDate is after checkInDate
                if (checkOutDate <= checkInDate) {
                    alert("Check-out date must be after check-in date.");
                    document.getElementById("checkOutDate").value = ''; // Clear incorrect date
                    return false;
                }

                return true;
            }
            document.addEventListener('DOMContentLoaded', (event) => {
                const selects = document.querySelectorAll('select');
                const bookingStr = document.getElementById("bookingStr");

                selects.forEach(select => {
                    select.addEventListener('change', checkSelectValues);
                });

                function checkSelectValues() {
                    let bookingString = "";
                    selects.forEach(select => {
                        let row = select.closest('tr');
                        let roomID = row.getAttribute('data-room-id'); // Ensure this gets the correct value
                        let amount = parseInt(select.value, 10);

                        console.log("Room ID:", roomID); // Debugging statement
                        console.log("Amount:", amount); // Debugging statement

                        if (amount > 0) {
                            let info = `Room_ID=` + roomID + `,Quantity=` + amount;
                            if (bookingString === "") {
                                bookingString = info;
                            } else {
                                bookingString += "/" + info;
                            }
                        }
                    });
                    console.log("Updated Booking String:", bookingString); // Debugging statement
                    bookingStr.value = bookingString;
                }
            });
        </script>
    </body>
</html>
