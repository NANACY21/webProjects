package util;

import dao.impl.BankCardDaoImpl;

public class AutoDong extends Thread {

    public AutoDong(String name) {
        super(name);
    }

    //所有银行卡余额都涨利息
    @Override
    public void run() {
        BankCardDaoImpl dao = new BankCardDaoImpl();
        while (true) {
            dao.updateAll();
            System.out.println("利息增加中");
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }
    }

    /**
     * 暂停
     */
    public void myStop() {
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
