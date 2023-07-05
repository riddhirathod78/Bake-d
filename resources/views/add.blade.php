<!DOCTYPE html>
<html>
  <head>
    <title>Customized Cake</title>
    <link rel="stylesheet" href="{{url('css/add.css')}}">
  </head>
  <body>
    <h1>Add Product</h1>
    <form action="/save" method="GET">
      <label for="productName">Product Name:</label>
      <input type="text" id="productName" name="productName" required><br>

      

      <label for="productPrice">Product Price:</label>
      <input type="number" id="productPrice" name="productPrice" min="0" required><br>

      

      <label for="productStatus">Product Status:</label>
      <select id="productStatus" name="productStatus">
        <option value="available">Available</option>
        <option value="outOfStock">Out of Stock</option>
        <option value="comingSoon">Coming Soon</option>
      </select><br>


      <label for="productDescription">Product Description:</label>
      <textarea id="productDescription" name="productDescription" rows="4" cols="50" required></textarea><br>

      <label for="categoryName">Category Name:</label>



      <select id="categoryName" name="categoryName">
          @foreach($category as $c)
        <option value={{$c->category_id}}>{{$c->category_name}}</option>
        @endforeach
        </select><br>

        <label for="Customizedcake">Customized Cake:</label>
        <select id="status" name="Customizedcake">
          <option value="Yes">Yes</option>
          <option value="No">No</option>
      </select><br>


      <button type="submit">Submit</button>
    </form>
  </body>
</html>
