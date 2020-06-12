package com.example.demo.dao;

import java.lang.reflect.ParameterizedType;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.transform.Transformers;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.utils.PageBean;
import com.example.demo.utils.ReflectUtils;
 
/***
 **create by yinchong
 */
@Transactional
@SuppressWarnings("unchecked")
public class DAOImpl<T> implements DAO<T>{
 
    private Class<T> clazz;
 
    public DAOImpl() {
        ParameterizedType t = (ParameterizedType) this.getClass().getGenericSuperclass();
        //获取泛型参数的实际类型
        this.clazz = (Class<T>) t.getActualTypeArguments()[0];
    }
 
    @PersistenceContext()
    protected EntityManager entityManager;
 
 
    @Transactional(propagation = Propagation.REQUIRED)
    public void save(T bean) {
        entityManager.persist(bean);
    }
 
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean save2(T bean){
        try {
            entityManager.persist(bean);
            return true;
        }catch (Exception e){
        	e.printStackTrace();
        	return false;
        }
    }
    
    @Transactional(propagation = Propagation.REQUIRED)
    public void update(T bean) {
        entityManager.merge(bean);
    }
 
    public T findById(Long id) {
        return entityManager.find(clazz, id);
    }
 
 
    /**
     * @param id
     * @return 小于0 表示删除失败 大与0表示删除成功
     */
    @Transactional(propagation = Propagation.REQUIRED)
    public int delete(Long id) {
        Query query = entityManager.createQuery("delete from " + clazz.getSimpleName() + " p where p.id = ?1");
        query.setParameter(1, id);
        return query.executeUpdate();
    }
 
 
    /**
     * 显示所有数据
     *
     * @return
     */
    public List<T> findAll() {
        String hql = "select t from " + clazz.getSimpleName() + " t";
//        System.out.println(hql);
        Query query = entityManager.createQuery(hql);
        List<T> beans = query.getResultList();
        return beans;
    }
 
 
    /**
     * 批量插入
     *
     * @param beans
     */
    @Transactional(propagation = Propagation.REQUIRED)
    public void batchSave(List<T> beans) {
        if (beans != null) {
            for (T bean : beans)
                entityManager.persist(bean);
            entityManager.flush();
            entityManager.clear();
        }
 
    }
 
 
    /**
     * 批量更新
     *
     * @param beans
     */
    @Transactional(propagation = Propagation.REQUIRED)
    public void batchUpdate(List<T> beans) {
        if (beans != null) {
            for (T bean : beans)
                entityManager.merge(bean);
            entityManager.flush();
            entityManager.clear();
        }
    }
 
 
    @Transactional(propagation = Propagation.REQUIRED)
    public int batchDelete(List<Long> ids) {
        StringBuffer hql = new StringBuffer("delete from " + clazz.getSimpleName() + " where id  in(:ids)");
        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("ids", ids);
        return query.executeUpdate();
    }
 
 
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void batchUpdateNotNull(List<T> beans) {
        if (beans == null || beans.size() == 0)
            return;
        List<Map<String, Object>> datas = new LinkedList<>();
        for (T bean : beans) {
            Map<String, Object> data = ReflectUtils.createMapForNotNull(bean);
            datas.add(data);
        }
 
        for (Map<String, Object> map : datas) {
            //拼接Hql语句
            StringBuffer hql = new StringBuffer("update " + clazz.getSimpleName() + "");
            Set<String> keys = map.keySet();
            boolean fist = true;
            for (String key : keys) {
                if (key.equals("id"))
                    continue;
                if (fist) {
                    hql.append(" set ").append(key + "=:" + key);
                    fist = false;
                } else {
                    hql.append("," + key + "=:" + key);
                }
            }
            hql.append(" where id=:id");
            Query query = entityManager.createQuery(hql.toString());
 
            //设置参数
            for (String key : keys) {
                Object value = map.get(key);
                query.setParameter(key, value);
            }
            query.executeUpdate();
        }
        entityManager.flush();
        entityManager.clear();
 
    }
 
    @Override
    public int executeSql(String sql, Object... params) {
        Map<String, Object> map = getSql(sql);
        int count = (int) map.get("count");
        Query query = entityManager.createNativeQuery(sql);
        setQueryParameters(count,query,params);
        return query.executeUpdate();
    }
 
    @Override
    public int executeHql(String hql, Object... params) {
        Map<String, Object> map = getHSql(hql);
        String jpaHql = (String) map.get("sql");
        int count = (int) map.get("count");
        Query query = entityManager.createQuery(jpaHql);
        setQueryParameters(count,query,params);
        return query.executeUpdate();
    }
 
    @Override
    public List<Map<String, Object>> findSql(String sql, Object... params) {
        Map<String, Object> map = getHSql(sql);
        String jpaSql = (String) map.get("sql");
        Integer count = (Integer) map.get("count");
        Query query = entityManager.createNativeQuery(jpaSql);
        setQueryParameters(count,query,params);
        return query.unwrap(org.hibernate.SQLQuery.class)
                .setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }
 
    @Override
    public List<T> findSql(String sql, Class<T> clazz, Object... params) {
        Map<String, Object> map = getSql(sql);
        String jpaSql = (String) map.get("sql");
        Integer count = (Integer) map.get("count");
        Query query = entityManager.createNativeQuery(jpaSql);
        setQueryParameters(count,query,params);
        query.unwrap(clazz);
        return query.getResultList();
    }
 
    private Integer locationFrom(String sql){
        if(sql==null||sql.equals(""))
            return -1;
        int count = countSelect(sql);
        if(count==0)
            return -1;
        if(count==1){
            return sql.indexOf("from");
        }else{
            int index = sql.indexOf("from");
            String temp = sql.substring(0,index);
            if(!temp.contains("select"))
                return index;
 
        }
        return null;
 
    }
 
    private int countSelect(String sql){
        if(sql.indexOf("select")<0)
            return 0;
        int index = sql.indexOf("select");
        return 1+countSelect(sql.substring(index+6));
    }
    /**
     * 分页显示数据
     *
     * @param sql
     * @param pageNum  第几页
     * @param pageSize 每页显示多少个
     * @param params   需要传递的参数
     * @return
     */
    @Override
    public PageBean<Map<String, Object>> pageSql(String sql, Integer pageNum, Integer pageSize, Object... params) {
    	//"select p from admin limit ?1,?2"
        Map<String, Object> map = getSql(sql);
        String jpaSql = (String) map.get("sql");
        Integer count = (Integer) map.get("count");
        if (params != null) {
            if (count != params.length)
                throw new RuntimeException("参数数量和？不一致");
        }
        PageBean<Map<String,Object>> pageBean = new PageBean<>();
        pageBean.setPageNum(pageNum);
        pageBean.setPageSize(pageSize);
 
        int index = sql.indexOf("from");
        String tempSql = "select count(1) "+sql.substring(index);
        Long totalCount = countSql(tempSql,params);
        if(totalCount==null||totalCount==0){
            pageBean.setTotalCount(0L);
            return pageBean;
        }
        pageBean.setTotalCount(totalCount);
 
        if(pageNum!=null&&pageSize!=null) {
            if (pageNum <= 0) {
                pageNum = 1;
            }
            jpaSql += " limit " + (pageNum - 1) * pageSize + "," + pageSize;
        }
        Query query = entityManager.createNativeQuery(jpaSql);
        if (params != null && params.length > 0) {
            int length = params.length;
            for (int i = 0; i < length; i++) {
                query.setParameter(i + 1, params[i]);
            }
        }
        List<Map<String,Object>> result =   query.unwrap(org.hibernate.SQLQuery.class)
                .setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        pageBean.setDatas(result);
        return pageBean;
    }
    @Override
    public PageBean<T> pageSql1(String sql, Integer pageNum, Integer pageSize, Object... params) {
    	//"select p from admin limit ?1,?2"
        Map<String, Object> map = getSql(sql);
        String jpaSql = (String) map.get("sql");
        Integer count = (Integer) map.get("count");
        if (params != null) {
            if (count != params.length)
                throw new RuntimeException("参数数量和？不一致");
        }
        PageBean<T> pageBean = new PageBean<>();
        pageBean.setPageNum(pageNum);
        pageBean.setPageSize(pageSize);
 
        int index = sql.indexOf("from");
        String tempSql = "select count(1) "+sql.substring(index);
        Long totalCount = countSql(tempSql,params);
        if(totalCount==null||totalCount==0){
            pageBean.setTotalCount(0L);
            return pageBean;
        }
        pageBean.setTotalCount(totalCount);
 
        if(pageNum!=null&&pageSize!=null) {
            if (pageNum <= 0) {
                pageNum = 1;
            }
            jpaSql += " limit " + (pageNum - 1) * pageSize + "," + pageSize;
        }
        Query query = entityManager.createNativeQuery(jpaSql);
        if (params != null && params.length > 0) {
            int length = params.length;
            for (int i = 0; i < length; i++) {
                query.setParameter(i + 1, params[i]);
            }
        }
        List<T> result =   query.unwrap(org.hibernate.SQLQuery.class)
                .setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        pageBean.setDatas(result);
        return pageBean;
    }
    
    private Map<String, Object> getSql(String sql) {
        sql += " ";
        int count = 0;
        Map<String, Object> map = new HashMap<>();
        map.put("sql", sql);
        map.put("count", count);
        String[] datas = sql.split("\\?");
        int length = datas.length;
        if (length == 1)
            return map;
        for (int i = 0; i < length - 1; i++) {
            count++;
        }
        map.put("count", count);
        map.put("sql", sql);
        return map;
    }
    private Map<String, Object> getHSql(String sql) {
        sql += " ";
        int count = 0;
        Map<String, Object> map = new HashMap<>();
        map.put("sql", sql);
        map.put("count", count);
        String[] datas = sql.split("\\?");
        int length = datas.length;
        if (length == 1)
            return map;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length - 1; i++) {
            count++;
            sb.append(datas[i]).append("?" + count).append(" ");
        }
        sb.append(datas[length-1]);
        map.put("count", count);
        map.put("sql", sb.toString());
        return map;
    }
    @Override
    public List<T> findHql(String hql, Object... params) {
        Map<String, Object> map = getHSql(hql);
        String jpaSql = (String) map.get("sql");
        Integer count = (Integer) map.get("count");
        //获取数据
        Query query = entityManager.createQuery(jpaSql);
        setQueryParameters(count,query,params);
        List<T> records =  query.getResultList();
        return records;
    }
 
    @Override
    public PageBean<T> pageHql(String hql, Integer pageNum, Integer pageSize, Object... params) {
 
        Map<String, Object> map = getHSql(hql);
        String jpaSql = (String) map.get("sql");
        Integer count = (Integer) map.get("count");
        if (params != null) {
            if (params.length != count) {
                throw new RuntimeException("sql 语句和参数数量不一致");
            }
        }
        //执行count操作
        PageBean<T> pageBean = new PageBean<>();
        pageBean.setPageNum(pageNum);
        pageBean.setPageSize(pageSize);
        int index = hql.indexOf("from");
        String tempHql = "select count(1) "+hql.substring(index);
        Long totalCount = countHql(tempHql,params);
        if(totalCount==null||totalCount==0){
            pageBean.setTotalCount(0L);
            return pageBean;
        }
        pageBean.setTotalCount(totalCount);
 
        //获取数据
        Query query = entityManager.createQuery(jpaSql);
        if (params != null && params.length > 0) {
            int length = params.length;
            for (int i = 0; i < length; i++) {
                query.setParameter(i + 1, params[i]);
            }
        }
        if(pageNum!=null&&pageSize!=null){
            if(pageNum==0)
                pageNum=1;
            query.setFirstResult((pageNum-1)*pageSize);
            query.setMaxResults(pageSize);
        }
        List<T> records =  query.getResultList();
        pageBean.setDatas(records);
        return pageBean;
    }
 
    @Override
    public List<T> pageHql1(String hql, Integer pageNum, Integer pageSize, Object... params) {
        Map<String, Object> map = getHSql(hql);
        String jpaSql = (String) map.get("sql");
        Integer count = (Integer) map.get("count");
        if (params != null) {
            if (params.length != count) {
                throw new RuntimeException("sql 语句和参数数量不一致");
            }
        }
        //获取数据
        Query query = entityManager.createQuery(jpaSql);
        if (params != null && params.length > 0) {
            int length = params.length;
            for (int i = 0; i < length; i++) {
                query.setParameter(i + 1, params[i]);
            }
        }
        if(pageNum!=null&&pageSize!=null){
            if(pageNum==0)
                pageNum=1;
            query.setFirstResult((pageNum-1)*pageSize);
            query.setMaxResults(pageSize);
        }
        List<T> records =  query.getResultList();
        return records;
    }
    
    @Override
    public Long countHql(String hql, Object... params) {
        Map<String, Object> map = getHSql(hql);
        String jpaSql = (String) map.get("sql");
        Integer count = (Integer) map.get("count");
        Query query = entityManager.createQuery(jpaSql);
        setQueryParameters(count, query, params);
        return ((Long)query.getSingleResult());
    }
 
    /**
     * 为Query设置参数
     * @param count
     * @param query
     * @param params
     */
    private void setQueryParameters(Integer count, Query query, Object[] params) {
        if (params != null) {
            if (params.length != count) {
                throw new RuntimeException("sql 语句和参数数量不一致");
            }
            if (params.length > 0) {
                int length = params.length;
                for (int i = 0; i < length; i++) {
                    query.setParameter(i + 1, params[i]);
                }
            }
        }
    }
    @Override
    public Long countSql(String sql, Object... params) {
        Map<String,Object> map = getSql(sql);
        String jpaSql = (String) map.get("sql");
        Integer count = (Integer) map.get("count");
        Query query =  entityManager.createNativeQuery(jpaSql);
        setQueryParameters(count,query,params);
        return ((BigInteger) query.getSingleResult()).longValue();
    }
 
    @Override
    public int updateNotNull(T bean) {
        try {
            batchUpdateNotNull(Arrays.asList(bean));
        }catch (Exception e){
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>:error:"+e.getMessage()+""+e.getCause());
            return -1;
        }
        return 1;
    }
 
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public int deleteEqualField(String field, Object value) {
        Query query = entityManager.createQuery("delete from " + clazz.getSimpleName() + " p where p."+field+" = ?1");
        query.setParameter(1, value);
        return query.executeUpdate();
    }
 
 
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public int deleteLikeField(String field,String value){
        Query query = entityManager.createQuery("delete from " + clazz.getSimpleName() + " p where p."+field+" like ?1");
        query.setParameter(1, value);
        return query.executeUpdate();
    }
 
    @Override
    public List<T> findByInteger(String field, Integer value) {
        Query query = entityManager.createQuery("select p from "+clazz.getSimpleName()+" p where p."+field+" = ?1");
        query.setParameter(1,value);
        List<T> records =  query.getResultList();
        return records;
    }
 
    @Override
    public List<T> findByString(String field, String value) {
        Query query = entityManager.createQuery("select p from "+clazz.getSimpleName()+" p where p."+field+" like ?1");
        query.setParameter(1,"%"+value+"%");
        List<T> records =  query.getResultList();
        return records;
    }
    @Override
    public List<T> findByString1(String field, String value) {
        Query query = entityManager.createQuery("select p from "+clazz.getSimpleName()+" p where p."+field+" = ?1");
        query.setParameter(1,value);
        List<T> records =  query.getResultList();
        return records;
    }
    @Override
    public List<T> findByTime(String field, String value, String value1) {
        Query query = entityManager.createQuery("select p from "+clazz.getSimpleName()+" p where p."+field+" between  ?1 and ?2");
        query.setParameter(1,value);
        query.setParameter(2,value1);
        List<T> records =  query.getResultList();
        return records;
    }
    @Override
    public List<T> findByTime1(String field,String field1, String value, String value1,String value2) {
        Query query = entityManager.createQuery("select p from "+clazz.getSimpleName()+" p where p."+field+" like ?1 and p."+field1+" between  ?2 and ?3");
        query.setParameter(1,value);
        query.setParameter(2,value1);
        query.setParameter(3,value2);
        List<T> records =  query.getResultList();
        return records;
    }

	@Override
	public List<T> findOrderBy(String sql) {
		 
		 Query query = entityManager.createNativeQuery("select p from +"+clazz.getSimpleName()+"p order by p.zan");
		
	     return query.getResultList();
	}

	@Override
	public List<T> findBySql(String sql) {
		
		Query query = entityManager.createNativeQuery(sql);
		
	    return query.getResultList();
	}
    
}
