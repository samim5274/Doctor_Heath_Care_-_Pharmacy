<?php

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use App\Models\Category;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Company;

class ProductController extends Controller
{
    public function productView(){
        $company = Company::first();
        $brands = Brand::all();
        $category = Category::all();
        $product = Product::with('category','brand')->paginate(20);
        return view('product.product-view', compact('product','brands','category', 'company'));
    }

    public function editView(){
        $company = Company::first();
        $brands = Brand::all();
        $category = Category::all();
        $product = Product::with('category','brand')->paginate(20);
        return view('product.edit-product-list', compact('product','brands','category', 'company'));
    }

    public function addMedicine(Request $request){
        // Validate inputs
        $validated = $request->validate([
            'name'             => 'required|string|max:255',
            'generic_name'     => 'nullable|string|max:255',
            'Brand'            => 'required|exists:brands,id',
            'category'         => 'required|exists:categories,id',
            'purchaseprice'    => 'required|numeric|min:0',
            'price'            => 'required|numeric|min:0',
            'stock'            => 'nullable|integer|min:0',
            'manufacture_date' => 'nullable|date',
            'expiry_date'      => 'nullable|date|after_or_equal:manufacture_date',
            'description'      => 'nullable|string|max:500',
        ]);

        $data = new Product();
        $data->name = $request->input('name','');
        $data->genericName = $request->input('generic_name','');
        $data->brand_id = $request->input('Brand','');
        $data->category_id = $request->input('category','');
        $data->purchase_price = $request->input('purchaseprice','');
        $data->price = $request->input('price','');
        $data->stock = $request->input('stock','');
        $data->manufacture_date = $request->input('manufacture_date','');
        $data->expiry_date = $request->input('expiry_date','');
        $data->description = $request->input('description','');
        $data->save();
        return redirect()->back()->with('success','New medicine addedd successfully.');
    }

    public function editProduct($id){
        $company = Company::first();
        $product = Product::where('id', $id)->first();
        if(empty($product)){
            return redirect()->back()->with('warning','Item not found. Try angain.');
        }
        $brands = Brand::all();
        $category = Category::all();
        return view('product.edit-product-view', compact('product','brands','category', 'company'));
    }

    public function updateProduct(Request $request){
        $id = $request->input('id', '');
        $product = Product::where('id', $id)->first();
        if(empty($product)){
            return redirect()->back()->with('warning','Item not found. Try angain.');
        }
        // Validate inputs
        $validated = $request->validate([
            'name'             => 'required|string|max:255',
            'generic_name'     => 'nullable|string|max:255',
            'Brand'            => 'required|exists:brands,id',
            'category'         => 'required|exists:categories,id',
            'purchaseprice'    => 'required|numeric|min:0',
            'price'            => 'required|numeric|min:0',
            'stock'            => 'nullable|integer|min:0',
            'manufacture_date' => 'nullable|date',
            'expiry_date'      => 'nullable|date|after_or_equal:manufacture_date',
            'description'      => 'nullable|string|max:500',
        ]);
        
        $product->name = $request->input('name','');
        $product->genericName = $request->input('generic_name','');
        $product->brand_id = $request->input('brand_id','');
        $product->category_id = $request->input('category_id','');
        $product->price = $request->input('price','');
        $product->stock = $request->input('stock','');
        $product->manufacture_date = $request->input('manufacture_date','');
        $product->expiry_date = $request->input('expiry_date','');
        $product->description = $request->input('description','');
        $product->update();
        return redirect()->route('product.view')->with('success','Medicine details updated successfully.');
    }

    public function expritedList(){
        $company = Company::first();
        $date = Carbon::today()->format('Ymd');
        $end = Carbon::today()->addDays(180)->format('Ymd');
        $product = Product::where('expiry_date', '<=', $date)->paginate(20);
        $total = Product::where('expiry_date', '<=', $date)->sum('price');
        $stock = Product::where('expiry_date', '<=', $date)->sum('stock');
        return view('product.expired-list', compact('product','total', 'stock', 'company'));
    }

    public function printExpiredList(){
        $company = Company::first();
        $date = Carbon::now()->format('Ymd');
        $company = Company::all();
        $product = Product::where('expiry_date', '<=', $date)->paginate(20);
        $total = Product::where('expiry_date', '<=', $date)->sum('price');
        $stock = Product::where('expiry_date', '<=', $date)->sum('stock');
        return view('product.print-expired-list', compact('product','company','total', 'stock', 'company'));
    }

    public function ExpritedListSixMont(){
        $company = Company::first();
        $date = Carbon::today()->addDays(180)->format('Ymd');
        $product = Product::where('expiry_date', '<=', $date)->paginate(20);
        $total = Product::where('expiry_date', '<=', $date)->sum('price');
        $stock = Product::where('expiry_date', '<=', $date)->sum('stock');
        return view('product.expired-list-6-month', compact('product','total', 'stock', 'company'));
    }

    public function printExpiredListSixMonth(){
        $company = Company::first();
        $date = Carbon::today()->addDays(180)->format('Ymd');
        $company = Company::all();
        $product = Product::where('expiry_date', '<=', $date)->paginate(20);
        $total = Product::where('expiry_date', '<=', $date)->sum('price');
        $stock = Product::where('expiry_date', '<=', $date)->sum('stock');
        return view('product.print-expired-list-6-month', compact('product','company','total', 'stock', 'company'));
    }

    public function damageProduct(){
        $company = Company::first();
        return view('product.damage-product', compact('company'));
    }

    public function liveSearchOrder(Request $request){
        $output = "";

        $product = Product::where('name', 'like', '%'.$request->search.'%')->orWhere('genericName', 'like', '%'.$request->search.'%')->get();

        foreach($product as $key => $val) {
            $edit = url('/edit-product/'.$val->id);
            $output .= '
            <tr>
                <td>'.++$key.'</td>
                <td class="px-0">
                    <div class="d-flex align-items-center">                        
                        <div class="ms-3">
                            <a href="'.$edit.'"><h6 class="mb-0 fw-bolder">'.$val->name.'</h6></a>
                            <span class="text-muted">'.$val->genericName.'</span>
                        </div>
                    </div>
                </td>
                <td class="px-0">'.$val->manufacture_date.'</td>
                <td class="px-0">'.$val->expiry_date.'</td>
                <td class="px-0">'.$val->brand->name.'</td>
                <td class="px-0">'.$val->category->name.'</td>
                <td class="px-0">'.$val->stock.'</td>
                <td class="px-0 text-dark fw-medium text-end">৳ '.$val->purchase_price.'/-</td>
                <td class="px-0 text-dark fw-medium text-end">৳ '.$val->price.'/-</td>
                <td class="px-0 text-dark fw-medium text-end">৳ '.$val->stock * $val->price.'/-</td>
            </tr>';
        }
        return response($output);
    }

    public function productSetting(){
        $company = Company::first();
        $brands = Brand::all();
        $category = Category::all();
        return view('product.product-setting', compact('company', 'brands', 'category'));
    }

    public function addCategory(Request $request){
        $validated = $request->validate([
            'txtCategory' => 'required|unique:categories,name',
            'txtDiscription' => 'nullable|max:255',
        ]);
        $data = new Category();
        $data->name = $request->input('txtCategory','');
        $data->description = $request->input('txtDiscription','');
        $data->save();
        return redirect()->back()->with('success','New category addedd successfully.');
    }

    public function updateCategory(Request $request){
        $validated = $request->validate([
            'txtCategory' => 'required|name',
            'txtDiscription' => 'nullable|max:255',
        ]);
        $id = $request->input('txtId', '');
        $category = Category::where('id', $id)->first();
        if(empty($category)){
            return redirect()->back()->with('warning','Category not found. Try angain.');
        }
        $category->name = $request->input('txtCategory','');
        $category->description = $request->input('txtDiscription','');
        $category->update();
        return redirect()->back()->with('success','Category details updated successfully.');
    }

    public function addBrand(Request $request){
        $validated = $request->validate([
            'txtBrand' => 'required|unique:brands,name',
            'txtDiscription' => 'nullable|max:255',
        ]);
        $data = new Brand();
        $data->name = $request->input('txtBrand','');
        $data->description = $request->input('txtDiscription','');
        $data->save();
        return redirect()->back()->with('success','New brand addedd successfully.');
    }

    public function updateBrand(Request $request){
        $validated = $request->validate([
            'txtBrand' => 'required',
            'txtDiscription' => 'nullable|max:255',
        ]);
        $id = $request->input('txtId', '');
        $brand = Brand::where('id', $id)->first();
        if(empty($brand)){
            return redirect()->back()->with('warning','Brand not found. Try angain.');
        }
        $brand->name = $request->input('txtBrand','');
        $brand->description = $request->input('txtDiscription','');
        $brand->update();
        return redirect()->back()->with('success','Brand details updated successfully.');
    }
}
