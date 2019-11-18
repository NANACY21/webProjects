package model;
import vo.Relation;
import vo.user.NUser;

import java.util.List;

public interface RelationService {

    String addFriend(Relation r);

    String deleteFriends(long myUID, long[] uIDs);

    /**
     * @param uID �û�ID
     * @return �г����û��ĺ���
     */
    List<NUser> listAllFriends(long uID);
}