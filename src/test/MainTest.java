package test;

import dao.OrderDao;
import domain.Order;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.DynamicTest;
import org.junit.jupiter.api.Test;
import utils.MyBatisUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 * 对接口进行的单元测试
 *
 * @author https://github.com/meethigher
 */
public class MainTest {
    @Test
    public void saveOrderTest() throws InvocationTargetException, IllegalAccessException {
        Order order = new Order();
        BeanUtils.setProperty(order,"name","胡列娜");
        System.out.println(order);

    }

    @Test
    public void deleteOrderTest() {

    }

    @Test
    public void updateOrderTest() {

    }

    @Test
    public void findAllOrderByName() {

    }

}
