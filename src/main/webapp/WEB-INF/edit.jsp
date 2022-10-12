<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Travel or something</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <style>
        .container{
            padding: 15px 32px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Edit Expense</h1>
            <a href="/">Back</a>
        </div>
        <div class="main">
            <form:form action = "/handledit/${expense.id}" method = "put" modelAttribute = "expense">
                <%-- without "form:form" syntax, validation messages will not appear. --%>
                <input type="hidden" name="_method" value="put">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input required = "true" type="text" class="form-control" name="name" value = "${expense.name}">
                    <p style = "color: red"><form:errors path = "name"/></p>
                </div>
                <div class="mb-3">
                    <label for="vendor" class="form-label">Vendor</label>
                    <input required = "true" type="text" class="form-control" name="vendor" value = "${expense.vendor}">
                    <p style = "color: red"><form:errors path = "vendor"/></p>
                </div>
                <div class="mb-3">
                    <label for="amount" class="form-label">Amount</label>
                    <input required = "true" class="form-control" name="amount" value = "<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2">${expense.amount}</fmt:formatNumber>">
                    <p style = "color: red"><form:errors path = "amount"/></p>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea required = "true" class="form-control" name = "description">${expense.description}</textarea>
                    <p style = "color: red"><form:errors path = "description"/></p>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>
    </div>
</body>
</html>