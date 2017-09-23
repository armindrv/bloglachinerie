<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategorieUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categorie_users', function (Blueprint $table) {

            $table->engine = 'InnoDB';
            
            $table->integer('user_id')->unsigned();

            $table->integer('categorie_id')->unsigned();
            
            $table->timestamps();
        
        });

        Schema::table('categorie_users', function (Blueprint $table){
      
            $table->foreign('user_id')->references('id')->on('users');
      
            $table->foreign('categorie_id')->references('id')->on('categories');

            $table->primary(['user_id', 'categorie_id']);
      
        });
    }

     /**
     * Reverse the migrations.
     *
     * @return void
     */

    public function down()
    {
        Schema::dropIfExists('categorie_users');
    }
}