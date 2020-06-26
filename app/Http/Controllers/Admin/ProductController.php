<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Product;
use Symfony\Component\VarDumper\Caster\RedisCaster;
use App\Http\Requests\ProductRequest;
use App\Traits\UploadTrait;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{

    use UploadTrait;

    private $product;
    //new ProductController(new Product());
    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userStore = auth()->user()->store;//retorna o objeto loja
        $products = $userStore->products()->paginate(10);

        return view('admin.products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //$stores = \App\Store::all(['id', 'name']);
        $categories = \App\Category::all(['id', 'name']);

        return view('admin.products.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProductRequest $request)
    {        

        $data = $request->all();

        $categories = $request->get('categorias', null);

        //$store = \App\Store::find($data['store']);
        // Para retornar o objeto loja é necessário retornar como um atributo
        $store = auth()->user()->store; 
        //Cria um produto e retorna um objeto com as informações
        $product = $store->products()->create($data); 

        $product->categories()->sync($categories); // Acessa a ligação de produto com categorias e salvando na categoria

        if($request->hasFile('photos')){

            $images = $this->imageUpload($request->file('photos'), 'image');

            //inserção destas images/referência na base
            //$product->photos()->createMany(['image' => 'nome_da_foto.png'], ['image' => 'nome_da_foto.png']);
            $product->photos()->createMany($images);
        }
        
        flash('Produto Criado com sucesso!')->success();

        return redirect()->route('admin.products.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($product)
    {
        $product = $this->product->find($product);
        $categories = \App\Category::all(['id', 'name']);

        return view('admin.products.edit', compact('product', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $product
     * @return \Illuminate\Http\Response
     */
    public function update(ProductRequest $request, $product)
    {
        $data = $request->all();
        $categories = $request->get('categorias', null);

        $product = $this->product->find($product);
        $product->update($data);

        if(!is_null($categories)){
            $product->categories()->sync($data['categories']);
        }       

        if($request->hasFile('photos')){

            $images = $this->imageUpload($request->file('photos'), 'image');

            //inserção destas images/referência na base
            //$product->photos()->createMany(['image' => 'nome_da_foto.png'], ['image' => 'nome_da_foto.png']);
            $product->photos()->createMany($images);
        }
        

        flash('Produto Editado com sucesso!')->success();

        return redirect()->route('admin.products.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($product)
    {
      
        $product = $this->product->find($product);
        $product->delete();

        flash('Produto Removido com sucesso!')->success();

        return redirect()->route('admin.products.index');
    }


    
}//Final class
