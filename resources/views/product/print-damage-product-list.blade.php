<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Print Damage Product List</title>
    <style>
        body { font-family: DejaVu Sans, sans-serif; margin: 20px; }
        h2, h4, p { margin: 0; padding: 0; }
        .header { text-align: center; margin-bottom: 20px; }
        .header h2 { font-size: 26px; }
        .header p { font-size: 14px; }
        hr { border: 1px solid #ccc; margin: 10px 0; }

        table { width: 100%; border-collapse: collapse; margin-top: 15px; font-size: 14px; }
        th, td { border: 1px solid #ddd; padding: 6px 8px; text-align: center; }
        th { background-color: #e0f7fa; font-weight: 600; }
        tr.total-row { background-color: #f2f2f2; font-weight: 600; }

        .badge { padding: 2px 6px; border-radius: 4px; font-size: 12px; color: #fff; }
        .bg-info { background-color: #17a2b8; }
        .bg-secondary { background-color: #6c757d; }
        .bg-danger { background-color: #dc3545; }

        .text-danger { color: #dc3545; font-weight: bold; }

        .signatures { display: flex; justify-content: space-between; margin-top: 50px; }
        .sign-box { text-align: center; }
        .sign-box p { margin-bottom: 5px; }

        .note { margin-top: 30px; font-size: 12px; text-align: center; color: #555; }
    </style>
</head>
<body>

    <div class="header">
        <h2>{{ $company->name }}</h2>
        <p>{{ $company->address }}</p>
        <p>Mobile: {{ $company->phone }} | Website: {{ $company->website }}</p>
        <h4>Damage Product List</h4>
    </div>
    <hr>

    <p>Officer: {{ Auth::guard('admin')->check() ? Auth::guard('admin')->user()->name : 'N/A' }}</p>

    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Damage Date</th>
                <th>Product</th>
                <th>Brand</th>
                <th>Category</th>
                <th>Unit Price (৳)</th>
                <th>Damage Qty</th>
                <th>Total Loss (৳)</th>
            </tr>
        </thead>
        <tbody>
            @php
                $totalQty = 0;
                $totalLoss = 0;
            @endphp
            @forelse($data as $key => $item)
                @php
                    $totalQty += $item->damage_quantity;
                    $totalLoss += $item->total_loss;
                @endphp
                <tr>
                    <td>{{ $key + 1 }}</td>
                    <td>{{ \Carbon\Carbon::parse($item->damage_date)->format('d M Y') }}</td>
                    <td>{{ $item->product->name ?? 'N/A' }}</td>
                    <td><span class="badge bg-info">{{ $item->product->brand->name ?? 'N/A' }}</span></td>
                    <td><span class="badge bg-secondary">{{ $item->product->category->name ?? 'N/A' }}</span></td>
                    <td>৳ {{ number_format($item->unit_price, 2) }}</td>
                    <td><span class="badge bg-danger">{{ $item->damage_quantity }}</span></td>
                    <td class="text-danger">৳ {{ number_format($item->total_loss, 2) }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="8" class="text-muted">No damaged products found.</td>
                </tr>
            @endforelse

            <tr class="total-row">
                <td colspan="6" style="text-align: right;">Total:</td>
                <td>{{ $totalQty }}</td>
                <td>৳ {{ number_format($totalLoss, 2) }}</td>
            </tr>
        </tbody>
    </table>

    <div class="signatures">
        <div class="sign-box">
            <p>--------------------------</p>
            <strong>Manager Signature</strong>
        </div>
        <div class="sign-box">
            <p>--------------------------</p>
            <strong>Admin Signature</strong>
        </div>
    </div>

    <p class="note">
        This software is developed by <strong>ARS Soft</strong> created by <strong>SAMIM-HosseN</strong>. Call: +8801 5330 21557. Thank You!
    </p>

    <script>
        window.onload = function() {
            window.print();
            setTimeout(() => {
                window.close();
            }, 300); 
        };
    </script>

</body>
</html>
