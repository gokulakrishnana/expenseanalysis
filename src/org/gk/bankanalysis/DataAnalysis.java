package org.gk.bankanalysis;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gk.classes.DBconnections;


@WebServlet({ "/DataAnalysis", "/dataanalysis" })
public class DataAnalysis extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String StDate = null;
	private String EndDate = null;
	private boolean connection; 
	DBconnections dbactions = new DBconnections();
	HashMap<String, Double> db_IncomeExpense = new HashMap<String, Double>();
	ArrayList<String> db_IncomeByCatg = new ArrayList<String>();
	ArrayList<String> db_ExpenseByCatg = new ArrayList<String>();
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StDate= request.getParameter("anstdate");
		EndDate= request.getParameter("anenddate");
		String DateRange = StDate + ";" + EndDate;
		// Call methods to get analysis values.
		getconnection();
		gettotalincomeexpense();
		getincomeexpensebycatg();		
		try {
			dbactions.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//Set values to session attributes
		request.getSession().setAttribute("DateRange", DateRange);
		request.getSession().setAttribute("IncomeExpense", db_IncomeExpense);
		request.getSession().setAttribute("IncomeByCatg", db_IncomeByCatg);
		request.getSession().setAttribute("ExpenseByCatg", db_ExpenseByCatg);		

		//Request Dispatcher	
		RequestDispatcher dispatch = request.getRequestDispatcher("Analysis.jsp");
		dispatch.forward(request, response);
	}

	public void getconnection(){
		try {
			connection = dbactions.getConnections();
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Error while trying to get DB connection from DataAnalysis");
			e.printStackTrace();
		}

	}

	public void gettotalincomeexpense(){
		try {
			db_IncomeExpense = dbactions.getTotalIncomeExpense(StDate, EndDate);
		} catch (SQLException e) {
			System.out.println("Error while trying to get Total Income Expense from DataAnalysis");
			e.printStackTrace();
		}
	}
	
	public void getincomeexpensebycatg(){
		try {
			db_IncomeByCatg = dbactions.getTotalIncomeByCatg(StDate, EndDate);
		} catch (SQLException e) {
			System.out.println("Error while trying to get Income by Category from DataAnalysis");
			e.printStackTrace();
		}
		
		try {
			db_ExpenseByCatg=dbactions.getTotalExpenseByCatg(StDate, EndDate);
		} catch (SQLException e) {
			System.out.println("Error while trying to get Expense by Category from DataAnalysis");
			e.printStackTrace();
		}
		
	}
}

