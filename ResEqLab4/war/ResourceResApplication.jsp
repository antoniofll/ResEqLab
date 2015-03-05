<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@page isELIgnored="false"%>

<!DOCTYPE html>


<html>
<head>
<title>Resources</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta charset="utf-8">
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"><img
					class="img-responsive" src="images/logo.png"></img></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

					<li><a href="/reservar" data-toggle="modal"
						data-target="#myModal"><span class="glyphicon glyphicon-tasks">
						</span> Reservar</a></li>
					<c:choose>
					<c:when	test="${user == 'admin@example.com'}">
					<li><a href="/create"><span
							class="glyphicon glyphicon-pencil"></span> Crear</a></li>
									</c:when>
					</c:choose>
			
					</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="<c:url value="${url}"/>">
					<c:choose>
					<c:when	test="${user != null}">
					<span class="glyphicon glyphicon-off"> </span></c:when>
					<c:otherwise>
					<span class="glyphicon glyphicon-user">
					</span></c:otherwise>
					</c:choose> <c:out value="${urlLinktext}" /></a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div style="width: 100%;">
		<div class="line"></div>
		<div class="topLine">
			<div style="float: left;" class="headline">Resources</div>
			<div style="float: right;"></div>
		</div>
	</div>

	<div style="clear: both;" />
	You have a total number of
	<c:out value="${fn:length(resources)}" />
	Resources.

	<table>
		<tr>
			<th>Title</th>
			<th>Description</th>

		</tr>

		<c:forEach items="${resources}" var="resource">
			<tr>
				<td><c:out value="${resource.title}" /></td>
				<td><c:out value="${resource.description}" /></td>
									<c:choose>
					<c:when	test="${user == 'admin@example.com'}">
					<td><a class="done"
					href="<c:url value="/remove?id=${resource.id}" />">Remove</a></td>
</c:when>
					</c:choose>

			</tr>
		</c:forEach>
	</table>
	<hr />
	<script src="js/bootstrap.min.js"></script>
</body>
</html>