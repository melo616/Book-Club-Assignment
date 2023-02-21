package com.codingdojo.loginreg.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.loginreg.models.Book;
import com.codingdojo.loginreg.services.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
    @GetMapping("/home")
    public String dashboard(HttpSession session, Model model) {
    	//don't allow them to visit if not logged in
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	//gets books to render in table
    	model.addAttribute("bookList", bookService.allBooks());
    	return "home.jsp";
    }
    
    //render create form
    @GetMapping("/books/new")
    public String displayNewBookForm(@ModelAttribute("newBook") Book book) {
    	return "newBook.jsp";
    }
    
    //process create form
    @PostMapping("/books/new")
    public String processNewBookForm(@Valid @ModelAttribute("newBook") Book newBook, BindingResult result, Model model) {
    	if(result.hasErrors()) {
    		return "newBook.jsp";
    	} else {
    		bookService.createBook(newBook);
    		return "redirect:/home";
    	}
    }
    //get one
    @GetMapping("/books/{id}")
    public String bookDetails(@PathVariable("id")Long id, Model model) {
    	Book book = bookService.oneBook(id);
    	model.addAttribute("book", book);
    	return "bookDetails.jsp";
    }
    //edit
    @GetMapping("/books/edit/{id}")
    public String displayEditBookForm(@PathVariable("id")Long id, Model model) {
    	Book foundBook = bookService.oneBook(id);
    	model.addAttribute("foundBook", foundBook);
    	return "editBook.jsp";
    }
    @PutMapping("/books/edit/{id}")
    public String processEditBook(@Valid @ModelAttribute("foundBook")Book book, BindingResult result, @PathVariable("id")Long id) {
    	if(result.hasErrors()) {
    		return "editBook.jsp";
    	} else {
    		bookService.editBook(book);
    		return "redirect:/home";
    	}
    }
    //delete
    @DeleteMapping("/books/delete/{id}")
    public String processDeleteBook(@PathVariable("id")Long id) {
    	bookService.deleteBook(id);
    	return "redirect:/home";
    }
}

