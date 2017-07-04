<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDroitsRolesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('droits_roles', function (Blueprint $table) {

            $table->increments('id');

            $table->integer('role_id')->unsigned();

            $table->integer('droit_id')->unsigned();

            $table->timestamps();

        });

        Schema::table('droits_roles', function (Blueprint $table) {

            $table->foreign('role_id')->references('id')->on('roles');

            $table->foreign('droit_id')->references('id')->on('droits');
            
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('droits_roles');
    }
}
