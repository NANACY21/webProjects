package util.pool;

import org.apache.commons.dbcp2.BasicDataSourceFactory;

import javax.sql.DataSource;//注意导入正确
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DBCP {

    private static DataSource ds = null;//数据源

    static {
        InputStream is = DBCP.class.getClassLoader().getResourceAsStream("\\util\\reader\\dbcpconfig.properties");
        Properties props = new Properties();
        try {
            props.load(is);
            ds = BasicDataSourceFactory.createDataSource(props);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static DataSource getDataSource() {
        return ds;
    }

    public static Connection getConn() throws SQLException {
        return ds.getConnection();//丛连接池取出一个
    }

    public static void release(Connection conn) {
        if (conn != null) {
            try {
                conn.close();//归还连接池
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
