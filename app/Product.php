<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Product extends Model
{    

    use HasSlug;

     //Os atributos que são atribuíveis em massa.
     protected $fillable = ['name', 'description', 'body', 'price', 'slug'];
    
    /**
     * Get the options for generating the slug.
     */
    public function getSlugOptions() : SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('name')
            ->saveSlugsTo('slug');
    }
   


    //Um produto para muitas loja -> Um pra muitos
    public function store()
    {
        return $this->belongsTo(Store::class);
    }

    //Tem muitos produtos para muitas categorias
    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }
    //Este Produto tem várias imagens
    public function photos()
    {
        return $this->hasMany(ProductPhoto::class);
    }

}//Final class Product
