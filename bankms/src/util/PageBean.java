package util;

import java.util.List;

/**！！！规范！！！
 * 分页查询的工具类
 * select limit 起始索引,元组个数
 */
public class PageBean<T> {

    private int currentPage = 1;//当前是第几页 默认是第一页
    private int pageSize = 5;//每页显示的元组个数
    private int totalCount;//总元组个数 需要查询的
    private int totalPages;//总页数 通过计算获得
    private int start = 0;//默认为0 每次查询的起始位置 翻页需要重新计算
    private List<T> items;//用于存储数据

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
        //(当前第几页-1)*pageSize
        this.start = (currentPage - 1) * pageSize;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }
}
