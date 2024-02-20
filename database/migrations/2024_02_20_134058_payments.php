<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{



  public function up(): void{
    Schema::create('payments', function (Blueprint $table) {
        $table->id()
        ;$table->string('payment_id');
        $table->string('numero_serie');$table->string('quantity');
        $table->string('amount');$table->string('currency');
        $table->string('payment_status');$table->string('payment_method');$table->timestamps();
    });
}


  public function down(): void{Schema::dropIfExists('payments');}
};
