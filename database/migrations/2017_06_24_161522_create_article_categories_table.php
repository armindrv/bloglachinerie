<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArticleCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('article_categories', function (Blueprint $table) {

            $table->increments('id');
      
            $table->integer('categorie_id')->unsigned();
      
            $table->integer('article_id')->unsigned();
      
            $table->timestamps();
      
        });

        Schema::table('article_categories',function (Blueprint $table){
      
            $table->foreign('article_id')->references('id')->on('articles');
      
            $table->foreign('categorie_id')->references('id')->on('categories');
      
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('article_categories');
    }
}
