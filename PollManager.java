import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Hashtable;
import java.util.Date;

public class PollManager {

  private Poll poll = null;

  public void CreatePoll(String name, String question, String[] choices) throws Exception {
    if (poll != null) {
      throw new Exception("There is already an active poll.");
    } else {
      poll = new Poll(name, question, choices);
    }
  }

  public void UpdatePoll(String name, String question, String[] choices) throws Exception {
    if (poll != null && (poll.getStatus().equals(PollStatus.created) || poll.getStatus().equals(PollStatus.running))) {
      poll.setName(name);
      poll.setQuestion(question);
      poll.setChoices(choices);
      poll.setVotes();
      poll.setStatus(PollStatus.created);
    } else {
      throw new Exception("Poll is not in created or running status.");
    }
  }

  public void ClearPoll() throws Exception {
    if (poll != null && (poll.getStatus().equals(PollStatus.running) || poll.getStatus().equals(PollStatus.released))) {
      poll.clearVotes();
      if (poll.getStatus().equals(PollStatus.released)) {
        poll.setStatus(PollStatus.created);
      }
    } else {
      throw new Exception("Poll is not running or released.");
    }
  }

  public void ClosePoll() throws Exception {
    if (poll != null && poll.getStatus().equals(PollStatus.released)) {
      poll = null;
    } else {
      throw new Exception("Poll is not in released status.");
    }
  }

  public void RunPoll() throws Exception {
    if (poll != null && poll.getStatus().equals(PollStatus.created)) {
      poll.setStatus(PollStatus.running);
    } else {
      throw new Exception("Poll is not in created status.");
    }
  }

  public void ReleasePoll() throws Exception {
    if (poll != null && poll.getStatus().equals(PollStatus.running)) {
      poll.setStatus(PollStatus.released);
      poll.setReleasedDate(new Date());
    } else {
      throw new Exception("Poll is not in running status.");
    }
  }

  public void UnreleasePoll() throws Exception {
    if (poll != null && poll.getStatus().equals(PollStatus.released)) {
      poll.setStatus(PollStatus.running);
    } else {
      throw new Exception("Poll is not in released status.");
    }
  }

  public void Vote(String participant, int choice) throws Exception {
    if (poll != null && poll.getStatus().equals(PollStatus.running)) {
      poll.vote(participant, choice);
    } else {
      throw new Exception("Poll is not in running status");
    }
  }

  public Hashtable<String, Integer> GetPollResults() throws Exception {
    if (poll != null && poll.getStatus().equals(PollStatus.released)) {
      Hashtable<String, Integer> results = new Hashtable<>();
      for (int i = 0; i < poll.getChoices().length; ++i) {
        results.put(poll.getChoices()[i], poll.getVotes()[i]);
      }
      return results;
    } else {
      throw new Exception("Poll is not in released status");
    }
  }

  public void DownloadPollDetails(PrintWriter output, String filename) throws Exception{
    if (poll != null && poll.getStatus().equals(PollStatus.released)) {
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
    } else {
      throw new Exception("Poll is not in released status");
    }
  }

}