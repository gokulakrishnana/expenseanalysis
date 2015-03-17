package org.gk.bankanalysis;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.gk.classes.DBconnections;
@WebServlet("/Editdata")
public class Editdata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	// Variables.
	private String StDate,EndDate;
	private List read_line = new ArrayList<String>();
	private List catg_line = new ArrayList<String>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		System.out.println("Welcome");
		StDate= request.getParameter("stdate");
		EndDate= request.getParameter("enddate");
		//System.out.println("stdate  : " + StDate + " enddate  : " + EndDate);
		editOption();
		
		RequestDispatcher dispatch = request.getRequestDispatcher("Editdata.jsp");
		request.getSession().setAttribute("filelines", read_line);
		request.getSession().setAttribute("catglines", catg_line);
		dispatch.forward(request,response );
	}
	public void editOption(){
		DBconnections dbactions = new DBconnections();
		boolean connection = false;


		try {
			connection = dbactions.getConnections();
			if (connection == true){
				System.out.println("Connecction success DBconnections.getConnections");
			}else{
				System.out.println("Connecction failure DBconnections.getConnections");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("Class not found error from DBconnections.getConnections");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("SQL error from DBconnections.getConnections");
			e.printStackTrace();
		}
		
		if (connection == true){
			try {
				read_line = dbactions.editOption(StDate,EndDate);
				catg_line = dbactions.getCategory();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
}
