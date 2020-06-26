<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\ProductPhoto;


class ProductPhotoController extends Controller
{
    public function removePhoto(Request $request)
    {   

        $photoName = $request->get('photoName');
        //Busco a foto no banco        

        //Removo dos arquivos
        if(Storage::disk('public')->exists($photoName)){ //Verifica se a imagem esta no arquivo
            Storage::disk('public')->delete($photoName); // Se estiver remove
        }

        //Removo a imagem do banco
        $removePhoto = ProductPhoto::where('image', $photoName);

        $productId = $removePhoto->firt()->product_id;//Pegando a coluna do ID do produto e usando no redirecionamento
        
        $removePhoto->delete();

        flash('Imagem Removida com sucesso')->success();

        return redirect()->route('admin.product.edit', ['product' => $productId]);

    }
}
