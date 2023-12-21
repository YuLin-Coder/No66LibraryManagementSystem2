package com.cya.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.PRIVATE_MEMBER;

import com.cya.dao.NoticeDao;
import com.cya.pojo.Notice;

/**
 * Servlet implementation class AddNoticeServlet
 */
@WebServlet("/AddNoticeServlet")
public class AddNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private String nPerson="";
	private String nContext="";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//设置编码类型
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
		nPerson=request.getParameter("nPerson");
		nContext=request.getParameter("nContext");
		System.out.println(nPerson+","+nContext);
		
		Notice notice=new Notice();
		notice.setnContext(nContext);
		notice.setnPerson(nPerson);
		notice.setnTime(new Date());
		
		NoticeDao noticeDao=new NoticeDao();
		noticeDao.addNotice(notice);
		response.sendRedirect("/manage_books/books/admin/admin_notice.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
