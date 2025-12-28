<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'date',
        'user_id',
        'reg',
        'total',
        'discount',
        'vat',
        'payable',
        'pay',
        'due',
        'status',
        'paymentMethod',
        'customerName',
        'customerPhone',
    ];

    public function user(){
        return $this->belongsTo(Admin::class, 'user_id', 'id');
    }

    public function payment()
    {
        return $this->belongsTo(PaymentMethod::class, 'paymentMethod', 'id');
    }
}
