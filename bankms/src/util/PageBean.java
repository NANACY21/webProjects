package util;

import java.util.List;

/**�������淶������
 * ��ҳ��ѯ�Ĺ�����
 * select limit ��ʼ����,Ԫ�����
 */
public class PageBean<T> {

    private int currentPage = 1;//��ǰ�ǵڼ�ҳ Ĭ���ǵ�һҳ
    private int pageSize = 5;//ÿҳ��ʾ��Ԫ�����
    private int totalCount;//��Ԫ����� ��Ҫ��ѯ��
    private int totalPages;//��ҳ�� ͨ��������
    private int start = 0;//Ĭ��Ϊ0 ÿ�β�ѯ����ʼλ�� ��ҳ��Ҫ���¼���
    private List<T> items;//���ڴ洢����

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages() {
        this.totalPages = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
    }

    public int getStart() {
        return start;
    }

    public void setStart() {
        //(��ǰ�ڼ�ҳ-1)*pageSize
        this.start = (currentPage - 1) * pageSize;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }
}
