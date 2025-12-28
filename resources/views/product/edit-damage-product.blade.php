<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $company->name ?? "D.H.C Pharmacy" }}</title>
    <link rel="shortcut icon" type="image/png" href="./assets/images/logos/dhcpharmacy.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
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
                <div class="container-fluid mt-4">

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 class="fw-bold text-dark mb-0">
                            ✏️ Edit Damage Medicine
                        </h4>

                        <a href="{{ url()->previous() }}" class="btn btn-outline-secondary btn-sm">
                            ← Back
                        </a>
                    </div>

                    <div class="card shadow-sm border-0">
                        <div class="card-body">

                            <form action="{{ url('/damage-product-update/'.$damage->id) }}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-semibold">
                                            Product <span class="text-danger">*</span>
                                        </label>
                                        <select class="form-select select2" name="product_id" required>
                                            <option disabled>-- Select product --</option>
                                            @foreach($products as $product)
                                                <option value="{{ $product->id }}"
                                                    {{ $product->id == $damage->medicine_id ? 'selected' : '' }}>
                                                    {{ $product->name }}
                                                    {{ $product->brand ? ' - '.$product->brand->name : '' }}
                                                    {{ $product->category ? ' - '.$product->category->name : '' }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-semibold">
                                            Damage Quantity <span class="text-danger">*</span>
                                        </label>
                                        <input type="number"
                                            class="form-control"
                                            name="damage_quantity"
                                            min="1"
                                            value="{{ old('damage_quantity', $damage->damage_quantity) }}"
                                            required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-semibold">
                                            Damage Date <span class="text-danger">*</span>
                                        </label>
                                        <input type="date"
                                            class="form-control"
                                            name="damage_date"
                                            value="{{ old('damage_date', \Carbon\Carbon::parse($damage->damage_date)->format('Y-m-d')) }}"
                                            required>
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label class="form-label fw-semibold">
                                            Damage Reason
                                        </label>
                                        <input type="text"
                                            class="form-control"
                                            name="damage_reason"
                                            value="{{ old('damage_reason', $damage->damage_reason) }}"
                                            placeholder="Expired / Broken / Returned">
                                    </div>

                                    <div class="col-12 mb-3">
                                        <label class="form-label fw-semibold">
                                            Remarks
                                        </label>
                                        <textarea class="form-control"
                                                name="remarks"
                                                rows="3"
                                                placeholder="Additional notes (optional)">{{ old('remarks', $damage->remarks) }}</textarea>
                                    </div>

                                </div>

                                <div class="d-flex justify-content-end gap-2 mt-4">
                                    <a href="{{ url('/damage-product') }}"
                                    class="btn btn-outline-dark">
                                        Cancel
                                    </a>

                                    <button type="submit"
                                            class="btn btn-warning"
                                            onclick="return confirm('Are you sure you want to update this damaged medicine?')">
                                        Update Damage
                                    </button>
                                </div>

                            </form>

                        </div>
                    </div>

                </div>

            </div>
        </div> 
    </div>
  </div>


 



    <!-- Scripts link for dropdown search -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script src="{{ asset('assets/libs/jquery/dist/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/sidebarmenu.js') }}"></script>
    <script src="{{ asset('assets/js/app.min.js') }}"></script>
    <script src="{{ asset('assets/libs/apexcharts/dist/apexcharts.min.js') }}"></script>
    <script src="{{ asset('assets/libs/simplebar/dist/simplebar.js') }}"></script>

    <script>
      // Initialize Select2 for product dropdown using dropdown type
        $(document).ready(function () {
            $('.select2').select2({
                placeholder: "Search product...",
                allowClear: true,
                width: '100%',
                dropdownParent: $('#staticBackdrop')
            });
        });
    </script>

</body>
</html>