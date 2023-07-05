<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class logincontroller extends Controller
{
    public function login(Request $req)
    {
        if($req->input("email")=="rathodriddhi78@gmail.com" && $req->input("password")=="riddhi1131@"){
            return redirect("index");
        }
        else
        {
            return redirect('/');
        }
    }
}
