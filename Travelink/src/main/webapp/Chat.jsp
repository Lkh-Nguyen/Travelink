<!DOCTYPE html>
<html>
<head>
    <title>Real-time Chat</title>
    <script type="text/javascript">

        var websocket;
        
        function connect() {
            var wsUri = "ws://localhost:8080/Travelink/chat"; // Adjust URL as per your server configuration
            websocket = new WebSocket(wsUri);
            
            websocket.onopen = function(event) {
                console.log("WebSocket connected.");
                // Perform actions when WebSocket connection opens
            };
            
            websocket.onmessage = function(event) {
                var message = JSON.parse(event.data);
                handleMessage(message);
            };
            
            websocket.onclose = function(event) {
                console.log("WebSocket connection closed.");
                // Perform actions when WebSocket connection closes
            };
            
            websocket.onerror = function(event) {
                console.error("WebSocket error observed:", event);
            };
        }
        
        function sendMessage() {
            var message = {
                type: 'chat',
                fromId: <%-- retrieve current user ID from session or somewhere --%>,
                toId: <%-- retrieve recipient ID --%>,
                messageText: document.getElementById('messageInput').value
            };
            
            websocket.send(JSON.stringify(message));
            document.getElementById('messageInput').value = "";
        }
        
        function handleMessage(message) {
            // Handle incoming message and update UI
            console.log("Received message:", message);
            // Update UI to display the incoming message
        }
        
        window.onload = function() {
            connect(); // Establish WebSocket connection when the page loads
        };
        
    </script>
</head>
<body>
    <div id="chatContainer">
        <!-- Chat messages display area -->
    </div>
    <input type="text" id="messageInput" placeholder="Type your message...">
    <button onclick="sendMessage()">Send</button>
</body>
</html>
