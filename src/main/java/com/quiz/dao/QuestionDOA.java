package com.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.quiz.model.Question;
import com.quiz.util.DBConnection;

public class QuestionDOA {
    
    public boolean addQuestion(Question q) {
        String insert = "INSERT INTO questions(question_text,option1,option2,option3,option4,correct_answer)"
                + " VALUES (?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(insert)) {

            pst.setString(1, q.getQuestionText());
            pst.setString(2, q.getOptions()[0]);
            pst.setString(3, q.getOptions()[1]);
            pst.setString(4, q.getOptions()[2]);
            pst.setString(5, q.getOptions()[3]);
            pst.setInt(6, q.getCorrectAnswer());

            return  pst.executeUpdate()>0;
        }catch (SQLException e) {
			throw new DataAccessException("Failed to add Question",e);
		} 
    }

    public List<Question> allQuestion(){
        List<Question> list = new ArrayList<>();
        String fetch = "SELECT * FROM questions ORDER BY id DESC";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(fetch)) {

            while (rs.next()) {
                    String[] options = {
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6)
                    };
                    Question q = new Question(rs.getInt(1), rs.getString(2), options, rs.getInt(7));
                    list.add(q);
            }
            return list;
        } catch(SQLException e) {
        		throw new DataAccessException("Failed to fetch all questions", e);
        }
       
    }

    public boolean updateQuestion(Question q) {
        String update = "UPDATE questions "
                + "SET question_text=?, option1=?, option2=?, option3=?, "
                + "option4=?, correct_answer=? WHERE id=?";	
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(update)) {

            pst.setString(1, q.getQuestionText());
            pst.setString(2, q.getOptions()[0]);
            pst.setString(3, q.getOptions()[1]);
            pst.setString(4, q.getOptions()[2]);
            pst.setString(5, q.getOptions()[3]);
            pst.setInt(6, q.getCorrectAnswer());
            pst.setInt(7, q.getId());

           return pst.executeUpdate()>0;
            
        } catch(SQLException e) {
    		throw new DataAccessException("Failed to update a question", e);
    }
    }

    public boolean deleteQuestion(int id) {
        String delete = "DELETE FROM questions WHERE id=?";
        
        String resetSeq =
                "SELECT setval('questions_id_seq', COALESCE((SELECT MAX(id) FROM questions), 0), true)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(delete)) {     

            ps.setInt(1, id);
            int rows= ps.executeUpdate();
            if(rows>0) {
            	try(PreparedStatement ps2 = con.prepareStatement(resetSeq)){
            		ps2.execute();
            	}
            }
            return rows>0;
        } catch(SQLException e) {
    		throw new DataAccessException("Failed to delete question", e);
    }
    }

    public Question getQuestionById(int id) {
        String sql = "SELECT * FROM questions WHERE id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String[] options = {
                    rs.getString("option1"),
                    rs.getString("option2"),
                    rs.getString("option3"),
                    rs.getString("option4")
                };

                return new Question(
                    rs.getInt("id"),
                    rs.getString("question_text"),
                    options,
                    rs.getInt("correct_answer")
                );
            }
            return null;

        } catch (SQLException e) {
            throw new DataAccessException("Failed to get question by ID", e);
        }
    }

    
    public List<Question> getQuestion(int limit) {
        List<Question> list = new ArrayList<>();
        String get = "SELECT * FROM questions ORDER BY RANDOM() LIMIT ?";
        try (Connection con =	 DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(get)) {

            pst.setInt(1, limit);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                
                    String[] options = {
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6)
                    };
                    Question q = new Question(rs.getInt(1), rs.getString(2), options, rs.getInt(7));
                    list.add(q);
               
            }
            return list;
        } catch(SQLException e) {
    		throw new DataAccessException("Failed to fetch questions", e);
    }
        
    }

    public int countQuestions() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM questions";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }
        }  catch(SQLException e) {
    		throw new DataAccessException("Failed to count questions", e);
    }
        return count;
    }
}
