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

  public Poll(String name, String question, String[] choices) {
    this.name = name;
    this.question = question;
    this.choices = Arrays.copyOf(choices, choices.length);
    this.votes = new int[choices.length];
    this.status = PollStatus.created;
  }

  public String getName() {
    return name;
  }

  public String getQuestion() {
    return question;
  }

  public String[] getChoices() {
    String[] choices = Arrays.copyOf(this.choices, this.choices.length)
    return choices;
  }

  public int[] getVotes() {
    int[] votes = Arrays.copyOf(this.votes, this.votes.length);
    return votes;
  }

  public PollStatus getStatus() {
    return status;
  }

  public void setName(name) {
    this.name = name;
  }

  public void setQuestion(question) {
    this.question = question;
  }

  public void setChoices(String[] choices) {
    this.choices = Arrays.copyOf(choices, choices.length);
  }

  public void setVotes(int idx, int num) {
    this.votes[idx] = num;
  }

}