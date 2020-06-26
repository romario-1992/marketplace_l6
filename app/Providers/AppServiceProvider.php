<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     * Registra qualquer servico na aplicação laravel
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     * Inicia qualqier registro na aplicação
     * @return void
     */
    public function boot()
    {
        \PagSeguro\Library::initialize();
        \PagSeguro\Library::cmsVersion()->setName("Marketplace")->setRelease("1.0.0");
         \PagSeguro\Library::moduleVersion()->setName("Marketplace")->setRelease("1.0.0");
    }
}
