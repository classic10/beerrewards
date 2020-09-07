<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([ 'user_type'=>0, 'name' => null, 'title' => null,  'first_name'=> 'guest', 'last_name'=>'guest', 'dob'=>'1991-10-26', 'mobile'=>null,'email'=>'guest'.date('Y_m_d_h_i_s').'@guest.com','password'=>Hash::make('guest@1234')]);
        DB::table('users')->insert([ 'user_type'=>1,'name' => null, 'title' => 'Mr.',  'first_name'=> 'Manu', 'last_name'=>'Garg', 'dob'=>'1990-10-26', 'mobile'=>null,'email'=>'manu.garg@classicinformatics.com','password'=>Hash::make('123456')]);
    }
}
