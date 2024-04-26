import firebase_app from "../config";
import { signInWithEmailAndPassword, getAuth } from "firebase/auth";
import { signInWithGooglePopup } from "../../utils/firebase.utils"

const auth = getAuth(firebase_app);


const SignIn = () => {
const logGoogleUser = async () => {
    try {
        const response = await signInWithGooglePopup();
        console.log(response);
        } catch (e) {
                error = e;
            }
}
return (
        <div>
            <button onClick={logGoogleUser}>Sign In With Google</button>
        </div>
    )
}
export default SignIn;

// export default async function signIn(email, password) {
//     let result = null,
//         error = null;
//     try {
//         result = await signInWithEmailAndPassword(auth, email, password);
//     } catch (e) {
//         error = e;
//     }

//     return { result, error };
// }