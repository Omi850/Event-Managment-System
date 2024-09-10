package com.example.demo.Respo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.Model.EventBook;

public interface RespoBookEvent extends JpaRepository<EventBook, Integer>{
	//<----------Home Page Accepted and attended Count
    @Query(value = "SELECT count(*) FROM event_book WHERE statues = 'Accepted'", nativeQuery = true)
    int userBooking();
    @Query(value = "SELECT count(*) FROM event_book WHERE statues = 'attended'", nativeQuery = true)
    int userattended();

    
    
    
    //<-----------------------------Rejected,Accepted,Pending,attended Data For Admin------------------------------->
    @Query(value = "SELECT * FROM event_book WHERE eventid = :id", nativeQuery = true)
    List<EventBook> AllDataBook(@Param("id") int id);
	
    @Query(value = "SELECT * FROM event_book WHERE eventid = :id AND statues = 'Rejected'", nativeQuery = true)
    List<EventBook> findAllRejectedBooksByEventId(@Param("id") int id);

    @Query(value = "SELECT * FROM event_book WHERE eventid = :id AND statues = 'Accepted'", nativeQuery = true)
    List<EventBook> findAllAcceptedBooksByEventId(@Param("id") int id);

    @Query(value = "SELECT * FROM event_book WHERE eventid = :id AND statues = 'Pending'", nativeQuery = true)
    List<EventBook> findAllPendingBooksByEventId(@Param("id") int id);
    
    @Query(value = "SELECT * FROM event_book WHERE eventid = :id AND statues = 'attended'", nativeQuery = true)
    List<EventBook> findAllattendedBooksByEventId(@Param("id") int id);
    
    
     
    //<-----------------------------Rejected,Accepted,Pending,attended Count For Admin------------------------------->
    @Query(value = "SELECT count(*) FROM event_book WHERE eventid = :id", nativeQuery = true)
    int AllDataBookCount(@Param("id") int id);

    @Query(value = "SELECT count(*) FROM event_book WHERE eventid = :id AND statues = 'Rejected'", nativeQuery = true)
    int findAllRejectedBooksByEventIdCount(@Param("id") int id);

    @Query(value = "SELECT count(*) FROM event_book WHERE eventid = :id AND statues = 'Accepted'", nativeQuery = true)
    int findAllAcceptedBooksByEventIdCount(@Param("id") int id);

    @Query(value = "SELECT count(*) FROM event_book WHERE eventid = :id AND statues = 'Pending'", nativeQuery = true)
    int findAllPendingBooksByEventIdCount(@Param("id") int id);
    
    @Query(value = "SELECT count(*) FROM event_book WHERE eventid = :id AND statues = 'attended'", nativeQuery = true)
    int findAllattendedBooksByEventIdCount(@Param("id") int id);
 

    //<-----------------------------Rejected,Accepted,Pending,attended Data For User------------------------------------>
	@Query(value = "SELECT * FROM event_book WHERE eventid = :eventId AND email = :email", nativeQuery = true)
	EventBook Alldata(@Param("eventId") int eventId, @Param("email") String email);
	
	@Query(value = "SELECT * FROM event_book WHERE statues='pending' AND user_id = :userId", nativeQuery = true)
	List<EventBook> userPendingByUserId(@Param("userId") int userId);

	@Query(value = "SELECT * FROM event_book WHERE statues='accepted' AND user_id = :userId", nativeQuery = true)
	List<EventBook> userAcceptedByUserId(@Param("userId") int userId);

	@Query(value = "SELECT * FROM event_book WHERE statues='attended' AND user_id = :userId", nativeQuery = true)
	List<EventBook> userAttendedByUserId(@Param("userId") int userId);
	
	@Query(value = "SELECT * FROM event_book WHERE statues='Rejected' AND user_id = :userId", nativeQuery = true)
	List<EventBook> userRejectedByUserId(@Param("userId") int userId);
	
	@Query(value = "SELECT * FROM event_book where user_id = :userId", nativeQuery = true)
	List<EventBook> userAllData(@Param("userId") int userId);
	
	

    //<-----------------------------Rejected,Accepted,Pending,attended Count For User------------------------------------>
	@Query(value = "SELECT count(*) FROM event_book WHERE statues='attended' AND user_id = :userId", nativeQuery = true)
	Long userAttendedCountByUserId(@Param("userId") int userId);

	@Query(value = "SELECT count(*) FROM event_book WHERE statues='pending' AND user_id = :userId", nativeQuery = true)
	Long pendingCountByUserId(@Param("userId") int userId);

	@Query(value = "SELECT count(*) FROM event_book WHERE statues='accepted' AND user_id = :userId", nativeQuery = true)
	Long acceptedCountByUserId(@Param("userId") int userId);
	
	@Query(value = "SELECT count(*) FROM event_book WHERE statues='Rejected' AND user_id = :userId", nativeQuery = true)
	Long rejectedCountByUserId(@Param("userId") int userId);
	
	@Query(value = "SELECT count(*) FROM event_book WHERE user_id = :userId", nativeQuery = true)
	Long CountAll(@Param("userId") int userId);
	
	@Query(value = "SELECT * FROM event_book WHERE statues='accepted' AND user_id = :userId ORDER BY id DESC LIMIT 5", nativeQuery = true)
	List<EventBook> userAcceptedData(@Param("userId") int userId);
	
}
