package util.pool;
import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * ��������Դ�Ĺ��� C3P0����
 */
public class C3P0 {

    private static DataSource ds = null;

    static {
        ds = new ComboPooledDataSource("MySQL");
    }

    public static Connection getConn() throws SQLException {
        return ds.getConnection();
    }
}