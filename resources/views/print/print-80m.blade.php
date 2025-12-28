<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice - {{ $company->name }}</title>

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        @page { size: 80mm auto; margin: 0; }

        body {
            font-family: Consolas, monospace;
            font-size: 10px;
            width: 68mm;
            margin: 0 auto;
            padding: 2mm;
            line-height: 1.3;
        }

        .invoice-header {
            text-align: center;
            border-bottom: 1px dashed #000;
            margin-bottom: 8px;
            padding-bottom: 5px;
        }

        .invoice-header h2 {
            font-size: 14px;
            text-transform: uppercase;
        }

        .invoice-header p {
            font-size: 10px;
        }

        .invoice-subheader {
            font-size: 10px;
            margin-bottom: 8px;
        }

        .info-line {
            display: flex;
            justify-content: space-between;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 9.5px;
        }

        thead {
            border-bottom: 1px dashed #000;
        }

        th, td {
            padding: 2px 0;
            text-align: right;
        }

        th:nth-child(1), td:nth-child(1) { width: 5%; text-align: left; }
        th:nth-child(2), td:nth-child(2) { width: 40%; text-align: left; }
        th:nth-child(3), td:nth-child(3) { width: 10%; }
        th:nth-child(4), td:nth-child(4) { width: 20%; }
        th:nth-child(5), td:nth-child(5) { width: 25%; }

        .totals-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 10px;
            margin-top: 8px;
        }

        .totals-table tr td {
            padding: 2px 0;
        }

        .totals-table td:first-child {
            text-align: left;
        }

        .totals-table td:last-child {
            text-align: right;
        }

        .totals-table .separator td {
            border-top: 1px dashed #000;
            padding-top: 4px;
        }

        .totals-table .final {
            font-weight: bold;
            font-size: 11px;
        }

        .totals-table .due {
            font-weight: bold;
            color: #000;
        }


        .separator {
            border-top: 1px dashed #000;
        }

        .final {
            font-weight: bold;
            font-size: 11px;
        }

        .note {
            text-align: center;
            font-size: 10px;
            margin-top: 10px;
        }
    </style>
</head>

<body>

{{-- HEADER --}}
<div class="invoice-header">
    <h2>{{ $company->name }}</h2>
    <p>{{ $company->address }}</p>
    <p>{{ $company->phone }} | {{ $company->email }}</p>
    <p><strong>INVOICE</strong></p>
</div>

{{-- INFO --}}
<div class="invoice-subheader">
    <div class="info-line">
        <span><strong>Officer:</strong> {{ optional($cart->first()->user)->name ?? 'N/A' }}</span>
        <span><strong>Date:</strong> {{ $order->created_at->format('d-m-Y') }}</span>
    </div>
    <div class="info-line">
        <span><strong>Customer:</strong> {{ $order->customerName }}</span>
        <span><strong>Phone:</strong> {{ $order->customerPhone }}</span>
    </div>
</div>

{{-- ITEMS --}}
<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Item</th>
            <th>Qty</th>
            <th>৳/U</th>
            <th>Total</th>
        </tr>
    </thead>
    <tbody>
        @foreach($cart as $key => $item)
        <tr>
            <td>{{ $key + 1 }}</td>
            <td>{{ \Illuminate\Support\Str::limit(optional($item->medicine)->name, 16) }}</td>
            <td>{{ $item->qty }}</td>
            <td>{{ number_format($item->unit_price, 2) }}</td>
            <td>{{ number_format($item->total_price, 2) }}</td>
        </tr>
        @endforeach
    </tbody>
</table>

{{-- TOTALS --}}
<table class="totals-table">
    <tr class="separator">
        <td>Subtotal</td>
        <td>৳{{ number_format($order->total, 2) }}</td>
    </tr>
    <tr>
        <td>Discount</td>
        <td>- ৳{{ number_format($order->discount, 2) }}</td>
    </tr>
    <tr>
        <td>VAT</td>
        <td>+ ৳{{ number_format($order->vat, 2) }}</td>
    </tr>
    <tr class="separator final">
        <td>Payable</td>
        <td>৳{{ number_format($order->payable, 2) }}</td>
    </tr>
    <tr>
        <td>Paid</td>
        <td>৳{{ number_format($order->pay, 2) }}</td>
    </tr>
    <tr class="final">
        <td>Due</td>
        <td>৳{{ number_format($order->due, 2) }}</td>
    </tr>
</table>

{{-- FOOTER --}}
<div class="note">
    Thank you for your purchase!  
    <br>
    Developed by <strong>ARS Soft.</strong>  || +8801762164746
</div>

    
    <div class="note">.</div>

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
