package com.example.demo.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoom {
	private String roomId;
    private String roomName;
    private String createdBy;
    private LocalDateTime createdAt;
    private int participantCount;
}
