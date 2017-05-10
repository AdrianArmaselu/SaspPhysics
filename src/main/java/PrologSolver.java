import org.jpl7.Query;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.stream.Stream;

public class PrologSolver {

    private static final String SASP_FOLDER = "src/main/prolog";
    private static final String SASP_FILE = "MotionQueries.pl";
    private static final String PARSER_FILE = "src/main/prolog/ExpressionParser.pl";

    public PrologSolver() {
        loadParser();
    }

    void solve(){
        String saspOutput = executeSasp();
        System.out.println(saspOutput);
        Query query = new Query(String.format("compute(%s, X)", saspOutput.substring(saspOutput.indexOf("X = ") + "X = ".length())));
        printSolutions(query);
    }

    private void loadParser() {
        String consultFilePredicate = String.format("consult('%s')", PARSER_FILE);
        Query query = new Query(consultFilePredicate);
        query.hasSolution(); // this jpl library is so silly, if I do not execute something like this, then I cannot run queries against the parser
    }

    private String executeSasp() {
        String executeSaspFileCommand = String.format("sasp %s", SASP_FILE);
        return executeCommand(executeSaspFileCommand);
    }

    private String executeCommand(String command) {
        BufferedReader reader = null;
        try {
            StringBuilder output = new StringBuilder();
            Process p = Runtime.getRuntime().exec(command, null, new File(SASP_FOLDER));
            p.waitFor();
            reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                output.append(line).append("\n");
            }
            return output.toString();

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            Util.closeResource(reader);
        }
        return "";
    }

    private void printSolutions(Query query){
        Stream.of(query.allSolutions()).forEach(System.out::println);
    }

    public static void main(String[] args) {
        PrologSolver executor = new PrologSolver();
        executor.solve();
    }
}
