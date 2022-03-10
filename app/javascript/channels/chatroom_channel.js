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

<<<<<<< HEAD
document.addEventListener('turbolinks:load', () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    console.log(id)
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data.split(':'));
        console.log(data.split(':')[2]);
        data = data.replace('right', 'left')
        data = data.replace('You', data.split(':')[2])
        messagesContainer.insertAdjacentHTML("beforeend", data)
      },
    });
  }
});
=======
// document.addEventListener('turbolinks:load', () => {
//   const messagesContainer = document.getElementById('messages');
//   if (messagesContainer) {
//     const id = messagesContainer.dataset.chatroomId;
//     console.log(id)
//     consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
//       received(data) {
//       },
//     });
//   }
// });
>>>>>>> 427817b6126975dd3c17be39322732365fd8d4ce
