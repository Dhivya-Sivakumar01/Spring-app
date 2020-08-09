<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/style.css">
<head>
<meta charset="ISO-8859-1">
<title>Billing session</title>
</head>
<style>
 .right
 {
 float:right;
 }
</style>
<body >
   <div class="navbar">
		 <form action="Home">
             <a  href="Home"><i class="fa fa-fw fa-home"></i> Home</a> 
         </form>
         <form action="productEntry">
            <a href="productEntry"><i class="fa fa-database"></i> Entry Session</a> 
         </form>
         <form action="billingSession">
            <a class="active"  href="billingSession"><i class="fa fa-cart-arrow-down"></i> Billing Session</a>
         </form>
     <!-- <a href="#"><i class="fa fa-fw fa-user"></i> Login</a>-->
   </div>
   <!-- <div class="navbar">
    <form action="Home">
    <a  href="#"><i class="fa fa-fw fa-home"></i> Home</a> 
    </form>
    <form action="Addproducts">
     <a href="#"><i class="fa fa-fw fa-search"></i> Add Products</a> 
     </form>
     <form action="Purchaseproducts">
     <a class="active" href="#"><i class="fa fa-fw fa-envelope"></i> Purchase</a> 
     </form>
     <a href="#"><i class="fa fa-fw fa-user"></i> Login</a>
  </div>-->
  <h2>Search for products</h2>
  <div class="form-inline">
  
  <label for="searchcode">Product Code:</label>
  <div class="search-container">
    <form action="searchByCode">
      <input type="text" id="searchcode" placeholder="Search by code.." name="productcode">
       <button type="submit"><i class="fa fa-fw fa-search"></i></button> &nbsp
    </form>
  </div>
  <!-- <input type="email" id="email" placeholder="Enter email" name="email">-->
  <label for="searchname">Product Name:</label>
  <div class="search-container">
    <form action="searchByName">
      <input type="text" id="searchname" placeholder="Search by name.." name="productname">
       <button type="submit"><i class="fa fa-fw fa-search"></i></button> &nbsp
    </form>
    </div>
    <div class="right">
    <form action="deleteAll" >&nbsp
      <label for="deleteAll">Generate new bill:</label> 
      <button type="submit">Generate New</button>
    </form>
     </div>
  
  </div>
  
 
		    <div class="container">
              <div class="form-popup" id="EditForm">
                <form action="addQuantity" class="form-container">
                <h1></h1>

                    <label for="productcode"><b>Your Product Code</b></label>
                    <input type="text" id="existcode" name="productcode" value="code">
                    
                    <label for="productname"><b>Your Product Name</b></label>
                    <input type="text" id="productname" name="productname" value="name">
                    
                    <label for="productprice"><b>Your Product Price</b></label>
                    <input type="text" id="productprice" name="productprice" value="price">
                    
                    <label for="productgst"><b>Your Product GST</b></label>
                    <input type="text" id="productgst" name="productgst" value="gst">

                    <label for="quantity"><b>Enter Quantity</b></label>
                    <input type="number" name="quantity">
                    <br>
                    
                    <button type="submit" class="btn">Enter</button>
                    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                  </form>
                </div>
                </div>
               
               <div class="container">
              <div class="form-popup" id="EditQuantityForm">
                <form action="editQuantity" class="form-container">
                <h1></h1>
                     
                     <label for="itemno"><b>Your Item no</b></label>
                    <input type="text" id="itemno" name="itemno" value="itemno">

                    <label for="productcode"><b>Your Product Code</b></label>
                    <input type="text" id="code" name="productcode" value="code">
                    
                    <label for="productname"><b>Your Product Name</b></label>
                    <input type="text" id="name" name="productname" value="name">
                    
                    <label for="productprice"><b>Your Product Price</b></label>
                    <input type="text" id="price" name="productprice" value="price">
                    
                    <label for="productgst"><b>Your Product GST</b></label>
                    <input type="text" id="gst" name="productgst" value="gst">

                    <label for="quantity"><b>Change Quantity</b></label>
                    <input type="number" name="quantity">
                    <br>
                    
                    <button type="submit" class="btn">Save</button>
                    <button type="button" class="btn cancel" onclick="closeQuantityForm()">Close</button>
                  </form>
                </div>
                </div>
               
  
 
  
     <h3>${result}</h3>
     <table class="table table-striped table-hover table-condensed table-bordered">
			       <tr>
			         <th>Product Code</th>
			         <th>Product Name</th>
			         <th>Product Price</th>
			         <th>Product GST</th>
			         <th>Action</th>
			       </tr>
			       <c:if test="${empty case}">
                    <tr>
                    <td colspan="5">No task to Display</td>
                     </tr>
                     </c:if>
                   
                   <c:if test="${ not empty case }">
                    <tr>                     
                        <td><c:out value="${case.productcode}" /></td>
                        <td><c:out value="${case.productname}" /></td>
                        <td><c:out value="${case.productprice}" /></td>
                        <td><c:out value="${case.productgst}" /></td>
                        <td><button class="open-button" onclick="openForm('${case.productcode}','${case.productname}','${case.productprice}','${case.productgst}')">Add to cart &nbsp<i class="fa fa-cart-plus" aria-hidden="true"></i></button></td>
                      </tr>
                      </c:if>
                    
          </table>
          
          
          <table class="table table-striped table-hover table-condensed table-bordered">
			       <tr>
			         <th>Item No.</th>
			         <th>Item Code</th>
			         <th>Item Name</th>
			         <th> GST</th>
			         <th> Price</th>
			         <th>Quantity</th>
			         <th>Amount</th>
			         <th>Action</th>
			       </tr>
			       <c:if test="${empty purchase}">
                    <tr>
                    <td colspan="8">No Products purchased</td>
                     </tr>
                     </c:if>
                   
                   <c:if test="${ not empty purchase }">
                      <c:set var="count" value="1"/>
                      <c:forEach var="pro" items="${purchase}">                      
                       <tr>
                        <td id="code"><c:out value="${count}" /></td>
                        
                        <td><c:out value="${pro.productcode}" /></td>
                        <td><c:out value="${pro.productname}" /></td>
                        <td><c:out value="${pro.productgst}" /></td>
                        <td><c:out value="${pro.productprice}" /></td>
                        <td><c:out value="${pro.quantity}" /></td>
                        <td><c:out value="${pro.amount}" /></td>
                        <td><button class="open-button" onclick="openPurchaseForm('${count}','${pro.productcode}','${pro.productname}','${pro.productprice}','${pro.productgst}')">Edit Quantity</button></td>
                        <c:set var="count" value="${count+1}"/>
                        </tr>
                      </c:forEach>
                      <tr></tr>
                      <tr></tr>
                      <tr>
                       <td colspan="4"></td>
                       <td colspan="2">Total Amount</td>
                       <td>${total_amount}</td>
                       <td></td>
                      </tr>
                    </c:if>
                    
          </table>
          <script>
function openForm(code,name,price,gst) {
  document.getElementById("EditForm").style.display = "block";
  //document.getElementById("exist_code").value=document.getElementById("code").value;
 
  document.getElementById("existcode").value = code;
  document.getElementById("productname").value = name;
  document.getElementById("productprice").value = price;
  document.getElementById("productgst").value = gst;
}

function closeForm() {
  document.getElementById("EditForm").style.display = "none";
}

function openPurchaseForm(itemno,code,name,price,gst) {
	  document.getElementById("EditQuantityForm").style.display = "block";
	  //document.getElementById("exist_code").value=document.getElementById("code").value;
	  document.getElementById("itemno").value = itemno;
	  document.getElementById("code").value = code;
	  document.getElementById("name").value = name;
	  document.getElementById("price").value = price;
	  document.getElementById("gst").value = gst;
	}


function closePurchaseForm() {
	  document.getElementById("EditQuantityForm").style.display = "none";
}
</script>
     
<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>