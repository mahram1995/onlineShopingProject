<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String catagory=request.getParameter("catagory");
String price=request.getParameter("price");
String active=request.getParameter("active");

try{
	Connection con= ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeLargeUpdate("update product set name='"+name+"', catagory='"+catagory+"', price='"+price+"', active='"+active+"' where id='"+id+"'");
	
	if(active.equals("No")){
		st.executeLargeUpdate("delete from cart where product_id='"+id+"' and address is NULL" );
		
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	
}
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>