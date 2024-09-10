package com.example.demo.Respo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.example.demo.Model.Userdata;


public interface responseuserdata extends JpaRepository<Userdata, Integer> {
	   public Userdata findByEmail(String email);
	   //<-----------------Block And unblock Count and and All Data--------------------------->
	    @Query(value = "SELECT * FROM Userdata where block_unblock='block'", nativeQuery = true)
	    List<Userdata> userBlock();
	    
	    @Query(value = "SELECT * FROM Userdata where block_unblock!='block'", nativeQuery = true)
	    List<Userdata> userUnblock();
	    
	    @Query(value = "SELECT count(*) FROM Userdata where block_unblock='block'", nativeQuery = true)
	    Long user_blockCount();
	    
	    @Query(value = "SELECT count(*) FROM Userdata where block_unblock!='block'", nativeQuery = true)
	    Long user_unBlockCount();
}


