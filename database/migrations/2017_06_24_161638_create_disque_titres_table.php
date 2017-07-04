<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDisqueTitresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('disque_titres', function (Blueprint $table) {
       
            $table->increments('id');

            $table->string('track_number');
       
            $table->integer('disque_id')->unsigned();
       
            $table->integer('titre_id')->unsigned();
       
            $table->timestamps();
       
        });

        Schema::table('disque_titres', function (Blueprint $table) {
       
            $table->foreign('disque_id')->references('id')->on('disques');
       
            $table->foreign('titre_id')->references('id')->on('titres');

            $table->string('track_number', 2)->change();
       
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('disque_titres');
    }
}
