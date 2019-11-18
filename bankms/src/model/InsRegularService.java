package model;


import vo.insProduct.InsRegular;

import java.util.List;

public interface InsRegularService {

    /**
     * 得到所有期交保险产品 ok
     *
     * @return
     */
    List<InsRegular> getAllInsRegularProduct();
}
