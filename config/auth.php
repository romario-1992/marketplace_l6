<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Authentication Defaults
    |--------------------------------------------------------------------------
    |
    | This option controls the default authentication "guard" and password
    | reset options for your application. You may change these defaults
    | as required, but they're a perfect start for most applications.
    |
      
    | Esta opção controla a autenticação padrão "guarda" e senha
    | redefinir opções para o seu aplicativo. Você pode alterar esses padrões
    | conforme necessário, mas são um começo perfeito para a maioria dos aplicativos.
    */

    'defaults' => [
        'guard' => 'web',
        'passwords' => 'users',
    ],

    /*
    |--------------------------------------------------------------------------
    | Authentication Guards
    |--------------------------------------------------------------------------
    |
    | Next, you may define every authentication guard for your application.
    | Of course, a great default configuration has been defined for you
    | here which uses session storage and the Eloquent user provider.
    |
    | All authentication drivers have a user provider. This defines how the
    | users are actually retrieved out of your database or other storage
    | mechanisms used by this application to persist your user's data.
    |
    | Supported: "session", "token"

    | Em seguida, você pode definir todos os guarda de autenticação para seu aplicativo.
    | Obviamente, uma ótima configuração padrão foi definida para você
    | aqui, que usa armazenamento de sessão e o provedor de usuários Eloquent.
    |
    | Todos os drivers de autenticação têm um provedor de usuários. Isso define como o
    | os usuários são realmente recuperados do banco de dados ou de outro armazenamento
    | mecanismos usados ​​por este aplicativo para manter os dados do usuário.
    |
    | Suportado: "sessão", "token"
    |
    */

    'guards' => [
        'web' => [
            'driver' => 'session',
            'provider' => 'users',
        ],

        'api' => [
            'driver' => 'token',
            'provider' => 'users',
            'hash' => false,
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | User Providers
    |--------------------------------------------------------------------------
    |
    | All authentication drivers have a user provider. This defines how the
    | users are actually retrieved out of your database or other storage
    | mechanisms used by this application to persist your user's data.
    |
    | If you have multiple user tables or models you may configure multiple
    | sources which represent each model / table. These sources may then
    | be assigned to any extra authentication guards you have defined.
    |
    | Supported: "database", "eloquent"
    
    | Todos os drivers de autenticação têm um provedor de usuários. Isso define como o
    | os usuários são realmente recuperados do banco de dados ou de outro armazenamento
    | mecanismos usados ​​por este aplicativo para manter os dados do usuário.
    |
    | Se você tiver várias tabelas ou modelos de usuário, poderá configurar vários
    | fontes que representam cada modelo / tabela. Essas fontes podem então
    | ser atribuído a qualquer proteção extra de autenticação que você definiu.
    |
    | Suportado: "banco de dados", "eloquente"
    |
    */

    'providers' => [
        'users' => [
            'driver' => 'eloquent',
            'model' => App\User::class,
        ],

        // 'users' => [
        //     'driver' => 'database',
        //     'table' => 'users',
        // ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Resetting Passwords
    |--------------------------------------------------------------------------
    |
    | You may specify multiple password reset configurations if you have more
    | than one user table or model in the application and you want to have
    | separate password reset settings based on the specific user types.

    | Você pode especificar várias configurações de redefinição de senha se tiver mais
    | de uma tabela ou modelo de usuário no aplicativo e você deseja ter
    | separe as configurações de redefinição de senha com base nos tipos de usuário específicos.
 
    | The expire time is the number of minutes that the reset token should be
    | considered valid. This security feature keeps tokens short-lived so
    | they have less time to be guessed. You may change this as needed.

    | O tempo de expiração é o número de minutos que o token de redefinição deve ser
    | considerado válido. Esse recurso de segurança mantém os tokens de curta duração,
    | eles têm menos tempo para serem adivinhados. Você pode alterar isso conforme necessário.
    |
    */

    'passwords' => [
        'users' => [
            'provider' => 'users',
            'table' => 'password_resets',
            'expire' => 60,
            'throttle' => 60,
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Password Confirmation Timeout
    |--------------------------------------------------------------------------
    |
    | Here you may define the amount of seconds before a password confirmation
    | times out and the user is prompted to re-enter their password via the
    | confirmation screen. By default, the timeout lasts for three hours.
    
    | Aqui você pode definir a quantidade de segundos antes da confirmação da senha
    | expira e o usuário é solicitado a redigitar sua senha via
    | tela de confirmação. Por padrão, o tempo limite dura três horas.
    |
    */

    'password_timeout' => 10800,

];
