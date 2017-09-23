<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDisquesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('disques', function (Blueprint $table) {
        
            $table->increments('id');
        
            $table->string('disque_title');

            $table->string('image_url', 50);
        
            $table->integer('label_id')->unsigned();
        
            $table->timestamps();
        
        });

        Schema::table('disques',function (Blueprint $table){
        
            $table->foreign('label_id')->references('id')->on('labels');
        
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('disques');
    }
}
