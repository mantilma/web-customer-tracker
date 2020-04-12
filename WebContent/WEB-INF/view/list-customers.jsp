<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>

<head>
<title>List Customers</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

</head>

<body>

	<div class="container-fluid text-center p-3 my-3 bg-primary text-white">
		<div>
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	<br>

	<div class="container-fluid ">
		<div class="row">
			<!--  add a search box -->
			
			<form:form action="search" method="GET">
				Search customer: <input type="text" name="theSearchName" />

				<input type="submit" value="Search" class="add-button" />
			</form:form>
		</div>
		<br>
		<div class="row">

			<!--  add our html table here -->

			<table class="table table-hover table-bordered">
				<tr class="table-success">
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">
				
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>

					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						
						<td>
							<!-- display the update link -->
							<a href="${updateLink}">Update</a> 
							
<%-- 						<a href="${deleteLink}" --%>
<!-- 						onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a> -->
							
							<a href="#exampleModal${tempCustomer.id}" data-toggle="modal" data-target="#exampleModal${tempCustomer.id}">Delete</a>
							
							<div class="modal fade" id="exampleModal${tempCustomer.id}" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Eliminazione Customer</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">Vuoi eliminare il customer '${tempCustomer.firstName} ${tempCustomer.lastName}'</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Chiudi</button>
											<button type="button" class="btn btn-primary" onclick="window.location.href='${deleteLink}'; return false;">Elimina</button>
										</div>
									</div>
								</div>
							</div>

						</td>
					</tr>

				</c:forEach>

			</table>

		</div>

		<div class="row">

			<button type="button" class="btn btn-success"
				onclick="window.location.href='showFormForAdd'; return false;">Add
				Customer</button>

		</div>

	</div>

	<div
		class="container-fluid text-left p-3 my-3 bg-primary text-white fixed-bottom">
		<div>studio srl - P.Iva 386135891892 - Via degli arroni 16 Terni
			(TR)- Tel 0744 568392</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

</body>

</html>











