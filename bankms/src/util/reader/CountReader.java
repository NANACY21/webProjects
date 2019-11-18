package util.reader;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 读取count.txt
 */
public class CountReader {

    private static final String accessNum = DbReader.getAccessNum();

    public static String read() {
        File f = new File(accessNum);
        int count = 0;
        try {
            InputStreamReader isr = new InputStreamReader(new FileInputStream(f));
            BufferedReader br = new BufferedReader(isr);
            count = Integer.parseInt(br.readLine());
            count = count + 1;
            write(count + "");
            br.close();
            isr.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return count + "";
    }

    public static void write(String count) {
        File f = new File(accessNum);
        try {
            FileWriter fw = new FileWriter(f);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(count);
            bw.close();//这样就可以不调用flush()方法
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}