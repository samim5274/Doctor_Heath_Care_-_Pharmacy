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
    @include('layouts.sidebar')
    <div class="body-wrapper">
        @include('layouts.topbar')
        <div class="body-wrapper-inner">
            <div class="container-fluid">
                @include('message.message')
                <div class="mt-4">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="m-0">Stock In</h4>
                        <h5 class="m-0 text-primary">
                            <a href="{{url('/print/total/stock/report')}}" target="_blank"><i class="fa-solid fa-print"></i> Print </a>
                        </h5>
                    </div>
                    
                    <div class="table-responsive" style="max-height: 700px; overflow-y: auto;">
                        <table class="table table-bordered table-hover align-middle" id="productTable">
                            <thead>
                                <div class="row mb-3">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                                        <input type="text" id="tableSearch" class="form-control" placeholder="Search product by name...">
                                    </div>
                                </div>
                            </thead>
                            <thead class="table-primary text-center sticky-top bg-white">
                                <tr>
                                    <th>#</th>
                                    <th class="text-start">Product</th>
                                    <th>Stock</th>
                                    <th>P.U Price (৳)</th>
                                    <th>S.U Price (৳)</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($data as $key => $val)
                                <tr>
                                    <td class="text-center">{{ $loop->iteration }}</td>
                                    <td>
                                        <a href="{{url('/edit-product/'.$val->id)}}"><h6 class="mb-0 fw-bolder">{{$val->name}}</h6></a>
                                        <span class="text-muted">{{$val->genericName}}</span>
                                    </td>
                                    <td class="text-center">{{$val->stock}}</td>
                                    <td class="text-center">৳{{$val->purchase_price}}/-</td>
                                    <td class="text-center">৳{{$val->price}}/-</td>
                                    <td class="text-center">৳{{$val->stock * $val->price}}/-</td>
                                    <td class="text-center">
                                        <button class="btn btn-sm btn-outline-primary"
                                            data-bs-toggle="modal"
                                            data-bs-target="#addStockModal{{ $val->id }}">
                                        <i class="fas fa-square-plus"></i> Add
                                    </button>
                                </td>
                                </tr>
                                @endforeach
                                <tr class="table-primary bg-white">
                                    <td colspan="2">Total</td>
                                    <td class="text-center">{{$data->sum('stock')}}</td>
                                    <td class="text-center">৳{{$data->sum('purchase_price')}}/-</td>
                                    <td class="text-center">৳{{$data->sum('price')}}/-</td>
                                    <td class="text-center">৳{{$data->sum('price') * $data->sum('stock')}}/-</td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>     
                    
                    <div class="d-flex justify-content-end mt-3">
                        <div class="d-flex justify-content-end mt-3">
                            1 of 1 pages
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</div>

@foreach($data as $item)
<div class="modal fade" id="addStockModal{{ $item->id }}" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">

            {{-- Header --}}
            <div class="modal-header bg-light">
                <h5 class="modal-title">
                    <i class="fas fa-boxes"></i> Add Stock
                </h5>
                <button type="button" class="btn-close btn-close-dark" data-bs-dismiss="modal"></button>
            </div>

            {{-- Form --}}
            <form action="{{ url('/add-stock-inventory/'.$item->id) }}" method="POST">
                @csrf

                <div class="modal-body">
                    <div class="row">

                        <div class="col-12 mb-3">
                            <label class="form-label fw-semibold">Medicine</label>
                            <input type="text" readonly
                                class="form-control"
                                value="{{ $item->name ?? 'N/A' }}"
                                readonly>
                            <input type="hidden" name="medicine_id" value="{{ $item->medicine_id }}">
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">
                                Expired Date <span class="text-danger">*</span>
                            </label>
                            <input type="date"
                                class="form-control"
                                name="ex_date"
                                value="{{ date('Y-m-d') }}"
                                required>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">
                                Qty <span class="text-danger">*</span>
                            </label>
                            <input type="number"
                                class="form-control"
                                name="qty"
                                min="1"
                                placeholder="Enter quantity"
                                required>
                        </div>

                        <div class="col-12 mb-3">
                            <label class="form-label fw-semibold">Remark</label>
                            <input type="text"
                                class="form-control"
                                name="remark"
                                value="Purchase / Adjustment / Return"
                                placeholder="Purchase / Adjustment / Return">
                        </div>

                        {{-- Hidden --}}
                        <input type="hidden" name="status" value="IN">
                        <input type="hidden" name="reg" value="{{ uniqid('STK-') }}">
                    </div>
                </div>

                {{-- Footer --}}
                <div class="modal-footer">
                    <button type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal">
                        Cancel
                    </button>

                    <button type="submit"
                            class="btn btn-primary"
                            onclick="return confirm('Confirm stock entry?')">
                        <i class="fas fa-save"></i> Save Stock
                    </button>
                </div>

            </form>

        </div>
    </div>
</div>
@endforeach
    
    <script src="{{ asset('assets/libs/jquery/dist/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/sidebarmenu.js') }}"></script>
    <script src="{{ asset('assets/js/app.min.js') }}"></script>
    <script src="{{ asset('assets/libs/apexcharts/dist/apexcharts.min.js') }}"></script>
    <script src="{{ asset('assets/libs/simplebar/dist/simplebar.js') }}"></script>

    <script>
        document.getElementById('tableSearch').addEventListener('keyup', function () {
            let value = this.value.toLowerCase();
            let rows = document.querySelectorAll('#productTable tbody tr');

            rows.forEach(row => {
                let text = row.innerText.toLowerCase();
                row.style.display = text.includes(value) ? '' : 'none';
            });
        });
    </script>


</body>
</html>