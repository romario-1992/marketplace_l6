<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Category extends Model
{
    use HasSlug;

    //Os atributos que são atribuíveis em massa.
    protected $fillable = ['name', 'description', 'slug'];
    
    /**
     * Get the options for generating the slug.
     */
    public function getSlugOptions() : SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('name')
            ->saveSlugsTo('slug');
    }

    
    
    //Tem muitas categorias para muitos produtos
    public function products()
    {   
        return $this->belongsToMany(Product::class); //category_product
        //return $this->belongsToMany(Product::class, 'products_categories'); //category_product
    }
}
