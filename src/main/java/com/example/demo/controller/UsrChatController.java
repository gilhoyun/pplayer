package com.example.demo.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Chat;
import com.example.demo.dto.ChatRoom;
import com.example.demo.dto.Member;
import com.example.demo.service.ChatService;

@Controller
public class UsrChatController {

    private final ChatService chatService;
    private final SimpMessagingTemplate messagingTemplate;

    public UsrChatController(ChatService chatService, SimpMessagingTemplate messagingTemplate) {
        this.chatService = chatService;
        this.messagingTemplate = messagingTemplate;
    }
    
    @GetMapping("/usr/chat/chatting")
    public String chatting(Model model) {
      
        return "usr/chat/chatting";
    }

    // Display chat rooms page
    @GetMapping("/usr/chat/rooms")
    public String chatRooms(Model model) {
        List<ChatRoom> rooms = chatService.findAllChatRooms();
        List<Member> allMembers = chatService.getAllMembers();  // 모든 회원 목록을 가져옵니다.
        model.addAttribute("rooms", rooms);
        model.addAttribute("allMembers", allMembers);  // 모든 회원을 모델에 추가하여 JSP에서 사용할 수 있도록 합니다.
        return "usr/chat/rooms";
    }

    // Create a new chat room
    @PostMapping("/usr/chat/rooms")
    @ResponseBody
    public Map<String, String> createChatRoom(@RequestBody ChatRoom chatRoom) {
        chatRoom.setRoomId(UUID.randomUUID().toString());
        chatRoom.setCreatedAt(LocalDateTime.now());
        
        System.out.println("Creating chat room: " + chatRoom);
        System.out.println("Room ID: " + chatRoom.getRoomId());
        
        ChatRoom createdRoom = chatService.createChatRoom(chatRoom);
        
        chatService.addMemberToRoom(createdRoom.getRoomId(), chatRoom.getCreatedBy());
        
        // Return a map with room details
        Map<String, String> response = new HashMap<>();
        response.put("roomId", createdRoom.getRoomId());
        response.put("roomName", createdRoom.getRoomName());
        
        return response;
    }

    // Enter a specific chat room
    @GetMapping("/usr/chat/room/{roomId}")
    public String enterChatRoom(@PathVariable String roomId, Model model) {
        ChatRoom room = chatService.findChatRoomById(roomId);
        List<Chat> chatHistory = chatService.getChatHistory(roomId);
        List<Member> roomMembers = chatService.getRoomMembers(roomId);  // 채팅방에 참여한 회원 목록 조회
        
        model.addAttribute("room", room);
        model.addAttribute("chatHistory", chatHistory);
        model.addAttribute("roomMembers", roomMembers);  // 회원 목록을 모델에 추가
        
        return "usr/chat/chatting";
    }

    // WebSocket endpoint for sending messages
    @MessageMapping("/chat/send")
    @SendTo("/sub/chat/{roomId}")
    public Chat sendMessage(Chat chat) {
        // Check if the sender is a member of the room
        if (chatService.isMemberOfRoom(chat.getRoomId(), chat.getSender())) {
            chat.setTimestamp(LocalDateTime.now());
            chat.setRead(false);
            chatService.saveMessage(chat); // 메시지를 저장
            return chat;
        } else {
            // Optionally, handle unauthorized access (e.g., notify the user)
            return null; // 멤버가 아니면 메시지 전송 안 함
        }
    }
    
}