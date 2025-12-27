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
                        <h4 class="m-0">Product Setting</h4>
                        <!-- <h5 class="m-0 text-primary">
                            <a href="{{url('/print/complete/purchase/order')}}"><i class="fa-solid fa-print"></i> Print </a>
                        </h5> -->
                    </div><hr>
                    <div class="row">
                        <!-- ================= Category List & Create ================= -->
                        <div class="col-md-12 mb-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="mb-0">Categories</h5>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddCategoryModal">
                                    Add New Category
                                </button>
                            </div>
                            <div class="table-responsive" style="max-height: 600px; overflow-y: auto;">
                                <table class="table table-bordered table-hover align-middle" id="categoryTable">
                                    <thead class="table-primary text-center sticky-top bg-white">
                                        <tr>
                                            <th>#</th>
                                            <th class="text-start">Category</th>
                                            <th class="text-start">Discription</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($category as $val)
                                        <tr>
                                            <td class="text-center">{{ $loop->iteration }}</td>
                                            <td>{{ $val->name ?? '-' }}</td>
                                            <td>{{ $val->description ?? '-' }}</td>
                                            <td class="text-center text-primary" data-bs-toggle="modal" data-bs-target="#CategoryModal{{ $val->id }}">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="modal fade" id="AddCategoryModal" tabindex="-1" aria-labelledby="AddCategoryModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="{{ url('/add-category') }}" method="POST">
                                        @csrf
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="AddCategoryModalLabel">Add New Category</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>

                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="CategoryModalInput" class="form-label">Category Name</label>
                                                <input type="text" name="txtCategory" class="form-control" id="CategoryModalInput" placeholder="Type your category name" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="DiscriptionModalInput" class="form-label">Description</label>
                                                <textarea name="txtDiscription" id="DiscriptionModalInput" class="form-control" placeholder="Type your description"></textarea>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <div class="row">
                        <!-- ================= Brand List & Create ================= -->
                        <div class="col-md-12 mb-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h5 class="mb-0">Brands</h5>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AddBrandModal">
                                    Add New Brand
                                </button>
                            </div>
                            <div class="table-responsive" style="max-height: 600px; overflow-y: auto;">
                                <table class="table table-bordered table-hover align-middle" id="brandTable">
                                    <thead class="table-primary text-center sticky-top bg-white">
                                        <tr>
                                            <th>#</th>
                                            <th class="text-start">Brand</th>
                                            <th class="text-start">Discription</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($brands as $val)
                                        <tr>
                                            <td class="text-center">{{ $loop->iteration }}</td>
                                            <td>{{ $val->name }}</td>
                                            <td>{{ $val->description ?? '-' }}</td>
                                            <td class="text-center text-primary" data-bs-toggle="modal" data-bs-target="#BrandModal{{ $val->id }}">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Add Brand Modal -->
                        <div class="modal fade" id="AddBrandModal" tabindex="-1" aria-labelledby="AddBrandModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="{{ url('/add-brand') }}" method="POST">
                                        @csrf
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="AddBrandModalLabel">Add New Brand</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>

                                        <div class="modal-body">                                            
                                            <div class="mb-3">
                                                <label for="BrandModalInput" class="form-label">Brand Name</label>
                                                <input type="text" name="txtBrand" class="form-control" id="BrandModalInput" placeholder="Type your brand name" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="DiscriptionModalInput" class="form-label">Description</label>
                                                <textarea name="txtDiscription" id="DiscriptionModalInput" class="form-control" placeholder="Type your description"></textarea>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div> 
    </div>
</div>

<!-- ================= Category Edit Modal ================= -->
@foreach($category as $val)
<div class="modal fade" id="CategoryModal{{ $val->id }}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="CategoryModalLabel{{ $val->id }}" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{ url('/update-category') }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="CategoryModalLabel{{ $val->id }}">Edit Category: "{{ $val->name }}"</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="Category{{ $val->id }}" class="form-label">Category Name</label>
                        <input type="text" name="txtCategory" value="{{ $val->name }}" class="form-control" id="Category{{ $val->id }}" required>
                        <input type="hidden" name="txtId" value="{{ $val->id }}">
                    </div>
                    <div class="mb-3">
                        <label for="DiscriptionModalInput" class="form-label">Description</label>
                        <textarea name="txtDiscription" id="DiscriptionModalInput" class="form-control" placeholder="Type your description">{{ $val->description }}</textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure you want to update this category?')">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endforeach

<!-- ================= Brand Edit Modal ================= -->
@foreach($brands as $val)
<div class="modal fade" id="BrandModal{{ $val->id }}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="BrandModalLabel{{ $val->id }}" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{ url('/update-brand') }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="BrandModalLabel{{ $val->id }}">Edit Brand: "{{ $val->name }}"</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">                    
                    <div class="mb-3">
                        <label for="Brand{{ $val->id }}" class="form-label">Brand Name</label>
                        <input type="text" name="txtBrand" value="{{ $val->name }}" class="form-control" id="Brand{{ $val->id }}" required>
                        <input type="hidden" name="txtId" value="{{ $val->id }}">
                    </div>
                    <div class="mb-3">
                        <label for="DiscriptionModalInput" class="form-label">Description</label>
                        <textarea name="txtDiscription" id="DiscriptionModalInput" class="form-control" placeholder="Type your description">{{ $val->description }}</textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure you want to update this brand?')">Submit</button>
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

</body>
</html>