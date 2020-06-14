package dao;

import domain.Order;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author https://github.com/meethigher
 */
public interface OrderDao {
    @Insert("insert into order_message(name,saleprice,delivery) values(#{name},#{saleprice},#{delivery})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int saveOrder(Order order);

    @Delete("delete from order_message where id=#{id}")
    int deleteOrder(int id);

    @Update("update order_message set name=#{name},saleprice=#{saleprice},delivery=#{delivery} where id=#{id}")
    int updateOrder(Order order);

    @Select("select * from order_message where id=#{id}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "saleprice", property = "saleprice"),
            @Result(column = "delivery", property = "delivery")

    })
    Order findOrderById(int id);

    @Select("select * from order_message where name=#{name}")
    List<Order> findAllOrderByName(String name);
}
