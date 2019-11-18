package vo.user;

/**
 * 用户（使用bankms的人）
 * <p>
 * 用户群（使用bankms的人）：普通用户、VIP、管理员（该类的3个子类）
 * <p>
 * 客户：办理了银行卡的人，客户可能不使用bankms
 * <p>
 * 1个人可办理多张银行卡
 * <p>
 * 1个用户 - 1个账户
 * <p>
 * <p>
 * <p>
 * <p>
 * 好友关系是无向图的模式
 */
public abstract class User {


    /**
     * 用户id 唯一标识
     */
    private long uID;
    /**
     * 昵称（用户名）（昵称不能重复）
     * 唯一标识一个用户
     */
    private String nickname;
    /**
     * 密码
     * 以登录bankms
     */
    private String password;
    /**
     * 身份证号
     * 可以唯一标识一个用户
     */
    private long ID;
    /**
     * 真实姓名
     */
    private String name;
    /**
     * 性别
     */
    private String sex;
    /**
     * 手机号
     */
    private String telephone;
    /**
     * 邮箱
     */
    private String email;

    /**
     * 生日->年龄age
     */
    private String birthday;

    /**
     * qq号
     */
    private String qq;

    /**
     * 住址
     */
    private String address;

    public long getuID() {
        return uID;
    }

    public void setuID(long uID) {
        this.uID = uID;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "uID=" + uID +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                ", ID=" + ID +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", birthday='" + birthday + '\'' +
                ", qq='" + qq + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
