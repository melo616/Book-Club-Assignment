package com.codingdojo.loginreg.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.loginreg.models.Book;
import com.codingdojo.loginreg.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepo;
	
	//create
	public Book createBook(Book book) {
		return bookRepo.save(book);
	}
	//all books
	public List<Book> allBooks() {
		return bookRepo.findAll();
	}
	//one book
	public Book oneBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}
	//update
	public Book editBook(Book book) {
		return bookRepo.save(book);
	}
	//delete
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
}
