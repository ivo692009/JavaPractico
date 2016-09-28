<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout.jsp"></jsp:include>
    <body>
        <div class="col-xs-offset-3 col-xs-6">
            <legend>Ver cliente</legend>
            <form class="form form-horizontal" method="POST" action="/JavaPractico/nuevo">
                <div class="form-group">
                    <label class="col-xs-4 control-label" for="nombre"><b>Nombre:</b></label>
                    <div class="col-xs-8">
                        <input type="text" value="<c:out value="${cliente.nombre}"/>" id="nombre" name="nombre" class="form-control" placeholder="Nombre" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label" for="apellido"><b>Apellido:</b></label>
                    <div class="col-xs-8">
                        <input type="text" value="${cliente.apellido}" id="apellido" name="apellido" class="form-control" placeholder="Apellido">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label" for="fecha_nac"><b>Fecha de nacimiento:</b></label>
                    <div class="col-xs-8">
                        <input type="date" value="${cliente.fecha_nac}" id="fecha_nac" name="fecha_nac" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="nacionalidad" class="col-xs-4 control-label">Nacionalidad:</label>
                    <div class="col-xs-8">
                        <select class="form-control" id="nacionalidad" name="nacionalidad">
                            <c:forEach items="${nacionalidades}" var="nacionalidad">
                                <c:if test="${nacionalidad.id == cliente.nacionalidad.id}">
                                    <option value="${nacionalidad.id}" selected>${nacionalidad.nacionalidad}</option>
                                </c:if>
                                 <c:if test="${nacionalidad.id != cliente.nacionalidad.id}">
                                    <option value="${nacionalidad.id}">${nacionalidad.nacionalidad}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-4 control-label" for="activo"><b>Activo:</b></label>
                    <div class="col-xs-8">
                        <c:if test="${cliente.activo}">
                            <input type="radio" id="activo" name="activo" value="${cliente.activo}" checked> Si<br>
                            <input type="radio" id="activo" name="activo" value="${cliente.activo}"> No<br>
                        </c:if>
                        <c:if test="${!cliente.activo}">
                            <input type="radio" id="activo" name="activo" value="${cliente.activo}"> Si<br>
                            <input type="radio" id="activo" name="activo" value="${cliente.activo}" checked> No<br>
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-offset-4 col-xs-8">
                        <a class="btn btn-primary" href="/JavaPracticoe/home">
                            <span class="glyphicon glyphicon-chevron-left"></span> Volver al listado
                        </a>
                        <button type="submit" class="btn btn-success pull-right">
                            Modificar <span class="glyphicon glyphicon-edit"></span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
