<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSectionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sections', function (Blueprint $table) {

            $table->increments('id');
            
            $table->text('content');
            
            $table->integer('article_id')->unsigned();
            
            $table->integer('typeSection_id')->unsigned();
            
            $table->timestamps();

        });

        Schema::table('sections', function (Blueprint $table) {

            $table->foreign('typeSection_id')->references('id')->on('section_types');
            
            $table->foreign('article_id')->references('id')->on('articles');

        });
    }
/**/
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sections');
    }
}
