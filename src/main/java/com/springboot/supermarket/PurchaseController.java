package com.springboot.supermarket;

import java.util.List;


import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.springboot.supermarket.layer.Purchase;

@Repository
public interface PurchaseController extends JpaRepository<Purchase,Integer>{
	@Transactional
	 public List<Purchase> findAllByOrderByItemno();

	@Transactional
	public void deleteByProductcode(int code);
	
	@Transactional
	@Query("SELECT SUM(p.amount) FROM Purchase p")
	public float sumAmount();

	@Transactional
	public Purchase findByProductcode(int code);
	
	//@Transcational
	//@Query("ALTER TABLE Purpase p AUTO_INCREMENT = id")
	//public void Increment(@Param("id") int itemno);
	//@Query("from Alien where aname= :name")
	//List<Alien> find(@Param("name") String aname);

}
