<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <form action="addProduct" method="get">
    
     <div id="content1 left">
     
       <label for="code">Enter the Product Code</label><br>       
       <input type="text" name="product_code" id="code"><br>
       
       <label for="name">Enter the Product Name</label><br>       
       <input type="text" name="product_name" id="name"><br>
       
       <label for="price">Enter the Product Price</label><br>       
       <input type="text" name="product_price" id="price"><br>
       
       <label for="gst">Enter the Product GST</label><br>       
       <input type="text" name="product_gst" id="gst"><br>
       <button>Add</button>
     </div> 
  
    </form>
    
    <form action="editProduct" method="get">
    
     <div id="content1 left">
       <h1>EditBy</h1>
       <a href='#code'>Product Code</a>
       <label for="code">Enter the Product Code</label><br>       
       <input type="text" name="product_code" id="code"><br>
       
       <a href='#code'>Product Name</a>
       <label for="name">Enter the Product Name</label><br>       
       <input type="text" name="product_name" id="name"><br>
       
       <a href='#code'>Product Price</a>
       <label for="price">Enter the Product Price</label><br>       
       <input type="text" name="product_price" id="price"><br>
       
       <a href='#code'>Product GST</a>
       <label for="gst">Enter the Product GST</label><br>       
       <input type="text" name="product_gst" id="gst"><br>
       <button>Edit</button>
     </div>
    </form>
</body>
</html>