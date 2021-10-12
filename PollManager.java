import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Hashtable;
import java.util.Date;

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
    poll.clearVotes();
    if (poll.getStatus().equals(PollStatus.released)) {
      poll.setStatus(PollStatus.created);
    }
  }

  public void ClosePoll() {
    if (poll.getStatus().equals(PollStatus.released)) {
      poll = null;
    }
  }

  public void RunPoll() {
    if (poll.getStatus().equals(PollStatus.created)) {
      poll.setStatus(PollStatus.running);
    }
  }

  public void ReleasePoll() {
    if (poll.getStatus().equals(PollStatus.running)) {
      poll.setStatus(PollStatus.released);
      poll.setReleasedDate(new Date());
    }
  }

  public void UnreleasePoll() {
    if (poll.getStatus().equals(PollStatus.released)) {
      poll.setStatus(PollStatus.running);
    }
  }

  public void Vote(String participant, int choice) {
    if (poll.getStatus().equals(PollStatus.running)) {
      poll.vote(participant, choice);
    }
  }

  public Hashtable<String, Integer> GetPollResults() {
    Hashtable<String, Integer> results = new Hashtable<>();
    for (int i = 0; i < poll.getChoices().length; ++i) {
      results.put(poll.getChoices()[i], poll.getVotes()[i]);
    }
    return results;
  }

  public void DownloadPollDetails(PrintWriter output, String filename) {
    if (poll.getStatus().equals(PollStatus.released)) {
      String pollname = poll.getName();
      String question = poll.getQuestion();
      String[] choices = poll.getChoices();
      int[] votes = poll.getVotes();
      Date date = new Date(poll.getReleaseDate().getTime());
      String pattern = "dd/MM/yyyy";
      DateFormat df = new SimpleDateFormat(pattern);
      filename = pollname + "-" + df.format(date);
      try {
        File file = new File(filename);
        file.createNewFile();
        output = new PrintWriter(file);
        output.println(pollname);
        output.println(question);
        for (int i = 0; i < choices.length; ++i) {
          if (i != choices.length - 1) {
            output.print("\t" + choices[i] + "," + votes[i]);
          } else {
            output.print("\t" + choices[i] + "," + votes[i] + "\r\n");
          }
        }
      } catch (Exception e) {
        System.out.println("failed to create result file");
      }
    }
  }

}