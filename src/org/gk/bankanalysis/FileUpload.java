package org.gk.bankanalysis;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
//import org.apache.jasper.compiler.Node.ForwardAction;








import org.gk.classes.DBconnections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/FileUpload", "/fileupload" })
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private File file ;
	private String filePath = "D:\\";
	boolean isMultipart = false;
	boolean connection = false;
	String tempFileName= "bankanalysisupload.csv";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean connection = false;
		List read_line = new ArrayList<String>();
		
		//Call to save file
		boolean return_msg = saveFile(request,response);
		//call to build output
		read_line = readfile(request);
		//Call to insert into DB	
		uploadoption(read_line);

		request.getSession().setAttribute("filelines", read_line);
		RequestDispatcher distpatch = request.getRequestDispatcher("Fileupload.jsp");
		System.out.println(read_line.get(3));
		distpatch.forward(request, response);
		}

	public boolean saveFile(HttpServletRequest request, HttpServletResponse response){
		isMultipart = ServletFileUpload.isMultipartContent(request);
		boolean return_msg = false;

		if (isMultipart == true){
			ServletContext servletContext = this.getServletConfig().getServletContext();
			DiskFileItemFactory factory = new DiskFileItemFactory();
			filePath =  servletContext.getInitParameter("file-upload");
			System.out.println(filePath);
			File repository = (File) servletContext.getAttribute("C:\\");
			factory.setRepository(repository);
			ServletFileUpload upload = new ServletFileUpload(factory);

			List<FileItem> items = null;
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}

			Iterator<FileItem> i = items.iterator();

			while (i.hasNext()) {
				FileItem fi = (FileItem)i.next();
				if ( !fi.isFormField() )	
				{
					String contentType = fi.getContentType();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					
/*					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					System.out.println("Filed name : "+ fieldName + "  file name is : " + fileName);
					if( fileName.lastIndexOf("\\") >= 0 ){
						file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
					}else{
						file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
					}*/
					
					file = new File( filePath + tempFileName) ;
					try {
						fi.write( file ) ;
						return_msg = true;
					} catch (Exception e) {
						return_msg = false;
						e.printStackTrace();
					} 
					//System.out.println("Uploaded Filename: " + filePath +tempFileName);
				}else{
					String fieldName = fi.getFieldName();
					//System.out.print("Thank You for: " + fi.getString());
				}

			}
		}
		else{
			System.out.println("False");
		}
		return return_msg;
	}	

	@SuppressWarnings("unchecked")
	public List readfile(HttpServletRequest request) throws IOException{
		String fullfilename = filePath +  tempFileName;
		String crdrFlag =null;
		System.out.println("fullfilename is : " + fullfilename);
		BufferedReader myInput = null;
	    String thisLine = null; 
	    @SuppressWarnings("rawtypes")
		List read_line = new ArrayList<String>();	   
	    myInput = new BufferedReader(new FileReader(fullfilename));	    
	    if (myInput.readLine() != null) { 
	    while((thisLine = myInput.readLine()) != null) {
	    	
	    	String [] whole_Line =  thisLine.split(",");
	    	
	    	if (whole_Line[0].contains("/")){
	    		//value date
	    		String [] temp_string1 = whole_Line[0].split("/");	
	    		whole_Line[0] = temp_string1[2] + "-"+ temp_string1[1] + "-" +temp_string1[0];
	    		//transaction date
	    		String [] temp_string2 = whole_Line[1].split("/");	
	    		whole_Line[1] = temp_string2[2] + "-"+ temp_string2[1] + "-" +temp_string2[0];
	    	}else if (whole_Line[0].contains("-")){
	    		//value date
	    		String [] temp_string1 = whole_Line[0].split("-");	
	    		whole_Line[0] = temp_string1[2] + "-"+ temp_string1[1] + "-" +temp_string1[0];
	    		//transaction date
	    		String [] temp_string2 = whole_Line[1].split("-");	
	    		whole_Line[1] = temp_string2[2] + "-"+ temp_string2[1] + "-" +temp_string2[0];
	    	}else{
	    		whole_Line[0] = whole_Line[0];
	    		whole_Line[1] = whole_Line[1];
	    	}
	    	
	    	if (whole_Line[3].trim().equals("-")){
	    		whole_Line[3] =whole_Line[4].trim();
	    		//Credit
	    		crdrFlag = "CR";
	    	}else{
	    		whole_Line[3] = whole_Line[3].trim();
	    		//Debit
	    		crdrFlag = "DB";
	    	}
	    	thisLine = whole_Line[0]+ "," + whole_Line[1] + "," + whole_Line[2] + "," + crdrFlag  + ","  + whole_Line[3]
	    			+ "," + whole_Line[5];
	    	read_line.add(thisLine);
	    	System.out.println(thisLine);
	    }
	    }
	    myInput.close();
	    return read_line;
	}
	public void uploadoption(java.util.List read_line){
		DBconnections dbactions = new DBconnections();
		connection = false;
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
				dbactions.insertAll(read_line);
			} catch (SQLException e) {
				System.out.println("SQL error from DBconnections.insertAll");
				e.printStackTrace();
			}
			
			try {
				dbactions.closeConnection();
			} catch (SQLException e) {
				System.out.println("SQL error from DBconnections.closeConnection");
				e.printStackTrace();
			}
			
		}
	}

}