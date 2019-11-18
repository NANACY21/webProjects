package util.pool;
import util.reader.DbReader;
import java.sql.*;
import java.util.Vector;

/**
 * ����
 * ��д
 * ���ӳأ����󣺿����� ����
 */
public class DBConnectionPool {

	public static final String username = DbReader.getUsername();
	public static final String password = DbReader.getPassword();
	public static final String url = DbReader.getUrl();
	public static final String driver = DbReader.getDriver();
	private Vector<Connection> pool;//�������������������������Ӷ������껹��
	private static DBConnectionPool instance;

	//��̬��ֻ����һ��
	static {
		try {
			//��1�� ���÷���������� �ò���ÿ�����ݿⶼ��һ�� ������ʲô��������Driver��
			Class.forName(driver);
			//���ݿ���سɹ�
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private DBConnectionPool() {
		pool = new Vector<>();
		try {
			for (int i = 0; i < 10; i++) {
				//��2�� �������ӵ�URL�Ի������ ��ʱ�Ѿ����Ժ����ݿ�ͨ����
				Connection con = DriverManager.getConnection(url, username, password);
				//���ݿ����ӳɹ�
				pool.add(con);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * ���ڵ�������DBConnectionPool�����ֻ�ܱ�����һ�Σ�DBConnectionPool������һ���ڴ��ַ
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
	 * db���ӳصĹؼ�����
	 *
	 * @return һ�����Ӷ���
	 */
	public Connection getConnection() {
		if (pool.size() == 0) {//�����ӳ���û�����Ӷ���
			try {
				Class.forName(driver);//��������
				for (int i = 0; i < 10; i++) {
					Connection con = null;
					con = DriverManager.getConnection(url, username, password);//�������
					pool.add(con);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Connection con = pool.get(0);
		pool.remove(0);
		return con;//����һ�����Ӷ������ӳص����Ӷ������һ��
	}

	/**
	 * @param con �ͷ�һ�����Ӷ���con�������Ӷ�����ӵ����ӳ�
	 */
	public void release(Connection con) {
		if (con != null) {
			pool.add(con);
		}
	}

	/**
	 * db���ӳصĶ��⹦�� �ر�1�����Ӳ���
	 * Ҳ���Թر�Connection�������ﲻ�رգ����ص����ӳ�
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