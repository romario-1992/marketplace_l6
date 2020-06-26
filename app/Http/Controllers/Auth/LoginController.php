<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    
    | Este controlador lida com a autenticação de usuários para o aplicativo e
    | redirecionando-os para sua tela inicial. O controlador usa uma característica
    | para fornecer convenientemente sua funcionalidade para seus aplicativos.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = 'admin/stores';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    //Apos o login tem sessão do carrinho ? manda o usuário para a tela do ckeckout
    protected function authenticated(\Illuminate\Http\Request $request, $user)
    {
        if(session()->has('cart')) {
            return redirect()->route('checkout.index');
        }

        return null;
    }

    

}
