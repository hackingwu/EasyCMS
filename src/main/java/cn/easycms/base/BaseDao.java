package cn.easycms.base;


import java.util.List;

/**
 * Created by hackingwu on 2014/4/1.
 */
public interface BaseDao {
    /**
     * 根据标示属性来加载Object实例
     *
     * @param id 需要加载的Object实例的标识属性值
     * @return 指定标识属性对应的Object实例
     */
    Object get(String id);

    /**
     * 持久化指定的Object实例
     *
     * @param object 需要被持久化的Object实例
     */
    void save(Object object);

    /**
     * 修改指定的Object实例
     *
     * @param object 需要被修改的Object实例
     */
    void update(Object object);

    /**
     * 删除指定的Object实例
     *
     * @param object 需要被删除的Object实例
     */
    void delete(Object object);

    /**
     * 根据标识符来删除Object实例
     *
     * @param id 需要被删除的Object实例的标识符属性值
     */
    void delete(String id);

    /**
     * 查询全部的Object实例
     *
     * @return 数据库中全部的Object实例
     */
    List findAll();
}
