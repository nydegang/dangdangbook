package com.oraclewdp.ddbookmarket.biz;

import java.util.List;

import com.oraclewdp.ddbookmarket.model.Book;

public interface BookBiz {

	boolean save(Book book);

	List<Book> findAll(int currentPage, String name, int sid);

	int totalRow(String name, int sid);

	int delById(int id);

    Book findBookById(int id);

	boolean update(Book book);
}
