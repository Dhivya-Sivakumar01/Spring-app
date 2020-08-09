package com.springboot.supermarket.layer;

import javax.persistence.*;

import org.springframework.stereotype.Component;
@Component
@Entity
@Table(name="product")
public class Product {
	@Id
	//@GeneratedValue(strategy=GenerationType.AUTO)
	//@GeneratedValue(strategy = javax.persistence.GenerationType.IDENTITY )
	//@Column(name="productcode")
	public int productcode;
	
	//@Column(name="productname")
	public String productname;
	
	//@Column(name="productprice")
	public float productprice;
	
	//@Column(name="productgst")
    public float productgst;
	
	public Product()
	{
	}
	
	public Product(int productcode,String productname,float productprice,float productgst)
	{
		this.productcode=productcode;
		this.productname=productname;
		this.productprice=productprice;
		this.productgst=productgst;		
	}
	
	public int getProductcode() {
		return productcode;
	}

	public void setProductcode(int productcode) {
		this.productcode = productcode;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public float getProductprice() {
		return productprice;
	}

	public void setProductprice(float productprice) {
		this.productprice = productprice;
	}

	public float getProductgst() {
		return productgst;
	}

	public void setProduct_gst(float productgst) {
		this.productgst = productgst;
	}
	
	@Override
	public String toString() {
		return ("product id=" + productcode + ", name=" + productname + " , price "+ productprice+" , gst "+productgst);
	}
	

}
