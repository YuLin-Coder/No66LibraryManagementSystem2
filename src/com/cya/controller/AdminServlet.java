package com.cya.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cya.dao.AdminDao;
import com.cya.dao.BookDao;
import com.cya.pojo.Admin;


/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String id="";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//		doGet(request, response);
        PrintWriter out = response.getWriter();
        //设置编码类型
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        BookDao bookdao = new BookDao();
        //这里为了简单，设置了tip，用来区分是修改密码功能，还是修改个人资料的功能，tip=1为修改密码
        int tip = Integer.parseInt(request.getParameter("tip"));
        //获取发起请求页面的文件名称，这个在对应的jsp里面的表单填写，修改完成后就可以直接返回对应的页面
        String url = request.getParameter("url");
        System.out.println("url="+url);
        HttpSession session = request.getSession();
        Admin adminbean = new Admin();
        if(url.split("/")[0].equals("user")) {
        	id=(String) session.getAttribute("uid");
        }
        else {
        	id = (String) session.getAttribute("aid");
        }
     
        AdminDao admindao = new AdminDao();
        //通过aid获取到读者的信息
        adminbean = admindao.get_AidInfo2(id);
        //修改密码
        if (tip == 1) {
            //获取到输入的旧密码，新密码
            String password = request.getParameter("password");
            String password2 = request.getParameter("password2");
            //获取读者数据表中的密码
            String old_password = adminbean.getPassword();
            //对旧密码进行比较，如果相同就修改，不相同就直接退出
            if (old_password.equals(password)) {
                admindao.updateUser(adminbean.getAid(), adminbean.getUsername(), password2, adminbean.getName(),
                        adminbean.getEmail(), adminbean.getPhone(), adminbean.getLend_num(), adminbean.getMax_num());
                response.sendRedirect("/manage_books/books/" + url + ".jsp");
            } else {
                out.write("<script type='text/javascript'>location.href='./books/" + url + ".jsp';alert('password error'); </script>");

            }
        } else {
            //修改个人资料
            //获取输入的信息
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            //修改输入的信息到数据表中
            admindao.updateUser(adminbean.getAid(), adminbean.getUsername(), adminbean.getPassword(), name,
                    email, phone, adminbean.getLend_num(), adminbean.getMax_num());
            
            response.sendRedirect("/manage_books/books/" + url + ".jsp");
        }
    }

}
