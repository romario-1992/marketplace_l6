<?php

use Illuminate\Database\Seeder;

class StoreTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $stores = \App\Store::all();

        foreach($stores as $store)
        {
            $store->products()->save(factory(\App\Product::class)->make());
        }
    }
}

//    metodo save() = Trabalha com objetos
//    metodo create() = Trabalha com arrays
//    metodo make() = Uma estancia do objeto 
