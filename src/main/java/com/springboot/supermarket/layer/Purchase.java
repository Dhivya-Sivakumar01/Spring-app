package com.springboot.supermarket.layer;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="purchase")
public class Purchase {
	public int itemno;
	@Id
	public int productcode;
	public String productname;
	public float productgst;
	public float productprice;
	public int quantity;
	public float amount;
	
	public Purchase() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Purchase(int productcode, String productname, float productgst, float productprice,
			int quantity) {
		super();
		//this.itemno = itemno;
		this.productcode = productcode;
		this.productname = productname;
		this.productgst = productgst;
		this.productprice = productprice;
		this.quantity = quantity;
		this.amount = amountcalc(productprice,quantity,productgst);
	}
	private float amountcalc(float productprice, int quantity,float productgst) {
		float cost;
		cost=(productprice*quantity);
		cost+=cost*(productgst/100);		
		return cost;
	}

	
	public int getItemno() {
		return itemno;
	}
	public void setItemno(int itemno) {
		this.itemno = itemno;
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
	public float getProductgst() {
		return productgst;
	}
	public void setProductgst(float productgst) {
		this.productgst = productgst;
	}
	public float getProductprice() {
		return productprice;
	}
	public void setProductprice(float productprice) {
		this.productprice = productprice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Purchase [itemno=" + itemno + ", productcode=" + productcode + ", productname=" + productname
				+ ", productgst=" + productgst + ", productprice=" + productprice + ", quantity=" + quantity
				+ ", amount=" + amount + "]";
	}
	
	

}
