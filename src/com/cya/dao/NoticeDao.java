package com.cya.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cya.pojo.Notice;
import com.cya.util.DBUtil;

public class NoticeDao {
	
	public void addNotice(Notice notice) {
		Connection conn = DBUtil.getConnectDb();
        String sql = "insert  into notice(nTime,nPerson,nContext) values(?,?,?)";
        PreparedStatement stm = null;
        try {
			stm = conn.prepareStatement(sql);
			
			Date utilDate = notice.getnTime();
	        //util.Date转sql.Date
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			stm.setDate(1, sqlDate);
			stm.setString(2, notice.getnPerson());
			stm.setString(3, notice.getnContext());
			stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Notice> get_ListInfo(){
		List<Notice> tag_Array=new ArrayList<>();
		Connection connection=DBUtil.getConnectDb();
		String sql = "select * from notice";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
			stm = connection.prepareStatement(sql);
			rs = stm.executeQuery();
			while(rs.next()) {
				Notice notice=new Notice();
				notice.setnId(rs.getInt("nId"));
				notice.setnContext(rs.getString("nContext"));
				notice.setnPerson(rs.getString("nPerson"));
				notice.setnTime(rs.getDate("nTime"));
				tag_Array.add(notice);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			 DBUtil.CloseDB(rs, stm, connection);
		}
        return tag_Array;
	}
	
	public void updateNotice(Notice notice) {
		Connection conn = DBUtil.getConnectDb();
        String sql = "update notice set nTime=?,nContext=? where nId=?";
        PreparedStatement stm = null;
        try {
			stm = conn.prepareStatement(sql);
			Date utilDate = notice.getnTime();
	        //util.Date转sql.Date
	        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			stm.setDate(1, sqlDate);
			stm.setString(2, notice.getnContext());
			stm.setInt(3, notice.getnId());
			stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public void deleteNotice(int nId) {
		Connection conn = DBUtil.getConnectDb();
		String sql = "delete from notice where nId=?";
        PreparedStatement stm = null;
        try {
            stm = conn.prepareStatement(sql);
            stm.setInt(1, nId);
            stm.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
}
