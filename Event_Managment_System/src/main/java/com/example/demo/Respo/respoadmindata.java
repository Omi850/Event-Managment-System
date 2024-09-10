package com.example.demo.Respo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.admin;

public interface respoadmindata extends JpaRepository<admin, Integer> {
	   public admin findByEmail(String email);
}