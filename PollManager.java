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
}