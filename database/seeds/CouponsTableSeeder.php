<?php

use Illuminate\Database\Seeder;
use App\Coupon;

class CouponsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		Coupon::create([
			'code' => 'fixed123',
			'type' => 'fixed',
			'value' => 30
		]);

		Coupon::create([
			'code' => 'percent123',
			'type' => 'percent',
			'percent_off' => 25
		]);
    }
}
