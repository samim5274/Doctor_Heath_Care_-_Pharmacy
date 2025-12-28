<?php

namespace App\Http\Controllers\Damage;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

use Auth;
use App\Models\Product;
use App\Models\Company;
use App\Models\Stock;
use App\Models\DamageMedicine;

class DamageController extends Controller
{
    public function index(){
        $company = Company::first();
        $products = Product::all();
        $data = DamageMedicine::all();
        return view('product.damage-product', compact('company', 'products', 'data'));
    }

    public function storeDamageProduct(Request $request){
        // Validate the request data
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'damage_quantity' => 'required|integer|min:1',
            'damage_reason' => 'required|string|max:500',
            'damage_date' => 'required|date',
            'remarks' => 'nullable|string|max:1000',
        ]);

        do { $batch_no = rand(1000000000, 9999999999); }
        while (DamageMedicine::where('batch_no', $batch_no)->exists());

        // Fetch the product to get unit price
        $product = Product::findOrFail($request->product_id);
        $unitPrice = $product->price;
        $totalLoss = $unitPrice * $request->damage_quantity;
        $product->stock = $product->stock - $request->damage_quantity;
        
        // Create a new DamageMedicine record
        $data = new DamageMedicine();

        $data->medicine_id = $request->product_id;
        $data->batch_no = $batch_no;
        $data->damage_quantity = $request->damage_quantity;
        $data->unit_price = $unitPrice;
        $data->total_loss = $totalLoss;
        $data->damage_reason = $request->damage_reason;
        $data->damage_date = Carbon::parse($request->damage_date);
        $data->user_id = Auth::guard('admin')->user()->id;
        $data->remarks = $request->remarks;

        $stock = new Stock();
        $stock->reg = $batch_no;
        $stock->date = Carbon::parse($request->damage_date);
        $stock->medicine_id = $request->product_id;
        $stock->stockOut = $request->damage_quantity;
        $stock->status = 4; // 1 sale, 2 return, 3 stock in and 4 stock out
        $stock->remark = 'Damage';

        $product->save();
        $data->save();
        $stock->save();
        return redirect()->back()->with('success', 'Damage product recorded successfully.');
    }

    public function editDamageProduct($id){
        $company = Company::first();
        $products = Product::all();
        $damage = DamageMedicine::findOrFail($id);
        return view('product.edit-damage-product', compact('company', 'products', 'damage'));
    }

    public function updateDamageProduct(Request $request, $id){
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'damage_quantity' => 'required|integer|min:1',
            'damage_reason' => 'nullable|string|max:500',
            'damage_date' => 'required|date',
            'remarks' => 'nullable|string|max:1000',
        ]);

        $damage = DamageMedicine::findOrFail($id);
        $product = Product::findOrFail($request->product_id);

        // Calculate stock difference
        $oldQty = $damage->damage_quantity;
        $newQty = $request->damage_quantity;
        $qtyDiff = $newQty - $oldQty;

        $product->stock = $product->stock - $qtyDiff;
        if($product->stock < 0){
            return redirect()->back()->with('error', 'Stock cannot be negative!');
        }

        $damage->damage_quantity = $newQty;
        $damage->unit_price = $product->price;
        $damage->total_loss = $product->price * $newQty;
        $damage->damage_reason = $request->damage_reason;
        $damage->damage_date = Carbon::parse($request->damage_date);
        $damage->user_id = Auth::guard('admin')->user()->id;
        $damage->remarks = $request->remarks;

        $stock = Stock::where('reg', $damage->batch_no)->first();
        if($stock){
            $stock->date = Carbon::parse($request->damage_date);
            $stock->stockOut = $newQty;
            $stock->remark = 'Damage';
            $stock->save();
        }

        $product->save();
        $damage->save();
        return redirect()->back()->with('success', 'Damage product updated successfully.');
    }

    public function damageProductList($id){
        $damage = DamageMedicine::findOrFail($id);
        $product = Product::findOrFail($damage->medicine_id);
        $product->stock = $product->stock + $damage->damage_quantity;
        $product->save();
        Stock::where('reg', $damage->batch_no)->delete();
        $damage->delete();
        return redirect()->back()->with('success', 'Damage product record deleted successfully.');
    }

    public function printDamageProductList(){
        $company = Company::first();
        $data = DamageMedicine::where('damage_date', Carbon::today()->format('Y-m-d'))->get();
        return view('product.print-damage-product-list', compact('company', 'data'));
    }
}
