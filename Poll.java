enum PollStatus {
  created,
  running,
  released
}

public class Poll {
  private String name;
  private String question;
  private String[] choices;
  private int[] votes;
  private PollStatus status;

}