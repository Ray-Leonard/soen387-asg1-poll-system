public class PollManager {

  private Poll poll;

  public void CreatePoll(String name, String question, String[] choices) {
    poll = new Poll(name, question, choices);
  }

  public void UpdatePoll(String name, String question, String[] choices) {
    
  }
}