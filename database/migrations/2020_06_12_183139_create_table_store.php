<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTableStore extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stores', function (Blueprint $table) {
            $table->bigIncrements('id');
            //unsigned = Esse atributo é usado para permitir somente valores positivos ...
            //INT pode alocar valores até 2.1 bilhões e um BIGINT pode alocar um valor qualquer de até 20 dígitos.
            $table->unsignedBigInteger('user_id');
            $table->string('name');
            $table->string('description');
            $table->string('phone');
            $table->string('mobile_phone');
            $table->string('slug');

            $table->timestamps(); //usuários (users) -> Lojas (Strore)

            //Chave estrangeira para a coluna users_id
            //A coluna user_id recebe uma chave estrangeira que vai referenciar a coluna id da tabela users
            $table->foreign('user_id')->references('id')->on('users');//stores_user_id_foreign (Nome da tabela_nome da coluna_foreign)
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stores');
    }
}
