
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "EditarServlet", urlPatterns = {"/editar"})
public class EditarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        
            response.setContentType("text/html;charset=UTF-8");
            
            Integer id = Integer.valueOf(request.getParameter("id"));
            
            Connection conn = Utilidades.Conexion.getConnection();
            
            String sql;
            sql = "SELECT * FROM clientes.clientes WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();        

            if (rs.next()) {
                Cliente cliente = new Cliente();
                
                cliente.setNombre(rs.getString("nombre"));
                cliente.setActivo(rs.getBoolean("activo"));
                cliente.setApellido(rs.getString("apellido"));
                cliente.setFecha_nac(rs.getDate("fecha_nac"));
                cliente.setNacionalidad(new Nacionalidad(rs.getInt("nacionalidad_id"), conn));
                
                request.setAttribute("cliente", cliente);
                
                request.setAttribute("title", "Editar cliente " + cliente.toString());
            }
            
            List<Nacionalidad> nacionalidades = Nacionalidad.all(conn);
            
            request.setAttribute("nacionalidades", nacionalidades);
            
            pstmt.close();
            conn.close();
            
            request.getRequestDispatcher("WEB-INF/jsp/editar.jsp").forward(request, response);
            
        } catch (NamingException | SQLException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
}
