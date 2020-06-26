<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
//      DB::table('users')->insert(
//          [
//              'name' => 'Administrator',
//              'email' => 'admin@admin.com',
//              'email_verified_at' => now(),
//             'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
//              'remember_token' => 'okokokokokdsds',
//         ]
//      );

//    metodo save() = Trabalha com objetos
//    metodo create() = Trabalha com arrays
//    metodo make() = Uma estancia do objeto 

    //Função factory -> definição para o model user -> numeros de usuários a ser criado, metodo create para criar a factory
    //factory(\App\User::class, 40)->create();

    //Gerando fabrica de usuários e criando fabrica de lojas
    factory(\App\User::class, 40)->create()->each(function($user){
        $user->store()->save(factory(\App\Store::class)->make());
    });


    }//FINAL METODO RUN

    

}//Final class
