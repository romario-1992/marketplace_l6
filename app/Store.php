<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Store extends Model
{
    use HasSlug;

     //protected  $table = 'tb_lojas'; -> para redefinir o nome de uma tabela

    //Os atributos que são atribuíveis em massa.
    protected $fillable = ['name', 'description', 'phone', 'mobile_phone', 'slug', 'logo'];
    
    /**
     * Get the options for generating the slug.
     */
    public function getSlugOptions() : SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('name')
            ->saveSlugsTo('slug');
    }
  


    // Uma loja para um usuário
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    //Uma loja para muitos Produtos
    public function products()
    {
        return $this->hasMany(Product::class);
    }

    //Uma loja tem muitos pedidos
    public function orders()
    {
        return $this->hasMany(UserOrder::class);
    }


  



}//Final Model Store



// Store -> stores
// Stores

// Product -> products

// Pela converção o laravel vai sempre produta a tabela no plural do Model.
// Ou seja, model Product -> tabela Products