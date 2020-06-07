<?php

use Illuminate\Database\Seeder;
use App\Product;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=1; $i < 21; $i++) { 
            
            Product::create([
                'name' => 'Laptop' . $i,
                'slug' => 'Laptop' . $i,
                'details' => 'MacBook Air with Touch ID MVFH2 Mid 2019 Model - Intel Core i5-8th Gen, ' . rand(13, 19) . '-Inch Retina With TrueTone, 128 GB SSD, 8 GB RAM, Eng-KB, MacOS, Space Gray, International Version',
                'price' => rand(1300, 3000),
                'description' =>    'Keyboard Languages : English
                                    Touch screen : No
                                    Usage : Multi
                                    Memory Technology : LPDDR3
                                    Screen Size Range : 13 - 13.9 Inch
                                    Display Size (Inch) : 13.3 Inch
                                    External Product ID Type : UPC-A
                                    Optical Drive Type : Without Optical Drive
                                    Number of Processor Core : Dual Core
                                    RAM Type : ddr_sdram
                                    RAM Size : 8 GB
                                    Operating System Type : Mac
                                    Processor Family : Intel 8th Generation Core i5'
            ])->categories()->attach(1);

        }

        for ($i=1; $i < 21; $i++) { 
            
            Product::create([
                'name' => 'TV' . $i,
                'slug' => 'TV' . $i,
                'details' => 'Samsung '. rand(32, 70) .' Inch 4K Ultra HD Smart LED TV with Built-in Receiver, UA58RU7100 - Black',
                'price' => rand(500, 1000),
                'description' =>    'Picture Engine: UHD Engine
                                    Motion Rate: 100
                                    PQI (Picture Quality Index): 1400
                                    HDR (High Dynamic Range): HDR
                                    HDR 10+: Yes
                                    HLG (Hybrid Log Gamma): Yes
                                    Contrast: Mega Contrast
                                    Color: PurColor
                                    Micro Dimming: UHD Dimming
                                    Contrast Enhancer: Yes
                                    Auto Motion Plus: Yes
                                    Film Mode: Yes
                                    Natural Mode Support: Yes'
            ])->categories()->attach(2);
        }

        for ($i=1; $i < 21; $i++) {

            Product::create([
                'name' => 'Shoes' . $i,
                'slug' => 'Shoes' . $i,
                'details' => 'SPORT Fashion Sneakers For Men - Gray',
                'price' => rand(50,100),
                'description' =>    'Color : White & Red
                                    Material : Mixed
                                    Size : 45 EU
                                    Targeted Group : Men
                                    Style : Fashion Sneakers
                                    Occasion : Casual Shoe'
            ])->categories()->attach(4);
        }
        
        for ($i=1; $i < 21; $i++) { 
            
            Product::create([
                'name' => 'Watch' . $i,
                'slug' => 'Watch' . $i,
                'details' => 'Casio Vibration Alarm For Men Digital Resin Band Watch W 735H 2Av, Quartz',
                'price' => 99,
                'description' =>    'Brand: Casio
                                    Model Number: W-735H-2AV
                                    Watch Type: Sport Watch
                                    Watch Shape: Round
                                    Movement: Quartz
                                    Display Type: Digital
                                    Dial Color: Black
                                    Dial Window Material: Resin
                                    Case Material: Resin
                                    Case Diameter: 51.4 mm
                                    Case Thickness: 16.1 mm
                                    Band Material: Resin'
            ])->categories()->attach(3);
        }

        $products = Product::find([1,2,10,15,25,30,35]);

        foreach ($products as $pro) {
            $pro->categories()->attach(5);
        }
        

        /*Product::create([
        	'name' => 'Book',
        	'slug' => 'Book',
        	'details' => 'sunt in culpa qui officia',
        	'price'	=> 199,
        	'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ]);

        Product::create([
        	'name' => 'T-shirt',
        	'slug' => 'T-shirt',
        	'details' => 'Excepteur sint unt in culpa qui officia',
        	'price'	=> 59,
        	'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ]);

        Product::create([
        	'name' => 'Smartphone',
        	'slug' => 'Smartphone',
        	'details' => 'Excepteur sint occaecat qui officia',
        	'price'	=> 6999,
        	'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ]);

        Product::create([
        	'name' => 'Ipad',
        	'slug' => 'Ipad',
        	'details' => 'Excepteur sint occaecat cupidatat non proident',
        	'price'	=> 10999,
        	'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ]);

        Product::create([
            'name' => 'PC',
            'slug' => 'PC',
            'details' => 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia',
            'price' => 9999,
            'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
        ]);*/
    }
}
