<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArtistesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('artistes', function (Blueprint $table) {

            $table->increments('id');
            
            $table->string('name');

            $table->string('sc_link', 150);
            
            $table->string('img_url', 300);

            $table->text('biographie');

            $table->boolean('isRoaster');

            $table->timestamps();
        
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('artistes');
    }
}
