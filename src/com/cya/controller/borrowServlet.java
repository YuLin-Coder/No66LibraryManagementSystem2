package com.cya.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cya.pojo.Admin;
import com.cya.dao.AdminDao;
import com.cya.dao.BookDao;

/**
 * Servlet implementation class borrowServlet
 */
@WebServlet("/borrowServlet")
public class borrowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public borrowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
        //设置编码类型
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        BookDao bookdao = new BookDao();
        //为了区分借书和还书的功能，设置tip，tip为1，表示借书
        int tip = Integer.parseInt(request.getParameter("tip"));
        if (tip == 1) {
            //获取图书id
            int bid = Integer.parseInt(request.getParameter("bid"));
            HttpSession session = request.getSession();
            Admin admin = new Admin();
            String status=request.getParameter("status");
            String id="";
            if(status.equals("user")) {
            	//获取到存入session的读者id
                id = (String) session.getAttribute("uid");
            }
            else {
            	//获取到存入session的aid读者id
                 id = (String) session.getAttribute("aid");
            }
            
            AdminDao admindao = new AdminDao();
            //通过aid获取到读者的信息
            admin = admindao.get_AidInfo2(id);
            //将借阅记录存入数据表
            bookdao.borrowBook(bid, admin);
            response.sendRedirect("/manage_books/books/user/select.jsp");
        } else {
            //还书功能，获取借阅记录的hid
            int hid = Integer.parseInt(request.getParameter("hid"));
            /**
             * 还书在管理员和读者界面都有，为了区分，设置了show字段，show为1表示读者界面
             */
            int show = Integer.parseInt(request.getParameter("show"));
            //调用还书函数，改变status字段
            bookdao.borrowBook2(hid);
            if (show == 1) {
                response.sendRedirect("/manage_books/books/user/borrow.jsp");
            } else {
                response.sendRedirect("/manage_books/books/admin/admin_borrows.jsp");
            }

        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
