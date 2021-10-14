import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Poll implements Serializable{

  private String name;
  private String question;
  private String[] choices;
  private int[] votes;
  private PollStatus status;
  private Map<String, Integer> participant = new HashMap<>();
  private Date releaseDate;

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
    String[] choices = Arrays.copyOf(this.choices, this.choices.length);
    return choices;
  }

  public int[] getVotes() {
    int[] votes = Arrays.copyOf(this.votes, this.votes.length);
    return votes;
  }

  public PollStatus getStatus() {
    return status;
  }

  public Date getReleaseDate() {
    Date date = new Date(this.releaseDate.getTime());
    return date;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setQuestion(String question) {
    this.question = question;
  }

  public void setChoices(String[] choices) {
    this.choices = Arrays.copyOf(choices, choices.length);
  }

  public void clearVotes() {
    for (int i = 0; i < this.votes.length; ++i) {
      this.votes[i] = 0;
    }
  }

  public void setVotes(int choice) {
    this.votes[choice]++;
  }

  public void setVotes() {
    this.votes = new int[this.choices.length];
  }

  public void setStatus(PollStatus status) {
    this.status = status;
  }

  public void setReleasedDate(Date date) {
    this.releaseDate = new Date(date.getTime());
  }

  public void vote(String participant, int choice) {
    this.participant.put(participant, choice);
    this.votes[choice]++;
  }

}