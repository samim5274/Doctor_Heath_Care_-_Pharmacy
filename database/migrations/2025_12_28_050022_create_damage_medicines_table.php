<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('damage_medicines', function (Blueprint $table) {
            $table->id();
            $table->foreignId('medicine_id')->constrained('products')->onDelete('restrict');
            $table->string('batch_no')->nullable();
            $table->integer('damage_quantity');
            $table->decimal('unit_price', 10, 2);
            $table->decimal('total_loss', 10, 2);
            $table->text('damage_reason')->nullable();
            $table->date('damage_date');
            $table->foreignId('user_id')->constrained('admins')->onDelete('restrict');
            $table->text('remarks')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('damage_medicines');
    }
};
