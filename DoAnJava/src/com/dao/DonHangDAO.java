package com.dao;

import com.model.ConnectionToDB;
import com.model.DanhMucModel;
import com.model.DonHangModel;

public class DonHangDAO implements ObjectDAO   {

	@Override
	public boolean add(Object obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean edit(Object obj, int id) {
		DonHangModel dh = (DonHangModel) obj;
		try {
			new  ConnectionToDB().excuteSql("update ct_donhang set trangthai='"+dh.getTrangthai()+"' where id='"+id+"'" );
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean del(int id) {
		try {
			new ConnectionToDB().excuteSql("delete from ct_donhang where id='"+id+"'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

}
