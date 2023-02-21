package com.codingdojo.loginreg.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.loginreg.models.Book;

public interface BookRepository extends CrudRepository<Book, Long>{
	List<Book> findAll();
}
