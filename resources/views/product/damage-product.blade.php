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
                <div class=" mt-4">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="m-0">Medicine Damage List</h4>
                        <div class="d-flex align-items-center gap-2">
                            <a href="{{ url('/print-damage-product-list') }}" target="_blank" class="btn btn-outline-secondary">
                                <i class="fa-solid fa-print me-1"></i> Print
                            </a>
                            <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                <i class="fa-solid fa-calendar-plus me-1"></i> Add
                            </button>
                        </div>
                    </div>

                    <div class="table-responsive">
                      <table class="table table-bordered table-hover align-middle text-center" id="printableTable">
                          <thead class="table-info">
                              <tr>
                                  <th>#</th>
                                  <th>Damage Date</th>
                                  <th>Product</th>
                                  <th>Brand</th>
                                  <th>Category</th>
                                  <th>Unit Price</th>
                                  <th>Damage Qty</th>
                                  <th>Total Loss</th>
                                  <th width="120">Action</th>
                              </tr>
                          </thead>

                          <tbody>
                            @forelse($data as $key => $item)
                                <tr>
                                    <td>{{ $key + 1 }}</td>
                                    <td>{{ \Carbon\Carbon::parse($item->damage_date)->format('d M Y') }}</td>
                                    <td class="fw-semibold">{{ $item->product->name ?? 'N/A' }}</td>
                                    <td><span class="badge bg-info">{{ $item->product->brand->name ?? 'N/A' }}</span></td>
                                    <td><span class="badge bg-secondary">{{ $item->product->category->name ?? 'N/A' }}</span></td>
                                    <td>৳ {{ number_format($item->unit_price, 2) }}/-</td>
                                    <td><span class="badge bg-danger">{{ $item->damage_quantity }}</span></td>
                                    <td class="fw-bold text-danger">৳ {{ number_format($item->total_loss, 2) }}/-</td>

                                    <td>
                                      <a href="{{url('/edit-damage-product/'.$item->id)}}" class="btn btn-sm btn-outline-primary"><i class="fas fa-edit"></i></a>
                                      <a href="{{ url('/delete-damage-product/'.$item->id) }}"
                                        onclick="return confirm('Are you sure you want to delete this damaged product?')"
                                        class="btn btn-sm btn-outline-danger"
                                        title="Delete">
                                          <i class="fas fa-trash"></i>
                                      </a>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="9" class="text-muted">
                                        No damaged products found.
                                    </td>
                                </tr>
                            @endforelse
                              <tr>
                                <td colspan="6">Total:</td>
                                <td>{{ $data->sum('damage_quantity') }}</td>
                                <td>৳ {{ $data->sum('total_loss') }}/-</td>
                                <td colspan="1"></td>
                              </tr>
                          </tbody>
                      </table>
                  </div>

                </div>
            </div>
        </div> 
    </div>
  </div>


  <!-- Modal -->
  <div class="modal fade" id="staticBackdrop"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true">

      <div class="modal-dialog modal-lg modal-dialog-centered">
          <div class="modal-content">

              {{-- Modal Header --}}
              <div class="modal-header">
                  <h5 class="modal-title fw-semibold" id="staticBackdropLabel">
                      Damage Medicine Entry
                  </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
              </div>

              {{-- Form Start --}}
              <form action="{{ url('/damage-product-insert') }}" method="POST">
                  @csrf

                  {{-- Modal Body --}}
                  <div class="modal-body">
                      <div class="row">

                          {{-- Product --}}
                          <div class="col-md-6 mb-3">
                              <label class="form-label fw-semibold">
                                  Select Product <span class="text-danger">*</span>
                              </label>
                              <select class="form-select select2" name="product_id" required>
                                  <option selected disabled>-- Select product --</option>
                                  @foreach($products as $product)
                                      <option value="{{ $product->id }}">
                                          {{ $product->name }}
                                          {{ $product->brand ? ' - '.$product->brand->name : '' }}
                                          {{ $product->category ? ' - '.$product->category->name : '' }}
                                      </option>
                                  @endforeach
                              </select>
                          </div>

                          {{-- Quantity --}}
                          <div class="col-md-6 mb-3">
                              <label class="form-label fw-semibold">
                                  Damage Quantity <span class="text-danger">*</span>
                              </label>
                              <input type="number"
                                    class="form-control"
                                    name="damage_quantity"
                                    min="1"
                                    placeholder="Enter damage quantity"
                                    required>
                          </div>

                          {{-- Damage Date --}}
                          <div class="col-md-6 mb-3">
                              <label class="form-label fw-semibold">
                                  Damage Date <span class="text-danger">*</span>
                              </label>
                              <input type="date"
                                    class="form-control"
                                    name="damage_date"
                                    value="{{ date('Y-m-d') }}"
                                    required>
                          </div>

                          {{-- Reason for Damage --}}
                          <div class="col-md-6 mb-3">
                              <label class="form-label fw-semibold">
                                  Damage Reason
                              </label>
                              <input type="text"
                                    class="form-control"
                                    name="damage_reason"
                                    placeholder="Expired / Broken / Returned">
                          </div>

                          {{-- Remarks --}}
                          <div class="col-12 mb-3">
                              <label class="form-label fw-semibold">
                                  Remarks
                              </label>
                              <textarea class="form-control"
                                        name="remarks"
                                        rows="3"
                                        placeholder="Additional notes (optional)">N/A</textarea>
                          </div>

                      </div>
                  </div>

                  {{-- Modal Footer --}}
                  <div class="modal-footer">
                      <button type="button"
                              class="btn btn-secondary"
                              data-bs-dismiss="modal">
                          Close
                      </button>

                      <button type="submit"
                              class="btn btn-danger"
                              onclick="return confirm('Are you sure you want to mark this product as damaged?')">
                          Save Damage
                      </button>
                  </div>

              </form>
              {{-- Form End --}}

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