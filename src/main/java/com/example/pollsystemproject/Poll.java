package com.example.pollsystemproject;


//import javax.persistence.criteria.CriteriaBuilder;
import java.io.PrintWriter;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Enumeration;
import java.util.Hashtable;
import java.security.SecureRandom;




public class Poll  implements Serializable {
    private String id;
    private String title;
    private String question;
    private status poll_status;
    private String[] choice;
    private Hashtable<String,String> vote;
    private LocalDateTime releaseDate;

    public enum status{
        created,running,released
    }

    public Poll(){
        vote = new Hashtable<>();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public char getRandomChar(String str) {
        SecureRandom rand = new SecureRandom();
        return str.charAt(rand.nextInt(str.length()));
    }

    public void genId() {
        final String letterStr = "ABCDEFGHJKMNPQRSTVWXYZ";
        final String numStr = "0123456789";
        String[] choices = {letterStr, numStr};
        String newId = "";
        for(int i = 0; i < 10; i++) {
            SecureRandom rand = new SecureRandom();
            int strIdx = rand.nextInt(2);
            newId += getRandomChar(choices[strIdx]);
        }
        this.id = newId;
    }
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public status getPoll_status() {
        return poll_status;
    }

    public void setPoll_status(status poll_status) {
        this.poll_status = poll_status;
    }

    public String[] getChoice() {

        return choice;
    }

    public void setChoice(String[] choice) {
        this.choice = choice;
    }

    public Hashtable<String, String> getVote() {
        return vote;
    }

    public void setVote(Hashtable<String, String> vote) {
        this.vote = vote;
    }

    public LocalDateTime getReleaseDate() {
        LocalDateTime date = this.releaseDate;
        return date;
    }

    public void setReleaseDate(LocalDateTime date) {
        this.releaseDate = date;
    }

    public void create_Poll(String title, String question, String[] choice) throws Exception {
        if(this.getPoll_status()==null){
            this.setTitle(title);
            this.setQuestion(question);
            this.setPoll_status(status.created);
            this.setChoice(choice);
            this.genId();
        }else {
            throw new Exception("<h3>Error! You already created one poll!</h3>");
        }


    }
    public void update_Poll(String title, String question, String[] choice) throws Exception {
        if(this.getPoll_status()== Poll.status.created || this.getPoll_status()== Poll.status.running){
            this.setTitle(title);
            this.setQuestion(question);
            this.setChoice(choice);
            this.setPoll_status(status.created);
        }else {
            throw new Exception("<h3>Error! Your poll status is not created or running!</h3>");
        }

    }

    public void clear_Poll() throws Exception {
        if(this.getPoll_status()== Poll.status.released || this.getPoll_status()== Poll.status.running )
        {
            this.setVote(new Hashtable<String,String>());
            if(this.poll_status == status.released){
                this.setPoll_status(status.created);
            }
        }else {
            throw new Exception("<h3>Error! Your poll status is not released or running!</h3>");
        }

    }

    public void close_Poll() throws Exception {
        if(this.getPoll_status()== Poll.status.released)
        {
            this.setTitle(null);
            this.setQuestion(null);
            this.setChoice(null);
            this.setPoll_status(null);
        }else {
            throw new Exception("<h3>Error! Your poll status is not released!</h3>");
        }
    }
    public void run_Poll() throws Exception {
        if(this.getPoll_status()== Poll.status.created)
        {
            this.setPoll_status(status.running);
        }else {
            throw new Exception("<h3>Error! You can only run a poll when its state is \"created\"</h3>");
        }


    }
    public void release_Poll() throws Exception {
        if(this.getPoll_status()== Poll.status.running)
        {
            LocalDateTime ldt = LocalDateTime.now();
            this.setReleaseDate(ldt);
            this.setPoll_status(status.released);
        }else{
            throw new Exception("<h3>Error! Your poll status is not running!</h3>");
        }

    }
    public void unrelease_Poll() throws Exception {
        if(this.getPoll_status()== Poll.status.released)
        {
            this.setPoll_status(status.running);
        }else {
            throw new Exception("<h3>Error! Your poll status is not released!</h3>");
        }

    }
    public void vote(String id, String choice) throws Exception {
        if(this.getPoll_status()== status.running){
            Hashtable<String,String> newHash = this.getVote();
            newHash.put(id, choice);
            this.setVote(newHash);
        }else {
            throw new Exception("<h3>Error! Your poll status is not running!</h3>");
        }

    }
    public Hashtable<String, Integer> get_Poll_Result(){
        Hashtable<String, Integer> result = new Hashtable<>();
        String[] choices = this.getChoice();
        for(int i =0; i<choices.length;i++){
            result.put(choices[i],0);
        }
        Hashtable<String,String> votes = this.getVote();
        Enumeration<String> keys = votes.keys();
        while(keys.hasMoreElements()){
            String key = keys.nextElement();
           if(result.containsKey(votes.get(key))){
               int count = result.get(votes.get(key));
               result.put(votes.get(key), count + 1);
           }
        }
        return result;
    }
    public String download_Poll_Details(PrintWriter output, String filename)  {
        LocalDateTime date = this.getReleaseDate();
        String question = this.getQuestion();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String formattedDate = date.format(dtf);
        filename = filename + "-" + formattedDate + ".txt";

        Hashtable<String, Integer> votes = this.get_Poll_Result();
        output.write("Filename: " + filename);
        output.write("\n");
        output.write("Question: " + question);
        output.write("\n");
        Enumeration<String> keys = votes.keys();
        int count = 0;
        while(keys.hasMoreElements()){
            String key = keys.nextElement();
            output.write("Choice[" + count + "]: " + key + " has " + votes.get(key) + " votes\n");
            count++;
        }
        return filename;

    }

}


