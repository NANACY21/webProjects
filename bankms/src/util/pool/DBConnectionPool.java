package util.pool;
import util.reader.DbReader;
import java.sql.*;
import java.util.Vector;

/**
 * 单例
 * 手写
 * 连接池，昂贵：开销大 性能
 */
public class DBConnectionPool {

	public static final String username = DbReader.getUsername();
	public static final String password = DbReader.getPassword();
	public static final String url = DbReader.getUrl();
	public static final String driver = DbReader.getDriver();
	private Vector<Connection> pool;//创建容器，容器内有若干连接对象，用完还回
	private static DBConnectionPool instance;

	//静态块只加载一次
	static {
		try {
			//第1步 利用反射加载驱动 该参数每个数据库都不一样 参数是什么还可以找Driver类
			Class.forName(driver);
			//数据库加载成功
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private DBConnectionPool() {
		pool = new Vector<>();
		try {
			for (int i = 0; i < 10; i++) {
				//第2步 创建连接的URL以获得连接 这时已经可以和数据库通信了
				Connection con = DriverManager.getConnection(url, username, password);
				//数据库连接成功
				pool.add(con);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 由于单例，即DBConnectionPool类对象只能被创建一次，DBConnectionPool类对象就一个内存地址
	 *
	 * @return
	 */
	public static DBConnectionPool getInstance() {
		if (instance == null) {
			instance = new DBConnectionPool();
		}
		return instance;
	}

	/**
	 * db连接池的关键方法
	 *
	 * @return 一个连接对象
	 */
	public Connection getConnection() {
		if (pool.size() == 0) {//若连接池中没有连接对象
			try {
				Class.forName(driver);//加载驱动
				for (int i = 0; i < 10; i++) {
					Connection con = null;
					con = DriverManager.getConnection(url, username, password);//获得连接
					pool.add(con);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Connection con = pool.get(0);
		pool.remove(0);
		return con;//返回一个连接对象，连接池的连接对象出队一个
	}

	/**
	 * @param con 释放一个连接对象con，该连接对象入队到连接池
	 */
	public void release(Connection con) {
		if (con != null) {
			pool.add(con);
		}
	}

	/**
	 * db连接池的额外功能 关闭1次连接操作
	 * 也可以关闭Connection对象，这里不关闭，还回到连接池
	 *
	 * @param rs
	 * @param ps
	 */
	public static void close(ResultSet rs, PreparedStatement ps) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}