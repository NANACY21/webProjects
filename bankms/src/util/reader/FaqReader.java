package util.reader;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Vector;

/**
 * ∂¡»°faq.txt
 */
public class FaqReader {

    private Vector categories;

    public FaqReader(String path) {
        categories = new Vector();
        try {
            FileReader fr = new FileReader(path);
            BufferedReader br = new BufferedReader(fr);
            String s = "";
            while ((s = br.readLine()) != null) {
                categories.add(s);
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Vector getAllCategories() {
        return categories;
    }
}
