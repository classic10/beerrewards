<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangesInUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('name')->nullable()->change();
            /**
             *  USER TYPE
             *  0 - Guest User
             *  1 - Registered User
             */
            $table->integer('user_type')->default(0)->after('name');
            $table->string('title', '10')->nullable()->after('user_type');
            $table->string('first_name')->nullable()->after('title');
            $table->string('last_name')->nullable()->after('first_name');
            $table->date('dob')->nullable()->after('last_name');
            $table->string('mobile', '20')->nullable()->after('dob');
            $table->string('postcode', '10')->nullable()->after('mobile');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('name')->nullable(false)->change();
            $table->dropColumn(['user_type','title','first_name', 'last_name', 'dob','mobile','postcode']);
        });
    }
}
