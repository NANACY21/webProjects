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
 * 存款 转账一般可同时进行，
 * 若存款id 转账目标id相同，则2者不能同时进行，
 * 即同一个账户存取款不能同时进行；同一个账户也不能同时存款；同一个账户也不能同时取款
 * <p>
 * 存/取/转账防止脏读：同步锁 但其实不应该用同步锁，数据库就可以实现
 * 分布式系统同步锁无效，解决办法：事务、分布式锁
 * ATM机马上吐钱时发微信红包，解决办法：分布式锁
 * <p>
 * <p>
 * 同步锁：同一时刻两件事不能同时执行
 */
public class BankCardServiceImpl implements BankCardService {

    /**
     * 当前该服务器里正在进行操作的所有账户
     * <p>
     * 创建多个本类对象，bcs的内存地址就一个
     */
    private static Vector<Long> bcs = null;
    private BankCardDaoImpl dao;//该层依赖于dao层，为该类的成员变量

    public BankCardServiceImpl() {
        if (bcs == null) {
            bcs = new Vector<>();
        } else {

        }
        this.dao = new BankCardDaoImpl();

    }

    /**
     * 办理一张普通银行卡
     *
     * @param userID 要办卡的人的身份证号
     * @param name   要办卡的人的真实姓名
     * @return 银行卡号、初始银行卡密码
     */
    @Override
    public String addBankCard(long userID, String name) {
        NUserServiceImpl service = new NUserServiceImpl();
        NUser nuser = service.getNUserByID(userID);
        if (nuser == null) {//用户表里是否有该身份证号//用户表没有此人->没注册
            return "办卡失败！您尚未注册用户，需要先用户注册";
        }
        BankCard bc = new BankCard(nuser.getuID());
        bc.setMoney(0);
        String userid = userID + "";
        String substring = userid.substring(userid.length() - 6, userid.length());
        bc.setPassword(substring);//设置初始密码
        String add = dao.insert(bc);
        if ("插入成功".equals(add)) {
            IDaoNew daoNew = new BankCardDaoImpl();
            BankCard last = (BankCard) daoNew.findLast();
            if (last != null) {
                return "办卡成功！银行卡号：" + last.getID() + "初始密码：" + last.getPassword() + "您可以更改新密码";
            }
        }
        return "办卡失败！";
    }


    @Override
    public String accountActivation(long cardID, String oldPassword, String newPassword) {
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc == null) {
            return "该银行卡不存在";
        }
        if (!bc.getPassword().equals(oldPassword)) {
            return "账户激活失败！初始密码错误";
        }
        int state = bc.getState();
        if (state == 1) {
            return "该银行卡已经激活";
        } else if (state == 2) {//激活挂失的
            bc.setState(1);
            String updateResult = dao.update(bc);
            if ("更新成功".equals(updateResult)) {
                return "帐号解除挂失成功！你输入的姓名和密码无效";
            }
        } else if (state == 3) {//激活挂失的
            bc.setPassword(newPassword);
            bc.setState(1);
            String updateResult = dao.update(bc);
            if ("更新成功".equals(updateResult)) {
                return "帐号解除挂失成功！帐号激活成功";
            }
        } else {
            bc.setPassword(newPassword);
            bc.setState(1);
            String update = dao.update(bc);
            if ("更新成功".equals(update)) {
                return "帐号激活成功";
            }
        }
        return "账户激活失败";
    }

    @Override
    public String accountLogin(long cardID, String password) {
        BankCard bc = (BankCard) this.dao.find(cardID);
        String password1 = ((BankCard) this.dao.find(cardID)).getPassword();
        if (bc != null) {
            if (password1.equals(password) == false) {
                return "银行卡密码错误";
            }
            int state = bc.getState();
            if (state == 1) {
                bc.setID(cardID);//对按引用传递的形参userset
                return "账户登录成功";
            }
            if (state == 0) {
                return "该银行卡尚未激活，请先激活银行卡";
            }
            if (state == 2 || state == 3) {
                return "该银行卡已经挂失，不能登录";
            }
        }
        return "该银行卡不存在";
    }

    @Override
    public String accountReport(long cardID) {
        IDao dao = new BankCardDaoImpl();//该层依赖于dao层，为该类的成员变量
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc != null) {
            int state = bc.getState();
            if (state == 0) {
                return "该银行卡尚未激活，请先激活";
            } else if (state == 2 || state == 3) {
                return "该银行卡号已经挂失，不可再次挂失";
            } else {
                if (state == 0) {
                    bc.setState(3);
                } else if (state == 1) {
                    bc.setState(2);
                }
                if ("更新成功".equals(dao.update(bc))) {
                    return "挂失成功";
                }
            }
        }
        return cardID + "银行卡不存在，银行卡挂失失败";
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
     * 存款整个过程需要10秒，无论成功失败
     *
     * @param cardID
     * @param money  存款金额
     * @return
     */
    @Override
    public String saveMoney(long cardID, double money, String note) {
        while (didi(cardID)) {
            System.out.println("事件：" + cardID + "存款。\t该事件正在等待中...");
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
        System.out.println("事件：" + cardID + "存款。\t该事件正在进行中...");
        try {
            Thread.sleep(5000);//10s
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc != null) {
            bc.setMoney(bc.getMoney() + money);
            String update = dao.update(bc);
            if ("更新成功".equals(update)) {
                IDao dao1 = new TRDaoImpl();
                String insert = dao1.insert(new TR(getTime(), -1, money, cardID, note));
                if ("插入成功".equals(insert)) {
                    bcs.remove(cardID);
                    System.out.println("事件：" + cardID + "存款。\t该事件已完成！");
                    return "存款成功";
                }
            }
        }
        bcs.remove(cardID);
        System.out.println("事件：" + cardID + "存款。\t该事件已完成！");
        return "存款失败";
    }

    @Override
    public String takeMoney(long cardID, double money, String note) {
        while (didi(cardID)) {
            System.out.println("事件：" + cardID + "取款。\t该事件正在等待中...");
        }
        bcs.addElement(cardID);
        System.out.println("事件：" + cardID + "取款。\t该事件正在进行中...");
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
                System.out.println("事件：" + cardID + "取款。\t该事件已完成！");
                return "取款失败，余额不足";
            }
            bc.setMoney(bc.getMoney() - money);
            String update = dao.update(bc);
            if ("更新成功".equals(update)) {
                IDao dao1 = new TRDaoImpl();
                String insert = dao1.insert(new TR(getTime(), -1, money, cardID, note));
                if ("插入成功".equals(insert)) {
                    bcs.remove(cardID);
                    System.out.println("事件：" + cardID + "取款。\t该事件已完成！");
                    return "取款成功";
                }
            }
        }
        bcs.remove(cardID);
        System.out.println("事件：" + cardID + "取款。\t该事件已完成！");
        return "取款失败";
    }

    @Override
    public String transferAccount(long SourceID, double money, long destinationID) {
        BankCard bc = (BankCard) dao.find(SourceID);
        while (didi(SourceID) || didi(destinationID)) {
            try {
                System.out.println("事件：" + SourceID + "给别人转账。该事件正在等待中...");
                Thread.sleep(5000);//10s
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        bcs.addElement(SourceID);
        bcs.addElement(destinationID);
//        bc=(BankCard) dao.find(destinationID);

        System.out.println("事件：" + SourceID + "给别人转账。该事件正在进行中...");
        if (bc != null) {
            if (bc.getMoney() < money) {
                try {
                    Thread.sleep(5000);//10s
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                bcs.remove(SourceID);
                bcs.remove(destinationID);
                System.out.println("事件：" + SourceID + "给别人转账。该事件已完成...");
                return "转账失败，源账户余额不足";
            }
            bc.setMoney(bc.getMoney() - money);
            String update = dao.update(bc);
            bc = (BankCard) dao.find(destinationID);
            bc.setMoney(bc.getMoney() + money);
            update = dao.update(bc);
            if ("更新成功".equals(update)) {
                IDao dao1 = new TRDaoImpl();
                String insert = dao1.insert(new TR(getTime(), SourceID, money, destinationID, null));
                if ("插入成功".equals(insert)) {
                    try {
                        Thread.sleep(5000);//10s
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    bcs.remove(SourceID);
                    bcs.remove(destinationID);
                    System.out.println("事件：" + SourceID + "给别人转账。该事件已完成...");
                    return "转账成功";
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

        System.out.println("事件：" + SourceID + "给别人转账。该事件已完成...");
        return "转账失败！目标账户不存在";
    }

    @Override
    public String changePassword(long cardID, String newPassword) {
        BankCard bc = (BankCard) dao.find(cardID);
        if (bc != null) {
            bc.setPassword(newPassword);
            String update = dao.update(bc);
            if ("更新成功".equals(update)) {
                return "更改密码成功";
            }
        }
        return "修改密码失败";
    }

    @Override
    public String deleteAccount(long cardID) {
        String delete = dao.delete(cardID);
        if ("删除成功".equals(delete)) {
            return "销户成功";
        }
        return "销户失败";
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
     * @param uID 用户id
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
     * 账户cardID是否正在进行操作
     *
     * @param cardID 账号
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