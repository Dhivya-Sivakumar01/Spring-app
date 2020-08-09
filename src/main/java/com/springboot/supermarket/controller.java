package com.springboot.supermarket;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.springboot.supermarket.layer.Product;
import com.springboot.supermarket.layer.Purchase;

@Controller
public class controller {
	
	@Autowired
	FetchData fetch;
	
	@Autowired
	Product p;
	
	@Autowired
	PurchaseController purchase;
	
	@Autowired
	Purchase pur;
	
	@RequestMapping("/")
	public String home()
	{
		return "index";
	}
	
	@RequestMapping("Home")
	public String homepage()
	{
		return "index";
	}
	
	@RequestMapping("productEntry")
	public String productEntry(Model m)
	{		
		m.addAttribute("products",fetch.findAllByOrderByProductcode());
		return "table";
	}
	
	@RequestMapping("billingSession")
	public String billingSession(Model m)
	{
		m.addAttribute("purchase",purchase.findAllByOrderByItemno());
		//m.addAttribute("total_amount",purchase.sumAmount());
		return"bill";
		
	}
	
	@RequestMapping("addProduct")
	public String getdata(@RequestParam("productcode") int code,@RequestParam("productname") String name,@RequestParam("productprice") float price,@RequestParam("productgst") float gst,Model m)
	{
		p.productcode=code;
		p.productname=name;
		p.productprice=price;
		p.productgst=gst;
		fetch.save(p);
		m.addAttribute("products",fetch.findAllByOrderByProductcode());
		return "table";
	}
	//@RequestMapping("Edit")
	@RequestMapping("Edit")
	public String editData(@RequestParam("productcode") int code,@RequestParam("productname") String name,@RequestParam("productprice") float price,@RequestParam("productgst") float gst,@RequestParam("existcode") int excode,Model m)
	{
		fetch.deleteByProductcode(excode);
		
		p.productcode=code;
		p.productname=name;
		p.productprice=price;
		p.productgst=gst;
		fetch.save(p);
		m.addAttribute("products",fetch.findAllByOrderByProductcode());
		return "table";
	}
	
	@RequestMapping("searchByCode")
	public String searchByCode(@RequestParam("productcode") int code,Model m)
	{
		if(fetch.existsByProductcode(code))
		{
		  Product resultcode=fetch.findByProductcode(code);
		  m.addAttribute("result","Add to cart");
		  m.addAttribute("case",resultcode);
		new Purchase(resultcode.productcode,resultcode.productname, resultcode.productprice,resultcode.productgst,1);
		
		
		m.addAttribute("purchase",purchase.findAllByOrderByItemno());
		}
		else
		{
			m.addAttribute("result","Sorry search product doesn't exist/match");
		}
		return "bill";
	}
	
	@RequestMapping("deleteAll")
	public String deleteAll(Model m)
	{
		purchase.deleteAll();
		m.addAttribute("purchase",purchase.findAllByOrderByItemno());
		return "bill";
	}
	
	@RequestMapping("searchByName")
	public String searchByName(@RequestParam("productname") String name,Model m)
	{
		if(fetch.existsByProductname(name))
		{
		  Product resultcode=fetch.findByProductnameIgnoreCase(name);
		  m.addAttribute("result","Enter the Quantity");
		  m.addAttribute("case",resultcode);
		new Purchase(resultcode.productcode,resultcode.productname, resultcode.productprice,resultcode.productgst,1);
		
		
		m.addAttribute("purchase",purchase.findAllByOrderByItemno());
		}
		else
		{
			m.addAttribute("result","Sorry search product doesn't exist/match");
		}
		return "bill";
	}
	
	
	@RequestMapping("addQuantity")
	public String addQuantity(@RequestParam("productcode") int code,@RequestParam("productname") String name,@RequestParam("productprice") float price,@RequestParam("productgst") float gst,@RequestParam("quantity") int qty,Model m)
	{
		//pur=new Purchase(code,name, price,gst,qty);
		//pur.itemno=itemno;
		pur.productcode=code;
		pur.productname=name;
		pur.productprice=price;
		pur.productgst=gst;
		pur.quantity=qty;
		pur.amount=calc(price,qty,gst);
		purchase.save(pur);
		m.addAttribute("purchase",purchase.findAllByOrderByItemno());
		m.addAttribute("total_amount",purchase.sumAmount());
		return"bill";
	}

	private float calc(float price, int qty, float gst) {
		float cost;
		cost=(price *qty);
		cost+=(cost*(gst/100));
		return  cost;
	}
	@RequestMapping("editQuantity")
	public String editQuantity(@RequestParam("itemno") int itemno,@RequestParam("productcode") int code,@RequestParam("productname") String name,@RequestParam("productprice") float price,@RequestParam("productgst") float gst,@RequestParam("quantity") int qty,Model m)
	{
		Purchase pur= purchase.findByProductcode(code);
		pur.quantity=qty;
		pur.amount=calc(price,qty,gst);
		purchase.save(pur);
		//pur.amount=calc(price,qty,gst);
		purchase.save(pur);
		m.addAttribute("purchase",purchase.findAll());
		m.addAttribute("total_amount",purchase.sumAmount());
		return"bill";
		
	}
	

}
