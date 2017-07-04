<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTitreArtistesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('titre_artistes', function (Blueprint $table) {

            
            $table->increments('id');
        
            $table->integer('titre_id')->unsigned();

            $table->integer('artiste_id')->unsigned();

            $table->timestamps();
        
        });

        Schema::table('titre_artistes', function (Blueprint $table) {

            $table->foreign('titre_id')->references('id')->on('titres');
            
            $table->foreign('artiste_id')->references('id')->on('artistes');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('titre_artistes');
    }
}
