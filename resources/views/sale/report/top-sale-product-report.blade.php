<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $company->name ?? "D.H.C Pharmacy" }}</title>
    <link rel="shortcut icon" type="image/png" href="./assets/images/logos/dhcpharmacy.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="{{ asset('assets/css/styles.min.css') }}">
</head>

<body>

    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        

        <!-- Sidebar Start -->
        @include('layouts.sidebar')
        <!--  Sidebar End -->
        <!--  Main wrapper -->
        <div class="body-wrapper">
            <!--  Header Start -->
            @include('layouts.topbar')
            <!--  Header End -->
            <div class="body-wrapper-inner">
                <div class="container-fluid">
                    @include('message.message')
                    <div class="mt-5">
                        <!-- Header with Title and Print -->
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-bold text-dark">Top 50 Medicine Sale</h3>
                            <!-- <a href="{{ url('/print-total-sale-report') }}" target="_blank" class="btn btn-outline-secondary">
                                <i class="fa-solid fa-print me-1"></i> Print Report
                            </a> -->
                        </div>

                        <div class="table-responsive" style="max-height: 900px; overflow-y: auto;">
                            <table class="table table-bordered table-hover align-middle" id="printableTable">
                                <thead class="table-primary text-center sticky-top bg-white">
                                    <tr>
                                        <th>#</th>
                                        <th class="text-start">Product</th>
                                        <th>Total Quantity</th>
                                        <th>Total Price (৳)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($cart as $id => $data)
                                    <tr>
                                        <td class="text-center">{{ $loop->iteration }}</td>
                                        <td>{{ $data['product_name'] }}</td>
                                        <td class="text-center">{{ $data['total_quantity'] }}</td>
                                        <td class="text-center">৳{{ $data['total_price'] }}/-</td>
                                    </tr>
                                    @endforeach
                                    <tr class="table-primary fw-bold">
                                        <td colspan="2">Grand Total:</td>
                                        <td class="text-center">{{ $grand_total_qty }}</td>
                                        <td class="text-center">৳{{ number_format($grand_total_price, 2) }}/-</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div> 
        </div>
    </div>

    <script src="{{ asset('assets/libs/jquery/dist/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/sidebarmenu.js') }}"></script>
    <script src="{{ asset('assets/js/app.min.js') }}"></script>
    <script src="{{ asset('assets/libs/apexcharts/dist/apexcharts.min.js') }}"></script>
    <script src="{{ asset('assets/libs/simplebar/dist/simplebar.js') }}"></script>

</body>
</html>