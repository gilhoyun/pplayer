<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="px-auto py-8">
    <div class="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-md">
        <div class="container mx-auto p-4">
            <h2 class="text-2xl font-bold mb-4">${room.roomName}</h2>

            <div class="mb-4" style="display: none;">
                <div>
                    현재 로그인된 회원의 ID : <span id="userId">${rq.getLoginedMemberId()}</span>
                </div>
                <div>
                    현재 채팅방 ID : <span id="roomId">${room.roomId}</span>
                </div>
            </div>

            <div id="chatMessages" class="h-96 overflow-y-auto mb-4 border p-4 rounded">
                <c:forEach var="message" items="${chatHistory}">
                    <div class="chat ${message.sender eq rq.getLoginedMemberId() ? 'chat-end' : 'chat-start'}">
                        <div class="chat-image avatar">
                            <div class="w-10 rounded-full">
                                <img src="/path/to/default/avatar.jpg" alt="User Avatar" />
                            </div>
                        </div>
                        <div class="chat-header">
                            ${message.sender}
                            <time class="text-xs opacity-50">${message.timestamp}</time>
                        </div>
                        <div class="chat-bubble">${message.content}</div>
                        <div class="chat-footer opacity-50">Delivered</div>
                    </div>
                </c:forEach>
            </div>

            <div class="flex items-center space-x-2">
                <input type="text" id="messageInput" 
                       class="input input-bordered w-full" 
                       placeholder="메시지를 입력하세요"/>
                <button id="sendMessage" 
                        class="btn bg-stone-400 text-white rounded hover:bg-stone-500">
                    <i class="fa-regular fa-paper-plane"></i>
                </button>
            </div>
        </div>
    </div>
</section>

<script>
$(function() {
    const socket = new SockJS('/ws-stomp');
    const stompClient = Stomp.over(socket);
    const userId = $('#userId').text();
    const roomId = $('#roomId').text();

    stompClient.connect({}, function() {
        // Subscribe to the room-specific chat channel
        stompClient.subscribe(`/sub/chat/${roomId}`, function(message) {
            const chatMessage = JSON.parse(message.body);
            appendMessage(chatMessage);
        });
    });

    $('#sendMessage').click(sendMessage);
    $('#messageInput').keypress(function(e) {
        if (e.which == 13) {  // Enter key
            sendMessage();
        }
    });

    function sendMessage() {
        const messageInput = $('#messageInput');
        const content = messageInput.val().trim();

        if (content) {
            const chatMessage = {
                sender: userId,
                content: content,
                roomId: roomId
            };

            // Send message via WebSocket
            stompClient.send('/pub/chat/send', {}, JSON.stringify(chatMessage));

            // Clear input
            messageInput.val('');
        }
    }

    function appendMessage(message) {
        const chatMessages = $('#chatMessages');
        const isCurrentUser = message.sender === userId;
        const messageHtml = `
            <div class="chat \${isCurrentUser ? 'chat-end' : 'chat-start'}">
                <div class="chat-image avatar">
                    <div class="w-10 rounded-full">
                        <img src="/path/to/default/avatar.jpg" alt="User Avatar" />
                    </div>
                </div>
                <div class="chat-header">
                    \${message.sender}
                    <time class="text-xs opacity-50">\${new Date().toLocaleTimeString()}</time>
                </div>
                <div class="chat-bubble">\${message.content}</div>
                <div class="chat-footer opacity-50">Delivered</div>
            </div>
        `;
        chatMessages.append(messageHtml);
        chatMessages.scrollTop(chatMessages[0].scrollHeight);
    }
});
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>