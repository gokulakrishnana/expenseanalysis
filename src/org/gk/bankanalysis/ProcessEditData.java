package org.gk.bankanalysis;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gk.classes.DBconnections;

@WebServlet({ "/ProcessEditData", "/processeditdata" })
public class ProcessEditData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private boolean connection; 
	int rowsDeleted= 0;
	int rowsupdated = 0;
	DBconnections dbactions = new DBconnections();
	List<String> temp_List = new ArrayList<String>();
	HashMap<Integer, String> update_List = new HashMap<Integer, String>();

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		rowsDeleted= 0;
		rowsupdated = 0;
		String[] newvalues = request.getParameterValues("selcategory");
		String[] delvalues = request.getParameterValues("DeleteLines");
		try {
			dbactions.getConnections();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		//Update Logic
		System.out.println("Update Logic");
		for (String tempout : newvalues) {
			if (!tempout.isEmpty() && tempout.contains("!")) {
				int updatecnt = 0;
				String [] temp_string = tempout.split("!");
				double int_key= Double.parseDouble(temp_string[0].trim());
				try {
					updatecnt = dbactions.UpdateRecords(int_key,temp_string[1]);
				} catch ( SQLException e) {
					try {
						dbactions.rollbackall();
					} catch (SQLException e1) {
						System.out.println("Error While Rollback");
						e1.printStackTrace();
					}
					e.printStackTrace();
				}
				rowsupdated = rowsupdated + updatecnt;
			}
		}
		
		// Delete Logic 
		System.out.println("Delete Logic  : ");
		if (delvalues != null){
			for (int i = 0; i <(delvalues.length); i ++) {
				temp_List.add(delvalues[i].substring(6));
			}
			try {
				rowsDeleted = dbactions.delrecords(temp_List);
			} catch (SQLException e) {
				try {
					dbactions.rollbackall();
				} catch (SQLException e1) {
					System.out.println("Error While Rollback");
					e1.printStackTrace();
				}				
				e.printStackTrace();
			}
		}
		RequestDispatcher dispatch = request.getRequestDispatcher("EditResponse.jsp");
		request.getSession().setAttribute("UpdateCount", rowsupdated);
		request.getSession().setAttribute("DeleteCount", rowsDeleted);
		dispatch.forward(request, response);
	}

}
