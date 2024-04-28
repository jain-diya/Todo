import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/save")
public class Xyz extends HttpServlet {
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	
	try {
		//title ,content fetch
		
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		Note note= new Note(title, content, new Date());
       
		
		System.out.println(note.getId()+" : "+note.getTitle());
		
		//hibernate : save()
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		s.save(note);
		
		tx.commit();
		s.close();
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		out.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
		out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h1>");
	} catch (Exception e) {
		e.printStackTrace();
		
	}
	
}
}
