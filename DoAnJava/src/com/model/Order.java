package com.model;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable {
	
	private int id;
	private KhachHangModel customer;
	private List<SanPhamModel> items;
	private int status;
	

}
