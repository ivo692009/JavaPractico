<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout.jsp"></jsp:include>
    <body>
        <div class="row">
            <div class="col-xs-offset-3 col-xs-6 ">
                <table class="table table-responsive table-striped table-hover table-condensed">
                    <thead>
                        <h3>Clientes</h3>
                    </thead>
                    <tbody>
                        <tr>
                            <th>
                                Nombre
                            </th>
                            <th>
                                Apellido
                            </th>
                            <th>
                                Edad
                            </th>
                            <th>
                                Acciones
                            </th>
                        </tr>
                        <tr>
                            <c:forEach var="cliente" items="${resultado}">
                                <td>
                                    ${cliente.nombre}
                                </td>
                                <td>
                                    ${cliente.apellido}
                                </td>
                                <td>
                                    ${cliente.fecha_nac}
                                </td>
                            </c:forEach>
                            <td>
                                <div class="btn-group">
                                    <button class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                    <button class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Editar</button>
                                    <button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Eliminar</button>
                                </div>                                    
                            </td>
                        </tr>
                    </tbody>
                </table>
                <hr>
                <a class="btn btn-success pull-right" href="/CrudValde/nuevo"><span class="glyphicon glyphicon-plus"></span> Nuevo cliente</a>
            </div>
        </div>
    </body>
</html>
