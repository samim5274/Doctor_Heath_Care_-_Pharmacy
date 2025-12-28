<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

use App\Models\Product;
use App\Models\Company;
use App\Models\Cart;
use Auth;
use App\Models\Order;
use App\Models\Stock;

class HomeController extends Controller
{
    public function index()
    {
        $company = Company::first();

        $start = Carbon::now()->subDays(6)->startOfDay();
        $end   = Carbon::now()->endOfDay();

        /* -----------------------------------
            1️⃣ Last 7 Days Sales & Due (1 query)
        ------------------------------------*/
        $ordersByDate = Order::select(
                DB::raw('DATE(date) as order_date'),
                DB::raw('SUM(payable) as total_sales'),
                DB::raw('SUM(due) as total_due')
            )
            ->whereBetween('date', [$start, $end])
            ->groupBy(DB::raw('DATE(date)'))
            ->get()
            ->keyBy('order_date');

        $dates = [];
        $totalSales = [];
        $totalDue = [];

        for ($i = 6; $i >= 0; $i--) {
            $date = Carbon::now()->subDays($i)->toDateString();
            $dates[] = Carbon::parse($date)->format('D');

            $totalSales[] = $ordersByDate[$date]->total_sales ?? 0;
            $totalDue[]   = $ordersByDate[$date]->total_due ?? 0;
        }

        /* -----------------------------------
            2️⃣ User wise sales (1 query)
        ------------------------------------*/
        $userSales = Order::select(
                'user_id',
                DB::raw('SUM(total) as total'),
                DB::raw('SUM(due) as due'),
                DB::raw('SUM(discount) as discount'),
                DB::raw('SUM(vat) as vat'),
                DB::raw('SUM(payable) as payable'),
                DB::raw('SUM(pay) as pay')
            )
            ->whereBetween('date', [$start, $end])
            ->with('user:id,name') // only required fields
            ->groupBy('user_id')
            ->paginate(5);

        return view('welcome', compact(
            'dates',
            'totalSales',
            'totalDue',
            'userSales',
            'company'
        ));
    }
}
