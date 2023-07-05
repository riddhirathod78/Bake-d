@extends('app')

@section('title', 'Product Page')

@section('content')
    <div class="container">
        <h1 class="text-center mb-4">Product Page</h1>

        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Name of Product</th>
                            <th>Status of Product</th>
                            <th>Price of Product</th>
                            <th>Description</th>
                            <th>Category Name</th>
                            <th>Customized Cake</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- @foreach($products as $product)
                            <tr>
                                <td>{{ $product->name }}</td>
                                <td>{{ $product->status }}</td>
                                <td>{{ $product->price }}</td>
                                <td>{{ $product->description }}</td>
                                <td>{{ $product->category->name }}</td>
                                <td>{{ $product->customized_cake ? 'Yes' : 'No' }}</td>
                            </tr>
                        @endforeach -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script src="{{ asset('js/app.js') }}"></script>
@endsection
