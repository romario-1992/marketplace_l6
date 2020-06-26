<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CartController extends Controller
{

    public function index()
    {
        $cart = session()->has('cart') ? session()->get('cart'): [];

        return view('cart', compact('cart'));
    }

    public function add(Request $request)
    {
        $product = $request->get('product');               
        
        //Verificar se existe sessao para os produtos
        if(session()->has('cart')){
            $products = session()->get('cart');//Itens da sessão
            $productsSlugs = array_column($products, 'slug');//Pega a coluna slug

            if(in_array($product['slug'], $productsSlugs)) { 
                $products = $this->productIncrement($product['slug'], $product['amount'], $products);
                session()->put('cart', $products); //Metodo put = Cria a chave na sessão
            } else {
              //existtindo eu adiciono este produto na sessao existente
             //Metodo push = Atualiza a chave da sessão
             session()->push('cart', $product);
            }
             
        } else {
             //nao existindo eu crio esta sessão com o primeiro produto
             $products[] = $product;
            //Metodo put = Cria a chave na sessão
             session()->put('cart', $products);
        }

        flash('Produto Adionado no carrinho')->success();

        return redirect()->route('product.single', ['slug' => $product['slug']]);      

    }


    public function remove($slug)
    {   
        //Se não tiver na sessão o cart redireciona para o cart.index
        if(!session()->has('cart')){
            return redirect()->route('cart.index');
        }
        
        //Pega os produtos da sessão
        $product = session()->get('cart');

        //Retornar todos os array com valores diferentes dos slugs passado na url
        $products = array_filter($product, function($line) use($slug){
            return $line['slug'] != $slug; //Retorna somenta a linha do array na chave slug que não senha igual ao slug da url
        });

        //Atualiza a session cart com o put sem o slug removido
        session()->put('cart', $products);

           return redirect()->route('cart.index');
    }


    public function cancel()
    {   
        
        session()->forget('cart');

        flash('Desistencia da compra realizada com sucesso')->success();

        return redirect()->route('cart.index');   

    }

    public function productIncrement($slug, $amount, $products)
    {
        $products = array_map(function($line) use($slug, $amount){
            if($slug == $line['slug']) {
                $line['amount'] += $amount;
            }

            return $line;

        }, $products);

        return $products;
    }



}
