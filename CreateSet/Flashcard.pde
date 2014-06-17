class Flashcard {
  
  String term, definition;

  public Flashcard() {
    term = "";
    definition = "";
  }

  public Flashcard(String t, String d) {
    term = t;
    definition = d;
  }
  
  String getTerm() {
    return term;
  }

  String getDefinition() {
    return definition;
  }

  String setTerm(String newTerm) {
    String oldTerm = term;
    term = newTerm;
    return oldTerm;
  }

  String setDefinition(String newDefinition) {
    String oldDefinition = definition;
    definition = newDefinition;
    return oldDefinition;
  }

  String toString() {
    return term + " - " + definition;
  }
}
