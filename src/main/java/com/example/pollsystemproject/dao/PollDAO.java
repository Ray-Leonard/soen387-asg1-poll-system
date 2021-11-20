package com.example.pollsystemproject.dao;
import com.example.pollsystemproject.Poll;
import java.sql.SQLException;
import java.util.Set;

public interface PollDAO {
    Poll getPoll(String poll_id) throws SQLException;

    Set<Poll> getAllPoll(int user_id);

    boolean insertPoll(Poll poll);

    boolean updatePoll(Poll poll);

    boolean deletePoll(String poll_id);

    boolean check(String poll_id, String pin_id);
}
