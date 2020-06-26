<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class HomeController extends Controller
{
    private $product;
    //new ProductController(new Product());
    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $products = $this->product->limit(8)->orderBy('id','DESC')->get();

        
        return view('welcome', compact('products'));
    }

     public function single($slug)
     {
        $product = $this->product->whereSlug($slug)->first(); //Pegando Produto pelo slug

        return view('single', compact('product'));
     }

}



/**
 * Middleware: Dentro de aplicações web,     ele é um código ou programa que é executado entre a requisição(resquest) e a nossa aplicacao (é a lógica executada pelo acesso a uma determinada rota)
 * request -> aplicação (Acesso qualquer rota) <- Marketplace
 */