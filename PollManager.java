import java.io.File;

public class PollManager {

  private Poll poll;

  public void CreatePoll(String name, String question, String[] choices) {
    poll = new Poll(name, question, choices);
  }

  public void UpdatePoll(String name, String question, String[] choices) {
    poll.setName(name);
    poll.setQuestion(question);
    poll.setChoices(choices);
    poll.setVotes();
    poll.setStatus(PollStatus.created);
  }

  public void ClearPoll() {
    poll.setVotes();
    if(poll.getStatus().equals(PollStatus.released)) {
      poll.setStatus(PollStatus.created);
    }
  }

  public void ClosePoll() {
    if(poll.getStatus().equals(PollStatus.released)) {
      poll = null;
    }
  }

  public void RunPoll() {
    if(poll.getStatus().equals(PollStatus.created)) {
      poll.setStatus(PollStatus.running);
    }
  }

  public void ReleasePoll() {
    if(poll.getStatus().equals(PollStatus.running)) {
      poll.setStatus(PollStatus.released);
    }
  }

  public void UnreleasePoll() {
    if(poll.getStatus().equals(PollStatus.released)) {
      poll.setStatus(PollStatus.running);
    }
  }

  public void Vote(String participant, int choice) {
    if(poll.getStatus().equals(PollStatus.running)) {
      poll.setVotes(choice);
    }
  }
}