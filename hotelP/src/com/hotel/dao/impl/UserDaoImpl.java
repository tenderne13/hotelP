package com.hotel.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.hotel.dao.UserDao;
import com.hotel.po.User;
@Repository(value="userDao")
public class UserDaoImpl implements UserDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings("deprecation")
	@Override
	public Integer checkUserName(String userName) {
		String sql = "select count(*) from t_user where username = '"+userName+"'";
		int count = jdbcTemplate.queryForInt(sql);
		return count;
	}

	@Override
	public void registUser(final User user) {
		String sql="insert into t_user(nickName,username,password,mobile,email) values" +
					"(?,?,?,?,?)";
		
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement pr) throws SQLException {
				pr.setString(1, user.getNickName());
				pr.setString(2, user.getUserName());
				pr.setString(3, user.getPassword());
				pr.setString(4, user.getMobile());
				pr.setString(5, user.getEmail());
			}
		});
	}

	/* (non-Javadoc)
	 * @see com.hotel.dao.UserDao#checkLogin(com.hotel.po.User)
	 */
	@Override
	public User checkLogin(User user) {
		String sql="select * from t_user where username='"+user.getUserName()+"' and password" +
					" ='"+user.getPassword()+"' ";
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		if(list.size()>0){
			Map<String,Object> map=list.get(0);
			user.setId((Integer)map.get("userId"));
			user.setMobile((String)map.get("mobile"));
			user.setEmail((String)map.get("email"));
			user.setNickName((String)map.get("nickName"));
			return user;
		}else{
			return null;
		}
	}
	
	
}
