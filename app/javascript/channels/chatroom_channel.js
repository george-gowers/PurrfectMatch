import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        data = data.replace('right', 'left')
        data = data.replace('justify-content-end', 'justify-content-start')
        data = data.replace('r-msg', 'l-msg')
        data = data.replace('You', data.split(':')[2])
        messagesContainer.insertAdjacentHTML("beforeend", data)
      },
    });
  }
}

export { initChatroomCable };
