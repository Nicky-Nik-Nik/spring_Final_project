<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <fmt:setLocale value="${sessionScope.lang}"/>
    <fmt:setBundle basename="locale.locale"/>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>" type="text/css"/>
    <script src="<c:url value="/js/open_tab.js"/>"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
          crossorigin="anonymous">

    <title><fmt:message key="admin.title"/></title>
</head>
<body>
<jsp:include page="support/header.jsp"/>
<div class="tab">
    <button class="tablinks" onclick="openTab(event, 'Users')"><fmt:message key="admin.users"/></button>
    <button class="tablinks" onclick="openTab(event, 'Lots')"><fmt:message key="admin.lots"/></button>
</div>
<div id="Users" class="tabcontent">
    <table>
        <tr>
            <th><fmt:message key="admin.id"/></th>
            <th><fmt:message key="admin.name"/></th>
            <th><fmt:message key="admin.mail"/></th>
            <th><fmt:message key="admin.balance"/>, &dollar;</th>
            <th><fmt:message key="admin.role"/></th>
            <th><fmt:message key="admin.ban-unban"/></th>
        </tr>
        <c:forEach var="user" items="${requestScope.user_list}">
            <tr>
                <td>
                    <a href="/user/${user.id}">${user.id}</a>
                </td>
                <td>${user.name}</td>
                <td>${user.mail}</td>
                <td>${user.balance}</td>
                <td><fmt:message key="${user.userRole}"/></td>
                <td>
                    <c:if test="${user.id ne sessionScope.user.id}">
                        <c:choose>
                            <c:when test="${user.banned}"><a
                                    href="/unban/${user.id}?user_active_page=${user_active_page}&lot_active_page=${lot_active_page}"><fmt:message
                                    key="admin.unban"/></a>
                            </c:when>
                            <c:otherwise>
                                <a href="/ban/${user.id}?user_active_page=${user_active_page}&lot_active_page=${lot_active_page}"><fmt:message
                                        key="admin.ban"/></a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
    <nav aria-label="Navigation for countries">
        <c:if test="${user_page_amount > 1}">
            <ul class="pagination">
                <c:if test="${user_active_page != 1}">
                    <li class="page-item"><a class="page-link"
                                             href="/admin?user_active_page=${user_active_page-1}&lot_active_page=${lot_active_page}"><fmt:message
                            key="paging.previous"/></a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${user_page_amount}" var="i">
                    <c:choose>
                        <c:when test="${user_active_page eq i}">
                            <li class="page-item active"><a class="page-link">
                                    ${i} <span class="sr-only">(current)</span></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link"
                                                     href="admin?user_active_page=${i}&lot_active_page=${lot_active_page}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${user_active_page lt user_page_amount}">
                    <li class="page-item"><a class="page-link"
                                             href="admin?user_active_page=${user_active_page + 1}&lot_active_page=${lot_active_page}"><fmt:message
                            key="paging.next"/></a>
                    </li>
                </c:if>
            </ul>
        </c:if>
    </nav>
</div>

<div id="Lots" class="tabcontent">
    <table>
        <tr>
            <th><fmt:message key="admin.id"/></th>
            <th><fmt:message key="admin.name"/></th>
            <th><fmt:message key="admin.start_time"/></th>
            <th><fmt:message key="admin.finish_time"/></th>
            <th><fmt:message key="admin.current_bid"/></th>
            <th><fmt:message key="admin.seller_id"/></th>
            <th><fmt:message key="admin.buyer_id"/></th>
        </tr>
        <c:forEach var="lot" items="${requestScope.lot_list}">
            <tr>
                <td>
                    <a href="/lot/${lot.id}">${lot.id}</a>
                </td>
                <td>${lot.name}</td>
                <td>${lot.startTime}</td>
                <td>${lot.finishTime}</td>
                <td>${lot.currentCost}</td>
                <td><a href="/user/${lot.seller.id}">
                        ${lot.seller.id}</a></td>
                <td><c:choose>
                    <c:when test="${lot.buyer eq null}">
                        ---
                    </c:when>
                    <c:otherwise>
                        <a href="/user/${lot.buyer.id}">${lot.buyer.id}</a>
                    </c:otherwise>
                </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
    <nav aria-label="Navigation for countries">
        <c:if test="${lot_page_amount > 1}">
            <ul class="pagination">
                <c:if test="${lot_active_page != 1}">
                    <li class="page-item"><a class="page-link"
                                             href="admin?user_active_page=${user_active_page}&lot_active_page=${lot_active_page - 1}"><fmt:message
                            key="paging.previous"/></a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${lot_page_amount}" var="i">
                    <c:choose>
                        <c:when test="${lot_active_page eq i}">
                            <li class="page-item active"><a class="page-link">
                                    ${i} <span class="sr-only">(current)</span></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link"
                                                     href="admin?user_active_page=${user_active_page}&lot_active_page=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${lot_active_page lt lot_page_amount}">
                    <li class="page-item"><a class="page-link"
                                             href="admin?user_active_page=${user_active_page}&lot_active_page=${lot_active_page + 1}"><fmt:message
                            key="paging.next"/></a>
                    </li>
                </c:if>
            </ul>
        </c:if>
    </nav>
</div>
</body>
</html>
