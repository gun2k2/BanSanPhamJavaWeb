 package com.dao;



import com.model.ConnectionToDB;
import com.model.DanhMucModel;

public class danhmucDAO implements ObjectDAO {
		public danhmucDAO()
		{
			
		}

		@Override // thêm
		public boolean add(Object obj) {
			DanhMucModel dm = (DanhMucModel) obj;
			System.out.println(dm.getName());
			try {
				new ConnectionToDB().excuteSql("insert into DanhMuc values( N'" + dm.getName() + "','" + dm.getParent_id() + "')");
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			return false;
		}

		@Override // sửa
		public boolean edit(Object obj, int id) {
			DanhMucModel dm = (DanhMucModel) obj;
			try {
				new  ConnectionToDB().excuteSql("update DanhMuc set name=N'"+dm.getName()+"',parent_id='"+dm.getParent_id()+"'where id='"+id+"'" );
				return true;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return false;
		}

		@Override // xóa
		public boolean del(int id) {
			try {
				new ConnectionToDB().excuteSql("delete from DanhMuc where id='"+id+"'");
				return true;
			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return false;
		}
		
}
