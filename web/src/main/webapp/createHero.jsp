<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="post" action="createHero">
        <h1>Alapadatok</h1>
        Hos neve<br><input type="text" name="name"> <br>
        Leiras<br><input type="text" name="desc"><br>
        <br>
        <h1>Faji osszetetel</h1>
        <c:forEach var="spc" items="${species}">
            ${spc.name}<br><input type="text" name="${spc.name}" value="0">%<br>
        </c:forEach>
        <br>
        <input type="submit" value="ok" >
</form>