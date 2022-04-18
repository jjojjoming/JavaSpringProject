package com.moca.web.common;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;
import org.springframework.util.StringUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class EncryptTypeHandler implements TypeHandler<String> {

    private AES256Util aes256Util;

    public EncryptTypeHandler() throws IOException {
        String key = this.fileRead();
        this.aes256Util = new AES256Util(key);
    }

    private String fileRead() throws IOException {
        InputStream inputStream = this.getClass().getResourceAsStream("/public-key");
        BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
        return br.readLine();
    }

    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, String s, JdbcType jdbcType) throws SQLException {
        try {
            if(StringUtils.isEmpty(s)) {
                preparedStatement.setString(i, s);
            } else {
                preparedStatement.setString(i, aes256Util.encrypt(s));
            }

        } catch (Exception e) {
            throw new SQLException(e);
        }
    }

    @Override
    public String getResult(ResultSet resultSet, String s) throws SQLException {
        try {
            String val = resultSet.getString(s);
            return StringUtils.isEmpty(val) ? val : aes256Util.decrypt(val);
        } catch (Exception e) {
            throw new SQLException(e);
        }

    }

    @Override
    public String getResult(ResultSet resultSet, int i) throws SQLException {
        try {
            String val = resultSet.getString(i);
            return StringUtils.isEmpty(val) ? val : aes256Util.decrypt(val);
        } catch (Exception e) {
            throw new SQLException(e);
        }
    }

    @Override
    public String getResult(CallableStatement callableStatement, int i) throws SQLException {
        try {
            String val = callableStatement.getString(i);
            return StringUtils.isEmpty(val) ? val : aes256Util.decrypt(val);
        } catch (Exception e) {
            throw new SQLException(e);
        }
    }
}
