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
    .botones{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .edit{
        margin-right: 10px;
    }
    </style>
</head>
<body>
    <div class="container">
        <h1>Save (on) Travels</h1>
        <h3>Keeping track of expenses!</h3>
        <div class="main-show">
            <table class="table table-borderless">
                <tr>
                    <th>Expense</th>
                    <th>Vendor</th>
                    <th>Amount</th>
                    <th> </th>
                </tr>
                <c:forEach var = "expense" items = "${expenses}">
                    <tr>
                        <td><c:out value = "${expense.name}"></c:out></td>
                        <td><c:out value = "${expense.vendor}"></c:out></td>
                        <td><p>$<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2"><c:out value = "${expense.amount}"/></fmt:formatNumber></p></td>
                        <td class = "botones">
                            <a class = "edit btn btn-sm btn-light btn-outline-dark" href="/edit/${expense.id}">Edit</a>
                            <form action="/delete/${expense.id}" method = "POST">
                                <input type="hidden" name = "_method" value = "delete">
                                <input class = "btn btn-sm btn-light btn-outline-dark" type="submit" value = "Delete">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="main-form">
<%--            <form:form action="/handleit" method="post" modelAttribute="expense">--%>
<%--                <div class = "mb-3">--%>
<%--                    <form:label class = "form-label" path="name">Name</form:label>--%>
<%--                    <form:errors path="name"/>--%>
<%--                    <form:input path="name"/>--%>
<%--                </div>--%>
<%--                <div class = "mb-3">--%>
<%--                    <form:label class = "form-label" path="vendor">Vendor</form:label>--%>
<%--                    <form:errors path="vendor"/>--%>
<%--                    <form:input path="vendor"/>--%>
<%--                </div>--%>
<%--                <div class = "mb-3">--%>
<%--                    <form:label class = "form-label" path="amount">Amount</form:label>--%>
<%--                    <form:errors path="amount"/>--%>
<%--                    <form:input type = "double" path="amount"/>--%>
<%--                </div>--%>
<%--                <div class = "mb-3">--%>
<%--                    <form:label class = "form-label" path="description">Description</form:label>--%>
<%--                    <form:errors path="description"/>--%>
<%--                    <form:textarea path="description"/>--%>
<%--                </div>--%>
<%--                <input type="submit" value="Submit"/>--%>
<%--            </form:form>--%>

            <form:form action = "/handleit" method = "POST" modelAttribute = "expense">
            <%-- without "form:form" syntax, validation messages will not appear. --%>
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input required = "true" type="text" class="form-control" name="name">
                    <p style = "color: red"><form:errors path = "name"/></p>
                </div>
                <div class="mb-3">
                    <label for="vendor" class="form-label">Vendor</label>
                    <input required = "true" type="text" class="form-control" name="vendor">
                    <p style = "color: red"><form:errors path = "vendor"/></p>
                </div>
                <div class="mb-3">
                    <label for="amount" class="form-label">Amount</label>
                    <input required = "true" type="number" class="form-control" name="amount">
                    <p style = "color: red"><form:errors path = "amount"/></p>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea required = "true" class="form-control" name = "description"></textarea>
                    <p style = "color: red"><form:errors path = "description"/></p>
                </div>
                <button type="submit" class="btn btn-dark btn-outline-light">Submit</button>
            </form:form>
        </div>
    </div>
</body>
</html>

