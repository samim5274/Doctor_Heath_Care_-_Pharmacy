<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DamageMedicine extends Model
{
    use HasFactory;

    protected $fillable = [
        'medicine_id',
        'batch_no',
        'damage_quantity',
        'unit_price',
        'total_loss',
        'damage_reason',
        'damage_date',
        'user_id',
        'remarks',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'medicine_id');
    }

    public function user()
    {
        return $this->belongsTo(Admin::class, 'user_id');
    }
}
