package com.cya.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cya.dao.NoticeDao;
import com.cya.pojo.Notice;

/**
 * Servlet implementation class updateNoticeServlet
 */
@WebServlet("/updateNoticeServlet")
public class updateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
		String nContext=request.getParameter("nContext");
		int nId=0;
		if(request.getParameter("nId")!=null && request.getParameter("nId")!="") {
			nId=Integer.parseInt(request.getParameter("nId"));
		}
		Notice notice=new Notice();
		notice.setnContext(nContext);
		notice.setnId(nId);
		notice.setnTime(new Date());
		NoticeDao noticeDao=new NoticeDao();
		noticeDao.updateNotice(notice);
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
