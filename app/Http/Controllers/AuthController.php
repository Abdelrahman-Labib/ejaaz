<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use App\User;
use Validator, Hash;
use Illuminate\Support\Facades\Password;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */


    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        $credentials = $request->only('name', 'secondname', 'lastname', 'phone','email', 'password', 'type');
        $rules = [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6',
            'type'=> 'required'
        ];
        $validator = Validator::make($credentials, $rules);
        if($validator->fails()) {
            return response()->json(['type'=> 'validation', 'success'=> false, 'error'=> $validator->messages()],400);
        }
        $name = $request->name;
        $secondname = $request->secondname;
        $lastname = $request->lastname;
        $age = $request->age;
        $country = $request->country;
        $address = $request->address;
        $phone = $request->phone;
        $email = $request->email;
        $password = $request->password;
        $type = $request->type;
        User::create(['name' => $name, 'secondname' => $secondname, 'lastname' => $lastname, 'age' => $age, 'country' => $country, 'address' => $address, 'phone' => $phone, 'email' => $email, 'password' => Hash::make($password), 'type' => $type]);
        return $this->login($request);

    }

    public function login()
    {
        $credentials = request(['email', 'password']);

        if (! $token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(["user" => auth()->user()->load(['courses', 'favorites', 'jointcourses', 'cart']), "categories" => Category::all()]);
    }

    public function profile($id)
    {
        $user = User::findOrFail($id);
        return response()->json(["user" => $user->load(['courses', 'jointcourses', 'education', 'jobs', 'certificates','reviews'])]);
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'user' => auth()->user()->load(['courses', 'favorites', 'jointcourses', 'cart']),
            'expires_in' => auth()->factory()->getTTL() * 60,
            "categories" => Category::all()
        ]);
    }

    public function recover(Request $request)
    {
        $user = User::where('email', $request->email)->first();
        if (!$user) {
            $error_message = "Your email address was not found.";
            return response()->json(['success' => false, 'error' => ['email'=> [$error_message]]], 401);
        }
        try {
            Password::sendResetLink($request->only('email'), function (Message $message) {
                $message->subject('Your Password Reset Link');
            });
        } catch (\Exception $e) {
            $error_message = $e->getMessage();
            return response()->json(['success' => false, 'error' => $error_message], 401);
        }
        return response()->json([
            'success' => true, 'data'=> ['message'=> 'A reset email has been sent! Please check your email.']
        ]);
    }

    public function updatePassword(Request $request, $id)
    {
        $user = auth()->user();

        /*
        * Validate all input fields
        */
        $this->validate($request, [
            'password' => 'required_with:new_password|password|max:8',
            'new_password' => 'confirmed|max:8',
        ]);

        if (Hash::check($request->password, $user->password)) {
           $user->fill([
            'password' => Hash::make($request->newPassword)
            ])->save();

           $request->session()->flash('success', 'Password changed');
            return redirect()->route('your.route');

        } else {
            $request->session()->flash('error', 'Password does not match');
            return redirect()->route('your.route');
        }

    }

    public function updateUser(Request $req){
        $user = auth()->user();
        $user->name = $req->name;
        $user->country = $req->country;
        $user->city = $req->city;
        $user->address = $req->address;
        $user->phone = $req->phone;
        $user->save();
        return response()->json($user);
    }
}
