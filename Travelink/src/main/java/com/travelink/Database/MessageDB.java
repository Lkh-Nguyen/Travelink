/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.travelink.Database;

import Chatbox.AESUtil;
import Chatbox.Chat;
import jakarta.websocket.Session;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author DUYAN
 */
public class MessageDB {
    public static void saveMessageToDatabase(int fromId, int toId, String messageText) throws Exception {
        Chat chat = new Chat();
        String fromUsername = chat.getUsername(fromId);

        try (Connection conn = DriverManager.getConnection(DatabaseInfo.DBURL, DatabaseInfo.USERDB, DatabaseInfo.PASSDB)) {
            String insertMessageQuery = "INSERT INTO Message (From_Account_ID, To_Account_ID, MessageText, SentTime) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";
            try (PreparedStatement insertMessageStmt = conn.prepareStatement(insertMessageQuery)) {
                insertMessageStmt.setInt(1, fromId);
                insertMessageStmt.setInt(2, toId);
                String encryptedMessage = AESUtil.encrypt(messageText);
                insertMessageStmt.setString(3, encryptedMessage);
                insertMessageStmt.executeUpdate();
            }
            System.out.println("Message saved to database successfully.");
        }
    }

    public static void sendExistingMessages(Session session, int fromId, int toId) throws Exception {
        String query = "SELECT From_Account_ID, To_Account_ID, MessageText, SentTime FROM Message "
                + "WHERE (From_Account_ID = ? AND To_Account_ID = ?) OR (From_Account_ID = ? AND To_Account_ID = ?)";

        try (Connection conn = DriverManager.getConnection(DatabaseInfo.DBURL, DatabaseInfo.USERDB, DatabaseInfo.PASSDB); PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, fromId);
            stmt.setInt(2, toId);
            stmt.setInt(3, toId);
            stmt.setInt(4, fromId);

            try (ResultSet rs = stmt.executeQuery()) {
                JSONArray messages = new JSONArray();
                while (rs.next()) {
                    int rsFromId = rs.getInt("From_Account_ID");
                    int rsToId = rs.getInt("To_Account_ID");
                    String encryptedMessage = rs.getString("MessageText");
                    String decryptedMessage = AESUtil.decrypt(encryptedMessage);
                    Timestamp sentTime = rs.getTimestamp("SentTime");

                    JSONObject messageObj = new JSONObject();
                    messageObj.put("fromId", rsFromId);
                    messageObj.put("toId", rsToId);
                    messageObj.put("messageText", decryptedMessage);
                    messageObj.put("sentTime", sentTime);
                    messages.put(messageObj);
                }

                JSONObject response = new JSONObject();
                response.put("type", "loadMessages");
                response.put("messages", messages);

                // Convert to string and send to the session asynchronously
                session.getAsyncRemote().sendText(response.toString());
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }
}
