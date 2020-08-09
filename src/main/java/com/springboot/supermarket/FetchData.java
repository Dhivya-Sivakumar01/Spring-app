package com.springboot.supermarket;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.springboot.supermarket.layer.Product;

@Repository
public interface FetchData extends JpaRepository<Product,Integer>{
 //SELECT COUNT	(emp.empName) FROM Employee emp"
	@Transactional
	 public List<Product> findAllByOrderByProductcode();
	//public List<Alien> findByAnameOrderByAid(String aname);
	//@Query("from Product where product_name= :name")
	//List<Product> find(@Param("name") String product_name);
	//@Query("from Product where product_code= product_code")
    //List<Product> findByProduct_code(int product_code);

	@Transactional
	public void deleteByProductcode(int excode);

	@Transactional
	public Product findByProductcode(int code);
	
	@Transactional
	public Product findByProductnameIgnoreCase(String name);

	@Transactional
	public boolean existsByProductcode(int code);
	
	@Transactional
	public boolean existsByProductname(String name);

	
	//public Object findAllByOrderByProductcode();
}
