package util;

import dao.impl.BankCardDaoImpl;

public class AutoDong extends Thread {

    public AutoDong(String name) {
        super(name);
    }

    //�������п�������Ϣ
    @Override
    public void run() {
        BankCardDaoImpl dao = new BankCardDaoImpl();
        while (true) {
            dao.updateAll();
            System.out.println("��Ϣ������");
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        }
    }

    /**
     * ��ͣ
     */
    public void myStop() {
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
