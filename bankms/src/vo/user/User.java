package vo.user;

/**
 * �û���ʹ��bankms���ˣ�
 * <p>
 * �û�Ⱥ��ʹ��bankms���ˣ�����ͨ�û���VIP������Ա�������3�����ࣩ
 * <p>
 * �ͻ������������п����ˣ��ͻ����ܲ�ʹ��bankms
 * <p>
 * 1���˿ɰ���������п�
 * <p>
 * 1���û� - 1���˻�
 * <p>
 * <p>
 * <p>
 * <p>
 * ���ѹ�ϵ������ͼ��ģʽ
 */
public abstract class User {


    /**
     * �û�id Ψһ��ʶ
     */
    private long uID;
    /**
     * �ǳƣ��û��������ǳƲ����ظ���
     * Ψһ��ʶһ���û�
     */
    private String nickname;
    /**
     * ����
     * �Ե�¼bankms
     */
    private String password;
    /**
     * ���֤��
     * ����Ψһ��ʶһ���û�
     */
    private long ID;
    /**
     * ��ʵ����
     */
    private String name;
    /**
     * �Ա�
     */
    private String sex;
    /**
     * �ֻ���
     */
    private String telephone;
    /**
     * ����
     */
    private String email;

    /**
     * ����->����age
     */
    private String birthday;

    /**
     * qq��
     */
    private String qq;

    /**
     * סַ
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
