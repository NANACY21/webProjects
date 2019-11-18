package model.impl;


import dao.impl.AnalysisDao;
import vo.Analysis;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class AnalysisModel {

    //    public static void main(String[] args) {
//        AnalysisModel a= new AnalysisModel();
//        Analysis ans = a.getAnlysis(1000000000000024L);
//        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
//        System.out.println("*****************收入******************");
//        for(int i = currentYear;i>currentYear-10;i--){
//            if(ans.getIncomes().get(String.valueOf(i))==null){
//                continue;
//            }
//            System.out.print(i+" : ");
//            System.out.println(ans.getIncomes().get(String.valueOf(i)));
//        }
//        System.out.println("*****************支出******************");
//        for(int i = currentYear;i>currentYear-10;i--){
//            if(ans.getExpences().get(String.valueOf(i))==null){
//                continue;
//            }
//            System.out.print(i+" : ");
//            System.out.println(ans.getExpences().get(String.valueOf(i)));
//        }
//        System.out.println("*****************收入类别******************");
//        for(String i:ans.getIncomeLabel()){
//            if(ans.getTypeIncomes().get(i)==null){
//                continue;
//            }
//            System.out.print(i+" : ");
//            System.out.println(ans.getTypeIncomes().get(i));
//        }
//        System.out.println("*****************支出类别******************");
//        for(String i:ans.getExpenceLabel()){
//            if(ans.getTypeExpences().get(i)==null){
//                continue;
//            }
//            System.out.print(i+" : ");
//            System.out.println(ans.getTypeExpences().get(i));
//        }
//
//
//    }
    public Analysis getAnlysis(Long cardID) {
        Analysis ans = new Analysis();
        AnalysisDao analysisDao = new AnalysisDao();
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        String[] iL = {"工资", "理财", "礼金", "转账"};
        String[] eL = {"衣", "食", "住", "行", "医疗", "学习"};
        ans.setIncomeLabel(iL);
        ans.setExpenceLabel(eL);
        for (int i = currentYear; i > currentYear - 10; i--) {
            String command1 = "YEAR (time)= " + i + " and destinationID= " + cardID;
            if (analysisDao.getObjectsByMonth(command1).size() != 0) {
                ans.setIncomes(String.valueOf(i), analysisDao.getObjectsByMonth(command1));
            }

            String command2 = "YEAR (time)= " + i + " and SourceID= " + cardID;
            if (analysisDao.getObjectsByMonth(command2).size() != 0) {
                ans.setExpences(String.valueOf(i), analysisDao.getObjectsByMonth(command2));
            }
        }
        for (String note : ans.getIncomeLabel()) {
            Map<String, Map<String, Object>> In = new HashMap<>();
            for (int i = currentYear; i > currentYear - 10; i--) {
                String command1 = "YEAR (time)= " + i + " and destinationID= " + cardID + " and note='" + note + "'";
                if (analysisDao.getObjectsByMonth(command1).size() != 0) {
                    In.put(String.valueOf(i), analysisDao.getObjectsByMonth(command1));
                }
            }
            if (In.size() != 0) {
                ans.setTypeIncomes(note, In);
            }
        }
        for (String note : ans.getExpenceLabel()) {
            Map<String, Map<String, Object>> Ex = new HashMap<>();
            for (int i = currentYear; i > currentYear - 10; i--) {
                String command2 = "YEAR (time)= " + i + " and SourceID= " + cardID + " and note='" + note + "'";
                if (analysisDao.getObjectsByMonth(command2).size() != 0) {
                    Ex.put(String.valueOf(i), analysisDao.getObjectsByMonth(command2));
                }

            }
            if (Ex.size() != 0) {
                ans.setTypeExpences(note, Ex);
            }
        }

        return ans;
    }
}
