package report;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ReportGenerator {

    public static void main(String[]args) {
        String path="C:\\Users\\Jorgelinda\\Desktop\\UCBRepositorios\\repo\\restItem\\build\\reports\\cucumber\\";

        File reportOutPut= new File(path+"finalReportAPI");
        List<String> jsonFiles = new ArrayList<>();
        jsonFiles.add(path+"report.json");

        Configuration configuration =  new Configuration(reportOutPut,"UCB Diplomado");
        configuration.setBuildNumber("v1.0");
        configuration.addClassifications("SO","Windows");
        configuration.addClassifications("Owner","Grecia");
        configuration.addClassifications("Branch","origin");
        configuration.addClassifications("Type Report","Local");

        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles,configuration);
        reportBuilder.generateReports();
    }
}
