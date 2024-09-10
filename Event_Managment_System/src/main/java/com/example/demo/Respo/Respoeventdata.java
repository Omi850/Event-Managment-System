package com.example.demo.Respo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.Model.Event;


public interface Respoeventdata  extends JpaRepository<Event, Integer> {

	 //<------------------------------Event upcoming,completed count and Data---------------------------->
    @Query(value = "SELECT * FROM Event where status='upcoming' ORDER BY id DESC LIMIT 4", nativeQuery = true)
    List<Event> findLimitedData();
    
    @Query(value = "SELECT * FROM Event where status='upcoming'", nativeQuery = true)
    List<Event> Eventdata();
    
    @Query(value = "SELECT * FROM Event where status='completed'", nativeQuery = true)
    List<Event> Eventdatacom();
    
    
    @Query(value = "SELECT count(*) FROM Event where status='completed'", nativeQuery = true)
    Long Event_comCount();
    
    @Query(value = "SELECT count(*) FROM Event where status='upcoming'", nativeQuery = true)
    Long Event_upCount();
}

