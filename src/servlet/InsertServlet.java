package servlet;

import dao.OrderDao;
import domain.Order;
import org.apache.commons.beanutils.BeanUtils;
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
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet("/insertServlet")
public class InsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String name = req.getParameter("name");
        String salesprice = req.getParameter("salesprice");
        String delivery = req.getParameter("delivery");
        SqlSession sqlSession = null;
        try {
            sqlSession = MyBatisUtils.getSqlSession();
            OrderDao pm = sqlSession.getMapper(OrderDao.class);
            Order order = new Order();
            order.setName(name);
            order.setSaleprice(Float.parseFloat(salesprice));
            order.setDelivery(Integer.parseInt(delivery));

            int i = pm.saveOrder(order);
            String result = null;
            if (i > 0) {
                result = "success";
            } else {
                result = "fail";
            }
            resp.setContentType("text/html;charset=utf-8");
            ServletOutputStream sos = resp.getOutputStream();
            sos.write(result.getBytes());


            sqlSession.commit();
        } catch (Exception e) {
            sqlSession.rollback();
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
