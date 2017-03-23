<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        DB::table('users')->insert([
            'name' => 'Minh Luan',
            'email' => 'pnmluan@gmail.com',
            'password' => app('hash')->make('FuckingPersonalTrail'),
            'remember_token' => str_random(10),
        ]);

        DB::table('users')->insert([
            'name' => 'Clark Kent',
            'email' => 'superman@dc.com',
            'password' => app('hash')->make('superman'),
            'remember_token' => str_random(10),
        ]); 
    }
}
