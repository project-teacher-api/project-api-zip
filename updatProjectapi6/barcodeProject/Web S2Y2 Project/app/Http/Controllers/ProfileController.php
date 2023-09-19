<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request)
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $request->user()->fill($request->validated());

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }
        if ($request->user()->isDirty('avatar')) {
            $request->user()->email_verified_at = null;
        }

        $request->user()->save();

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */

    /**
     * Delete the user's account.
     */
    /**
     *
     * Write code on Method
     *
     * @return response()
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);
        $user = $request->user();
        Auth::logout();
        $user->delete();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }
    // show profile in controller
    public function showprofile()
    {
        return view('profile.partials.showuserprofile');
    }
    // show for excuted profile
    public function storedataupdate(Request $request)
    {
        $request->validate([
            'avatar' => 'required|image',
        ]);

        $user = $request->user();
        $avatarName = time() . '.' . $request->avatar->getClientOriginalExtension();
        $request->avatar->move(public_path('avatars'), $avatarName);

        Auth()->user()->update(['avatar' => $avatarName]);
        //    make session in view
        return back()->with('success', 'Avatar updated successfully.');
    }
    // create new function show
    public function fundelectprofile()
    {
        return view('profile.partials.delete-profile');
    }
    // create new file
    public function delectprofile(Request  $request)
    {
     try {
        unlink('avatars/'.Auth::user()->avatar);
        DB::table('users')->where('id',Auth::user()->id)->update(['avatar'=> null]);
        return  redirect('/profile');
     } catch (\Throwable $th) {

        return  redirect('/profile');

     }
        //  delect in profile in laravel

    }
}
