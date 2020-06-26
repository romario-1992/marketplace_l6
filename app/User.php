<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     * Os atributos que são atribuíveis em massa.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     * Os atributos que devem estar ocultos para matrizes.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     * Os atributos que devem ser convertidos para tipos nativos.
     *
     * @var array
     */
        protected $casts = [
            'email_verified_at' => 'datetime',            
        ];

        //Um usuário para muitas lojas 
        public function store()
        {
            //Parametro: Objeto, classe ou model que está relacionado.No caso, Store
            return $this->hasOne(Store::class);
            //return $this->hasOne(Store::class, 'usuario_id');
        }


        public function orders()
        {
            return $this->hasMany(UserOrder::class);
        }

    }


    // 1:1 - Um para um ( Usuario  e loja )
    // 1:N - Um pra muitos (Loja e Produtos) hasMany e belongsTo
    // N:N - Muitos pra Muitos (Produtos e Categoias) | belongsToMany