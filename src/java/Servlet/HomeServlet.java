/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author universidad
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        
            response.setContentType("text/html;charset=UTF-8");
            
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/clientes_db");
            Connection conn = ds.getConnection();
            
            String sql = "SELECT * FROM clientes_db.clientes";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            List <HashMap<String, Object>> resultado = new LinkedList();
            
                while(rs.next()){
                    HashMap row = new HashMap();
                    row.put("nombre", rs.getInt("id"));
                    row.put("nombre", rs.getString("nombre"));
                    row.put("apellido", rs.getString("apellido"));
                    row.put("fecha_nac", rs.getDate("fecha_nac"));
                    row.put("activo", rs.getString("activo"));
                    resultado.add(row);
                }
            
            request.setAttribute("resultado", resultado);
            
            String title = null;

            request.setAttribute("Listado de clientes", title);

            request.getRequestDispatcher("WEB-INF/jsp/home.jsp").forward(request, response);
            
        } catch (NamingException | SQLException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(level.SEVERE, null, ex);
        }
    }
}
