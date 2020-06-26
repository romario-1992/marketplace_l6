<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductPhoto extends Model
{
        protected $fillable = ['image'];

        
        //Esta imagem pertence a um produto
        public function product()
        {
            return $this->belongsTo(Product::class);
        }

}
