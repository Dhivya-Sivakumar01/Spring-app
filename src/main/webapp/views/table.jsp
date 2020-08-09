<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Entry Session</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/style.css">
<style>
  .container:after,.container:before,.row-padding:after,.row-padding:before,.bar:before,.bar:after
{
content:"";display:table;clear:both;
box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
}
   .column {
  
   box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
  float: left;
  margin-left:0;
  margin-right:0;
  padding:5px;
  text-align:justify;
   
}
.overview::after {
  content: "";
  clear: both;
  display: table;
   box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
   
}

.lf {
  margin-left:5px;
  width: 20%;
}

.rg {
  margin-left:5px;
  width: 78%;
}

hr
{
border:0;border-top:1.5px solid #eee;margin:20px 0
}


</style>
</head>
<body>
     <div class="navbar">
		 <form action="Home">
             <a  href="Home"><i class="fa fa-fw fa-home"></i> Home</a> 
         </form>
         <form action="productEntry">
            <a class="active" href="productEntry"><i class="fa fa-database"></i> Entry Session</a> 
         </form>
         <form action="billingSession">
            <a  href="billingSession"><i class="fa fa-cart-arrow-down"></i> Billing Session</a>
         </form> 
   </div>
     
      
    <h2>&nbsp Add/Edit products</h2>
  		
		
		    <div class="overview">
		         
                <div class="column lf">
                  <div  id="AddForm" >
                   <form action="addProduct" class="form-container">
                    <h1>Add product </h1>

                    <label for="productcode"><b>Product Code</b></label>
                    <input type="text" placeholder="Enter Product Code" name="productcode" required>

	                <label for="productname"><b>Product Name</b></label>
                    <input type="text" placeholder="Enter Product Name" name="productname" required>
    
	                <label for="productprice"><b>Product Price</b></label>
                    <input type="text" placeholder="Enter Product Price" name="productprice" required>

                    <label for="productgst"><b>Product GST</b></label>
                    <input type="text" placeholder="Enter Product GST" name="productgst" required>
                  
                  
                  <button type="submit" style="background-color=#36ad3b;" class="btn">ADD &nbsp<i class="fa fa-plus-square"></i></button>    
                 </form>              
              </div>
              </div> 
 
               <div style="line-height:2;" class="form-popup" id="EditForm">
                <form action="Edit" class="form-container">
                <h1>Edit the product</h1>

                    <label for="productcode"><b>Product Code</b></label>
                    <input type="text" placeholder="Enter Product Code" name="productcode" required>

	                <label for="productname"><b>Product Name</b></label>
                    <input type="text" placeholder="Enter Product Name" name="productname" required>
    
	                <label for="productprice"><b>Product Price</b></label>
                    <input type="text" placeholder="Enter Product Price" name="productprice" required>

                    <label for="productgst"><b>Product GST</b></label>
                    <input type="text" placeholder="Enter Product GST" name="productgst" required>

                    <p style="display:hidden"><input type="number" id="existcode" name="existcode" value="code"></p>
                    <button type="submit" class="btn">Save</button>
                    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                  </form>
                </div>
               
		
		<div class="column rg">
			<!-- <h1>Users List</h1>-->
			<table	style="line-height:3px;" class="table table-striped table-hover table-condensed table-bordered">
			       <tr style="background-color:;">
			         <th>Product Code</th>
			         <th>Product Name</th>
			         <th>Product Price</th>
			         <th>Product GST</th>
			         <th>Action</th>
			       </tr>
                   <c:forEach var="pro" items="${products}">
                    <tr>
                        <td id="code"><c:out value="${pro.productcode}" /></td>
                        <td><c:out value="${pro.productname}" /></td>
                        <td><c:out value="${pro.productprice}" /></td>
                        <td><c:out value="${pro.productgst}" /></td>
                        <td><button class="open-button" onclick="openForm('${pro.productcode}')">Edit</button></td>
                      </tr>
                    </c:forEach>
                  </table>
				
<script>
function openForm(code) {
  document.getElementById("EditForm").style.display = "block";
  //document.getElementById("exist_code").value=document.getElementById("code").value;
  document.getElementById("existcode").value = code;
}

function closeForm() {
  document.getElementById("EditForm").style.display = "none";
}
</script>
				
		</div>
       </div>


	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     
</body>
</html>