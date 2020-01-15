package model.impl;

import dao.IDao;
import dao.IDaoNew;
import dao.impl.*;
import model.BankCardService;
import vo.TR;
import vo.card.BankCard;
import vo.user.NUser;

import java.util.*;

import static util.Tool.getTime;

/**
 * ��� ת��һ���ͬʱ���У�
 * �����id ת��Ŀ��id��ͬ����2�߲���ͬʱ���У�
 * ��ͬһ���˻���ȡ���ͬʱ���У�ͬһ���˻�Ҳ����ͬʱ��ͬһ���˻�Ҳ����ͬʱȡ��
 * <p>
 * ��/ȡ/ת�˷�ֹ�����ͬ���� ����ʵ��Ӧ����ͬ���������ݿ�Ϳ���ʵ��
 * �ֲ�ʽϵͳͬ������Ч������취�����񡢷ֲ�ʽ��
 * ATM��������Ǯʱ��΢�ź��������취���ֲ�ʽ��
 * <p>
 * <p>
 * ͬ������ͬһʱ�������²���ͬʱִ��
 */
public class BankCardServiceImpl implements BankCardService {

    /**
     * ��ǰ�÷����������ڽ��в����������˻�
     * <p>
     * ��������������bcs���ڴ��ַ��һ��
     */
    private static Vector<Long> bcs = null;
    private BankCardDaoImpl dao;//�ò�������dao�㣬Ϊ����ĳ�Ա����

    public BankCardServiceImpl() {
        if (bcs == null) {
            bcs = new Vector<>();
        } else {

        }
        this.dao = new BankCardDaoImpl();

    }

    /**
     * ����һ����ͨ���п�
     *
     * @param userID Ҫ�쿨���˵����֤��
     * @param name   Ҫ�쿨���˵���ʵ����
     * @return ���п��š���ʼ���п�����
     */
    @Override
    public String addBankCard(long userID, String name) {
        NUserServiceImpl service = new NUserServiceImpl();
        NUser nuser = service.getNUserByID(userID);
        if (nuser == null) {//�û������Ƿ��и����֤��//�û���û�д���->ûע��
            return "�쿨ʧ�ܣ�����δע���û�����Ҫ���û�ע��";
        }
        BankCard bc = new BankCard(nuser.getuID());
        bc.setMoney(0);
        String userid = userID + "";
        String substring = userid.substring(userid.length() - 6, userid.length());
        bc.setPassword(substring);//���ó�ʼ����
        String add = dao.insert(bc);
        if ("����ɹ�".equals(add)) {
            IDaoNew daoNew = new BankCardDaoImpl();
            BankCard last = (BankCard) daoNew.findLast();
            if (last != null) {
                return "�쿨�ɹ������п��ţ�" + last.getID() + "��ʼ���룺" + last.getPassword() + "�����Ը���������";
            }
        }
        return "�쿨ʧ�ܣ�";
    }


    @Override
    public String accountActivation(long cardID, String oldPassword, String newPassword) {
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc == null) {
            return "�����п�������";
        }
        if (!bc.getPassword().equals(oldPassword)) {
            return "�˻�����ʧ�ܣ���ʼ�������";
        }
        int state = bc.getState();
        if (state == 1) {
            return "�����п��Ѿ�����";
        } else if (state == 2) {//�����ʧ��
            bc.setState(1);
            String updateResult = dao.update(bc);
            if ("���³ɹ�".equals(updateResult)) {
                return "�ʺŽ����ʧ�ɹ����������������������Ч";
            }
        } else if (state == 3) {//�����ʧ��
            bc.setPassword(newPassword);
            bc.setState(1);
            String updateResult = dao.update(bc);
            if ("���³ɹ�".equals(updateResult)) {
                return "�ʺŽ����ʧ�ɹ����ʺż���ɹ�";
            }
        } else {
            bc.setPassword(newPassword);
            bc.setState(1);
            String update = dao.update(bc);
            if ("���³ɹ�".equals(update)) {
                return "�ʺż���ɹ�";
            }
        }
        return "�˻�����ʧ��";
    }

    @Override
    public String accountLogin(long cardID, String password) {
        BankCard bc = (BankCard) this.dao.find(cardID);
        String password1 = ((BankCard) this.dao.find(cardID)).getPassword();
        if (bc != null) {
            if (password1.equals(password) == false) {
                return "���п��������";
            }
            int state = bc.getState();
            if (state == 1) {
                bc.setID(cardID);//�԰����ô��ݵ��β�userset
                return "�˻���¼�ɹ�";
            }
            if (state == 0) {
                return "�����п���δ������ȼ������п�";
            }
            if (state == 2 || state == 3) {
                return "�����п��Ѿ���ʧ�����ܵ�¼";
            }
        }
        return "�����п�������";
    }

    @Override
    public String accountReport(long cardID) {
        IDao dao = new BankCardDaoImpl();//�ò�������dao�㣬Ϊ����ĳ�Ա����
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc != null) {
            int state = bc.getState();
            if (state == 0) {
                return "�����п���δ������ȼ���";
            } else if (state == 2 || state == 3) {
                return "�����п����Ѿ���ʧ�������ٴι�ʧ";
            } else {
                if (state == 0) {
                    bc.setState(3);
                } else if (state == 1) {
                    bc.setState(2);
                }
                if ("���³ɹ�".equals(dao.update(bc))) {
                    return "��ʧ�ɹ�";
                }
            }
        }
        return cardID + "���п������ڣ����п���ʧʧ��";
    }

    @Override
    public double accountMoney(long cardID) {
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc != null) {
            return bc.getMoney();
        }
        return -1;
    }

    /**
     * �������������Ҫ10�룬���۳ɹ�ʧ��
     *
     * @param cardID
     * @param money  �����
     * @return
     */
    @Override
    public String saveMoney(long cardID, double money, String note) {
        while (didi(cardID)) {
            System.out.println("�¼���" + cardID + "��\t���¼����ڵȴ���...");
        }
        bcs.addElement(cardID);
//        System.out.println(Thread.currentThread().getName()+"okko");
//        Map<Thread, StackTraceElement[]> maps = Thread.getAllStackTraces();
//        Set<Thread> threads = maps.keySet();
//        Iterator<Thread> iterator = threads.iterator();
//        while (iterator.hasNext()){
//            Thread next = iterator.next();
//            if(next.isAlive()){
//                next.wait();
//            }
//        }
        System.out.println("�¼���" + cardID + "��\t���¼����ڽ�����...");
        try {
            Thread.sleep(5000);//10s
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc != null) {
            bc.setMoney(bc.getMoney() + money);
            String update = dao.update(bc);
            if ("���³ɹ�".equals(update)) {
                IDao dao1 = new TRDaoImpl();
                String insert = dao1.insert(new TR(getTime(), -1, money, cardID, note));
                if ("����ɹ�".equals(insert)) {
                    bcs.remove(cardID);
                    System.out.println("�¼���" + cardID + "��\t���¼�����ɣ�");
                    return "���ɹ�";
                }
            }
        }
        bcs.remove(cardID);
        System.out.println("�¼���" + cardID + "��\t���¼�����ɣ�");
        return "���ʧ��";
    }

    @Override
    public String takeMoney(long cardID, double money, String note) {
        while (didi(cardID)) {
            System.out.println("�¼���" + cardID + "ȡ�\t���¼����ڵȴ���...");
        }
        bcs.addElement(cardID);
        System.out.println("�¼���" + cardID + "ȡ�\t���¼����ڽ�����...");
        try {
            Thread.sleep(5000);//10s
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc != null) {
            if (bc.getMoney() < money) {
                try {
                    Thread.sleep(5000);//10s
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                bcs.remove(cardID);
                System.out.println("�¼���" + cardID + "ȡ�\t���¼�����ɣ�");
                return "ȡ��ʧ�ܣ�����";
            }
            bc.setMoney(bc.getMoney() - money);
            String update = dao.update(bc);
            if ("���³ɹ�".equals(update)) {
                IDao dao1 = new TRDaoImpl();
                String insert = dao1.insert(new TR(getTime(), -1, money, cardID, note));
                if ("����ɹ�".equals(insert)) {
                    bcs.remove(cardID);
                    System.out.println("�¼���" + cardID + "ȡ�\t���¼�����ɣ�");
                    return "ȡ��ɹ�";
                }
            }
        }
        bcs.remove(cardID);
        System.out.println("�¼���" + cardID + "ȡ�\t���¼�����ɣ�");
        return "ȡ��ʧ��";
    }

    @Override
    public String transferAccount(long SourceID, double money, long destinationID) {
        BankCard bc = (BankCard) dao.find(SourceID);
        while (didi(SourceID) || didi(destinationID)) {
            try {
                System.out.println("�¼���" + SourceID + "������ת�ˡ����¼����ڵȴ���...");
                Thread.sleep(5000);//10s
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        bcs.addElement(SourceID);
        bcs.addElement(destinationID);
//        bc=(BankCard) dao.find(destinationID);

        System.out.println("�¼���" + SourceID + "������ת�ˡ����¼����ڽ�����...");
        if (bc != null) {
            if (bc.getMoney() < money) {
                try {
                    Thread.sleep(5000);//10s
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                bcs.remove(SourceID);
                bcs.remove(destinationID);
                System.out.println("�¼���" + SourceID + "������ת�ˡ����¼������...");
                return "ת��ʧ�ܣ�Դ�˻�����";
            }
            bc.setMoney(bc.getMoney() - money);
            String update = dao.update(bc);
            bc = (BankCard) dao.find(destinationID);
            bc.setMoney(bc.getMoney() + money);
            update = dao.update(bc);
            if ("���³ɹ�".equals(update)) {
                IDao dao1 = new TRDaoImpl();
                String insert = dao1.insert(new TR(getTime(), SourceID, money, destinationID, null));
                if ("����ɹ�".equals(insert)) {
                    try {
                        Thread.sleep(5000);//10s
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    bcs.remove(SourceID);
                    bcs.remove(destinationID);
                    System.out.println("�¼���" + SourceID + "������ת�ˡ����¼������...");
                    return "ת�˳ɹ�";
                }
            }
        }
        try {
            Thread.sleep(5000);//10s
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        bcs.remove(SourceID);
        bcs.remove(destinationID);

        System.out.println("�¼���" + SourceID + "������ת�ˡ����¼������...");
        return "ת��ʧ�ܣ�Ŀ���˻�������";
    }

    @Override
    public String changePassword(long cardID, String newPassword) {
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc != null) {
            bc.setPassword(newPassword);
            String update = dao.update(bc);
            if ("���³ɹ�".equals(update)) {
                return "��������ɹ�";
            }
        }
        return "�޸�����ʧ��";
    }

    @Override
    public String deleteAccount(long cardID) {
        String delete = dao.delete(cardID);
        if ("ɾ���ɹ�".equals(delete)) {
            return "�����ɹ�";
        }
        return "����ʧ��";
    }

    @Override
    public BankCard getBankCard(long cardID) {
        IDao dao = new BankCardDaoImpl();
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc != null) {
            return bc;
        }
        return null;
    }

    /**
     * ok
     *
     * @param uID �û�id
     * @return
     */
    @Override
    public List<BankCard> getAllBankCards(long uID) {
        List<BankCard> result = new ArrayList<>();
        IDaoNew dao = new BankCardDaoImpl();
        List BankCards = dao.getObjectsByMUL(uID);
        if (BankCards.size() != 0) {
            //friends.stream().forEach(System.out::println);
            for (Object obj : BankCards) {
                BankCard bc = (BankCard) obj;
                result.add(bc);
            }
        }
        return result;
    }

    /**
     * �˻�cardID�Ƿ����ڽ��в���
     *
     * @param cardID �˺�
     * @return
     */
    private boolean didi(long cardID) {
        for (int i = 0; i < bcs.size(); i++) {
            if (bcs.elementAt(i) == cardID) {
                return true;
            }
        }
        return false;
    }
}