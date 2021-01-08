package com.dao;

public interface ObjectDAO {
	
	public boolean add(Object obj);
	public boolean edit(Object obj,int id);
	public boolean del(int id);
}