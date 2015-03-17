package org.gk.classes;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class DBconnections {

	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost/bankanalysis";
	private String User = "root";
	private String Password = "";
	java.sql.Connection conn = null;

	public boolean getConnections() throws SQLException, ClassNotFoundException{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,User,Password);
		System.out.println("Connection1");
		return true;
	}

	public void insertAll(java.util.List read_line) throws SQLException {

		String queryInsert = null ;
		java.sql.PreparedStatement prpstmInsert= null  ;

		queryInsert = "INSERT INTO transactiondetails(VALUE_DT, TRAN_DT, REMARK, TYPE, AMT, BALANCE,CATEGORY) VALUES (?,?,?,?,?,?,?)";
		prpstmInsert = conn.prepareStatement(queryInsert,Statement.RETURN_GENERATED_KEYS);
		int i = 0; 
		for (i=0; i <read_line.size(); i++){
			String temp_string = (String) read_line.get(i);
			String [] split_string = temp_string.split(",");
			prpstmInsert.setString(1,split_string[0]);
			prpstmInsert.setString(2,split_string[1]);
			prpstmInsert.setString(3,split_string[2]);
			prpstmInsert.setString(4,split_string[3]);
			prpstmInsert.setDouble(5, Double.parseDouble(split_string[4]));
			prpstmInsert.setDouble(6, Double.parseDouble(split_string[5]));
			prpstmInsert.setString(7,"MISC");
			prpstmInsert.executeUpdate();
		}    	
	}

	public ArrayList<String> editOption(String date1, String date2) throws SQLException{
		ArrayList<String> selectlist =  new ArrayList<String>();
		String querySelect = null ;
		java.sql.PreparedStatement prpstmSelect= null  ;

		querySelect = "SELECT TRAN_KEY, VALUE_DT, TRAN_DT, REMARK, TYPE, AMT, BALANCE,CATEGORY "
				+ "from transactiondetails WHERE TRAN_DT >= ? AND TRAN_DT <=?";
		prpstmSelect = conn.prepareStatement(querySelect);
		prpstmSelect.setString(1, date1);
		prpstmSelect.setString(2, date2);

		ResultSet rs = (ResultSet) prpstmSelect.executeQuery();

		while(rs.next()){
			selectlist.add(rs.getInt(1)+"," +rs.getString(2)+"," +rs.getString(3)+"," +rs.getString(4)+"," +rs.getString(5)+"," +rs.getString(6) +"," +rs.getString(8));
		}
		
		return selectlist;
	}

	public ArrayList<String> getCategory() throws SQLException{
		ArrayList<String> categorylist =  new ArrayList<String>();
		String queryCatgSelect = null ;
		java.sql.PreparedStatement prpstmCatgSelect= null  ;

		queryCatgSelect = "SELECT CATEGORY "
				+ "from category";
		prpstmCatgSelect = conn.prepareStatement(queryCatgSelect);

		ResultSet rs = (ResultSet) prpstmCatgSelect.executeQuery();

		while(rs.next()){
			categorylist.add(rs.getString(1));
		}
		
		return categorylist;
	}
	public void closeConnection() throws SQLException {
		conn.close();
	}
	
	public HashMap<String, Double> getTotalIncomeExpense(String stDate, String endDate) throws SQLException{
		HashMap<String, Double> db_IncomeExpense = new HashMap<String, Double>();
		String IncomeExpense = "select sum(AMT),TYPE from transactiondetails "
				+ " where TRAN_DT between ? AND ? "
				+ "group by TYPE";
		java.sql.PreparedStatement prpstmIncomeExpense = conn.prepareStatement(IncomeExpense);
		
		prpstmIncomeExpense.setString(1,stDate);
		prpstmIncomeExpense.setString(2, endDate);
		ResultSet rs = (ResultSet) prpstmIncomeExpense.executeQuery();
				
		while(rs.next()){
			db_IncomeExpense.put(rs.getString(2), rs.getDouble(1));			
		}
		return db_IncomeExpense;
	}
	
	public ArrayList<String> getTotalIncomeByCatg(String stDate, String endDate) throws SQLException{
		ArrayList<String> IncomeByCatg =  new ArrayList<String>();
		String queryIncomeByCatg = "select sum(AMT),CATEGORY from transactiondetails "
				+ " where TRAN_DT between ? AND ?  and TYPE= \"CR\" "
				+ "group by CATEGORY";
		java.sql.PreparedStatement prpstmIncomeByCatg = conn.prepareStatement(queryIncomeByCatg);
		
		prpstmIncomeByCatg.setString(1,stDate);
		prpstmIncomeByCatg.setString(2, endDate);
		ResultSet rs = (ResultSet) prpstmIncomeByCatg.executeQuery();
				
		while(rs.next()){
			System.out.println(rs.getString(2)+"::::" + rs.getDouble(1));
			((java.util.List) IncomeByCatg).add(rs.getString(2)+ "," +rs.getDouble(1));			
		}
		return IncomeByCatg;
	}	

	public ArrayList<String> getTotalExpenseByCatg(String stDate, String endDate) throws SQLException{
		 ArrayList<String> ExpenseByCatg = new  ArrayList<String> ();
		String queryExpenseByCatg = "select sum(AMT),CATEGORY from transactiondetails "
				+ " where TRAN_DT between ? AND ?  and TYPE= \"DB\" "
				+ "group by CATEGORY";
		java.sql.PreparedStatement prpstmExpenseByCatg = conn.prepareStatement(queryExpenseByCatg);
		
		prpstmExpenseByCatg.setString(1,stDate);
		prpstmExpenseByCatg.setString(2, endDate);
		ResultSet rs = (ResultSet) prpstmExpenseByCatg.executeQuery();
				
		while(rs.next()){
			System.out.println("Expense  : " + rs.getString(2)+"::::" + rs.getDouble(1));
			ExpenseByCatg.add(rs.getString(2)+ "," +rs.getDouble(1));			
		}
		return ExpenseByCatg;
	}

	public int delrecords(java.util.List<String> temp_List) throws SQLException{
		int rowsaffected = 0;
		String queryDelRecords = "delete FROM transactiondetails "
				+ " where TRAN_KEY = ?";
		java.sql.PreparedStatement prpstmDelRecords = conn.prepareStatement(queryDelRecords);
		for (int i=0 ; i < temp_List.size();i++){
			int temp_key = Integer.parseInt(temp_List.get(i).trim());
			System.out.println("temp_key   is :  " +  temp_key);
			prpstmDelRecords.setInt(1,temp_key );	
			int rows = prpstmDelRecords.executeUpdate();
			rowsaffected = rowsaffected + rows;
		}
		
		return rowsaffected;
		
	}
	public int UpdateRecords (double ItemKey,String Category) throws SQLException{
		int rowsupdated = 0;	
		String queryUpdateRecords = "update transactiondetails "
				+ " set CATEGORY = ?"
				+ " where TRAN_KEY = ?";
		java.sql.PreparedStatement prpstmUpdateRecords = conn.prepareStatement(queryUpdateRecords);
		prpstmUpdateRecords.setString(1, Category);
		prpstmUpdateRecords.setDouble(2, ItemKey);
		rowsupdated = prpstmUpdateRecords.executeUpdate();
		
		return rowsupdated;
	}
	
	public void rollbackall () throws SQLException{
		conn.rollback();

	}	
}

