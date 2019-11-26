<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="post" name="editEmpire" action="editEmpire">
    <h1>Alapadatok</h1>
    Birodalom neve<br>
    <input type="hidden" name="id" value="${editEmpire.id}">
    
    <input type="text" name="name" value="${editEmpire.name}"><br>

    Birodalom leirasa
    <input type="text" name="desc" value="${editEmpire.description}"><br>
    
    <input type="submit" value="Mentes">
</form>