<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="post" name="searchEmpire" action="searchEmpire">
    <h1>Birodalom keresese</h1>
    Birodalom neve:<br>
    
    <input type="text" name="name"><br>

    Birodalom leirasa:
    <input type="text" name="desc"><br>
    
    Birodalom asvanykincse:
    <input type="text" name="naturalasset"><br>
    
    Birodalom asvanykincs minimalis mennyisege:
    <input type="text" name="quantity"><br>
    
    Birodalomban levo epulet neve
    <input type="text" name="buildingname"><br>
    
    <input type="submit" value="Kereses">
</form>
