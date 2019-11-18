package vo;

public class Rate {

    private String currencyName;//货币名
    private String countryName;//国家名

    /**
     * 银行外币卖出价
     */
    private double sellMoney;

    /**
     * 买入价
     */
    private double buyMoney;

    public String getCurrencyName() {
        return currencyName;
    }

    public void setCurrencyName(String currencyName) {
        this.currencyName = currencyName;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public double getSellMoney() {
        return sellMoney;
    }

    public void setSellMoney(double sellMoney) {
        this.sellMoney = sellMoney;
    }

    public double getBuyMoney() {
        return buyMoney;
    }

    public void setBuyMoney(double buyMoney) {
        this.buyMoney = buyMoney;
    }

    @Override
    public String toString() {
        return "Rate{" +
                "currencyName='" + currencyName + '\'' +
                ", countryName='" + countryName + '\'' +
                ", sellMoney=" + sellMoney +
                ", buyMoney=" + buyMoney +
                '}';
    }
}
