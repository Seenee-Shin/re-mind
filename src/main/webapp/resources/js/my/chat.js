// 보내기 버튼 클릭 시 채팅 전달
const sendBtn = document.getElementById("send");
sendBtn.addEventListener("click", () => {
    sendMessage();
});

function sendMessage() {
    const message = document.getElementById("inputChatting");

    if ( message.value.trim().length === 0) {
        alert("내용을 입력해 주세요.");
    } else {
        console.log(message.value);
        const obj = {};
        obj.memberNo = 1;
        obj.professionNo = 1;
        obj.chatNo = 1;
        obj.message = message.value;

        chattingSock.send(JSON.stringify(obj));

        message.value = "";
    }
}


chattingSock.onmessage = function (e) {
    const obj = JSON.parse(e.data);

    console.log("start");

    const li = $("<li>");
    const chatCol = $("<div class='chat_col'>");
    const chatMessage = $("<span class='chat'>");
    const chatDate = $("<span class='chatDate'>");
    chatDate.html(obj.createDate);

    if (obj.message !== undefined) {
        let chat = XSS(obj.message);
        chat = chat.replaceAll("\n", "<br>");
        chatMessage.html(chat);
    } else {
        chatMessage.html( "<b>" + obj.memberName + "님이 나가셨습니다.</b>");
    }

    if (obj.memberNo === memberNo) {
        li.addClass("my_chat");
        chatCol.addClass("me_chat_col");

        chatCol.append(chatMessage);
        li.append(chatCol);
        li.append(chatDate);
    } else {
        // img
        const profileImg = $("<img class='profile_img'>");
        profileImg.attr("src", "http://localhost:8080/mind/resources/images/sample4.gif");

        li.addClass("friend_chat");
        chatCol.addClass("friend_chat_col");

        chatCol.append(chatMessage);
        li.append(profileImg);
        li.append(chatCol);
        li.append(chatDate);
    }

    const chatUl = $(".chatting_area ul");
    chatUl.append(li);

    // 채팅 입력 시 스크롤을 가장 아래로 내리기
    chatUl.scrollTop($(".display-chatting")[0].scrollHeight);
}



// XSS 처리 함수
function XSS(message) {
    let str = message;

    str = str.replace(/&/g, "&amp;");
    str = str.replace(/</g, "&lt;");
    str = str.replace(/>/g, "&gt;");
    str = str.replace(/"/g, "&quot;");

    return str;
}