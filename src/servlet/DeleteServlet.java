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
@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(req.getParameter("id"));
        SqlSession sqlSession = null;
        try {
            sqlSession = MyBatisUtils.getSqlSession();
            OrderDao pm = sqlSession.getMapper(OrderDao.class);
            int i = pm.deleteOrder(id);
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
}
