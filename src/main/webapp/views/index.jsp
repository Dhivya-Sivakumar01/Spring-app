<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
html{box-sizing:border-box}*,*:before,*:after{box-sizing:inherit}
.container:after,.container:before,.row-padding:after,.row-padding:before,.bar:before,.bar:after
{
content:"";display:table;clear:both;
box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
}
 #imgcontainer
 {
  content:"";display:table;clear:both;
  box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
  margin:3px ;
  height:20%;
 }
 .marquee
 {
   color:#64695e;
 }
 
 .column {
  
  border-radius:2%;
  box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
  float: left;
  padding: 25px;
  margin-left:0;
  margin-right:0;
  text-align:center;
   background-color: #00BFFF;
   color: white;
}
button{
 background-color:#d9d9d9;
}

.clearfix::after {
  content: "";
  clear: both;
  display: table;
   box-shadow:0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
}

.menu {
  margin-left:10%;
  width: 25%;
}

.content {
  margin-left:25%;
  width: 25%;
}

 
</style>
</head>
<body>
 <div id="imgcontainer" >
    <img src="sp1.jpg" style="width:100%" alt="flower" height="450">
  </div>
  
  <div class="marquee">
    <marquee width="95%" direction="left" height="70px">
      <h3>GST Billing Application- Product Entry session and Billing Session</h3>
    </marquee>
  </div>
 
 <div class="clearfix">
 <form action="productEntry">
  <div class="column menu" >
    <h1>Product Entry </h1> 
    <br/>
    <button style="color:blue;font-size:24px">Go <i class="fa fa-hand-o-right"></i></button>
  </div>
 </form>
 <form action="billingSession">
  <div class="column content" >
    <h1>GST Billing </h1> 
    <br/>
	 <button style="color:blue;font-size:24px">Go <i class="fa fa-hand-o-right"></i></button> 
  </div> 
 </form>
 </div>
</body>
</html>