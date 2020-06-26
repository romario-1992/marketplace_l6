<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    
    | Este controlador é responsável por gerenciar e-mails de redefinição de senha e
    | inclui uma característica que auxilia no envio dessas notificações de
    | seu aplicativo para seus usuários. Sinta-se livre para explorar essa característica.
    |
    */

    use SendsPasswordResetEmails;
}
