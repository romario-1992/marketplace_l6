<?php

namespace App\Traits;

use Illuminate\Http\Request;

trait UploadTrait 
{

    private function imageUpload($images, $imageColumn = null)
    {

             
        $uploadedImages = [];

        if(is_array($images)){

            foreach($images as $image){
                // Metodo Store = 1 parametro = nome da pasta -> 2 Parametro nome do disco
               // $uploadImages = $image->store('products', 'public');               

                    $uploadedImages[] = [$imageColumn => $image->store('products', 'public')];
                            
            }

        } else {
            $uploadedImages = $images->store('logo', 'public');
        }

          

        return $uploadedImages;

    }


}