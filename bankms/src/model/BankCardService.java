package model;

import vo.card.BankCard;
import java.util.List;

public interface BankCardService {

    /**
     * 办理一张普通银行卡（添加一张银行卡）（添加一个账户）
     *
     * @param userID 用户身份证号 必须是这个参数
     * @param name   真实姓名 必须是这个参数
     * @return
     */
    String addBankCard(long userID, String name);

    /**
     * 账户激活
     *
     * @param cardID      银行卡号 控制器传下来的数据
     * @param oldPassword 初始密码
     * @param newPassword 新密码
     * @return
     */
    String accountActivation(long cardID, String oldPassword, String newPassword);

    /**
     * 账户登录
     *
     * @param cardID   银行卡号 控制器传下来的数据
     * @param password 银行卡密码
     * @return 账户登录结果
     */
    String accountLogin(long cardID, String password);

    /**
     * 账户挂失
     *
     * @param cardID 要挂失的银行卡号
     * @return
     */
    String accountReport(long cardID);

    /**
     * 账户余额
     *
     * @param cardID 账号
     * @return
     */
    double accountMoney(long cardID);

    /**
     * 账户存款
     * 产生1条TR
     *
     * @param cardID
     * @param money  存款金额
     * @return
     */
    String saveMoney(long cardID, double money, String note);

    /**
     * 账户取款
     * 产生1条TR
     *
     * @param cardID
     * @param money  取款金额
     * @return
     */
    String takeMoney(long cardID, double money, String note);

    /**
     * 修改账户密码
     *
     * @param cardID
     * @param newPassword
     * @return
     */
    String changePassword(long cardID, String newPassword);

    /**
     * 删除这个账户（销户）
     *
     * @param cardID 银行卡号
     * @return
     */
    String deleteAccount(long cardID);

    /**
     * 账户向另一个账户转账
     * 产生1条TR
     *
     * @param SourceID
     * @param money
     * @param destinationID
     * @return 转账结果
     */
    String transferAccount(long SourceID, double money, long destinationID);

    /**
     * @param cardID 银行卡号
     * @return
     */
    BankCard getBankCard(long cardID);

    /**
     * @param uID 用户id
     * @return 得到用户的所有账户
     */
    List<BankCard> getAllBankCards(long uID);
}
