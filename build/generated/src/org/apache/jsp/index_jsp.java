package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<link rel=\"stylesheet\" href=\"css/home-style.css\">\n");
      out.write("<link rel=\"stylesheet\"\n");
      out.write("\thref=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("<script src='https://kit.fontawesome.com/a076d05399.js'></script>\n");
      out.write("</head>\n");
      out.write("<!--Header-->\n");
      out.write("<br>\n");
      out.write("<div class=\"topnav sticky\">\n");
      out.write("\t");

	String email = session.getAttribute("email").toString();
	
      out.write("\n");
      out.write("\t<center>\n");
      out.write("\t\t<h2>Online shopping (BTech Days)</h2>\n");
      out.write("\t</center>\n");
      out.write("\t<h2>\n");
      out.write("\t\t<a href=\"\">");
      out.print(email);
      out.write(" <i class='fas fa-user-alt'></i></a>\n");
      out.write("\t</h2>\n");
      out.write("\t<a href=\"home.jsp\">Home<i class=\"fa fa-institution\"></i></a>\n");
      out.write("\t <a href=\"myCart.jsp\">MyCart<i class='fas fa-cart-arrow-down'></i></a> \n");
      out.write("\t <a href=\"\">My Orders <i class='fab fa-elementor'></i></a> \n");
      out.write("\t<a href=\"\">ChangeDetails <i class=\"fa fa-edit\"></i></a> \n");
      out.write("\t<a href=\"\">Message Us <i class='fas fa-comment-alt'></i></a> \n");
      out.write("\t<a href=\"\">About <i class=\"fa fa-address-book\"></i></a>\n");
      out.write("\t <a href=\"logout.jsp\">Logout <i class='fas fa-share-square'></i></a>\n");
      out.write("\t<div class=\"search-container\">\n");
      out.write("\t\t<form action=\"searchHome.jsp\" method=\"post\">\n");
      out.write("\t\t\t<input type=\"text\" placeholder=\"search\" name=\"search\">\n");
      out.write("\t\t\t<button type=\"submit\" class=\"fa fa-search\"></button>\n");
      out.write("\t\t</form>\n");
      out.write("\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("<br>\n");
      out.write("<!--table-->");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
