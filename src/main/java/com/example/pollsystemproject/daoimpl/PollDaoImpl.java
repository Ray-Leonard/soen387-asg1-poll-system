package com.example.pollsystemproject.daoimpl;
import com.example.pollsystemproject.dao.PollDAO;
import com.example.pollsystemproject.db.DBConnection;
import com.example.pollsystemproject.Poll;



import java.sql.*;
import java.util.HashSet;
import java.util.Set;

public class PollDaoImpl implements PollDAO{
    @Override
    public Poll getPoll(String poll_id) throws SQLException {
        // DB connection
        Connection connection = DBConnection.getConnection();

        try {

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM polls WHERE poll_id=" + poll_id);
            ResultSet rs_choice = stmt.executeQuery("SELECT * FROM choices WHERE poll_id=" + poll_id);
            if(rs.next())
            {
                return extractPollFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch(SQLException e){
                e.printStackTrace();
            }
        }

        return null;
    }

    @Override
    public Set<Poll> getAllPoll(int user_id) {
        return null;
    }

    @Override
    public boolean insertPoll(Poll poll) {
        return false;
    }

    @Override
    public boolean updatePoll(Poll poll) {
        return false;
    }

    @Override
    public boolean deletePoll(String poll_id) {
        return false;
    }

    @Override
    public boolean check(String poll_id, String pin_id) {
        return false;
    }
    private Poll extractPollFromResultSet(ResultSet rs) throws SQLException {

        Poll p = new Poll();
        p.setId( rs.getString("poll_id") );
        p.setTitle( rs.getString("title") );
        p.setQuestion( rs.getString("question") );
        String status = rs.getString("poll_status");
        Poll.status st = Poll.status.valueOf(status);
        p.setPoll_status(st);




        return p;
    }
}
