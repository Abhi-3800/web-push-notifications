importScripts('https://www.gstatic.com/firebasejs/7.14.6/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/7.14.6/firebase-messaging.js');

const firebaseConfig = {
  apiKey: "AIzaSyCrU4mU0UVcdPpIkPH_i8_XXfntSRvm3Rg",
  authDomain: "web-notifications-f2cd9.firebaseapp.com",
  projectId: "web-notifications-f2cd9",
  storageBucket: "web-notifications-f2cd9.appspot.com",
  messagingSenderId: "697809198230",
  appId: "1:697809198230:web:2506f7cd26ea04de83f6b7",
  measurementId: "G-HXCWB2V578"
};

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    console.log(payload);
    const notification=JSON.parse(payload);
    const notificationOption={
        body:payload.notification.body,
        title:payload.notification.title
    }
     return self.registration.showNotification(payload.notification.title,payload.notification.body,notificationOption);
})