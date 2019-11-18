package vo;

import java.util.HashMap;
import java.util.Map;

public class Analysis {

    private Map<String, Map<String, Object>> incomes;   //每个月份的收入数据
    private Map<String, Map<String, Object>> expences;    //每个月份的支出数据
    private Map<String, Map<String, Map<String, Object>>> typeIncomes;  //分类别的每个月份的收入数据
    private Map<String, Map<String, Map<String, Object>>> typeExpences;  //分类别的每个月份的支出数据
    public String[] incomeLabel;
    public String[] expenceLabel;

    public Analysis() {
        this.incomes = new HashMap<>();
        this.expences = new HashMap<>();
        this.typeIncomes = new HashMap<>();
        this.typeExpences = new HashMap<>();
    }

    public Map<String, Map<String, Object>> getIncomes() {
        return incomes;
    }

    public void setIncomes(String key, Map<String, Object> incomes) {

        this.incomes.put(key, incomes);
    }

    public Map<String, Map<String, Object>> getExpences() {
        return expences;
    }

    public void setExpences(String key, Map<String, Object> expences) {

        this.expences.put(key, expences);
    }

    public Map<String, Map<String, Map<String, Object>>> getTypeIncomes() {
        return typeIncomes;
    }

    public void setTypeIncomes(String key, Map<String, Map<String, Object>> typeIncomes) {

        this.typeIncomes.put(key, typeIncomes);
    }

    public Map<String, Map<String, Map<String, Object>>> getTypeExpences() {
        return typeExpences;
    }

    public void setTypeExpences(String key, Map<String, Map<String, Object>> typeExpences) {

        this.typeExpences.put(key, typeExpences);
    }

    public String[] getIncomeLabel() {
        return incomeLabel;
    }

    public void setIncomeLabel(String[] incomeLabel) {
        this.incomeLabel = incomeLabel;
    }

    public String[] getExpenceLabel() {
        return expenceLabel;
    }

    public void setExpenceLabel(String[] expenceLabel) {
        this.expenceLabel = expenceLabel;
    }
}
