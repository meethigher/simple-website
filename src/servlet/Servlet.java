package servlet;

import dao.OrderDao;
import domain.Order;
import org.apache.ibatis.session.SqlSession;
import utils.MyBatisUtils;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author https://github.com/meethigher
 */
@WebServlet("/servlet")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("name");
        String id = req.getParameter("id");
        SqlSession sqlSession = null;

        sqlSession = MyBatisUtils.getSqlSession();
        OrderDao pm = sqlSession.getMapper(OrderDao.class);
        HttpSession session = req.getSession();
        if (name == null) {
            Order orderById = pm.findOrderById(Integer.parseInt(id));
            session.setAttribute("order", orderById);
            session.setAttribute("d-id", Integer.parseInt(id));
            resp.sendRedirect("update.jsp");
        }
        if (id == null) {
            List<Order> orderList = pm.findAllOrderByName(name);
            session.setAttribute("orderList", orderList);
            resp.sendRedirect("show.jsp");
        }
        sqlSession.close();
    }
}
