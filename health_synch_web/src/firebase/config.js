// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyC7mFX-llso9YrRC9lVrjmaSLD83EUjPNo",
  authDomain: "healthsynch-f0a04.firebaseapp.com",
  projectId: "healthsynch-f0a04",
  storageBucket: "healthsynch-f0a04.appspot.com",
  messagingSenderId: "1002961539395",
  appId: "1:1002961539395:web:dec75bba38a17fd3f75ff6"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

const db = getFirestore(app);

// Get a list of cities from your database
async function getUsers(db) {
  const usersCol = collection(db, 'users');
  const userSnapshot = await getDocs(usersCol);
  const userList = userSnapshot.docs.map(doc => doc.data());
  return userList;
}
