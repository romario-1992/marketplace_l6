<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    $helloWorld = "Hello Romário";
//    return view('welcome', ['teste' => $helloWorld]);
//    return view('welcome', compact('helloWorld'));
//});

//Route::get -> Recupera as coias
//Route::post -> cria alguma coisa
//Route::put -> Atualização
//Route::patch -> atualização
//Route::delete -> remoção
//Route::options -> retorna quais cabeçalho a rota responde.


//Route::get('model', function(){

    //Modelo = Active Record

    //$products = \App\Product::all(); // Select * from products
  

    //$user = new \App\User();
    //$user = \App\User::find(1); //Select * from users WHERE id = id
    //$user->name = 'Usuário Teste Editad...';
    // $user-> email = '';
    //$user->password = bcrypt('123456'); // função Helpper

    //$user->save(); // Retorna true ou false da execução
    
    //return $products;

    // Quando retornamnos um objeto All() ele pega a estrutura do objeto e converte para Json.

    // \App\User::all() - Retorna todos os usuários
    // \App\User::find(3); - Retorna o usuário com base no id

    // \App\User::where('name', 'Corbin Waters')->get(); - 'select * from users where name = Corbin Waters'
    // \App\User::where('name', 'Corbin Waters')->first(); - Retorna o primeiro resultado encontrado
    // \App\User::paginate(10) - Páginar dados com o laravel retorn um Json. Número de Página e passado com parametro.


    // **********************************************************************

    //Mass Assigment -- Atribuição em Massa

    //$user = \App\User::create([
     //   'name' => 'Nanderson Castro',
     //   'email' => 'email100@gmail.com',
     //   'password' => bcrypt('1234566')
    //]); 

    // create retorna o objeto

    //dd($user);


    // *****************************************


    // Mass Update = Atualização em massa

    // $user = \App\User::find(42);
    //$user->update([
    //    'name' => 'Atualizado com a Mass Update'
    //]); 

    // update return true ou false

    // ***********************************************

    //Como eue faria para pegar a loja de um usuário 

    //$user = \App\User::find(4);
    
    // return $user->store(); // O objeto Único (Store) 
    //dd($user->store()->count()); // O objeto Único (Store) 

    
    // **************************************************
    //Pegar os Produtos de uma loja

    //$loja = \App\Store::find(1);
    
    //return $loja->products; // Chamando como atributo o laracvel retorna a coleção completa para ser tabalhada
    //return $loja->products->count();
    //return $loja->products()->where('id', 1)->get(); // Chamando como metodo é possivel fazer mais tratativas em cima da coleção. Por exemplo: usar o count e etc.
 
    // ****************************************************

    // Pegar as lojas de uma Categoria de uma loja

    //$categoria = \App\Category::find(1);
    //$categoria->products;

    //Criar uma loja para um usuário

   // $user = \App\User::find(10);
    //$store = $user->store()->create([
      //  'name' => 'Loja teste',
      //  'description' => 'Loja teste de produtos de informática',
      //  'phone' => 'xx-xxxxx-xxxx',
      //  'mobile_phone' => 'xx-xxxxx-xxxx',
      //  'slug' => 'loja-teste'
    //]);

    //dd($store);     


    //criar um produto para uma loja
 //   $store = \App\Store::find(41);

 //   $store->products()->create([
 //       'name' => 'Notebook dell',
 //       'description' => 'CORE I5 10GB',
 //       'body' => 'Qualquer coisa',
 //       'price' => 2999.90 ,
 //       'slug' => 'notebook-dell'
//    ]);

 //   dd($store);

    //Criar uma categoria

  //  $category = \App\Category::create([
  //      'name' => 'Games',
  //      'description' => '',
   //     'slug' => 'games'
   // ]);

  //  $category = \App\Category::create([
  //      'name' => 'Notebooks',
  //      'description' => '',
 //       'slug' => 'notebooks'
  //  ]);

  //  return \App\Category::all();


    //Adicionar um produto para uma categoria ou vice-versa

    //$products = \App\Product::find(41);
    
    //Adiciona um produto a uma categoria
    //$products->categories()->attach([1]);

    //Remove um produto de uma categoria
    //$products->categories()->detach([1]);

    //dd($products->categories()->sync([2])); // 

    //return \App\User::all();
//});

// prexifo, namespace

use App\Http\Controllers\CheckoutController;
use Psy\VersionUpdater\Checker;

Route::get('/', 'HomeController@index')->name('home');
Route::get('/product/{slug}', 'HomeController@single')->name('product.single');

Route::prefix('cart')->name('cart.')->group(function(){

    Route::get('/', 'CartController@index')->name('index');
    Route::post('/add', 'CartController@add')->name('add');

    Route::get('/remove/{slug}', 'CartController@remove')->name('remove');

    Route::get('/cancel', 'CartController@cancel')->name('cancel');
    

});


Route::prefix('checkout')->name('checkout.')->group(function(){

    Route::get('/', 'CheckoutController@index')->name('index');
    Route::post('/proccess', 'CheckoutController@proccess')->name('proccess');
    
});


Route::group( ['middleware' => ['auth']], function(){
  Route::prefix('admin')->name('admin.')->namespace('Admin')->group(function(){

    //  Route::prefix('stores')->name('stores.')->group(function(){
    
    //    Route::get('/', 'StoreController@index')->name('index');
    //    Route::get('/create', 'StoreController@create')->name('create');
    //    Route::post('/store', 'StoreController@store')->name('store'); 
    //    Route::get('/{store}/edit', 'StoreController@edit')->name('edit'); 
    //    Route::post('/update/{store}', 'StoreController@update')->name('update');
    //    Route::get('/destroy/{store}', 'StoreController@destroy')->name('destroy');
    
    //  }); 
      
      Route::resource('stores', 'StoreController');
      Route::resource('products', 'ProductController');
      Route::resource('categories', 'CategoryController');

      Route::post('photo/remove', 'ProductPhotoController@removePhoto')->name('photo.remove');
      
    });
});

Auth::routes();

//Route::get('/home', 'HomeController@index')->name('home');//->middleware('auth');
