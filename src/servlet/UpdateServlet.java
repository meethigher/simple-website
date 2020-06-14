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
import java.io.IOException;

/**
 * @author https://github.com/meethigher
 */
@WebServlet("/updateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        int id = (Integer) req.getSession().getAttribute("d-id");
        String name = req.getParameter("name");
        String salesprice = req.getParameter("salesprice");
        String delivery = req.getParameter("delivery");
        System.out.println(id + "=" + name + "=" + salesprice + "=" + delivery);
        SqlSession sqlSession = null;
        try {
            sqlSession = MyBatisUtils.getSqlSession();
            OrderDao pm = sqlSession.getMapper(OrderDao.class);
            Order order = new Order();
            order.setId(id);
            order.setName(name);
            order.setSaleprice(Float.parseFloat(salesprice));
            order.setDelivery(Integer.parseInt(delivery));

            int i = pm.updateOrder(order);
            String result = null;
            if (i > 0) {
                resp.sendRedirect("index.jsp");
            } else {
                resp.setContentType("text/html;charset=utf-8");
                resp.getWriter().write("<h1>修改失败，请返回重新修改</h2>");
            }


            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }
}
