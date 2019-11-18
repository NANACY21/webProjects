package model;
import vo.Relation;
import vo.user.NUser;

import java.util.List;

public interface RelationService {

    String addFriend(Relation r);

    String deleteFriends(long myUID, long[] uIDs);

    /**
     * @param uID 用户ID
     * @return 列出该用户的好友
     */
    List<NUser> listAllFriends(long uID);
}