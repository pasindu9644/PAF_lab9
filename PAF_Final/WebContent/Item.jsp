<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Item"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="View/bootstrap.min.css">
<script src="Component/jquery-3.2.1.min.js"></script>
<script src="Component/Item.js"></script>
</head>

<body>
	<%
	//Save---------------------------------
	if (request.getParameter("itemCode") != null) {
		Item itemObj = new Item();
		String stsMsg = "";
		System.out.println("insert");
		//Insert--------------------------
		if (request.getParameter("hidItemIDSave") == "") {
			stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
				request.getParameter("itemName"),
				request.getParameter("itemPrice"),
				request.getParameter("itemDesc"));
		}
		else//Update----------------------
		 { 
		 stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"), request.getParameter("itemCode"), request.getParameter("itemName"), request.getParameter("itemPrice"), request.getParameter("itemDesc"));
		 }
		
		session.setAttribute("statusMsg", stsMsg);
	}
	//Delete-----------------------------
	if (request.getParameter("hidItemIDDelete") != null) 
	{ 
		System.out.println("delete");
	 Item itemObj = new Item(); 
	 String stsMsg = itemObj.deleteItem(request.getParameter("hidItemIDDelete")); 
	 session.setAttribute("statusMsg", stsMsg); 
	}
	%>

	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Items Management</h1>
				<form id="formItem" name="formItem" method="post" action="Item.jsp">

					Item code: <input id="itemCode" name="itemCode" type="text"
						class="form-control"><br> 
					
					Item name: <input
						id="itemName" name="itemName" type="text" class="form-control"><br>
					
					Item price: <input id="itemPrice" name="itemPrice" type="text"
						class="form-control"><br> 
						
					Item description: <input id="itemDesc" name="itemDesc" type="text" 
						class="form-control"><br>
						
					<input id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> 

					<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
					
					<div class="alert alert-success" id="alertSuccess">
						<%
						out.print(session.getAttribute("statusMsg"));
						%>
					</div>
				</form>
				<br>
				<%
					Item itemObj = new Item();
					out.print(itemObj.readItems());
					%>

			</div>
		</div>
	</div>

</body>
</html>