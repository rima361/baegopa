package com.spring.hungry.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CommonDAO {

    @Autowired private SqlSessionTemplate sqlSession;

    public void setSqlSession(SqlSessionTemplate sqlSession){
        this.sqlSession = sqlSession;
    }

    public Object insert(String queryId, Object params){
        return sqlSession.insert(queryId, params);
    }

    public Object update(String queryId, Object params){
        return sqlSession.update(queryId, params);
    }

    public Object delete(String queryId, Object params){
        return sqlSession.delete(queryId, params);
    }

    public Object selectOne(String queryId){
        return sqlSession.selectOne(queryId);
    }

    public Object selectOne(String queryId, Object params){
        return sqlSession.selectOne(queryId, params);
    }

    public List selectList(String queryId){
        return sqlSession.selectList(queryId);
    }

    public List selectList(String queryId, Object params){
        System.out.println(sqlSession.toString());
        return sqlSession.selectList(queryId,params);
    }
}
